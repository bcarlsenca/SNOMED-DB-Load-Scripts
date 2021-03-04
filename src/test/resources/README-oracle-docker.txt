
##### File Setup LINUX (BUILD SERVER)

cd /wci/data
unzip -o /wci/projects/SNOMED-DB-Load-Scripts/target/snomed-db-scripts-oracle.*.zip
sudo chmod +x rf2/populate_mysql_db.sh
sudo chmod +x rf2/populate_mysql_db_tc.sh

##### Oracle 12c

# Prerequisites
#  - Log into DockerHub and agree to Oracle's Terms of Service
#     - https://hub.docker.com/_/oracle-database-enterprise-edition?tab=description (Click "Proceed to checkout")

#
# For testing oracle, run a docker oracle instance
#  - https://dzone.com/articles/oracle-12c-image-installation-in-docker

#
# If running an Oracle Database Docker Container on Linux use docker login and enter your hub.docker.com
# credentials for image to download.
#


#
# Launch the container WINDOWS
dir=C:/data
cd %dir%
docker run --name snomed-oracle -v %dir%:/data -d --rm -p 8080:8080 -p 1521:1521 store/oracle/database-enterprise:12.2.0.1-slim

#
# Launch the container LINUX (BUILD SERVER)
export dir=/wci/data/
cd $dir
docker run --name snomed-oracle -v $dir:/data -d --rm -p 8080:8080 -p 1521:1521 store/oracle/database-enterprise:12.2.0.1-slim

#
# populate_mysql_db.sh, populate_mysql_db_tc.sh
# WINDOWS
# host = host.docker.internal  (**make sure to edit this setting before proceeding)
#
# LINUX (BUILD SERVER)
# host = 172.17.0.1  (**make sure to edit this setting before proceeding)

#
# Launch the container
#
docker run --name snomed-oracle -v $dir:/data -d --rm -p 8080:8080 -p 1521:1521 store/oracle/database-enterprise:12.2.0.1-slim

docker exec -it snomed-oracle /bin/bash
root@842bfb3da1f1:/# . /home/oracle/.bashrc
root@842bfb3da1f1:/# sqlplus sys/Oradoc_db1 as sysdba
alter session set "_ORACLE_SCRIPT"=true;
create user snomed identified by snomed;
GRANT CONNECT, RESOURCE, DBA TO snomed;
exit

root@842bfb3da1f1:/# cd /data/rf2
root@842bfb3da1f1:/data/rf2# ./populate_oracle_db.sh
root@842bfb3da1f1:/data/rf2# ./populate_oracle_db_tc.sh
