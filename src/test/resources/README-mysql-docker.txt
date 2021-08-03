
##### File Setup WINDOWS

* Download the SNOMED distribution from NLM
* Unpack to c:/data/SnomedCT_International (for international edition)
* Unpack to c:/data/SnomedCT_US (for US edition)
* Clone and build these projects
    * git@github.com:WestCoastInformatics/SNOMED-DB-Load-Scripts.git
    * git@github.com:WestCoastInformatics/SNOMED-CT-Transitive-Closure.git
* Open the target/snomed*-mysql*zip file
* Copy the contents of the "rf2" directory to folder where SNOMED data is unpacked (see above)

##### File Setup LINUX (BUILD SERVER)

cd /wci/data
unzip -o /wci/projects/SNOMED-DB-Load-Scripts/target/snomed-db-scripts-mysql.*.zip
unzip -o /wci/projects/SNOMED-CT-Transitive-Closure/target/snomed-transitive-closure-mysql.*.zip
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

# WINDOWS git bash (to simulate running in Linux)
# export PGHOST=host.docker.internal  (**make sure to edit this setting before proceeding)
dir=C:/data
docker run -it -v "$dir":/data mysql:5.7 /bin/bash
root@842bfb3da1f1:/# cd /data/SnomedCT_International
root@842bfb3da1f1:/data/rf2# ./populate_mysql_db.sh
root@842bfb3da1f1:/data/rf2# ./populate_mysql_db_tc.sh


# LINUX (BUILD SERVER)
# host = 172.17.0.1  (**make sure to edit this setting before proceeding)
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

# WINDOWS git bash (to simulate running in Linux)
# export PGHOST=host.docker.internal  (**make sure to edit this setting before proceeding)
dir=C:/data
docker run -it -v "$dir":/data mysql:8.0 /bin/bash
root@842bfb3da1f1:/# cd /data/SnomedCT_International
root@842bfb3da1f1:/data/rf2# ./populate_mysql_db.sh
root@842bfb3da1f1:/data/rf2# ./populate_mysql_db_tc.sh

# LINUX (BUILD SERVER)
# host = 172.17.0.1  (**make sure to edit this setting before proceeding)
export dir=/wci/data/
cd $dir
docker run -it -v $dir:/data mysql:8.0 /bin/bash

root@842bfb3da1f1:/# cd /data/rf2
root@842bfb3da1f1:/data/rf2# ./populate_mysql_db.sh
root@842bfb3da1f1:/data/rf2# ./populate_mysql_db_tc.sh

##### MariaDB - 10.6

#
# Launch the container
#
docker run --name snomed-mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=admin -e MYSQL_DATABASE=snomed -d --rm mariadb:10.6

# WINDOWS git bash (to simulate running in Linux)
# export PGHOST=host.docker.internal  (**make sure to edit this setting before proceeding)
dir=C:/data
docker run -it -v "$dir":/data mariadb:10.6 /bin/bash
root@842bfb3da1f1:/# cd /data/SnomedCT_International
root@842bfb3da1f1:/data/rf2# ./populate_mysql_db.sh
root@842bfb3da1f1:/data/rf2# ./populate_mysql_db_tc.sh


# LINUX (BUILD SERVER)
# host = 172.17.0.1  (**make sure to edit this setting before proceeding)
export dir=/wci/data/
cd $dir
docker run -it -v $dir:/data mariadb:10.6 /bin/bash

root@842bfb3da1f1:/# cd /data/rf2
root@842bfb3da1f1:/data/rf2# ./populate_mysql_db.sh
root@842bfb3da1f1:/data/rf2# ./populate_mysql_db_tc.sh

