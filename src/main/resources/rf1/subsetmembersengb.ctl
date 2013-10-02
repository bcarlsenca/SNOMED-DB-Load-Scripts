options (skip=1,direct=true)
load data
characterset UTF8 length semantics char
infile 'Subsets/Language-en-GB/der1_SubsetMembers_en-GB_INT_${version}.txt' "str X'0d0a'"
badfile 'subsetmembersengb.bad'
discardfile 'subsetmembersengb.dsc'
insert
into table subsetmembersengb
fields terminated by X'09'
trailing nullcols
(
    SUBSETID INTEGER EXTERNAL,
    MEMBERID INTEGER EXTERNAL,
    MEMBERSTATUS INTEGER EXTERNAL,
    LINKEDID CHAR(100)
)