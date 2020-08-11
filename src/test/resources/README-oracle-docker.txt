
##### Oracle 12c

# Prerequisites
#  - https://hub.docker.com/_/oracle-database-enterprise-edition?tab=description (Click "Proceed to checkout")

#
# For testing oracle, run a docker mysql instance
#  - https://dzone.com/articles/oracle-12c-image-installation-in-docker

#
# Launch the container
#
dir=c:/data/SnomedCt_US
dir=c:/data/SnomedCt_International
cd $dir
./transitive_closure.sh 
docker run --name snomed-oracle -v $dir:/data -d --rm -p 8080:8080 -p 1521:1521 store/oracle/database-enterprise:12.2.0.1-slim

#
# populate_oracle_db.sh, populate_oracle_db_tc.sh
# host = host.docker.internal  (**make sure to edit this setting before proceeding)
#
docker exec -it snomed-oracle /bin/bash
root@842bfb3da1f1:/# cd /data
root@842bfb3da1f1:/# source /home/oracle/.bashrc
root@842bfb3da1f1:/# sqlplus /nolog
connect sys as sysdba;
-- Here enter the password as 'Oradoc_db1'
alter session set "_ORACLE_SCRIPT"=true;
create user snomed identified by snomed;
GRANT CONNECT, RESOURCE, DBA TO snomed;
exit
root@842bfb3da1f1:/data# ./populate_oracle_db.sh
root@842bfb3da1f1:/data# ./populate_oracle_db_tc.sh
