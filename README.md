Readme File for Setting up Web based Book Exchange Platform

GitHub Repository: https://github.com/niladrinilankan/2023TM93563-NiladriSekharSaha.git

Demonstration Video of the Working Prototype: https://drive.google.com/drive/folders/13o-Eh1aZc4wMR31h3xee9k7NSWFjaopM?usp=drive_link
**Prerequisites**
Java Development Kit (JDK) (version 8 or higher)
Apache Tomcat (version 8.0 or higher)
MySQL 5.5 or Higher

**Clone the Repository**
git clone https://github.com/niladrinilankan/2023TM93563-NiladriSekharSaha.git
cd your-repository

**Install Tomcat**
Download Tomcat from the Apache Tomcat website.
Extract the downloaded archive to your preferred directory.
Set up the environment variables for CATALINA_HOME.

**Configure the Database**
Create a Database: Log in to MySQL and create a database for eBookExchange
mysql -uroot -p fstpdb 
your_password
Open Command prompt and Do the following,
cd your-repository/DB/
mysql -uroot -p fstpdb < fstpdb.sql


**Deploy the WAR File**
cp your-repository/WAR/eBookExchange.war $CATALINA_HOME/webapps/

**Start Tomcat:**
cd $CATALINA_HOME/bin
./startup.sh

**Access the Application from any Browser**
URL:- http://localhost:8080/eBookExchange  
