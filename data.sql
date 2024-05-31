-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (x86_64)
--
-- Host: 127.0.0.1    Database: exotiq_db
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `Cars`
--

DROP TABLE IF EXISTS `Cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cars` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price_daily` decimal(10,0) DEFAULT NULL,
  `price_monthly` decimal(10,0) DEFAULT NULL,
  `engine` int DEFAULT NULL,
  `transmission` varchar(255) DEFAULT NULL,
  `capacity` decimal(10,0) DEFAULT NULL,
  `fuel` int DEFAULT NULL,
  `img_uri` varchar(2083) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cars`
--

LOCK TABLES `Cars` WRITE;
/*!40000 ALTER TABLE `Cars` DISABLE KEYS */;
INSERT INTO `Cars` VALUES (1,'Toyota Corolla',100,2500,169,'Manual',13,1799,'/cars/2016ToyotaCorolla.png'),(2,'Mercedez Benz',200,3000,169,'Manual',13,1799,'/cars/2017Mercedes-Benz-Class.png'),(4,'Ferrari 458',500,10000,509,'Manual',15,2099,'/cars/Ferrari458.png'),(5,'Koenisegg Agera R',700,25000,609,'Manual',16,2099,'/cars/KoenigseggAgeraR1.png'),(6,'Toyota Fortuner',300,2500,169,'Manual',13,1799,'/cars/Toyota-Fortuner.png'),(37,'Peugeot',202,2000,200,'Manual',20,30,'/cars/annie-spratt-6a3nqQ1YwBw-unsplash.jpg');
/*!40000 ALTER TABLE `Cars` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-31  8:41:16

--Stored Procedure

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_car_add_or_edit`(
IN _id INT,
IN _name VARCHAR(255),
IN _price_daily DECIMAL,
IN _price_monthly DECIMAL,
IN _engine INT,
IN _transmission VARCHAR(255),
IN _capacity DECIMAL,
IN _fuel INT,
IN _img_uri VARCHAR(2083)

)
BEGIN
	IF _id = 0 THEN
		INSERT INTO cars(name,price_daily,price_monthly,engine,transmission, capacity,fuel, img_uri)
		VALUES (_name,_price_daily,_price_monthly,_engine,_transmission, _capacity, _fuel, _img_uri);
        
	ELSE
		UPDATE cars
        SET name = _name,
		price_daily = _price_daily,
        price_monthly = _price_monthly,
        engine = _engine,
        transmission = _transmission,
        capacity = _capacity,
        fuel = _fuel,
        img_uri = _img_uri
        
        
        WHERE id = _id;
	END IF;
    
    SELECT ROW_COUNT() AS 'affectedRows';
END