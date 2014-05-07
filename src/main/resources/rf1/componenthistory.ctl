options (skip=1,direct=true)
load data
characterset UTF8 length semantics char
infile 'Terminology/History/sct1_ComponentHistory_${editionType}_${editionLabel}_${editionVersion}.txt' "str X'0d0a'"
badfile 'componenthistory.bad'
discardfile 'componenthistory.dsc'
insert
into table componenthistory
fields terminated by X'09'
trailing nullcols
(
    COMPONENTID INTEGER EXTERNAL,
    RELEASEVERSION DATE "YYYYMMDD",
    CHANGETYPE INTEGER EXTERNAL,
    STATUS INTEGER EXTERNAL,
    REASON CHAR(255)
)