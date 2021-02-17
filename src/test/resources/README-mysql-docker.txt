
##### File Setup LINUX (BUILD SERVER)

cd /wci/data
unzip -o /wci/projects/SNOMED-DB-Load-Scripts/target/snomed-db-scripts-mysql.*.zip
sudo chmod +x rf2/populate_mysql_db.sh
sudo chmod +x rf2/populate_mysql_db_tc.sh

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
# WINDOWS
# host = host.docker.internal  (**make sure to edit this setting before proceeding)
#
# LINUX (BUILD SERVER)
# host = 172.17.0.1  (**make sure to edit this setting before proceeding)

# WINDOWS
dir=C:/data
cd %dir%
docker run -it -v %dir%:/data mysql:5.7 /bin/bash

# LINUX (BUILD SERVER)
export dir=/wci/data/
cd $dir
docker run -it -v $dir:/data mysql:5.7 /bin/bash

root@842bfb3da1f1:/# cd /data/rf2
root@842bfb3da1f1:/data/rf2# ./populate_mysql_db.sh
root@842bfb3da1f1:/data/rf2# ./populate_mysql_db_tc.sh

##### MySQL 8.0

#
# Launch the container
#
docker run --name snomed-mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=admin -e MYSQL_DATABASE=snomed -d --rm mysql:8.0 --local_infile=ON

#
# populate_mysql_db.sh, populate_mysql_db_tc.sh
# WINDOWS
# host = host.docker.internal  (**make sure to edit this setting before proceeding)
#
# LINUX (BUILD SERVER)
# host = 172.17.0.1  (**make sure to edit this setting before proceeding)

# WINDOWS
dir=C:/data
cd %dir%
docker run -it -v %dir%:/data mysql:8.0 /bin/bash

# LINUX (BUILD SERVER)
export dir=/wci/data/
cd $dir
docker run -it -v $dir:/data mysql:8.0 /bin/bash

root@842bfb3da1f1:/# cd /data/rf2
root@842bfb3da1f1:/data/rf2# ./populate_mysql_db.sh
root@842bfb3da1f1:/data/rf2# ./populate_mysql_db_tc.sh

##### MariaDB - 10.4

#
# Launch the container
#
docker run --name snomed-mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=admin -e MYSQL_DATABASE=snomed -d --rm mariadb:10.4

#
# populate_mysql_db.sh, populate_mysql_db_tc.sh
# WINDOWS
# host = host.docker.internal  (**make sure to edit this setting before proceeding)
#
# LINUX (BUILD SERVER)
# host = 172.17.0.1  (**make sure to edit this setting before proceeding)

# WINDOWS
dir=C:/data
cd %dir%
docker run -it -v %dir%:/data mariadb:10.4 /bin/bash

# LINUX (BUILD SERVER)
export dir=/wci/data/
cd $dir
docker run -it -v $dir:/data mariadb:10.4 /bin/bash

root@842bfb3da1f1:/# cd /data/rf2
root@842bfb3da1f1:/data/rf2# ./populate_mysql_db.sh
root@842bfb3da1f1:/data/rf2# ./populate_mysql_db_tc.sh

