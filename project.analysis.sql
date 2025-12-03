-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `air_dates`
--

DROP TABLE IF EXISTS `air_dates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `air_dates` (
  `is_first` tinyint(1) NOT NULL,
  `show_id` int NOT NULL,
  `date` varchar(100) NOT NULL,
  PRIMARY KEY (`show_id`,`is_first`),
  CONSTRAINT `fk_air_dates_show2` FOREIGN KEY (`show_id`) REFERENCES `shows` (`show_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `created_by_types`
--

DROP TABLE IF EXISTS `created_by_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `created_by_types` (
  `created_by_type_id` int NOT NULL,
  `created_by_name` varchar(45) NOT NULL,
  PRIMARY KEY (`created_by_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `created_bys`
--

DROP TABLE IF EXISTS `created_bys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `created_bys` (
  `show_id` int NOT NULL,
  `created_by_type_id` int NOT NULL,
  PRIMARY KEY (`show_id`,`created_by_type_id`),
  KEY `fk_created_by_created_by_type1_idx` (`created_by_type_id`),
  CONSTRAINT `fk_created_by_created_by_type1` FOREIGN KEY (`created_by_type_id`) REFERENCES `created_by_types` (`created_by_type_id`),
  CONSTRAINT `fk_created_by_show1` FOREIGN KEY (`show_id`) REFERENCES `shows` (`show_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `genre_types`
--

