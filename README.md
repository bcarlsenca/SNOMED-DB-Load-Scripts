SNOMED CT DATABASE LOAD SCRIPTS
===============================
Scripts to create and populate a MYSQL or Oracle database with a SNOMED CT 
terminology release in either RF1 or RF2.  To download a package built for 
the latest US or International edition, visit
http://www.westcoastinformatics.com/resources.html

Minimum Specification
---------------------
- MYSQL v5.5.x
- Oracle v10.x

Installation
------------
1.  Download the SNOMED CT International Release files 
    in ZIP format.  US Users can find the files here:
  * SNOMED CT® Release Files: 
    * http://www.nlm.nih.gov/research/umls/licensedcontent/snomedctfiles.html
  * SNOMED CT® Archive Files" 
    * http://www.nlm.nih.gov/research/umls/licensedcontent/snomedctarchive.html
    Download the SNOMED CT International Release files 
    in ZIP format.  US Users can find the files here:
  * SNOMED CT® US Edition Release Files: 
    * http://www.nlm.nih.gov/research/umls/Snomed/us_edition.html
2.  Unzip the files into a folder 
3.  Unzip the installer scripts.
4.  For the desired format, copy the appropriate installer scripts 
    to the release file subdirectory specified below:
* To install from RF1, copy the installer scripts from rf1/
	  and paste them into the RF1Release directory
* To install from RF2, copy the installer scripts from rf2/
	  and paste them into the RF2Release directory
5.  Set the variables in the script, such as database username/password.
6.  Depending on your platform and database, execute the 
    appropriate "populate" script.  For example:
  * For MySQL on Windows, double-click the 
	  "populate_mysql_db.bat" script.
  * For Oracle on Windows, double-click the 
	  "populate_oracle_db.bat" script.
  * For MySQL on Linux/Unix/MacOS, open a terminal and run the 
	  "populate_mysql_db.sh" script.
  * For Oracle on Linux/Unix/MacOS, open a terminal and run the 
	  "populate_oracle_db.sh" script.
  * Note: a complete log file will appear as "mysql.log" or 

 See Also
 --------
 * src/main/resources/LICENSE.txt
 * src/main/resources/README.txt
 * src/main/resources/HOWTO.txt
   