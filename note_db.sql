-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: localhost    Database: laravel-database
-- ------------------------------------------------------
-- Server version	5.7.18-0ubuntu0.16.04.1

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
-- Table structure for table `Note_Categories`
--

DROP DATABASE IF EXISTS notes_db;
CREATE DATABASE notes_db;
USE notes_db;

DROP TABLE IF EXISTS `Note_Categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Note_Categorias` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `idCategoria` int(11) unsigned NOT NULL,
  `idNote` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Note_Categorias_idNote_foreign` (`idNote`),
  KEY `Note_Categorias_idCategoria_foreign` (`idCategoria`),
  CONSTRAINT `Note_Categorias_idNote_foreign` FOREIGN KEY (`idNote`) REFERENCES `Notes` (`id`),
  CONSTRAINT `Note_Categorias_idCategoria_foreign` FOREIGN KEY (`idCategoria`) REFERENCES `Categoria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Note_Categorias`
--

LOCK TABLES `Note_Categorias` WRITE;
/*!40000 ALTER TABLE `Note_Categorias` DISABLE KEYS */;
INSERT INTO `Note_Categorias` VALUES (1,NULL,NULL,5,1),(2,NULL,NULL,5,2),(3,NULL,NULL,5,3),(4,NULL,NULL,5,4),(5,NULL,NULL,4,5),(6,NULL,NULL,4,1),(7,NULL,NULL,4,2),(8,NULL,NULL,2,3),(9,NULL,NULL,2,4),(10,NULL,NULL,2,5),(11,NULL,NULL,1,6),(12,NULL,NULL,3,1),(13,NULL,NULL,4,2),(14,NULL,NULL,5,4),(15,NULL,NULL,2,5);
/*!40000 ALTER TABLE `Note_Categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_email` varchar(300) collate utf8_unicode_ci unique not null,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `note_id` int(11) unsigned DEFAULT null,
  PRIMARY KEY (`id`),
  KEY `notes_id_foreign` (`note_id`),
  CONSTRAINT `notes_id_foreign` FOREIGN KEY (`note_id`) REFERENCES `Notes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'Sam','Worthington','SamWor@gmail.com',NULL,null,1),(2,'Zoe','Saldana','Zoe@gmail.com',NULL,null,2),(3,'Sigourney','Weaver','SigWe@gmail.com',NULL,null,3),(4,'Leonardo','Di Caprio','LeoDi@gmail.com',NULL,null,4),(5,'Kate','Winslet','KateW@gmail.com',NULL,NULL,5),(6,'Billy','Zane','BillyZ@gmail.com',NULL,null,6),(7,'Mark','Hamill','MarkHa@gmail.com',NULL,null,7),(8,'Harrison','Ford','HarrisonF@gmail.com',NULL,null,8),(9,'Carrie','Fisher','CarrieFisher@gmail.com',NULL,null,9),(10,'Sam','Neill','SamNeil2@gmail.com',NULL,null,10),(11,'Laura','Dern','LauDern@gmail.com',NULL,null,11),(12,'Jeff','Goldblum','JeffGold@gmail.com',NULL,null,12),(13,'Daniel','Radcliffe','DanielRad@gmail.com',NULL,null,13),(14,'Emma','Watson','EmmaWatson243@gmail.com',NULL,null,14),(15,'Rupert','Grint','Rupert20Grint@gmail.com',NULL,null,15);
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Notes`
--

DROP TABLE IF EXISTS `Notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime  NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `note_content` text not NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `User_id`int(11) unsigned DEFAULT null,
  PRIMARY KEY (`id`),
  KEY `Users_id_foreign` (`User_id`),
  CONSTRAINT `Users_id_foreign` FOREIGN KEY (`User_id`) REFERENCES `Users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Notes`
--

