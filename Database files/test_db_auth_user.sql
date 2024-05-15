-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (arm64)
--
-- Host: 127.0.0.1    Database: test_db
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$XoQ7rVyetJUlZTIa2t8ZgB$iaY6LXGgCrnVuRcz+aY5cRI8bXt6JnKRsQmZwGZz3lM=','2024-05-15 03:16:30.000000',1,'rajesh','Rajesh Admin','','admin@gmail.com',1,1,'2024-05-08 16:48:26.000000'),(13,'pbkdf2_sha256$600000$NogUlaPzQtUFUtxIy7Ra1k$/svDyt198IJuI189KcprUrnlMBWk6hD5nGzeDQaA8MQ=','2024-05-15 03:09:37.938748',0,'pandarajesh32@gmail.com','Rajesh Kumar Panda','','pandarajesh32@gmail.com',0,1,'2024-05-09 07:28:35.857956'),(14,'pbkdf2_sha256$600000$BwcqHV9VG9ARFdY7BFpOrf$1kOaR+/LlkrQdtx/lIZriOj53VX4KTDuXVRlFY99Spk=','2024-05-15 03:17:22.523690',0,'subha1@gmail.com','subha','','subha1@gmail.com',0,1,'2024-05-11 08:04:58.604183'),(15,'pbkdf2_sha256$600000$W8vDjGYKZGoCCF1M7Pz6rq$0kvH/UZ+W6w20NRuhMjO3Wg5KoFEy+2eTx/HBZKnb8o=','2024-05-13 21:42:12.707441',0,'ptruptirani32@gmail.com','Trupti','','ptruptirani32@gmail.com',0,1,'2024-05-13 20:54:15.976828'),(16,'pbkdf2_sha256$600000$gCfXKfZlVJ8kytcF6DzMUY$Vqo5kwaTBN7R5QRQRul55nctMYpBSSw1/zfRTo9Eptc=','2024-05-15 03:15:56.476371',1,'admin','admin','','admin2@gmail.com',1,1,'2024-05-15 02:57:14.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-15  9:08:18
