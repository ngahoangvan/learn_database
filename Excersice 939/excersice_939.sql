CREATE DATABASE  IF NOT EXISTS `exercise_939` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `exercise_939`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: exercise_939
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `caycanh`
--

DROP TABLE IF EXISTS `caycanh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caycanh` (
  `MaCayCanh` varchar(45) NOT NULL,
  `MoTa` varchar(45) NOT NULL,
  `MaLoaiCC` varchar(45) NOT NULL,
  `DonGiaChoThue` int(11) NOT NULL,
  PRIMARY KEY (`MaCayCanh`),
  UNIQUE KEY `MaCayCanh_UNIQUE` (`MaCayCanh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caycanh`
--

LOCK TABLES `caycanh` WRITE;
/*!40000 ALTER TABLE `caycanh` DISABLE KEYS */;
INSERT INTO `caycanh` VALUES ('CC001','Hoa hong','LCC01 ',10000),('CC002','Mai tu quy','LCC01',20000),('CC003 ','Hoa anh dao','LCC01 ',60000),('CC004 ','Bonsai','LCC03',100000),('CC005 ','Hong tieu muoi','LC002 ',70000);
/*!40000 ALTER TABLE `caycanh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chitiethopdong`
--

DROP TABLE IF EXISTS `chitiethopdong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chitiethopdong` (
  `MaHopDong` varchar(45) NOT NULL,
  `MaCayCanh` varchar(45) NOT NULL,
  `SoLuong` int(11) NOT NULL,
  `MaLoaiDV` varchar(45) NOT NULL,
  `NgayBatDauChoThue` date NOT NULL,
  `NgayKetThucChoThue` date NOT NULL,
  PRIMARY KEY (`MaHopDong`,`MaCayCanh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitiethopdong`
--

LOCK TABLES `chitiethopdong` WRITE;
/*!40000 ALTER TABLE `chitiethopdong` DISABLE KEYS */;
INSERT INTO `chitiethopdong` VALUES ('HD0001','CC003',100,'L01','2016-07-03','2016-07-05'),('HD0002','CC001',150,'L01','2015-10-11','2015-10-22'),('HD0003','CC004',20,'L01','2017-12-23','2017-12-30'),('HD0004','CC002',5,'L01','2014-01-01','2014-01-10'),('HD0005','CC005',10,'L01','2016-10-16','2016-10-18'),('HD0006','CC001 ',300,'L01','2017-12-11','2017-12-22'),('HD0007','CC004',5,'L01','2016-02-01','2016-02-10'),('HD0008','CC001',15,'L01 ','2016-02-10','2016-02-12');
/*!40000 ALTER TABLE `chitiethopdong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hopdongchothue`
--

DROP TABLE IF EXISTS `hopdongchothue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hopdongchothue` (
  `MaHopDong` varchar(45) NOT NULL,
  `MaKH` varchar(45) NOT NULL,
  `SoTienDuocGiamGia` int(11) NOT NULL,
  `SoTienDatCoc` varchar(45) NOT NULL,
  `TrangThaiHopDong` enum('null','Chua bat dau','Dang cho thue','Da ket thuc') DEFAULT NULL,
  PRIMARY KEY (`MaHopDong`),
  UNIQUE KEY `MaHopDong_UNIQUE` (`MaHopDong`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hopdongchothue`
--

LOCK TABLES `hopdongchothue` WRITE;
/*!40000 ALTER TABLE `hopdongchothue` DISABLE KEYS */;
INSERT INTO `hopdongchothue` VALUES ('HD0001','KH0002',0,'1000000','Da ket thuc'),('HD0002 ','KH0002',0,'0','null'),('HD0003','KH0001',0,'0','Da ket thuc'),('HD0004','KH0005',0,'0','Dang cho thue'),('HD0005 ','KH0004 ',0,'0','Dang cho thue'),('HD0006 ','KH0004',0,'0','Chua bat dau'),('HD0007 ','KH0002',0,'0','Da ket thuc'),('HD0008 ','KH0004',0,'0','null');
/*!40000 ALTER TABLE `hopdongchothue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khachhang`
--

DROP TABLE IF EXISTS `khachhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `khachhang` (
  `MaKH` varchar(45) NOT NULL,
  `HoTenKH` varchar(45) NOT NULL,
  `DiaChiKH` varchar(45) NOT NULL,
  `SoDienThoaiKH` varchar(45) NOT NULL,
  PRIMARY KEY (`MaKH`),
  UNIQUE KEY `MaKH_UNIQUE` (`MaKH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khachhang`
--

LOCK TABLES `khachhang` WRITE;
/*!40000 ALTER TABLE `khachhang` DISABLE KEYS */;
INSERT INTO `khachhang` VALUES ('KH0001','Bui A','Lien Chieu','09012345'),('KH0002','Bui B','Thanh Khe','09012345'),('KH0003','Nguyen A','Lien Chieu','09112346'),('KH0004','Nguyen B','Thanh Khe','09012346'),('KH0005','Bui A','Hai Chau','09012347'),('KH0006','Nguyen B','Hai Chau','09012347');
/*!40000 ALTER TABLE `khachhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loaicaycanh`
--

DROP TABLE IF EXISTS `loaicaycanh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loaicaycanh` (
  `MaLoaiCC` varchar(45) NOT NULL,
  `MoTaLoaiCC` varchar(45) NOT NULL,
  PRIMARY KEY (`MaLoaiCC`),
  UNIQUE KEY `MaLoaiCC_UNIQUE` (`MaLoaiCC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loaicaycanh`
--

LOCK TABLES `loaicaycanh` WRITE;
/*!40000 ALTER TABLE `loaicaycanh` DISABLE KEYS */;
INSERT INTO `loaicaycanh` VALUES ('LCC01 ','Chung o phong khach'),('LCC02 ','Chung o cau thang'),('LCC03','Chung o ngoai san');
/*!40000 ALTER TABLE `loaicaycanh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loaidichvu`
--

DROP TABLE IF EXISTS `loaidichvu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loaidichvu` (
  `MaLoaiDV` varchar(45) NOT NULL,
  `MoTaLoaiDV` varchar(45) NOT NULL,
  PRIMARY KEY (`MaLoaiDV`),
  UNIQUE KEY `MaLoaiDV_UNIQUE` (`MaLoaiDV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loaidichvu`
--

LOCK TABLES `loaidichvu` WRITE;
/*!40000 ALTER TABLE `loaidichvu` DISABLE KEYS */;
INSERT INTO `loaidichvu` VALUES ('L01 ','Chung Tet'),('L02 ','Chung nha moi');
/*!40000 ALTER TABLE `loaidichvu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'exercise_939'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-21  9:54:19
