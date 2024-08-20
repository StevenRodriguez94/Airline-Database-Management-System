-- MySQL dump 10.13  Distrib 8.0.33, for macos13 (arm64)
--
-- Host: localhost    Database: travelsystem
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `adminId` varchar(30) DEFAULT NULL,
  `adminPassword` varchar(30) DEFAULT NULL,
  `adminName` varchar(50) DEFAULT NULL,
  `adminDoB` date DEFAULT NULL,
  `adminAddress` varchar(30) DEFAULT NULL,
  `adminPhoneNum` varchar(12) DEFAULT NULL,
  `adminGender` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('jose500','Password500','Jose Reyes','1988-03-18','123 Rodeo Dr.','732-456-7890','M');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aircraft`
--

DROP TABLE IF EXISTS `aircraft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aircraft` (
  `aircraftId` int NOT NULL,
  `airlineId` varchar(2) NOT NULL,
  `numSeats` int DEFAULT NULL,
  PRIMARY KEY (`aircraftId`,`airlineId`),
  KEY `airlineId` (`airlineId`),
  CONSTRAINT `aircraft_ibfk_1` FOREIGN KEY (`airlineId`) REFERENCES `airline` (`airlineId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircraft`
--

LOCK TABLES `aircraft` WRITE;
/*!40000 ALTER TABLE `aircraft` DISABLE KEYS */;
INSERT INTO `aircraft` VALUES (1000,'AA',10),(1001,'AA',10),(1002,'AA',25),(2000,'UA',10),(2001,'UA',10),(2002,'UA',25);
/*!40000 ALTER TABLE `aircraft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aircraftSchedule`
--

DROP TABLE IF EXISTS `aircraftSchedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aircraftSchedule` (
  `aircraftId` int NOT NULL,
  `dayWeek` varchar(15) NOT NULL,
  PRIMARY KEY (`aircraftId`,`dayWeek`),
  CONSTRAINT `aircraftschedule_ibfk_1` FOREIGN KEY (`aircraftId`) REFERENCES `aircraft` (`aircraftId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircraftSchedule`
--

LOCK TABLES `aircraftSchedule` WRITE;
/*!40000 ALTER TABLE `aircraftSchedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `aircraftSchedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airline`
--

