options (skip=1,direct=true)
load data
characterset UTF8 length semantics char
infile 'Snapshot/Refset/Map/der2_sRefset_SimpleMapSnapshot_INT_${version}.txt' "str X'0d0a'"
badfile 'simplemap.bad'
discardfile 'simplemap.dsc'
insert
into table simplemap
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
    mapTarget CHAR(100)
)