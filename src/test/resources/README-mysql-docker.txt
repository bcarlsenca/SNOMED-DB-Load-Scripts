
##### MySQL 5.7

#
# For testing mysql, run a docker mysql instance
#  - https://hub.docker.com/_/mysql

#
# Launch the container
#
docker run --name snomed-mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=admin -e MYSQL_DATABASE=snomed -d --rm mysql:5.7

#
# populate_mysql_db.sh, populate_mysql_db_tc.sh
# host = host.docker.internal  (**make sure to edit this setting before proceeding)
#
dir=c:/data/SnomedCt_US
dir=c:/data/SnomedCt_International
cd $dir
./transitive_closure.sh 
docker run -it -v $dir:/data mysql:5.7 /bin/bash
root@842bfb3da1f1:/# cd /data
root@842bfb3da1f1:/data# ./populate_mysql_db.sh
root@842bfb3da1f1:/data# ./populate_mysql_db_tc.sh

##### MySQL 8.0

#
# Launch the container
#
docker run --name snomed-mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=admin -e MYSQL_DATABASE=snomed -d --rm mysql:8.0 --local_infile=ON

#
# populate_mysql_db.sh, populate_mysql_db_tc.sh
# host = host.docker.internal  (**make sure to edit this setting before proceeding)
#
dir=c:/data/SnomedCt_US
dir=c:/data/SnomedCt_International
cd $dir
./transitive_closure.sh
docker run -it -v $dir:/data mysql:8.0 /bin/bash
root@842bfb3da1f1:/# cd /data
root@842bfb3da1f1:/data# ./populate_mysql_db.sh
root@842bfb3da1f1:/data# ./populate_mysql_db_tc.sh

##### MariaDB - 10.4

#
# Launch the container
#
docker run --name snomed-mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=admin -e MYSQL_DATABASE=snomed -d --rm mariadb:10.4

#
# populate_mysql_db.sh, populate_mysql_db_tc.sh
# host = host.docker.internal  (**make sure to edit this setting before proceeding)
#
dir=c:/data/SnomedCt_US
dir=c:/data/SnomedCt_International
cd $dir
./transitive_closure.sh
docker run -it -v $dir:/data mariadb:10.4 /bin/bash
root@842bfb3da1f1:/# cd /data
root@842bfb3da1f1:/data# ./populate_mysql_db.sh
root@842bfb3da1f1:/data# ./populate_mysql_db_tc.sh

