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
-- Table structure for table `myapp_userprofile`
--

DROP TABLE IF EXISTS `myapp_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_userprofile` (
  `user_id` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `uid` char(32) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `myapp_userprofile_user_id_8f877d36_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_userprofile`
--

LOCK TABLES `myapp_userprofile` WRITE;
/*!40000 ALTER TABLE `myapp_userprofile` DISABLE KEYS */;
INSERT INTO `myapp_userprofile` VALUES (15,'2024-05-13 20:54:16.229038','02c26526043a4165a8a4fab6b4a1eeaa','2024-05-13 20:54:16.229066'),(14,'2024-05-15 03:17:22.527054','10efe409ee204e7caf38c4ff68b92a71','2024-05-11 08:04:58.937896'),(1,'2024-05-15 03:16:53.503514','6a7dea6d58fb4762a2bafd8542a96559','2024-05-15 02:48:50.166949'),(13,'2024-05-15 03:09:37.942008','6ea88415fcb5420899f793e12fc5e504','2024-05-09 07:28:36.108627'),(16,'2024-05-15 03:15:56.479889','c23455a057b24db782dfb54078ffb0f3','2024-05-15 02:57:14.320835');
/*!40000 ALTER TABLE `myapp_userprofile` ENABLE KEYS */;
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
