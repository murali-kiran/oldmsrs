-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: localhost    Database: oldmsrs
-- ------------------------------------------------------
-- Server version	5.7.17

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
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment` (
  `appointmentid` int(11) NOT NULL AUTO_INCREMENT,
  `beneficiary` int(11) NOT NULL,
  `nature` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 for regular, 1 for emergency',
  `appointmenttypeid` int(11) NOT NULL,
  `details` varchar(450) DEFAULT NULL,
  `appointmentdate` datetime NOT NULL,
  `hospitaltype` int(11) NOT NULL,
  `hospitalid` int(11) DEFAULT NULL,
  `hospitalname` varchar(500) DEFAULT NULL,
  `doctorname` varchar(500) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `department` varchar(45) DEFAULT NULL,
  `emailid` varchar(500) DEFAULT NULL,
  `createdtime` datetime NOT NULL,
  `modifiedtime` timestamp NOT NULL,
  PRIMARY KEY (`appointmentid`),
  KEY `fk_appointment_1_idx` (`beneficiary`),
  KEY `fk_appointment_2_idx` (`appointmenttypeid`),
  CONSTRAINT `fk_appointment_1` FOREIGN KEY (`beneficiary`) REFERENCES `emp` (`empid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_appointment_2` FOREIGN KEY (`appointmenttypeid`) REFERENCES `appointment_type` (`appointmenttypeid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_type`
--

DROP TABLE IF EXISTS `appointment_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment_type` (
  `appointmenttypeid` int(11) NOT NULL AUTO_INCREMENT,
  `appointmenttype` varchar(45) NOT NULL,
  `createdtime` datetime NOT NULL,
  `modifiedtime` timestamp NOT NULL,
  PRIMARY KEY (`appointmenttypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_type`
--

LOCK TABLES `appointment_type` WRITE;
/*!40000 ALTER TABLE `appointment_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authorities`
--

DROP TABLE IF EXISTS `authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authorities` (
  `username` varchar(256) NOT NULL,
  `authority` varchar(256) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorities`
--

