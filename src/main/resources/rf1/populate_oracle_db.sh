#!/bin/sh -f

#
# Database connection parameters
# Please edit these variables to reflect your environment
#
ORACLE_HOME=C:\\app\\ocarlsen\\product\\11.2.0\\dbhome_1
export ORACLE_HOME
user=snomed
password=snomed
tns_name=global
NLS_LANG=AMERICAN_AMERICA.UTF8
export NLS_LANG

/bin/rm -f oracle.log
touch oracle.log
ef=0

echo "See oracle.log for output"
echo "----------------------------------------" >> oracle.log 2>&1
echo "Starting ... `/bin/date`" >> oracle.log 2>&1
echo "----------------------------------------" >> oracle.log 2>&1
echo "ORACLE_HOME = $ORACLE_HOME" >> oracle.log 2>&1
echo "user =        $user" >> oracle.log 2>&1
echo "tns_name =    $tns_name" >> oracle.log 2>&1

echo "    Create tables ... `/bin/date`" >> oracle.log 2>&1
echo "@oracle_tables.sql"|$ORACLE_HOME/bin/sqlplus $user/$password@$tns_name  >> oracle.log 2>&1
if [ $? -ne 0 ]; then ef=1; fi
 
if [ $ef -ne 1 ]; then
echo "    Load content table data ... `/bin/date`" >> oracle.log 2>&1
$ORACLE_HOME/bin/sqlldr $user/$password@$tns_name control="crossmapsicd9.ctl" >> oracle.log 2>&1
if [ $? -ne 0 ]; then ef=1; fi
cat crossmapsicd9.log >> oracle.log
fi

if [ $ef -ne 1 ]; then
echo "    Load content table data ... `/bin/date`" >> oracle.log 2>&1
$ORACLE_HOME/bin/sqlldr $user/$password@$tns_name control="crossmapsetsicd9.ctl" >> oracle.log 2>&1
if [ $? -ne 0 ]; then ef=1; fi
cat crossmapsetsicd9.log >> oracle.log
fi

if [ $ef -ne 1 ]; then
echo "    Load content table data ... `/bin/date`" >> oracle.log 2>&1
$ORACLE_HOME/bin/sqlldr $user/$password@$tns_name control="crossmaptargetsicd9.ctl" >> oracle.log 2>&1
if [ $? -ne 0 ]; then ef=1; fi
cat crossmaptargetsicd9.log >> oracle.log
fi

if [ $ef -ne 1 ]; then
echo "    Load content table data ... `/bin/date`" >> oracle.log 2>&1
$ORACLE_HOME/bin/sqlldr $user/$password@$tns_name control="crossmapsicdo.ctl" >> oracle.log 2>&1
if [ $? -ne 0 ]; then ef=1; fi
cat crossmapsicdo.log >> oracle.log
fi

if [ $ef -ne 1 ]; then
echo "    Load content table data ... `/bin/date`" >> oracle.log 2>&1
$ORACLE_HOME/bin/sqlldr $user/$password@$tns_name control="crossmapsetsicdo.ctl" >> oracle.log 2>&1
if [ $? -ne 0 ]; then ef=1; fi
cat crossmapsetsicdo.log >> oracle.log
fi

if [ $ef -ne 1 ]; then
echo "    Load content table data ... `/bin/date`" >> oracle.log 2>&1
$ORACLE_HOME/bin/sqlldr $user/$password@$tns_name control="crossmaptargetsicdo.ctl" >> oracle.log 2>&1
if [ $? -ne 0 ]; then ef=1; fi
cat crossmaptargetsicdo.log >> oracle.log
fi

if [ $ef -ne 1 ]; then
echo "    Load content table data ... `/bin/date`" >> oracle.log 2>&1
$ORACLE_HOME/bin/sqlldr $user/$password@$tns_name control="subsetmembersengb.ctl" >> oracle.log 2>&1
if [ $? -ne 0 ]; then ef=1; fi
cat subsetmembersengb.log >> oracle.log
fi

if [ $ef -ne 1 ]; then
echo "    Load content table data ... `/bin/date`" >> oracle.log 2>&1
$ORACLE_HOME/bin/sqlldr $user/$password@$tns_name control="subsetsengb.ctl" >> oracle.log 2>&1
if [ $? -ne 0 ]; then ef=1; fi
cat subsetsengb.log >> oracle.log
fi

