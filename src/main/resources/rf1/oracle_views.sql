WHENEVER SQLERROR EXIT -1
SET ECHO ON


-- Session settings.
ALTER SESSION SET NLS_LENGTH_SEMANTICS='CHAR';


-- Define helper procedure to drop views.
BEGIN
    EXECUTE IMMEDIATE 'DROP PROCEDURE drop_view';
EXCEPTION
    WHEN OTHERS THEN
        -- If procedure doesn't exist, it can't be dropped,
        -- so an exception will be thrown.  Ignore it.
        IF SQLCODE != -4043 THEN
            RAISE;
        END IF;
END;
/
CREATE PROCEDURE drop_view (view_name IN VARCHAR2) IS
BEGIN
    EXECUTE IMMEDIATE 'DROP VIEW ' || view_name || ' CASCADE CONSTRAINTS';
EXCEPTION
    -- If view doesn't exist, it can't be dropped,
    -- so an exception will be thrown.  Ignore it.
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/


-- Concepts Preferred Names view, used by other views.
-- DESCRIPTIONSTATUS: 0 = Current 
-- MEMBERSTATUS 1 = Preferred Term
EXECUTE drop_view('conceptspreferredname');
CREATE VIEW conceptspreferredname AS
SELECT c.CONCEPTID, NVL(d.TERM, 'no active preferred term') PREFERREDNAME, d.DESCRIPTIONID
FROM concepts c
LEFT OUTER JOIN descriptions d
ON c.CONCEPTID = d.CONCEPTID
AND d.DESCRIPTIONSTATUS = 0
LEFT OUTER JOIN subsetmembersenus enus 
ON d.DESCRIPTIONID = enus.MEMBERID
AND enus.MEMBERSTATUS = 1
WHERE (enus.MEMBERSTATUS IS NOT null OR d.TERM IS null);


-- Concepts table with names.
-- TODO: Does this view make sense?  There is already a column for FULLYSPECIFIEDNAME.
EXECUTE drop_view('conceptswithname');
CREATE VIEW conceptswithname AS
SELECT c.CONCEPTID, cpn.PREFERREDNAME CONCEPTIDNAME, CONCEPTSTATUS, FULLYSPECIFIEDNAME, CTV3ID, SNOMEDID, ISPRIMITIVE
FROM concepts c, conceptspreferredname cpn
WHERE c.CONCEPTID = cpn.CONCEPTID;


-- Relationships table with names.
EXECUTE drop_view('relationshipswithname');
CREATE VIEW relationshipswithname AS
SELECT RELATIONSHIPID,
    CONCEPTID1, cpn1.PREFERREDNAME CONCEPTID1NAME, 
    RELATIONSHIPTYPE, cpn2.PREFERREDNAME RELATIONSHIPTYPENAME,
    CONCEPTID2, cpn3.PREFERREDNAME CONCEPTID2NAME, 
    CHARACTERISTICTYPE, REFINABILITY, RELATIONSHIPGROUP
FROM relationships r, 
    conceptspreferredname cpn1,
    conceptspreferredname cpn2,
    conceptspreferredname cpn3
WHERE r.CONCEPTID1 = cpn1.CONCEPTID
AND r.RELATIONSHIPTYPE = cpn2.CONCEPTID
AND r.CONCEPTID2 = cpn3.CONCEPTID;


-- Component History table with names.
-- TODO: Will say "no active preferred term" when COMPONENTID is either inactive concept or a description ID.
EXECUTE drop_view('componenthistorywithname');
CREATE VIEW componenthistorywithname AS
SELECT COMPONENTID, cpn.PREFERREDNAME COMPONENTIDNAME,
    RELEASEVERSION, CHANGETYPE, STATUS, REASON
FROM componenthistory
LEFT OUTER JOIN conceptspreferredname cpn ON COMPONENTID = CONCEPTID;


-- References table with names.
-- TODO: Will say "no active preferred term" when COMPONENTID is either inactive concept or a description ID.
-- TODO: Will say "no active preferred term" when REFERENCEDID is either inactive concept or a description ID.
EXECUTE drop_view('referenceswithname');
CREATE VIEW referenceswithname AS
SELECT COMPONENTID, cpn1.PREFERREDNAME COMPONENTIDNAME, 
    REFERENCETYPE,
    REFERENCEDID, cpn2.PREFERREDNAME REFERENCEDIDNAME
FROM references
LEFT OUTER JOIN conceptspreferredname cpn1 ON COMPONENTID = cpn1.CONCEPTID
LEFT OUTER JOIN conceptspreferredname cpn2 ON REFERENCEDID = cpn2.CONCEPTID;


-- No views for CrossMapSets ICD9 table.
-- No views for CrossMapTargets ICD9 table.


-- No more CrossMapSets
-- CrossMaps ICD9 table with names and IDs.
-- EXECUTE drop_view('crossmapsicd9withnameandid');
-- CREATE VIEW crossmapsicd9withnameandid AS
-- SELECT MAPSETID, MAPCONCEPTID, cpn.PREFERREDNAME MAPCONCEPTIDNAME,
--    MAPOPTION, MAPPRIORITY, MAPTARGETID, cmt.TARGETCODES, MAPRULE, MAPADVICE
-- FROM crossmapsicd9 cm,
--    conceptspreferredname cpn,
--    crossmaptargetsicd9 cmt
-- WHERE cm.MAPCONCEPTID = cpn.CONCEPTID
-- AND cm.MAPTARGETID = cmt.TARGETID;


-- No views for CrossMapSets ICDO table.
-- No views for CrossMapTargets ICDO table.


-- No more CrossMapSets
-- CrossMaps ICDO table with names.
-- EXECUTE drop_view('crossmapsicdowithnameandid');
-- CREATE VIEW crossmapsicdowithnameandid AS
-- SELECT MAPSETID, MAPCONCEPTID, cpn.PREFERREDNAME MAPCONCEPTIDNAME,
--    MAPOPTION, MAPPRIORITY, MAPTARGETID, cmt.TARGETCODES, MAPRULE, MAPADVICE
-- FROM crossmapsicdo cm,
--    conceptspreferredname cpn,
--    crossmaptargetsicdo cmt
-- WHERE cm.MAPCONCEPTID = cpn.CONCEPTID
-- AND cm.MAPTARGETID = cmt.TARGETID;

-- Clean up helper procedures.
DROP PROCEDURE drop_view;
