options (skip=1,direct=true)
load data
characterset UTF8 length semantics char
infile 'Subsets/Language-en-GB/der1_Subsets_en-GB_${editionLabel}_${editionVersion}.txt' "str X'0d0a'"
badfile 'subsetsengb.bad'
discardfile 'subsetsengb.dsc'
insert
into table subsetsengb
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