options (skip=1,direct=true)
load data
characterset UTF8 length semantics char
infile 'Terminology/Content/sct1_Descriptions_en_INT_${version}.txt' "str X'0d0a'"
badfile 'descriptions.bad'
discardfile 'descriptions.dsc'
insert
into table descriptions
fields terminated by X'09'
trailing nullcols
(
    DESCRIPTIONID INTEGER EXTERNAL,
    DESCRIPTIONSTATUS INTEGER EXTERNAL,
    CONCEPTID INTEGER EXTERNAL,
    TERM CHAR(255),
    INITIALCAPITALSTATUS INTEGER EXTERNAL,
    DESCRIPTIONTYPE CHAR(100),
    LANGUAGECODE CHAR(5)
)