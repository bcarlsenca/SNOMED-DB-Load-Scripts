::
:: Database connection parameters
:: Please edit these variables to reflect your environment
::
set ORACLE_HOME=C:\app\oracle\product\12.1.0\dbhome_1
set user=snomed
set password=snomed
set tns_name=ORCLCDB
set NLS_LANG=AMERICAN_AMERICA.UTF8

del oracle.log
echo. > oracle.log
echo ---------------------------------------- >> oracle.log 2>&1
echo Starting ...  >> oracle.log 2>&1
date /T >> oracle.log 2>&1
time /T >> oracle.log 2>&1
echo ---------------------------------------- >> oracle.log 2>&1
echo ORACLE_HOME = %ORACLE_HOME% >> oracle.log 2>&1
echo user =        %user% >> oracle.log 2>&1
echo tns_name =    %tns_name% >> oracle.log 2>&1
set error=0

echo     Create tables >> oracle.log 2>&1
echo @oracle_tables.sql|%ORACLE_HOME%\bin\sqlplus %user%/%password%@%tns_name%  >> oracle.log 2>&1
IF %ERRORLEVEL% NEQ 0 (set error=1
goto trailer)

echo     Load concept table data >> oracle.log 2>&1
%ORACLE_HOME%\bin\sqlldr %user%/%password%@%tns_name% control="concept.ctl" >> oracle.log 2>&1
IF %ERRORLEVEL% NEQ 0 (set error=1)
type concept.log >> oracle.log

echo     Load description table data >> oracle.log 2>&1
%ORACLE_HOME%\bin\sqlldr %user%/%password%@%tns_name% control="description.ctl" >> oracle.log 2>&1
IF %ERRORLEVEL% NEQ 0 (set error=1)
type description.log >> oracle.log

echo     Load identifier table data >> oracle.log 2>&1
%ORACLE_HOME%\bin\sqlldr %user%/%password%@%tns_name% control="identifier.ctl" >> oracle.log 2>&1
IF %ERRORLEVEL% NEQ 0 (set error=1)
type identifier.log >> oracle.log

echo     Load relationship table data >> oracle.log 2>&1
%ORACLE_HOME%\bin\sqlldr %user%/%password%@%tns_name% control="relationship.ctl" >> oracle.log 2>&1
IF %ERRORLEVEL% NEQ 0 (set error=1)
type relationship.log >> oracle.log

echo     Load relationship concrete values table data >> oracle.log 2>&1
%ORACLE_HOME%\bin\sqlldr %user%/%password%@%tns_name% control="relationshipconcretevalues.ctl" >> oracle.log 2>&1
IF %ERRORLEVEL% NEQ 0 (set error=1)
type relationshipconcretevalues.log >> oracle.log

echo     Load owl expression table data >> oracle.log 2>&1
%ORACLE_HOME%\bin\sqlldr %user%/%password%@%tns_name% control="owlexpression.ctl" >> oracle.log 2>&1
IF %ERRORLEVEL% NEQ 0 (set error=1)
type owlexpression.log >> oracle.log

echo     Load stated relationship table data >> oracle.log 2>&1
%ORACLE_HOME%\bin\sqlldr %user%/%password%@%tns_name% control="statedrelationship.ctl" >> oracle.log 2>&1
IF %ERRORLEVEL% NEQ 0 (set error=1)
type statedrelationship.log >> oracle.log

echo     Load text definition table data >> oracle.log 2>&1
%ORACLE_HOME%\bin\sqlldr %user%/%password%@%tns_name% control="textdefinition.ctl" >> oracle.log 2>&1
IF %ERRORLEVEL% NEQ 0 (set error=1)
type textdefinition.log >> oracle.log

echo     Load association table data >> oracle.log 2>&1
%ORACLE_HOME%\bin\sqlldr %user%/%password%@%tns_name% control="association.ctl" >> oracle.log 2>&1
IF %ERRORLEVEL% NEQ 0 (set error=1)
type association.log >> oracle.log

echo     Load attribute value table data >> oracle.log 2>&1
%ORACLE_HOME%\bin\sqlldr %user%/%password%@%tns_name% control="attributevalue.ctl" >> oracle.log 2>&1
IF %ERRORLEVEL% NEQ 0 (set error=1)
type attributevalue.log >> oracle.log

echo     Load simple refset table data >> oracle.log 2>&1
%ORACLE_HOME%\bin\sqlldr %user%/%password%@%tns_name% control="simple.ctl" >> oracle.log 2>&1
IF %ERRORLEVEL% NEQ 0 (set error=1)
type simple.log >> oracle.log

