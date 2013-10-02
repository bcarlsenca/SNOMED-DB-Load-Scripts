options (skip=1,direct=true)
load data
characterset UTF8 length semantics char
infile 'Subsets/Language-en-US/der1_SubsetMembers_en-US_INT_${version}.txt' "str X'0d0a'"
badfile 'subsetmembersenus.bad'
discardfile 'subsetmembersenus.dsc'
insert
into table subsetmembersenus
fields terminated by X'09'
trailing nullcols
(
    SUBSETID INTEGER EXTERNAL,
    MEMBERID INTEGER EXTERNAL,
    MEMBERSTATUS INTEGER EXTERNAL,
    LINKEDID CHAR(100)
)