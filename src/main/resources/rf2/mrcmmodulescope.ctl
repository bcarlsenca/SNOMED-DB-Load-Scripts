options (skip=1,direct=true)
load data
characterset UTF8 length semantics char
infile 'Snapshot/Refset/Metadata/der2_ssRefset_MRCMDomainSnapshot_${editionLabel}_${editionVersion}.txt' "str X'0d0a'"
badfile 'mrcmdomain.bad'
discardfile 'mrcmdomain.dsc'
insert
into table mrcmdomain
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
    domainConstraint CHAR(4000),
    parentDomain CHAR(4000),
    proximalPrimitiveConstraint CHAR(4000)
    proximalPrimitiveRefinement CHAR(4000),
    domainTemplateForPrecoordination CHAR(4000),
    domainTemplateForPostcoordination CHAR(4000),
    guideURL CHAR(4000)
)
