-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce_cart
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `o_id` int NOT NULL AUTO_INCREMENT,
  `p_id` int NOT NULL,
  `u_id` int NOT NULL,
  `o_quantity` int NOT NULL,
  `o_date` varchar(450) NOT NULL,
  PRIMARY KEY (`o_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (64,1,7,1,'2023-06-17'),(65,2,7,1,'2023-06-17'),(66,3,7,1,'2023-06-17'),(67,8,7,1,'2023-06-17'),(68,7,7,1,'2023-06-17'),(69,7,7,3,'2023-06-17'),(70,5,7,2,'2023-06-17');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(450) NOT NULL,
  `category` varchar(450) NOT NULL,
  `price` double NOT NULL,
  `stock` int NOT NULL,
  `image` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Eternal Archvile','Figur',115,93,'https://cdn.shopify.com/s/files/1/3045/2256/products/GRID-1_f3d6123d-640b-4b33-be17-3fae35810e3e_230x.jpg?v=1629473604'),(2,'Eternal Revenant','Figur',15,98,'https://cdn.shopify.com/s/files/1/3045/2256/products/GRID-1_b3f384fb-c859-4723-8f10-f87233f9b8d2_230x.jpg?v=1625537368'),(3,'Eternal Pinky','Figur',15,99,'https://cdn.shopify.com/s/files/1/3045/2256/products/GRID-1_aa0685ee-40d8-46cb-8ff3-3ef7d6e47198_230x.jpg?v=1667418307'),(4,'Doom Sweats','Giyim',49,100,'https://cdn.shopify.com/s/files/1/3045/2256/products/GRID-1_79390c1e-4e01-442d-a06a-b226f578861d_230x.jpg?v=1666892989'),(5,'Doom Tisort','Giyim',27,98,'https://cdn.shopify.com/s/files/1/3045/2256/products/GRID-1_00dfc411-4f98-402b-8b38-524cc733377a_230x.jpg?v=1682356570'),(6,'Doom Hoodie','Giyim',70,100,'https://cdn.shopify.com/s/files/1/3045/2256/products/GRID-1_70aa72fd-0313-4bb9-89eb-9448f32614ad_230x.jpg?v=1666378927'),(7,'Doom Kupa','Aksesuar',20,96,'https://cdn.shopify.com/s/files/1/3045/2256/products/DOOM_Slayer_Tankard_Glass_Stein_Doom_Side_230x.jpg?v=1549054659'),(8,'Doom Cuzdan','Aksesuar',60,99,'https://cdn.shopify.com/s/files/1/3045/2256/products/GRID-1_5895c4ef-2eca-4e17-994c-24b5a901868e_230x.jpg?v=1663900833');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (7,'asd','asd@gmail.com','asd'),(8,'Omer Bilgin','omerbilgin@bil.omu.edu.tr','123'),(9,'Dogukan Kalender','dogukankalender@bil.omu.edu.tr','123');
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

-- Dump completed on 2023-09-01  0:28:22
