Readme File for Setting up Web based Book Exchange Platform

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

**Deploy the WAR File**
cp your-repository/WAR/eBookExchange.war $CATALINA_HOME/webapps/

**Start Tomcat:**
cd $CATALINA_HOME/bin
./startup.sh

**Access the Application from any Browser**
URL:- http://localhost:8080/eBookExchange  
