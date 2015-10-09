-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: MyVideos93
-- ------------------------------------------------------
-- Server version	5.5.44-0ubuntu0.14.04.1

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
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actor` (
  `actor_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `art_urls` text,
  PRIMARY KEY (`actor_id`),
  UNIQUE KEY `ix_actor_1` (`name`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor`
--

LOCK TABLES `actor` WRITE;
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;
/*!40000 ALTER TABLE `actor` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`kodi`@`localhost`*/ /*!50003 TRIGGER delete_person AFTER DELETE ON actor FOR EACH ROW BEGIN DELETE FROM art WHERE media_id=old.actor_id AND media_type IN ('actor','artist','writer','director'); END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `actor_link`
--

DROP TABLE IF EXISTS `actor_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actor_link` (
  `actor_id` int(11) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `media_type` text,
  `role` text,
  `cast_order` int(11) DEFAULT NULL,
  UNIQUE KEY `ix_actor_link_1` (`actor_id`,`media_type`(20),`media_id`),
  UNIQUE KEY `ix_actor_link_2` (`media_id`,`media_type`(20),`actor_id`),
  KEY `ix_actor_link_3` (`media_type`(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor_link`
--

LOCK TABLES `actor_link` WRITE;
/*!40000 ALTER TABLE `actor_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `actor_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `art`
--

DROP TABLE IF EXISTS `art`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `art` (
  `art_id` int(11) NOT NULL AUTO_INCREMENT,
  `media_id` int(11) DEFAULT NULL,
  `media_type` text,
  `type` text,
  `url` text,
  PRIMARY KEY (`art_id`),
  KEY `ix_art` (`media_id`,`media_type`(20),`type`(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `art`
--

LOCK TABLES `art` WRITE;
/*!40000 ALTER TABLE `art` DISABLE KEYS */;
/*!40000 ALTER TABLE `art` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookmark`
--

DROP TABLE IF EXISTS `bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookmark` (
  `idBookmark` int(11) NOT NULL AUTO_INCREMENT,
  `idFile` int(11) DEFAULT NULL,
  `timeInSeconds` double DEFAULT NULL,
  `totalTimeInSeconds` double DEFAULT NULL,
  `thumbNailImage` text,
  `player` text,
  `playerState` text,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`idBookmark`),
  KEY `ix_bookmark` (`idFile`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookmark`
--

LOCK TABLES `bookmark` WRITE;
/*!40000 ALTER TABLE `bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  PRIMARY KEY (`country_id`),
  UNIQUE KEY `ix_country_1` (`name`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_link`
--

DROP TABLE IF EXISTS `country_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country_link` (
  `country_id` int(11) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `media_type` text,
  UNIQUE KEY `ix_country_link_1` (`country_id`,`media_type`(20),`media_id`),
  UNIQUE KEY `ix_country_link_2` (`media_id`,`media_type`(20),`country_id`),
  KEY `ix_country_link_3` (`media_type`(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_link`
--

LOCK TABLES `country_link` WRITE;
/*!40000 ALTER TABLE `country_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `country_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `director_link`
--

DROP TABLE IF EXISTS `director_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `director_link` (
  `actor_id` int(11) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `media_type` text,
  UNIQUE KEY `ix_director_link_1` (`actor_id`,`media_type`(20),`media_id`),
  UNIQUE KEY `ix_director_link_2` (`media_id`,`media_type`(20),`actor_id`),
  KEY `ix_director_link_3` (`media_type`(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `director_link`
--

LOCK TABLES `director_link` WRITE;
/*!40000 ALTER TABLE `director_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `director_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `episode`
--

DROP TABLE IF EXISTS `episode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `episode` (
  `idEpisode` int(11) NOT NULL AUTO_INCREMENT,
  `idFile` int(11) DEFAULT NULL,
  `c00` text,
  `c01` text,
  `c02` text,
  `c03` text,
  `c04` text,
  `c05` text,
  `c06` text,
  `c07` text,
  `c08` text,
  `c09` text,
  `c10` text,
  `c11` text,
  `c12` varchar(24) DEFAULT NULL,
  `c13` varchar(24) DEFAULT NULL,
  `c14` text,
  `c15` text,
  `c16` text,
  `c17` varchar(24) DEFAULT NULL,
  `c18` text,
  `c19` text,
  `c20` text,
  `c21` text,
  `c22` text,
  `c23` text,
  `idShow` int(11) DEFAULT NULL,
  PRIMARY KEY (`idEpisode`),
  UNIQUE KEY `ix_episode_file_1` (`idEpisode`,`idFile`),
  UNIQUE KEY `id_episode_file_2` (`idFile`,`idEpisode`),
  KEY `ix_episode_season_episode` (`c12`,`c13`),
  KEY `ix_episode_bookmark` (`c17`),
  KEY `ix_episode_show1` (`idEpisode`,`idShow`),
  KEY `ix_episode_show2` (`idShow`,`idEpisode`),
  KEY `ixEpisodeBasePath` (`c19`(12))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `episode`
--

LOCK TABLES `episode` WRITE;
/*!40000 ALTER TABLE `episode` DISABLE KEYS */;
/*!40000 ALTER TABLE `episode` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`kodi`@`localhost`*/ /*!50003 TRIGGER delete_episode AFTER DELETE ON episode FOR EACH ROW BEGIN DELETE FROM actor_link WHERE media_id=old.idEpisode AND media_type='episode'; DELETE FROM director_link WHERE media_id=old.idEpisode AND media_type='episode'; DELETE FROM writer_link WHERE media_id=old.idEpisode AND media_type='episode'; DELETE FROM art WHERE media_id=old.idEpisode AND media_type='episode'; END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `episode_view`
--

DROP TABLE IF EXISTS `episode_view`;
/*!50001 DROP VIEW IF EXISTS `episode_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `episode_view` (
  `idEpisode` tinyint NOT NULL,
  `idFile` tinyint NOT NULL,
  `c00` tinyint NOT NULL,
  `c01` tinyint NOT NULL,
  `c02` tinyint NOT NULL,
  `c03` tinyint NOT NULL,
  `c04` tinyint NOT NULL,
  `c05` tinyint NOT NULL,
  `c06` tinyint NOT NULL,
  `c07` tinyint NOT NULL,
  `c08` tinyint NOT NULL,
  `c09` tinyint NOT NULL,
  `c10` tinyint NOT NULL,
  `c11` tinyint NOT NULL,
  `c12` tinyint NOT NULL,
  `c13` tinyint NOT NULL,
  `c14` tinyint NOT NULL,
  `c15` tinyint NOT NULL,
  `c16` tinyint NOT NULL,
  `c17` tinyint NOT NULL,
  `c18` tinyint NOT NULL,
  `c19` tinyint NOT NULL,
  `c20` tinyint NOT NULL,
  `c21` tinyint NOT NULL,
  `c22` tinyint NOT NULL,
  `c23` tinyint NOT NULL,
  `idShow` tinyint NOT NULL,
  `strFileName` tinyint NOT NULL,
  `strPath` tinyint NOT NULL,
  `playCount` tinyint NOT NULL,
  `lastPlayed` tinyint NOT NULL,
  `dateAdded` tinyint NOT NULL,
  `strTitle` tinyint NOT NULL,
  `studio` tinyint NOT NULL,
  `premiered` tinyint NOT NULL,
  `mpaa` tinyint NOT NULL,
  `resumeTimeInSeconds` tinyint NOT NULL,
  `totalTimeInSeconds` tinyint NOT NULL,
  `idSeason` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files` (
  `idFile` int(11) NOT NULL AUTO_INCREMENT,
  `idPath` int(11) DEFAULT NULL,
  `strFilename` text,
  `playCount` int(11) DEFAULT NULL,
  `lastPlayed` text,
  `dateAdded` text,
  PRIMARY KEY (`idFile`),
  KEY `ix_files` (`idPath`,`strFilename`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`kodi`@`localhost`*/ /*!50003 TRIGGER delete_file AFTER DELETE ON files FOR EACH ROW BEGIN DELETE FROM bookmark WHERE idFile=old.idFile; DELETE FROM settings WHERE idFile=old.idFile; DELETE FROM stacktimes WHERE idFile=old.idFile; DELETE FROM streamdetails WHERE idFile=old.idFile; END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genre` (
  `genre_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  PRIMARY KEY (`genre_id`),
  UNIQUE KEY `ix_genre_1` (`name`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre_link`
--

DROP TABLE IF EXISTS `genre_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genre_link` (
  `genre_id` int(11) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `media_type` text,
  UNIQUE KEY `ix_genre_link_1` (`genre_id`,`media_type`(20),`media_id`),
  UNIQUE KEY `ix_genre_link_2` (`media_id`,`media_type`(20),`genre_id`),
  KEY `ix_genre_link_3` (`media_type`(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre_link`
--

LOCK TABLES `genre_link` WRITE;
/*!40000 ALTER TABLE `genre_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `genre_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie` (
  `idMovie` int(11) NOT NULL AUTO_INCREMENT,
  `idFile` int(11) DEFAULT NULL,
  `c00` text,
  `c01` text,
  `c02` text,
  `c03` text,
  `c04` text,
  `c05` text,
  `c06` text,
  `c07` text,
  `c08` text,
  `c09` text,
  `c10` text,
  `c11` text,
  `c12` text,
  `c13` text,
  `c14` text,
  `c15` text,
  `c16` text,
  `c17` text,
  `c18` text,
  `c19` text,
  `c20` text,
  `c21` text,
  `c22` text,
  `c23` text,
  `idSet` int(11) DEFAULT NULL,
  PRIMARY KEY (`idMovie`),
  UNIQUE KEY `ix_movie_file_1` (`idFile`,`idMovie`),
  UNIQUE KEY `ix_movie_file_2` (`idMovie`,`idFile`),
  KEY `ixMovieBasePath` (`c23`(12))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`kodi`@`localhost`*/ /*!50003 TRIGGER delete_movie AFTER DELETE ON movie FOR EACH ROW BEGIN DELETE FROM genre_link WHERE media_id=old.idMovie AND media_type='movie'; DELETE FROM actor_link WHERE media_id=old.idMovie AND media_type='movie'; DELETE FROM director_link WHERE media_id=old.idMovie AND media_type='movie'; DELETE FROM studio_link WHERE media_id=old.idMovie AND media_type='movie'; DELETE FROM country_link WHERE media_id=old.idMovie AND media_type='movie'; DELETE FROM writer_link WHERE media_id=old.idMovie AND media_type='movie'; DELETE FROM movielinktvshow WHERE idMovie=old.idMovie; DELETE FROM art WHERE media_id=old.idMovie AND media_type='movie'; DELETE FROM tag_link WHERE media_id=old.idMovie AND media_type='movie'; END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `movie_view`
--

DROP TABLE IF EXISTS `movie_view`;
/*!50001 DROP VIEW IF EXISTS `movie_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `movie_view` (
  `idMovie` tinyint NOT NULL,
  `idFile` tinyint NOT NULL,
  `c00` tinyint NOT NULL,
  `c01` tinyint NOT NULL,
  `c02` tinyint NOT NULL,
  `c03` tinyint NOT NULL,
  `c04` tinyint NOT NULL,
  `c05` tinyint NOT NULL,
  `c06` tinyint NOT NULL,
  `c07` tinyint NOT NULL,
  `c08` tinyint NOT NULL,
  `c09` tinyint NOT NULL,
  `c10` tinyint NOT NULL,
  `c11` tinyint NOT NULL,
  `c12` tinyint NOT NULL,
  `c13` tinyint NOT NULL,
  `c14` tinyint NOT NULL,
  `c15` tinyint NOT NULL,
  `c16` tinyint NOT NULL,
  `c17` tinyint NOT NULL,
  `c18` tinyint NOT NULL,
  `c19` tinyint NOT NULL,
  `c20` tinyint NOT NULL,
  `c21` tinyint NOT NULL,
  `c22` tinyint NOT NULL,
  `c23` tinyint NOT NULL,
  `idSet` tinyint NOT NULL,
  `strSet` tinyint NOT NULL,
  `strFileName` tinyint NOT NULL,
  `strPath` tinyint NOT NULL,
  `playCount` tinyint NOT NULL,
  `lastPlayed` tinyint NOT NULL,
  `dateAdded` tinyint NOT NULL,
  `resumeTimeInSeconds` tinyint NOT NULL,
  `totalTimeInSeconds` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `movielinktvshow`
--

DROP TABLE IF EXISTS `movielinktvshow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movielinktvshow` (
  `idMovie` int(11) DEFAULT NULL,
  `IdShow` int(11) DEFAULT NULL,
  UNIQUE KEY `ix_movielinktvshow_1` (`IdShow`,`idMovie`),
  UNIQUE KEY `ix_movielinktvshow_2` (`idMovie`,`IdShow`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movielinktvshow`
--

LOCK TABLES `movielinktvshow` WRITE;
/*!40000 ALTER TABLE `movielinktvshow` DISABLE KEYS */;
/*!40000 ALTER TABLE `movielinktvshow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `musicvideo`
--

DROP TABLE IF EXISTS `musicvideo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `musicvideo` (
  `idMVideo` int(11) NOT NULL AUTO_INCREMENT,
  `idFile` int(11) DEFAULT NULL,
  `c00` text,
  `c01` text,
  `c02` text,
  `c03` text,
  `c04` text,
  `c05` text,
  `c06` text,
  `c07` text,
  `c08` text,
  `c09` text,
  `c10` text,
  `c11` text,
  `c12` text,
  `c13` text,
  `c14` text,
  `c15` text,
  `c16` text,
  `c17` text,
  `c18` text,
  `c19` text,
  `c20` text,
  `c21` text,
  `c22` text,
  `c23` text,
  PRIMARY KEY (`idMVideo`),
  UNIQUE KEY `ix_musicvideo_file_1` (`idMVideo`,`idFile`),
  UNIQUE KEY `ix_musicvideo_file_2` (`idFile`,`idMVideo`),
  KEY `ixMusicVideoBasePath` (`c14`(12))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musicvideo`
--

LOCK TABLES `musicvideo` WRITE;
/*!40000 ALTER TABLE `musicvideo` DISABLE KEYS */;
/*!40000 ALTER TABLE `musicvideo` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`kodi`@`localhost`*/ /*!50003 TRIGGER delete_musicvideo AFTER DELETE ON musicvideo FOR EACH ROW BEGIN DELETE FROM actor_link WHERE media_id=old.idMVideo AND media_type='musicvideo'; DELETE FROM director_link WHERE media_id=old.idMVideo AND media_type='musicvideo'; DELETE FROM genre_link WHERE media_id=old.idMVideo AND media_type='musicvideo'; DELETE FROM studio_link WHERE media_id=old.idMVideo AND media_type='musicvideo'; DELETE FROM art WHERE media_id=old.idMVideo AND media_type='musicvideo'; DELETE FROM tag_link WHERE media_id=old.idMVideo AND media_type='musicvideo'; END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `musicvideo_view`
--

DROP TABLE IF EXISTS `musicvideo_view`;
/*!50001 DROP VIEW IF EXISTS `musicvideo_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `musicvideo_view` (
  `idMVideo` tinyint NOT NULL,
  `idFile` tinyint NOT NULL,
  `c00` tinyint NOT NULL,
  `c01` tinyint NOT NULL,
  `c02` tinyint NOT NULL,
  `c03` tinyint NOT NULL,
  `c04` tinyint NOT NULL,
  `c05` tinyint NOT NULL,
  `c06` tinyint NOT NULL,
  `c07` tinyint NOT NULL,
  `c08` tinyint NOT NULL,
  `c09` tinyint NOT NULL,
  `c10` tinyint NOT NULL,
  `c11` tinyint NOT NULL,
  `c12` tinyint NOT NULL,
  `c13` tinyint NOT NULL,
  `c14` tinyint NOT NULL,
  `c15` tinyint NOT NULL,
  `c16` tinyint NOT NULL,
  `c17` tinyint NOT NULL,
  `c18` tinyint NOT NULL,
  `c19` tinyint NOT NULL,
  `c20` tinyint NOT NULL,
  `c21` tinyint NOT NULL,
  `c22` tinyint NOT NULL,
  `c23` tinyint NOT NULL,
  `strFileName` tinyint NOT NULL,
  `strPath` tinyint NOT NULL,
  `playCount` tinyint NOT NULL,
  `lastPlayed` tinyint NOT NULL,
  `dateAdded` tinyint NOT NULL,
  `resumeTimeInSeconds` tinyint NOT NULL,
  `totalTimeInSeconds` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `path`
--

DROP TABLE IF EXISTS `path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `path` (
  `idPath` int(11) NOT NULL AUTO_INCREMENT,
  `strPath` text,
  `strContent` text,
  `strScraper` text,
  `strHash` text,
  `scanRecursive` int(11) DEFAULT NULL,
  `useFolderNames` tinyint(1) DEFAULT NULL,
  `strSettings` text,
  `noUpdate` tinyint(1) DEFAULT NULL,
  `exclude` tinyint(1) DEFAULT NULL,
  `dateAdded` text,
  `idParentPath` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPath`),
  KEY `ix_path` (`strPath`(255)),
  KEY `ix_path2` (`idParentPath`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `path`
--

LOCK TABLES `path` WRITE;
/*!40000 ALTER TABLE `path` DISABLE KEYS */;
INSERT INTO `path` VALUES (1,'{{htpc_media_path}}/{{htpc_media_movies}}/','movies','metadata.themoviedb.org',NULL,2147483647,0,'<settings><setting id=\"RatingS\" value=\"TMDb\" /><setting id=\"TrailerQ\" value=\"No\" /><setting id=\"certprefix\" value=\"Rated \" /><setting id=\"fanart\" value=\"true\" /><setting id=\"keeporiginaltitle\" value=\"false\" /><setting id=\"language\" value=\"en\" /><setting id=\"tmdbcertcountry\" value=\"us\" /><setting id=\"trailer\" value=\"true\" /></settings>',0,0,NULL,NULL),(2,'{{htpc_media_path}}/{{htpc_media_tv}}/','tvshows','metadata.tvdb.com',NULL,0,0,'<settings><setting id=\"RatingS\" value=\"TheTVDB\" /><setting id=\"absolutenumber\" value=\"false\" /><setting id=\"dvdorder\" value=\"false\" /><setting id=\"fallback\" value=\"true\" /><setting id=\"fanart\" value=\"true\" /><setting id=\"language\" value=\"en\" /></settings>',0,0,NULL,NULL);
/*!40000 ALTER TABLE `path` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `season_view`
--

DROP TABLE IF EXISTS `season_view`;
/*!50001 DROP VIEW IF EXISTS `season_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `season_view` (
  `idSeason` tinyint NOT NULL,
  `idShow` tinyint NOT NULL,
  `season` tinyint NOT NULL,
  `strPath` tinyint NOT NULL,
  `showTitle` tinyint NOT NULL,
  `plot` tinyint NOT NULL,
  `premiered` tinyint NOT NULL,
  `genre` tinyint NOT NULL,
  `studio` tinyint NOT NULL,
  `mpaa` tinyint NOT NULL,
  `episodes` tinyint NOT NULL,
  `playCount` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `seasons`
--

DROP TABLE IF EXISTS `seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seasons` (
  `idSeason` int(11) NOT NULL AUTO_INCREMENT,
  `idShow` int(11) DEFAULT NULL,
  `season` int(11) DEFAULT NULL,
  PRIMARY KEY (`idSeason`),
  KEY `ix_seasons` (`idShow`,`season`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seasons`
--

LOCK TABLES `seasons` WRITE;
/*!40000 ALTER TABLE `seasons` DISABLE KEYS */;
/*!40000 ALTER TABLE `seasons` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`kodi`@`localhost`*/ /*!50003 TRIGGER delete_season AFTER DELETE ON seasons FOR EACH ROW BEGIN DELETE FROM art WHERE media_id=old.idSeason AND media_type='season'; END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sets`
--

DROP TABLE IF EXISTS `sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sets` (
  `idSet` int(11) NOT NULL AUTO_INCREMENT,
  `strSet` text,
  PRIMARY KEY (`idSet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sets`
--

LOCK TABLES `sets` WRITE;
/*!40000 ALTER TABLE `sets` DISABLE KEYS */;
/*!40000 ALTER TABLE `sets` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`kodi`@`localhost`*/ /*!50003 TRIGGER delete_set AFTER DELETE ON sets FOR EACH ROW BEGIN DELETE FROM art WHERE media_id=old.idSet AND media_type='set'; END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `idFile` int(11) DEFAULT NULL,
  `Deinterlace` tinyint(1) DEFAULT NULL,
  `ViewMode` int(11) DEFAULT NULL,
  `ZoomAmount` float DEFAULT NULL,
  `PixelRatio` float DEFAULT NULL,
  `VerticalShift` float DEFAULT NULL,
  `AudioStream` int(11) DEFAULT NULL,
  `SubtitleStream` int(11) DEFAULT NULL,
  `SubtitleDelay` float DEFAULT NULL,
  `SubtitlesOn` tinyint(1) DEFAULT NULL,
  `Brightness` float DEFAULT NULL,
  `Contrast` float DEFAULT NULL,
  `Gamma` float DEFAULT NULL,
  `VolumeAmplification` float DEFAULT NULL,
  `AudioDelay` float DEFAULT NULL,
  `OutputToAllSpeakers` tinyint(1) DEFAULT NULL,
  `ResumeTime` int(11) DEFAULT NULL,
  `Crop` tinyint(1) DEFAULT NULL,
  `CropLeft` int(11) DEFAULT NULL,
  `CropRight` int(11) DEFAULT NULL,
  `CropTop` int(11) DEFAULT NULL,
  `CropBottom` int(11) DEFAULT NULL,
  `Sharpness` float DEFAULT NULL,
  `NoiseReduction` float DEFAULT NULL,
  `NonLinStretch` tinyint(1) DEFAULT NULL,
  `PostProcess` tinyint(1) DEFAULT NULL,
  `ScalingMethod` int(11) DEFAULT NULL,
  `DeinterlaceMode` int(11) DEFAULT NULL,
  `StereoMode` int(11) DEFAULT NULL,
  `StereoInvert` tinyint(1) DEFAULT NULL,
  UNIQUE KEY `ix_settings` (`idFile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stacktimes`
--

DROP TABLE IF EXISTS `stacktimes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stacktimes` (
  `idFile` int(11) DEFAULT NULL,
  `times` text,
  UNIQUE KEY `ix_stacktimes` (`idFile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stacktimes`
--

LOCK TABLES `stacktimes` WRITE;
/*!40000 ALTER TABLE `stacktimes` DISABLE KEYS */;
/*!40000 ALTER TABLE `stacktimes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `streamdetails`
--

DROP TABLE IF EXISTS `streamdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `streamdetails` (
  `idFile` int(11) DEFAULT NULL,
  `iStreamType` int(11) DEFAULT NULL,
  `strVideoCodec` text,
  `fVideoAspect` float DEFAULT NULL,
  `iVideoWidth` int(11) DEFAULT NULL,
  `iVideoHeight` int(11) DEFAULT NULL,
  `strAudioCodec` text,
  `iAudioChannels` int(11) DEFAULT NULL,
  `strAudioLanguage` text,
  `strSubtitleLanguage` text,
  `iVideoDuration` int(11) DEFAULT NULL,
  `strStereoMode` text,
  KEY `ix_streamdetails` (`idFile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `streamdetails`
--

LOCK TABLES `streamdetails` WRITE;
/*!40000 ALTER TABLE `streamdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `streamdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studio`
--

DROP TABLE IF EXISTS `studio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studio` (
  `studio_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  PRIMARY KEY (`studio_id`),
  UNIQUE KEY `ix_studio_1` (`name`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studio`
--

LOCK TABLES `studio` WRITE;
/*!40000 ALTER TABLE `studio` DISABLE KEYS */;
/*!40000 ALTER TABLE `studio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studio_link`
--

DROP TABLE IF EXISTS `studio_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studio_link` (
  `studio_id` int(11) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `media_type` text,
  UNIQUE KEY `ix_studio_link_1` (`studio_id`,`media_type`(20),`media_id`),
  UNIQUE KEY `ix_studio_link_2` (`media_id`,`media_type`(20),`studio_id`),
  KEY `ix_studio_link_3` (`media_type`(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studio_link`
--

LOCK TABLES `studio_link` WRITE;
/*!40000 ALTER TABLE `studio_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `studio_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  PRIMARY KEY (`tag_id`),
  UNIQUE KEY `ix_tag_1` (`name`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_link`
--

DROP TABLE IF EXISTS `tag_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_link` (
  `tag_id` int(11) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `media_type` text,
  UNIQUE KEY `ix_tag_link_1` (`tag_id`,`media_type`(20),`media_id`),
  UNIQUE KEY `ix_tag_link_2` (`media_id`,`media_type`(20),`tag_id`),
  KEY `ix_tag_link_3` (`media_type`(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_link`
--

LOCK TABLES `tag_link` WRITE;
/*!40000 ALTER TABLE `tag_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_link` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`kodi`@`localhost`*/ /*!50003 TRIGGER delete_tag AFTER DELETE ON tag_link FOR EACH ROW BEGIN DELETE FROM tag WHERE tag_id=old.tag_id AND tag_id NOT IN (SELECT DISTINCT tag_id FROM tag_link); END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tvshow`
--

DROP TABLE IF EXISTS `tvshow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tvshow` (
  `idShow` int(11) NOT NULL AUTO_INCREMENT,
  `c00` text,
  `c01` text,
  `c02` text,
  `c03` text,
  `c04` text,
  `c05` text,
  `c06` text,
  `c07` text,
  `c08` text,
  `c09` text,
  `c10` text,
  `c11` text,
  `c12` text,
  `c13` text,
  `c14` text,
  `c15` text,
  `c16` text,
  `c17` text,
  `c18` text,
  `c19` text,
  `c20` text,
  `c21` text,
  `c22` text,
  `c23` text,
  PRIMARY KEY (`idShow`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tvshow`
--

LOCK TABLES `tvshow` WRITE;
/*!40000 ALTER TABLE `tvshow` DISABLE KEYS */;
/*!40000 ALTER TABLE `tvshow` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`kodi`@`localhost`*/ /*!50003 TRIGGER delete_tvshow AFTER DELETE ON tvshow FOR EACH ROW BEGIN DELETE FROM actor_link WHERE media_id=old.idShow AND media_type='tvshow'; DELETE FROM director_link WHERE media_id=old.idShow AND media_type='tvshow'; DELETE FROM studio_link WHERE media_id=old.idShow AND media_type='tvshow'; DELETE FROM tvshowlinkpath WHERE idShow=old.idShow; DELETE FROM genre_link WHERE media_id=old.idShow AND media_type='tvshow'; DELETE FROM movielinktvshow WHERE idShow=old.idShow; DELETE FROM seasons WHERE idShow=old.idShow; DELETE FROM art WHERE media_id=old.idShow AND media_type='tvshow'; DELETE FROM tag_link WHERE media_id=old.idShow AND media_type='tvshow'; END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `tvshow_view`
--

DROP TABLE IF EXISTS `tvshow_view`;
/*!50001 DROP VIEW IF EXISTS `tvshow_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `tvshow_view` (
  `idShow` tinyint NOT NULL,
  `c00` tinyint NOT NULL,
  `c01` tinyint NOT NULL,
  `c02` tinyint NOT NULL,
  `c03` tinyint NOT NULL,
  `c04` tinyint NOT NULL,
  `c05` tinyint NOT NULL,
  `c06` tinyint NOT NULL,
  `c07` tinyint NOT NULL,
  `c08` tinyint NOT NULL,
  `c09` tinyint NOT NULL,
  `c10` tinyint NOT NULL,
  `c11` tinyint NOT NULL,
  `c12` tinyint NOT NULL,
  `c13` tinyint NOT NULL,
  `c14` tinyint NOT NULL,
  `c15` tinyint NOT NULL,
  `c16` tinyint NOT NULL,
  `c17` tinyint NOT NULL,
  `c18` tinyint NOT NULL,
  `c19` tinyint NOT NULL,
  `c20` tinyint NOT NULL,
  `c21` tinyint NOT NULL,
  `c22` tinyint NOT NULL,
  `c23` tinyint NOT NULL,
  `idParentPath` tinyint NOT NULL,
  `strPath` tinyint NOT NULL,
  `dateAdded` tinyint NOT NULL,
  `lastPlayed` tinyint NOT NULL,
  `totalCount` tinyint NOT NULL,
  `watchedcount` tinyint NOT NULL,
  `totalSeasons` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `tvshowcounts`
--

DROP TABLE IF EXISTS `tvshowcounts`;
/*!50001 DROP VIEW IF EXISTS `tvshowcounts`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `tvshowcounts` (
  `idShow` tinyint NOT NULL,
  `lastPlayed` tinyint NOT NULL,
  `totalCount` tinyint NOT NULL,
  `watchedcount` tinyint NOT NULL,
  `totalSeasons` tinyint NOT NULL,
  `dateAdded` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tvshowlinkpath`
--

DROP TABLE IF EXISTS `tvshowlinkpath`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tvshowlinkpath` (
  `idShow` int(11) DEFAULT NULL,
  `idPath` int(11) DEFAULT NULL,
  UNIQUE KEY `ix_tvshowlinkpath_1` (`idShow`,`idPath`),
  UNIQUE KEY `ix_tvshowlinkpath_2` (`idPath`,`idShow`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tvshowlinkpath`
--

LOCK TABLES `tvshowlinkpath` WRITE;
/*!40000 ALTER TABLE `tvshowlinkpath` DISABLE KEYS */;
/*!40000 ALTER TABLE `tvshowlinkpath` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `version`
--

DROP TABLE IF EXISTS `version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `version` (
  `idVersion` int(11) DEFAULT NULL,
  `iCompressCount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version`
--

LOCK TABLES `version` WRITE;
/*!40000 ALTER TABLE `version` DISABLE KEYS */;
INSERT INTO `version` VALUES (93,0);
/*!40000 ALTER TABLE `version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `writer_link`
--

DROP TABLE IF EXISTS `writer_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `writer_link` (
  `actor_id` int(11) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `media_type` text,
  UNIQUE KEY `ix_writer_link_1` (`actor_id`,`media_type`(20),`media_id`),
  UNIQUE KEY `ix_writer_link_2` (`media_id`,`media_type`(20),`actor_id`),
  KEY `ix_writer_link_3` (`media_type`(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `writer_link`
--

LOCK TABLES `writer_link` WRITE;
/*!40000 ALTER TABLE `writer_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `writer_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `episode_view`
--

/*!50001 DROP TABLE IF EXISTS `episode_view`*/;
/*!50001 DROP VIEW IF EXISTS `episode_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`kodi`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `episode_view` AS select `episode`.`idEpisode` AS `idEpisode`,`episode`.`idFile` AS `idFile`,`episode`.`c00` AS `c00`,`episode`.`c01` AS `c01`,`episode`.`c02` AS `c02`,`episode`.`c03` AS `c03`,`episode`.`c04` AS `c04`,`episode`.`c05` AS `c05`,`episode`.`c06` AS `c06`,`episode`.`c07` AS `c07`,`episode`.`c08` AS `c08`,`episode`.`c09` AS `c09`,`episode`.`c10` AS `c10`,`episode`.`c11` AS `c11`,`episode`.`c12` AS `c12`,`episode`.`c13` AS `c13`,`episode`.`c14` AS `c14`,`episode`.`c15` AS `c15`,`episode`.`c16` AS `c16`,`episode`.`c17` AS `c17`,`episode`.`c18` AS `c18`,`episode`.`c19` AS `c19`,`episode`.`c20` AS `c20`,`episode`.`c21` AS `c21`,`episode`.`c22` AS `c22`,`episode`.`c23` AS `c23`,`episode`.`idShow` AS `idShow`,`files`.`strFilename` AS `strFileName`,`path`.`strPath` AS `strPath`,`files`.`playCount` AS `playCount`,`files`.`lastPlayed` AS `lastPlayed`,`files`.`dateAdded` AS `dateAdded`,`tvshow`.`c00` AS `strTitle`,`tvshow`.`c14` AS `studio`,`tvshow`.`c05` AS `premiered`,`tvshow`.`c13` AS `mpaa`,`bookmark`.`timeInSeconds` AS `resumeTimeInSeconds`,`bookmark`.`totalTimeInSeconds` AS `totalTimeInSeconds`,`seasons`.`idSeason` AS `idSeason` from (((((`episode` join `files` on((`files`.`idFile` = `episode`.`idFile`))) join `tvshow` on((`tvshow`.`idShow` = `episode`.`idShow`))) left join `seasons` on(((`seasons`.`idShow` = `episode`.`idShow`) and (`seasons`.`season` = `episode`.`c12`)))) join `path` on((`files`.`idPath` = `path`.`idPath`))) left join `bookmark` on(((`bookmark`.`idFile` = `episode`.`idFile`) and (`bookmark`.`type` = 1)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `movie_view`
--

/*!50001 DROP TABLE IF EXISTS `movie_view`*/;
/*!50001 DROP VIEW IF EXISTS `movie_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`kodi`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `movie_view` AS select `movie`.`idMovie` AS `idMovie`,`movie`.`idFile` AS `idFile`,`movie`.`c00` AS `c00`,`movie`.`c01` AS `c01`,`movie`.`c02` AS `c02`,`movie`.`c03` AS `c03`,`movie`.`c04` AS `c04`,`movie`.`c05` AS `c05`,`movie`.`c06` AS `c06`,`movie`.`c07` AS `c07`,`movie`.`c08` AS `c08`,`movie`.`c09` AS `c09`,`movie`.`c10` AS `c10`,`movie`.`c11` AS `c11`,`movie`.`c12` AS `c12`,`movie`.`c13` AS `c13`,`movie`.`c14` AS `c14`,`movie`.`c15` AS `c15`,`movie`.`c16` AS `c16`,`movie`.`c17` AS `c17`,`movie`.`c18` AS `c18`,`movie`.`c19` AS `c19`,`movie`.`c20` AS `c20`,`movie`.`c21` AS `c21`,`movie`.`c22` AS `c22`,`movie`.`c23` AS `c23`,`movie`.`idSet` AS `idSet`,`sets`.`strSet` AS `strSet`,`files`.`strFilename` AS `strFileName`,`path`.`strPath` AS `strPath`,`files`.`playCount` AS `playCount`,`files`.`lastPlayed` AS `lastPlayed`,`files`.`dateAdded` AS `dateAdded`,`bookmark`.`timeInSeconds` AS `resumeTimeInSeconds`,`bookmark`.`totalTimeInSeconds` AS `totalTimeInSeconds` from ((((`movie` left join `sets` on((`sets`.`idSet` = `movie`.`idSet`))) join `files` on((`files`.`idFile` = `movie`.`idFile`))) join `path` on((`path`.`idPath` = `files`.`idPath`))) left join `bookmark` on(((`bookmark`.`idFile` = `movie`.`idFile`) and (`bookmark`.`type` = 1)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `musicvideo_view`
--

/*!50001 DROP TABLE IF EXISTS `musicvideo_view`*/;
/*!50001 DROP VIEW IF EXISTS `musicvideo_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`kodi`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `musicvideo_view` AS select `musicvideo`.`idMVideo` AS `idMVideo`,`musicvideo`.`idFile` AS `idFile`,`musicvideo`.`c00` AS `c00`,`musicvideo`.`c01` AS `c01`,`musicvideo`.`c02` AS `c02`,`musicvideo`.`c03` AS `c03`,`musicvideo`.`c04` AS `c04`,`musicvideo`.`c05` AS `c05`,`musicvideo`.`c06` AS `c06`,`musicvideo`.`c07` AS `c07`,`musicvideo`.`c08` AS `c08`,`musicvideo`.`c09` AS `c09`,`musicvideo`.`c10` AS `c10`,`musicvideo`.`c11` AS `c11`,`musicvideo`.`c12` AS `c12`,`musicvideo`.`c13` AS `c13`,`musicvideo`.`c14` AS `c14`,`musicvideo`.`c15` AS `c15`,`musicvideo`.`c16` AS `c16`,`musicvideo`.`c17` AS `c17`,`musicvideo`.`c18` AS `c18`,`musicvideo`.`c19` AS `c19`,`musicvideo`.`c20` AS `c20`,`musicvideo`.`c21` AS `c21`,`musicvideo`.`c22` AS `c22`,`musicvideo`.`c23` AS `c23`,`files`.`strFilename` AS `strFileName`,`path`.`strPath` AS `strPath`,`files`.`playCount` AS `playCount`,`files`.`lastPlayed` AS `lastPlayed`,`files`.`dateAdded` AS `dateAdded`,`bookmark`.`timeInSeconds` AS `resumeTimeInSeconds`,`bookmark`.`totalTimeInSeconds` AS `totalTimeInSeconds` from (((`musicvideo` join `files` on((`files`.`idFile` = `musicvideo`.`idFile`))) join `path` on((`path`.`idPath` = `files`.`idPath`))) left join `bookmark` on(((`bookmark`.`idFile` = `musicvideo`.`idFile`) and (`bookmark`.`type` = 1)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `season_view`
--

/*!50001 DROP TABLE IF EXISTS `season_view`*/;
/*!50001 DROP VIEW IF EXISTS `season_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`kodi`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `season_view` AS select `seasons`.`idSeason` AS `idSeason`,`seasons`.`idShow` AS `idShow`,`seasons`.`season` AS `season`,`tvshow_view`.`strPath` AS `strPath`,`tvshow_view`.`c00` AS `showTitle`,`tvshow_view`.`c01` AS `plot`,`tvshow_view`.`c05` AS `premiered`,`tvshow_view`.`c08` AS `genre`,`tvshow_view`.`c14` AS `studio`,`tvshow_view`.`c13` AS `mpaa`,count(distinct `episode_view`.`idEpisode`) AS `episodes`,count(`files`.`playCount`) AS `playCount` from (((`seasons` join `tvshow_view` on((`tvshow_view`.`idShow` = `seasons`.`idShow`))) join `episode_view` on(((`episode_view`.`idShow` = `seasons`.`idShow`) and (`episode_view`.`c12` = `seasons`.`season`)))) join `files` on((`files`.`idFile` = `episode_view`.`idFile`))) group by `seasons`.`idSeason` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `tvshow_view`
--

/*!50001 DROP TABLE IF EXISTS `tvshow_view`*/;
/*!50001 DROP VIEW IF EXISTS `tvshow_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`kodi`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `tvshow_view` AS select `tvshow`.`idShow` AS `idShow`,`tvshow`.`c00` AS `c00`,`tvshow`.`c01` AS `c01`,`tvshow`.`c02` AS `c02`,`tvshow`.`c03` AS `c03`,`tvshow`.`c04` AS `c04`,`tvshow`.`c05` AS `c05`,`tvshow`.`c06` AS `c06`,`tvshow`.`c07` AS `c07`,`tvshow`.`c08` AS `c08`,`tvshow`.`c09` AS `c09`,`tvshow`.`c10` AS `c10`,`tvshow`.`c11` AS `c11`,`tvshow`.`c12` AS `c12`,`tvshow`.`c13` AS `c13`,`tvshow`.`c14` AS `c14`,`tvshow`.`c15` AS `c15`,`tvshow`.`c16` AS `c16`,`tvshow`.`c17` AS `c17`,`tvshow`.`c18` AS `c18`,`tvshow`.`c19` AS `c19`,`tvshow`.`c20` AS `c20`,`tvshow`.`c21` AS `c21`,`tvshow`.`c22` AS `c22`,`tvshow`.`c23` AS `c23`,`path`.`idParentPath` AS `idParentPath`,`path`.`strPath` AS `strPath`,`tvshowcounts`.`dateAdded` AS `dateAdded`,`tvshowcounts`.`lastPlayed` AS `lastPlayed`,`tvshowcounts`.`totalCount` AS `totalCount`,`tvshowcounts`.`watchedcount` AS `watchedcount`,`tvshowcounts`.`totalSeasons` AS `totalSeasons` from (((`tvshow` left join `tvshowlinkpath` on((`tvshowlinkpath`.`idShow` = `tvshow`.`idShow`))) left join `path` on((`path`.`idPath` = `tvshowlinkpath`.`idPath`))) join `tvshowcounts` on((`tvshow`.`idShow` = `tvshowcounts`.`idShow`))) group by `tvshow`.`idShow` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `tvshowcounts`
--

/*!50001 DROP TABLE IF EXISTS `tvshowcounts`*/;
/*!50001 DROP VIEW IF EXISTS `tvshowcounts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`kodi`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `tvshowcounts` AS select `tvshow`.`idShow` AS `idShow`,max(`files`.`lastPlayed`) AS `lastPlayed`,nullif(count(`episode`.`c12`),0) AS `totalCount`,count(`files`.`playCount`) AS `watchedcount`,nullif(count(distinct `episode`.`c12`),0) AS `totalSeasons`,max(`files`.`dateAdded`) AS `dateAdded` from ((`tvshow` left join `episode` on((`episode`.`idShow` = `tvshow`.`idShow`))) left join `files` on((`files`.`idFile` = `episode`.`idFile`))) group by `tvshow`.`idShow` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-09 19:05:29
