options (skip=1,direct=true)
load data
characterset UTF8 length semantics char
infile 'Terminology/Content/sct1_Relationships_Core_INT_${version}.txt' "str X'0d0a'"
badfile 'relationships.bad'
discardfile 'relationships.dsc'
insert
into table relationships
fields terminated by X'09'
trailing nullcols
(
    RELATIONSHIPID INTEGER EXTERNAL,
    CONCEPTID1 INTEGER EXTERNAL,
    RELATIONSHIPTYPE INTEGER EXTERNAL,
    CONCEPTID2 INTEGER EXTERNAL,
    CHARACTERISTICTYPE INTEGER EXTERNAL,
    REFINABILITY INTEGER EXTERNAL,
    RELATIONSHIPGROUP INTEGER EXTERNAL
)