-- MySQL dump 10.13  Distrib 9.2.0, for macos13.7 (arm64)
--
-- Host: localhost    Database: ORDER_MANAGMENT
-- ------------------------------------------------------
-- Server version	9.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `address_line_1` varchar(100) NOT NULL,
  `address_line_2` varchar(100) DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  `state` varchar(50) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `zip_code` varchar(20) NOT NULL,
  `customer_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhrpf5e8dwasvdc5cticysrt2k` (`customer_id`),
  CONSTRAINT `FKhrpf5e8dwasvdc5cticysrt2k` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `description` text,
  `image_url` varchar(255) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKt8o6pivur7nn124jehx7cygw5` (`name`),
  UNIQUE KEY `UKoul14ho7bctbefv8jywp5v3i2` (`slug`),
  KEY `FKsaok720gsu4u2wrgbk10b5n8d` (`parent_id`),
  CONSTRAINT `FKsaok720gsu4u2wrgbk10b5n8d` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKeuat1oase6eqv195jvb71a93s` (`user_id`),
  CONSTRAINT `FKrh1g1a20omjmn6kurd35o3eit` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inventory_items`
--

DROP TABLE IF EXISTS `inventory_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `last_restocked` datetime(6) DEFAULT NULL,
  `location_code` varchar(255) DEFAULT NULL,
  `quantity` int NOT NULL,
  `reserved_quantity` int DEFAULT NULL,
  `status` enum('DISCONTINUED','IN_STOCK','LOW_STOCK','OUT_OF_STOCK') DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `warehouse_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKr4tf69c9a5srya6vp07eoe9y5` (`product_id`,`warehouse_id`),
  KEY `FKqq1baol3lk2v7ka2ob578l31h` (`warehouse_id`),
  CONSTRAINT `FK9qhblf3mc4r22jajlv4w6sstt` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FKqq1baol3lk2v7ka2ob578l31h` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `discount` decimal(38,2) DEFAULT NULL,
  `product_image_url` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `quantity` int NOT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `subtotal` decimal(38,2) NOT NULL,
  `unit_price` decimal(38,2) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `order_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbioxgbv59vetrxe0ejfubep1w` (`order_id`),
  KEY `FKocimc7dtr037rh4ls4l95nlfi` (`product_id`),
  CONSTRAINT `FKbioxgbv59vetrxe0ejfubep1w` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `FKocimc7dtr037rh4ls4l95nlfi` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `order_date` datetime(6) DEFAULT NULL,
  `order_number` varchar(255) DEFAULT NULL,
  `payment_method` enum('BANK_TRANSFER','CASH_ON_DELIVERY','CREDIT_CARD','DEBIT_CARD','GIFT_CARD','PAYPAL','STORE_CREDIT') DEFAULT NULL,
  `payment_status` enum('AUTHORIZED','CANCELLED','FAILED','PAID','PARTIALLY_REFUNDED','PENDING','REFUNDED') DEFAULT NULL,
  `shipping_cost` decimal(38,2) DEFAULT NULL,
  `status` enum('CANCELLED','DELIVERED','ON_HOLD','PENDING','PROCESSING','REFUNDED','SHIPPED') DEFAULT NULL,
  `subtotal` decimal(38,2) NOT NULL,
  `total_amount` decimal(38,2) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `customer_id` int unsigned NOT NULL,
  `shipping_address_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKnthkiu7pgmnqnu86i2jyoe2v7` (`order_number`),
  KEY `FKpxtb8awmi0dk6smoh2vp1litg` (`customer_id`),
  KEY `FKmk6q95x8ffidq82wlqjaq7sqc` (`shipping_address_id`),
  CONSTRAINT `FKmk6q95x8ffidq82wlqjaq7sqc` FOREIGN KEY (`shipping_address_id`) REFERENCES `addresses` (`id`),
  CONSTRAINT `FKpxtb8awmi0dk6smoh2vp1litg` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payment_transactions`
--

