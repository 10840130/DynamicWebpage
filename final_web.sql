-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: final_web
-- ------------------------------------------------------
-- Server version	8.0.23

DROP DATABASE IF EXISTS final_web;
CREATE DATABASE final_web;

USE final_web;

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
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `msgid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `msg_title` varchar(45) DEFAULT NULL,
  `mail` varchar(45) DEFAULT NULL,
  `msg_content` varchar(500) DEFAULT NULL,
  `mid` varchar(45) DEFAULT NULL,
  `DATE` datetime DEFAULT NULL,
  `IP` varchar(45) DEFAULT NULL,
  `pid` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`msgid`),
  UNIQUE KEY `msgid_UNIQUE` (`msgid`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (15,'曾彬凱','jjj@gmail.com','四','測試20',NULL,'2021-06-16 00:00:00','0:0:0:0:0:0:0:1','p01'),(16,'邱慶勛','333@gmail.com','測試','test03',NULL,'2021-06-16 00:00:00','0:0:0:0:0:0:0:1','p03'),(17,'','','','',NULL,'2021-06-18 00:00:00','0:0:0:0:0:0:0:1','1'),(18,'123','4','5','6',NULL,'2021-06-18 00:00:00','0:0:0:0:0:0:0:1','1'),(19,'','','','',NULL,'2021-06-18 00:00:00','0:0:0:0:0:0:0:1','1'),(20,'','','','',NULL,'2021-06-18 00:00:00','0:0:0:0:0:0:0:1','1'),(21,'','','','',NULL,'2021-06-18 00:00:00','0:0:0:0:0:0:0:1','1'),(22,'','','','',NULL,'2021-06-18 00:00:00','0:0:0:0:0:0:0:1','1'),(23,'123','456','789','1111',NULL,'2021-06-18 00:00:00','0:0:0:0:0:0:0:1','2'),(24,'陳小姐','kkk@gmail.com','123','服務不錯',NULL,'2021-06-18 00:00:00','0:0:0:0:0:0:0:1','6');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `mid` varchar(45) NOT NULL,
  `pid` varchar(10) NOT NULL,
  `num` int DEFAULT NULL,
  PRIMARY KEY (`mid`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `mid` varchar(45) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `username` varchar(45) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `password` varchar(45) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `phone` varchar(45) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `email` varchar(80) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `address` varchar(300) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `權限` varchar(45) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`mid`),
  UNIQUE KEY `mid_UNIQUE` (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('0000','','0000','0000','',NULL,'管理者'),('1234','曾彬凱','3333','0965879455','3333@gmail.com','新竹縣',NULL);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `oid` int NOT NULL,
  `pid` int NOT NULL,
  `num` int NOT NULL,
  PRIMARY KEY (`oid`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (11,1,3);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `oid` int NOT NULL AUTO_INCREMENT,
  `mid` varchar(45) NOT NULL,
  `pay_time` datetime DEFAULT NULL,
  `pay_way` varchar(45) DEFAULT NULL,
  `receiver_name` varchar(45) DEFAULT NULL,
  `receiver_address` varchar(300) DEFAULT NULL,
  `receiver_phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `oid_UNIQUE` (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (11,'1234','2021-06-19 02:06:03','貨到付款','曾彬凱','新竹縣','0965879455');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `pd_name` varchar(300) DEFAULT NULL,
  `pd_content` varchar(300) DEFAULT NULL,
  `pd_price` int DEFAULT NULL,
  `pd_number` int DEFAULT NULL,
  `pd_sell` int DEFAULT NULL,
  `img1` varchar(300) DEFAULT NULL,
  `img2` varchar(300) DEFAULT NULL,
  `img3` varchar(300) DEFAULT NULL,
  `img4` varchar(300) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  UNIQUE KEY `pid_UNIQUE` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Original T-shirt From DarkCode','Awesome T-shirt For Men',449,100,30,'../assets/img/a2.jpg','../assets/img/a2.1.jpg','../assets/img/a2.2.png','../assets/img/a2.3.jpg','ON'),(2,'Orange Coat','Awesome shirt For Women',450,120,20,'../assets/img/a1.jpg','../assets/img/a1.1.jpg','../assets/img/a1.2.jpg','../assets/img/a1.3.jpg','ON'),(3,'Black Pants','Awesome pants For Women',500,90,40,'../assets/img/a3.jpg','../assets/img/a3.1.jpg','../assets/img/a3.2.jpg','../assets/img/a3.3.jpg','ON'),(4,'Brown Coat','Awesome shirt For Men',700,200,15,'../assets/img/a4.jpg','../assets/img/a4.1.jpg','../assets/img/a4.2.jpg','../assets/img/a4.3.jpg','ON'),(5,'Blue Jacket','Awesome jacket For Men',700,150,10,'../assets/img/a5.jpg','../assets/img/a5.1.jpg','../assets/img/a5.2.jpg','../assets/img/a5.3.jpg','ON'),(6,'Yellow T-shirt','Awesome T-shirt For Women',500,100,17,'../assets/img/a6.jpg','../assets/img/a6.1.jpg','../assets/img/a6.2.jpg','../assets/img/a6.3.jpg','ON'),(9,'654',NULL,532,94,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-19  3:16:59
