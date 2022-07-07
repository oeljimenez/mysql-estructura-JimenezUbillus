CREATE DATABASE  IF NOT EXISTS `pizzeria` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `pizzeria`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pizzeria
-- ------------------------------------------------------
-- Server version	5.6.42

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
-- Table structure for table `botiga`
--

DROP TABLE IF EXISTS `botiga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `botiga` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adreca` varchar(45) DEFAULT NULL,
  `codi_postal` varchar(5) DEFAULT NULL,
  `localitat_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_botiga_localitat1_idx` (`localitat_id`),
  CONSTRAINT `fk_botiga_localitat1` FOREIGN KEY (`localitat_id`) REFERENCES `localitat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `botiga`
--

LOCK TABLES `botiga` WRITE;
/*!40000 ALTER TABLE `botiga` DISABLE KEYS */;
INSERT INTO `botiga` VALUES (1,'calle 1','08905',1),(2,'calle 2','80812',2);
/*!40000 ALTER TABLE `botiga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id` int(11) NOT NULL DEFAULT '0',
  `nombreCat` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'hawaina');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `cognom` varchar(45) DEFAULT NULL,
  `adreca` varchar(45) DEFAULT NULL,
  `localitat_id1` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_clients_localitat1_idx` (`localitat_id1`),
  CONSTRAINT `fk_clients_localitat1` FOREIGN KEY (`localitat_id1`) REFERENCES `localitat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Leo ','Jimenez','carrer elipse 5',1),(2,'Luna','Ubillus','carrer sant luis 18',2);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comandes`
--

DROP TABLE IF EXISTS `comandes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comandes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_hora` date DEFAULT NULL,
  `tipus_recollida` enum('domicili','botiga') DEFAULT NULL,
  `preu_total` float DEFAULT NULL,
  `tipus` varchar(45) DEFAULT NULL,
  `clients_id` int(11) NOT NULL,
  `botiga_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_comandes_clients1_idx` (`clients_id`),
  KEY `fk_comandes_botiga1_idx` (`botiga_id`),
  CONSTRAINT `fk_comandes_botiga1` FOREIGN KEY (`botiga_id`) REFERENCES `botiga` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comandes_clients1` FOREIGN KEY (`clients_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comandes`
--

LOCK TABLES `comandes` WRITE;
/*!40000 ALTER TABLE `comandes` DISABLE KEYS */;
INSERT INTO `comandes` VALUES (1,'2022-07-07','domicili',20.56,'pizzas',1,1);
/*!40000 ALTER TABLE `comandes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comandesdetall`
--

DROP TABLE IF EXISTS `comandesdetall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comandesdetall` (
  `id` int(11) NOT NULL,
  `comandes_id` int(11) DEFAULT NULL,
  `productes_id` int(11) DEFAULT NULL,
  `quantitat` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_productId_idx` (`productes_id`),
  KEY `fk_comandaId_idx` (`comandes_id`),
  CONSTRAINT `fk_comandaId` FOREIGN KEY (`comandes_id`) REFERENCES `comandes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_productId` FOREIGN KEY (`productes_id`) REFERENCES `productes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comandesdetall`
--

LOCK TABLES `comandesdetall` WRITE;
/*!40000 ALTER TABLE `comandesdetall` DISABLE KEYS */;
INSERT INTO `comandesdetall` VALUES (1,1,1,1);
/*!40000 ALTER TABLE `comandesdetall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleats`
--

DROP TABLE IF EXISTS `empleats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `cognoms` varchar(45) DEFAULT NULL,
  `nif` varchar(45) DEFAULT NULL,
  `telefon` varchar(45) DEFAULT NULL,
  `tipus_empleat` enum('cuiner/a','repartidor/a') DEFAULT NULL,
  `botiga_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_empleats_botiga1_idx` (`botiga_id`),
  CONSTRAINT `fk_empleats_botiga1` FOREIGN KEY (`botiga_id`) REFERENCES `botiga` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleats`
--

LOCK TABLES `empleats` WRITE;
/*!40000 ALTER TABLE `empleats` DISABLE KEYS */;
INSERT INTO `empleats` VALUES (1,'Pedro','Marinez','46466620D','634530623','cuiner/a',1);
/*!40000 ALTER TABLE `empleats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localitat`
--

DROP TABLE IF EXISTS `localitat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localitat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `provincies_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_localitat_provincies_idx` (`provincies_id`),
  CONSTRAINT `fk_localitat_provincies` FOREIGN KEY (`provincies_id`) REFERENCES `provincies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localitat`
--

LOCK TABLES `localitat` WRITE;
/*!40000 ALTER TABLE `localitat` DISABLE KEYS */;
INSERT INTO `localitat` VALUES (1,'Sant Cugat',1),(2,'Blanes',2);
/*!40000 ALTER TABLE `localitat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productes`
--

DROP TABLE IF EXISTS `productes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` enum('pizzes','hamburgueses','begudes') DEFAULT NULL,
  `imatge` blob,
  `preu` float DEFAULT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_productes_categoria1_idx` (`categoria_id`),
  CONSTRAINT `fk_productes_categoria1` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productes`
--

LOCK TABLES `productes` WRITE;
/*!40000 ALTER TABLE `productes` DISABLE KEYS */;
INSERT INTO `productes` VALUES (1,'pizzes',NULL,15,1),(2,'hamburgueses',NULL,18,NULL),(3,'begudes',NULL,3,NULL);
/*!40000 ALTER TABLE `productes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincies`
--

DROP TABLE IF EXISTS `provincies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincies`
--

LOCK TABLES `provincies` WRITE;
/*!40000 ALTER TABLE `provincies` DISABLE KEYS */;
INSERT INTO `provincies` VALUES (1,'Barcelona'),(2,'Girona');
/*!40000 ALTER TABLE `provincies` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-07 23:31:03