DROP TABLE IF EXISTS `payment_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_transactions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `amount` decimal(38,2) NOT NULL,
  `billing_name` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `gateway` varchar(255) DEFAULT NULL,
  `gateway_response` varchar(255) DEFAULT NULL,
  `last_four_digits` varchar(255) DEFAULT NULL,
  `payment_method` enum('BANK_TRANSFER','CASH_ON_DELIVERY','CREDIT_CARD','DEBIT_CARD','GIFT_CARD','PAYPAL','STORE_CREDIT') DEFAULT NULL,
  `reference_transaction_id` varchar(255) DEFAULT NULL,
  `status` enum('AUTHORIZED','CAPTURED','FAILED','PARTIALLY_REFUNDED','PENDING','REFUNDED','VOIDED') DEFAULT NULL,
  `transaction_date` datetime(6) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `order_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKlsp8jh693lih2txq7dl4bdnpx` (`transaction_id`),
  KEY `FKnsous9qyrjv5ss8que6o6617` (`order_id`),
  CONSTRAINT `FKnsous9qyrjv5ss8que6o6617` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_tags`
--

DROP TABLE IF EXISTS `product_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_tags` (
  `product_id` int unsigned NOT NULL,
  `tag_id` int unsigned NOT NULL,
  KEY `FKpur2885qb9ae6fiquu77tcv1o` (`tag_id`),
  KEY `FK5rk6s19k3risy7q7wqdr41uss` (`product_id`),
  CONSTRAINT `FK5rk6s19k3risy7q7wqdr41uss` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FKpur2885qb9ae6fiquu77tcv1o` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `description` text,
  `height` double DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `length` double DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(38,2) NOT NULL,
  `sku` varchar(50) NOT NULL,
  `status` enum('ACTIVE','DISCONTINUED','INACTIVE','OUT_OF_STOCK') DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `width` double DEFAULT NULL,
  `category_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKfhmd06dsmj6k0n90swsh8ie9g` (`sku`),
  KEY `FKog2rp4qthbtt2lfyhfo32lsw9` (`category_id`),
  CONSTRAINT `FKog2rp4qthbtt2lfyhfo32lsw9` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shipments`
--

DROP TABLE IF EXISTS `shipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `actual_delivery_date` datetime(6) DEFAULT NULL,
  `carrier` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `delivery_notes` varchar(255) DEFAULT NULL,
  `estimated_delivery_date` datetime(6) DEFAULT NULL,
  `shipped_date` datetime(6) DEFAULT NULL,
  `shipping_label` varchar(255) DEFAULT NULL,
  `status` enum('DELIVERED','FAILED_DELIVERY','IN_TRANSIT','OUT_FOR_DELIVERY','PACKED','PENDING','PROCESSING','RETURNED','SHIPPED') DEFAULT NULL,
  `tracking_number` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `order_id` int unsigned NOT NULL,
  `warehouse_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKhrhy2yghr8dampg1jtecuekvp` (`order_id`),
  UNIQUE KEY `UK2980t5kjkkrwnjhwvit59x61k` (`tracking_number`),
  KEY `FK93kqi7kqar4tgmu0h1apoqdn1` (`warehouse_id`),
  CONSTRAINT `FK93kqi7kqar4tgmu0h1apoqdn1` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`),
  CONSTRAINT `FKrnt4wht95lxxplspltrg9681s` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKt48xdq560gs3gap9g7jg36kgc` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `user_id` int unsigned NOT NULL,
  `role` enum('ROLE_ADMIN','ROLE_CUSTOMER','ROLE_SALES','ROLE_SUPPORT','ROLE_WAREHOUSE') DEFAULT NULL,
  KEY `FKhfh9dx7w3ubf1co1vdev94g3f` (`user_id`),
  CONSTRAINT `FKhfh9dx7w3ubf1co1vdev94g3f` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `password` varchar(120) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`),
  UNIQUE KEY `UKr43af9ap4edm43mmtq01oddj6` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `warehouses`
--

DROP TABLE IF EXISTS `warehouses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) DEFAULT NULL,
  `address_line_1` varchar(100) NOT NULL,
  `address_line_2` varchar(100) DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `state` varchar(50) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `zip_code` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-14 11:28:46
