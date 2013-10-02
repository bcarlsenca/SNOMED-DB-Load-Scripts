options (skip=1,direct=true)
load data
characterset UTF8 length semantics char
infile 'Snapshot/Refset/Metadata/der2_ssRefset_ModuleDependencySnapshot_INT_${version}.txt' "str X'0d0a'"
badfile 'moduledependency.bad'
discardfile 'moduledependency.dsc'
insert
into table moduledependency
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
    sourceEffectiveTime DATE "YYYYMMDD",
    targetEffectiveTime DATE "YYYYMMDD"
)