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
INSERT INTO `adoption_inquiry` VALUES (3,2,2,'Adoptado','2024-01-11 17:04:46'),(4,3,3,'Adoptado','2024-01-11 17:04:46'),(5,4,4,'Adoptado','2024-01-11 17:04:46'),(6,5,5,'Rechazado','2024-01-11 17:04:46');
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
INSERT INTO `notification` VALUES (4,1,1,1,NULL,'Ha comentado tu publicación',1,'2024-01-11 16:16:01'),(5,5,5,NULL,NULL,'Le ha gustado tu publición',0,'2024-01-11 16:16:01'),(6,6,NULL,NULL,4,'Te ha seguido!',1,'2024-01-11 16:16:01'),(7,8,NULL,NULL,NULL,'Te ha mandado un mensaje!',0,'2024-01-11 16:16:01'),(9,1,1,1,NULL,'Ha comentado tu publicación',1,'2024-01-11 17:04:57'),(10,5,5,NULL,NULL,'Le ha gustado tu publición',0,'2024-01-11 17:04:57'),(11,6,NULL,NULL,4,'Te ha seguido!',1,'2024-01-11 17:04:57'),(12,8,NULL,NULL,NULL,'Te ha mandado un mensaje!',0,'2024-01-11 17:04:57'),(14,4,NULL,NULL,NULL,'Te ha mandado un mensaje!',1,'2024-01-11 17:07:29');
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
INSERT INTO `pet` VALUES (2,1,1,'Mateo','Grande','Adulto','Macho','Golden Retriever','Dorado','Amigable y juguetón','Mateo es un adorable perrito en busca de un hogar','imagenMateo.jpg','Al corriente con vacunas','2024-01-11 16:15:25'),(3,2,2,'Luna','Pequeña','Joven','Hembra','Siamese','Blanco y negro','Curiosa y cariñosa','Luna es una gatita juguetona en busca de un hogar','imagenLuna.jpg','Desparasitada y esterilizada','2024-01-11 16:15:25'),(4,3,1,'Kiwi','Pequeño','Joven','Macho','Cocker','Gris','Sociable y cantarín','Kiwi es un tierno amigo peludo en busca de compañía','imagenKiwi.jpg','Al corriente con vacunas','2024-01-11 16:15:25'),(5,4,1,'Rex','Mediano','Adulto','Macho','Labrador Mix','Negro','Energético y leal','Rex es un perro amistoso listo para ser tu compañero','imagenRex.jpg','Vacunado y esterilizado','2024-01-11 16:15:25'),(6,5,2,'Misty','Pequeña','Adulto','Hembra','Persian','Gris','Juguetona y afectuosa','Misty es una gatita adorable en busca de cariño','imagenMisty.jpg','Desparasitada y vacunada','2024-01-11 16:15:25'),(7,3,2,'Simba','Grande','Joven','Macho','Maine Coon','Naranja y blanco','Regio y sociable','Simba es un gato majestuoso en busca de un reino que llamar hogar','imagenSimba.jpg','Desparasitado y vacunado','2024-01-11 16:15:25'),(8,4,1,'Charlie','Pequeño','Cachorro','Macho','French Bulldog','Atigrado','Divertido y leal','Charlie es un cachorro juguetón en busca de una familia activa','imagenCharlie.jpg','Vacunado y desparasitado','2024-01-11 16:15:25'),(9,5,2,'Miau','Pequeña','Cachorro','Hembra','Persian','Blanco','Curiosa y mimosa','Miau es una gatita encantadora en busca de caricias y juegos','imagenMiau.jpg','Desparasitada y esterilizada','2024-01-11 16:15:25'),(10,1,1,'Rocky','Grande','Adulto','Macho','Boxer','Atigrado','Activo y protector','Rocky es un perro enérgico listo para acompañarte en todas tus aventuras','imagenRocky.jpg','Vacunado y esterilizado','2024-01-11 16:15:25'),(11,2,1,'Bella','Mediana','Adulto','Hembra','Mixed Breed','Negro y blanco','Cariñosa y juguetona','Bella es una perrita amigable en busca de un hogar amoroso','imagenBella.jpg','Vacunada y esterilizada','2024-01-11 16:15:25');
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_name_UNIQUE` (`type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet_type`
--

LOCK TABLES `pet_type` WRITE;
/*!40000 ALTER TABLE `pet_type` DISABLE KEYS */;
INSERT INTO `pet_type` VALUES (2,'Gato'),(1,'Perro');
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
INSERT INTO `shelter` VALUES (1,6,'Casa Refugio Colita Salvada','Somos un refugio de animales activo en CDMX','Ciudad de México','colitasalvada@gmail.com'),(2,7,'Refugio Patitas Felices','Comprometidos con el rescate de perros y gatos en situación de calle','Guadalajara','patitasfelices@gmail.com'),(3,8,'Hogar Amigo de los Animales','Dónde cada patita encuentra un hogar lleno de amor','Monterrey','amigodelosanimales@gmail.com'),(4,9,'Santuario de Mascotas Rescatadas','Ofreciendo un refugio seguro para animales con necesidades especiales','Ciudad Juárez','santuariomascotas@gmail.com'),(5,10,'Rescate Canino Sol Radiante','Rescatando y rehabilitando perros para un futuro más brillante','Cancún','solradiante.rescatecanino@gmail.com');
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
  `role` varchar(25) NOT NULL DEFAULT 'Adopter',
  `user_type` varchar(45) NOT NULL DEFAULT 'Individual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username`),
  UNIQUE KEY `UK_ob8kqyqqgmefl0aco34akdtpe` (`email`),
  CONSTRAINT `user_chk_1` CHECK ((`role` in (_utf8mb3'Adopter',_utf8mb3'PetPoster'))),
  CONSTRAINT `user_chk_2` CHECK ((`user_type` in (_utf8mb3'Individual',_utf8mb3'Shelter')))
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'John','Doe','john_pet',43,'john@example.com','128467365','hashed_password_1','2024-01-11 16:13:53','2024-01-11 16:13:53','Agustos','Alabama','profile1.jpg','Looking forward to adopt a pet!','Adopter','Individual'),(2,'Jane','Smith','jane_animallover',27,'jane@example.com','987654321','hashed_password_2','2024-01-11 16:13:53','2024-01-11 16:13:53','Springfield','Illinois','profile2.jpg','Passionate about animal welfare!','Adopter','Individual'),(3,'Alice','Johnson','alice_pawprints',24,'alice@example.com','555123456','hashed_password_3','2024-01-11 16:13:53','2024-01-11 16:13:53','Barksville','California','profile3.jpg','Rescuing pets is my mission!','Adopter','Individual'),(4,'Bob','Williams','bob_furryfriends',19,'bob@example.com','123456789','hashed_password_4','2024-01-11 16:13:53','2024-01-11 16:13:53','Pawsburg','New York','profile4.jpg','Animal enthusiast seeking companionship.','Adopter','Individual'),(5,'Emma','Taylor','emma_petpal',23,'emma@example.com','111222333','hashed_password_5','2024-01-11 16:13:53','2024-01-11 16:13:53','Furville','Texas','profile5.jpg','Creating a home for furry friends!','Adopter','Individual'),(6,'Michael','Anderson','mike_pawlover',18,'michael@example.com','555678912','hashed_password_6','2024-01-11 16:13:53','2024-01-11 16:13:53','Pawsville','Florida','profile6.jpg','Adopting pets brings joy to my life!','PetPoster','Shelter'),(7,'Sarah','Johnson','sarah_furbuddies',25,'sarah@example.com','123987654','hashed_password_7','2024-01-11 16:13:53','2024-01-11 16:13:53','Furrytown','Texas','profile7.jpg','Fostering pets and making a difference.','PetPoster','Shelter'),(8,'Chris','Williams','chris_petrescuer',35,'chris@example.com','987654321','hashed_password_8','2024-01-11 16:13:53','2024-01-11 16:13:53','Pawstropolis','California','profile8.jpg','Rescuing pets is a lifelong commitment.','PetPoster','Shelter'),(9,'Olivia','Davis','olivia_animaladvocate',20,'olivia@example.com','111222333','hashed_password_9','2024-01-11 16:13:53','2024-01-11 16:13:53','Furville','New York','profile9.jpg','Advocating for the well-being of animals.','PetPoster','Shelter'),(10,'Daniel','Garcia','daniel_petsupporter',18,'daniel@example.com','555444666','hashed_password_10','2024-01-11 16:13:53','2024-01-11 16:13:53','Pawhaven','Arizona','profile10.jpg','Supporting pet adoption and care initiatives.','PetPoster','Shelter'),(12,'Izco','Guerrero','izcogue',20,'izco@example.com','122167365','hashed_password_11','2024-01-11 20:12:20','2024-01-11 20:12:20','Toluca','México',NULL,NULL,'Adopter','Individual'),(18,'Izco','Guerrero','izcgue',20,'izo@example.com','122167365','hashed_password_11','2024-01-12 17:15:19','2024-01-12 17:15:19','Toluca','México',NULL,NULL,'Adopter','Individual'),(19,'Dan','Guerrero','dan',20,'dan@example.com','122167365','hashed_password_11','2024-01-12 20:01:36','2024-01-12 20:01:36','Toluca','México',NULL,NULL,'Adopter','Individual'),(20,'Daniel','Iñiguez','dani',23,'danielig@outlook.com','5510524301','Danielig99*','2024-01-12 20:21:12','2024-01-12 20:21:12','Cancún','México',NULL,NULL,'Adopter','Individual'),(21,'Adriana','Garcis','adri',56,'adri@example.com','3456734823','Danielig99*','2024-01-12 20:43:30','2024-01-12 20:43:30','Cancún','México',NULL,NULL,'Adopter','Individual'),(23,'Sarah','Johnson','sarah_furbuddie',25,'sara@example.com','123987654','hashed_password_7','2024-01-12 21:43:56','2024-01-12 21:43:56','Furrytown','Texas','profile7.jpg','Fostering pets and making a difference.','PetPoster','Shelter'),(25,'Daniel','Iñiguez Garcia','daniel',23,'danielig@outlook.co','2123453454','Danielig99*','2024-01-12 23:44:15','2024-01-12 23:44:15','Ciudad Juárez','México',NULL,NULL,'PetPoster','Shelter'),(26,'Daniel','Iñiguez Garcia','danie',23,'danielig9@outlook.com','5510524309','Danielig99*','2024-01-12 23:47:27','2024-01-12 23:47:27','Toluca','México',NULL,NULL,'Adopter','Individual'),(27,'Daniel','Iñiguez Garcia','dasd',23,'danieli9@outlook.com','5510524309','Danielig99*','2024-01-13 00:11:46','2024-01-13 00:11:46','Toluca','México',NULL,NULL,'Adopter','Individual');
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
INSERT INTO `user_comment` VALUES (1,2,1,'John Doe que gusto que estes caminando por la playa, disfruta!','2024-01-11 16:15:43'),(2,1,1,'Hola Jane Smith! Muchas gracias por tu comentario, y creeme que lo disfrutamos mucho!','2024-01-11 16:15:43'),(3,3,2,'Jane smith! Estas bromeando? Mia es muy hermosa, me alegro por ti!','2024-01-11 16:15:43'),(4,4,3,'Alice en donde se encuentra ese refugio que fuiste a visitar? Mi esposa y yo queremos adoptar un peludo.','2024-01-11 16:15:43'),(5,3,3,'Hola Bob! Se encuentra en Monterrey pero puedes escribi a amigodelosanimales@gmail.com','2024-01-11 16:15:43');
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
INSERT INTO `user_follower` VALUES (1,1,2,'2024-01-11 16:15:41'),(2,4,6,'2024-01-11 16:15:41'),(3,2,8,'2024-01-11 16:15:41'),(4,3,4,'2024-01-11 16:15:41'),(5,5,3,'2024-01-11 16:15:41');
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
INSERT INTO `user_like` VALUES (1,3,1,'2024-01-11 16:15:39'),(2,1,5,'2024-01-11 16:15:39'),(3,4,1,'2024-01-11 16:15:39'),(4,8,4,'2024-01-11 16:15:39'),(5,3,3,'2024-01-11 16:15:39');
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
INSERT INTO `user_post` VALUES (1,1,'Disfrutando una caminata en la playa con Cocker, quien adopté a través del sitio AdoptaPatas','2024-01-11 16:13:58','imagen1.jpg'),(2,2,'¡Nuevo integrante en la familia! Adopté a Mia en el refugio Patitas Felices.','2024-01-11 16:13:58','imagen2.jpg'),(3,3,'Compartiendo momentos de diversión con mis amigos peludos en Hogar Amigo de los Animales.','2024-01-11 16:13:58','imagen3.jpg'),(4,4,'Conociendo a los gatitos del Santuario de Mascotas Rescatadas. Cada uno tiene una historia increíble.️','2024-01-11 16:13:58','imagen4.jpg'),(5,5,'Adopté a Max, un perrito lleno de energía y amor, de Rescate Canino Sol Radiante.','2024-01-11 16:13:58','imagen5.jpg');
/*!40000 ALTER TABLE `user_post` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-13 14:56:17
