
CREATE DATABASE  IF NOT EXISTS `kino` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `kino`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: kino
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `filmovi`
--

DROP TABLE IF EXISTS `filmovi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filmovi` (
  `idfilm` int NOT NULL,
  `Naslov` varchar(45) DEFAULT NULL,
  `Reziser` varchar(45) DEFAULT NULL,
  `Zanr` varchar(45) DEFAULT NULL,
  `Datum_izdanja` date DEFAULT NULL,
  `Vrijeme_trajanja` time DEFAULT NULL,
  `Ocjena` int DEFAULT NULL,
  `Nastavak_od` int DEFAULT NULL,
  PRIMARY KEY (`idfilm`),
  KEY `Ocjena` (`Ocjena`),
  KEY `Nastavak_od` (`Nastavak_od`),
  CONSTRAINT `filmovi_ibfk_1` FOREIGN KEY (`Ocjena`) REFERENCES `ocjene` (`idocjene`),
  CONSTRAINT `filmovi_ibfk_2` FOREIGN KEY (`Nastavak_od`) REFERENCES `filmovi` (`idfilm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filmovi`
--

LOCK TABLES `filmovi` WRITE;
/*!40000 ALTER TABLE `filmovi` DISABLE KEYS */;
INSERT INTO `filmovi` VALUES (1,'Sam u kuci','Chris Columbus','Komedija','1990-01-01','01:43:00',4,NULL),(2,'Sam u kuci 2','Chris Columbus','Komedija','1992-01-01','02:00:00',5,1),(3,'Sam u kuci 3','Chris Columbus','Komedija','1997-01-01','01:42:00',3,2),(4,'Sam u kuci 4','Rod Daniel','Komedija','2002-01-01','01:19:00',4,3),(5,'Gospodar prstenova','Peter Jackson','Fantastika','2002-06-01','02:58:00',4,NULL),(6,'Gospodar prstenova: Dvije kule','Peter Jackson','Fantastika','2002-12-05','03:43:00',5,5),(7,'Gospodar prstenova: Povratak kralja','Peter Jackson','Fantastika','2003-12-05','03:20:00',3,6),(8,'Kletva','Nicolas Pesce','Horor','2020-05-05','01:30:00',1,NULL),(9,'Quo vadis, Aida?','Jasmila Zbanic','Drama','2020-10-05','01:41:00',5,NULL),(10,'Joker','Todd Phillips','Krimi','2019-10-05','01:57:00',4,NULL);
/*!40000 ALTER TABLE `filmovi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `musterije`
--

DROP TABLE IF EXISTS `musterije`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `musterije` (
  `idmusterija` int NOT NULL,
  `Ime` varchar(45) DEFAULT NULL,
  `Prezime` varchar(45) DEFAULT NULL,
  `Broj_telefona` int DEFAULT NULL,
  `Broj_kreditne_kartice` int DEFAULT NULL,
  `idrezervacije` int DEFAULT NULL,
  PRIMARY KEY (`idmusterija`),
  KEY `idrezervacije` (`idrezervacije`),
  CONSTRAINT `musterije_ibfk_1` FOREIGN KEY (`idrezervacije`) REFERENCES `rezervacije` (`idrezervacije`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musterije`
--

LOCK TABLES `musterije` WRITE;
/*!40000 ALTER TABLE `musterije` DISABLE KEYS */;
INSERT INTO `musterije` VALUES (1,'Nejra','Kadic',62111222,1854,1),(2,'Fuad','Jaganjac',62111333,1647,2),(3,'Ena','Juric',62111453,1647,3),(4,'Emina','Hurem',62111478,1677,4),(5,'Test','Test1',62154478,1837,5),(6,'Test2','Test3',62854478,1437,6),(7,'Test4','Test5',61454478,1827,7),(8,'Test6','Test7',61457478,2827,8),(9,'Test8','Test9',61451478,7567,9),(10,'Test10','Test11',61651478,8667,10);
/*!40000 ALTER TABLE `musterije` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ocjene`
--

DROP TABLE IF EXISTS `ocjene`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ocjene` (
  `idocjene` int NOT NULL,
  `Opis_ocjene` varchar(45) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`idocjene`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ocjene`
--

LOCK TABLES `ocjene` WRITE;
/*!40000 ALTER TABLE `ocjene` DISABLE KEYS */;
INSERT INTO `ocjene` VALUES (1,'Uzasno'),(2,'Lose'),(3,'Ok'),(4,'Dobro'),(5,'Odlican');
/*!40000 ALTER TABLE `ocjene` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projekcije`
--

DROP TABLE IF EXISTS `projekcije`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projekcije` (
  `idprojekcije` int NOT NULL,
  `idfilm` int DEFAULT NULL,
  `Datum` date DEFAULT NULL,
  `Pocetak_projekcije` time DEFAULT NULL,
  `Kraj_projekcije` time DEFAULT NULL,
  `Sala` int DEFAULT NULL,
  `Pauza` tinyint DEFAULT NULL,
  PRIMARY KEY (`idprojekcije`),
  KEY `idfilm` (`idfilm`),
  KEY `Sala` (`Sala`),
  CONSTRAINT `projekcije_ibfk_1` FOREIGN KEY (`idfilm`) REFERENCES `filmovi` (`idfilm`),
  CONSTRAINT `projekcije_ibfk_2` FOREIGN KEY (`Sala`) REFERENCES `sale` (`idsala`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projekcije`
--

LOCK TABLES `projekcije` WRITE;
/*!40000 ALTER TABLE `projekcije` DISABLE KEYS */;
INSERT INTO `projekcije` VALUES (1,1,'2020-12-14','10:00:00','12:00:00',1,NULL),(2,1,'2020-12-14','16:00:00','18:00:00',1,NULL),(3,2,'2020-12-15','18:00:00','20:00:00',3,NULL),(4,7,'2020-12-11','15:00:00','18:30:00',5,NULL),(5,5,'2020-12-17','20:00:00','23:30:00',3,NULL),(6,8,'2020-12-18','14:00:00','16:30:00',2,NULL),(7,3,'2020-12-19','14:00:00','16:30:00',3,NULL),(8,4,'2020-12-20','14:00:00','16:00:00',4,NULL),(9,4,'2020-12-20','17:00:00','19:00:00',4,NULL);
/*!40000 ALTER TABLE `projekcije` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rezervacije`
--

DROP TABLE IF EXISTS `rezervacije`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rezervacije` (
  `idrezervacije` int NOT NULL,
  `Termin` time DEFAULT NULL,
  `Sala` int DEFAULT NULL,
  `Red` varchar(45) DEFAULT NULL,
  `Sjediste` int DEFAULT NULL,
  `idprojekcije` int DEFAULT NULL,
  PRIMARY KEY (`idrezervacije`),
  KEY `idprojekcije` (`idprojekcije`),
  CONSTRAINT `rezervacije_ibfk_1` FOREIGN KEY (`idprojekcije`) REFERENCES `projekcije` (`idprojekcije`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rezervacije`
--

LOCK TABLES `rezervacije` WRITE;
/*!40000 ALTER TABLE `rezervacije` DISABLE KEYS */;
INSERT INTO `rezervacije` VALUES (1,'17:00:00',4,'3',5,9),(2,'18:00:00',3,'4',3,3),(3,'20:00:00',3,'1',5,5),(4,'20:00:00',3,'2',7,5),(5,'20:00:00',3,'6',12,5),(6,'17:00:00',4,'5',5,9),(7,'17:00:00',4,'5',6,9),(8,'17:00:00',4,'5',7,9),(9,'14:00:00',2,'4',4,6),(10,'14:00:00',2,'4',3,6);
/*!40000 ALTER TABLE `rezervacije` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale`
--

DROP TABLE IF EXISTS `sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale` (
  `idsala` int NOT NULL,
  `Broj_sjedista` int DEFAULT NULL,
  `Projektant` int DEFAULT NULL,
  PRIMARY KEY (`idsala`),
  KEY `Projektant` (`Projektant`),
  CONSTRAINT `sale_ibfk_1` FOREIGN KEY (`Projektant`) REFERENCES `zaposlenici` (`idzaposlenik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale`
--

LOCK TABLES `sale` WRITE;
/*!40000 ALTER TABLE `sale` DISABLE KEYS */;
INSERT INTO `sale` VALUES (1,12,1),(2,60,1),(3,30,2),(4,35,3),(5,40,3),(6,45,4),(7,50,4);
/*!40000 ALTER TABLE `sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zaposlenici`
--

DROP TABLE IF EXISTS `zaposlenici`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zaposlenici` (
  `idzaposlenik` int NOT NULL,
  `Ime` varchar(255) DEFAULT NULL,
  `Prezime` varchar(255) DEFAULT NULL,
  `Adresa` varchar(255) DEFAULT NULL,
  `Salter` int DEFAULT NULL,
  PRIMARY KEY (`idzaposlenik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zaposlenici`
--

LOCK TABLES `zaposlenici` WRITE;
/*!40000 ALTER TABLE `zaposlenici` DISABLE KEYS */;
INSERT INTO `zaposlenici` VALUES (1,'Nejra','Kadić','Poligonska 140',1),(2,'Fuad','Jaganjac','Geteova 12',2),(3,'Ena','Jurić','Vrbanja 5',3),(4,'Emina','Hurem','Kolodvorska 25',4);
/*!40000 ALTER TABLE `zaposlenici` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'kino'
--

--
-- Dumping routines for database 'kino'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-14 20:27:11

DROP FUNCTION IF EXISTS vp_slovo;
 
DELIMITER $$
CREATE FUNCTION vp_slovo(str_value VARCHAR(5000))
RETURNS VARCHAR(5000)
DETERMINISTIC
BEGIN
    RETURN CONCAT(UCASE(LEFT(str_value, 1)),SUBSTRING(str_value, 2));
END
$$

DELIMITER $$
CREATE TRIGGER tr_vp_filmovi
BEFORE INSERT ON filmovi
FOR EACH ROW
SET NEW.Naslov=vp_slovo(NEW.Naslov); 
$$

select * from ocjene;

CREATE VIEW Filmovi_pet_zvjezdica
AS select
f.Naslov,
f.Reziser,
o.Opis_ocjene
from filmovi f inner join ocjene o
where f.ocjena = 5;

CREATE VIEW  Najgore_od_najgorih
AS select
f.Naslov,
f.Reziser,
o.Opis_ocjene
from filmovi f inner join ocjene o
where f.ocjena = 1;

CREATE VIEW Novogodisnja_ponuda
as select f.Naslov,
p.Datum,
p.Pocetak_projekcije,
p.Kraj_projekcije from filmovi f inner join projekcije p 
where 
    p.Datum between '2020-12-18'
and
    DATE_ADD('2020-12-17',INTERVAL 15 DAY);
    
    select * from projekcije;
    
