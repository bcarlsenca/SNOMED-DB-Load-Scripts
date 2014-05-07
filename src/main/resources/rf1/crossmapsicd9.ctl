options (skip=1,direct=true)
load data
characterset UTF8 length semantics char
infile 'Maps/ICD9/der1_CrossMaps_ICD9_${editionLabel}_${editionVersion}.txt' "str X'0d0a'"
badfile 'Maps/ICD9/crossmapsicd9.bad'
discardfile 'Maps/ICD9/crossmapsicd9.dsc'
insert
into table crossmapsicd9
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