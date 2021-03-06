use selfemployment;

-- Create Table statements

CREATE TABLE `clienttbl` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NULL,
  `status` INT,
  `rate` DECIMAL(5,2),
  `addressid` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
); 
ALTER TABLE `clienttbl` ADD `status` INT;
ALTER TABLE `clienttbl` ADD `rate` float NOT NULL DEFAULT '0';
ALTER TABLE `clienttbl` MODIFY `rate` DECIMAL(5,2)



CREATE TABLE `projecttbl` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
	`clientid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NULL,
  `status` INT,
  PRIMARY KEY (`id`)
); 
ALTER TABLE `projecttbl` ADD `status` INT;

CREATE TABLE `contactstbl` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
	`clientid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NULL,
  `title` varchar(255) NULL,	
  `mobilephone` varchar(255) DEFAULT NULL,
	`deskphone` varchar(255) DEFAULT NULL,
	`email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
); 

CREATE TABLE `projectdailytimetbl` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
	`projectid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `enterdate` datetime DEFAULT NULL,
  `starttime` datetime DEFAULT NULL,	
  `stoptime` datetime DEFAULT NULL,
	`timeinterval` float NOT NULL DEFAULT '0',
	`intervaldescription` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
); 
ALTER TABLE projectdailytimetbl CHANGE `interval` timeinterval bigint(20) unsigned NOT NULL DEFAULT '0'
ALTER TABLE projectdailytimetbl CHANGE timeinterval timeinterval float NOT NULL DEFAULT '0',

CREATE TABLE `addresstbl` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- Insert Statements

-- Museum of science
INSERT INTO `selfemployment`.`clienttbl`
(`name`,`addressid`)
VALUES
("Museum of Science",1);

-- Health Allianze
INSERT INTO `selfemployment`.`clienttbl`
(`name`,`addressid`)
VALUES
("Health Allianze",2);

-- Toura
INSERT INTO `selfemployment`.`projecttbl`
(`clientid`,`name`)
VALUES
(1,"Toura");
-- Fluid survey
INSERT INTO `selfemployment`.`projecttbl`
(`clientid`,`name`)
VALUES
(1,"Fluid Surveys");
-- Fluid survey
INSERT INTO `selfemployment`.`projecttbl`
(`clientid`,`name`)
VALUES
(1,"Bronto");


-- Development
INSERT INTO `selfemployment`.`projecttbl`
(`clientid`,`name`)
VALUES
(2,"Development");
-- Environment Setup
INSERT INTO `selfemployment`.`projecttbl`
(`clientid`,`name`)
VALUES
(2,"Environment Setup");

-- Marc Check
INSERT INTO `selfemployment`.`contactstbl`
(`clientid`,`name`,`title`,`mobilephone`,`deskphone`,`email`)
VALUES
(1,"Marc Check","VP of IT","(585) 755-8622","(617) 589-4279","mcheck@mos.org");

-- Ben Wilson
INSERT INTO `selfemployment`.`contactstbl`
(`clientid`,`name`,`title`,`mobilephone`,`deskphone`,`email`)
VALUES
(1,"Ben Wilson","IT Manager","(585) 506-7765","","bwilson@mos.org");

-- Arika Madouros-Prime
INSERT INTO `selfemployment`.`contactstbl`
(`clientid`,`name`,`title`,`mobilephone`,`deskphone`,`email`)
VALUES
(1,"Arika Madouros-Prime","Sr Web Developer","","(617) 589-0235","amadouros@mos.org");

-- Tarry Cutler
INSERT INTO `selfemployment`.`contactstbl`
(`clientid`,`name`,`title`,`mobilephone`,`deskphone`,`email`)
VALUES
(2,"Tarry Cutler","VP of Product Design","(781) 342-0204","","TCutler@healthallianze.com");

-- mos client address
INSERT INTO `selfemployment`.`addresstbl`
(`address1`,`city`,`state`,`zip`)
VALUES
("1 Science Park","Boston","MA","02114");

-- Tarry Cutlers house
INSERT INTO `selfemployment`.`addresstbl`
(`address1`,`city`,`state`,`zip`)
VALUES
("5 Masconomo St","Manchetsre","MA","01944");

INSERT INTO `selfemployment`.`projectdailytimetbl`
(`projectid`,`enterdate`,`starttime`,`stoptime`,`intervaldescription`)
VALUES
(<{projectid: 0}>,<{enterdate: }>,<{starttime: }>,<{stoptime: }>,<{intervaldescription: }>);

-- delete statement
DELETE FROM projectdailytimetbl
WHERE id = <{value}>


















