-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: employee
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `data_science_team`
--

DROP TABLE IF EXISTS `data_science_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_science_team` (
  `Emp_id` varchar(5) NOT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `Gender` char(1) DEFAULT NULL,
  `Emp_Role` varchar(50) DEFAULT NULL,
  `Dept` varchar(50) DEFAULT NULL,
  `Exp` tinyint DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `Continent` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_science_team`
--

LOCK TABLES `data_science_team` WRITE;
/*!40000 ALTER TABLE `data_science_team` DISABLE KEYS */;
INSERT INTO `data_science_team` VALUES ('E005','Eric','Hoffman','M','LEAD DATA SCIENTIST','FINANCE',11,'USA','NORTH AMERICA'),('E010','William','Butler','M','LEAD DATA SCIENTIST','AUTOMOTIVE',12,'FRANCE','EUROPE'),('E052','Dianna','Wilson','F','SENIOR DATA SCIENTIST','HEALTHCARE',6,'CANADA','NORTH AMERICA'),('E057','Dorothy','Wilson','F','SENIOR DATA SCIENTIST','HEALTHCARE',9,'USA','NORTH AMERICA'),('E204','Karene','Nowak','F','SENIOR DATA SCIENTIST','AUTOMOTIVE',8,'GERMANY','EUROPE'),('E245','Nian','Zhen','M','SENIOR DATA SCIENTIST','RETAIL',6,'CHINA','ASIA'),('E260','Roy','Collins','M','SENIOR DATA SCIENTIST','RETAIL',7,'INDIA','ASIA'),('E403','Steve','Hoffman','M','ASSOCIATE DATA SCIENTIST','FINANCE',4,'USA','NORTH AMERICA'),('E478','David','Smith','M','ASSOCIATE DATA SCIENTIST','RETAIL',3,'COLOMBIA','SOUTH AMERICA'),('E505','Chad','Wilson','M','ASSOCIATE DATA SCIENTIST','HEALTHCARE',5,'CANADA','NORTH AMERICA'),('E532','Claire','Brennan','F','ASSOCIATE DATA SCIENTIST','AUTOMOTIVE',3,'GERMANY','EUROPE'),('E620','Katrina','Allen','F','JUNIOR DATA SCIENTIST','RETAIL',2,'INDIA','ASIA'),('E640','Jenifer','Jhones','F','JUNIOR DATA SCIENTIST','RETAIL',1,'COLOMBIA','SOUTH AMERICA');
/*!40000 ALTER TABLE `data_science_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_record`
--

DROP TABLE IF EXISTS `emp_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp_record` (
  `Emp_id` varchar(5) NOT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `Gender` varchar(2) DEFAULT NULL,
  `Emp_Role` varchar(50) DEFAULT NULL,
  `Dept` varchar(50) DEFAULT NULL,
  `Exp` tinyint DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `Continent` varchar(50) DEFAULT NULL,
  `Salary` int DEFAULT NULL,
  `Emp_rating` tinyint unsigned DEFAULT NULL,
  `Manager_id` varchar(10) DEFAULT NULL,
  `Project_id` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Emp_id`),
  KEY `Manager_id_idx` (`Manager_id`),
  KEY `idx_emp_record_first_name` (`first_name`),
  CONSTRAINT `fk_manager` FOREIGN KEY (`Manager_id`) REFERENCES `emp_record` (`Emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_record`
--

LOCK TABLES `emp_record` WRITE;
/*!40000 ALTER TABLE `emp_record` DISABLE KEYS */;
INSERT INTO `emp_record` VALUES ('E001','Arthur','Black','M','PRESIDENT','ALL',20,'USA','NORTH AMERICA',16500,5,NULL,NULL),('E005','Eric','Hoffman','M','LEAD DATA SCIENTIST','FINANCE',11,'USA','NORTH AMERICA',8500,3,'E103','P105'),('E010','William','Butler','M','LEAD DATA SCIENTIST','AUTOMOTIVE',12,'FRANCE','EUROPE',9000,2,'E428','P204'),('E052','Dianna','Wilson','F','SENIOR DATA SCIENTIST','HEALTHCARE',6,'CANADA','NORTH AMERICA',5500,5,'E083','P103'),('E057','Dorothy','Wilson','F','SENIOR DATA SCIENTIST','HEALTHCARE',9,'USA','NORTH AMERICA',7700,1,'E083','P302'),('E083','Patrick','Voltz','M','MANAGER','HEALTHCARE',15,'USA','NORTH AMERICA',9500,5,'E001',NULL),('E103','Emily','Grove','F','MANAGER','FINANCE',14,'CANADA','NORTH AMERICA',10500,4,'E001',NULL),('E204','Karene','Nowak','F','SENIOR DATA SCIENTIST','AUTOMOTIVE',8,'GERMANY','EUROPE',7500,5,'E428','P204'),('E245','Nian','Zhen','M','SENIOR DATA SCIENTIST','RETAIL',6,'CHINA','ASIA',6500,2,'E583','P109'),('E260','Roy','Collins','M','SENIOR DATA SCIENTIST','RETAIL',7,'INDIA','ASIA',7000,3,'E583','NA'),('E403','Steve','Hoffman','M','ASSOCIATE DATA SCIENTIST','FINANCE',4,'USA','NORTH AMERICA',5000,3,'E103','P105'),('E428','Pete','Allen','M','MANAGER','AUTOMOTIVE',14,'GERMANY','EUROPE',11000,4,'E001',NULL),('E478','David','Smith','M','ASSOCIATE DATA SCIENTIST','RETAIL',3,'COLOMBIA','SOUTH AMERICA',4000,4,'E583','P109'),('E505','Chad','Wilson','M','ASSOCIATE DATA SCIENTIST','HEALTHCARE',5,'CANADA','NORTH AMERICA',5000,2,'E083','P103'),('E532','Claire','Brennan','F','ASSOCIATE DATA SCIENTIST','AUTOMOTIVE',3,'GERMANY','EUROPE',4300,1,'E428','P204'),('E583','Janet','Hale','F','MANAGER','RETAIL',14,'COLOMBIA','SOUTH AMERICA',10000,2,'E001',NULL),('E612','Tracy','Norris','F','MANAGER','RETAIL',13,'INDIA','ASIA',8500,4,'E001',NULL),('E620','Katrina','Allen','F','JUNIOR DATA SCIENTIST','RETAIL',2,'INDIA','ASIA',3000,1,'E612','P406'),('E640','Jenifer','Jhones','F','JUNIOR DATA SCIENTIST','RETAIL',1,'COLOMBIA','SOUTH AMERICA',2800,4,'E612','P406');
/*!40000 ALTER TABLE `emp_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `high_salary_employees`
--

DROP TABLE IF EXISTS `high_salary_employees`;
/*!50001 DROP VIEW IF EXISTS `high_salary_employees`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `high_salary_employees` AS SELECT 
 1 AS `EMP_ID`,
 1 AS `FIRST_NAME`,
 1 AS `LAST_NAME`,
 1 AS `EMP_ROLE`,
 1 AS `DEPT`,
 1 AS `COUNTRY`,
 1 AS `SALARY`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `proj_table`
--

DROP TABLE IF EXISTS `proj_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proj_table` (
  `Project_ID` varchar(10) NOT NULL,
  `Proj_name` varchar(100) DEFAULT NULL,
  `Domain` varchar(45) DEFAULT NULL,
  `Start_date` date DEFAULT NULL,
  `closure_date` date DEFAULT NULL,
  `Dev_Qtr` char(2) DEFAULT NULL,
  `Status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Project_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proj_table`
--

LOCK TABLES `proj_table` WRITE;
/*!40000 ALTER TABLE `proj_table` DISABLE KEYS */;
INSERT INTO `proj_table` VALUES ('P103','Drug Discovery','HEALTHCARE','2021-06-04','2021-06-20','Q1','DONE'),('P105','Fraud Detection','FINANCE','2021-11-04','2021-06-25','Q1','DONE'),('P109','Market Basket Analysis','RETAIL','2021-12-04','2021-06-30','Q1','DELAYED'),('P204','Supply Chain Management','AUTOMOTIVE','2021-07-15','2021-09-28','Q2','WIP'),('P302','Early Detection of Lung Cancer','HEALTHCARE','2021-08-10','2021-12-18','Q3','YTS'),('P406','Customer Sentiment Analysis','RETAIL','2021-09-07','2021-09-24','Q2','WIP');
/*!40000 ALTER TABLE `proj_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `high_salary_employees`
--

/*!50001 DROP VIEW IF EXISTS `high_salary_employees`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `high_salary_employees` AS select `emp_record`.`Emp_id` AS `EMP_ID`,`emp_record`.`first_name` AS `FIRST_NAME`,`emp_record`.`last_name` AS `LAST_NAME`,`emp_record`.`Emp_Role` AS `EMP_ROLE`,`emp_record`.`Dept` AS `DEPT`,`emp_record`.`Country` AS `COUNTRY`,`emp_record`.`Salary` AS `SALARY` from `emp_record` where (`emp_record`.`Salary` > 6000) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-22 11:39:31
