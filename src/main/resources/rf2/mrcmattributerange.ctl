options (skip=1,direct=true)
load data
characterset UTF8 length semantics char
infile 'Snapshot/Refset/Metadata/der2_ssccRefset_MRCMAttributeRangeSnapshot_${editionLabel}_${editionVersion}.txt' "str X'0d0a'"
badfile 'mrcmattributerange.bad'
discardfile 'mrcmattributerange.dsc'
insert
into table mrcmattributerange
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
    rangeConstraint CHAR(4000),
    attributeRule CHAR(4000),
    ruleStrengthId INTEGER EXTERNAL,
    contentTypeId INTEGER EXTERNAL
)
