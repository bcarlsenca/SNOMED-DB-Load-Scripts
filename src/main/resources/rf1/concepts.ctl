options (skip=1,direct=true)
load data
characterset UTF8 length semantics char
infile 'Terminology/Content/sct1_Concepts_${editionType}_${editionLabel}_${editionVersion}.txt' "str X'0d0a'"
badfile 'concepts.bad'
discardfile 'concepts.dsc'
insert
into table concepts
fields terminated by X'09'
trailing nullcols
(
    CONCEPTID INTEGER EXTERNAL,
    CONCEPTSTATUS INTEGER EXTERNAL,
    FULLYSPECIFIEDNAME CHAR(255),
    CTV3ID CHAR(100),
    SNOMEDID CHAR(100),
    ISPRIMITIVE INTEGER EXTERNAL
)