DROP TABLE IF EXISTS `genre_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre_types` (
  `genre_type_id` int NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(45) NOT NULL,
  PRIMARY KEY (`genre_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `show_id` int NOT NULL,
  `genre_type_id` int NOT NULL,
  PRIMARY KEY (`show_id`,`genre_type_id`),
  KEY `fk_genres_show1_idx` (`show_id`),
  KEY `fk_genres_genre_types1_idx` (`genre_type_id`),
  CONSTRAINT `fk_genres_genre_types1` FOREIGN KEY (`genre_type_id`) REFERENCES `genre_types` (`genre_type_id`),
  CONSTRAINT `fk_genres_show1` FOREIGN KEY (`show_id`) REFERENCES `shows` (`show_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `language_types`
--

DROP TABLE IF EXISTS `language_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language_types` (
  `language_type_id` int NOT NULL,
  `language_name` varchar(45) NOT NULL,
  PRIMARY KEY (`language_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `show_id` int NOT NULL,
  `language_type_id` int NOT NULL,
  PRIMARY KEY (`show_id`,`language_type_id`),
  KEY `fk_languages_show_idx` (`show_id`),
  KEY `fk_languages_languages_type1_idx` (`language_type_id`),
  CONSTRAINT `fk_languages_languages_type1` FOREIGN KEY (`language_type_id`) REFERENCES `language_types` (`language_type_id`),
  CONSTRAINT `fk_languages_show` FOREIGN KEY (`show_id`) REFERENCES `shows` (`show_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `link_types`
--

DROP TABLE IF EXISTS `link_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `link_types` (
  `link_type_id` int NOT NULL AUTO_INCREMENT,
  `link_type_name` varchar(100) NOT NULL,
  PRIMARY KEY (`link_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `links`
--

DROP TABLE IF EXISTS `links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `links` (
  `link_type_id` int NOT NULL,
  `show_id` int NOT NULL,
  `link_name` varchar(500) NOT NULL,
  PRIMARY KEY (`link_type_id`,`show_id`),
  KEY `fk_links_link_type1_idx` (`link_type_id`),
  KEY `fk_links_show1_idx` (`show_id`),
  CONSTRAINT `fk_links_link_type1` FOREIGN KEY (`link_type_id`) REFERENCES `link_types` (`link_type_id`),
  CONSTRAINT `fk_links_show1` FOREIGN KEY (`show_id`) REFERENCES `shows` (`show_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `network_types`
--

DROP TABLE IF EXISTS `network_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `network_types` (
  `network_type_id` int NOT NULL AUTO_INCREMENT,
  `network_name` varchar(45) NOT NULL,
  PRIMARY KEY (`network_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3399 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `networks`
--

DROP TABLE IF EXISTS `networks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `networks` (
  `show_id` int NOT NULL,
  `network_type_id` int NOT NULL,
  PRIMARY KEY (`show_id`,`network_type_id`),
  KEY `fk_networks_show1_idx` (`show_id`),
  KEY `fk_networks_network_types1_idx` (`network_type_id`),
  CONSTRAINT `fk_networks_network_types1` FOREIGN KEY (`network_type_id`) REFERENCES `network_types` (`network_type_id`),
  CONSTRAINT `fk_networks_show1` FOREIGN KEY (`show_id`) REFERENCES `shows` (`show_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `origin_country_types`
--

DROP TABLE IF EXISTS `origin_country_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `origin_country_types` (
  `origin_country_type_id` int NOT NULL,
  `origin_country_name` varchar(45) NOT NULL,
  PRIMARY KEY (`origin_country_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `production_companies`
--

DROP TABLE IF EXISTS `production_companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `production_companies` (
  `show_id` int NOT NULL,
  `production_companies_name_id` int NOT NULL,
  PRIMARY KEY (`show_id`,`production_companies_name_id`),
  KEY `fk_production_companies_show1_idx` (`show_id`),
  KEY `fk_production_companies_production_companies_type1_idx` (`production_companies_name_id`),
  CONSTRAINT `fk_production_companies_production_companies_type1` FOREIGN KEY (`production_companies_name_id`) REFERENCES `production_company_types` (`production_companies_name_id`),
  CONSTRAINT `fk_production_companies_show1` FOREIGN KEY (`show_id`) REFERENCES `shows` (`show_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `production_company_types`
--

DROP TABLE IF EXISTS `production_company_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `production_company_types` (
  `production_companies_name_id` int NOT NULL,
  `production_company_name` varchar(45) NOT NULL,
  PRIMARY KEY (`production_companies_name_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `production_countries`
--

DROP TABLE IF EXISTS `production_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `production_countries` (
  `show_id` int NOT NULL,
  `production_countries_type_id` int NOT NULL,
  `origin_country_type_id` int NOT NULL,
  PRIMARY KEY (`show_id`,`production_countries_type_id`,`origin_country_type_id`),
  KEY `fk_production_countries_show1_idx` (`show_id`),
  KEY `fk_production_countries_production_countries_type1_idx` (`production_countries_type_id`),
  KEY `fk_production_countries_origin_country_type1_idx` (`origin_country_type_id`),
  CONSTRAINT `fk_production_countries_origin_country_type1` FOREIGN KEY (`origin_country_type_id`) REFERENCES `origin_country_types` (`origin_country_type_id`),
  CONSTRAINT `fk_production_countries_production_countries_type1` FOREIGN KEY (`production_countries_type_id`) REFERENCES `production_country_types` (`production_countries_type_id`),
  CONSTRAINT `fk_production_countries_show1` FOREIGN KEY (`show_id`) REFERENCES `shows` (`show_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `production_country_types`
--

DROP TABLE IF EXISTS `production_country_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `production_country_types` (
  `production_countries_type_id` int NOT NULL,
  `production_countries_name` varchar(45) NOT NULL,
  PRIMARY KEY (`production_countries_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `show_votes`
--

DROP TABLE IF EXISTS `show_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `show_votes` (
  `vote_count` int NOT NULL,
  `vote_average` int NOT NULL,
  `show_id` int NOT NULL,
  PRIMARY KEY (`show_id`),
  CONSTRAINT `fk_show_votes_show1` FOREIGN KEY (`show_id`) REFERENCES `shows` (`show_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shows`
--

DROP TABLE IF EXISTS `shows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shows` (
  `show_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `number_of_seasons` smallint NOT NULL,
  `number_of_eposides` smallint NOT NULL,
  `overview` longtext,
  `adult` tinyint(1) NOT NULL,
  `in_production` tinyint(1) NOT NULL,
  `original_name` varchar(255) NOT NULL,
  `popularity` double NOT NULL,
  `tagline` varchar(255) DEFAULT NULL,
  `eposide_run_time` smallint NOT NULL,
  `status_id` int NOT NULL,
  `type_id` int NOT NULL,
  PRIMARY KEY (`show_id`,`status_id`,`type_id`),
  KEY `fk_show_status1_idx` (`status_id`),
  KEY `fk_show_types1_idx` (`type_id`),
  CONSTRAINT `fk_show_status1` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`),
  CONSTRAINT `fk_show_types1` FOREIGN KEY (`type_id`) REFERENCES `types` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spoken_language_types`
--

DROP TABLE IF EXISTS `spoken_language_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spoken_language_types` (
  `spoken_languages_type_id` int NOT NULL,
  `spoken_languages_name` varchar(45) NOT NULL,
  PRIMARY KEY (`spoken_languages_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spoken_languages`
--

DROP TABLE IF EXISTS `spoken_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spoken_languages` (
  `show_id` int NOT NULL,
  `spoken_languages_type_id` int NOT NULL,
  PRIMARY KEY (`show_id`,`spoken_languages_type_id`),
  KEY `fk_spoken_languages_spoken_languages_type1_idx` (`spoken_languages_type_id`),
  CONSTRAINT `fk_spoken_languages_show1` FOREIGN KEY (`show_id`) REFERENCES `shows` (`show_id`),
  CONSTRAINT `fk_spoken_languages_spoken_languages_type1` FOREIGN KEY (`spoken_languages_type_id`) REFERENCES `spoken_language_types` (`spoken_languages_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `status_id` int NOT NULL,
  `status_name` varchar(45) NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `types` (
  `type_id` int NOT NULL,
  `type_name` varchar(45) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-03 14:54:19

--
-- Индексы для оптимизации запросов (CREATE INDEX)
--

-- 1. Индексы для ускорения поиска по названию и популярности шоу
CREATE INDEX idx_shows_name ON shows (name);
CREATE INDEX idx_shows_popularity ON shows (popularity);

-- 2. Индексы для ускорения поиска по типам (для аналитики, например, по жанру)
CREATE INDEX idx_genres_type_id ON genres (genre_type_id);
CREATE INDEX idx_networks_type_id ON networks (network_type_id);

-- 3. Индексы для ускорения поиска по странам происхождения и производства
CREATE INDEX idx_production_countries_type ON production_countries (production_countries_type_id);
CREATE INDEX idx_origin_country_type ON production_countries (origin_country_type_id);

-- 4. Индекс для поиска по датам выхода (если нужно фильтровать по году/дате)
CREATE INDEX idx_air_dates_date ON air_dates (date);

--
-- АНАЛИТИЧЕСКИЕ ЗАПРОСЫ (Эквивалент 03_analysis_queries.sql)
-- Здесь используются команды SELECT, которые отвечают на цели проекта.
--

-- 1. Топ-10 самых популярных ТВ-шоу (по показателю 'popularity')
-- Цель: Выявить абсолютных лидеров по вниманию зрителей.
SELECT 
    show_id, 
    name, 
    popularity, 
    tagline
FROM 
    shows
ORDER BY 
    popularity DESC
LIMIT 10;

-- 2. Рейтинг жанров: Какие жанры имеют самый высокий средний балл (vote_average)?
-- Цель: Определить, какие типы контента получают наилучшие отзывы.
SELECT 
    gt.genre_name,
    COUNT(s.show_id) AS total_shows,
    -- Средний балл (vote_average) хранится в show_votes
    AVG(sv.vote_average) AS avg_vote_score
FROM 
    genre_types gt
JOIN 
    genres g ON gt.genre_type_id = g.genre_type_id
JOIN 
    shows s ON g.show_id = s.show_id
JOIN 
    show_votes sv ON s.show_id = sv.show_id
GROUP BY 
    gt.genre_name
HAVING 
    COUNT(s.show_id) >= 10 -- Учитываем только жанры с достаточным количеством шоу
ORDER BY 
    avg_vote_score DESC;

-- 3. Анализ успешности по количеству сезонов: 
-- Сколько сезонов в среднем у шоу с высоким рейтингом (vote_average > 7)?
-- Цель: Проверить, связана ли долговечность шоу с его качеством.
SELECT 
    AVG(s.number_of_seasons) AS avg_seasons_high_rated,
    MIN(s.number_of_seasons) AS min_seasons,
    MAX(s.number_of_seasons) AS max_seasons
FROM 
    shows s
JOIN 
    show_votes sv ON s.show_id = sv.show_id
WHERE 
    sv.vote_average > 7;

-- 4. Топ-5 стран, которые производят самые популярные шоу (по суммарной популярности)
-- Цель: Выявить ключевые страны-производители на мировом рынке.
SELECT 
    oct.origin_country_name,
    SUM(s.popularity) AS total_popularity
FROM 
    shows s
JOIN 
    production_countries pc ON s.show_id = pc.show_id
JOIN 
    origin_country_types oct ON pc.origin_country_type_id = oct.origin_country_type_id
GROUP BY 
    oct.origin_country_name
ORDER BY 
    total_popularity DESC
LIMIT 5;

-- 5. Статус производства: Распределение шоу по текущему статусу (In Production, Ended, etc.)
-- Цель: Оценить активность и завершенность проектов.
SELECT 
    st.status_name,
    COUNT(s.show_id) AS total_shows
FROM 
    shows s
JOIN 
    status st ON s.status_id = st.status_id
GROUP BY 
    st.status_name
ORDER BY 
    total_shows DESC;