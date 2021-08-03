options (skip=1,direct=true)
load data
characterset UTF8 length semantics char
infile 'Snapshot/Terminology/sct2_RelationshipConcreteValues_Snapshot_${editionLabel}_${editionVersion}.txt' "str X'0d0a'"
badfile 'relationshipconcretevalues.bad'
discardfile 'relationshipconcretevalues.dsc'
insert
into table relationshipconcretevalues
reenable disabled_constraints
fields terminated by X'09'
trailing nullcols
(
    id INTEGER EXTERNAL,
    effectiveTime DATE "YYYYMMDD",
    active INTEGER EXTERNAL,
    moduleId INTEGER EXTERNAL,
    sourceId INTEGER EXTERNAL,
    value CHAR(256),
    relationshipGroup INTEGER EXTERNAL,
    typeId INTEGER EXTERNAL,
    characteristicTypeId INTEGER EXTERNAL,
    modifierId INTEGER EXTERNAL
)