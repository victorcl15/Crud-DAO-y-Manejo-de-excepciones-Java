-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: funcionario
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `familiares`
--

DROP TABLE IF EXISTS `familiares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `familiares` (
  `id_familiar` int(11) NOT NULL AUTO_INCREMENT,
  `id_rolfamiliar` int(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `edad` int(11) NOT NULL,
  `id_grupofamiliar` int(11) NOT NULL,
  PRIMARY KEY (`id_familiar`),
  KEY `id_rolfamiliar` (`id_rolfamiliar`),
  KEY `id_grupofamiliar` (`id_grupofamiliar`),
  CONSTRAINT `familiares_ibfk_1` FOREIGN KEY (`id_rolfamiliar`) REFERENCES `rol_familiar` (`id_rolfamiliar`),
  CONSTRAINT `familiares_ibfk_2` FOREIGN KEY (`id_grupofamiliar`) REFERENCES `grupo_familiar` (`id_grupofamiliar`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `familiares`
--

LOCK TABLES `familiares` WRITE;
/*!40000 ALTER TABLE `familiares` DISABLE KEYS */;
INSERT INTO `familiares` VALUES (1,1,'MARIA','SAUREZ',45,1),(2,2,'JOSE','VELEZ',26,2),(3,3,'BELEN','CARRANZA',15,3);
/*!40000 ALTER TABLE `familiares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionarios`
--

DROP TABLE IF EXISTS `funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionarios` (
  `funcionario_id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_identificacion` varchar(100) NOT NULL,
  `numero_identificacion` int(11) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `estado_civil` varchar(50) NOT NULL,
  `sexo` varchar(50) NOT NULL,
  `direccion` varchar(300) NOT NULL,
  `telefono` int(50) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  PRIMARY KEY (`funcionario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionarios`
--

LOCK TABLES `funcionarios` WRITE;
/*!40000 ALTER TABLE `funcionarios` DISABLE KEYS */;
INSERT INTO `funcionarios` VALUES (1,'CC',1254895,'PEPITO','SUAREZ','SOLTERO','MASCULINO','CALLE 34 # 23-23',552457856,'2000-05-02'),(2,'CC',1252400,'JUANITA','VELEZ','SOLTERA','FEMENINO','CRA 23 #98-74',555069522,'2004-06-15'),(3,'CC',1582652,'CARLOS','CARRANZA','CASADO','MASCULINO','CRA 45 #54-02',44250364,'2010-12-26');
/*!40000 ALTER TABLE `funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo_familiar`
--

DROP TABLE IF EXISTS `grupo_familiar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupo_familiar` (
  `id_grupofamiliar` int(11) NOT NULL AUTO_INCREMENT,
  `funcionario_id` int(11) NOT NULL,
  PRIMARY KEY (`id_grupofamiliar`),
  KEY `funcionario_id` (`funcionario_id`),
  CONSTRAINT `grupo_familiar_ibfk_1` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`funcionario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo_familiar`
--

LOCK TABLES `grupo_familiar` WRITE;
/*!40000 ALTER TABLE `grupo_familiar` DISABLE KEYS */;
INSERT INTO `grupo_familiar` VALUES (1,1),(2,2),(3,3);
/*!40000 ALTER TABLE `grupo_familiar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_academico`
--

DROP TABLE IF EXISTS `historial_academico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_academico` (
  `id_historial` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_u` varchar(100) NOT NULL,
  `nivel_estudio` varchar(100) NOT NULL,
  `titulo_estudio` varchar(100) NOT NULL,
  `funcionario_id` int(11) NOT NULL,
  PRIMARY KEY (`id_historial`),
  KEY `funcionario_id` (`funcionario_id`),
  CONSTRAINT `historial_academico_ibfk_1` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`funcionario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_academico`
--

LOCK TABLES `historial_academico` WRITE;
/*!40000 ALTER TABLE `historial_academico` DISABLE KEYS */;
INSERT INTO `historial_academico` VALUES (1,'IUDIGITAL','PREGRADO','SISO',1),(2,'SIMON BOLIVAR','POSGRADO','ABOGADO',2),(3,'HAVERIANA','TECNOLOGO','PROGRAMADOR',3);
/*!40000 ALTER TABLE `historial_academico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol_familiar`
--

DROP TABLE IF EXISTS `rol_familiar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol_familiar` (
  `id_rolfamiliar` int(11) NOT NULL AUTO_INCREMENT,
  `rol_familiar` varchar(100) NOT NULL,
  PRIMARY KEY (`id_rolfamiliar`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol_familiar`
--

LOCK TABLES `rol_familiar` WRITE;
/*!40000 ALTER TABLE `rol_familiar` DISABLE KEYS */;
INSERT INTO `rol_familiar` VALUES (1,'MADRE'),(2,'HERMANO'),(3,'HIJA');
/*!40000 ALTER TABLE `rol_familiar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'funcionario'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-13 18:02:08
