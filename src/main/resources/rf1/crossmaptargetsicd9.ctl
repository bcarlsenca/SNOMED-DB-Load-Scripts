options (skip=1,direct=true)
load data
characterset UTF8 length semantics char
infile 'Maps/ICD9/der1_CrossMapTargets_ICD9_INT_${version}.txt' "str X'0d0a'"
badfile 'Maps/ICD9/crossmaptargetsicd9.bad'
discardfile 'Maps/ICD9/crossmaptargetsicd9.dsc'
insert
into table crossmaptargetsicd9
fields terminated by X'09'
trailing nullcols
(
    TARGETID INTEGER EXTERNAL,
    TARGETSCHEMEID CHAR(255),
    TARGETCODES CHAR(100),
    TARGETRULE CHAR(4000),
    TARGETADVICE CHAR(4000)
)