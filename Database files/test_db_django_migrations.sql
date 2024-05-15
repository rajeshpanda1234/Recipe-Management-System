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
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-05-08 16:01:02.611759'),(2,'auth','0001_initial','2024-05-08 16:01:02.746666'),(3,'admin','0001_initial','2024-05-08 16:01:02.770612'),(4,'admin','0002_logentry_remove_auto_add','2024-05-08 16:01:02.773823'),(5,'admin','0003_logentry_add_action_flag_choices','2024-05-08 16:01:02.776750'),(6,'contenttypes','0002_remove_content_type_name','2024-05-08 16:01:02.795089'),(7,'auth','0002_alter_permission_name_max_length','2024-05-08 16:01:02.806284'),(8,'auth','0003_alter_user_email_max_length','2024-05-08 16:01:02.813466'),(9,'auth','0004_alter_user_username_opts','2024-05-08 16:01:02.817505'),(10,'auth','0005_alter_user_last_login_null','2024-05-08 16:01:02.827657'),(11,'auth','0006_require_contenttypes_0002','2024-05-08 16:01:02.828649'),(12,'auth','0007_alter_validators_add_error_messages','2024-05-08 16:01:02.832540'),(13,'auth','0008_alter_user_username_max_length','2024-05-08 16:01:02.845627'),(14,'auth','0009_alter_user_last_name_max_length','2024-05-08 16:01:02.860429'),(15,'auth','0010_alter_group_name_max_length','2024-05-08 16:01:02.867686'),(16,'auth','0011_update_proxy_permissions','2024-05-08 16:01:02.871185'),(17,'auth','0012_alter_user_first_name_max_length','2024-05-08 16:01:02.885499'),(18,'sessions','0001_initial','2024-05-08 16:01:02.890977'),(19,'myapp','0001_initial','2024-05-08 16:14:25.519927'),(20,'myapp','0002_remove_userprofile_id_userprofile_created_at_and_more','2024-05-09 03:52:10.886133'),(21,'myapp','0003_recipe_image','2024-05-09 10:22:35.811602'),(22,'myapp','0004_rename_comment_feedback_message','2024-05-10 11:10:19.253605'),(23,'myapp','0005_alter_feedback_rating','2024-05-10 18:23:14.805218'),(24,'myapp','0006_alter_feedback_rating','2024-05-10 18:29:15.651971'),(25,'myapp','0007_alter_feedback_rating','2024-05-10 18:30:12.498673'),(26,'myapp','0008_alter_feedback_user','2024-05-11 09:37:07.596289'),(27,'myapp','0009_alter_feedback_user','2024-05-11 09:51:17.675784'),(28,'myapp','0010_alter_recipe_image','2024-05-12 05:25:12.731525'),(29,'myapp','0011_alter_recipe_image','2024-05-12 07:16:49.005241'),(30,'myapp','0012_alter_recipe_created_at','2024-05-14 04:07:58.899882'),(31,'myapp','0013_remove_userprofile_bio_and_more','2024-05-14 04:30:19.921739'),(32,'myapp','0014_alter_recipe_category','2024-05-15 01:27:50.284366'),(33,'myapp','0015_alter_recipe_category','2024-05-15 01:36:27.272016'),(34,'myapp','0016_alter_category_name','2024-05-15 02:12:26.954903');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
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