LOCK TABLES `authorities` WRITE;
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;
/*!40000 ALTER TABLE `authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claim`
--

DROP TABLE IF EXISTS `claim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claim` (
  `claimid` int(11) NOT NULL AUTO_INCREMENT,
  `claimtypeid` int(11) NOT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `beneficiary` int(11) NOT NULL,
  `dateofoccurance` date NOT NULL,
  `document` varchar(45) DEFAULT NULL,
  `auditby` varchar(1000) DEFAULT NULL,
  `status` varchar(100) NOT NULL,
  `createdtime` datetime NOT NULL,
  `modifiedtime` timestamp NOT NULL,
  `auditcomments` varchar(1000) DEFAULT NULL,
  `activeappointment` tinyint(1) NOT NULL,
  `prognosis` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`claimid`),
  KEY `fk_claim_1_idx` (`claimtypeid`),
  KEY `fk_claim_2_idx` (`beneficiary`),
  CONSTRAINT `fk_claim_1` FOREIGN KEY (`claimtypeid`) REFERENCES `claim_type` (`claimtypeid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_claim_2` FOREIGN KEY (`beneficiary`) REFERENCES `emp` (`empid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claim`
--

LOCK TABLES `claim` WRITE;
/*!40000 ALTER TABLE `claim` DISABLE KEYS */;
/*!40000 ALTER TABLE `claim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claim_type`
--

DROP TABLE IF EXISTS `claim_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claim_type` (
  `claimtypeid` int(11) NOT NULL AUTO_INCREMENT,
  `claimtype` varchar(45) NOT NULL,
  `createdtime` datetime NOT NULL,
  `modifiedtime` datetime NOT NULL,
  PRIMARY KEY (`claimtypeid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claim_type`
--

LOCK TABLES `claim_type` WRITE;
/*!40000 ALTER TABLE `claim_type` DISABLE KEYS */;
INSERT INTO `claim_type` VALUES (1,'Fever','2017-02-05 19:29:54','2017-02-05 19:29:54');
/*!40000 ALTER TABLE `claim_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependent`
--

DROP TABLE IF EXISTS `dependent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dependent` (
  `dependentid` int(11) NOT NULL AUTO_INCREMENT,
  `empid` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `relationship` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `createdtime` datetime NOT NULL,
  `modifiedtime` timestamp NOT NULL,
  PRIMARY KEY (`dependentid`),
  KEY `fk_nominee_emp_idx` (`empid`),
  CONSTRAINT `fk_nominee_emp` FOREIGN KEY (`empid`) REFERENCES `emp` (`empid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependent`
--

LOCK TABLES `dependent` WRITE;
/*!40000 ALTER TABLE `dependent` DISABLE KEYS */;
INSERT INTO `dependent` VALUES (1,1,'sanju','','','0','0000-00-00',NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,2,'Mur','','','Friend','0000-00-00',NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `dependent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp`
--

DROP TABLE IF EXISTS `emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emp` (
  `empid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `middlename` varchar(100) DEFAULT NULL,
  `gender` tinyint(1) NOT NULL COMMENT '0 for male, 1 for female and 2 for other',
  `dob` date NOT NULL,
  `phone` varchar(45) NOT NULL,
  `email` varchar(500) NOT NULL,
  `adress` varchar(2000) DEFAULT NULL,
  `createdtime` datetime NOT NULL,
  `modifiedtime` timestamp NOT NULL,
  PRIMARY KEY (`empid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp`
--

LOCK TABLES `emp` WRITE;
/*!40000 ALTER TABLE `emp` DISABLE KEYS */;
INSERT INTO `emp` VALUES (1,'','Kiran','Kumar',NULL,0,'1999-01-01','911234567890','kiran@kumar.com','abbc','2017-01-26 00:00:00','2017-03-12 13:04:25'),(2,'','Murali','Raju',NULL,0,'1999-01-01','911234567891','murali@raju.com','c','2017-01-28 15:33:40','2017-01-28 10:03:40'),(3,'','Vagdhan','t',NULL,0,'1899-01-01','921234567891','vagdhan@t.com','c','2017-01-28 15:38:17','2017-01-28 10:08:17'),(4,'','satish','s',NULL,0,'1799-01-01','931234567891','satish@s.com','c','2017-01-28 15:38:53','2017-01-28 10:08:53'),(5,'','satish1','s1',NULL,0,'1799-01-01','931214567891','satish1@s1.com','c','2017-01-28 15:39:16','2017-01-28 10:09:16'),(6,'','datish1','d1',NULL,0,'1799-01-01','941214567891','datish1@d1.com','c','2017-01-28 15:40:47','2017-01-28 10:10:47'),(7,'','satish','b',NULL,0,'1992-01-02','91123456987','satish@b.com','12','2017-02-09 08:01:48','2017-02-09 02:31:48'),(8,'','Muralidhar12','Raju',NULL,0,'1984-01-03','12345678963','murali@code','abb','2017-02-09 00:00:00','2017-02-09 16:41:47'),(9,'Mr','kiran','p','kumar',0,'2000-10-01','911234567896','abc@def.com','checking','2017-04-07 08:38:54','2017-04-07 03:08:54');
/*!40000 ALTER TABLE `emp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_authorities`
--

DROP TABLE IF EXISTS `group_authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_authorities` (
  `group_id` int(12) NOT NULL,
  `authority` varchar(200) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `group_authorities_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_authorities`
--

LOCK TABLES `group_authorities` WRITE;
/*!40000 ALTER TABLE `group_authorities` DISABLE KEYS */;
INSERT INTO `group_authorities` VALUES (1,'ROLE_ADMIN',1);
/*!40000 ALTER TABLE `group_authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_members`
--

DROP TABLE IF EXISTS `group_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(200) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `group_members_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_members`
--

LOCK TABLES `group_members` WRITE;
/*!40000 ALTER TABLE `group_members` DISABLE KEYS */;
INSERT INTO `group_members` VALUES (1,'admin@msrs.com',1);
/*!40000 ALTER TABLE `group_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'Users'),(2,'Administrators');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital`
--

DROP TABLE IF EXISTS `hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hospital` (
  `hospitalid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `hospitaltypeid` int(11) NOT NULL,
  `phone1` varchar(45) DEFAULT NULL,
  `phone2` varchar(45) DEFAULT NULL,
  `faxno` varchar(45) DEFAULT NULL,
  `emailid` varchar(500) DEFAULT NULL,
  `workingdays` varchar(500) DEFAULT NULL,
  `workinghours` varchar(45) DEFAULT NULL,
  `addressline1` varchar(100) DEFAULT NULL,
  `addressline2` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `district` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `createdtime` datetime NOT NULL,
  `modifiedtime` timestamp NOT NULL,
  PRIMARY KEY (`hospitalid`),
  KEY `fk_hospital_1_idx` (`hospitaltypeid`),
  CONSTRAINT `fk_hospital_1` FOREIGN KEY (`hospitaltypeid`) REFERENCES `hospital_type` (`hospitaltypeid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital`
--

LOCK TABLES `hospital` WRITE;
/*!40000 ALTER TABLE `hospital` DISABLE KEYS */;
/*!40000 ALTER TABLE `hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital_account`
--

DROP TABLE IF EXISTS `hospital_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hospital_account` (
  `hospitalaccountid` int(11) NOT NULL AUTO_INCREMENT,
  `hospitalid` int(11) NOT NULL,
  `accountnumber` varchar(45) NOT NULL,
  `bank` varchar(100) NOT NULL,
  `branch` varchar(45) NOT NULL,
  `ifsccode` varchar(45) NOT NULL,
  `createdtime` datetime NOT NULL,
  `modifiedtime` timestamp NOT NULL,
  PRIMARY KEY (`hospitalaccountid`),
  KEY `fk_hospital_account_1_idx` (`hospitalid`),
  CONSTRAINT `fk_hospital_account_1` FOREIGN KEY (`hospitalid`) REFERENCES `hospital` (`hospitalid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital_account`
--

LOCK TABLES `hospital_account` WRITE;
/*!40000 ALTER TABLE `hospital_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `hospital_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital_department`
--

DROP TABLE IF EXISTS `hospital_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hospital_department` (
  `hospitaldepartmentid` int(11) NOT NULL AUTO_INCREMENT,
  `hospitalid` int(11) NOT NULL,
  `department` varchar(500) NOT NULL,
  `createdtime` datetime NOT NULL,
  `modifiedtime` timestamp NOT NULL,
  PRIMARY KEY (`hospitaldepartmentid`),
  KEY `fk_hospital_department_1_idx` (`hospitalid`),
  CONSTRAINT `fk_hospital_department_1` FOREIGN KEY (`hospitalid`) REFERENCES `hospital` (`hospitalid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital_department`
--

LOCK TABLES `hospital_department` WRITE;
/*!40000 ALTER TABLE `hospital_department` DISABLE KEYS */;
/*!40000 ALTER TABLE `hospital_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital_type`
--

DROP TABLE IF EXISTS `hospital_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hospital_type` (
  `hospitaltypeid` int(11) NOT NULL AUTO_INCREMENT,
  `hospitaltype` varchar(45) NOT NULL,
  `createdtime` datetime NOT NULL,
  `modifiedtime` timestamp NOT NULL,
  PRIMARY KEY (`hospitaltypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital_type`
--

LOCK TABLES `hospital_type` WRITE;
/*!40000 ALTER TABLE `hospital_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `hospital_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `username` varchar(256) NOT NULL,
  `password` varchar(256) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('admin@msrs.com','admin',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-07 22:26:47
