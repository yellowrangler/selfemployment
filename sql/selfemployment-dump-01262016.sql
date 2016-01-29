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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresstbl`
--

LOCK TABLES `addresstbl` WRITE;
/*!40000 ALTER TABLE `addresstbl` DISABLE KEYS */;
INSERT INTO `addresstbl` (`id`, `address1`, `address2`, `city`, `state`, `zip`) VALUES (1,'1 Science Park','','Boston','MA','02114');
INSERT INTO `addresstbl` (`id`, `address1`, `address2`, `city`, `state`, `zip`) VALUES (2,'5 Masconomo St','','Manchetsre','MA','01944');
INSERT INTO `addresstbl` (`id`, `address1`, `address2`, `city`, `state`, `zip`) VALUES (3,'test address1','test address2','testcity','AZ','99999');
INSERT INTO `addresstbl` (`id`, `address1`, `address2`, `city`, `state`, `zip`) VALUES (4,'tst2','','city2','CA','88888');
INSERT INTO `addresstbl` (`id`, `address1`, `address2`, `city`, `state`, `zip`) VALUES (5,'ddddd','','ddddd','AL','22222');
INSERT INTO `addresstbl` (`id`, `address1`, `address2`, `city`, `state`, `zip`) VALUES (6,'zzzzzzz','zzzzz','zzzzzz','AL','11111');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clienttbl`
--

LOCK TABLES `clienttbl` WRITE;
/*!40000 ALTER TABLE `clienttbl` DISABLE KEYS */;
INSERT INTO `clienttbl` (`id`, `name`, `status`, `rate`, `addressid`) VALUES (1,'Museum of Science',1,60.00,1);
INSERT INTO `clienttbl` (`id`, `name`, `status`, `rate`, `addressid`) VALUES (2,'Health Allianze',1,20.00,2);
INSERT INTO `clienttbl` (`id`, `name`, `status`, `rate`, `addressid`) VALUES (3,'test tarry',1,100.00,0);
INSERT INTO `clienttbl` (`id`, `name`, `status`, `rate`, `addressid`) VALUES (4,'test 2',1,1.00,0);
INSERT INTO `clienttbl` (`id`, `name`, `status`, `rate`, `addressid`) VALUES (5,'dddddd',1,2.00,0);
INSERT INTO `clienttbl` (`id`, `name`, `status`, `rate`, `addressid`) VALUES (6,'zzzzzzzz',1,2.00,0);
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
-- Table structure for table `invoicepaymenttbl`
--