:: No more complex map, ICD9CM maps deprecated
:: echo     Load complex map refset table data >> oracle.log 2>&1
:: %ORACLE_HOME%\bin\sqlldr %user%/%password%@%tns_name% control="complexmap.ctl" >> oracle.log 2>&1
:: IF %ERRORLEVEL% NEQ 0 (set error=1)
:: type complexmap.log >> oracle.log

echo     Load extended map table data >> oracle.log 2>&1
%ORACLE_HOME%\bin\sqlldr %user%/%password%@%tns_name% control="extendedmap.ctl" >> oracle.log 2>&1
IF %ERRORLEVEL% NEQ 0 (set error=1)
type extendedmap.log >> oracle.log

echo     Load simple map table data >> oracle.log 2>&1
%ORACLE_HOME%\bin\sqlldr %user%/%password%@%tns_name% control="simplemap.ctl" >> oracle.log 2>&1
IF %ERRORLEVEL% NEQ 0 (set error=1)
type simplemap.log >> oracle.log

echo     Load language table data >> oracle.log 2>&1
%ORACLE_HOME%\bin\sqlldr %user%/%password%@%tns_name% control="language.ctl" >> oracle.log 2>&1
IF %ERRORLEVEL% NEQ 0 (set error=1)
type language.log >> oracle.log

echo     Load refset descriptor table data >> oracle.log 2>&1
%ORACLE_HOME%\bin\sqlldr %user%/%password%@%tns_name% control="refsetdescriptor.ctl" >> oracle.log 2>&1
IF %ERRORLEVEL% NEQ 0 (set error=1)
type refsetdescriptor.log >> oracle.log

echo     Load description type table data >> oracle.log 2>&1
%ORACLE_HOME%\bin\sqlldr %user%/%password%@%tns_name% control="descriptiontype.ctl" >> oracle.log 2>&1
IF %ERRORLEVEL% NEQ 0 (set error=1)
type descriptiontype.log >> oracle.log

echo     Load mrcm attribute domain table data >> oracle.log 2>&1
%ORACLE_HOME%\bin\sqlldr %user%/%password%@%tns_name% control="mrcmattributedomain.ctl" >> oracle.log 2>&1
IF %ERRORLEVEL% NEQ 0 (set error=1)
type mrcmattributedomain.log >> oracle.log

echo     Load mrcm module scope table data >> oracle.log 2>&1
%ORACLE_HOME%\bin\sqlldr %user%/%password%@%tns_name% control="mrcmmodulescope.ctl" >> oracle.log 2>&1
IF %ERRORLEVEL% NEQ 0 (set error=1)
type mrcmmodulescope.log >> oracle.log

echo     Load mrcm attribute range table data >> oracle.log 2>&1
%ORACLE_HOME%\bin\sqlldr %user%/%password%@%tns_name% control="mrcmattributerange.ctl" >> oracle.log 2>&1
IF %ERRORLEVEL% NEQ 0 (set error=1)
type mrcmattributerange.log >> oracle.log

echo     Load mrcm domain table data >> oracle.log 2>&1
%ORACLE_HOME%\bin\sqlldr %user%/%password%@%tns_name% control="mrcmdomain.ctl" >> oracle.log 2>&1
IF %ERRORLEVEL% NEQ 0 (set error=1)
type mrcmdomain.log >> oracle.log

echo     Load module dependency table data >> oracle.log 2>&1
%ORACLE_HOME%\bin\sqlldr %user%/%password%@%tns_name% control="moduledependency.ctl" >> oracle.log 2>&1
IF %ERRORLEVEL% NEQ 0 (set error=1)
type moduledependency.log >> oracle.log

echo     Create indexes >> oracle.log 2>&1
echo @oracle_indexes.sql|%ORACLE_HOME%\bin\sqlplus %user%/%password%@%tns_name%  >> oracle.log 2>&1
IF %ERRORLEVEL% NEQ 0 (set error=1
goto trailer)

echo     Create views >> oracle.log 2>&1
echo @oracle_views.sql|%ORACLE_HOME%\bin\sqlplus %user%/%password%@%tns_name%  >> oracle.log 2>&1
IF %ERRORLEVEL% NEQ 0 (set error=1
goto trailer)

:trailer
echo ---------------------------------------- >> oracle.log 2>&1
IF %error% NEQ 0 (
echo There were one or more errors. >> oracle.log 2>&1
set retval=-1
) else (
echo Completed without errors. >> oracle.log 2>&1
set retval=0
)
echo Finished ...  >> oracle.log 2>&1
date /T >> oracle.log 2>&1
time /T >> oracle.log 2>&1
echo ---------------------------------------- >> oracle.log 2>&1
pause
exit %retval%
