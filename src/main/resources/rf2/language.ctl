options (skip=1,direct=true)
load data
characterset UTF8 length semantics char
infile 'Snapshot/Refset/Language/der2_cRefset_LanguageSnapshot-en_${editionLabel}_${editionVersion}.txt' "str X'0d0a'"
badfile 'language.bad'
discardfile 'language.dsc'
insert
into table language
reenable disabled_constraints
fields terminated by X'09'
trailing nullcols
(
    id CHAR(52),
    effectiveTime DATE "YYYYMMDD",
    active INTEGER EXTERNAL,
    moduleId INTEGER EXTERNAL,
    refsetId INTEGER EXTERNAL,
    referencedComponentId INTEGER EXTERNAL,
    acceptabilityId INTEGER EXTERNAL
)