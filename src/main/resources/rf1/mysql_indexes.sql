-- Show warnings after every statement.
\W

CREATE INDEX x_comphist_componentid ON componenthistory(COMPONENTID);

CREATE INDEX x_references_componentid on referencescore(COMPONENTID);

CREATE INDEX x_references_referenceid on referencescore(REFERENCEDID);
