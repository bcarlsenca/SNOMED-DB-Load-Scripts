options (skip=1,direct=true)
load data
characterset UTF8 length semantics char
infile 'Snapshot/Refset/Metadata/der2_ssRefset_MRCMModuleScopeSnapshot_${editionLabel}_${editionVersion}.txt' "str X'0d0a'"
badfile 'mrcmmodulescope.bad'
discardfile 'mrcmmodulescope.dsc'
insert
into table mrcmmodulescope
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
    mrcmRuleRefsetId INTEGER EXTERNAL
)
