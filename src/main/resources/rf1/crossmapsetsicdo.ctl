options (skip=1,direct=true)
load data
characterset UTF8 length semantics char
infile 'Maps/ICDO/der1_CrossMapSets_ICDO_${editionLabel}_${editionVersion}.txt' "str X'0d0a'"
badfile 'Maps/ICDO/crossmapsetsicdo.bad'
discardfile 'Maps/ICDO/crossmapsetsicdo.dsc'
insert
into table crossmapsetsicdo
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