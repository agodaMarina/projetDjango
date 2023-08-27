CREATE DATABASE  IF NOT EXISTS `projetmoodle` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `projetmoodle`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: projetmoodle
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `app_cours`
--

DROP TABLE IF EXISTS `app_cours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_cours` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `libelle` varchar(3000) NOT NULL,
  `enseignant_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_cours_enseignant_id_8e4bb6f0_fk_authentification_teacher_id` (`enseignant_id`),
  CONSTRAINT `app_cours_enseignant_id_8e4bb6f0_fk_authentification_teacher_id` FOREIGN KEY (`enseignant_id`) REFERENCES `authentification_teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_cours`
--

LOCK TABLES `app_cours` WRITE;
/*!40000 ALTER TABLE `app_cours` DISABLE KEYS */;
INSERT INTO `app_cours` VALUES (1,'Python',1),(2,'Djnago',1);
/*!40000 ALTER TABLE `app_cours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_cours_etudiants`
--

DROP TABLE IF EXISTS `app_cours_etudiants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_cours_etudiants` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cours_id` bigint NOT NULL,
  `student_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_cours_etudiants_cours_id_student_id_258b9e9e_uniq` (`cours_id`,`student_id`),
  KEY `app_cours_etudiants_student_id_4426e175_fk_authentif` (`student_id`),
  CONSTRAINT `app_cours_etudiants_cours_id_d2abc076_fk_app_cours_id` FOREIGN KEY (`cours_id`) REFERENCES `app_cours` (`id`),
  CONSTRAINT `app_cours_etudiants_student_id_4426e175_fk_authentif` FOREIGN KEY (`student_id`) REFERENCES `authentification_student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_cours_etudiants`
--

LOCK TABLES `app_cours_etudiants` WRITE;
/*!40000 ALTER TABLE `app_cours_etudiants` DISABLE KEYS */;
INSERT INTO `app_cours_etudiants` VALUES (1,1,1),(2,1,2),(3,2,3);
/*!40000 ALTER TABLE `app_cours_etudiants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_fichierdesoumission`
--

DROP TABLE IF EXISTS `app_fichierdesoumission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fichierdesoumission` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `libelle` varchar(300) NOT NULL,
  `fichier` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_fichierdesoumission`
--

LOCK TABLES `app_fichierdesoumission` WRITE;
/*!40000 ALTER TABLE `app_fichierdesoumission` DISABLE KEYS */;
INSERT INTO `app_fichierdesoumission` VALUES (1,'projetKOKOU','course_files/django_ipnet_app.rar');
/*!40000 ALTER TABLE `app_fichierdesoumission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_projet`
--

DROP TABLE IF EXISTS `app_projet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_projet` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `intitule` varchar(3000) NOT NULL,
  `fichier` varchar(100) NOT NULL,
  `statut` varchar(3000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_projet`
--

LOCK TABLES `app_projet` WRITE;
/*!40000 ALTER TABLE `app_projet` DISABLE KEYS */;
INSERT INTO `app_projet` VALUES (2,'projetdjango','course_files/IPNET_EXPERT_PROJET_2022-2023_y26MpFm.pdf','En Cours');
/*!40000 ALTER TABLE `app_projet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_user'),(22,'Can change user',6,'change_user'),(23,'Can delete user',6,'delete_user'),(24,'Can view user',6,'view_user'),(25,'Can add user',7,'add_enseignant'),(26,'Can change user',7,'change_enseignant'),(27,'Can delete user',7,'delete_enseignant'),(28,'Can view user',7,'view_enseignant'),(29,'Can add user',8,'add_etudiant'),(30,'Can change user',8,'change_etudiant'),(31,'Can delete user',8,'delete_etudiant'),(32,'Can view user',8,'view_etudiant'),(33,'Can add student',9,'add_student'),(34,'Can change student',9,'change_student'),(35,'Can delete student',9,'delete_student'),(36,'Can view student',9,'view_student'),(37,'Can add teacher',10,'add_teacher'),(38,'Can change teacher',10,'change_teacher'),(39,'Can delete teacher',10,'delete_teacher'),(40,'Can view teacher',10,'view_teacher'),(41,'Can add cours',11,'add_cours'),(42,'Can change cours',11,'change_cours'),(43,'Can delete cours',11,'delete_cours'),(44,'Can view cours',11,'view_cours'),(45,'Can add fichier de soumission',12,'add_fichierdesoumission'),(46,'Can change fichier de soumission',12,'change_fichierdesoumission'),(47,'Can delete fichier de soumission',12,'delete_fichierdesoumission'),(48,'Can view fichier de soumission',12,'view_fichierdesoumission'),(49,'Can add projet',13,'add_projet'),(50,'Can change projet',13,'change_projet'),(51,'Can delete projet',13,'delete_projet'),(52,'Can view projet',13,'view_projet');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authentification_student`
--

DROP TABLE IF EXISTS `authentification_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authentification_student` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `number` int NOT NULL,
  `student_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_id` (`student_id`),
  CONSTRAINT `authentification_stu_student_id_b35e1c14_fk_authentif` FOREIGN KEY (`student_id`) REFERENCES `authentification_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authentification_student`
--

LOCK TABLES `authentification_student` WRITE;
/*!40000 ALTER TABLE `authentification_student` DISABLE KEYS */;
INSERT INTO `authentification_student` VALUES (1,2,3),(2,1,2),(3,5,8);
/*!40000 ALTER TABLE `authentification_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authentification_teacher`
--

DROP TABLE IF EXISTS `authentification_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authentification_teacher` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `number` int NOT NULL,
  `teacher_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_id` (`teacher_id`),
  CONSTRAINT `authentification_tea_teacher_id_235d37a6_fk_authentif` FOREIGN KEY (`teacher_id`) REFERENCES `authentification_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authentification_teacher`
--

LOCK TABLES `authentification_teacher` WRITE;
/*!40000 ALTER TABLE `authentification_teacher` DISABLE KEYS */;
INSERT INTO `authentification_teacher` VALUES (1,2,5),(2,11,9);
/*!40000 ALTER TABLE `authentification_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authentification_user`
--

DROP TABLE IF EXISTS `authentification_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authentification_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `is_student` tinyint(1) NOT NULL,
  `is_teacher` tinyint(1) NOT NULL,
  `date_de_naissance` date NOT NULL,
  `is_visit` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authentification_user`
--

LOCK TABLES `authentification_user` WRITE;
/*!40000 ALTER TABLE `authentification_user` DISABLE KEYS */;
INSERT INTO `authentification_user` VALUES (1,'pbkdf2_sha256$600000$hkuQsG22fR0do0KQ8rmcck$HfYAKg5Rh4aEiXObX5oHf6uS47g4daU7G7zmBoRusgs=','2023-08-27 13:05:38.767815',0,'Marina','agoda','marina','marina@gmail.com',0,1,'2023-08-21 15:05:07.429322',0,0,'2023-08-27',1),(2,'pbkdf2_sha256$600000$1y15vlqyRJI4aXyXq4V8tC$a+TtRCbDZuv5BfKXVRIZxbF5yqCBjy5qxfvIlNAIxXg=','2023-08-21 15:13:31.321808',0,'user','test','test','rinouchagd@gmail.com',0,1,'2023-08-21 15:13:30.803221',0,0,'2023-08-27',1),(3,'pbkdf2_sha256$600000$TfrmdiVw3u7jJ8mhBh9S5A$PTNBy08nKdQ4HpfCo8BGv6A5LtaC4BkZbOHg3W5VwoI=','2023-08-23 22:37:18.276493',0,'ipnet','ipnet','MACA','lorilei.10@usettingh.com',0,1,'2023-08-23 22:37:17.577770',0,0,'2023-08-27',1),(4,'pbkdf2_sha256$600000$vxhZkBKI2QfIVnE3gxdaoS$k9rmgizbqzaew4RG3cAbqo/XpqzFbPWKteds1SP+tfM=','2023-08-27 14:34:15.751270',1,'Admin','','','admin@gmail.com',1,1,'2023-08-24 23:30:15.482458',0,0,'2023-08-27',1),(5,'TeacherKofi007',NULL,0,'kofi','kofi','test','kofidjondo@gmail.com',0,1,'2023-08-26 06:18:39.000000',0,1,'2023-08-27',0),(6,'pbkdf2_sha256$600000$mUl9ex7vTmpcFcQouYONtH$TvTVjUiL7/BlCfsbS1rh7S99ETbW8o2Aq1KxN4eTnT0=',NULL,0,'klm','','','',0,1,'2023-08-26 18:05:04.041555',0,0,'2023-08-27',1),(7,'pbkdf2_sha256$600000$9RnG2KTQ0ZBucPhkksk9gQ$tnPmLlPgWZ3QHhy6bKlqsAezUtBJi6VzZk705Qy+hpU=',NULL,0,'yohannes','','','',0,1,'2023-08-26 19:42:11.745722',0,0,'2023-08-27',1),(8,'pbkdf2_sha256$600000$GrOYXuB9bvx70djXJf3VZi$zFphhf2Cb917e08hOtBtqhsqMtl2nomeBbr9JOvtYm4=','2023-08-27 17:38:52.075116',0,'kokou007','KOKOU','albert','alberto@gmail.com',0,1,'2023-08-27 13:33:05.000000',1,0,'2023-08-27',0),(9,'pbkdf2_sha256$600000$DXFZ2tBTGNyYjU5hAcZxmf$TEnz6sVk1MrzKSYKsiEAZSpVRjNIBjvsU3vO1OsHoWI=','2023-08-27 17:41:53.765252',0,'Teacher123','ZEGUE','junior','',0,1,'2023-08-27 15:59:46.000000',0,1,'2023-08-27',0);
/*!40000 ALTER TABLE `authentification_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authentification_user_groups`
--

DROP TABLE IF EXISTS `authentification_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authentification_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `authentification_user_groups_user_id_group_id_8756f2ae_uniq` (`user_id`,`group_id`),
  KEY `authentification_user_groups_group_id_81eeee0f_fk_auth_group_id` (`group_id`),
  CONSTRAINT `authentification_use_user_id_43be5d3c_fk_authentif` FOREIGN KEY (`user_id`) REFERENCES `authentification_user` (`id`),
  CONSTRAINT `authentification_user_groups_group_id_81eeee0f_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authentification_user_groups`
--

LOCK TABLES `authentification_user_groups` WRITE;
/*!40000 ALTER TABLE `authentification_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `authentification_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authentification_user_user_permissions`
--

DROP TABLE IF EXISTS `authentification_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authentification_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `authentification_user_us_user_id_permission_id_0505c2b8_uniq` (`user_id`,`permission_id`),
  KEY `authentification_use_permission_id_62750d9c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `authentification_use_permission_id_62750d9c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `authentification_use_user_id_576a50aa_fk_authentif` FOREIGN KEY (`user_id`) REFERENCES `authentification_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authentification_user_user_permissions`
--

LOCK TABLES `authentification_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `authentification_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `authentification_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_authentification_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_authentification_user_id` FOREIGN KEY (`user_id`) REFERENCES `authentification_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-08-26 20:31:55.357979','1','ipnet MACA',1,'[{\"added\": {}}]',9,4),(2,'2023-08-27 10:28:34.437981','2','test test',1,'[{\"added\": {}}]',9,4),(3,'2023-08-27 10:28:54.900429','1','kofi test',1,'[{\"added\": {}}]',10,4),(4,'2023-08-27 10:34:02.786515','1','Python',1,'[{\"added\": {}}]',11,4),(5,'2023-08-27 10:35:19.517237','1','projet1',1,'[{\"added\": {}}]',13,4),(6,'2023-08-27 13:42:23.667540','3','kokou007',1,'[{\"added\": {}}]',9,4),(7,'2023-08-27 13:43:20.290051','8','kokou007 (KOKOU albert)',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email\"]}}]',6,4),(8,'2023-08-27 13:44:06.501341','8','kokou007 (KOKOU albert)',2,'[{\"changed\": {\"fields\": [\"Is student\", \"Is visit\"]}}]',6,4),(9,'2023-08-27 14:13:18.414315','2','Djnago',1,'[{\"added\": {}}]',11,4),(10,'2023-08-27 14:37:48.428582','5','kofi (kofi test)',2,'[{\"changed\": {\"fields\": [\"Password\", \"Is teacher\", \"Is visit\"]}}]',6,4),(11,'2023-08-27 16:02:32.284895','9','Teacher123 (Teacher123)',2,'[{\"changed\": {\"fields\": [\"Is teacher\", \"Is visit\"]}}]',6,4),(12,'2023-08-27 16:02:48.440665','2','Teacher123',1,'[{\"added\": {}}]',10,4),(13,'2023-08-27 16:15:57.884931','9','Teacher123 (ZEGUE junior)',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]',6,4),(14,'2023-08-27 17:10:56.066800','2','projetdjango',1,'[{\"added\": {}}]',13,4),(15,'2023-08-27 17:13:15.848728','1','projet1',3,'',13,4),(16,'2023-08-27 17:41:25.420789','1','FichierDeSoumission object (1)',1,'[{\"added\": {}}]',12,4);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(11,'app','cours'),(12,'app','fichierdesoumission'),(13,'app','projet'),(3,'auth','group'),(2,'auth','permission'),(7,'authentification','enseignant'),(8,'authentification','etudiant'),(9,'authentification','student'),(10,'authentification','teacher'),(6,'authentification','user'),(4,'contenttypes','contenttype'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-08-21 14:37:22.878799'),(2,'contenttypes','0002_remove_content_type_name','2023-08-21 14:37:23.004099'),(3,'auth','0001_initial','2023-08-21 14:37:23.380636'),(4,'auth','0002_alter_permission_name_max_length','2023-08-21 14:37:23.463383'),(5,'auth','0003_alter_user_email_max_length','2023-08-21 14:37:23.473389'),(6,'auth','0004_alter_user_username_opts','2023-08-21 14:37:23.485325'),(7,'auth','0005_alter_user_last_login_null','2023-08-21 14:37:23.496294'),(8,'auth','0006_require_contenttypes_0002','2023-08-21 14:37:23.503275'),(9,'auth','0007_alter_validators_add_error_messages','2023-08-21 14:37:23.513249'),(10,'auth','0008_alter_user_username_max_length','2023-08-21 14:37:23.525217'),(11,'auth','0009_alter_user_last_name_max_length','2023-08-21 14:37:23.537184'),(12,'auth','0010_alter_group_name_max_length','2023-08-21 14:37:23.566107'),(13,'auth','0011_update_proxy_permissions','2023-08-21 14:37:23.581103'),(14,'auth','0012_alter_user_first_name_max_length','2023-08-21 14:37:23.602013'),(15,'authentification','0001_initial','2023-08-21 14:37:24.288207'),(16,'admin','0001_initial','2023-08-21 14:37:24.495623'),(17,'admin','0002_logentry_remove_auto_add','2023-08-21 14:37:24.510580'),(18,'admin','0003_logentry_add_action_flag_choices','2023-08-21 14:37:24.527535'),(19,'authentification','0002_alter_user_email_alter_user_first_name_and_more','2023-08-21 14:37:24.593910'),(20,'sessions','0001_initial','2023-08-21 14:37:24.658732'),(21,'authentification','0003_enseignant_etudiant_remove_user_numero','2023-08-24 23:16:05.871979'),(22,'authentification','0004_alter_user_date_de_naissance','2023-08-24 23:29:49.723684'),(23,'authentification','0005_student_teacher_remove_etudiant_user_ptr_and_more','2023-08-26 16:28:13.088637'),(24,'authentification','0006_student_date_teacher_date','2023-08-26 16:28:13.232878'),(25,'authentification','0007_remove_user_is_parent_student_is_student_and_more','2023-08-26 19:09:59.254589'),(26,'authentification','0008_rename_student_teacher_teacher','2023-08-26 19:17:41.650867'),(27,'authentification','0009_remove_student_date_remove_student_is_student_and_more','2023-08-27 10:22:20.548826'),(28,'app','0001_initial','2023-08-27 10:22:21.214359'),(29,'authentification','0010_user_is_visit','2023-08-27 11:31:58.421806'),(30,'app','0002_remove_projet_mariere','2023-08-27 17:09:48.253953');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('d7ia6w97kiqpk3jqzz078y1n5z821nkx','e30:1qY6Sq:2ztMaflaWplqqhBQmGig2PbDVgrgVJuQ4q_udfHYmrY','2023-09-04 15:05:08.003171'),('t7pz2ytua48baazuf7vsz0i03jz41a4h','.eJxVjEsOgjAUAO_StWnoKy3FpXvO0LxfBTWQUFgZ725IWOh2ZjJvk3HfxrxXXfMk5mpac_llhPzU-RDywPm-WF7mbZ3IHok9bbXDIvq6ne3fYMQ6Hltx0GhynARa5zQUTwwQfGp64A4KFuoilZi8Bo1Q1PeUJDrm2BGi-XwB2fc4Mg:1qaGqF:sUks9VnoERtrVkc2uRbYUukKe7NKkmKxiOjz0LDnBUw','2023-09-10 14:34:15.760225'),('wydeagkozbnb3fwjsb0oododmyqy0hy5','.eJxVjEEOwiAUBe_C2pBC4Utduu8Zmgd8pGogKe3KeHdt0oVu38y8l5iwrXnaGi_THMVFDOL0u3mEB5cdxDvKrcpQy7rMXu6KPGiTY438vB7u30FGy9_a6GDZIHiinnp2xIosmQ6eA7QjA6t8GJJx5LRX9qwBC5NSBya4JN4f5eI4Mw:1qaJlp:484e2_gE-Uea0ps5U8EVf30odPWUPoAQR_Faiatasfc','2023-09-10 17:41:53.770242');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-27 19:34:33
