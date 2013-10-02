options (skip=1,direct=true)
load data
characterset UTF8 length semantics char
infile 'Subsets/NonHumanSubset/der1_SubsetMembers_NonHuman_INT_${version}.txt' "str X'0d0a'"
badfile 'subsetmembersnonhuman.bad'
discardfile 'subsetmembersnonhuman.dsc'
insert
into table subsetmembersnonhuman
fields terminated by X'09'
trailing nullcols
(
    SUBSETID INTEGER EXTERNAL,
    MEMBERID INTEGER EXTERNAL,
    MEMBERSTATUS INTEGER EXTERNAL,
    LINKEDID CHAR(100)
)