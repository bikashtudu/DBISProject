# DBISProject
Library Management System using Java and MySQL

# Minor Project
Course: CS 257

Developed By
Bikash Kumar Tudu
Piyush Kalkute

Programming Language: JAVA with  Swings
MySQL Conncector: MySQL JConnector 5.1.40(JDBC Driver)
https://dev.mysql.com/downloads/connector/j/
IDE: NetBeans 8.1
MySQL Version: 5.5.4
MySQL WorkBench: 6.3.6+dfsg-0ubuntu1
Created in Ubuntu(16.04 LTS)

Clone the Project using link https://github.com/EncoSier/DBISProject.git

Importing Java Project in NetBeans
Clone the project in the NetBeans 8.1
NetBeans->Team->Git->Clone and copy-paste the https://github.com/EncoSier/DBISProject.git link

Importing Database(Schema+Data)
Import the Database in the MySQL database using MySQL WorkBench(Version is mentioned above)
MySQL Workbench->Data Import/Restore->Load Folder Contents->SQL->exportdb.sql

Connect the JDBC driver(JConnector) by including the it's JAR File in the Project
Expand Project->Libraries->(Right Click)ADD JAR File->include file: mysql-connector-java-5.1.40-bin.jar

Database setting can be changed
Expand Project->Source Packages->mainlibrary->DB.java
Change the Authentication Setting

