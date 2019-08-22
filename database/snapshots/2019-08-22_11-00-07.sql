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
DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_05_28_121359_create_morphology_type_table',1),(4,'2019_05_28_121442_create_morphology_table',1),(5,'2019_05_28_121520_create_subject_table',1),(6,'2019_05_28_121523_create_image_type_table',1),(7,'2019_05_28_121526_create_image_subject_table',1),(8,'2019_05_28_121550_create_project_table',1),(9,'2019_05_28_182903_create_peppe_table',1),(10,'2019_08_04_135815_add_type_to_morphology_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `morphology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `morphology` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_morphology_type` int(10) unsigned NOT NULL,
  `description` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `morphology_id_morphology_type_foreign` (`id_morphology_type`),
  CONSTRAINT `morphology_id_morphology_type_foreign` FOREIGN KEY (`id_morphology_type`) REFERENCES `morphology` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `morphology` WRITE;
/*!40000 ALTER TABLE `morphology` DISABLE KEYS */;
INSERT INTO `morphology` VALUES (1,2,'Occhio europeo Dx','images/shape/occhio_europeo_dx.png','cx'),(2,2,'Occhio europeo Sx','images/shape/occhio_europeo_sx.png','cx'),(3,2,'Occhio obliquo Dx','images/shape/occhio_obliquo_dx.png','cx'),(4,2,'Occhio obliquo Sx','images/shape/occhio_obliquo_sx.png','cx'),(5,2,'Briglia mongolica Dx','images/shape/briglia_mongolica_dx.png','cx'),(6,2,'Briglia mongolica Sx','images/shape/briglia_mongolica_sx.png','cx'),(7,2,'Briglia epicantica mondiale Dx','images/shape/briglia_epicantica_mondiale_dx.png','cx'),(8,2,'Briglia epicantica mondiale Sx','images/shape/briglia_epicantica_mondiale_sx.png','cx'),(9,2,'Occhio mongolico Dx','images/shape/occhio_mongolico_dx.png','cx'),(10,2,'Occhio mongolico Sx','images/shape/occhio_mongolico_sx.png','cx'),(11,2,'Plica della palpebra superiore Dx','images/shape/plica_della_palpebra_superiore_dx.png','cx'),(12,2,'Plica della palpebra superiore Sx','images/shape/plica_della_palpebra_superiore_sx.png','cx'),(13,3,'Labbra Frontale Piccole','images/shape/labbra_frontale_piccole.png','cx'),(14,3,'Labbra Frontale Medie','images/shape/labbra_frontale_medie.png','cx'),(15,3,'Labbra Frontale Grandi','images/shape/labbra_frontale_grandi.png','cx'),(16,3,'Labbra Piccole Tipo 1 Dx','images/shape/labbra_profilo_piccole_1_dx.png','dx'),(17,3,'Labbra Piccole Tipo 1 Sx','images/shape/labbra_profilo_piccole_1_sx.png','sx'),(18,3,'Labbra Piccole Tipo 2 Dx','images/shape/labbra_profilo_piccole_2_dx.png','dx'),(19,3,'Labbra Piccole Tipo 2 Sx','images/shape/labbra_profilo_piccole_2_sx.png','sx'),(20,3,'Labbra Piccole Tipo 3 Dx','images/shape/labbra_profilo_piccole_3_dx.png','dx'),(21,3,'Labbra Piccole Tipo 3 Sx','images/shape/labbra_profilo_piccole_3_sx.png','sx'),(22,3,'Labbra Piccole Tipo 4 Dx','images/shape/labbra_profilo_piccole_4_dx.png','dx'),(23,3,'Labbra Piccole Tipo 4 Sx','images/shape/labbra_profilo_piccole_4_sx.png','sx'),(24,3,'Labbra Medie Tipo 1 Dx','images/shape/labbra_profilo_medie_1_dx.png','dx'),(25,3,'Labbra Medie Tipo 1 Sx','images/shape/labbra_profilo_medie_1_sx.png','sx'),(26,3,'Labbra Medie Tipo 2 Dx','images/shape/labbra_profilo_medie_2_dx.png','dx'),(27,3,'Labbra Medie Tipo 2 Sx','images/shape/labbra_profilo_medie_2_sx.png','sx'),(28,3,'Labbra Medie Tipo 3 Dx','images/shape/labbra_profilo_medie_3_dx.png','dx'),(29,3,'Labbra Medie Tipo 3 Sx','images/shape/labbra_profilo_medie_3_sx.png','sx'),(30,3,'Labbra Medie Tipo 4 Dx','images/shape/labbra_profilo_medie_4_dx.png','dx'),(31,3,'Labbra Medie Tipo 4 Sx','images/shape/labbra_profilo_medie_4_sx.png','sx'),(32,3,'Labbra Grandi Tipo 1 Dx','images/shape/labbra_profilo_grandi_1_dx.png','dx'),(33,3,'Labbra Grandi Tipo 1 Sx','images/shape/labbra_profilo_grandi_1_sx.png','sx'),(34,3,'Labbra Grandi Tipo 2 Dx','images/shape/labbra_profilo_grandi_2_dx.png','dx'),(35,3,'Labbra Grandi Tipo 2 Sx','images/shape/labbra_profilo_grandi_2_sx.png','sx'),(36,3,'Labbra Grandi Tipo 3 Dx','images/shape/labbra_profilo_grandi_3_dx.png','dx'),(37,3,'Labbra Grandi Tipo 3 Sx','images/shape/labbra_profilo_grandi_3_sx.png','sx'),(38,3,'Labbra Grandi Tipo 4 Dx','images/shape/labbra_profilo_grandi_4_dx.png','dx'),(39,3,'Labbra Grandi Tipo 4 Sx','images/shape/labbra_profilo_grandi_4_sx.png','sx'),(40,1,'Ellittica','images/shape/ellittica.png','cx'),(41,1,'Ovale','images/shape/ovale.png','cx'),(42,1,'Ovale Invertita','images/shape/ovale_invertita.png','cx'),(43,1,'Rotonda','images/shape/rotonda.png','cx'),(44,1,'Rettangolare','images/shape/rettangolare.png','cx'),(45,1,'Quadrata','images/shape/quadrata.png','cx'),(46,1,'Rombica','images/shape/rombica.png','cx'),(47,1,'Trapezoidale','images/shape/trapezoidale.png','cx'),(48,1,'Trapezoidale Invertita','images/shape/trapezoidale_invertita.png','cx'),(49,1,'Pentagonoide','images/shape/pentagonoide.png','cx'),(50,1,'Profilo carenato','images/shape/profilo_carenato.png','cx'),(51,1,'Profilo dolcemente curvo','images/shape/profilo_dolcemente_curvo.png','cx'),(52,1,'Profilo curvo Dx','images/shape/profilo_curvo_dx.png','dx'),(53,1,'Profilo curvo Sx','images/shape/profilo_curvo_sx.png','sx'),(54,1,'Profilo a linea spezzata Dx','images/shape/profilo_a_linea_spezzata_dx.png','dx'),(55,1,'Profilo a linea spezzata Sx','images/shape/profilo_a_linea_spezzata_sx.png','sx'),(56,1,'Profilo con occipitale appiattito Dx','images/shape/profilo_con_occipitale_appiattito_dx.png','dx'),(57,1,'Profilo con occipitale appiattito Sx','images/shape/profilo_con_occipitale_appiattito_sx.png','sx'),(58,1,'Profilo con occipite sporgente Dx','images/shape/profilo_con_occipite_sporgente_dx.png','dx'),(59,1,'Profilo con occipite sporgente Sx','images/shape/profilo_con_occipite_sporgente_sx.png','sx'),(60,1,'Profilo con vertice anteriore Dx','images/shape/profilo_con_vertice_anteriore_dx.png','dx'),(61,1,'Profilo con vertice anteriore Sx','images/shape/profilo_con_vertice_anteriore_sx.png','sx'),(62,1,'Profilo con vertice posteriore Dx','images/shape/profilo_con_vertice_posteriore_dx.png','dx'),(63,1,'Profilo con vertice posteriore Sx','images/shape/profilo_con_vertice_posteriore_sx.png','sx'),(64,1,'Profilo insellato Dx','images/shape/profilo_insellato_dx.png','dx'),(65,1,'Profilo jnsellato Sx','images/shape/profilo_insellato_sx.png','sx'),(66,5,'Attaccatura curvilinea (Soggetto privo di Trichion)','images/shape/attaccatura_curvilinea.png','cx'),(67,5,'Attaccatura rettilinea(Soggetti privo di Trichion)','images/shape/attaccatura_rettilinea.png','cx'),(68,5,'Attaccatura larga (Soggetto con Trichion)','images/shape/attaccatura_larga.png','cx'),(69,5,'Attaccatura stretta (Soggetto con Trichion)','images/shape/attaccatura_stretta.png','cx'),(70,4,'Piramide nasale - Tipo 1 Dx (Testut)','images/shape/piramide_nasale_testut_1_dx.png','dx'),(71,4,'Piramide nasale - Tipo 1 Sx (Testut)','images/shape/piramide_nasale_testut_1_sx.png','sx'),(72,4,'Piramide nasale - Tipo 2 Dx (Testut)','images/shape/piramide_nasale_testut_2_dx.png','dx'),(73,4,'Piramide nasale - Tipo 2 Sx (Testut)','images/shape/piramide_nasale_testut_2_sx.png','sx'),(74,4,'Piramide nasale - Tipo 3 Dx (Testut)','images/shape/piramide_nasale_testut_3_sx.png','dx'),(75,4,'Piramide nasale - Tipo 3 Sx (Testut)','images/shape/piramide_nasale_testut_3_dx.png','sx'),(76,4,'Piramide nasale - Tipo 4 Dx (Testut)','images/shape/piramide_nasale_testut_4_sx.png','dx'),(77,4,'Piramide nasale - Tipo 4 Sx (Testut)','images/shape/piramide_nasale_testut_4_dx.png','sx'),(78,4,'Piramide nasale - Tipo 1 Dx (Martin)','images/shape/piramide_nasale_martin_1_dx.png','dx'),(79,4,'Piramide nasale - Tipo 1 Sx (Martin)','images/shape/piramide_nasale_martin_1_sx.png','sx'),(80,4,'Piramide nasale - Tipo 2 Dx (Martin)','images/shape/piramide_nasale_martin_2_dx.png','dx'),(81,4,'Piramide nasale - Tipo 2 Sx (Martin)','images/shape/piramide_nasale_martin_2_sx.png','sx'),(82,4,'Piramide nasale - Tipo 3 Dx (Martin)','images/shape/piramide_nasale_martin_3_dx.png','dx'),(83,4,'Piramide nasale - Tipo 3 Sx (Martin)','images/shape/piramide_nasale_martin_3_sx.png','sx'),(84,4,'Piramide nasale - Tipo 4 Dx (Martin)','images/shape/piramide_nasale_martin_4_dx.png','dx'),(85,4,'Piramide nasale - Tipo 4 Sx (Martin)','images/shape/piramide_nasale_martin_4_sx.png','sx'),(86,4,'Piramide nasale - Tipo 5 Dx (Martin)','images/shape/piramide_nasale_martin_5_dx.png','dx'),(87,4,'Piramide nasale - Tipo 5 Sx (Martin)','images/shape/piramide_nasale_martin_5_sx.png','sx'),(88,4,'Piramide nasale - Tipo 6 Dx (Martin)','images/shape/piramide_nasale_martin_6_dx.png','dx'),(89,4,'Piramide nasale - Tipo 6 Sx (Martin)','images/shape/piramide_nasale_martin_6_sx.png','sx'),(90,4,'Piramide nasale - Tipo 7 Dx (Martin)','images/shape/piramide_nasale_martin_7_dx.png','dx'),(91,4,'Piramide nasale - Tipo 7 Sx (Martin)','images/shape/piramide_nasale_martin_7_sx.png','sx'),(92,4,'Piramide nasale - Tipo 8 Dx (Martin)','images/shape/piramide_nasale_martin_8_dx.png','dx'),(93,4,'Piramide nasale - Tipo 8 Sx (Martin)','images/shape/piramide_nasale_martin_8_sx.png','sx'),(94,4,'Piramide nasale - Tipo 9 Dx (Martin)','images/shape/piramide_nasale_martin_9_dx.png','dx'),(95,4,'Piramide nasale - Tipo 9 Sx (Martin)','images/shape/piramide_nasale_martin_9_sx.png','sx'),(96,4,'Piramide nasale - Tipo 10 Dx (Martin)','images/shape/piramide_nasale_martin_10_dx.png','dx'),(97,4,'Piramide nasale - Tipo 10 Sx (Martin)','images/shape/piramide_nasale_martin_10_sx.png','sx'),(98,4,'Piramide nasale - Tipo 11 Dx (Martin)','images/shape/piramide_nasale_martin_11_dx.png','dx'),(99,4,'Piramide nasale - Tipo 11 Sx (Martin)','images/shape/piramide_nasale_martin_11_sx.png','sx'),(100,4,'Piramide nasale - Tipo 12 Dx (Martin)','images/shape/piramide_nasale_martin_12_dx.png','dx'),(101,4,'Piramide nasale - Tipo 12 Sx (Martin)','images/shape/piramide_nasale_martin_12_sx.png','sx'),(102,4,'Piramide nasale - Tipo 13 Dx (Martin)','images/shape/piramide_nasale_martin_13_dx.png','dx'),(103,4,'Piramide nasale - Tipo 13 Sx (Martin)','images/shape/piramide_nasale_martin_13_sx.png','sx'),(104,4,'Piramide nasale - Tipo 14 Dx (Martin)','images/shape/piramide_nasale_martin_14_dx.png','dx'),(105,4,'Piramide nasale - Tipo 14 Sx (Martin)','images/shape/piramide_nasale_martin_14_sx.png','sx'),(106,4,'Piramide nasale - Tipo 15 Dx (Martin)','images/shape/piramide_nasale_martin_15_dx.png','dx'),(107,4,'Piramide nasale - Tipo 15 Sx (Martin)','images/shape/piramide_nasale_martin_15_sx.png','sx'),(115,6,'Padiglione auricolare - Tipo 1 Dx (Van Der Lugt)','images/shape/padiglione_auricolare_vanderlugt_1_dx.png','dx'),(116,6,'Padiglione auricolare - Tipo 1 Sx (Van Der Lugt)','images/shape/padiglione_auricolare_vanderlugt_1_sx.png','sx'),(117,6,'Padiglione auricolare - Tipo 2 Dx (Van Der Lugt)','images/shape/padiglione_auricolare_vanderlugt_2_dx.png','dx'),(118,6,'Padiglione auricolare - Tipo 2 Sx (Van Der Lugt)','images/shape/padiglione_auricolare_vanderlugt_2_sx.png','sx'),(119,6,'Padiglione auricolare - Tipo 3 Dx (Van Der Lugt)','images/shape/padiglione_auricolare_vanderlugt_3_dx.png','dx'),(120,6,'Padiglione auricolare - Tipo 3 Sx (Van Der Lugt)','images/shape/padiglione_auricolare_vanderlugt_3_sx.png','sx'),(121,6,'Padiglione auricolare - Tipo 4 Dx (Van Der Lugt)','images/shape/padiglione_auricolare_vanderlugt_4_dx.png','dx'),(122,6,'Padiglione auricolare - Tipo 4 Sx (Van Der Lugt)','images/shape/padiglione_auricolare_vanderlugt_4_sx.png','sx'),(123,9,'Profilo facciale - Tipo 1 Dx (fronto-nasale e naso-buccale combinati)','images/shape/profilo_facciale_1_dx.png','dx'),(124,9,'Profilo facciale - Tipo 1 Sx (fronto-nasale e naso-buccale combinati)','images/shape/profilo_facciale_1_sx.png','sx'),(125,9,'Profilo facciale - Tipo 2 Dx (fronto-nasale e naso-buccale combinati)','images/shape/profilo_facciale_2_dx.png','dx'),(126,9,'Profilo facciale - Tipo 2 Sx (fronto-nasale e naso-buccale combinati)','images/shape/profilo_facciale_2_sx.png','sx'),(127,9,'Profilo facciale - Tipo 3 Dx (fronto-nasale e naso-buccale combinati)','images/shape/profilo_facciale_3_dx.png','dx'),(128,9,'Profilo facciale - Tipo 3 Sx (fronto-nasale e naso-buccale combinati)','images/shape/profilo_facciale_3_sx.png','sx'),(129,9,'Profilo facciale - Tipo 4 Dx (fronto-nasale e naso-buccale combinati)','images/shape/profilo_facciale_4_dx.png','dx'),(130,9,'Profilo facciale - Tipo 4 Sx (fronto-nasale e naso-buccale combinati)','images/shape/profilo_facciale_4_sx.png','sx'),(131,7,'Profilo fronto-nasale - Tipo 1 Dx','images/shape/profilo_fronto_nasale_1_dx.png','dx'),(132,7,'Profilo fronto-nasale - Tipo 1 Sx','images/shape/profilo_fronto_nasale_1_sx.png','sx'),(133,7,'Profilo fronto-nasale - Tipo 2 Dx','images/shape/profilo_fronto_nasale_2_dx.png','dx'),(134,7,'Profilo fronto-nasale - Tipo 2 Sx','images/shape/profilo_fronto_nasale_2_sx.png','sx'),(135,7,'Profilo fronto-nasale - Tipo 3 Dx','images/shape/profilo_fronto_nasale_3_dx.png','dx'),(136,7,'Profilo fronto-nasale - Tipo 3 Sx','images/shape/profilo_fronto_nasale_3_sx.png','sx'),(137,7,'Profilo fronto-nasale - Tipo 4 Dx','images/shape/profilo_fronto_nasale_4_dx.png','dx'),(138,7,'Profilo fronto-nasale - Tipo 4 Sx','images/shape/profilo_fronto_nasale_4_sx.png','sx'),(139,7,'Profilo fronto-nasale - Tipo 5 Dx','images/shape/profilo_fronto_nasale_5_dx.png','dx'),(140,7,'Profilo fronto-nasale - Tipo 5 Sx','images/shape/profilo_fronto_nasale_5_sx.png','sx'),(141,7,'Profilo fronto-nasale - Tipo 6 Dx','images/shape/profilo_fronto_nasale_6_dx.png','dx'),(142,7,'Profilo fronto-nasale - Tipo 6 Sx','images/shape/profilo_fronto_nasale_6_sx.png','sx'),(143,8,'Profilo naso-buccale - Tipo 1 Dx','images/shape/profilo_naso_buccale_1_dx.png','dx'),(144,8,'Profilo naso-buccale - Tipo 1 Sx','images/shape/profilo_naso_buccale_1_sx.png','sx'),(145,8,'Profilo naso-buccale - Tipo 2 Dx','images/shape/profilo_naso_buccale_2_dx.png','dx'),(146,8,'Profilo naso-buccale - Tipo 2 Sx','images/shape/profilo_naso_buccale_2_sx.png','sx'),(147,8,'Profilo naso-buccale - Tipo 3 Dx','images/shape/profilo_naso_buccale_3_dx.png','dx'),(148,8,'Profilo naso-buccale - Tipo 3 Sx','images/shape/profilo_naso_buccale_3_sx.png','sx'),(149,8,'Profilo naso-buccale - Tipo 4 Dx','images/shape/profilo_naso_buccale_4_dx.png','dx'),(150,8,'Profilo naso-buccale - Tipo 4 Sx','images/shape/profilo_naso_buccale_4_sx.png','sx');
/*!40000 ALTER TABLE `morphology` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `morphology_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `morphology_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `morphology_type` WRITE;
/*!40000 ALTER TABLE `morphology_type` DISABLE KEYS */;
INSERT INTO `morphology_type` VALUES (1,'Forma del capo'),(2,'Forma degli occhi'),(3,'Forma della bocca'),(4,'Forma del naso'),(5,'Attaccatura dei capelli'),(6,'Forma del padiglione auricolare'),(7,'Forma del profilo fronto-nasale'),(8,'Forma del profilo naso-buccale'),(9,'Forma del profilo facciale');
/*!40000 ALTER TABLE `morphology_type` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int(10) unsigned NOT NULL,
  `id_subject` int(10) unsigned NOT NULL,
  `name` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id_subject_foreign` (`id_subject`),
  KEY `project_id_user_foreign` (`id_user`),
  CONSTRAINT `project_id_subject_foreign` FOREIGN KEY (`id_subject`) REFERENCES `subject` (`id`),
  CONSTRAINT `project_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,2,1,'ProgettoTest','Progetto di test','{\"transform_front\":{\"global\":\"rotate(0deg) scale(1) translate(0px, 0px)\",\"shapes\":{\"drag_1564525515521\":{\"x\":\"-285\",\"y\":\"156\",\"degree\":\"0\",\"h\":\"30\",\"w\":\"30\",\"id_shape\":\"3\"},\"drag_1564525526464\":{\"x\":\"-387\",\"y\":\"236\",\"degree\":\"0\",\"h\":\"30\",\"w\":\"30\",\"id_shape\":\"6\"}},\"x\":0,\"y\":0,\"zoom\":1,\"degree\":0},\"transform_profile\":{\"global\":\"rotate(0deg) scale(1) translate(0px, 0px)\",\"shapes\":null,\"x\":0,\"y\":0,\"zoom\":1,\"degree\":0}}','2019-07-30 19:26:56','2019-07-30 20:36:38'),(3,3,3,'Progetto1','Progetto test','null','2019-07-30 22:14:09','2019-07-30 22:14:35'),(4,4,4,'ProvaTest','Test di prova','{\"transform_front\":{\"global\":\"rotate(0deg) scale(0.9) translate(5px, 0px)\",\"x\":5,\"y\":0,\"zoom\":0.9,\"degree\":0,\"shapes\":{\"drag_1564532796049\":{\"x\":\"15\",\"y\":\"277\",\"degree\":\"0\",\"id_shape\":\"3\"},\"drag_1564532798051\":{\"x\":\"-465\",\"y\":\"106\",\"degree\":\"0\",\"h\":\"51\",\"w\":\"73\",\"id_shape\":\"5\"}}},\"transform_profile\":{\"global\":\"translate(0px,0px) scale(1.0) rotate(0deg)\",\"x\":0,\"y\":0,\"zoom\":1,\"degree\":0,\"shapes\":null}}','2019-07-30 22:25:04','2019-07-30 22:27:26'),(5,5,5,'progettonome','descrizioneprogetto','null','2019-07-31 07:07:52','2019-07-31 07:08:07'),(6,5,6,'progetto1','progetto prova','{\"transform_front\":{\"global\":\"rotate(0deg) scale(1) translate(0px, 0px)\",\"x\":0,\"y\":0,\"zoom\":1,\"degree\":0,\"shapes\":{\"drag_1564570836821\":{\"x\":\"-351\",\"y\":\"97\",\"degree\":\"-0.14728124143973864\",\"h\":\"68\",\"w\":\"63\",\"id_shape\":\"3\"},\"drag_1564570868241\":{\"x\":\"-419\",\"y\":\"147\",\"degree\":\"0\",\"h\":\"72\",\"w\":\"71\",\"id_shape\":\"6\"}}},\"transform_profile\":{\"global\":\"translate(0px,0px) scale(1.0) rotate(0deg)\",\"x\":0,\"y\":0,\"zoom\":1,\"degree\":0,\"shapes\":{\"drag_1564570877153\":{\"x\":\"-511\",\"y\":\"190\",\"degree\":\"0\",\"h\":\"63\",\"w\":\"66\",\"id_shape\":\"8\"}}}}','2019-07-31 08:59:55','2019-07-31 09:01:25'),(7,6,7,'test','testest','null','2019-08-06 12:19:36','2019-08-06 12:20:04'),(8,8,8,'Test','TestProject','{\"transform_front\":{\"global\":\"rotate(0deg) scale(1) translate(0px, 0px)\",\"x\":0,\"y\":0,\"zoom\":1,\"degree\":0,\"shapes\":null},\"transform_profile\":{\"global\":\"rotate(0deg) scale(1) translate(-65px, 0px)\",\"x\":-65,\"y\":0,\"zoom\":1,\"degree\":0,\"shapes\":null}}','2019-08-06 17:41:32','2019-08-06 17:57:41'),(9,8,9,'TestWoman','TestW','null','2019-08-06 18:00:36','2019-08-06 18:01:12'),(10,8,10,'Test','Test n.3',NULL,'2019-08-06 18:04:26','2019-08-06 18:04:26'),(11,9,11,'Test','TestProject','null','2019-08-06 20:11:17','2019-08-06 20:11:42'),(12,10,12,'giuseppe','test','null','2019-08-09 11:31:31','2019-08-09 11:31:57'),(13,10,13,'giuseppe','test',NULL,'2019-08-09 11:31:31','2019-08-09 11:31:31'),(15,11,15,'giuseppe','test','{\"transform_front\":{\"global\":\"translate(0px,0px) scale(1.0) rotate(0deg)\",\"x\":0,\"y\":0,\"zoom\":1,\"degree\":0,\"shapes\":null},\"transform_profile\":{\"global\":\"translate(0px,0px) scale(1.0) rotate(0deg)\",\"x\":0,\"y\":0,\"zoom\":1,\"degree\":0,\"shapes\":{\"drag_1565365402560\":{\"x\":\"24\",\"y\":\"327\",\"degree\":\"0\",\"h\":\"108\",\"w\":\"120\",\"id_shape\":\"123\"},\"drag_1565365420801\":{\"x\":\"-663\",\"y\":\"149\",\"degree\":\"0\",\"h\":\"127\",\"w\":\"118\",\"id_shape\":\"22\"},\"drag_1565365434984\":{\"x\":\"-617\",\"y\":\"177\",\"degree\":\"0\",\"h\":\"81\",\"w\":\"96\",\"id_shape\":\"17\"},\"drag_1565365465826\":{\"x\":\"-488\",\"y\":\"191\",\"degree\":\"0\",\"h\":\"69\",\"w\":\"61\",\"id_shape\":\"22\"}}}}','2019-08-09 11:38:25','2019-08-09 13:55:02'),(16,11,16,'giuseppe','test',NULL,'2019-08-09 11:38:25','2019-08-09 11:38:25'),(17,11,17,'giuseppe','test',NULL,'2019-08-09 11:38:38','2019-08-09 11:38:38'),(18,11,18,'giuseppe','test',NULL,'2019-08-09 11:38:38','2019-08-09 11:38:38'),(19,11,19,'giuseppe','test',NULL,'2019-08-09 11:38:38','2019-08-09 11:38:38'),(20,11,20,'giuseppe','test',NULL,'2019-08-09 11:38:38','2019-08-09 11:38:38'),(21,11,21,'giuseppe','test',NULL,'2019-08-09 11:38:38','2019-08-09 11:38:38'),(22,11,22,'giuseppe','test',NULL,'2019-08-09 11:38:38','2019-08-09 11:38:38'),(23,11,23,'giuseppe','test',NULL,'2019-08-09 11:38:38','2019-08-09 11:38:38'),(24,11,24,'giuseppe','test',NULL,'2019-08-09 11:38:39','2019-08-09 11:38:39'),(25,11,25,'giuseppe','test',NULL,'2019-08-09 11:38:39','2019-08-09 11:38:39'),(26,11,26,'giuseppe','test',NULL,'2019-08-09 11:38:39','2019-08-09 11:38:39'),(27,11,27,'giuseppe','test',NULL,'2019-08-09 11:38:39','2019-08-09 11:38:39'),(28,11,28,'giuseppe','test',NULL,'2019-08-09 11:38:39','2019-08-09 11:38:39'),(29,11,29,'giuseppe','test',NULL,'2019-08-09 11:38:39','2019-08-09 11:38:39'),(30,11,30,'giuseppe','test',NULL,'2019-08-09 11:38:39','2019-08-09 11:38:39'),(31,11,31,'giuseppe','test',NULL,'2019-08-09 11:38:50','2019-08-09 11:38:50'),(32,11,32,'giuseppe','test',NULL,'2019-08-09 11:38:50','2019-08-09 11:38:50'),(33,11,33,'giuseppe','test',NULL,'2019-08-09 11:38:50','2019-08-09 11:38:50'),(34,11,34,'giuseppe','test',NULL,'2019-08-09 11:38:50','2019-08-09 11:38:50'),(35,11,35,'giuseppe','test',NULL,'2019-08-09 11:38:51','2019-08-09 11:38:51'),(36,11,36,'giuseppe','test',NULL,'2019-08-09 11:38:51','2019-08-09 11:38:51'),(37,11,37,'giuseppe','test',NULL,'2019-08-09 11:38:51','2019-08-09 11:38:51'),(38,11,38,'giuseppe','test',NULL,'2019-08-09 11:38:51','2019-08-09 11:38:51'),(39,11,39,'giuseppe','test',NULL,'2019-08-09 11:38:51','2019-08-09 11:38:51'),(40,11,40,'giuseppe','test',NULL,'2019-08-09 11:38:51','2019-08-09 11:38:51'),(41,11,41,'giuseppe','test',NULL,'2019-08-09 11:38:52','2019-08-09 11:38:52'),(42,11,42,'giuseppe','test',NULL,'2019-08-09 11:38:52','2019-08-09 11:38:52'),(43,11,43,'giuseppe','test',NULL,'2019-08-09 11:38:52','2019-08-09 11:38:52'),(44,11,44,'giuseppe','test',NULL,'2019-08-09 11:38:52','2019-08-09 11:38:52'),(45,11,45,'giuseppe','test',NULL,'2019-08-09 11:38:52','2019-08-09 11:38:52'),(46,11,46,'giuseppe','test',NULL,'2019-08-09 11:38:53','2019-08-09 11:38:53'),(47,11,47,'giuseppe','test',NULL,'2019-08-09 11:38:53','2019-08-09 11:38:53'),(48,11,48,'giuseppe','test',NULL,'2019-08-09 11:38:53','2019-08-09 11:38:53'),(49,11,49,'giuseppe','test',NULL,'2019-08-09 11:38:53','2019-08-09 11:38:53'),(50,11,50,'giuseppe','test',NULL,'2019-08-09 11:38:53','2019-08-09 11:38:53'),(51,11,51,'giuseppe','test',NULL,'2019-08-09 11:38:53','2019-08-09 11:38:53'),(52,11,52,'giuseppe','test',NULL,'2019-08-09 11:38:53','2019-08-09 11:38:53'),(53,11,53,'giuseppe','test',NULL,'2019-08-09 11:38:54','2019-08-09 11:38:54'),(54,11,54,'giuseppe','test',NULL,'2019-08-09 11:38:54','2019-08-09 11:38:54'),(55,11,55,'giuseppe','test',NULL,'2019-08-09 11:38:54','2019-08-09 11:38:54'),(56,11,56,'giuseppe','test',NULL,'2019-08-09 11:38:54','2019-08-09 11:38:54'),(57,11,57,'giuseppe','test',NULL,'2019-08-09 11:38:54','2019-08-09 11:38:54'),(58,11,58,'giuseppe','test',NULL,'2019-08-09 11:38:54','2019-08-09 11:38:54'),(59,11,59,'giuseppe','test',NULL,'2019-08-09 11:38:54','2019-08-09 11:38:54'),(60,11,60,'giuseppe','test',NULL,'2019-08-09 11:38:55','2019-08-09 11:38:55'),(61,11,61,'giuseppe','test',NULL,'2019-08-09 11:38:55','2019-08-09 11:38:55'),(62,11,62,'giuseppe','test',NULL,'2019-08-09 11:38:55','2019-08-09 11:38:55'),(63,11,63,'giuseppe','test',NULL,'2019-08-09 11:38:55','2019-08-09 11:38:55'),(64,11,64,'giuseppe','test',NULL,'2019-08-09 11:38:55','2019-08-09 11:38:55'),(65,11,65,'giuseppe','test',NULL,'2019-08-09 11:38:55','2019-08-09 11:38:55'),(66,12,66,'salvol\'esaminatore','testproject','null','2019-08-09 18:20:14','2019-08-09 18:20:50');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` int(11) NOT NULL,
  `path_image_front` char(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path_image_profile` char(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'Giuseppe','Barbera',22,'http://localhost:8888/tesi_face_traits/storage/app/public/photos/2WFxHs6ij0xwth7bGly0JsT1PVOgmS6iK7GJomAf.jpeg','http://localhost:8888/tesi_face_traits/storage/app/public/photos/8BwrUWh3u5ESMZZd1ODWv4Z3RaCImhojgvRMti8h.jpeg','2019-07-30 19:26:56','2019-07-30 20:17:50'),(2,'Mario','Rossi',25,NULL,NULL,'2019-07-30 19:27:21','2019-07-30 19:27:21'),(3,'Giuseppe','Barbera',22,'http://localhost:8888/tesi_face_traits/storage/app/public/photos/E3sddFxk1ZYRvDolY6nUxioQYbJo2oF8uvkvyccp.png','http://localhost:8888/tesi_face_traits/storage/app/public/photos/aCa8EA7VA09TqQUGT5Mo2Nb6M33DpNWdKwsAwdTu.png','2019-07-30 22:14:09','2019-07-30 22:19:11'),(4,'Prova','Provaprova',22,'http://localhost:8888/tesi_face_traits/storage/app/public/photos/RfrCVzA0jkfV4sDh9Q5kMzLtkQmSapmDpEJVGgvm.jpeg','http://localhost:8888/tesi_face_traits/storage/app/public/photos/ktMDWYUDimxtLh9pFU1rMWDBfMdDIbkiXHL3ZZSO.jpeg','2019-07-30 22:25:04','2019-07-30 22:25:27'),(5,'nome','cognome',22,'http://localhost:8888/tesi_face_traits/storage/app/public/photos/EyEZpb1S2FcMxUrYgejCg8GjWQadaujoUgUiROco.jpeg','http://localhost:8888/tesi_face_traits/storage/app/public/photos/hA0BuSOHxR1Csd4H4DkipmWiRaXDFkPeFS6WfMnQ.jpeg','2019-07-31 07:07:52','2019-07-31 07:08:17'),(6,'nome','cognome2',22,'http://localhost:8888/tesi_face_traits/storage/app/public/photos/q0l7uhWGk9hiwpQeYjJzmkAuvda3wV0KKCbM9Z6o.jpeg','http://localhost:8888/tesi_face_traits/storage/app/public/photos/zAoZsdKLrrBdQf1MaSYXHEhLU8CAH8PuZD0xeC2k.jpeg','2019-07-31 08:59:55','2019-07-31 09:00:19'),(7,'prova','della prova',20,'http://localhost:8888/tesi_face_traits/storage/app/public/photos/NLekuNAP5Y0Uq3H8awguhKhoWRJzIcef1Vip9epl.jpeg','http://localhost:8888/tesi_face_traits/storage/app/public/photos/AAjLdHPVwfR03MRHeZjdGPtf9dE1h012ctr6XaDp.jpeg','2019-08-06 12:19:36','2019-08-06 13:51:29'),(8,'Giuseppe','Barbera',22,'http://localhost:8888/tesi_face_traits/storage/app/public/photos/k4lx1To2ISr9nK4tRLAlHsxqKQudiKCTH0WcEvxZ.jpeg','http://localhost:8888/tesi_face_traits/storage/app/public/photos/kngYK9C5SDoUU2HVhW7ExmipUkBSR171p7zUTzen.jpeg','2019-08-06 17:41:32','2019-08-06 17:53:35'),(9,'Wo','Man',22,'http://localhost:8888/tesi_face_traits/storage/app/public/photos/0htmBLJgsF8v9ykfgAjGcs5As9pigC1jAdK8GdBu.png','http://localhost:8888/tesi_face_traits/storage/app/public/photos/kAW0HQ4bbSMWhgNpl12ct9bHkYPWf4Y0sD8RiIEC.jpeg','2019-08-06 18:00:36','2019-08-06 18:01:32'),(10,'Test','3',22,NULL,NULL,'2019-08-06 18:04:26','2019-08-06 18:04:26'),(11,'Giuseppe','Barbera',22,'http://localhost:8888/tesi_face_traits/storage/app/public/photos/ot1vIngIv9ugcGIQZqo5tPrftA2CFAbwDWivAveD.jpeg','http://localhost:8888/tesi_face_traits/storage/app/public/photos/mgDUcfbZaZktOgwlMWWJefl7zksMqBUm8RKK1BZ0.jpeg','2019-08-06 20:11:17','2019-08-06 20:11:51'),(12,'giuseppe','barbera',22,'http://localhost:8888/tesi_face_traits/storage/app/public/photos/zBAaWys8TwIMmROB9HBtUtd8AoeOBCpos4nogbAp.jpeg',NULL,'2019-08-09 11:31:31','2019-08-09 11:31:57'),(13,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:31:31','2019-08-09 11:31:31'),(14,'giuseppe','barbera',22,'http://localhost:8888/tesi_face_traits/storage/app/public/photos/9lcklCvS4wU77PqanyYCgnUmaAtN9hmXhTm6oVXQ.jpeg',NULL,'2019-08-09 11:38:12','2019-08-09 11:47:42'),(15,'giuseppe','barbera',22,'http://localhost:8888/tesi_face_traits/storage/app/public/photos/oaIgHW1ryuDYt8VLwIBMzURDy38hoXmrtrQzphrO.jpeg','http://localhost:8888/tesi_face_traits/storage/app/public/photos/jHpAT7A54B2rkuCiHId29nx12yS3dOGpQRDon5Ye.jpeg','2019-08-09 11:38:25','2019-08-09 13:43:09'),(16,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:38:25','2019-08-09 11:38:25'),(17,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:38:38','2019-08-09 11:38:38'),(18,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:38:38','2019-08-09 11:38:38'),(19,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:38:38','2019-08-09 11:38:38'),(20,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:38:38','2019-08-09 11:38:38'),(21,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:38:38','2019-08-09 11:38:38'),(22,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:38:38','2019-08-09 11:38:38'),(23,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:38:38','2019-08-09 11:38:38'),(24,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:38:39','2019-08-09 11:38:39'),(25,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:38:39','2019-08-09 11:38:39'),(26,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:38:39','2019-08-09 11:38:39'),(27,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:38:39','2019-08-09 11:38:39'),(28,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:38:39','2019-08-09 11:38:39'),(29,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:38:39','2019-08-09 11:38:39'),(30,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:38:39','2019-08-09 11:38:39'),(31,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:38:50','2019-08-09 11:38:50'),(32,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:38:50','2019-08-09 11:38:50'),(33,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:38:50','2019-08-09 11:38:50'),(34,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:38:50','2019-08-09 11:38:50'),(35,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:38:51','2019-08-09 11:38:51'),(36,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:38:51','2019-08-09 11:38:51'),(37,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:38:51','2019-08-09 11:38:51'),(38,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:38:51','2019-08-09 11:38:51'),(39,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:38:51','2019-08-09 11:38:51'),(40,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:38:51','2019-08-09 11:38:51'),(41,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:38:52','2019-08-09 11:38:52'),(42,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:38:52','2019-08-09 11:38:52'),(43,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:38:52','2019-08-09 11:38:52'),(44,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:38:52','2019-08-09 11:38:52'),(45,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:38:52','2019-08-09 11:38:52'),(46,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:38:53','2019-08-09 11:38:53'),(47,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:38:53','2019-08-09 11:38:53'),(48,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:38:53','2019-08-09 11:38:53'),(49,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:38:53','2019-08-09 11:38:53'),(50,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:38:53','2019-08-09 11:38:53'),(51,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:38:53','2019-08-09 11:38:53'),(52,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:38:53','2019-08-09 11:38:53'),(53,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:38:54','2019-08-09 11:38:54'),(54,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:38:54','2019-08-09 11:38:54'),(55,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:38:54','2019-08-09 11:38:54'),(56,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:38:54','2019-08-09 11:38:54'),(57,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:38:54','2019-08-09 11:38:54'),(58,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:38:54','2019-08-09 11:38:54'),(59,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:38:54','2019-08-09 11:38:54'),(60,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:38:55','2019-08-09 11:38:55'),(61,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:38:55','2019-08-09 11:38:55'),(62,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:38:55','2019-08-09 11:38:55'),(63,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:38:55','2019-08-09 11:38:55'),(64,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:38:55','2019-08-09 11:38:55'),(65,'giuseppe','barbera',22,NULL,NULL,'2019-08-09 11:38:55','2019-08-09 11:38:55'),(66,'salvo','cimino',37,'http://localhost:8888/tesi_face_traits/storage/app/public/photos/TJEC4YT4bGvkLWlwII46hHYYeJ62ZiWpCNr1CNlm.jpeg','http://localhost:8888/tesi_face_traits/storage/app/public/photos/1BHV5KOX5DemRNAgZxde2ifxHDuljZsAwLVWnyFY.jpeg','2019-08-09 18:20:14','2019-08-09 18:21:06');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'giuseppe','peppebarbs3@gmail.com',NULL,'$2y$10$BR2K8ljFxthbL6fxpud1WOz9t9..Sy7HgtJ1ZlqGOYd7bosufUsly',NULL,'2019-07-28 13:58:50','2019-07-28 13:58:50'),(2,'giuseppe barbera','peppe@gmail.com',NULL,'$2y$10$l8NDHWB9yQF51djxcAk2HeCizuFujvkj2QJhT0ruzhsGNeiCCUhBK','6gAc9GnJG4aZNvMunU8Od22LPPtx5nH5J37WaxYvVBdiDVZWASHYpedpBYnW','2019-07-30 19:22:16','2019-07-30 19:22:16'),(3,'giuseppe barbera','peppe96@gmail.com',NULL,'$2y$10$aGq5kDfuU8aNjiSqx58roOY2XKEyHJ/SDHVq1NAj0FFv0xvbxbWRS',NULL,'2019-07-30 22:13:33','2019-07-30 22:13:33'),(4,'Prova123','prova123@gmail.com',NULL,'$2y$10$K4.fcTwEcR.REIDBnI6PzuwLjAJaU/A7St.KDp5eBBroLvjoiuqMO',NULL,'2019-07-30 22:24:24','2019-07-30 22:24:24'),(5,'nome cognome','email@email.it',NULL,'$2y$10$mIfewbTUgLVR8i5jjMo.MOXAmHN6Gu5yaCw5YUByX/4G/XRQLRnT6',NULL,'2019-07-31 07:07:37','2019-07-31 07:07:37'),(6,'peppe','peppe@mail.it',NULL,'$2y$10$6rqTIj0u92.ukhSdNj6OpOPYg8MfsanT6K37oDcp6d0tls22DJ0Pe',NULL,'2019-08-06 12:19:21','2019-08-06 12:19:21'),(7,'peppe','peppe1234@gmail.com',NULL,'$2y$10$15UCoVsc2EfcCWxcxC/s1.REZSC7ht/M0Hz9/KuDtudYtcxw31jMW',NULL,'2019-08-06 17:39:31','2019-08-06 17:39:31'),(8,'Giuseppe','barberagiuseppe1996@gmail.com',NULL,'$2y$10$UU1dzax8xHnX.6uqhIIqmuoKkW0ebyqhH79ymla2Q8LnP5kpxrs5C',NULL,'2019-08-06 17:40:50','2019-08-06 17:40:50'),(9,'Giuseppe','1234@gmail.com',NULL,'$2y$10$rI/B6zbOvOE1ekbXRpI7Mu8qS0rbxKVw90jC3//ZT2v2VsIa4fy1W',NULL,'2019-08-06 20:09:47','2019-08-06 20:09:47'),(10,'giuseppe','peppe@mailnow.it',NULL,'$2y$10$Ek0y3hDU1NZTRAIs.D5ptepysjJiRYqTZZHp2s.estaUcwo4pBCEC',NULL,'2019-08-09 11:31:03','2019-08-09 11:31:03'),(11,'nuovoutente','nuovoutente@gmail.com',NULL,'$2y$10$TSsQh.C9HsMJ3N9hevMpV.8g.SZ.yGXJJJFSH47NL8BjfQrScEYPK',NULL,'2019-08-09 11:37:41','2019-08-09 11:37:41'),(12,'salvatore cimino','salvocim@gmail.com',NULL,'$2y$10$1VKILG0xhXlLNRRd57w86OfA.21bRluFTDgXOalV4f8bPpdYEUStm',NULL,'2019-08-09 18:19:20','2019-08-09 18:19:20');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
