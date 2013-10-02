options (skip=1,direct=true)
load data
characterset UTF8 length semantics char
infile 'Subsets/NonHumanSubset/der1_Subsets_NonHuman_INT_${version}.txt' "str X'0d0a'"
badfile 'subsetsnonhuman.bad'
discardfile 'subsetsnonhuman.dsc'
insert
into table subsetsnonhuman
fields terminated by X'09'
trailing nullcols
(
    SUBSETID INTEGER EXTERNAL,
    SUBSETORIGINALID INTEGER EXTERNAL,
    SUBSETVERSION INTEGER EXTERNAL,
    SUBSETNAME CHAR(255),
    SUBSETTYPE INTEGER EXTERNAL,
    LANGUAGECODE CHAR(5),
    REALMID INTEGER EXTERNAL,
    CONTEXTID INTEGER EXTERNAL
)