options (skip=1,direct=true)
load data
characterset UTF8 length semantics char
infile 'Subsets/VTMVMP/der1_SubsetMembers_VTMVMP_INT_${version}.txt' "str X'0d0a'"
badfile 'subsetmembersvtmvmp.bad'
discardfile 'subsetmembersvtmvmp.dsc'
insert
into table subsetmembersvtmvmp
fields terminated by X'09'
trailing nullcols
(
    SUBSETID INTEGER EXTERNAL,
    MEMBERID INTEGER EXTERNAL,
    MEMBERSTATUS INTEGER EXTERNAL,
    LINKEDID CHAR(100)
)