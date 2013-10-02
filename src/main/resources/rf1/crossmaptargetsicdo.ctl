options (skip=1,direct=true)
load data
characterset UTF8 length semantics char
infile 'Maps/ICDO/der1_CrossMapTargets_ICDO_INT_${version}.txt' "str X'0d0a'"
badfile 'Maps/ICDO/crossmaptargetsicdo.bad'
discardfile 'Maps/ICDO/crossmaptargetsicdo.dsc'
insert
into table crossmaptargetsicdo
fields terminated by X'09'
trailing nullcols
(
    TARGETID INTEGER EXTERNAL,
    TARGETSCHEMEID CHAR(255),
    TARGETCODES CHAR(100),
    TARGETRULE CHAR(4000),
    TARGETADVICE CHAR(4000)
)