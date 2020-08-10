
##### Postgres 9.6

#
# Launch the container
#
docker run --name snomed-postgres -e POSTGRES_PASSWORD=admin -e POSTGRES_DB=snomed -d --rm postgres:9.6

#
# populate_mysql_db.sh, populate_mysql_db_tc.sh
# host = host.docker.internal  (**make sure to edit this setting before proceeding)
#
dir=c:/data/SnomedCt_US
dir=c:/data/SnomedCt_International
cd $dir
./transitive_closure.sh
docker run -it -v $dir:/data postgres:9.6 /bin/bash
root@842bfb3da1f1:/# cd /data
root@842bfb3da1f1:/data# ./populate_postgres_db.sh
root@842bfb3da1f1:/data# ./populate_postgres_db_tc.sh


##### Postgres 10.12

#
# For testing postgres, run a docker postgres instance
#  - https://hub.docker.com/_/postgres

#
# Launch the container
#
docker run --name snomed-postgres -e POSTGRES_PASSWORD=admin -e POSTGRES_DB=snomed -d --rm postgres:10.12

#
# populate_mysql_db.sh, populate_mysql_db_tc.sh
# host = host.docker.internal  (**make sure to edit this setting before proceeding)
#
dir=c:/data/SnomedCt_US
dir=c:/data/SnomedCt_International
cd $dir
./transitive_closure.sh
docker run -it -v $dir:/data postgres:10.12 /bin/bash
root@842bfb3da1f1:/# cd /data
root@842bfb3da1f1:/data# ./populate_postgres_db.sh
root@842bfb3da1f1:/data# ./populate_postgres_db_tc.sh

##### Postgres 11.7

#
# Launch the container
#
docker run --name snomed-postgres -e POSTGRES_PASSWORD=admin -e POSTGRES_DB=snomed -d --rm postgres:11.2

#
# populate_mysql_db.sh, populate_mysql_db_tc.sh
# host = host.docker.internal  (**make sure to edit this setting before proceeding)
#
dir=c:/data/SnomedCt_US
dir=c:/data/SnomedCt_International
cd $dir
./transitive_closure.sh
docker run -it -v $dir:/data postgres:11.2 /bin/bash
root@842bfb3da1f1:/# cd /data
root@842bfb3da1f1:/data# ./populate_postgres_db.sh
root@842bfb3da1f1:/data# ./populate_postgres_db_tc.sh

##### Postgres 12.2

#
# Launch the container
#
docker run --name snomed-postgres -e POSTGRES_PASSWORD=admin -e POSTGRES_DB=snomed -d --rm postgres:12.2

#
# populate_mysql_db.sh, populate_mysql_db_tc.sh
# host = host.docker.internal  (**make sure to edit this setting before proceeding)
#
dir=c:/data/SnomedCt_US
dir=c:/data/SnomedCt_International
cd $dir
./transitive_closure.sh
docker run -it -v $dir:/data postgres:12.2 /bin/bash
root@842bfb3da1f1:/# cd /data
root@842bfb3da1f1:/data# ./populate_postgres_db.sh
root@842bfb3da1f1:/data# ./populate_postgres_db_tc.sh
