-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: prisa_v2
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `allegato`
--

DROP TABLE IF EXISTS `allegato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allegato` (
  `COD_PRO` int NOT NULL,
  `NUMERO` int NOT NULL,
  `MAT_MIT` int DEFAULT NULL,
  `MESSAGGIO` text,
  `FILE` blob,
  PRIMARY KEY (`COD_PRO`,`NUMERO`),
  KEY `ALLEGATO_MIT_idx` (`MAT_MIT`),
  CONSTRAINT `ALLEGATO_MIT` FOREIGN KEY (`MAT_MIT`) REFERENCES `utente` (`MATRICOLA`) ON UPDATE CASCADE,
  CONSTRAINT `ALLEGATO_PRO` FOREIGN KEY (`COD_PRO`) REFERENCES `progetto` (`CODICE_PROGETTO`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allegato`
--

LOCK TABLES `allegato` WRITE;
/*!40000 ALTER TABLE `allegato` DISABLE KEYS */;
INSERT INTO `allegato` VALUES (1,1,121120,'primo messaggio',NULL);
/*!40000 ALTER TABLE `allegato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlla`
--

DROP TABLE IF EXISTS `controlla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `controlla` (
  `NOM_COR` varchar(45) NOT NULL,
  `COD_PRO` int NOT NULL,
  PRIMARY KEY (`NOM_COR`,`COD_PRO`),
  KEY `CONTROLLA_PRO_idx` (`COD_PRO`),
  CONSTRAINT `CONTROLLA_COR` FOREIGN KEY (`NOM_COR`) REFERENCES `corso` (`NOME_CORSO`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `CONTROLLA_PRO` FOREIGN KEY (`COD_PRO`) REFERENCES `progetto` (`CODICE_PROGETTO`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlla`
--

LOCK TABLES `controlla` WRITE;
/*!40000 ALTER TABLE `controlla` DISABLE KEYS */;
INSERT INTO `controlla` VALUES ('ingegneria software',1),('basi di dati',2);
/*!40000 ALTER TABLE `controlla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corso`
--

DROP TABLE IF EXISTS `corso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corso` (
  `NOME_CORSO` varchar(45) NOT NULL,
  PRIMARY KEY (`NOME_CORSO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corso`
--

LOCK TABLES `corso` WRITE;
/*!40000 ALTER TABLE `corso` DISABLE KEYS */;
INSERT INTO `corso` VALUES ('basi di dati'),('ingegneria software');
/*!40000 ALTER TABLE `corso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docente`
--

DROP TABLE IF EXISTS `docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docente` (
  `MATRICOLA_D` int NOT NULL,
  PRIMARY KEY (`MATRICOLA_D`),
  CONSTRAINT `UTENTE_D` FOREIGN KEY (`MATRICOLA_D`) REFERENCES `utente` (`MATRICOLA`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docente`
--

LOCK TABLES `docente` WRITE;
/*!40000 ALTER TABLE `docente` DISABLE KEYS */;
INSERT INTO `docente` VALUES (111111);
/*!40000 ALTER TABLE `docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insegna`
--

DROP TABLE IF EXISTS `insegna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insegna` (
  `MAT_DOC` int NOT NULL,
  `NOM_COR` varchar(45) NOT NULL,
  PRIMARY KEY (`MAT_DOC`,`NOM_COR`),
  KEY `INSEGNA_COR_idx` (`NOM_COR`),
  CONSTRAINT `INSEGNA_COR` FOREIGN KEY (`NOM_COR`) REFERENCES `corso` (`NOME_CORSO`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `INSEGNA_MAT` FOREIGN KEY (`MAT_DOC`) REFERENCES `docente` (`MATRICOLA_D`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insegna`
--

LOCK TABLES `insegna` WRITE;
/*!40000 ALTER TABLE `insegna` DISABLE KEYS */;
INSERT INTO `insegna` VALUES (111111,'ingegneria software');
/*!40000 ALTER TABLE `insegna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `progetto`
--

DROP TABLE IF EXISTS `progetto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `progetto` (
  `CODICE_PROGETTO` int NOT NULL,
  `STATO` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CODICE_PROGETTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `progetto`
--

LOCK TABLES `progetto` WRITE;
/*!40000 ALTER TABLE `progetto` DISABLE KEYS */;
INSERT INTO `progetto` VALUES (1,'CREATO'),(2,'CREATO');
/*!40000 ALTER TABLE `progetto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `segue`
--

DROP TABLE IF EXISTS `segue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `segue` (
  `MAT_STU` int NOT NULL,
  `NOM_COR` varchar(45) NOT NULL,
  PRIMARY KEY (`MAT_STU`,`NOM_COR`),
  KEY `SEGUE_COR_idx` (`NOM_COR`),
  CONSTRAINT `SEGUE_COR` FOREIGN KEY (`NOM_COR`) REFERENCES `corso` (`NOME_CORSO`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SEGUE_STU` FOREIGN KEY (`MAT_STU`) REFERENCES `studente` (`MATRICOLA_S`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `segue`
--

LOCK TABLES `segue` WRITE;
/*!40000 ALTER TABLE `segue` DISABLE KEYS */;
INSERT INTO `segue` VALUES (121120,'ingegneria software');
/*!40000 ALTER TABLE `segue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studente`
--

DROP TABLE IF EXISTS `studente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studente` (
  `MATRICOLA_S` int NOT NULL,
  PRIMARY KEY (`MATRICOLA_S`),
  CONSTRAINT `UTENTE_S` FOREIGN KEY (`MATRICOLA_S`) REFERENCES `utente` (`MATRICOLA`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studente`
--

LOCK TABLES `studente` WRITE;
/*!40000 ALTER TABLE `studente` DISABLE KEYS */;
INSERT INTO `studente` VALUES (121120);
/*!40000 ALTER TABLE `studente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sviluppa`
--

DROP TABLE IF EXISTS `sviluppa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sviluppa` (
  `MAT_STU` int NOT NULL,
  `COD_PRO` int NOT NULL,
  `NOM_COR` varchar(45) NOT NULL,
  PRIMARY KEY (`MAT_STU`,`COD_PRO`,`NOM_COR`),
  KEY `SVILUPPA_PRO_idx` (`COD_PRO`),
  KEY `SVILUPPA_COR_idx` (`NOM_COR`),
  CONSTRAINT `SVILUPPA_COR` FOREIGN KEY (`NOM_COR`) REFERENCES `corso` (`NOME_CORSO`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SVILUPPA_PRO` FOREIGN KEY (`COD_PRO`) REFERENCES `progetto` (`CODICE_PROGETTO`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SVILUPPA_STU` FOREIGN KEY (`MAT_STU`) REFERENCES `studente` (`MATRICOLA_S`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sviluppa`
--

LOCK TABLES `sviluppa` WRITE;
/*!40000 ALTER TABLE `sviluppa` DISABLE KEYS */;
INSERT INTO `sviluppa` VALUES (121120,1,'ingegneria software'),(121120,2,'basi di dati');
/*!40000 ALTER TABLE `sviluppa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utente`
--

DROP TABLE IF EXISTS `utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utente` (
  `MATRICOLA` int NOT NULL,
  `NOME` varchar(45) DEFAULT NULL,
  `COGNOME` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MATRICOLA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente`
--

LOCK TABLES `utente` WRITE;
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` VALUES (111111,'MARCO','ALBERTI'),(121120,'FILIPPO','LANDI');
/*!40000 ALTER TABLE `utente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-16 17:57:33
