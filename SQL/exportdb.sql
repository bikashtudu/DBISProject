CREATE DATABASE  IF NOT EXISTS `library` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `library`;
-- MySQL dump 10.13  Distrib 5.7.16, for Linux (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	5.7.16-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Book_Count`
--

DROP TABLE IF EXISTS `Book_Count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Book_Count` (
  `BookNo` int(11) DEFAULT '0',
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Book_Count`
--

LOCK TABLES `Book_Count` WRITE;
/*!40000 ALTER TABLE `Book_Count` DISABLE KEYS */;
INSERT INTO `Book_Count` VALUES (1,1),(2,2),(0,3);
/*!40000 ALTER TABLE `Book_Count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Books`
--

DROP TABLE IF EXISTS `Books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Books` (
  `BookID` int(11) NOT NULL AUTO_INCREMENT,
  `BookName` varchar(50) NOT NULL,
  `Genre` varchar(10) NOT NULL,
  `Author` varchar(30) DEFAULT NULL,
  `Publisher` varchar(30) DEFAULT NULL,
  `Shelf` varchar(5) NOT NULL,
  `Row` varchar(5) NOT NULL,
  PRIMARY KEY (`BookID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Books`
--

LOCK TABLES `Books` WRITE;
/*!40000 ALTER TABLE `Books` DISABLE KEYS */;
INSERT INTO `Books` VALUES (3,'Harry Potter and Goblet of Fire','Fiction','J. K. Rowling','Pottermore','12','B'),(4,'Harry Potter and Deathly Hallow','Fiction','J. K. Rowling','Pottermore','D','23'),(5,'Famous Five','sd','ds','dsd','A','3'),(6,'akhjkd','hdfdj','jkshdkjh','hkjdfh','hj','d'),(13,'The da Vinci Code','Thriller','Dan Brown','Doubleday','r','5'),(14,'Pride and Prejudice','Romantic','Alexander Dumas','Pearson','a','9'),(15,'To Kill A Mocking Bird','Emotional','Harper Lee','McGraw','z','8'),(16,'The Perks Of being A Wallflower','Drama','Stephen Chbosky','Klett','g','1'),(17,'The Hunger Games','Action','Suzanne Collins','Pearson','t','7'),(18,'Madhushala','Life','H R Bacchan','Pushpalata','h','6'),(19,'V for Vendetta ','Action','Alan Moore','Cambridge','a','9');
/*!40000 ALTER TABLE `Books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FullName`
--

DROP TABLE IF EXISTS `FullName`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FullName` (
  `UserID` int(11) DEFAULT NULL,
  `FirstName` varchar(30) NOT NULL,
  `LastName` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FullName`
--

LOCK TABLES `FullName` WRITE;
/*!40000 ALTER TABLE `FullName` DISABLE KEYS */;
/*!40000 ALTER TABLE `FullName` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IssuedBook`
--

DROP TABLE IF EXISTS `IssuedBook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IssuedBook` (
  `BookID` int(11) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL,
  `IssueDate` date NOT NULL,
  `ReturnDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IssuedBook`
--

LOCK TABLES `IssuedBook` WRITE;
/*!40000 ALTER TABLE `IssuedBook` DISABLE KEYS */;
INSERT INTO `IssuedBook` VALUES (5,1,'2016-11-17','2016-12-02'),(12,2,'2016-11-17','2016-12-02'),(6,2,'2016-11-17','2016-12-02');
/*!40000 ALTER TABLE `IssuedBook` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `library`.`IssuedBook_AFTER_INSERT` AFTER INSERT ON `IssuedBook` FOR EACH ROW
BEGIN
 UPDATE Book_Count 
  SET BookNo = BookNo+1
  where UserID = NEW.UserID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER count AFTER DELETE on IssuedBook
FOR EACH ROW
BEGIN
  UPDATE Book_Count 
  SET BookNo = BookNo-1
  where Book_Count.UserID = OLD.UserID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `IssuedMagazine`
--

DROP TABLE IF EXISTS `IssuedMagazine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IssuedMagazine` (
  `MagID` int(11) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL,
  `IssueDate` date NOT NULL,
  `ReturnDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IssuedMagazine`
--

LOCK TABLES `IssuedMagazine` WRITE;
/*!40000 ALTER TABLE `IssuedMagazine` DISABLE KEYS */;
/*!40000 ALTER TABLE `IssuedMagazine` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `library`.`IssuedMagazine_AFTER_INSERT` AFTER INSERT ON `IssuedMagazine` FOR EACH ROW
BEGIN
UPDATE Book_Count
SET BookNo = BookNo +1 
where Book_Count.UserID = NEW.UserID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `library`.`IssuedMagazine_AFTER_DELETE` AFTER DELETE ON `IssuedMagazine` FOR EACH ROW
BEGIN
UPDATE Book_Count
SET BookNo = BookNo
where Book_Count.UserID = OLD.UserID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Librarian`
--

DROP TABLE IF EXISTS `Librarian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Librarian` (
  `LibrarianID` int(11) NOT NULL AUTO_INCREMENT,
  `FullName` varchar(30) NOT NULL,
  `UserName` varchar(30) NOT NULL,
  `Password` varchar(30) NOT NULL,
  `Email` varchar(30) NOT NULL,
  PRIMARY KEY (`LibrarianID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Librarian`
--

LOCK TABLES `Librarian` WRITE;
/*!40000 ALTER TABLE `Librarian` DISABLE KEYS */;
INSERT INTO `Librarian` VALUES (1,'Enco Sier','Encosier','1234','enco.cs.doc@gmail.com'),(2,'Leloush Britannia','Zero','9876','leloush.zero@bitannia.com');
/*!40000 ALTER TABLE `Librarian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Magazine`
--

DROP TABLE IF EXISTS `Magazine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Magazine` (
  `MagID` int(11) NOT NULL AUTO_INCREMENT,
  `VolNo` int(11) NOT NULL,
  `Mname` varchar(30) NOT NULL,
  `Magazine` varchar(30) NOT NULL,
  `MagazineShelf` varchar(10) NOT NULL,
  `Genre` varchar(10) NOT NULL,
  `Publisher` varchar(10) NOT NULL,
  PRIMARY KEY (`MagID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Magazine`
--

LOCK TABLES `Magazine` WRITE;
/*!40000 ALTER TABLE `Magazine` DISABLE KEYS */;
/*!40000 ALTER TABLE `Magazine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Publisher`
--

DROP TABLE IF EXISTS `Publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Publisher` (
  `PublisherID` int(11) NOT NULL AUTO_INCREMENT,
  `PublisherName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`PublisherID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Publisher`
--

LOCK TABLES `Publisher` WRITE;
/*!40000 ALTER TABLE `Publisher` DISABLE KEYS */;
INSERT INTO `Publisher` VALUES (1,'hjkhdkj'),(2,'Pottermore'),(3,'dsd'),(4,'Whittaker'),(5,'ewhkje'),(6,'dhskj'),(7,'hkjdfh'),(8,'gsjf'),(9,'dshh'),(10,'gdsh'),(11,'Water'),(12,'ew'),(13,'dgjs'),(14,'SGAJ'),(15,'WHOKNOW'),(16,'Doubleday'),(17,'Pearson'),(18,'McGraw'),(19,'Klett'),(20,'Pushpalata'),(21,'Cambridge'),(22,'TMH');
/*!40000 ALTER TABLE `Publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `UserPass` varchar(30) NOT NULL,
  `RegDate` date NOT NULL,
  `UserName` varchar(30) NOT NULL,
  `Email` varchar(30) NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'1234','2012-05-15','Deco','deco@gmail.com'),(2,'12345678','2016-11-07','Piyush','pkalkute@gmail.com'),(3,'012345','2016-11-25','NewHero','newhero@gmail.com');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `library`.`Users_AFTER_INSERT` AFTER INSERT ON `Users` FOR EACH ROW
BEGIN
INSERT INTO Book_Count
values(0,New.UserID);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'library'
--

--
-- Dumping routines for database 'library'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-25 23:14:20
