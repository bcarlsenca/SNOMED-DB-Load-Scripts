
##### File Setup LINUX (BUILD SERVER)

cd /wci/data
unzip -o /wci/projects/SNOMED-DB-Load-Scripts/target/snomed-db-scripts-oracle.*.zip
sudo chmod +x rf2/populate_oracle_db.sh
sudo chmod +x rf2/populate_oracle_db_tc.sh

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
#
dir=C:/data
cd %dir%
docker run --name snomed-oracle -v %dir%:/data -d --rm -p 8080:8080 -p 1521:1521 store/oracle/database-enterprise:12.2.0.1-slim


#
# If not running Docker as root LINUX (BUILD SERVER)
#
touch oracle.log concept.log description.log identifier.log relationship.log owlexpression.log statedrelationship.log textdefinition.log association.log attributevalue.log simple.log complexmap.log extendedmap.log simplemap.log language.log refsetdescriptor.log descriptiontype.log moduledependency.log
chmod a=rw oracle.log concept.log description.log identifier.log relationship.log owlexpression.log statedrelationship.log textdefinition.log association.log attributevalue.log simple.log complexmap.log extendedmap.log simplemap.log language.log refsetdescriptor.log descriptiontype.log moduledependency.log

#
# Create log files and allow read/write to all users.
# Launch the container LINUX (BUILD SERVER)
#
export dir=/wci/data/
cd $dir
docker run --name snomed-oracle -v $dir:/data -d --rm -p 8080:8080 -p 1521:1521 store/oracle/database-enterprise:12.2.0.1-slim

#
# populate_oracle_db.sh, populate_oracle_db_tc.sh
#
# Launch the container
#
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

#
# Connect to Oracle database to query tables
# Skip docker exec command if still connected from prior step
#

docker exec -it snomed-oracle /bin/bash
root@842bfb3da1f1:/# . /home/oracle/.bashrc
root@842bfb3da1f1:/# sqlplus snomed/snomed@ORCLCDB
