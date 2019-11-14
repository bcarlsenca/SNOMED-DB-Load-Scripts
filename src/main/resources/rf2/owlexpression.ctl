options (skip=1,direct=true)
load data
characterset UTF8 length semantics char
infile 'Snapshot/Terminology/sct2_sRefset_OWLExpression_Snapshot_${editionLabel}_${editionVersion}.txt' "str X'0d0a'"
badfile 'owlexpression.bad'
discardfile 'owlexpression.dsc'
insert
into table owlexpression
reenable disabled_constraints
fields terminated by X'09'
trailing nullcols
(
    id CHAR(52),
    effectiveTime DATE "YYYYMMDD",
    active INTEGER EXTERNAL,
    moduleId INTEGER EXTERNAL,
    refsetId INTEGER EXTERNAL,
    referencedComponentId INTEGER EXTERNAL,
    owlExpression char(4000)
)
