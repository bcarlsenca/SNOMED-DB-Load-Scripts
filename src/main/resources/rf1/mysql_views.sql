-- Show warnings after every statement.
\W


-- Concepts Preferred Name view, used by other views.
-- DESCRIPTIONSTATUS: 0 = Current 
-- MEMBERSTATUS 1 = Preferred Term
DROP VIEW IF EXISTS conceptspreferredname;
CREATE VIEW conceptspreferredname AS
SELECT c.CONCEPTID, IFNULL(d.TERM, "no active preferred term") PREFERREDNAME, d.DESCRIPTIONID
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
DROP VIEW IF EXISTS conceptswithname;
CREATE VIEW conceptswithname AS
SELECT c.CONCEPTID, cpn.PREFERREDNAME CONCEPTIDNAME, CONCEPTSTATUS, FULLYSPECIFIEDNAME, CTV3ID, SNOMEDID, ISPRIMITIVE
FROM concepts c, conceptspreferredname cpn
WHERE c.CONCEPTID = cpn.CONCEPTID;


-- Descriptions table with names.
DROP VIEW IF EXISTS descriptionswithname;
CREATE VIEW descriptionswithname AS
SELECT d.DESCRIPTIONID, TERM, DESCRIPTIONSTATUS, d.CONCEPTID, cpn.PREFERREDNAME CONCEPTIDNAME, INITIALCAPITALSTATUS, DESCRIPTIONTYPE, LANGUAGECODE
FROM descriptions d, conceptspreferredname cpn
WHERE d.CONCEPTID = cpn.CONCEPTID;


-- Relationships table with names.
DROP VIEW IF EXISTS relationshipswithname;
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
DROP VIEW IF EXISTS componenthistorywithname;
CREATE VIEW componenthistorywithname AS
SELECT COMPONENTID, cpn.PREFERREDNAME COMPONENTIDNAME,
    RELEASEVERSION, CHANGETYPE, STATUS, REASON
FROM componenthistory
LEFT OUTER JOIN conceptspreferredname cpn ON COMPONENTID = CONCEPTID;


-- References table with names.
-- TODO: Will say "no active preferred term" when COMPONENTID is either inactive concept or a description ID.
-- TODO: Will say "no active preferred term" when REFERENCEDID is either inactive concept or a description ID.
DROP VIEW IF EXISTS referenceswithname;
CREATE VIEW referenceswithname AS
SELECT COMPONENTID, cpn1.PREFERREDNAME COMPONENTIDNAME, 
    REFERENCETYPE,
    REFERENCEDID, cpn2.PREFERREDNAME REFERENCEDIDNAME
FROM referencescore
LEFT OUTER JOIN conceptspreferredname cpn1 ON COMPONENTID = cpn1.CONCEPTID
LEFT OUTER JOIN conceptspreferredname cpn2 ON REFERENCEDID = cpn2.CONCEPTID;


-- No views for CrossMapSets ICD9 table.
-- No views for CrossMapTargets ICD9 table.


-- CrossMaps ICD9 table with names and IDs.
DROP VIEW IF EXISTS crossmapsicd9withnameandid;
CREATE VIEW crossmapsicd9withnameandid AS
SELECT MAPSETID, MAPCONCEPTID, cpn.PREFERREDNAME MAPCONCEPTIDNAME,
    MAPOPTION, MAPPRIORITY, MAPTARGETID, cmt.TARGETCODES, MAPRULE, MAPADVICE
FROM crossmapsicd9 cm,
    conceptspreferredname cpn,
    crossmaptargetsicd9 cmt
WHERE cm.MAPCONCEPTID = cpn.CONCEPTID
AND cm.MAPTARGETID = cmt.TARGETID;


-- No views for CrossMapSets ICDO table.
-- No views for CrossMapTargets ICDO table.


-- CrossMaps ICDO table with names.
DROP VIEW IF EXISTS crossmapsicdowithnameandid;
CREATE VIEW crossmapsicdowithnameandid AS
SELECT MAPSETID, MAPCONCEPTID, cpn.PREFERREDNAME MAPCONCEPTIDNAME,
    MAPOPTION, MAPPRIORITY, MAPTARGETID, cmt.TARGETCODES, MAPRULE, MAPADVICE
FROM crossmapsicdo cm,
    conceptspreferredname cpn,
    crossmaptargetsicdo cmt
WHERE cm.MAPCONCEPTID = cpn.CONCEPTID
AND cm.MAPTARGETID = cmt.TARGETID;
