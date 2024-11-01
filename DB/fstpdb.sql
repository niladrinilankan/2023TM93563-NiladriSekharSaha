-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: fstpdb
-- ------------------------------------------------------
-- Server version	5.5.62

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
-- Table structure for table `m_beneficiary`
--

DROP TABLE IF EXISTS `m_beneficiary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_beneficiary` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `update_date` datetime NOT NULL,
  `updated_by` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_beneficiary`
--

LOCK TABLES `m_beneficiary` WRITE;
/*!40000 ALTER TABLE `m_beneficiary` DISABLE KEYS */;
INSERT INTO `m_beneficiary` VALUES (1,'Arghya Ghosh','arghya.ghosh@cdac.in','47dbca4c85d01f000ac9e6857fc0b39f','2024-09-24 13:03:24',1),(7,'Niladri Sekhar Saha','niladri.saha@live.com','47dbca4c85d01f000ac9e6857fc0b39f','2024-10-16 18:47:44',1),(8,'Nilankan Saha','niladri.nilankan@gmail.com','47dbca4c85d01f000ac9e6857fc0b39f','2024-10-16 19:00:24',1),(9,'Abhijit Roy','abhijit.roy@cdac.in','47dbca4c85d01f000ac9e6857fc0b39f','2024-10-28 11:19:59',1),(10,'Mina Desai','mina.desai@cdac.in','47dbca4c85d01f000ac9e6857fc0b39f','2024-10-28 11:30:49',1),(11,'Niladri Sekhar Saha','niladri.saha@cdac.in','47dbca4c85d01f000ac9e6857fc0b39f','2024-10-28 11:55:26',1),(12,'Argha De','argha.de@gmail.com','47dbca4c85d01f000ac9e6857fc0b39f','2024-10-29 10:08:06',1);
/*!40000 ALTER TABLE `m_beneficiary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_book_list`
--

DROP TABLE IF EXISTS `m_book_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_book_list` (
  `book_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `beneficiary_id` int(10) unsigned NOT NULL,
  `title` text NOT NULL,
  `author` text NOT NULL,
  `book_condition` text NOT NULL,
  `genre` text NOT NULL,
  `availability_status` varchar(45) NOT NULL DEFAULT 'Available' COMMENT 'Available, Not-available',
  `activation_status` varchar(45) NOT NULL COMMENT 'Active, Deleted',
  `update_date` datetime NOT NULL,
  `location` text NOT NULL,
  PRIMARY KEY (`book_id`,`beneficiary_id`),
  KEY `FK_m_book_list_1` (`beneficiary_id`),
  CONSTRAINT `FK_m_book_list_1` FOREIGN KEY (`beneficiary_id`) REFERENCES `m_beneficiary` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_book_list`
--

LOCK TABLES `m_book_list` WRITE;
/*!40000 ALTER TABLE `m_book_list` DISABLE KEYS */;
INSERT INTO `m_book_list` VALUES (1,1,'A Memorandum Written After A Tour Through The Tea Districts Of Eastern Bengal, In 1864-65','Less, W. Nassua','Good','Historical Fiction','Available','Active','2024-10-21 16:50:36','Pune'),(2,1,'A Monograph On Wood Carving In The United Provinces Of Agra And Oudh','Maffey, J. L.','Good','Historical Fiction','Available','Active','2024-10-21 16:50:36','Nagpur'),(3,1,'A Statistical Account Of Bengal Vol. 19','Hunter, W. W.','Good','Historical Fiction','Available','Active','2024-10-21 16:50:36','Nashik'),(4,1,'Alberuni\'s India','Sachau, Edward Ed.','Good','Historical Fiction','Available','Active','2024-10-21 16:50:36','Mumbai'),(5,1,'An Elucidation Of The Articles Of Impeachment','Broome, Ralph Tr.','Good','Historical Fiction','Not Available','Active','2024-10-21 16:50:36','Belur'),(6,1,'An Indian Journalist','Skrine, F. H.','Good','Historical Fiction','Available','Active','2024-10-21 16:50:36','Pilani'),(7,1,'Clinical Lectures On Dengue','Charles, T. Edmondston','Good','Historical Fiction','Available','Active','2024-10-21 16:50:36','Goa'),(8,1,'Guide To The Transliteration Of Hindu And Muhammadan Names In The Bengal Army','Lyall, C. J.','Good','Historical Fiction','Available','Active','2024-10-21 16:50:36','Patna'),(9,1,'Hints On Government Education In India','Murdoch, John','Good','Historical Fiction','Not Available','Active','2024-10-21 16:50:36','Mohali'),(10,1,'History Of The Imams And Seyyids Of Oman','Salil-Ibn-Razik','Good','Historical Fiction','Available','Active','2024-10-21 16:50:36','Ranchi'),(16,7,'Volga Se Ganga Ed. 9th','Rahul Sankrityayan','Good','Fiction','Not Available','Deleted','2024-10-21 17:55:47','Bankura'),(17,7,'Lord Curzon In India 1898 - 1905 Vol. 1','Raleigh, Thomas','Good','Historical Fiction','Available','Deleted','2024-10-21 17:56:48','Bethuadahari'),(18,7,'Notes On The Administration Of The District Of Birbhum 1898','Drake-Brockman, E. G. Comp.','Good','Historical Fiction','Available','Deleted','2024-10-21 17:57:15','Kolkata'),(19,7,'Proposals Of The Government Of Bengal On The Delimitation Of Constituencies For The Bengal Legislative Assembly And The Bengal Legislative Council Under The Reformed Constitution.','Government Of Bengal','Good','Historical Fiction','available','Active','2024-10-22 12:54:26','Kolkata'),(20,7,'Report On The Administration Of The Civil And Military Station Of Bangalore For The Year 1882-83','Lyall, J. B.','Good','Historical Fiction','Available','Active','2024-10-21 16:50:36','Kolkata'),(21,7,'Report On The Administration Of The Civil And Military Station Of Bangalore For The Year 1884-85','Girdlestone, C. E. R.','Good','Historical Fiction','Available','Active','2024-10-21 16:50:36','Kolkata'),(22,7,'Report On The Administration Of The Civil And Military Station Of Bangalore For The Year 1885-86','Lyall, J. B.','Good','Historical Fiction','Available','Active','2024-10-21 16:50:36','Mumbai'),(23,7,'Report On The Administration Of The Civil And Military Station Of Bangalore For The Year 1886-87','Prendergast, Harry','Good','Historical Fiction','Available','Active','2024-10-21 16:50:36','Kolkata'),(24,7,'Government Circulars And Orders In Force In Bengal Vol. 1','Government of Bengal','Good','Historical Fiction','Available','Active','2024-10-21 16:50:36','Mumbai'),(25,7,'Local Government','H. E. H. The Nizam\'s Government','Good','Historical Fiction','Not Available','Active','2024-10-21 16:50:36','Bethuadahari'),(31,8,'Report Of The Management By The Government Of Private Estates In The Central Provinces','Government Of The Central Provinces And Berar','Good','Historical Fiction','Available','Active','2024-10-21 16:50:36','Bethuadahari'),(32,8,'Government Circulars And Orders In Force In Bengal Vol. 2 Ed. 2nd 1906','The Government Of Bengal, General Department','Good','Historical Fiction','Available','Active','2024-10-21 16:50:36','Kolkata'),(33,8,'Rules For The Supply Of Stores And Printed Forms From The Calcutta Stationery Office (With Appendices) Vol. 1','Govt. Of Bengal','Good','Historical Fiction','Not Available','Active','2024-10-21 16:50:36','Pilani'),(34,8,'Report On The Management By Government Of Private Estates In The Central Provinces For The Revenue Year 1904-05','Authority Of The Board Of Revenue','Good','Historical Fiction','Available','Active','2024-10-21 16:50:36','Bethuadahari'),(35,8,'The Bengal Cess Manual 1919','Government Of Bengal, Board Of Revenue','Good','Historical Fiction','Available','Active','2024-10-21 16:50:36','Mumbai'),(36,8,'The Bengal Cess Manual 1939','Government Of Bengal, Board Of Revenue','Good','Historical Fiction','Available','Active','2024-10-21 16:50:36','Pilani'),(37,8,'The Bengal Register And Return Manual,1919','The Authority Of The Board Of Revenue, Bengal','Good','Historical Fiction','Available','Active','2024-10-21 16:50:36','Mumbai'),(38,8,'The Bihar And Orissa Government Estates Manual 1919','The Authority Of The Board Of Revenue, Bengal','Good','Historical Fiction','Available','Active','2024-10-21 16:50:36','Bethuadahari'),(39,8,'The Government Estates Manual 1902','Authority Of The Board Of Revenue','Good','Historical Fiction','Available','Active','2024-10-21 16:50:36','Pilani'),(40,8,'The Opium Manual Part 1','Authority Of The Board Of Revenue','Good','Historical Fiction','Available','Active','2024-10-21 16:50:36','Mumbai'),(41,7,'Ramayana','Balmiki','Good','Mythology','Not Available','Active','2024-10-21 17:40:03','Bethuadahari');
/*!40000 ALTER TABLE `m_book_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_exchange_request`
--

DROP TABLE IF EXISTS `t_exchange_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_exchange_request` (
  `transaction_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL,
  `receiver_id` int(10) unsigned NOT NULL,
  `book_id` int(10) unsigned NOT NULL,
  `delivery_method` text NOT NULL,
  `exchange_duration` text NOT NULL,
  `transaction_date` datetime NOT NULL,
  `transaction_status` varchar(45) NOT NULL,
  PRIMARY KEY (`transaction_id`),
  UNIQUE KEY `Index_2` (`sender_id`,`receiver_id`,`book_id`),
  KEY `FK_t_exchange_request_2` (`receiver_id`),
  KEY `FK_t_exchange_request_3` (`book_id`),
  CONSTRAINT `FK_t_exchange_request_1` FOREIGN KEY (`sender_id`) REFERENCES `m_beneficiary` (`id`),
  CONSTRAINT `FK_t_exchange_request_2` FOREIGN KEY (`receiver_id`) REFERENCES `m_beneficiary` (`id`),
  CONSTRAINT `FK_t_exchange_request_3` FOREIGN KEY (`book_id`) REFERENCES `m_book_list` (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_exchange_request`
--

LOCK TABLES `t_exchange_request` WRITE;
/*!40000 ALTER TABLE `t_exchange_request` DISABLE KEYS */;
INSERT INTO `t_exchange_request` VALUES (1,7,1,10,'By Post','2 Days','2024-10-22 18:31:25','Pending'),(3,7,1,1,'1','s','2024-10-22 19:10:47','Pending'),(5,7,1,2,'By Post','5 Days','2024-10-22 19:50:51','Pending'),(7,7,8,31,'By Post to Baguiati Address','10 Days','2024-10-23 12:14:01','Modified');
/*!40000 ALTER TABLE `t_exchange_request` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-29 19:04:58