DROP TABLE IF EXISTS `invoicepaymenttbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoicepaymenttbl` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `invoiceid` int(11) DEFAULT NULL,
  `amountpaid` decimal(10,2) DEFAULT NULL,
  `paiddate` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoicepaymenttbl`
--

LOCK TABLES `invoicepaymenttbl` WRITE;
/*!40000 ALTER TABLE `invoicepaymenttbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoicepaymenttbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoicetbl`
--

DROP TABLE IF EXISTS `invoicetbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoicetbl` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `invoicenumber` varchar(255) DEFAULT NULL,
  `projectid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `invoicedate` datetime DEFAULT NULL,
  `amountinvoiced` decimal(10,2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoicetbl`
--

LOCK TABLES `invoicetbl` WRITE;
/*!40000 ALTER TABLE `invoicetbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoicetbl` ENABLE KEYS */;
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
  `invoiceid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectdailytimetbl`
--

LOCK TABLES `projectdailytimetbl` WRITE;
/*!40000 ALTER TABLE `projectdailytimetbl` DISABLE KEYS */;
INSERT INTO `projectdailytimetbl` (`id`, `projectid`, `enterdate`, `starttime`, `stoptime`, `timeinterval`, `intervaldescription`, `invoiceid`) VALUES (1,2,'2015-11-12 00:00:00','2015-11-12 09:15:00','2015-11-12 12:25:00',3.2,'Research',NULL);
INSERT INTO `projectdailytimetbl` (`id`, `projectid`, `enterdate`, `starttime`, `stoptime`, `timeinterval`, `intervaldescription`, `invoiceid`) VALUES (2,2,'2015-11-12 00:00:00','2015-11-12 13:45:00','2015-11-12 15:28:00',1.7,'Blah',NULL);
INSERT INTO `projectdailytimetbl` (`id`, `projectid`, `enterdate`, `starttime`, `stoptime`, `timeinterval`, `intervaldescription`, `invoiceid`) VALUES (3,2,'2016-01-19 00:00:00','2016-01-19 13:25:00','2016-01-19 15:35:00',2.2,'Analysis',NULL);
INSERT INTO `projectdailytimetbl` (`id`, `projectid`, `enterdate`, `starttime`, `stoptime`, `timeinterval`, `intervaldescription`, `invoiceid`) VALUES (7,2,'2016-01-20 00:00:00','2016-01-20 09:34:00','2016-01-20 10:00:00',0.4,'test 3',NULL);
INSERT INTO `projectdailytimetbl` (`id`, `projectid`, `enterdate`, `starttime`, `stoptime`, `timeinterval`, `intervaldescription`, `invoiceid`) VALUES (8,2,'2016-01-21 00:00:00','2016-01-21 09:00:00','2016-01-21 11:00:00',2,'Next day',NULL);
INSERT INTO `projectdailytimetbl` (`id`, `projectid`, `enterdate`, `starttime`, `stoptime`, `timeinterval`, `intervaldescription`, `invoiceid`) VALUES (9,2,'2016-01-20 00:00:00','2016-01-20 17:10:00','2016-01-20 20:15:00',3.1,'test 4 updated again this time by phone',NULL);
INSERT INTO `projectdailytimetbl` (`id`, `projectid`, `enterdate`, `starttime`, `stoptime`, `timeinterval`, `intervaldescription`, `invoiceid`) VALUES (10,1,'2016-01-21 00:00:00','2016-01-21 16:35:00','2016-01-21 18:35:00',2,'toura test',NULL);
INSERT INTO `projectdailytimetbl` (`id`, `projectid`, `enterdate`, `starttime`, `stoptime`, `timeinterval`, `intervaldescription`, `invoiceid`) VALUES (11,4,'2016-01-04 00:00:00','2016-01-04 05:30:00','2016-01-04 20:45:00',15.3,'Big push',NULL);
INSERT INTO `projectdailytimetbl` (`id`, `projectid`, `enterdate`, `starttime`, `stoptime`, `timeinterval`, `intervaldescription`, `invoiceid`) VALUES (12,4,'2016-01-05 00:00:00','2016-01-05 08:23:00','2016-01-05 10:23:00',2,'little push',NULL);
INSERT INTO `projectdailytimetbl` (`id`, `projectid`, `enterdate`, `starttime`, `stoptime`, `timeinterval`, `intervaldescription`, `invoiceid`) VALUES (13,5,'2016-01-19 00:00:00','2016-01-19 08:00:00','2016-01-19 12:00:00',4,'Build server in Manchester',NULL);
INSERT INTO `projectdailytimetbl` (`id`, `projectid`, `enterdate`, `starttime`, `stoptime`, `timeinterval`, `intervaldescription`, `invoiceid`) VALUES (14,5,'2016-01-20 00:00:00','2016-01-20 09:23:00','2016-01-20 22:23:00',13,'Add modem',NULL);
INSERT INTO `projectdailytimetbl` (`id`, `projectid`, `enterdate`, `starttime`, `stoptime`, `timeinterval`, `intervaldescription`, `invoiceid`) VALUES (15,2,'2016-01-23 00:00:00','2016-01-23 10:45:00','2016-01-23 12:13:00',1.5,'Development',NULL);
INSERT INTO `projectdailytimetbl` (`id`, `projectid`, `enterdate`, `starttime`, `stoptime`, `timeinterval`, `intervaldescription`, `invoiceid`) VALUES (18,2,'2016-01-25 00:00:00','2016-01-25 10:35:00','2016-01-25 23:45:00',13.2,'test',NULL);
INSERT INTO `projectdailytimetbl` (`id`, `projectid`, `enterdate`, `starttime`, `stoptime`, `timeinterval`, `intervaldescription`, `invoiceid`) VALUES (19,2,'2016-01-20 00:00:00','2016-01-20 22:23:00','2016-01-20 23:47:00',1.4,'test 1',NULL);
INSERT INTO `projectdailytimetbl` (`id`, `projectid`, `enterdate`, `starttime`, `stoptime`, `timeinterval`, `intervaldescription`, `invoiceid`) VALUES (21,2,'2016-01-20 00:00:00','2016-01-20 06:23:00','2016-01-20 08:00:00',1.6,'test of unfinished work now finished',NULL);
INSERT INTO `projectdailytimetbl` (`id`, `projectid`, `enterdate`, `starttime`, `stoptime`, `timeinterval`, `intervaldescription`, `invoiceid`) VALUES (22,6,'2016-01-22 00:00:00','2016-01-22 10:30:00','2016-01-22 11:30:00',1,'Review and analysis',NULL);
INSERT INTO `projectdailytimetbl` (`id`, `projectid`, `enterdate`, `starttime`, `stoptime`, `timeinterval`, `intervaldescription`, `invoiceid`) VALUES (23,6,'2016-01-23 00:00:00','2016-01-23 16:15:00','2016-01-23 19:00:00',2.75,'More review',NULL);
INSERT INTO `projectdailytimetbl` (`id`, `projectid`, `enterdate`, `starttime`, `stoptime`, `timeinterval`, `intervaldescription`, `invoiceid`) VALUES (24,6,'2016-01-24 00:00:00','2016-01-24 11:30:00','2016-01-24 12:15:00',0.75,'Development',NULL);
INSERT INTO `projectdailytimetbl` (`id`, `projectid`, `enterdate`, `starttime`, `stoptime`, `timeinterval`, `intervaldescription`, `invoiceid`) VALUES (25,6,'2016-01-24 00:00:00','2016-01-24 12:30:00','2016-01-24 13:15:00',0.75,'Development',NULL);
INSERT INTO `projectdailytimetbl` (`id`, `projectid`, `enterdate`, `starttime`, `stoptime`, `timeinterval`, `intervaldescription`, `invoiceid`) VALUES (26,6,'2016-01-25 00:00:00','2016-01-25 13:30:00','2016-01-25 14:30:00',1,'Development and Testing',NULL);
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
  `name` varchar(255) DEFAULT NULL,
  `contactid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `rate` decimal(5,2) DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projecttbl`
--

LOCK TABLES `projecttbl` WRITE;
/*!40000 ALTER TABLE `projecttbl` DISABLE KEYS */;
INSERT INTO `projecttbl` (`id`, `clientid`, `name`, `contactid`, `rate`, `startdate`, `enddate`, `status`) VALUES (1,1,'Toura',2,NULL,NULL,NULL,NULL);
INSERT INTO `projecttbl` (`id`, `clientid`, `name`, `contactid`, `rate`, `startdate`, `enddate`, `status`) VALUES (2,1,'Fluid Surveys',2,NULL,NULL,NULL,NULL);
INSERT INTO `projecttbl` (`id`, `clientid`, `name`, `contactid`, `rate`, `startdate`, `enddate`, `status`) VALUES (3,1,'Bronto',3,NULL,NULL,NULL,NULL);
INSERT INTO `projecttbl` (`id`, `clientid`, `name`, `contactid`, `rate`, `startdate`, `enddate`, `status`) VALUES (4,2,'Development',4,NULL,NULL,NULL,NULL);
INSERT INTO `projecttbl` (`id`, `clientid`, `name`, `contactid`, `rate`, `startdate`, `enddate`, `status`) VALUES (5,2,'Environment Setup',4,NULL,NULL,NULL,NULL);
INSERT INTO `projecttbl` (`id`, `clientid`, `name`, `contactid`, `rate`, `startdate`, `enddate`, `status`) VALUES (6,1,'Fluid Surveys 2016',2,NULL,NULL,NULL,NULL);
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

-- Dump completed on 2016-01-26 12:58:17
