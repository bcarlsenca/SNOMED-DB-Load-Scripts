
##### Postgres 9.6

#
# Launch the container
#
docker run --name snomed-postgres -p 5432:5432 -e POSTGRES_PASSWORD=admin -e POSTGRES_DB=snomed -d --rm postgres:9.6

#
# populate_mysql_db.sh, populate_mysql_db_tc.sh
# host = host.docker.internal  (**make sure to edit this setting before proceeding)
#
dir=c:/data/
cd $dir
docker run -it -v $dir:/data postgres:9.6 /bin/bash
root@842bfb3da1f1:/# cd /data/rf2
root@842bfb3da1f1:/data# ./populate_postgres_db.sh
root@842bfb3da1f1:/data# ./populate_postgres_db_tc.sh


##### Postgres 10.12

#
# For testing postgres, run a docker postgres instance
#  - https://hub.docker.com/_/postgres

#
# Launch the container
#
docker run --name snomed-postgres -p 5432:5432 -e POSTGRES_PASSWORD=admin -e POSTGRES_DB=snomed -d --rm postgres:10.14

#
# populate_mysql_db.sh, populate_mysql_db_tc.sh
# host = host.docker.internal  (**make sure to edit this setting before proceeding)
#
dir=c:/data/
cd $dir
docker run -it -v $dir:/data postgres:10.14 /bin/bash
root@842bfb3da1f1:/# cd /data/rf2
root@842bfb3da1f1:/data/rf2# ./populate_postgres_db.sh
root@842bfb3da1f1:/data/rf2# ./populate_postgres_db_tc.sh

##### Postgres 11.7

#
# Launch the container
#
docker run --name snomed-postgres -p 5432:5432 -e POSTGRES_PASSWORD=admin -e POSTGRES_DB=snomed -d --rm postgres:11.9

#
# populate_mysql_db.sh, populate_mysql_db_tc.sh
# host = host.docker.internal  (**make sure to edit this setting before proceeding)
#
dir=c:/data/
cd $dir
docker run -it -v $dir:/data postgres:11.9 /bin/bash
root@842bfb3da1f1:/# cd /data/rf2
root@842bfb3da1f1:/data/rf2# ./populate_postgres_db.sh
root@842bfb3da1f1:/data/rf2# ./populate_postgres_db_tc.sh

##### Postgres 12.2

#
# Launch the container
#
docker run --name snomed-postgres -p 5432:5432 -e POSTGRES_PASSWORD=admin -e POSTGRES_DB=snomed -d --rm postgres:12.4

#
# populate_mysql_db.sh, populate_mysql_db_tc.sh
# host = host.docker.internal  (**make sure to edit this setting before proceeding)
#
dir=c:/data/
cd $dir
docker run -it -v $dir:/data postgres:12.4 /bin/bash
root@842bfb3da1f1:/# cd /data/rf2
root@842bfb3da1f1:/data/rf2# ./populate_postgres_db.sh
root@842bfb3da1f1:/data/rf2# ./populate_postgres_db_tc.sh