if [ $ef -ne 1 ]; then
echo "    Load content table data ... `/bin/date`" >> oracle.log 2>&1
$ORACLE_HOME/bin/sqlldr $user/$password@$tns_name control="subsetmembersenus.ctl" >> oracle.log 2>&1
if [ $? -ne 0 ]; then ef=1; fi
cat subsetmembersenus.log >> oracle.log
fi

if [ $ef -ne 1 ]; then
echo "    Load content table data ... `/bin/date`" >> oracle.log 2>&1
$ORACLE_HOME/bin/sqlldr $user/$password@$tns_name control="subsetsenus.ctl" >> oracle.log 2>&1
if [ $? -ne 0 ]; then ef=1; fi
cat subsetsenus.log >> oracle.log
fi

if [ $ef -ne 1 ]; then
echo "    Load content table data ... `/bin/date`" >> oracle.log 2>&1
$ORACLE_HOME/bin/sqlldr $user/$password@$tns_name control="subsetmembersvtmvmp.ctl" >> oracle.log 2>&1
if [ $? -ne 0 ]; then ef=1; fi
cat subsetmembersvtmvmp.log >> oracle.log
fi

if [ $ef -ne 1 ]; then
echo "    Load content table data ... `/bin/date`" >> oracle.log 2>&1
$ORACLE_HOME/bin/sqlldr $user/$password@$tns_name control="subsetsvtmvmp.ctl" >> oracle.log 2>&1
if [ $? -ne 0 ]; then ef=1; fi
cat subsetsvtmvmp.log >> oracle.log
fi

if [ $ef -ne 1 ]; then
echo "    Load content table data ... `/bin/date`" >> oracle.log 2>&1
$ORACLE_HOME/bin/sqlldr $user/$password@$tns_name control="concepts.ctl" >> oracle.log 2>&1
if [ $? -ne 0 ]; then ef=1; fi
cat concepts.log >> oracle.log
fi

if [ $ef -ne 1 ]; then
echo "    Load content table data ... `/bin/date`" >> oracle.log 2>&1
$ORACLE_HOME/bin/sqlldr $user/$password@$tns_name control="descriptions.ctl" >> oracle.log 2>&1
if [ $? -ne 0 ]; then ef=1; fi
cat descriptions.log >> oracle.log
fi

if [ $ef -ne 1 ]; then
echo "    Load content table data ... `/bin/date`" >> oracle.log 2>&1
$ORACLE_HOME/bin/sqlldr $user/$password@$tns_name control="relationships.ctl" >> oracle.log 2>&1
if [ $? -ne 0 ]; then ef=1; fi
cat relationships.log >> oracle.log
fi

if [ $ef -ne 1 ]; then
echo "    Load content table data ... `/bin/date`" >> oracle.log 2>&1
$ORACLE_HOME/bin/sqlldr $user/$password@$tns_name control="componenthistory.ctl" >> oracle.log 2>&1
if [ $? -ne 0 ]; then ef=1; fi
cat componenthistory.log >> oracle.log
fi

if [ $ef -ne 1 ]; then
echo "    Load content table data ... `/bin/date`" >> oracle.log 2>&1
$ORACLE_HOME/bin/sqlldr $user/$password@$tns_name control="references.ctl" >> oracle.log 2>&1
if [ $? -ne 0 ]; then ef=1; fi
cat references.log >> oracle.log
fi

if [ $ef -ne 1 ]; then
echo "    Create indexes ... `/bin/date`" >> oracle.log 2>&1
echo "@oracle_indexes.sql"|$ORACLE_HOME/bin/sqlplus $user/$password@$tns_name  >> oracle.log 2>&1
if [ $? -ne 0 ]; then ef=1; fi
fi

if [ $ef -ne 1 ]; then
echo "    Create views ... `/bin/date`" >> oracle.log 2>&1
echo "@oracle_views.sql"|$ORACLE_HOME/bin/sqlplus $user/$password@$tns_name  >> oracle.log 2>&1
if [ $? -ne 0 ]; then ef=1; fi
fi

echo "----------------------------------------" >> oracle.log 2>&1
if [ $ef -eq 1 ]
then
  echo "There were one or more errors.  Please reference the oracle.log file for details." >> oracle.log 2>&1
  retval=-1
else
  echo "Completed without errors." >> oracle.log 2>&1
  retval=0
fi
echo "Finished ... `/bin/date`" >> oracle.log 2>&1
echo "----------------------------------------" >> oracle.log 2>&1
exit $retval
