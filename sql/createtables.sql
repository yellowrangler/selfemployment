use selfemployment;

CREATE TABLE `clienttbl` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NULL,
  `addressid` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
); 

CREATE TABLE `projecttbl` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
	`clientid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NULL,
  `title` varchar(255) NULL,	
  `phonenumber` varchar(255) DEFAULT NULL,
	`email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
); 

CREATE TABLE `projectdailytimetbl` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
	`projectid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `enterdate` date DEFAULT NULL,
  `starttime` date DEFAULT NULL,	
  `stoptime` date DEFAULT NULL,
	`intervaldescription` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
); 

CREATE TABLE `addresstbl` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
);