::
:: Database connection parameters
:: Please edit these variables to reflect your environment
::
set ORACLE_HOME=D:\app\oracle\product\12.1.0\dbhome_1
set user=snomed
set password=snomed
set tns_name=global
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

echo     Load content tables >> oracle.log 2>&1
%ORACLE_HOME%\bin\sqlldr %user%/%password%@%tns_name% control="crossmapsicd9.ctl" >> oracle.log 2>&1
IF %ERRORLEVEL% NEQ 0 (set error=1)
type crossmapsicd9.log >> oracle.log

echo     Load content tables >> oracle.log 2>&1
%ORACLE_HOME%\bin\sqlldr %user%/%password%@%tns_name% control="crossmapsetsicd9.ctl" >> oracle.log 2>&1
IF %ERRORLEVEL% NEQ 0 (set error=1)
type crossmapsetsicd9.log >> oracle.log

echo     Load content tables >> oracle.log 2>&1
%ORACLE_HOME%\bin\sqlldr %user%/%password%@%tns_name% control="crossmaptargetsicd9.ctl" >> oracle.log 2>&1
IF %ERRORLEVEL% NEQ 0 (set error=1)
type crossmaptargetsicd9.log >> oracle.log

echo     Load content tables >> oracle.log 2>&1
%ORACLE_HOME%\bin\sqlldr %user%/%password%@%tns_name% control="crossmapsicdo.ctl" >> oracle.log 2>&1
IF %ERRORLEVEL% NEQ 0 (set error=1)
type crossmapsicdo.log >> oracle.log

echo     Load content tables >> oracle.log 2>&1
%ORACLE_HOME%\bin\sqlldr %user%/%password%@%tns_name% control="crossmapsetsicdo.ctl" >> oracle.log 2>&1
IF %ERRORLEVEL% NEQ 0 (set error=1)
type crossmapsetsicdo.log >> oracle.log

echo     Load content tables >> oracle.log 2>&1
%ORACLE_HOME%\bin\sqlldr %user%/%password%@%tns_name% control="crossmaptargetsicdo.ctl" >> oracle.log 2>&1
IF %ERRORLEVEL% NEQ 0 (set error=1)
type crossmaptargetsicdo.log >> oracle.log

echo     Load content tables >> oracle.log 2>&1
%ORACLE_HOME%\bin\sqlldr %user%/%password%@%tns_name% control="subsetmembersengb.ctl" >> oracle.log 2>&1
IF %ERRORLEVEL% NEQ 0 (set error=1)
type subsetmembersengb.log >> oracle.log

echo     Load content tables >> oracle.log 2>&1
%ORACLE_HOME%\bin\sqlldr %user%/%password%@%tns_name% control="subsetsengb.ctl" >> oracle.log 2>&1
IF %ERRORLEVEL% NEQ 0 (set error=1)
type subsetsengb.log >> oracle.log

echo     Load content tables >> oracle.log 2>&1
%ORACLE_HOME%\bin\sqlldr %user%/%password%@%tns_name% control="subsetmembersenus.ctl" >> oracle.log 2>&1
IF %ERRORLEVEL% NEQ 0 (set error=1)
type subsetmembersenus.log >> oracle.log

echo     Load content tables >> oracle.log 2>&1
%ORACLE_HOME%\bin\sqlldr %user%/%password%@%tns_name% control="subsetsenus.ctl" >> oracle.log 2>&1
IF %ERRORLEVEL% NEQ 0 (set error=1)
type subsetsenus.log >> oracle.log

echo     Load content tables >> oracle.log 2>&1
%ORACLE_HOME%\bin\sqlldr %user%/%password%@%tns_name% control="subsetmembersvtmvmp.ctl" >> oracle.log 2>&1
IF %ERRORLEVEL% NEQ 0 (set error=1)
type subsetmembersvtmvmp.log >> oracle.log

echo     Load content tables >> oracle.log 2>&1
%ORACLE_HOME%\bin\sqlldr %user%/%password%@%tns_name% control="subsetsvtmvmp.ctl" >> oracle.log 2>&1
IF %ERRORLEVEL% NEQ 0 (set error=1)
type subsetsvtmvmp.log >> oracle.log

echo     Load content tables >> oracle.log 2>&1
%ORACLE_HOME%\bin\sqlldr %user%/%password%@%tns_name% control="concepts.ctl" >> oracle.log 2>&1
IF %ERRORLEVEL% NEQ 0 (set error=1)
type concepts.log >> oracle.log

echo     Load content tables >> oracle.log 2>&1
%ORACLE_HOME%\bin\sqlldr %user%/%password%@%tns_name% control="descriptions.ctl" >> oracle.log 2>&1
IF %ERRORLEVEL% NEQ 0 (set error=1)
type descriptions.log >> oracle.log

echo     Load content tables >> oracle.log 2>&1
%ORACLE_HOME%\bin\sqlldr %user%/%password%@%tns_name% control="relationships.ctl" >> oracle.log 2>&1
IF %ERRORLEVEL% NEQ 0 (set error=1)
type relationships.log >> oracle.log

echo     Load content tables >> oracle.log 2>&1
%ORACLE_HOME%\bin\sqlldr %user%/%password%@%tns_name% control="componenthistory.ctl" >> oracle.log 2>&1
IF %ERRORLEVEL% NEQ 0 (set error=1)
type componenthistory.log >> oracle.log

echo     Load content tables >> oracle.log 2>&1
%ORACLE_HOME%\bin\sqlldr %user%/%password%@%tns_name% control="references.ctl" >> oracle.log 2>&1
IF %ERRORLEVEL% NEQ 0 (set error=1)
type references.log >> oracle.log

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
