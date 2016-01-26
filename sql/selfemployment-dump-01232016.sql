-- MySQL dump 10.15  Distrib 10.0.20-MariaDB, for Linux (i686)
--
-- Host: localhost    Database: selfemployment
-- ------------------------------------------------------
-- Server version	10.0.20-MariaDB

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
-- Table structure for table `addresstbl`
--

DROP TABLE IF EXISTS `addresstbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresstbl` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresstbl`
--

LOCK TABLES `addresstbl` WRITE;
/*!40000 ALTER TABLE `addresstbl` DISABLE KEYS */;
INSERT INTO `addresstbl` (`id`, `address1`, `address2`, `city`, `state`, `zip`) VALUES (1,'1 Science Park','','Boston','MA','02114');
INSERT INTO `addresstbl` (`id`, `address1`, `address2`, `city`, `state`, `zip`) VALUES (2,'5 Masconomo St',NULL,'Manchetsre','MA','01944');
/*!40000 ALTER TABLE `addresstbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clienttbl`
--

DROP TABLE IF EXISTS `clienttbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clienttbl` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `rate` decimal(5,2) DEFAULT NULL,
  `addressid` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clienttbl`
--

LOCK TABLES `clienttbl` WRITE;
/*!40000 ALTER TABLE `clienttbl` DISABLE KEYS */;
INSERT INTO `clienttbl` (`id`, `name`, `status`, `rate`, `addressid`) VALUES (1,'Museum of Science',1,60.00,1);
INSERT INTO `clienttbl` (`id`, `name`, `status`, `rate`, `addressid`) VALUES (2,'Health Allianze',NULL,NULL,2);
/*!40000 ALTER TABLE `clienttbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contactstbl`
--

DROP TABLE IF EXISTS `contactstbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contactstbl` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `clientid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `mobilephone` varchar(255) DEFAULT NULL,
  `deskphone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactstbl`
--

LOCK TABLES `contactstbl` WRITE;
/*!40000 ALTER TABLE `contactstbl` DISABLE KEYS */;
INSERT INTO `contactstbl` (`id`, `clientid`, `name`, `title`, `mobilephone`, `deskphone`, `email`) VALUES (1,1,'Marc Check','VP of IT','(585) 755-8622','(617) 589-4279','mcheck@mos.org');
INSERT INTO `contactstbl` (`id`, `clientid`, `name`, `title`, `mobilephone`, `deskphone`, `email`) VALUES (2,1,'Ben Wilson','IT Manager','(585) 506-7765','(617) 589-0143','bwilson@mos.org');
INSERT INTO `contactstbl` (`id`, `clientid`, `name`, `title`, `mobilephone`, `deskphone`, `email`) VALUES (3,1,'Arika Madouros-Prime','Sr Web Developer','','(617) 589-0235','amadouros@mos.org');
INSERT INTO `contactstbl` (`id`, `clientid`, `name`, `title`, `mobilephone`, `deskphone`, `email`) VALUES (4,2,'Tarry Cutler','VP of Product Design','(781) 342-0204','781-342-0206','TCutler@healthallianze.com');
/*!40000 ALTER TABLE `contactstbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectdailytimetbl`
--

DROP TABLE IF EXISTS `projectdailytimetbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectdailytimetbl` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `projectid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `enterdate` datetime DEFAULT NULL,
  `starttime` datetime DEFAULT NULL,
  `stoptime` datetime DEFAULT NULL,
  `timeinterval` float NOT NULL DEFAULT '0',
  `intervaldescription` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectdailytimetbl`
--

LOCK TABLES `projectdailytimetbl` WRITE;
/*!40000 ALTER TABLE `projectdailytimetbl` DISABLE KEYS */;
INSERT INTO `projectdailytimetbl` (`id`, `projectid`, `enterdate`, `starttime`, `stoptime`, `timeinterval`, `intervaldescription`) VALUES (1,2,'2015-11-12 00:00:00','2015-11-12 09:15:00','2015-11-12 12:25:00',3.2,'Research');
INSERT INTO `projectdailytimetbl` (`id`, `projectid`, `enterdate`, `starttime`, `stoptime`, `timeinterval`, `intervaldescription`) VALUES (2,2,'2015-11-12 00:00:00','2015-11-12 13:45:00','2015-11-12 15:28:00',1.7,'Blah');
INSERT INTO `projectdailytimetbl` (`id`, `projectid`, `enterdate`, `starttime`, `stoptime`, `timeinterval`, `intervaldescription`) VALUES (3,2,'2016-01-19 00:00:00','2016-01-19 13:25:00','2016-01-19 15:35:00',2.2,'Analysis');
INSERT INTO `projectdailytimetbl` (`id`, `projectid`, `enterdate`, `starttime`, `stoptime`, `timeinterval`, `intervaldescription`) VALUES (7,2,'2016-01-20 00:00:00','2016-01-20 09:34:00','2016-01-20 10:00:00',0.4,'test 3');
INSERT INTO `projectdailytimetbl` (`id`, `projectid`, `enterdate`, `starttime`, `stoptime`, `timeinterval`, `intervaldescription`) VALUES (8,2,'2016-01-21 00:00:00','2016-01-21 09:00:00','2016-01-21 11:00:00',2,'Next day');
INSERT INTO `projectdailytimetbl` (`id`, `projectid`, `enterdate`, `starttime`, `stoptime`, `timeinterval`, `intervaldescription`) VALUES (9,2,'2016-01-20 00:00:00','2016-01-20 18:00:00','2016-01-20 19:00:00',1,'test 4');
INSERT INTO `projectdailytimetbl` (`id`, `projectid`, `enterdate`, `starttime`, `stoptime`, `timeinterval`, `intervaldescription`) VALUES (10,1,'2016-01-21 00:00:00','2016-01-21 16:35:00','2016-01-21 18:35:00',2,'toura test');
INSERT INTO `projectdailytimetbl` (`id`, `projectid`, `enterdate`, `starttime`, `stoptime`, `timeinterval`, `intervaldescription`) VALUES (11,4,'2016-01-04 00:00:00','2016-01-04 05:30:00','2016-01-04 20:45:00',15.3,'Big push');
INSERT INTO `projectdailytimetbl` (`id`, `projectid`, `enterdate`, `starttime`, `stoptime`, `timeinterval`, `intervaldescription`) VALUES (12,4,'2016-01-05 00:00:00','2016-01-05 08:23:00','2016-01-05 10:23:00',2,'little push');
INSERT INTO `projectdailytimetbl` (`id`, `projectid`, `enterdate`, `starttime`, `stoptime`, `timeinterval`, `intervaldescription`) VALUES (13,5,'2016-01-19 00:00:00','2016-01-19 08:00:00','2016-01-19 12:00:00',4,'Build server in Manchester');
INSERT INTO `projectdailytimetbl` (`id`, `projectid`, `enterdate`, `starttime`, `stoptime`, `timeinterval`, `intervaldescription`) VALUES (14,5,'2016-01-20 00:00:00','2016-01-20 09:23:00','2016-01-20 22:23:00',13,'Add modem');
INSERT INTO `projectdailytimetbl` (`id`, `projectid`, `enterdate`, `starttime`, `stoptime`, `timeinterval`, `intervaldescription`) VALUES (15,2,'2016-01-23 00:00:00','2016-01-23 10:45:00','2016-01-23 12:13:00',1.5,'Development');
INSERT INTO `projectdailytimetbl` (`id`, `projectid`, `enterdate`, `starttime`, `stoptime`, `timeinterval`, `intervaldescription`) VALUES (16,2,'2016-01-20 00:00:00','2016-01-20 10:45:00','2016-01-20 15:00:00',4.3,'test 1');
/*!40000 ALTER TABLE `projectdailytimetbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projecttbl`
--

DROP TABLE IF EXISTS `projecttbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projecttbl` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `clientid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `contactid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projecttbl`
--

LOCK TABLES `projecttbl` WRITE;
/*!40000 ALTER TABLE `projecttbl` DISABLE KEYS */;
INSERT INTO `projecttbl` (`id`, `clientid`, `contactid`, `name`, `status`) VALUES (1,1,2,'Toura',NULL);
INSERT INTO `projecttbl` (`id`, `clientid`, `contactid`, `name`, `status`) VALUES (2,1,2,'Fluid Surveys',NULL);
INSERT INTO `projecttbl` (`id`, `clientid`, `contactid`, `name`, `status`) VALUES (3,1,3,'Bronto',NULL);
INSERT INTO `projecttbl` (`id`, `clientid`, `contactid`, `name`, `status`) VALUES (4,2,4,'Development',NULL);
INSERT INTO `projecttbl` (`id`, `clientid`, `contactid`, `name`, `status`) VALUES (5,2,4,'Environment Setup',NULL);
/*!40000 ALTER TABLE `projecttbl` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-23 16:04:09