LOCK TABLES `Notes` WRITE;
/*!40000 ALTER TABLE `Notes` DISABLE KEYS */;
INSERT INTO `Notes` VALUES 
(1,'SQL Database Relational Diagram',NULL,NULL,'El dise??o de una base de datos consiste en definir la estructura de los datos que debe tener un sistema de informaci??n determinado',1,1),
(2,'C??mno ser desarrollador web',NULL,NULL,'Un desarrollador web crea sitios web utilizando varios lenguajes de programaci??n. Sus responsabilidades incluyen el dise??o de p??ginas web',1,2),
(3,'Dar clases a distancia',NULL,NULL,'??nete a millones de estudiante alrededor del mundo que ya est??n aprendiendo con IMentor',1,3),
(4,'Trabjo 100% remoto',NULL,NULL,'Programa de formaci??n Trabajo Remoto ??? Cierto es que la mayor??a de los empleos, o al menos, las ofertas de trabajo remoto m??s demandadas por las empresas',1,4),
(5,'Como cultivar un buen entorno laboral',NULL,NULL,'El trabajo en equipo fomenta un sentido de lealtad, seguridad y autoestima que satisface las necesidades individuales de los integrantes',1,5),
(6,'Tipos de Liderazgo',NULL,NULL,'Los estilos de liderazgo abarcan desde c??mo se relacionan los l??deres con otros dentro y fuera de la organizaci??n, c??mo se ven a s?? mismos y su posici??n',1,6),
(7,'10 mejores empresas de tecnolog??a',NULL,NULL,'El ranking Merco nos permite realizar una mirada sobre el liderazgo de los distintos sectores de la econom??a argentina',1,7),
(8,'Profesiones mejor pagadas',NULL,NULL,' Estos son los siete puestos mejores pagos en el sector ... y finanzas son los profesionales mejores pagados de toda la Argentina',1,8),
(9,'IT en el cine',NULL,NULL,'La tecnolog??a mejora la experiencia del espectador a lo largo de los a??os. El cine ha evolucionado de la mano de la innovaci??n tecnol??gica',1,9),
(10,'Mejores lenguajes de programaci??n',NULL,NULL,'Python es uno de los lenguajes m??s populares y m??s usados en el mundo, de hecho lidera todos los rankings junto con javascript',1,10),
(11,'Mentores digitales',NULL,NULL,'Encontr?? un mentor para que tu emprendimiento pueda crecer de manera organizada y sea rentable en el tiempo',1,11),
(12,'Carreras universitarias del futuro',NULL,NULL,'Las 11 carreras del futuro con m??s empleo y mejores sueldos',1,12),
(13,'Qu?? es data y qu?? es informaci??n',NULL,NULL,'Datos es un t??rmino que se refiere a hechos, eventos, transacciones, etc., que han sido registrados.',1,13),
(14,'S?? n??mda digital',NULL,NULL,'Un n??mada digital es un profesional que usa las nuevas tecnolog??as para trabajar, y que lleva a cabo un estilo de vida n??mada',1,14),
(15,'Periodismo tecn??logico',NULL,NULL,'Impulsa tu carrera en el periodismo tecnol??gico. Utiliza herramientas y formatos del periodismo digital. Identifica tipos de fuentes, ??reas de cubrimiento',1,15);
/*!40000 ALTER TABLE `Notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE notes_db.categoria (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_unicode_ci
AUTO_INCREMENT=16;

--
-- Dumping data for table `Categoria`
--


LOCK TABLES `Categoria` WRITE;
/*!40000 ALTER TABLE `Categoria` DISABLE KEYS */;
INSERT INTO `Categoria` VALUES (1,'2016-07-04 03:00:00',NULL,'tecnolog??a'),(2,'2014-07-04 03:00:00',NULL,'Periodismo'),(3,'2013-07-04 03:00:00',NULL,'IT'),(4,'2011-07-04 03:00:00',NULL,'Education'),(5,'2010-07-04 03:00:00',NULL,'Profession'),
(6,'2016-07-04 03:00:00',NULL,'tecnolog??a'),(7,'2014-07-04 03:00:00',NULL,'Periodismo'),(8,'2013-07-04 03:00:00',NULL,'IT'),(9,'2011-07-04 03:00:00',NULL,'Education'),(10,'2010-07-04 03:00:00',NULL,'Profession'),
(11,'2016-07-04 03:00:00',NULL,'tecnolog??a'),(12,'2014-07-04 03:00:00',NULL,'Periodismo'),(13,'2013-07-04 03:00:00',NULL,'IT'),(14,'2011-07-04 03:00:00',NULL,'Education'),(15,'2010-07-04 03:00:00',NULL,'Profession');
/*!40000 ALTER TABLE `Categoria` ENABLE KEYS */;
UNLOCK TABLES;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-12 10:09:28
