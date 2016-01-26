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

