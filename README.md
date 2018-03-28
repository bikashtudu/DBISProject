# DBISProject
Library Management System using Java and MySQL
<p align="center">
  <a href="https://github.com/bikashtudu/DBISProject/stargazers">
    <img alt="GitHub stars" src="https://img.shields.io/github/stars/bikashtudu/DBISProject.svg">
  </a>
  <a href="https://github.com/bikashtudu/DBISProject/network">
    <img alt="GitHub forks" src="https://img.shields.io/github/forks/bikashtudu/DBISProject.svg">
  </a>
</p>
 https://bikashtudu.github.io/DBISProject/

# Minor Project
Course: CS 257

# Developed By
- Bikash Kumar Tudu [tudu.bikash@gmail.com]
- Piyush Kalkute

# Environment and Requirement
- Programming Language: JAVA with  Swings
- MySQL Conncector: MySQL JConnector 5.1.40(JDBC Driver)
  https://dev.mysql.com/downloads/connector/j/
- IDE: NetBeans 8.1
- MySQL Version: 5.5.4
- MySQL WorkBench: 6.3.6+dfsg-0ubuntu1
- Created in Ubuntu(16.04 LTS)

# About Files
-  /SQL: Contains the Exported Database Schema+Data
- /src/mainlibrary: Contains JAVA source codes
- /MySQL Connector: Contains JDBC/MySQL JConnnector

# Instructions
1) Clone the Project using link https://github.com/EncoSier/DBISProject.git or Download the zip

2) Importing Java Project in NetBeans
- Clone the project in the NetBeans 8.1
- NetBeans->Team->Git->Clone and copy-paste the https://github.com/EncoSier/DBISProject.git link

3) Importing Database(Schema+Data)
- Import the Database in the MySQL database using MySQL WorkBench(Version is mentioned above)
- MySQL Workbench->Data Import/Restore->Load Folder Contents->SQL->exportdb.sql

4) Connect the JDBC driver(JConnector) by including the it's JAR File in the Project
- Expand Project->Libraries->(Right Click)ADD JAR File->include file: mysql-connector-java-5.1.40-bin.jar

5) Database setting can be changed
- Expand Project->Source Packages->mainlibrary->DB.java
- Change the Authentication Setting

