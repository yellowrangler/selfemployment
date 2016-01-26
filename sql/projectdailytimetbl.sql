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