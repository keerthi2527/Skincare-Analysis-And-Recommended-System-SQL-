-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: skincare
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredients` (
  `Ingredient_Id` int NOT NULL AUTO_INCREMENT,
  `Ingredient_Name` varchar(100) NOT NULL,
  `Purpose` varchar(100) DEFAULT NULL,
  `Safety_Rating` enum('Safe','Use with Caution','Avoid') DEFAULT 'Safe',
  `Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Ingredient_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES (1,'Retinol','Anti-Aging','Use with Caution','Vitamin A derivative for reducing wrinkles'),(2,'Niacinamide','Brightening','Safe','Vitamin B3 for skin tone and texture'),(3,'Salicylic Acid','Acne Treatment','Use with Caution','Beta hydroxy acid for exfoliation and acne'),(4,'Hyaluronic Acid','Hydrating','Safe','Moisturizes and retains skin moisture'),(5,'Vitamin C','Brightening','Safe','Antioxidant that brightens skin and reduces pigmentation'),(6,'Glycerin','Hydrating','Safe','Moisturizer that attracts water to skin'),(7,'Aloe Vera','Soothing','Safe','Calms irritation and hydrates skin'),(8,'Peptides','Anti-Aging','Safe','Supports collagen production and skin elasticity'),(9,'Zinc','Acne Treatment','Safe','Reduces inflammation and acne breakouts'),(10,'Sunscreen SPF50','Sun Protection','Safe','Protects skin from harmful UV rays'),(11,'Ceramides','Hydrating','Safe','Strengthens skin barrier and retains moisture'),(12,'Shea Butter','Moisturizer','Safe','Rich emollient for dry skin'),(13,'Alpha Arbutin','Brightening','Safe','Reduces dark spots and pigmentation'),(14,'Caffeine','De-puffing','Safe','Reduces under-eye puffiness and dark circles'),(15,'Salicylic Acid','Exfoliation','Use with Caution','Removes dead skin cells'),(16,'Lactic Acid','Exfoliation','Use with Caution','Mild alpha hydroxy acid for smooth skin'),(17,'Glycolic Acid','Exfoliation','Use with Caution','Alpha hydroxy acid for peeling and renewal'),(18,'Tea Tree Oil','Acne Treatment','Use with Caution','Natural antibacterial for acne'),(19,'Vitamin E','Antioxidant','Safe','Protects skin from free radical damage'),(20,'Kojic Acid','Brightening','Use with Caution','Reduces pigmentation and dark spots'),(21,'Cica','Soothing','Safe','Centella Asiatica for sensitive and irritated skin'),(22,'Panthenol','Hydrating','Safe','Vitamin B5 to soothe and hydrate skin'),(23,'Mandelic Acid','Exfoliation','Use with Caution','Gentle AHA for sensitive skin'),(24,'Retinyl Palmitate','Anti-Aging','Use with Caution','Vitamin A derivative for anti-aging'),(25,'Zinc Oxide','Sun Protection','Safe','Physical sunscreen ingredient');
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_ingredients`
--

DROP TABLE IF EXISTS `product_ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_ingredients` (
  `Product_Ingredient_Id` int NOT NULL AUTO_INCREMENT,
  `Product_Id` int NOT NULL,
  `Ingredient_Id` int NOT NULL,
  `Concentration` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Product_Ingredient_Id`),
  KEY `Product_Id` (`Product_Id`),
  KEY `Ingredient_Id` (`Ingredient_Id`),
  CONSTRAINT `product_ingredients_ibfk_1` FOREIGN KEY (`Product_Id`) REFERENCES `products` (`Product_Id`) ON DELETE CASCADE,
  CONSTRAINT `product_ingredients_ibfk_2` FOREIGN KEY (`Ingredient_Id`) REFERENCES `ingredients` (`Ingredient_Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_ingredients`
--

LOCK TABLES `product_ingredients` WRITE;
/*!40000 ALTER TABLE `product_ingredients` DISABLE KEYS */;
INSERT INTO `product_ingredients` VALUES (1,1,3,'2%'),(2,1,6,'5%'),(3,2,4,'3%'),(4,2,11,'2%'),(5,3,5,'10%'),(6,3,4,'1%'),(7,4,4,'2%'),(8,4,12,'5%'),(9,5,14,'1%'),(10,5,23,'0.5%'),(11,6,3,'1.5%'),(12,6,6,'4%'),(13,7,5,'10%'),(14,7,2,'5%'),(15,8,4,'3%'),(16,8,12,'4%'),(17,9,2,'5%'),(18,9,13,'2%'),(19,10,24,'10%'),(20,10,6,'2%');
/*!40000 ALTER TABLE `product_ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_usage_logs`
--

DROP TABLE IF EXISTS `product_usage_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_usage_logs` (
  `Usage_Id` int NOT NULL AUTO_INCREMENT,
  `User_Id` int DEFAULT NULL,
  `Product_Id` int DEFAULT NULL,
  `Usage_Date` date DEFAULT NULL,
  PRIMARY KEY (`Usage_Id`),
  KEY `User_Id` (`User_Id`),
  KEY `Product_Id` (`Product_Id`),
  CONSTRAINT `product_usage_logs_ibfk_1` FOREIGN KEY (`User_Id`) REFERENCES `users_table` (`User_Id`),
  CONSTRAINT `product_usage_logs_ibfk_2` FOREIGN KEY (`Product_Id`) REFERENCES `products` (`Product_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_usage_logs`
--

LOCK TABLES `product_usage_logs` WRITE;
/*!40000 ALTER TABLE `product_usage_logs` DISABLE KEYS */;
INSERT INTO `product_usage_logs` VALUES (1,1,1,'2025-01-05'),(2,1,2,'2025-01-12'),(3,2,3,'2025-01-08'),(4,3,1,'2025-01-10'),(5,3,4,'2025-01-18'),(6,4,2,'2025-01-07'),(7,5,5,'2025-01-14'),(8,6,6,'2025-01-09'),(9,7,3,'2025-01-11'),(10,8,4,'2025-01-06'),(11,11,2,'2025-01-13'),(12,12,3,'2025-01-15'),(13,13,6,'2025-01-17'),(14,14,1,'2025-01-20'),(15,15,7,'2025-01-18'),(16,16,4,'2025-01-22'),(17,17,5,'2025-01-12'),(18,18,8,'2025-01-25'),(19,19,3,'2025-01-17'),(20,20,6,'2025-01-28'),(21,21,1,'2025-02-01'),(22,22,2,'2025-02-03'),(23,23,4,'2025-02-05'),(24,24,6,'2025-02-07'),(25,25,3,'2025-02-09'),(26,26,5,'2025-02-11'),(27,27,7,'2025-02-13'),(28,28,2,'2025-02-15'),(29,29,1,'2025-02-17'),(30,30,4,'2025-02-19'),(31,31,6,'2025-02-21'),(32,32,3,'2025-02-23'),(33,33,5,'2025-02-25'),(34,34,2,'2025-02-27'),(35,35,1,'2025-03-01'),(36,36,4,'2025-03-03'),(37,37,6,'2025-03-05'),(38,38,7,'2025-03-07'),(39,39,3,'2025-03-09'),(40,40,5,'2025-03-11'),(41,41,2,'2025-03-13'),(42,42,4,'2025-03-15'),(43,43,1,'2025-03-17'),(44,44,6,'2025-03-19'),(45,45,3,'2025-03-21'),(46,46,5,'2025-03-23'),(47,47,7,'2025-03-25'),(48,48,2,'2025-03-27'),(49,49,4,'2025-03-29'),(50,50,6,'2025-03-31');
/*!40000 ALTER TABLE `product_usage_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `Product_Id` int NOT NULL AUTO_INCREMENT,
  `Brand` varchar(50) NOT NULL,
  `Product_Name` varchar(50) NOT NULL,
  `Category` varchar(50) DEFAULT NULL,
  `Price` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`Product_Id`),
  CONSTRAINT `products_chk_1` CHECK ((`Price` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Neutrogena','Oil-Free Acne Wash','Cleanser',499.00),(2,'Neutrogena','Hydro Boost Gel Cream','Moisturizer',1099.00),(3,'The Body Shop','Vitamin C Glow Serum','Serum',1299.00),(4,'Himalaya','Gentle Moisturizer','Moisturizer',399.00),(5,'L\'Oreal','Revitalift Eye Cream','Eye Cream',699.00),(6,'Cetaphil','Daily Facial Cleanser','Cleanser',599.00),(7,'Mamaearth','Bright Face Serum','Serum',899.00),(8,'Nivea','Hydrating Moisturizer','Moisturizer',349.00),(9,'Clinique','Even Better Dark Spot Serum','Serum',2199.00),(10,'Garnier','Sunscreen SPF50','Sunscreen',299.00),(11,'Olay','Anti-Aging Cream','Moisturizer',1499.00),(12,'Plum','Green Tea Face Wash','Cleanser',499.00),(13,'Forest Essentials','Night Repair Serum','Serum',2499.00),(14,'Biotique','Under Eye Cream','Eye Cream',299.00),(15,'Innisfree','Jeju Volcanic Clay Mask','Mask',699.00),(16,'Dermaco','Brightening Face Serum','Serum',1599.00),(17,'Dermaco','Hydrating Face Cream','Moisturizer',1299.00),(18,'Dr. Sheth\'s','Niacinamide + Zinc Face Wash','Cleanser',899.00),(19,'Dr. Sheth\'s','Vitamin C Face Serum','Serum',1999.00),(20,'Deconstruct','Anti-Pigmentation Cream','Moisturizer',1499.00),(21,'Deconstruct','Gentle Exfoliating Cleanser','Cleanser',699.00),(22,'La Roche-Posay','Retinol Face Serum','Retinol',2199.00),(23,'Neutrogena','Ultra Sheer Sunscreen SPF50','Sunscreen',399.00),(24,'Kiehl\'s','Calendula Herbal Toner','Toner',1299.00),(25,'Plum','Vitamin C Toner','Toner',799.00),(26,'Olay','Retinol 24 Night Cream','Retinol',1899.00),(27,'Bioderma','Hydrabio Toner','Toner',999.00),(28,'L\'Oreal','UV Sunscreen SPF50','Sunscreen',499.00),(29,'Mamaearth','Retinol Night Serum','Retinol',1099.00),(30,'Cetaphil','Gentle Hydrating Toner','Toner',699.00),(31,'The Ordinary','Niacinamide 10% + Zinc 1%','Serum',799.00),(32,'The Ordinary','Retinol 1% in Squalane','Retinol',1099.00),(33,'Estee Lauder','Advanced Night Repair Serum','Serum',3499.00),(34,'Skinceuticals','C E Ferulic Serum','Serum',2999.00),(35,'Paula\'s Choice','2% BHA Liquid Exfoliant','Exfoliator',2299.00),(36,'Neutrogena','Rapid Wrinkle Repair Cream','Retinol',1599.00),(37,'Olay','Eyes Brightening Cream','Eye Cream',1299.00),(38,'La Roche-Posay','Hydreane Light Moisturizer','Moisturizer',1499.00),(39,'Garnier','Bright Complete Face Wash','Cleanser',399.00),(40,'Innisfree','Green Tea Seed Serum','Serum',1299.00),(41,'Clinique','Moisture Surge Cream','Moisturizer',2499.00),(42,'Dermaco','Vitamin C Night Cream','Night Cream',1499.00),(43,'Dr. Sheth\'s','Sunscreen SPF50 PA+++','Sunscreen',1299.00),(44,'Plum','Hydrating Face Oil','Face Oil',899.00),(45,'Forest Essentials','Deep Exfoliating Face Scrub','Exfoliator',1999.00),(46,'Biotique','Sheet Mask Aloe Vera','Sheet Mask',299.00),(47,'Innisfree','Volcanic Pore Clay Mask','Mask',699.00),(48,'Kiehl\'s','Midnight Recovery Concentrate','Face Oil',3499.00),(49,'Mamaearth','Cica & Retinol Face Serum','Retinol',1299.00),(50,'Deconstruct','Brightening Toner','Toner',999.00),(51,'Bioderma','Sebium Pore Refiner','Serum',1299.00),(52,'Neutrogena','Oil-Free Acne Wash','Cleanser',499.00),(53,'Plum','Green Tea Face Wash','Cleanser',499.00),(54,'Mamaearth','Bright Face Serum','Serum',899.00),(55,'Dr. Sheth\'s','Niacinamide + Zinc Face Wash','Cleanser',899.00),(56,'Olay','Anti-Aging Cream','Moisturizer',1499.00),(57,'Clinique','Even Better Dark Spot Serum','Serum',2199.00);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recommendations`
--

DROP TABLE IF EXISTS `recommendations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recommendations` (
  `Recommendation_Id` int NOT NULL AUTO_INCREMENT,
  `User_Id` int NOT NULL,
  `Concern_Id` int NOT NULL,
  `Product_Id` int NOT NULL,
  `Recommendation_Date` date DEFAULT NULL,
  `Recommendation_Reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Recommendation_Id`),
  KEY `User_Id` (`User_Id`),
  KEY `Concern_Id` (`Concern_Id`),
  KEY `Product_Id` (`Product_Id`),
  CONSTRAINT `recommendations_ibfk_1` FOREIGN KEY (`User_Id`) REFERENCES `users_table` (`User_Id`),
  CONSTRAINT `recommendations_ibfk_2` FOREIGN KEY (`Concern_Id`) REFERENCES `skin_concerns` (`Concern_Id`),
  CONSTRAINT `recommendations_ibfk_3` FOREIGN KEY (`Product_Id`) REFERENCES `products` (`Product_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recommendations`
--

LOCK TABLES `recommendations` WRITE;
/*!40000 ALTER TABLE `recommendations` DISABLE KEYS */;
INSERT INTO `recommendations` VALUES (1,1,1,1,'2025-01-11','Salicylic Acid helps reduce acne'),(2,2,2,2,'2025-01-13','Hyaluronic Acid improves hydration'),(3,3,3,3,'2025-01-15','Vitamin C improves skin brightness'),(4,4,4,5,'2025-01-17','Caffeine reduces dark circles'),(5,5,5,9,'2025-01-19','Niacinamide helps with pigmentation'),(6,6,1,6,'2025-01-21','Gentle cleanser helps acne control'),(7,7,2,4,'2025-01-23','Moisturizer improves dry skin'),(8,8,3,7,'2025-01-25','Vitamin C serum boosts glow'),(9,9,4,5,'2025-01-27','Eye cream reduces puffiness'),(10,10,5,9,'2025-01-29','Brightening serum reduces spots'),(11,11,1,1,'2025-02-01','Controls oil and acne'),(12,12,2,2,'2025-02-02','Improves skin hydration'),(13,13,3,3,'2025-02-03','Improves skin tone'),(14,14,4,5,'2025-02-04','Reduces under-eye darkness'),(15,15,5,9,'2025-02-05','Improves uneven skin tone'),(16,16,1,6,'2025-02-06','Acne-friendly cleanser'),(17,17,2,4,'2025-02-07','Restores moisture balance'),(18,18,3,7,'2025-02-08','Boosts radiance'),(19,19,4,5,'2025-02-09','Improves eye appearance'),(20,20,5,9,'2025-02-10','Reduces dark spots'),(21,21,1,1,'2025-02-11','Reduces acne breakouts'),(22,22,2,2,'2025-02-12','Locks skin moisture'),(23,23,3,3,'2025-02-13','Enhances skin glow'),(24,24,4,5,'2025-02-14','Reduces dark circles'),(25,25,5,9,'2025-02-15','Corrects pigmentation'),(26,26,1,6,'2025-02-16','Gentle acne control'),(27,27,2,4,'2025-02-17','Hydrating moisturizer'),(28,28,3,7,'2025-02-18','Brightens dull skin'),(29,29,4,5,'2025-02-19','Eye care solution'),(30,30,5,9,'2025-02-20','Improves skin clarity'),(31,31,1,1,'2025-03-01','Prevents acne'),(32,32,2,2,'2025-03-02','Improves moisture retention'),(33,33,3,3,'2025-03-03','Boosts collagen'),(34,34,4,5,'2025-03-04','Reduces eye fatigue'),(35,35,5,9,'2025-03-05','Brightening treatment'),(36,36,1,6,'2025-03-06','Controls acne'),(37,37,2,4,'2025-03-07','Nourishes dry skin'),(38,38,3,7,'2025-03-08','Improves glow'),(39,39,4,5,'2025-03-09','Eye rejuvenation'),(40,40,5,9,'2025-03-10','Even skin tone'),(41,41,1,1,'2025-03-11','Oil control'),(42,42,2,2,'2025-03-12','Hydration support'),(43,43,3,3,'2025-03-13','Radiance booster'),(44,44,4,5,'2025-03-14','Reduces under-eye stress'),(45,45,5,9,'2025-03-15','Pigmentation control'),(46,46,1,6,'2025-03-16','Acne prevention'),(47,47,2,4,'2025-03-17','Moisture repair'),(48,48,3,7,'2025-03-18','Glow enhancement'),(49,49,4,5,'2025-03-19','Dark circle treatment'),(50,50,5,9,'2025-03-20','Skin brightening'),(51,1,1,1,'2025-06-01','Salicylic Acid reduces acne'),(52,1,1,6,'2025-06-05','Gentle cleanser for acne control'),(53,1,1,17,'2025-06-10','Additional acne serum recommendation');
/*!40000 ALTER TABLE `recommendations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skin_analysis_results`
--

DROP TABLE IF EXISTS `skin_analysis_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skin_analysis_results` (
  `Analysis_Id` int NOT NULL AUTO_INCREMENT,
  `User_Id` int DEFAULT NULL,
  `Concern_Id` int DEFAULT NULL,
  `Improvement_Score` int DEFAULT NULL,
  `Analysis_Date` date DEFAULT NULL,
  PRIMARY KEY (`Analysis_Id`),
  KEY `User_Id` (`User_Id`),
  KEY `Concern_Id` (`Concern_Id`),
  CONSTRAINT `skin_analysis_results_ibfk_1` FOREIGN KEY (`User_Id`) REFERENCES `users_table` (`User_Id`),
  CONSTRAINT `skin_analysis_results_ibfk_2` FOREIGN KEY (`Concern_Id`) REFERENCES `skin_concerns` (`Concern_Id`),
  CONSTRAINT `skin_analysis_results_chk_1` CHECK ((`Improvement_Score` between -(5) and 10))
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skin_analysis_results`
--

LOCK TABLES `skin_analysis_results` WRITE;
/*!40000 ALTER TABLE `skin_analysis_results` DISABLE KEYS */;
INSERT INTO `skin_analysis_results` VALUES (1,1,1,4,'2025-01-10'),(2,2,2,2,'2025-01-12'),(3,3,3,5,'2025-01-14'),(4,4,4,-1,'2025-01-16'),(5,5,5,3,'2025-01-18'),(6,6,1,6,'2025-01-20'),(7,7,2,1,'2025-01-22'),(8,8,3,7,'2025-01-24'),(9,9,4,0,'2025-01-26'),(10,10,5,4,'2025-01-28'),(11,11,1,8,'2025-02-01'),(12,12,2,3,'2025-02-02'),(13,13,3,6,'2025-02-03'),(14,14,4,-2,'2025-02-04'),(15,15,5,5,'2025-02-05'),(16,16,1,7,'2025-02-06'),(17,17,2,4,'2025-02-07'),(18,18,3,9,'2025-02-08'),(19,19,4,1,'2025-02-09'),(20,20,5,6,'2025-02-10'),(21,21,1,5,'2025-02-11'),(22,22,2,2,'2025-02-12'),(23,23,3,8,'2025-02-13'),(24,24,4,-3,'2025-02-14'),(25,25,5,4,'2025-02-15'),(26,26,1,6,'2025-02-16'),(27,27,2,3,'2025-02-17'),(28,28,3,7,'2025-02-18'),(29,29,4,0,'2025-02-19'),(30,30,5,5,'2025-02-20'),(31,31,1,9,'2025-03-01'),(32,32,2,4,'2025-03-02'),(33,33,3,6,'2025-03-03'),(34,34,4,-1,'2025-03-04'),(35,35,5,7,'2025-03-05'),(36,36,1,8,'2025-03-06'),(37,37,2,5,'2025-03-07'),(38,38,3,9,'2025-03-08'),(39,39,4,2,'2025-03-09'),(40,40,5,6,'2025-03-10'),(41,41,1,7,'2025-03-11'),(42,42,2,3,'2025-03-12'),(43,43,3,8,'2025-03-13'),(44,44,4,-2,'2025-03-14'),(45,45,5,5,'2025-03-15'),(46,46,1,6,'2025-03-16'),(47,47,2,4,'2025-03-17'),(48,48,3,9,'2025-03-18'),(49,49,4,1,'2025-03-19'),(50,50,5,7,'2025-03-20');
/*!40000 ALTER TABLE `skin_analysis_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skin_concerns`
--

DROP TABLE IF EXISTS `skin_concerns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skin_concerns` (
  `Concern_Id` int NOT NULL AUTO_INCREMENT,
  `Concern_Name` varchar(50) NOT NULL,
  `Severity_Level` int DEFAULT NULL,
  PRIMARY KEY (`Concern_Id`),
  UNIQUE KEY `Concern_Name` (`Concern_Name`),
  CONSTRAINT `skin_concerns_chk_1` CHECK ((`Severity_Level` between 1 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skin_concerns`
--

LOCK TABLES `skin_concerns` WRITE;
/*!40000 ALTER TABLE `skin_concerns` DISABLE KEYS */;
INSERT INTO `skin_concerns` VALUES (1,'Acne / Pimples',4),(2,'Dark Spots / Marks',3),(3,'Acne Scars',4),(4,'Pigmentation',3),(5,'Dull Skin',2),(6,'Under Eye Dark Circles',2),(7,'Anti-Aging',3),(8,'Fine Lines',3),(9,'Sensitive Skin',4),(10,'Wrinkles',3),(11,'Melasma',4);
/*!40000 ALTER TABLE `skin_concerns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skin_profiles`
--

DROP TABLE IF EXISTS `skin_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skin_profiles` (
  `Profile_Id` int NOT NULL AUTO_INCREMENT,
  `User_Id` int DEFAULT NULL,
  `Skin_Type` enum('Oily','Dry','Combination','Normal','Sensitive') NOT NULL,
  `Sensitivity_Level` int DEFAULT NULL,
  `Hydration_Level` int DEFAULT NULL,
  PRIMARY KEY (`Profile_Id`),
  UNIQUE KEY `User_Id` (`User_Id`),
  CONSTRAINT `skin_profiles_ibfk_1` FOREIGN KEY (`User_Id`) REFERENCES `users_table` (`User_Id`) ON DELETE CASCADE,
  CONSTRAINT `skin_profiles_chk_1` CHECK ((`Sensitivity_Level` between 1 and 5)),
  CONSTRAINT `skin_profiles_chk_2` CHECK ((`Hydration_Level` between 1 and 100))
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skin_profiles`
--

LOCK TABLES `skin_profiles` WRITE;
/*!40000 ALTER TABLE `skin_profiles` DISABLE KEYS */;
INSERT INTO `skin_profiles` VALUES (1,1,'Oily',3,45),(2,2,'Dry',2,30),(3,3,'Combination',4,55),(4,4,'Oily',3,40),(5,5,'Sensitive',5,35),(6,6,'Dry',2,28),(7,7,'Normal',1,60),(8,8,'Combination',3,50),(9,9,'Sensitive',4,42),(10,10,'Oily',3,38),(11,11,'Normal',2,55),(12,12,'Dry',3,32),(13,13,'Sensitive',4,40),(14,14,'Oily',3,36),(15,15,'Combination',4,48),(16,16,'Dry',2,30),(17,17,'Sensitive',5,33),(18,18,'Oily',3,41),(19,19,'Normal',2,50),(20,20,'Combination',4,45),(21,21,'Oily',3,42),(22,22,'Dry',2,35),(23,23,'Sensitive',5,37),(24,24,'Normal',1,60),(25,25,'Combination',3,50),(26,26,'Oily',3,38),(27,27,'Sensitive',4,43),(28,28,'Dry',2,32),(29,29,'Normal',2,55),(30,30,'Combination',4,48),(31,31,'Oily',3,41),(32,32,'Dry',2,30),(33,33,'Sensitive',5,36),(34,34,'Normal',1,60),(35,35,'Combination',4,50),(36,36,'Oily',3,39),(37,37,'Sensitive',4,42),(38,38,'Dry',2,33),(39,39,'Normal',2,55),(40,40,'Combination',3,47),(41,41,'Oily',3,44),(42,42,'Sensitive',5,38),(43,43,'Normal',2,52),(44,44,'Combination',4,46),(45,45,'Oily',3,40),(46,46,'Dry',2,31),(47,47,'Sensitive',4,39),(48,48,'Normal',1,60),(49,49,'Combination',3,49),(50,50,'Oily',3,43);
/*!40000 ALTER TABLE `skin_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_skin_concerns`
--

DROP TABLE IF EXISTS `user_skin_concerns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_skin_concerns` (
  `User_Concern_Id` int NOT NULL AUTO_INCREMENT,
  `User_Id` int DEFAULT NULL,
  `Concern_Id` int DEFAULT NULL,
  `Detected_Date` date DEFAULT NULL,
  PRIMARY KEY (`User_Concern_Id`),
  KEY `User_Id` (`User_Id`),
  KEY `Concern_Id` (`Concern_Id`),
  CONSTRAINT `user_skin_concerns_ibfk_1` FOREIGN KEY (`User_Id`) REFERENCES `users_table` (`User_Id`) ON DELETE CASCADE,
  CONSTRAINT `user_skin_concerns_ibfk_2` FOREIGN KEY (`Concern_Id`) REFERENCES `skin_concerns` (`Concern_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_skin_concerns`
--

LOCK TABLES `user_skin_concerns` WRITE;
/*!40000 ALTER TABLE `user_skin_concerns` DISABLE KEYS */;
INSERT INTO `user_skin_concerns` VALUES (1,1,1,'2025-06-01'),(2,1,2,'2025-06-01'),(3,2,3,'2025-05-20'),(4,2,5,'2025-05-20'),(5,3,1,'2025-04-15'),(6,3,4,'2025-04-15'),(7,4,2,'2025-01-12'),(8,4,6,'2025-01-12'),(9,5,5,'2025-02-22'),(10,5,7,'2025-02-22'),(11,6,8,'2024-12-05'),(12,7,9,'2025-03-08'),(13,7,1,'2025-03-08'),(14,8,4,'2025-05-10'),(15,9,6,'2025-04-20'),(16,9,2,'2025-04-20'),(17,10,1,'2024-10-30'),(18,10,3,'2024-10-30'),(19,11,5,'2025-06-05'),(20,12,2,'2025-02-14'),(21,12,10,'2025-02-14'),(22,13,1,'2025-03-18'),(23,14,4,'2024-09-12'),(24,14,7,'2024-09-12'),(25,15,9,'2025-04-26'),(26,15,3,'2025-04-26'),(27,16,6,'2025-05-15'),(28,17,1,'2025-01-08'),(29,17,5,'2025-01-08'),(30,18,8,'2024-08-20'),(31,19,2,'2025-06-10'),(32,19,4,'2025-06-10'),(33,20,1,'2025-02-28'),(34,20,7,'2025-02-28'),(35,21,3,'2025-03-12'),(36,22,5,'2025-04-20'),(37,22,2,'2025-04-20'),(38,23,6,'2024-11-25'),(39,24,1,'2025-01-30'),(40,24,9,'2025-01-30'),(41,25,4,'2025-02-20'),(42,26,2,'2025-05-05'),(43,26,3,'2025-05-05'),(44,27,7,'2025-02-10'),(45,28,1,'2025-03-12'),(46,28,6,'2025-03-12'),(47,29,4,'2025-01-20'),(48,30,2,'2025-03-05'),(49,30,5,'2025-03-05'),(50,31,8,'2024-12-20'),(51,32,1,'2025-01-25'),(52,32,3,'2025-01-25'),(53,33,2,'2024-11-30'),(54,34,6,'2025-03-22'),(55,34,4,'2025-03-22'),(56,35,9,'2025-05-12'),(57,36,1,'2024-10-28'),(58,36,7,'2024-10-28'),(59,37,2,'2025-03-18'),(60,38,3,'2025-02-15'),(61,38,5,'2025-02-15'),(62,39,6,'2025-01-20'),(63,40,1,'2025-03-10'),(64,40,8,'2025-03-10'),(65,41,2,'2025-02-22'),(66,42,4,'2025-01-28'),(67,42,9,'2025-01-28'),(68,43,5,'2025-03-05'),(69,44,1,'2025-01-18'),(70,44,3,'2025-01-18'),(71,45,6,'2025-02-10'),(72,46,2,'2025-01-30'),(73,46,4,'2025-01-30'),(74,47,1,'2025-03-12'),(75,48,3,'2025-02-15'),(76,48,5,'2025-02-15'),(77,49,2,'2025-01-20'),(78,50,1,'2025-03-01'),(79,50,6,'2025-03-01');
/*!40000 ALTER TABLE `user_skin_concerns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_table`
--

DROP TABLE IF EXISTS `users_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_table` (
  `User_Id` int NOT NULL AUTO_INCREMENT,
  `Full_Name` varchar(50) NOT NULL,
  `Age` int DEFAULT NULL,
  `Gender` enum('Male','Female','Others') DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`User_Id`),
  CONSTRAINT `users_table_chk_1` CHECK ((`Age` between 15 and 80))
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_table`
--

LOCK TABLES `users_table` WRITE;
/*!40000 ALTER TABLE `users_table` DISABLE KEYS */;
INSERT INTO `users_table` VALUES (1,'Asha Reddy',22,'Female','Hyderabad','2025-06-15 03:45:00'),(2,'Ravi Kumar',28,'Male','Bangalore','2025-05-20 09:00:00'),(3,'Neha Sharma',24,'Female','Pune','2025-04-18 13:15:00'),(4,'Aman Verma',31,'Male','Delhi','2025-01-12 05:40:00'),(5,'Priya Singh',26,'Female','Lucknow','2025-02-22 10:50:00'),(6,'Suresh Naidu',35,'Male','Visakhapatnam','2024-12-05 04:35:00'),(7,'Kavya Nair',29,'Female','Kochi','2025-03-08 14:00:00'),(8,'Rahul Mehta',34,'Male','Ahmedabad','2024-11-20 03:20:00'),(9,'Anjali Patel',27,'Female','Surat','2025-01-25 10:10:00'),(10,'Vikram Rao',41,'Male','Chennai','2024-10-30 06:55:00'),(11,'Sneha Kulkarni',23,'Female','Nagpur','2025-06-05 12:25:00'),(12,'Arjun Malhotra',38,'Male','Gurgaon','2025-02-14 03:30:00'),(13,'Pooja Iyer',32,'Female','Coimbatore','2025-03-18 14:40:00'),(14,'Kiran Das',45,'Male','Kolkata','2024-09-12 08:05:00'),(15,'Meera Joshi',36,'Female','Indore','2025-04-26 11:15:00'),(16,'Vivek Sharma',30,'Male','Jaipur','2025-05-15 06:25:00'),(17,'Ritika Sen',28,'Female','Patna','2025-01-08 08:35:00'),(18,'Manish Jain',40,'Male','Bhopal','2024-08-20 03:50:00'),(19,'Shreya Gupta',25,'Female','Noida','2025-06-10 13:00:00'),(20,'Aditya Reddy',33,'Male','Hyderabad','2025-02-28 04:40:00'),(21,'Neelam Kapoor',27,'Female','Mumbai','2025-03-12 08:15:00'),(22,'Karthik Rao',29,'Male','Chennai','2024-12-18 10:20:00'),(23,'Rashmi Iyer',26,'Female','Bangalore','2025-04-20 11:05:00'),(24,'Vikash Kumar',37,'Male','Delhi','2024-11-25 04:10:00'),(25,'Aditi Mehta',31,'Female','Surat','2025-01-30 06:45:00'),(26,'Harsh Patel',34,'Male','Ahmedabad','2025-05-05 05:20:00'),(27,'Sonal Reddy',22,'Female','Hyderabad','2025-03-25 11:50:00'),(28,'Deepak Singh',39,'Male','Lucknow','2024-09-18 08:35:00'),(29,'Mira Nair',28,'Female','Kochi','2025-02-10 13:30:00'),(30,'Rohit Sharma',35,'Male','Jaipur','2024-12-02 03:00:00'),(31,'Tanya Joshi',24,'Female','Indore','2025-04-08 04:20:00'),(32,'Anil Kumar',42,'Male','Patna','2024-10-15 06:10:00'),(33,'Kavita Sen',33,'Female','Noida','2025-05-20 09:45:00'),(34,'Rakesh Das',36,'Male','Kolkata','2024-11-30 04:35:00'),(35,'Divya Iyer',26,'Female','Coimbatore','2025-03-18 11:15:00'),(36,'Sanjay Rao',38,'Male','Gurgaon','2025-01-12 03:55:00'),(37,'Priyanka Kapoor',29,'Female','Mumbai','2025-02-22 08:05:00'),(38,'Manoj Mehta',41,'Male','Ahmedabad','2024-09-25 04:45:00'),(39,'Rhea Sharma',27,'Female','Delhi','2025-06-02 13:20:00'),(40,'Kunal Reddy',30,'Male','Hyderabad','2025-03-10 06:10:00'),(41,'Ananya Gupta',24,'Female','Noida','2025-01-18 09:35:00'),(42,'Vikas Jain',35,'Male','Bhopal','2024-08-12 03:40:00'),(43,'Nisha Kapoor',28,'Female','Pune','2025-05-08 10:55:00'),(44,'Rahul Verma',33,'Male','Delhi','2025-04-12 07:20:00'),(45,'Sneha Iyer',25,'Female','Chennai','2025-03-05 11:45:00'),(46,'Arvind Sharma',37,'Male','Jaipur','2024-12-20 03:15:00'),(47,'Ritika Reddy',29,'Female','Hyderabad','2025-02-18 14:00:00'),(48,'Karan Mehta',32,'Male','Ahmedabad','2025-01-25 05:50:00'),(49,'Pallavi Joshi',26,'Female','Indore','2025-05-12 09:10:00'),(50,'Amit Kumar',40,'Male','Lucknow','2024-10-28 04:05:00'),(51,'Shilpa Nair',31,'Female','Kochi','2025-03-22 12:35:00');
/*!40000 ALTER TABLE `users_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-04 16:35:30
