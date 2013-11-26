options (skip=1,direct=true)
load data
characterset UTF8 length semantics char
infile 'Snapshot/Refset/Map/der2_iisssccRefset_ExtendedMapSnapshot_INT_${version}.txt' "str X'0d0a'"
badfile 'extendedmap.bad'
discardfile 'extendedmap.dsc'
insert
into table extendedmap
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
    mapGroup INTEGER EXTERNAL,
    mapPriority INTEGER EXTERNAL,
    mapRule CHAR(4000),
    mapAdvice CHAR(4000),
    mapTarget CHAR(100),
    correlationId INTEGER EXTERNAL,
    mapCategoryId INTEGER EXTERNAL
)