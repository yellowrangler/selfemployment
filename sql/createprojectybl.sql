DROP TABLE IF EXISTS `projecttbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projecttbl` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `clientid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `contactid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,  
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