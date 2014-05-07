options (skip=1,direct=true)
load data
characterset UTF8 length semantics char
infile 'Snapshot/Terminology/sct2_Concept_Snapshot_${editionLabel}_${editionVersion}.txt' "str X'0d0a'"
badfile 'concept.bad'
discardfile 'concept.dsc'
insert
into table concept
reenable disabled_constraints
fields terminated by X'09'
trailing nullcols
(
    id INTEGER EXTERNAL,
    effectiveTime DATE "YYYYMMDD",
    active INTEGER EXTERNAL,
    moduleId INTEGER EXTERNAL,
    definitionStatusId INTEGER EXTERNAL
)