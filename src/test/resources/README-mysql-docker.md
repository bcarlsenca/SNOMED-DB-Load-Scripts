# BUILD INSTRUCTIONS
## Pre-requisites
Before proceeding, make sure you updated the hostname in the load script.

## File Setup
```
   cd /wci/data
   unzip -o /wci/projects/SNOMED-DB-Load-Scripts/target/snomed-db-scripts-mysql.*.zip

   sudo chmod +x rf2/populate_mysql_db.sh
   sudo chmod +x rf2/compute_transitive_closure.pl
   sudo chmod +x rf2/compute_transitive_closure.py

```
Follow the instructions for the version you are using below.

### MySQL 8.0

1. Launch the container </br>
`docker run --name snomed-mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=admin -e MYSQL_DATABASE=snomed -d --rm mysql:8.0 --local_infile=ON`


2. Build Server
```
   export dir=/wci/data/
   cd $dir
   docker run -it -v $dir:/data mysql:8.0 /bin/bash
   
   root@842bfb3da1f1:/# cd /data/rf2
   root@842bfb3da1f1:/data/rf2# ./populate_mysql_db.sh
```

### MySQL 8.3

1. Launch the container </br>
   `docker run --name snomed-mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=admin -e MYSQL_DATABASE=snomed -d --rm mysql:8.3 --local_infile=ON`


2. Build Server
```
   export dir=/wci/data/
   cd $dir
   docker run -it -v $dir:/data mysql:8.3 /bin/bash
   
   root@842bfb3da1f1:/# cd /data/rf2
   root@842bfb3da1f1:/data/rf2# ./populate_mysql_db.sh
```

TODO: CHECK THE VERSION FOR MARIADB
### MariaDB - 10.11 
1. Launch the container </br>
`docker run --name snomed-mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=admin -e MYSQL_DATABASE=snomed -d --rm mariadb:10.11`


2. Build Server
```
   export dir=/wci/data/
   cd $dir
   docker run -it -v $dir:/data mariadb:10.11 /bin/bash
   
   root@842bfb3da1f1:/# cd /data/rf2
   root@842bfb3da1f1:/data/rf2# ./populate_mysql_db.sh
```