DROP TABLE IF EXISTS `airline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airline` (
  `airlineId` varchar(2) NOT NULL,
  `airlineName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`airlineId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airline`
--

LOCK TABLES `airline` WRITE;
/*!40000 ALTER TABLE `airline` DISABLE KEYS */;
INSERT INTO `airline` VALUES ('AA','American Airlines'),('UA','United Airlines');
/*!40000 ALTER TABLE `airline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airlineAirport`
--

DROP TABLE IF EXISTS `airlineAirport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airlineAirport` (
  `airlineId` varchar(2) NOT NULL,
  `airportId` varchar(3) NOT NULL,
  PRIMARY KEY (`airlineId`,`airportId`),
  KEY `airportId` (`airportId`),
  CONSTRAINT `airlineairport_ibfk_1` FOREIGN KEY (`airlineId`) REFERENCES `airline` (`airlineId`),
  CONSTRAINT `airlineairport_ibfk_2` FOREIGN KEY (`airportId`) REFERENCES `airport` (`airportId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airlineAirport`
--

LOCK TABLES `airlineAirport` WRITE;
/*!40000 ALTER TABLE `airlineAirport` DISABLE KEYS */;
INSERT INTO `airlineAirport` VALUES ('AA','BOS'),('AA','CLT'),('UA','DEN'),('UA','EWR'),('AA','ORD'),('UA','ORD');
/*!40000 ALTER TABLE `airlineAirport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airport`
--

DROP TABLE IF EXISTS `airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airport` (
  `airportId` varchar(3) NOT NULL,
  `airportLocation` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`airportId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airport`
--

LOCK TABLES `airport` WRITE;
/*!40000 ALTER TABLE `airport` DISABLE KEYS */;
INSERT INTO `airport` VALUES ('BOS','Boston, MA'),('CLT','Charlotte, NC'),('DEN','Denver, CO'),('EWR','Newark, NJ'),('ORD','Chicago, IL');
/*!40000 ALTER TABLE `airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customerId` varchar(50) NOT NULL,
  `password` varchar(30) DEFAULT NULL,
  `customerName` varchar(50) DEFAULT NULL,
  `customerSSN` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`customerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('gua333','Password333','Guam Suam','098-00-9876'),('hen888','Password888','Henry Williams','456-45-4567'),('john444','Password444','John Cena','098-09-0987'),('ken456','Password456','Ken Vazquez','123-34-4567'),('mary123','Password123','Mary Solace','123-45-6789'),('Wil999','Password999','Wilson Rodriguez','123-12-1234');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerRep`
--

DROP TABLE IF EXISTS `customerRep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customerRep` (
  `repId` varchar(30) NOT NULL,
  `repPassword` varchar(30) DEFAULT NULL,
  `repName` varchar(50) DEFAULT NULL,
  `repDoB` date DEFAULT NULL,
  `repAddress` varchar(30) DEFAULT NULL,
  `repPhoneNum` varchar(12) DEFAULT NULL,
  `repGender` char(1) DEFAULT NULL,
  PRIMARY KEY (`repId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerRep`
--

LOCK TABLES `customerRep` WRITE;
/*!40000 ALTER TABLE `customerRep` DISABLE KEYS */;
INSERT INTO `customerRep` VALUES ('man789','Password789','Manuel Lopez','1997-10-12','789 Street st.','732-456-7890','M');
/*!40000 ALTER TABLE `customerRep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flightoperation`
--

DROP TABLE IF EXISTS `flightoperation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flightoperation` (
  `airlineId` varchar(2) DEFAULT NULL,
  `aircraftId` int DEFAULT NULL,
  `flightnum` int NOT NULL,
  `availableSeats` int DEFAULT NULL,
  `flightDate` date DEFAULT NULL,
  `departTime` time DEFAULT NULL,
  `arrivalTime` time DEFAULT NULL,
  `departAirportId` varchar(3) DEFAULT NULL,
  `destinAirportId` varchar(3) DEFAULT NULL,
  `flightClass` varchar(12) DEFAULT NULL,
  `flightType` varchar(20) DEFAULT NULL,
  `flightPrice` int DEFAULT NULL,
  PRIMARY KEY (`flightnum`),
  KEY `airlineId` (`airlineId`),
  KEY `aircraftId` (`aircraftId`),
  CONSTRAINT `flightoperation_ibfk_1` FOREIGN KEY (`airlineId`) REFERENCES `airline` (`airlineId`),
  CONSTRAINT `flightoperation_ibfk_3` FOREIGN KEY (`aircraftId`) REFERENCES `aircraft` (`aircraftId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flightoperation`
--

LOCK TABLES `flightoperation` WRITE;
/*!40000 ALTER TABLE `flightoperation` DISABLE KEYS */;
INSERT INTO `flightoperation` VALUES ('AA',1000,10000,5,'2023-12-25','12:30:00','15:30:00','BOS','CLT','economy','domestic',200),('UA',2002,10001,23,'2021-01-19','10:00:00','12:30:00','DEN','EWR','first-class','domestic',500),('UA',2002,10002,23,'2021-01-20','11:00:00','13:30:00','EWR','ORD','first-class','domestic',500),('UA',2002,10003,23,'2021-01-21','09:00:00','11:30:00','ORD','DEN','first-class','domestic',500),('UA',2001,10004,10,'2023-12-14','17:00:00','20:00:00','ORD','EWR','business','international',350);
/*!40000 ALTER TABLE `flightoperation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flightTicket`
--

DROP TABLE IF EXISTS `flightTicket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flightTicket` (
  `ticketnum` int NOT NULL,
  `customerId` varchar(50) DEFAULT NULL,
  `totalfare` float DEFAULT NULL,
  `bookingfee` float DEFAULT NULL,
  `purchaseDate` date DEFAULT NULL,
  `purchaseTime` time DEFAULT NULL,
  `seatNum` int DEFAULT NULL,
  `reservationId` int DEFAULT NULL,
  PRIMARY KEY (`ticketnum`),
  KEY `customerId` (`customerId`),
  CONSTRAINT `flightticket_ibfk_2` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flightTicket`
--

LOCK TABLES `flightTicket` WRITE;
/*!40000 ALTER TABLE `flightTicket` DISABLE KEYS */;
INSERT INTO `flightTicket` VALUES (1,'mary123',215,15,'2023-12-05','09:10:25',10,100100),(2,'ken456',215,15,'2023-12-11','19:41:22',9,100100),(3,'john444',215,15,'2023-12-13','19:02:32',8,100100),(4,'Wil999',215,15,'2023-12-13','19:09:29',7,100100),(5,'hen888',215,15,'2023-12-13','19:18:26',6,100100),(6,'mary123',1525,25,'2023-12-13','19:44:23',25,100099),(7,'hen888',1525,25,'2023-12-13','20:13:27',24,100099),(28129,'john444',365,15,'2023-12-13','21:27:17',10,3539);
/*!40000 ALTER TABLE `flightTicket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `question` varchar(150) NOT NULL,
  `answer` varchar(150) DEFAULT NULL,
  `customerId` varchar(50) DEFAULT NULL,
  `repId` varchar(30) DEFAULT NULL,
  `questionNumber` int NOT NULL,
  PRIMARY KEY (`questionNumber`),
  KEY `customerId` (`customerId`),
  KEY `repId` (`repId`),
  CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`),
  CONSTRAINT `questions_ibfk_2` FOREIGN KEY (`repId`) REFERENCES `customerRep` (`repId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES ('Where can I search for all of my upcoming reservations?','There is a textField that you can fill when you login as a customer, it says \"All upcoming reservations\". Hope this helped','ken456','man789',1),('Hello! Where can I search for my past reservations? Thank You!',NULL,'john444',NULL,2),('Hello! Where can I go to find any posted question by a specific keyword? Thank You!',NULL,'john444',NULL,3),('Hello. What is the best airline to fly for people with kids? thank you',NULL,'ken456',NULL,4);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservationList`
--

DROP TABLE IF EXISTS `reservationList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservationList` (
  `reservationId` int NOT NULL,
  `flight1` int DEFAULT NULL,
  `flight2` int DEFAULT NULL,
  `flight3` int DEFAULT NULL,
  `flightKind` varchar(15) DEFAULT NULL,
  `tripPrice` int DEFAULT NULL,
  `numStops` int DEFAULT NULL,
  `arrivalTime` time DEFAULT NULL,
  `totalFlightDuration` int DEFAULT NULL,
  `airlineId` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`reservationId`),
  KEY `flight1` (`flight1`),
  KEY `flight2` (`flight2`),
  KEY `flight3` (`flight3`),
  KEY `airlineId` (`airlineId`),
  CONSTRAINT `reservationlist_ibfk_1` FOREIGN KEY (`flight1`) REFERENCES `flightoperation` (`flightnum`),
  CONSTRAINT `reservationlist_ibfk_2` FOREIGN KEY (`flight2`) REFERENCES `flightoperation` (`flightnum`),
  CONSTRAINT `reservationlist_ibfk_3` FOREIGN KEY (`flight3`) REFERENCES `flightoperation` (`flightnum`),
  CONSTRAINT `reservationlist_ibfk_4` FOREIGN KEY (`airlineId`) REFERENCES `Airline` (`airlineId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservationList`
--

LOCK TABLES `reservationList` WRITE;
/*!40000 ALTER TABLE `reservationList` DISABLE KEYS */;
INSERT INTO `reservationList` VALUES (100099,10001,10002,10003,'round-trip',1500,3,'11:30:00',8,'UA'),(100100,10000,NULL,NULL,'one-way',200,1,'15:30:00',3,'AA'),(100101,10004,NULL,NULL,'one-way',350,1,'20:00:00',3,'UA');
/*!40000 ALTER TABLE `reservationList` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-20 14:08:30
