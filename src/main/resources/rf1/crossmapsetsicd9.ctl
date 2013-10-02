options (skip=1,direct=true)
load data
characterset UTF8 length semantics char
infile 'Maps/ICD9/der1_CrossMapSets_ICD9_INT_${version}.txt' "str X'0d0a'"
badfile 'Maps/ICD9/crossmapsetsicd9.bad'
discardfile 'Maps/ICD9/crossmapsetsicd9.dsc'
insert
into table crossmapsetsicd9
fields terminated by X'09'
trailing nullcols
(
    MAPSETID INTEGER EXTERNAL,
    MAPSETNAME CHAR(255),
    MAPSETTYPE INTEGER EXTERNAL,
    MAPSETSCHEMEID CHAR(255),
    MAPSETSCHEMENAME CHAR(255),
    MAPSETSCHEMEVERSION CHAR(255),
    MAPSETREALMID INTEGER EXTERNAL,
    MAPSETSEPARATOR CHAR(1),
    MAPSETRULETYPE INTEGER EXTERNAL
)