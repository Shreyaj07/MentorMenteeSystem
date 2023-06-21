-- MySQL dump 10.10
--
-- Host: localhost    Database: mentor_meeting
-- ------------------------------------------------------
-- Server version	5.0.22-community-nt

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
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
CREATE TABLE `attendance` (
  `srno` int(10) NOT NULL auto_increment,
  `stud_id` int(10) NOT NULL,
  `subject_name` varchar(20) NOT NULL,
  `att_percentage` float NOT NULL,
  `marks` int(10) NOT NULL,
  `stud_name` varchar(45) default NULL,
  PRIMARY KEY  (`srno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `attendance`
--


/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
LOCK TABLES `attendance` WRITE;
INSERT INTO `attendance` VALUES (3,6,'Maths',60,69,'sandip');
UNLOCK TABLES;
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;

--
-- Table structure for table `meeting_attendance`
--

DROP TABLE IF EXISTS `meeting_attendance`;
CREATE TABLE `meeting_attendance` (
  `srno` int(10) NOT NULL auto_increment,
  `stud_id` int(10) NOT NULL,
  `meeting_date` varchar(30) NOT NULL,
  `present` int(10) NOT NULL,
  `stud_name` varchar(45) default NULL,
  PRIMARY KEY  (`srno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `meeting_attendance`
--


/*!40000 ALTER TABLE `meeting_attendance` DISABLE KEYS */;
LOCK TABLES `meeting_attendance` WRITE;
INSERT INTO `meeting_attendance` VALUES (4,1,'23/01/2016',56,'sonali');
UNLOCK TABLES;
/*!40000 ALTER TABLE `meeting_attendance` ENABLE KEYS */;

--
-- Table structure for table `mentor_registration`
--

DROP TABLE IF EXISTS `mentor_registration`;
CREATE TABLE `mentor_registration` (
  `mentor_id` int(10) NOT NULL auto_increment,
  `name` varchar(30) NOT NULL,
  `contact` double NOT NULL,
  `email` varchar(30) NOT NULL,
  `age` int(11) default NULL,
  `gender` varchar(20) NOT NULL,
  `branch` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY  (`mentor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mentor_registration`
--


/*!40000 ALTER TABLE `mentor_registration` DISABLE KEYS */;
LOCK TABLES `mentor_registration` WRITE;
INSERT INTO `mentor_registration` VALUES (1,'sonali',8798787678,'sonali@gmail.com',NULL,'female','IT','111'),(2,'jagruti',8798787678,'jags@gmail.com',NULL,'female','IT','111'),(3,'Dipali',7767656767,'dipa@gmail.com',NULL,'female','IT','111'),(4,'Kishor Kadam',7276763516,'kadamk33@gmail.com',NULL,'male','IT','kadam@123'),(5,'Kishor Kadam',7276763516,'kadamk33@gmail.com',NULL,'male','IT','kadam@123'),(6,'Kishor Kadam',7276763516,'kadamk33@gmail.com',NULL,'male','IT','kadam@123'),(7,'Kishor Kadam',7276763516,'kadamk33@gmail.com',NULL,'male','IT','kadam@123');
UNLOCK TABLES;
/*!40000 ALTER TABLE `mentor_registration` ENABLE KEYS */;

--
-- Table structure for table `registration`
--

DROP TABLE IF EXISTS `registration`;
CREATE TABLE `registration` (
  `mentor_id` int(10) NOT NULL auto_increment,
  `name` varchar(45) default NULL,
  `contact` double default NULL,
  `email` varchar(45) default NULL,
  `gender` varchar(20) default NULL,
  `branch` varchar(30) default NULL,
  `password` varchar(100) default NULL,
  PRIMARY KEY  (`mentor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registration`
--


/*!40000 ALTER TABLE `registration` DISABLE KEYS */;
LOCK TABLES `registration` WRITE;
INSERT INTO `registration` VALUES (1,'Kishor Kadam',7588551792,'kadamk33@gmail.com','male','IT','kadam@123');
UNLOCK TABLES;
/*!40000 ALTER TABLE `registration` ENABLE KEYS */;

--
-- Table structure for table `student_issues`
--

DROP TABLE IF EXISTS `student_issues`;
CREATE TABLE `student_issues` (
  `srno` int(10) NOT NULL auto_increment,
  `issue_date` varchar(30) NOT NULL,
  `issue_description` varchar(60) NOT NULL,
  `stud_id` int(10) NOT NULL,
  `stud_name` varchar(45) default NULL,
  PRIMARY KEY  (`srno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student_issues`
--


/*!40000 ALTER TABLE `student_issues` DISABLE KEYS */;
LOCK TABLES `student_issues` WRITE;
INSERT INTO `student_issues` VALUES (5,'21/01/2016','For Something',6,'sandip');
UNLOCK TABLES;
/*!40000 ALTER TABLE `student_issues` ENABLE KEYS */;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
  `stud_id` int(10) NOT NULL auto_increment,
  `name` varchar(30) NOT NULL,
  `contact` double NOT NULL,
  `email` varchar(30) NOT NULL,
  `age` int(20) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `branch` varchar(30) NOT NULL,
  `year` int(10) NOT NULL,
  PRIMARY KEY  (`stud_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `students`
--


/*!40000 ALTER TABLE `students` DISABLE KEYS */;
LOCK TABLES `students` WRITE;
INSERT INTO `students` VALUES (1,'sonali',8798787678,'sonali@gmail.com',22,'female','IT',2016),(2,'qqq',8798787678,'sonali@gmail.com',22,'male','222',23),(3,'www',8798787678,'sonali@gmail.com',23,'male','rre',2016),(4,'rrr',8798787678,'sonali@gmail.com',2,'male','rrt',2016),(5,'ttt',8798787678,'sonali@gmail.com',23,'male','rer',23),(6,'sandip',9989898789,'sandip@gmail.com',23,'male','Computer',2015);
UNLOCK TABLES;
/*!40000 ALTER TABLE `students` ENABLE KEYS */;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `task_id` int(10) NOT NULL auto_increment,
  `task_date` varchar(30) NOT NULL,
  `task_description` varchar(60) NOT NULL,
  PRIMARY KEY  (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `task`
--


/*!40000 ALTER TABLE `task` DISABLE KEYS */;
LOCK TABLES `task` WRITE;
INSERT INTO `task` VALUES (1,'21/01/2016','fdf dfdf'),(2,'23/01/2016','any task');
UNLOCK TABLES;
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

