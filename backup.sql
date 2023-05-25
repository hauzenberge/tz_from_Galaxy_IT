-- MariaDB dump 10.19  Distrib 10.6.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: tz
-- ------------------------------------------------------
-- Server version	10.6.12-MariaDB-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activations`
--

DROP TABLE IF EXISTS `activations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activations` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `used` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `activations_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activations`
--

LOCK TABLES `activations` WRITE;
/*!40000 ALTER TABLE `activations` DISABLE KEYS */;
/*!40000 ALTER TABLE `activations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_activations`
--

DROP TABLE IF EXISTS `admin_activations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_activations` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `used` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `admin_activations_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_activations`
--

LOCK TABLES `admin_activations` WRITE;
/*!40000 ALTER TABLE `admin_activations` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_activations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_password_resets`
--

DROP TABLE IF EXISTS `admin_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `admin_password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_password_resets`
--

LOCK TABLES `admin_password_resets` WRITE;
/*!40000 ALTER TABLE `admin_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `activated` tinyint(1) NOT NULL DEFAULT 0,
  `forbidden` tinyint(1) NOT NULL DEFAULT 0,
  `language` varchar(2) NOT NULL DEFAULT 'en',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_email_deleted_at_unique` (`email`,`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES (1,'Administrator','Administrator','admin@admin.com','$2y$10$3j2AEISxiS9NkFIHZn0lSOnAp3MAlvoP94pzuCpazwDBxFKPNYBTO','ctmbezt8mSpl8FDSM2BYMbjnDHO1h3edC9uFiZBJMdRpUMZZ4ebuP0vL5xVq',1,0,'en',NULL,'2023-05-25 04:10:23','2023-05-25 12:21:46','2023-05-25 12:21:46'),(2,'Test','Driver','testDriver@admin.com','$2y$10$Srfi50Av.as4DVvyjIT3x.U47Gsl.j3bvvrm5GrotqYi/E/.j6tfq','n8JsnpEF1m6GUxCVotU2LuzQj5cecmUoJrbA57jUuoa8HrtCGsAZyN29fced',1,0,'en',NULL,'2023-05-25 08:29:16','2023-05-25 12:04:10','2023-05-25 12:04:10'),(3,'Test','Maneger','maneger@admin.com','$2y$10$cX8UfNpGBFbxHG60Ba/Zeey40.wACDRE.FF/xZeKBgcyRyAZAjmS.',NULL,1,0,'en',NULL,'2023-05-25 12:23:46','2023-05-25 12:23:46',NULL);
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buses`
--

DROP TABLE IF EXISTS `buses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `license_plate` varchar(255) NOT NULL,
  `brand_id` bigint(20) unsigned NOT NULL,
  `driver_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `buses_license_plate_unique` (`license_plate`),
  KEY `buses_brand_id_foreign` (`brand_id`),
  KEY `buses_driver_id_foreign` (`driver_id`),
  CONSTRAINT `buses_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `car_brands` (`id`),
  CONSTRAINT `buses_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buses`
--

