options (skip=1,direct=true)
load data
characterset UTF8 length semantics char
infile 'Terminology/History/sct1_References_Core_INT_${version}.txt' "str X'0d0a'"
badfile 'references.bad'
discardfile 'references.dsc'
insert
into table references
fields terminated by X'09'
trailing nullcols
(
    COMPONENTID INTEGER EXTERNAL,
    REFERENCETYPE INTEGER EXTERNAL,
    REFERENCEDID INTEGER EXTERNAL
)