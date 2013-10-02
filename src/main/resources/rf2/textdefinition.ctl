options (skip=1,direct=true)
load data
characterset UTF8 length semantics char
infile 'Snapshot/Terminology/sct2_TextDefinition_Snapshot-en_INT_${version}.txt' "str X'0d0a'"
badfile 'textdefinition.bad'
discardfile 'textdefinition.dsc'
insert
into table textdefinition
reenable disabled_constraints
fields terminated by X'09'
trailing nullcols
(
    id INTEGER EXTERNAL,
    effectiveTime DATE "YYYYMMDD",
    active INTEGER EXTERNAL,
    moduleId INTEGER EXTERNAL,
    conceptId INTEGER EXTERNAL,
    languageCode CHAR(2),
    typeId INTEGER EXTERNAL,
    term CHAR(1024),
    caseSignificanceId INTEGER EXTERNAL
)