LOCK TABLES `buses` WRITE;
/*!40000 ALTER TABLE `buses` DISABLE KEYS */;
INSERT INTO `buses` VALUES (1,'Ь РМИЛО',1,1,'2023-05-25 10:57:48','2023-05-25 11:38:33'),(2,'АВІРПА',4,NULL,'2023-05-25 10:58:40','2023-05-25 11:37:54');
/*!40000 ALTER TABLE `buses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_brands`
--

DROP TABLE IF EXISTS `car_brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car_brands` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_brands`
--

LOCK TABLES `car_brands` WRITE;
/*!40000 ALTER TABLE `car_brands` DISABLE KEYS */;
INSERT INTO `car_brands` VALUES (1,'Toyota',NULL,NULL),(2,'Honda',NULL,NULL),(3,'Ford',NULL,NULL),(4,'Chevrolet',NULL,NULL),(5,'BMW',NULL,NULL);
/*!40000 ALTER TABLE `car_brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drivers`
--

DROP TABLE IF EXISTS `drivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drivers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `admin_user_id` int(10) unsigned DEFAULT NULL,
  `birthday` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `drivers_admin_user_id_foreign` (`admin_user_id`),
  CONSTRAINT `drivers_admin_user_id_foreign` FOREIGN KEY (`admin_user_id`) REFERENCES `admin_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drivers`
--

LOCK TABLES `drivers` WRITE;
/*!40000 ALTER TABLE `drivers` DISABLE KEYS */;
INSERT INTO `drivers` VALUES (1,2,'1995-10-02','2023-05-25 09:38:10','2023-05-25 09:47:15');
/*!40000 ALTER TABLE `drivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `collection_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `disk` varchar(255) NOT NULL,
  `conversions_disk` varchar(255) DEFAULT NULL,
  `size` bigint(20) unsigned NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`manipulations`)),
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`custom_properties`)),
  `generated_conversions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`generated_conversions`)),
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`responsive_images`)),
  `order_column` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media_uuid_unique` (`uuid`),
  KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  KEY `media_order_column_index` (`order_column`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,'Brackets\\AdminAuth\\Models\\AdminUser',1,'0824fc1f-9561-4cd5-a62e-eab4d3596e21','avatar','avatar','avatar.png','image/png','media','media',23924,'[]','[]','{\"thumb_200\":true,\"thumb_75\":true,\"thumb_150\":true}','[]',1,'2023-05-25 04:10:23','2023-05-25 04:10:23');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2017_08_24_000000_create_activations_table',1),(4,'2017_08_24_000000_create_admin_activations_table',1),(5,'2017_08_24_000000_create_admin_password_resets_table',1),(6,'2017_08_24_000000_create_admin_users_table',1),(7,'2018_07_18_000000_create_wysiwyg_media_table',1),(8,'2019_08_19_000000_create_failed_jobs_table',1),(9,'2019_12_14_000001_create_personal_access_tokens_table',1),(10,'2020_10_21_000000_add_last_login_at_timestamp_to_admin_users_table',1),(11,'2023_05_25_070557_create_media_table',1),(12,'2023_05_25_070557_create_permission_tables',1),(13,'2023_05_25_070557_create_translations_table',1),(14,'2023_05_25_070602_fill_default_admin_user_and_permissions',1),(15,'2023_05_25_071230_fill_permissions_for_role',2),(16,'2023_05_25_090300_create_car_brands_table',3),(17,'2023_05_25_090452_fill_permissions_for_car-brand',4),(18,'2023_05_25_093556_create_drivers_table',5),(19,'2023_05_25_110740_fill_permissions_for_driver',5),(20,'2023_05_25_130535_create_buses_table',6),(21,'2023_05_25_132845_fill_permissions_for_bus',7);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'Brackets\\AdminAuth\\Models\\AdminUser',1),(3,'Brackets\\AdminAuth\\Models\\AdminUser',2),(4,'Brackets\\AdminAuth\\Models\\AdminUser',3);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'admin','admin','2023-05-25 04:10:23','2023-05-25 04:10:23'),(2,'admin.translation.index','admin','2023-05-25 04:10:23','2023-05-25 04:10:23'),(3,'admin.translation.edit','admin','2023-05-25 04:10:23','2023-05-25 04:10:23'),(4,'admin.translation.rescan','admin','2023-05-25 04:10:23','2023-05-25 04:10:23'),(5,'admin.admin-user.index','admin','2023-05-25 04:10:23','2023-05-25 04:10:23'),(6,'admin.admin-user.create','admin','2023-05-25 04:10:23','2023-05-25 04:10:23'),(7,'admin.admin-user.edit','admin','2023-05-25 04:10:23','2023-05-25 04:10:23'),(8,'admin.admin-user.delete','admin','2023-05-25 04:10:23','2023-05-25 04:10:23'),(9,'admin.upload','admin','2023-05-25 04:10:23','2023-05-25 04:10:23'),(10,'admin.admin-user.impersonal-login','admin','2023-05-25 04:10:23','2023-05-25 04:10:23'),(11,'admin.role','admin','2023-05-25 04:12:35','2023-05-25 04:12:35'),(12,'admin.role.index','admin','2023-05-25 04:12:35','2023-05-25 04:12:35'),(13,'admin.role.create','admin','2023-05-25 04:12:35','2023-05-25 04:12:35'),(14,'admin.role.show','admin','2023-05-25 04:12:35','2023-05-25 04:12:35'),(15,'admin.role.edit','admin','2023-05-25 04:12:35','2023-05-25 04:12:35'),(16,'admin.role.delete','admin','2023-05-25 04:12:35','2023-05-25 04:12:35'),(17,'admin.role.bulk-delete','admin','2023-05-25 04:12:35','2023-05-25 04:12:35'),(18,'admin.car-brand','admin','2023-05-25 06:04:55','2023-05-25 06:04:55'),(19,'admin.car-brand.index','admin','2023-05-25 06:04:55','2023-05-25 06:04:55'),(20,'admin.car-brand.create','admin','2023-05-25 06:04:55','2023-05-25 06:04:55'),(21,'admin.car-brand.show','admin','2023-05-25 06:04:55','2023-05-25 06:04:55'),(22,'admin.car-brand.edit','admin','2023-05-25 06:04:55','2023-05-25 06:04:55'),(23,'admin.car-brand.delete','admin','2023-05-25 06:04:55','2023-05-25 06:04:55'),(24,'admin.car-brand.bulk-delete','admin','2023-05-25 06:04:55','2023-05-25 06:04:55'),(25,'admin.driver','admin','2023-05-25 08:26:51','2023-05-25 08:26:51'),(26,'admin.driver.index','admin','2023-05-25 08:26:51','2023-05-25 08:26:51'),(27,'admin.driver.create','admin','2023-05-25 08:26:51','2023-05-25 08:26:51'),(28,'admin.driver.show','admin','2023-05-25 08:26:51','2023-05-25 08:26:51'),(29,'admin.driver.edit','admin','2023-05-25 08:26:51','2023-05-25 08:26:51'),(30,'admin.driver.delete','admin','2023-05-25 08:26:51','2023-05-25 08:26:51'),(31,'admin.driver.bulk-delete','admin','2023-05-25 08:26:51','2023-05-25 08:26:51'),(32,'admin.bus','admin','2023-05-25 10:28:48','2023-05-25 10:28:48'),(33,'admin.bus.index','admin','2023-05-25 10:28:48','2023-05-25 10:28:48'),(34,'admin.bus.create','admin','2023-05-25 10:28:48','2023-05-25 10:28:48'),(35,'admin.bus.show','admin','2023-05-25 10:28:48','2023-05-25 10:28:48'),(36,'admin.bus.edit','admin','2023-05-25 10:28:48','2023-05-25 10:28:48'),(37,'admin.bus.delete','admin','2023-05-25 10:28:48','2023-05-25 10:28:48'),(38,'admin.bus.bulk-delete','admin','2023-05-25 10:28:48','2023-05-25 10:28:48');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` VALUES (1,1),(1,3),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(9,3),(10,3),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(25,3),(25,4),(26,1),(26,3),(26,4),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(32,3),(32,4),(33,1),(33,3),(33,4),(34,1),(35,1),(36,1),(37,1),(38,1);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrator','admin','2023-05-25 04:10:23','2023-05-25 04:10:23'),(3,'Driver','admin','2023-05-25 08:27:45','2023-05-25 08:27:45'),(4,'Maneger','admin','2023-05-25 12:22:53','2023-05-25 12:22:53');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `namespace` varchar(255) NOT NULL DEFAULT '*',
  `group` varchar(255) NOT NULL,
  `key` text NOT NULL,
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`text`)),
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `translations_namespace_index` (`namespace`),
  KEY `translations_group_index` (`group`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
INSERT INTO `translations` VALUES (1,'brackets/admin-ui','admin','operation.succeeded','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(2,'brackets/admin-ui','admin','operation.failed','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(3,'brackets/admin-ui','admin','operation.not_allowed','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(4,'*','admin','admin-user.columns.first_name','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(5,'*','admin','admin-user.columns.last_name','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(6,'*','admin','admin-user.columns.email','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(7,'*','admin','admin-user.columns.password','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(8,'*','admin','admin-user.columns.password_repeat','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(9,'*','admin','admin-user.columns.activated','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(10,'*','admin','admin-user.columns.forbidden','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(11,'*','admin','admin-user.columns.language','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(12,'brackets/admin-ui','admin','forms.select_an_option','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(13,'*','admin','admin-user.columns.roles','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(14,'brackets/admin-ui','admin','forms.select_options','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(15,'*','admin','admin-user.actions.create','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(16,'brackets/admin-ui','admin','btn.save','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(17,'*','admin','admin-user.actions.edit','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(18,'*','admin','admin-user.actions.index','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(19,'brackets/admin-ui','admin','placeholder.search','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(20,'brackets/admin-ui','admin','btn.search','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(21,'*','admin','admin-user.columns.id','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(22,'*','admin','admin-user.columns.last_login_at','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(23,'brackets/admin-ui','admin','btn.edit','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(24,'brackets/admin-ui','admin','btn.delete','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(25,'brackets/admin-ui','admin','pagination.overview','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(26,'brackets/admin-ui','admin','index.no_items','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(27,'brackets/admin-ui','admin','index.try_changing_items','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(28,'brackets/admin-ui','admin','btn.new','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(29,'brackets/admin-ui','admin','profile_dropdown.account','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(30,'brackets/admin-auth','admin','profile_dropdown.profile','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(31,'brackets/admin-auth','admin','profile_dropdown.password','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(32,'brackets/admin-auth','admin','profile_dropdown.logout','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(33,'brackets/admin-ui','admin','sidebar.content','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(34,'brackets/admin-ui','admin','sidebar.settings','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(35,'*','admin','admin-user.actions.edit_password','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(36,'*','admin','admin-user.actions.edit_profile','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(37,'brackets/admin-auth','admin','activation_form.title','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(38,'brackets/admin-auth','admin','activation_form.note','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(39,'brackets/admin-auth','admin','auth_global.email','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(40,'brackets/admin-auth','admin','activation_form.button','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(41,'brackets/admin-auth','admin','login.title','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(42,'brackets/admin-auth','admin','login.sign_in_text','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(43,'brackets/admin-auth','admin','auth_global.password','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(44,'brackets/admin-auth','admin','login.button','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(45,'brackets/admin-auth','admin','login.forgot_password','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(46,'brackets/admin-auth','admin','forgot_password.title','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(47,'brackets/admin-auth','admin','forgot_password.note','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(48,'brackets/admin-auth','admin','forgot_password.button','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(49,'brackets/admin-auth','admin','password_reset.title','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(50,'brackets/admin-auth','admin','password_reset.note','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(51,'brackets/admin-auth','admin','auth_global.password_confirm','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(52,'brackets/admin-auth','admin','password_reset.button','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(53,'brackets/admin-auth','activations','email.line','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(54,'brackets/admin-auth','activations','email.action','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(55,'brackets/admin-auth','activations','email.notRequested','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(56,'brackets/admin-auth','admin','activations.activated','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(57,'brackets/admin-auth','admin','activations.invalid_request','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(58,'brackets/admin-auth','admin','activations.disabled','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(59,'brackets/admin-auth','admin','activations.sent','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(60,'brackets/admin-auth','admin','passwords.sent','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(61,'brackets/admin-auth','admin','passwords.reset','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(62,'brackets/admin-auth','admin','passwords.invalid_token','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(63,'brackets/admin-auth','admin','passwords.invalid_user','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(64,'brackets/admin-auth','admin','passwords.invalid_password','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(65,'brackets/admin-auth','resets','email.line','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(66,'brackets/admin-auth','resets','email.action','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(67,'brackets/admin-auth','resets','email.notRequested','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(68,'*','auth','failed','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(69,'*','auth','throttle','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(70,'brackets/admin-translations','admin','title','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(71,'brackets/admin-translations','admin','index.all_groups','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(72,'brackets/admin-translations','admin','index.edit','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(73,'brackets/admin-translations','admin','index.default_text','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(74,'brackets/admin-translations','admin','index.translation','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(75,'brackets/admin-translations','admin','index.translation_for_language','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(76,'brackets/admin-translations','admin','import.title','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(77,'brackets/admin-translations','admin','import.notice','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(78,'brackets/admin-translations','admin','import.upload_file','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(79,'brackets/admin-translations','admin','import.choose_file','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(80,'brackets/admin-translations','admin','import.language_to_import','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(81,'brackets/admin-translations','admin','fields.select_language','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(82,'brackets/admin-translations','admin','import.do_not_override','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(83,'brackets/admin-translations','admin','import.conflict_notice_we_have_found','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(84,'brackets/admin-translations','admin','import.conflict_notice_translations_to_be_imported','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(85,'brackets/admin-translations','admin','import.conflict_notice_differ','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(86,'brackets/admin-translations','admin','fields.group','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(87,'brackets/admin-translations','admin','fields.default','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(88,'brackets/admin-translations','admin','fields.current_value','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(89,'brackets/admin-translations','admin','fields.imported_value','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(90,'brackets/admin-translations','admin','import.sucesfully_notice','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(91,'brackets/admin-translations','admin','import.sucesfully_notice_update','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(92,'brackets/admin-translations','admin','index.export','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(93,'brackets/admin-translations','admin','export.notice','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(94,'brackets/admin-translations','admin','export.language_to_export','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(95,'brackets/admin-translations','admin','btn.export','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(96,'brackets/admin-translations','admin','index.title','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(97,'brackets/admin-translations','admin','btn.import','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(98,'brackets/admin-translations','admin','btn.re_scan','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(99,'brackets/admin-translations','admin','fields.created_at','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(100,'brackets/admin-translations','admin','index.no_items','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(101,'brackets/admin-translations','admin','index.try_changing_items','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(102,'brackets/admin-ui','admin','media_uploader.max_number_of_files','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(103,'brackets/admin-ui','admin','media_uploader.max_size_pre_file','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(104,'brackets/admin-ui','admin','media_uploader.private_title','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(105,'brackets/admin-ui','admin','page_title_suffix','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(106,'brackets/admin-ui','admin','footer.powered_by','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(107,'*','*','Manage access','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(108,'*','*','Translations','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(109,'*','*','Configuration','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(110,'*','*','Close','[]',NULL,'2023-05-25 04:11:23','2023-05-25 06:00:23',NULL),(111,'*','admin','role.title','[]',NULL,'2023-05-25 06:00:23','2023-05-25 06:00:23',NULL),(112,'*','admin','role.columns.name','[]',NULL,'2023-05-25 06:00:23','2023-05-25 06:00:23',NULL),(113,'*','admin','role.columns.guard_name','[]',NULL,'2023-05-25 06:00:23','2023-05-25 06:00:23',NULL),(114,'*','admin','role.actions.create','[]',NULL,'2023-05-25 06:00:23','2023-05-25 06:00:23',NULL),(115,'*','admin','role.actions.edit','[]',NULL,'2023-05-25 06:00:23','2023-05-25 06:00:23',NULL),(116,'*','admin','role.actions.index','[]',NULL,'2023-05-25 06:00:23','2023-05-25 06:00:23',NULL),(117,'*','admin','role.columns.id','[]',NULL,'2023-05-25 06:00:23','2023-05-25 06:00:23',NULL),(118,'brackets/admin-ui','admin','listing.selected_items','[]',NULL,'2023-05-25 06:00:23','2023-05-25 06:00:23',NULL),(119,'brackets/admin-ui','admin','listing.check_all_items','[]',NULL,'2023-05-25 06:00:23','2023-05-25 06:00:23',NULL),(120,'brackets/admin-ui','admin','listing.uncheck_all_items','[]',NULL,'2023-05-25 06:00:23','2023-05-25 06:00:23',NULL);
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wysiwyg_media`
--

DROP TABLE IF EXISTS `wysiwyg_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wysiwyg_media` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_path` varchar(255) NOT NULL,
  `wysiwygable_id` int(10) unsigned DEFAULT NULL,
  `wysiwygable_type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wysiwyg_media_wysiwygable_id_index` (`wysiwygable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wysiwyg_media`
--

LOCK TABLES `wysiwyg_media` WRITE;
/*!40000 ALTER TABLE `wysiwyg_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `wysiwyg_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'tz'
--

--
-- Dumping routines for database 'tz'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-25 18:24:12
