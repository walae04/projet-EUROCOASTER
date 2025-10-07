-- MySQL dump 10.13  Distrib 8.0.43, for Linux (x86_64)
--
-- Host: 172.16.0.210    Database: bd_eurocoasters_monLogin
-- ------------------------------------------------------
-- Server version	5.5.5-10.11.11-MariaDB-0+deb12u1

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
-- Table structure for table `compositions`
--

DROP TABLE IF EXISTS `compositions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compositions` (
  `fk_roallercoaster_id` int(11) NOT NULL,
  `fk_element_id` int(11) NOT NULL,
  `nombre` int(11) DEFAULT NULL,
  PRIMARY KEY (`fk_roallercoaster_id`,`fk_element_id`),
  KEY `fk_element_id` (`fk_element_id`),
  CONSTRAINT `compositions_ibfk_1` FOREIGN KEY (`fk_roallercoaster_id`) REFERENCES `roallercoasters` (`roallercoaster_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `compositions_ibfk_2` FOREIGN KEY (`fk_element_id`) REFERENCES `elements` (`element_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compositions`
--

LOCK TABLES `compositions` WRITE;
/*!40000 ALTER TABLE `compositions` DISABLE KEYS */;
/*!40000 ALTER TABLE `compositions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `constructeurs`
--

DROP TABLE IF EXISTS `constructeurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `constructeurs` (
  `constructeur_id` int(11) NOT NULL,
  `nom` varchar(30) DEFAULT NULL,
  `fk_ville_id` int(11) DEFAULT NULL,
  `adresse` varchar(100) DEFAULT NULL,
  `url_site_web` varchar(100) DEFAULT NULL,
  `url_facebook` varchar(100) DEFAULT NULL,
  `url_instagram` varchar(100) DEFAULT NULL,
  `url_linked_in` varchar(100) DEFAULT NULL,
  `date_creation` year(4) DEFAULT NULL,
  PRIMARY KEY (`constructeur_id`),
  KEY `fk_ville_id` (`fk_ville_id`),
  CONSTRAINT `constructeurs_ibfk_1` FOREIGN KEY (`fk_ville_id`) REFERENCES `villes` (`ville_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `constructeurs`
--

LOCK TABLES `constructeurs` WRITE;
/*!40000 ALTER TABLE `constructeurs` DISABLE KEYS */;
/*!40000 ALTER TABLE `constructeurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements` (
  `element_id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`element_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frequentations`
--

DROP TABLE IF EXISTS `frequentations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `frequentations` (
  `annee` year(4) NOT NULL,
  `fk_parc_id` int(11) NOT NULL,
  `nombre_visiteur` int(11) DEFAULT NULL,
  PRIMARY KEY (`annee`,`fk_parc_id`),
  KEY `fk_parc_id` (`fk_parc_id`),
  CONSTRAINT `frequentations_ibfk_1` FOREIGN KEY (`fk_parc_id`) REFERENCES `parcs` (`parc_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frequentations`
--

LOCK TABLES `frequentations` WRITE;
/*!40000 ALTER TABLE `frequentations` DISABLE KEYS */;
/*!40000 ALTER TABLE `frequentations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parcs`
--

DROP TABLE IF EXISTS `parcs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parcs` (
  `parc_id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `fk_ville_id` int(11) DEFAULT NULL,
  `date_ouverture` int(11) DEFAULT NULL,
  `superficie` int(11) DEFAULT NULL,
  PRIMARY KEY (`parc_id`),
  KEY `fk_ville_id` (`fk_ville_id`),
  CONSTRAINT `parcs_ibfk_1` FOREIGN KEY (`fk_ville_id`) REFERENCES `villes` (`ville_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parcs`
--

LOCK TABLES `parcs` WRITE;
/*!40000 ALTER TABLE `parcs` DISABLE KEYS */;
/*!40000 ALTER TABLE `parcs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pays`
--

DROP TABLE IF EXISTS `pays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pays` (
  `pays_id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
  PRIMARY KEY (`pays_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pays`
--

LOCK TABLES `pays` WRITE;
/*!40000 ALTER TABLE `pays` DISABLE KEYS */;
/*!40000 ALTER TABLE `pays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roallercoasters`
--

DROP TABLE IF EXISTS `roallercoasters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roallercoasters` (
  `roallercoaster_id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `structure` enum('acier','bois') NOT NULL,
  `type` enum('sit down','standup','inverted','suspended','wing','bobsled','flying') DEFAULT NULL,
  `date_ouverture` year(4) DEFAULT NULL,
  `hauteur` decimal(4,1) DEFAULT NULL,
  `fk_constructeur_id` int(11) DEFAULT NULL,
  `fk_parc_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`roallercoaster_id`),
  KEY `fk_constructeur_id` (`fk_constructeur_id`),
  KEY `fk_parc_id` (`fk_parc_id`),
  CONSTRAINT `roallercoasters_ibfk_1` FOREIGN KEY (`fk_constructeur_id`) REFERENCES `constructeurs` (`constructeur_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `roallercoasters_ibfk_2` FOREIGN KEY (`fk_parc_id`) REFERENCES `parcs` (`parc_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roallercoasters`
--

LOCK TABLES `roallercoasters` WRITE;
/*!40000 ALTER TABLE `roallercoasters` DISABLE KEYS */;
/*!40000 ALTER TABLE `roallercoasters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `villes`
--

DROP TABLE IF EXISTS `villes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `villes` (
  `ville_id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) DEFAULT NULL,
  `fk_pays_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ville_id`),
  KEY `fk_pays_id` (`fk_pays_id`),
  CONSTRAINT `villes_ibfk_1` FOREIGN KEY (`fk_pays_id`) REFERENCES `pays` (`pays_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `villes`
--

LOCK TABLES `villes` WRITE;
/*!40000 ALTER TABLE `villes` DISABLE KEYS */;
/*!40000 ALTER TABLE `villes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'bd_eurocoasters_monLogin'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-07 11:43:03


INSERT INTO rollercoasters (rollercoaster_id, nom, structure, type, date_ouverture, hauteur, fk_constructeur_id, fk_parc_id) VALUES
(1, 'Abismo', 'acier', 'sit down', '2006', 46.2, 8, 27), (2, 'Abyssus', 'acier', 'sit down', '2021', 38.5, 10, 63), (3, 'Alpina Blitz', 'acier', 'sit down', '2014', 33.0, 7, 34), (4, 'Altair', 'acier', 'sit down', '2014', 33.0, 6, 82), (5, 'Anaconda', 'bois', 'sit down', '1989', 36.0, 14, 36), (6, 'Anubis: The Ride', 'acier', 'sit down', '2009', 34.0, 3, 16),
(7, 'Apocalypse', 'acier', 'sit down', '2012', 22.9, 10, 104), (8, 'Atlantica SuperSplash', 'acier', 'sit down', '2005', 30.0, 7, 10), (9, 'Avengers Assemble: Flight Force', 'acier', 'sit down', '2002', 24.4, 10, 37), (10, 'Balagos', 'acier', 'sit down', '1905', 25.0, 10, 58), (11, 'Balder', 'bois', 'sit down', '2003', 36.0, 6, 76), (12, 'Bandit', 'bois', 'sit down', '1999', 27.8, 15, 2),
(13, 'Baron 1898', 'acier', 'sit down', '2015', 30.0, 1, 59), (14, 'Batman Gotham City Escape', 'acier', 'sit down', '2023', 45.0, 6, 29), (15, 'Big Bang', 'acier', 'sit down', '2013', 22.0, 12, 116), (16, 'Big Loop', 'acier', 'sit down', '1905', 30.0, 10, 95), (17, 'Big One', 'acier', 'sit down', '1994', 64.9, 16, 65), (18, 'Big Thunder Mountain', 'acier', 'sit down', '1992', 22.0, 10, 37),
(19, 'Black Mamba', 'acier', 'inverted', '2006', 26.0, 1, 3), (20, 'blue fire Megacoaster', 'acier', 'sit down', '2009', 38.0, 7, 10), (21, 'Blue Tornado', 'acier', 'inverted', '1998', 33.3, 10, 48), (22, 'Bobbahn', 'acier', 'bobsled', '1994', 27.0, 7, 95), (23, 'Boomerang', 'acier', 'sit down', '1992', 35.5, 10, 15), (24, 'Boomerang', 'acier', 'sit down', '1984', 35.5, 10, 19),
(25, 'Boomerang', 'acier', 'sit down', '1992', 35.5, 10, 36), (26, 'Boomerang', 'acier', 'sit down', '2017', 23.0, 10, 63), (27, 'Cheetah Hunt', 'acier', 'sit down', '2013', 23.0, 17, 106), (28, 'Coaster Express', 'bois', 'sit down', '2002', 36.6, 15, 29), (29, 'Cobra', 'acier', 'sit down', '2001', 35.5, 10, 18), (30, 'Cobra', 'acier', 'sit down', '2005', 35.5, 10, 31),
(31, 'Cobra', 'acier', 'sit down', '2010', 42.0, 10, 83), (32, 'Colorado Adventure', 'acier', 'sit down', '1996', 26.0, 10, 3), (33, 'Colossos - Kampf der Giganten', 'bois', 'sit down', '2001', 50.0, 6, 95), (34, 'Colossus', 'acier', 'sit down', '2002', 30.0, 6, 67), (35, 'Condor', 'acier', 'inverted', '1994', 31.0, 10, 57), (36, 'Cú Chulainn', 'bois', 'sit down', '2015', 32.0, 4, 44),
(37, 'Dæmonen', 'acier', 'sit down', '2004', 28.0, 1, 21), (38, 'Dawson Duel', 'acier', 'sit down', '2017', 25.0, 18, 19), (39, 'Desmo Race', 'acier', 'sit down', '2019', 22.0, 8, 52), (40, 'Diabolik', 'acier', 'inverted', '2015', 40.0, 10, 107), (41, 'Divertical', 'acier', 'sit down', '2012', 50.0, 6, 52), (42, 'DrageKongen', 'acier', 'inverted', '2017', 30.0, 6, 24),
(43, 'Dragon Khan', 'acier', 'sit down', '1995', 45.1, 1, 28), (44, 'Dreamcatcher', 'acier', 'suspended', '1987', 25.0, 10, 17), (45, 'Dynamite', 'acier', 'sit down', '2019', 44.0, 7, 92), (46, 'El Toro', 'bois', 'sit down', '2009', 24.5, 5, 92), (47, 'Eldorado', 'acier', 'sit down', '2013', 21.0, 19, 45), (48, 'Euro Mir', 'acier', 'sit down', '1997', 28.0, 7, 10),
(49, 'Eurofigther', 'acier', 'sit down', '2011', 25.0, 3, 49), (50, 'EuroLoop', 'acier', 'sit down', '2004', 30.0, 10, 86), (51, 'Eurosat - CanCan Coaster', 'acier', 'sit down', '1989', 25.5, 7, 10), (52, 'Expedition GeForce', 'acier', 'sit down', '2001', 53.0, 6, 6), (53, 'Falcon', 'acier', 'sit down', '2009', 22.0, 3, 84), (54, 'Fenix', 'acier', 'wing', '2018', 40.0, 1, 61),
(55, 'Fianna Force', 'acier', 'inverted', '2024', 31.0, 10, 44), (56, 'Fireball', 'acier', 'sit down', '2017', 23.0, 10, 93), (57, 'Fjord Explorer', 'acier', 'sit down', '2024', 27.0, 7, 102), (58, 'Fluch des Kraken', 'acier', 'sit down', '1905', 35.5, 10, 91), (59, 'Flucht von Novgorod', 'acier', 'sit down', '2009', 40.0, 3, 12), (60, 'Flug der Dämonen', 'acier', 'wing', '2014', 40.0, 1, 95),
(61, 'Fønix', 'acier', 'sit down', '2022', 40.0, 10, 87), (62, 'Force One', 'acier', 'sit down', '2010', 22.0, 20, 110), (63, 'Formula', 'acier', 'sit down', '2016', 24.8, 10, 63), (64, 'Freestyle', 'acier', 'standup', '2015', 26.8, 21, 46), (65, 'Freischütz', 'acier', 'sit down', '2011', 24.0, 8, 81), (66, 'Fury', 'acier', 'sit down', '2019', 43.0, 3, 17),
(67, 'Generator', 'acier', 'sit down', '1988', 35.5, 10, 115), (68, 'Gesengte Sau', 'acier', 'sit down', '2020', 24.0, 3, 15), (69, 'Gold Rush', 'acier', 'sit down', '2017', 33.0, 3, 111), (70, 'Goliath', 'acier', 'sit down', '2002', 46.8, 6, 57), (71, 'Gotham', 'acier', 'sit down', '2021', 24.0, 22, 108), (72, 'Goudurix', 'acier', 'sit down', '1989', 36.0, 10, 39),
(73, 'Hals-über-Kopf', 'acier', 'inverted', '2020', 30.0, 10, 85), (74, 'Heidi The Ride', 'bois', 'sit down', '2017', 22.0, 5, 16), (75, 'Helix', 'acier', 'sit down', '2014', 41.0, 7, 76), (76, 'Huracan', 'acier', 'sit down', '2010', 32.0, 3, 7), (77, 'Hype', 'acier', 'sit down', '2017', 45.7, 13, 32), (78, 'Hyper Coaster', 'acier', 'sit down', '2018', 61.0, 7, 78),
(79, 'Hyperia', 'acier', 'sit down', '2024', 71.9, 7, 67), (80, 'Hyperion', 'acier', 'sit down', '2018', 77.0, 6, 63), (81, 'Icon', 'acier', 'sit down', '2018', 27.0, 7, 65), (82, 'Il Tempo Extra Gigante', 'acier', 'sit down', '2014', 25.0, 20, 96), (83, 'Inferno', 'acier', 'wing', '2007', 25.0, 6, 112), (84, 'Infusion', 'acier', 'inverted', '2007', 33.3, 10, 65),
(85, 'Insane', 'acier', 'wing', '2009', 33.0, 6, 77), (86, 'Iron Claw', 'acier', 'inverted', '2001', 33.3, 10, 2), (87, 'iSpeed', 'acier', 'sit down', '2009', 55.0, 6, 52), (88, 'Jaguar', 'acier', 'inverted', '1997', 33.3, 10, 97), (89, 'Joris en de Draak', 'bois', 'sit down', '2010', 22.1, 5, 59), (90, 'Junker', 'acier', 'sit down', '2015', 40.0, 3, 31),
(91, 'K2', 'acier', 'sit down', '2018', 24.0, 10, 99), (92, 'Karacho', 'acier', 'sit down', '2013', 30.0, 3, 85), (93, 'Katun', 'acier', 'inverted', '2000', 50.0, 1, 52), (94, 'Kirnu', 'acier', 'wing', '2007', 25.0, 6, 30), (95, 'Kondaa', 'acier', 'sit down', '2021', 50.0, 6, 18), (96, 'Krake', 'acier', 'sit down', '2011', 41.0, 1, 95),
(97, 'Krampus Expédition', 'acier', 'sit down', '2021', 28.0, 7, 34), (98, 'Kumali', 'acier', 'inverted', '2006', 35.9, 10, 89), (99, 'Lech Coaster', 'acier', 'sit down', '2017', 40.0, 10, 103), (100, 'Light Explorers', 'acier', 'sit down', '2021', 24.2, 10, 63), (101, 'Lisebergbanan', 'acier', 'sit down', '1987', 45.0, 20, 76), (102, 'Loopen', 'acier', 'sit down', '1988', 21.0, 10, 55),
(103, 'Lost Gravity', 'acier', 'sit down', '2016', 32.0, 7, 57), (104, 'Loup-Garou', 'bois', 'sit down', '2001', 28.0, 10, 18), (105, 'Luna', 'acier', 'sit down', '2023', 33.5, 10, 76), (106, 'Mammut', 'bois', 'sit down', '2008', 30.0, 10, 85), (107, 'Megafobia', 'bois', 'sit down', '1996', 25.9, 2, 56), (108, 'Millennium', 'acier', 'sit down', '1999', 45.7, 10, 71),
(109, 'Monster', 'acier', 'inverted', '2010', 40.0, 1, 36), (110, 'Monster', 'acier', 'inverted', '2021', 34.0, 1, 77), (111, 'Montanha Russa', 'acier', 'sit down', '2006', 23.5, 7, 80), (112, 'Mumbo Jumbo', 'acier', 'sit down', '2009', 30.0, 19, 89), (113, 'Muntanya Russa', 'acier', 'sit down', '2008', 25.0, 10, 113), (114, 'Mystic', 'acier', 'sit down', '2019', 31.0, 3, 115),
(115, 'Nefeskesen', 'acier', 'sit down', '2014', 50.0, 6, 114), (116, 'Nemesis Inferno', 'acier', 'inverted', '2003', 29.0, 1, 67), (117, 'Nessie', 'acier', 'sit down', '1980', 26.0, 12, 12), (118, 'Nid des Marsupilamis', 'acier', 'sit down', '2019', 28.5, 3, 109), (119, 'Oblivion - The Black Hole', 'acier', 'sit down', '2015', 42.5, 1, 48), (120, 'Odyssey', 'acier', 'inverted', '2002', 50.9, 10, 71),
(121, 'Olympia Looping', 'acier', 'sit down', '2024', 32.5, 23, 15), (122, 'OzIris', 'acier', 'inverted', '2012', 40.0, 1, 39), (123, 'Pégase Express', 'acier', 'sit down', '2017', 21.0, 3, 39), (124, 'Piraten', 'acier', 'sit down', '2008', 31.0, 6, 24), (125, 'Pitts Special', 'acier', 'sit down', '2020', 43.5, 3, 31), (126, 'Poseidon', 'acier', 'sit down', '2000', 23.0, 7, 10),
(127, 'Psyké Underground', 'acier', 'sit down', '1982', 42.0, 12, 18), (128, 'Pulsar', 'acier', 'sit down', '2016', 45.0, 7, 18), (129, 'Python', 'acier', 'sit down', '1981', 29.0, 10, 59), (130, 'Quest', 'acier', 'sit down', '2024', 25.0, 10, 44), (131, 'Rage', 'acier', 'sit down', '2007', 22.0, 3, 75), (132, 'Raik', 'acier', 'sit down', '2016', 25.0, 10, 3),
(133, 'Raptor', 'acier', 'wing', '2011', 33.0, 1, 48), (134, 'RC Racer', 'acier', 'sit down', '2010', 25.0, 6, 37), (135, 'Red Fire', 'acier', 'sit down', '2015', 55.0, 6, 79), (136, 'Red Force', 'acier', 'sit down', '2017', 112.0, 6, 88), (137, 'Ride to Happiness', 'acier', 'sit down', '2021', 33.0, 7, 16), (138, 'Rita', 'acier', 'sit down', '2005', 21.0, 6, 64),
(139, 'Roller Coaster', 'bois', 'sit down', '1932', 21.3, 10, 70), (140, 'Roller Coaster Mayan', 'acier', 'inverted', '2015', 33.3, 10, 63), (141, 'Rutschebanen', 'bois', 'sit down', '1914', 22.0, 24, 23), (142, 'Saven', 'acier', 'sit down', '2020', 24.2, 10, 87), (143, 'Saw - The Ride', 'acier', 'sit down', '2009', 30.5, 3, 67), (144, 'Schwur des Kärnan', 'acier', 'sit down', '2015', 73.0, 3, 12),
(145, 'Shadows of Arkham', 'acier', 'inverted', '2002', 32.0, 1, 29), (146, 'Shaman', 'acier', 'sit down', '1985', 30.0, 10, 48), (147, 'Shambhala', 'acier', 'sit down', '2012', 76.0, 1, 28), (148, 'Shock', 'acier', 'sit down', '2011', 35.0, 8, 54), (149, 'Sik', 'acier', 'sit down', '2022', 33.0, 6, 89), (150, 'Silver Star', 'acier', 'sit down', '2002', 73.0, 1, 10),
(151, 'Skatteøen', 'acier', 'sit down', '2011', 28.0, 7, 24), (152, 'Sky Scream', 'acier', 'sit down', '2014', 45.7, 13, 6), (153, 'Sky Wheel', 'acier', 'sit down', '2004', 46.2, 8, 1), (154, 'Speed', 'acier', 'sit down', '2018', 50.0, 6, 63), (155, 'Speed Monster', 'acier', 'sit down', '2006', 31.0, 6, 55), (156, 'Speed of Sound', 'acier', 'sit down', '2000', 35.5, 10, 57),
(157, 'Speed: No Limits', 'acier', 'sit down', '2006', 35.0, 3, 56), (158, 'Stampida', 'bois', 'sit down', '1997', 25.6, 2, 28), (159, 'Star Wars Hyperspace Mountain: Rebel Mission', 'acier', 'sit down', '1995', 32.0, 10, 37), (160, 'Stealth', 'acier', 'sit down', '2006', 62.5, 6, 67), (161, 'Storm', 'acier', 'sit down', '2013', 32.0, 7, 45), (162, 'Storm - The Dragon Legend', 'acier', 'inverted', '2023', 33.5, 3, 55),
(163, 'Stunt Fall', 'acier', 'inverted', '2002', 54.0, 10, 29), (164, 'Superman / la Atracción de Acero', 'acier', 'sit down', '2002', 50.0, 1, 29), (165, 'SuperSplash', 'acier', 'sit down', '1905', 29.0, 7, 55), (166, 'Swarm', 'acier', 'wing', '2012', 38.7, 1, 67), (167, 'Taiga', 'acier', 'sit down', '2019', 52.0, 6, 30), (168, 'Tarántula', 'acier', 'sit down', '2005', 25.5, 8, 27),
(169, 'Taron', 'acier', 'sit down', '2016', 30.0, 6, 3), (170, 'Thunderbird', 'bois', 'sit down', '2006', 25.0, 5, 31), (171, 'Tiki-Waka', 'acier', 'sit down', '2018', 21.0, 3, 18), (172, 'Timber Drop', 'acier', 'sit down', '2011', 29.3, 4, 90), (173, 'Titánide', 'acier', 'inverted', '2003', 33.3, 10, 112), (174, 'Tonnerre 2 Zeus', 'bois', 'sit down', '1997', 29.9, 2, 39),
(175, 'Tornado', 'acier', 'inverted', '1999', 29.9, 6, 27), (176, 'Tornado', 'acier', 'inverted', '2001', 25.0, 6, 32), (177, 'Toutatis', 'acier', 'sit down', '2023', 51.0, 6, 39), (178, 'Toxic Garden', 'acier', 'inverted', '1999', 33.3, 10, 95), (179, 'Triops', 'acier', 'inverted', '2012', 40.0, 10, 38), (180, 'Troy', 'bois', 'sit down', '2007', 31.9, 5, 61),
(181, 'Twist', 'acier', 'sit down', '2011', 22.0, 7, 102), (182, 'Typhoon', 'acier', 'sit down', '2004', 25.7, 3, 17), (183, 'Typhoon Coaster', 'acier', 'sit down', '2016', 43.0, 6, 78), (184, 'Ukko', 'acier', 'sit down', '2011', 46.2, 8, 30), (185, 'Untamed', 'acier', 'sit down', '2019', 36.5, 9, 57), (186, 'Valkyria', 'acier', 'sit down', '2018', 47.0, 1, 76),
(187, 'Vampire', 'acier', 'inverted', '1999', 33.3, 10, 18), (188, 'Vertika', 'acier', 'sit down', '2020', 27.0, 3, 101), (189, 'Vild-Svinet', 'acier', 'sit down', '2003', 21.9, 3, 22), (190, 'Vilda Musen', 'acier', 'sit down', '2003', 21.0, 3, 77), (191, 'Vindfald', 'acier', 'sit down', '2024', 23.0, 3, 20), (192, 'Vliegende Hollander', 'acier', 'sit down', '2007', 22.5, 25, 59),
(193, 'Volare', 'acier', 'flying', '2004', 21.0, 11, 15), (194, 'Volldampf', 'acier', 'sit down', '2020', 22.0, 10, 85), (195, 'Voltron', 'acier', 'sit down', '2024', 32.5, 7, 10), (196, 'Vuoristorata', 'bois', 'sit down', '1951', 22.9, 24, 30), (197, 'Wakala', 'acier', 'sit down', '2020', 21.0, 3, 19), (198, 'Wave', 'acier', 'sit down', '1994', 36.6, 6, 69),
(199, 'Werewolf', 'bois', 'sit down', '2019', 22.0, 5, 105), (200, 'Wilde Hilde', 'acier', 'sit down', '2018', 21.0, 26, 110), (201, 'Wildfire', 'bois', 'sit down', '2016', 56.0, 9, 100), (202, 'Wipeout', 'acier', 'sit down', '2007', 35.5, 10, 72), (203, 'Wodan Timbur Coaster', 'bois', 'sit down', '2012', 40.0, 5, 10), (204, 'Xpress: Platform 13', 'acier', 'sit down', '2000', 25.8, 10, 57),
(205, 'Zadra', 'acier', 'sit down', '2019', 62.8, 9, 63), (206, 'Ziegelblitz', 'acier', 'sit down', '2024', 21.0, 3, 98);

