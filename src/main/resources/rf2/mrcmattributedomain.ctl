options (skip=1,direct=true)
load data
characterset UTF8 length semantics char
infile 'Snapshot/Refset/Metadata/der2_ssRefset_MRCMAttributeDomainSnapshot_${editionLabel}_${editionVersion}.txt' "str X'0d0a'"
badfile 'mrcmattributedomain.bad'
discardfile 'mrcmattributedomain.dsc'
insert
into table mrcmattributedomain
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
    domainId INTEGER EXTERNAL,
    grouped INTEGER EXTERNAL,
	attributeCardinality CHAR(20),
	attributeInGroupCardinality CHAR(20),
    ruleStrengthId INTEGER EXTERNAL,
    contentTypeId INTEGER EXTERNAL
)
