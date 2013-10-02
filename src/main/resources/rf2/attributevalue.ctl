options (skip=1,direct=true)
load data
characterset UTF8 length semantics char
infile 'Snapshot/Refset/Content/der2_cRefset_AttributeValueSnapshot_INT_${version}.txt' "str X'0d0a'"
badfile 'attributevalue.bad'
discardfile 'attributevalue.dsc'
insert
into table attributevalue
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
    valueId INTEGER EXTERNAL
)