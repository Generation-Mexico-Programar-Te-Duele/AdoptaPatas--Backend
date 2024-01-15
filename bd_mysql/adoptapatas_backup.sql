-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: adoptapatas
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `adoption_inquiry`
--

DROP TABLE IF EXISTS `adoption_inquiry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adoption_inquiry` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `inquiry_user_id` bigint NOT NULL,
  `pet_id` bigint NOT NULL,
  `status` varchar(45) NOT NULL,
  `date_started` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`inquiry_user_id`),
  KEY `pet_id_idx` (`pet_id`),
  CONSTRAINT `inquiry_user_id` FOREIGN KEY (`inquiry_user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `pet_id` FOREIGN KEY (`pet_id`) REFERENCES `pet` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adoption_inquiry`
--

LOCK TABLES `adoption_inquiry` WRITE;
/*!40000 ALTER TABLE `adoption_inquiry` DISABLE KEYS */;
/*!40000 ALTER TABLE `adoption_inquiry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `post_id` bigint DEFAULT NULL,
  `comment_id` bigint DEFAULT NULL,
  `user_follower_id` bigint DEFAULT NULL,
  `notification_type` varchar(50) NOT NULL,
  `is_read` tinyint NOT NULL DEFAULT '0',
  `date_notified` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`),
  KEY `post_id_idx` (`post_id`),
  KEY `comment_id_idx` (`comment_id`),
  KEY `follower_user_id_idx` (`user_follower_id`),
  CONSTRAINT `comment_id` FOREIGN KEY (`comment_id`) REFERENCES `user_comment` (`id`),
  CONSTRAINT `post_id` FOREIGN KEY (`post_id`) REFERENCES `user_post` (`id`),
  CONSTRAINT `user_follower_id` FOREIGN KEY (`user_follower_id`) REFERENCES `user` (`id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet`
--

DROP TABLE IF EXISTS `pet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pet` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `pet_user_id` bigint NOT NULL,
  `pet_type_id` bigint NOT NULL,
  `name` varchar(30) NOT NULL,
  `size` varchar(30) NOT NULL,
  `age` varchar(25) NOT NULL,
  `sex` varchar(20) NOT NULL,
  `breed` varchar(30) NOT NULL,
  `color` varchar(30) DEFAULT NULL,
  `characteristics` tinytext,
  `description` text NOT NULL,
  `pet_image` varchar(255) NOT NULL,
  `health` tinytext NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`pet_user_id`),
  KEY `pet_type_id_idx` (`pet_type_id`),
  CONSTRAINT `pet_type_id` FOREIGN KEY (`pet_type_id`) REFERENCES `pet_type` (`id`),
  CONSTRAINT `pet_user_id` FOREIGN KEY (`pet_user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet`
--

LOCK TABLES `pet` WRITE;
/*!40000 ALTER TABLE `pet` DISABLE KEYS */;
/*!40000 ALTER TABLE `pet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet_type`
--

DROP TABLE IF EXISTS `pet_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pet_type` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet_type`
--

LOCK TABLES `pet_type` WRITE;
/*!40000 ALTER TABLE `pet_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `pet_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shelter`
--

DROP TABLE IF EXISTS `shelter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shelter` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_origin_id` bigint NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `location` varchar(255) NOT NULL,
  `contact_email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contact_email_UNIQUE` (`contact_email`),
  KEY `user_id_idx` (`user_origin_id`),
  CONSTRAINT `user_origin_id` FOREIGN KEY (`user_origin_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shelter`
--

LOCK TABLES `shelter` WRITE;
/*!40000 ALTER TABLE `shelter` DISABLE KEYS */;
/*!40000 ALTER TABLE `shelter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(65) NOT NULL,
  `last_name` varchar(65) NOT NULL,
  `username` varchar(50) NOT NULL,
  `age` int NOT NULL,
  `email` varchar(60) NOT NULL,
  `phone` varchar(16) NOT NULL,
  `password_hash` varchar(45) NOT NULL,
  `registered_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `bio` tinytext,
  `user_type_id` bigint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_user_user_type1_idx` (`user_type_id`),
  CONSTRAINT `fk_user_user_type1` FOREIGN KEY (`user_type_id`) REFERENCES `user_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'John','Doe','john_pet',43,'john@example.com','128467365','hashed_password_1','2024-01-13 18:31:45','2024-01-13 18:31:45','Agustos','Alabama','profile1.jpg','Looking forward to adopt a pet!',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_comment`
--

DROP TABLE IF EXISTS `user_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `comment_user_id` bigint NOT NULL,
  `source_post_id` bigint NOT NULL,
  `content` varchar(255) NOT NULL,
  `date_posted` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`comment_user_id`),
  KEY `post_id_idx` (`source_post_id`),
  CONSTRAINT `comment_user_id` FOREIGN KEY (`comment_user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `source_post_id` FOREIGN KEY (`source_post_id`) REFERENCES `user_post` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_comment`
--

LOCK TABLES `user_comment` WRITE;
/*!40000 ALTER TABLE `user_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_follower`
--

DROP TABLE IF EXISTS `user_follower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_follower` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `follower_user_id` bigint NOT NULL,
  `followed_user_id` bigint NOT NULL,
  `date_followed` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`follower_user_id`),
  KEY `follower_user_id_idx` (`followed_user_id`),
  CONSTRAINT `followed_user_id` FOREIGN KEY (`followed_user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `follower_user_id` FOREIGN KEY (`follower_user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_follower`
--

LOCK TABLES `user_follower` WRITE;
/*!40000 ALTER TABLE `user_follower` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_follower` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_like`
--

DROP TABLE IF EXISTS `user_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_like` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `source_like_user_id` bigint NOT NULL,
  `liked_post_id` bigint NOT NULL,
  `date_liked` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`source_like_user_id`),
  KEY `post_id_idx` (`liked_post_id`),
  CONSTRAINT `liked_post_id` FOREIGN KEY (`liked_post_id`) REFERENCES `user_post` (`id`),
  CONSTRAINT `source_like_user_id` FOREIGN KEY (`source_like_user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_like`
--

LOCK TABLES `user_like` WRITE;
/*!40000 ALTER TABLE `user_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_post`
--

DROP TABLE IF EXISTS `user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_post` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `source_user_id` bigint NOT NULL,
  `message` tinytext,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`source_user_id`),
  CONSTRAINT `source_user_id` FOREIGN KEY (`source_user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_post`
--

LOCK TABLES `user_post` WRITE;
/*!40000 ALTER TABLE `user_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_type`
--

DROP TABLE IF EXISTS `user_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_type` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_type` varchar(45) NOT NULL DEFAULT 'Individual',
  `role` varchar(25) NOT NULL DEFAULT 'Adopter',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `user_type_UNIQUE` (`user_type`),
  CONSTRAINT `user_type_chk_1` CHECK ((`user_type` in (_utf8mb4'Individual',_utf8mb4'Shelter'))),
  CONSTRAINT `user_type_chk_2` CHECK ((`role` in (_utf8mb4'Adopter',_utf8mb4'PetPoster')))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_type`
--

LOCK TABLES `user_type` WRITE;
/*!40000 ALTER TABLE `user_type` DISABLE KEYS */;
INSERT INTO `user_type` VALUES (1,'Individual','Adopter'),(2,'Shelter','PetPoster');
/*!40000 ALTER TABLE `user_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-13 23:50:25
