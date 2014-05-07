options (skip=1,direct=true)
load data
characterset UTF8 length semantics char
infile 'Subsets/Language-en-US/der1_Subsets_en-US_${editionLabel}_${editionVersion}.txt' "str X'0d0a'"
badfile 'subsetsenus.bad'
discardfile 'subsetsenus.dsc'
insert
into table subsetsenus
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