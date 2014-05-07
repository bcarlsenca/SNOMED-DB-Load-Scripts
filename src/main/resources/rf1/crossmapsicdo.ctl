options (skip=1,direct=true)
load data
characterset UTF8 length semantics char
infile 'Maps/ICDO/der1_CrossMaps_ICDO_${editionLabel}_${editionVersion}.txt' "str X'0d0a'"
badfile 'Maps/ICDO/crossmapsicdo.bad'
discardfile 'Maps/ICDO/crossmapsicdo.dsc'
insert
into table crossmapsicdo
fields terminated by X'09'
trailing nullcols
(
    MAPSETID INTEGER EXTERNAL,
    MAPCONCEPTID INTEGER EXTERNAL,
    MAPOPTION INTEGER EXTERNAL,
    MAPPRIORITY INTEGER EXTERNAL,
    MAPTARGETID CHAR(100),
    MAPRULE CHAR(4000),
    MAPADVICE CHAR(4000)
)