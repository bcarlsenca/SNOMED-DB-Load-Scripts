
##### Postgres 9.6

#
# For testing postgres, run a docker postgres instance
#  - https://hub.docker.com/_/postgres

#
# Launch the container
#
docker run --name snomed-postgres -e POSTGRES_PASSWORD=admin -e POSTGRES_DB=snomed -d postgres:9.6

#
# populate_postgres_db.sh
# host = host.docker.internal  (**make sure to edit this setting before proceeding)
#
dir=c:/data/SnomedCt_International
dir=c:/data/SnomedCt_US
docker run -it -v $dir:/data postgres:9.6 /bin/bash
root@842bfb3da1f1:/# cd /data
root@842bfb3da1f1:/data# ./populate_postgres_db.sh &


##### Postgres 10.12

#
# For testing postgres, run a docker postgres instance
#  - https://hub.docker.com/_/postgres

#
# Launch the container
#
docker run --name snomed-postgres -e POSTGRES_PASSWORD=admin -e POSTGRES_DB=snomed -d postgres:10.12

#
# populate_postgres_db.sh
# host = host.docker.internal  (**make sure to edit this setting before proceeding)
#
dir=c:/data/SnomedCt_International
dir=c:/data/SnomedCt_US
docker run -it -v $dir:/data postgres:10.12 /bin/bash
root@842bfb3da1f1:/# cd /data
root@842bfb3da1f1:/data# ./populate_postgres_db.sh &

##### Postgres 11.7

#
# Launch the container
#
docker run --name snomed-postgres -e POSTGRES_PASSWORD=admin -e POSTGRES_DB=snomed -d postgres:11.2

#
# populate_postgres_db.sh
# host = host.docker.internal  (**make sure to edit this setting before proceeding)
#
dir=c:/data/SnomedCt_International
dir=c:/data/SnomedCt_US
docker run -it -v $dir:/data postgres:11.2 /bin/bash
root@842bfb3da1f1:/# cd /data
root@842bfb3da1f1:/data# ./populate_postgres_db.sh &

##### Postgres 12.2

#
# Launch the container
#
docker run --name snomed-postgres -e POSTGRES_PASSWORD=admin -e POSTGRES_DB=snomed -d postgres:12.2

#
# populate_postgres_db.sh
# host = host.docker.internal  (**make sure to edit this setting before proceeding)
#
dir=c:/data/SnomedCt_International
dir=c:/data/SnomedCt_US
docker run -it -v $dir:/data postgres:12.2 /bin/bash
root@842bfb3da1f1:/# cd /data
root@842bfb3da1f1:/data# ./populate_postgres_db.sh &
