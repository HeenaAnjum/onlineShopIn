-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: onlineshopping
-- ------------------------------------------------------
-- Server version	5.7.33-log

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `address_line_one` varchar(100) DEFAULT NULL,
  `address_line_two` varchar(100) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `is_billing` tinyint(1) DEFAULT NULL,
  `is_shipping` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_address_user_id` (`user_id`),
  CONSTRAINT `fk_address_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_detail` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,4,'102 Sabarmati Society, Mahatma Gandhi Road','Near Salt Lake, Gandhi Nagar','Ahmedabad','Gujarat','India','111111',1,0),(2,5,'persistent','systems','bangalore','karnataka','india','560103',1,0),(3,5,'bjhdskjfhn','dsfsdf','ddsfd','karnataka','india','111111',0,1),(4,11,'sambhram college road','hj','bangalore','karnataka','India','560097',1,0);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `grand_total` decimal(10,2) DEFAULT NULL,
  `cart_lines` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cart_user_id` (`user_id`),
  CONSTRAINT `fk_cart_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_detail` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,4,0.00,0),(2,5,0.00,0),(3,11,0.00,0);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_line`
--

DROP TABLE IF EXISTS `cart_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_id` int(11) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_count` int(11) DEFAULT NULL,
  `buying_price` decimal(10,2) DEFAULT NULL,
  `is_available` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cartline_product_id` (`product_id`),
  CONSTRAINT `fk_cartline_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_line`
--

LOCK TABLES `cart_line` WRITE;
/*!40000 ALTER TABLE `cart_line` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image_url` varchar(50) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Laptop','This is description for Laptop category!','CAT_1.png',1),(2,'Television','This is description for Television category!','CAT_2.png',1),(3,'Mobile','This is description for Mobile category!','CAT_3.png',1),(4,'Refrigerator','Shop from wide range of Single, Double Door & Multi Door Fridge at shopIn\r\n',NULL,1),(5,'Earphone','wireless earphone',NULL,1);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `order_total` decimal(10,2) DEFAULT NULL,
  `order_count` int(11) DEFAULT NULL,
  `shipping_id` int(11) DEFAULT NULL,
  `billing_id` int(11) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_detail_user_id` (`user_id`),
  KEY `fk_order_detail_shipping_id` (`shipping_id`),
  KEY `fk_order_detail_billing_id` (`billing_id`),
  CONSTRAINT `fk_order_detail_billing_id` FOREIGN KEY (`billing_id`) REFERENCES `address` (`id`),
  CONSTRAINT `fk_order_detail_shipping_id` FOREIGN KEY (`shipping_id`) REFERENCES `address` (`id`),
  CONSTRAINT `fk_order_detail_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_detail` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (1,5,18000.00,1,3,2,'2021-03-15');
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_count` int(11) DEFAULT NULL,
  `buying_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_item_product_id` (`product_id`),
  KEY `fk_order_item_order_id` (`order_id`),
  CONSTRAINT `fk_order_item_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_detail` (`id`),
  CONSTRAINT `fk_order_item_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (1,1,18000.00,1,1,18000.00);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `purchases` int(11) DEFAULT '0',
  `views` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_product_category_id` (`category_id`),
  KEY `fk_product_supplier_id` (`supplier_id`),
  CONSTRAINT `fk_product_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `fk_product_supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `user_detail` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'PRDABC123DEFX','iPhone 12','apple','This is one of the best phone available in the market right now!',78000.00,4,1,3,2,0,1),(2,'PRDDEF123DEFX','Samsung s10','samsung','A smart phone by samsung!',90000.00,2,1,3,3,0,0),(3,'PRDPQR123WGTX','Google Pixel','google','This is one of the best android smart phone available in the market right now!',57000.00,5,0,3,2,0,1),(4,'PRDMNO123PQRX',' Macbook Pro','apple','This is one of the best laptops available in the market right now!',100000.00,3,1,1,2,0,0),(5,'PRDABCXYZDEFX','Dell Latitude E6510','dell','This is one of the best laptop series from dell that can be used!',48000.00,5,1,1,3,0,0),(6,'PRDED7E9B529C','LED SMART TV','SAMSUNG','SAMSUNG 125 cm (50 inch) Ultra HD (4K) LED Smart TV',47990.00,5,1,2,1,0,0),(7,'PRD78EA6556FE','LG 260 L 3 Star ','LG','LG Refrigerator is a New Smart Inverter Compressor ',39999.00,2,1,4,1,0,0),(8,'PRDC0D81CDA6F','Oneplus 8 pro','Oneplus','OnePlus 8 Pro (Glacial Green 8GB RAM+128GB Storage)',55000.00,5,1,3,1,0,0),(9,'PRDFD0C4364F6','iphone 11','Iphone','iphone 11 ',51000.00,10,1,3,1,0,0);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_detail`
--

DROP TABLE IF EXISTS `user_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contact_number` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_detail`
--

LOCK TABLES `user_detail` WRITE;
/*!40000 ALTER TABLE `user_detail` DISABLE KEYS */;
INSERT INTO `user_detail` VALUES (1,'Virat','Kohli','ADMIN',1,'$2a$06$ORtBskA2g5Wg0HDgRE5ZsOQNDHUZSdpJqJ2.PGXv0mKyEvLnKP7SW','vk@gmail.com','8888888888'),(2,'Ravindra','Jadeja','SUPPLIER',1,'$2a$06$bzYMivkRjSxTK2LPD8W4te6jjJa795OwJR1Of5n95myFsu3hgUnm6','rj@gmail.com','9999999999'),(3,'Ravichandra','Ashwin','SUPPLIER',1,'$2a$06$i1dLNlXj2uY.UBIb9kUcAOxCigGHUZRKBtpRlmNtL5xtgD6bcVNOK','ra@gmail.com','7777777777'),(4,'Khozema','Nullwala','USER',1,'$2a$06$4mvvyO0h7vnUiKV57IW3oudNEaKPpH1xVSdbie1k6Ni2jfjwwminq','kn@gmail.com','7777777777'),(5,'Saurabh','Kumar','ADMIN',1,'$2a$10$5f0SZ1mnhtN5DI5LOLG3d..iowZKpgRrmGg25m/qBZ4Q.9RzOeZpe','saurabh7.sk21@gmail.com','7974689632'),(11,'ankit','sah','USER',1,'$2a$10$smEe.ftS2ynEeTAcyV39ZeKLfDsDiht/1Yi/AvnfkkU7nZHWoGGVK','ankit@gmail.com','7979858545');
/*!40000 ALTER TABLE `user_detail` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-19 16:09:16
