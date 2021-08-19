# DEPRECATED

Use https://github.com/WestCoastInformatics/SNOMED-DB-Load-Scripts.git instead

SNOMED CT DATABASE LOAD SCRIPTS
===============================
Scripts to create and populate a MySQL, Postgres, or Oracle database with a 
SNOMED CT terminology release in RF2.

To download a package built for the latest US or International edition, visit
http://www.westcoastinformatics.com/resources.html

Minimum Specification
---------------------
- MYSQL v5.6.+
- Oracle v11.+
- Postgres 9.+

Installation
------------
* See HOWTO.txt file to understand how to load the rf2 files into the database


See Also
--------
* src/main/resources/LICENSE.txt
* src/main/resources/README.txt
* src/main/resources/HOWTO.txt
   
TODO
----
Next Steps:
* Better automated QA to validate file sizes against table sizes
* Better automated QA to validate views have same row count as driving tables
* Support additional SNOMED files
