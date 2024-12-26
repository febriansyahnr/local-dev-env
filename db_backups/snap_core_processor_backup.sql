-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: snap_core_processor
-- ------------------------------------------------------
-- Server version	9.1.0

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
-- Table structure for table `acquirer`
--

DROP TABLE IF EXISTS `acquirer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acquirer` (
  `uuid` varchar(40) NOT NULL,
  `bank_code` varchar(5) NOT NULL COMMENT '013, 014 etc',
  `alias` varchar(100) NOT NULL COMMENT 'PERMATA,BRI,MANDIRI, etc',
  `name` varchar(100) NOT NULL COMMENT 'e.g Bank Permata',
  `account_number` varchar(50) NOT NULL COMMENT 'sourceAccountNo',
  `account_name` varchar(100) NOT NULL COMMENT 'sourceAccountName',
  `account_identifier` varchar(100) DEFAULT NULL COMMENT 'nomor ktp',
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `acquirer_unique_code` (`bank_code`),
  UNIQUE KEY `acquirer_unique_alias` (`alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acquirer`
--

/*!40000 ALTER TABLE `acquirer` DISABLE KEYS */;
/*!40000 ALTER TABLE `acquirer` ENABLE KEYS */;

--
-- Table structure for table `activity_log`
--

DROP TABLE IF EXISTS `activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_log` (
  `uuid` varchar(36) NOT NULL,
  `identifier` varchar(100) NOT NULL,
  `tag` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `info` json DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_log`
--

/*!40000 ALTER TABLE `activity_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_log` ENABLE KEYS */;

--
-- Table structure for table `bank`
--

DROP TABLE IF EXISTS `bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank` (
  `bic` varchar(20) NOT NULL COMMENT 'bank indonesia code',
  `code` varchar(5) NOT NULL COMMENT 'bank code',
  `name` varchar(100) NOT NULL COMMENT 'bank name',
  `rtgs_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`bic`),
  KEY `bank_code_IDX` (`code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank`
--

/*!40000 ALTER TABLE `bank` DISABLE KEYS */;
INSERT INTO `bank` VALUES ('ABALIDBS','129','PT. BANK PEMBANGUNAN DAERAH BALI','1290013'),('AGTBIDJA','494','PT. BANK RAKYAT INDONESIA AGRONIAGA, TBK','4940014'),('ANZBIDJX','061','PT. BANK ANZ INDONESIA','610306'),('ARFAIDJ1','517','PT. BANK PANIN DUBAI SYARIAH','5170016'),('ARTGIDJA','037','PT. BANK ARTHA GRAHA INTERNASIONAL, TBK','370028'),('ATOSIDJ1','542','PT. BANK JAGO Tbk','5420025'),('AWANIDJA','167','PT. BANK QNB INDONESIA,TBK','1670015'),('BBAIIDJA','076','PT. BANK BUMI ARTA','760010'),('BBBAIDJA','013','PT. BANK PERMATA,TBK','-'),('BBIJIDJA','023','PT. BANK UOB INDONESIA','230016'),('BBUKIDJA','441','PT. BANK BUKOPIN Tbk.','4410010'),('BCIAIDJA','054','PT. BANK CAPITAL INDONESIA','540308'),('BDINIDJA','011','PT. BANK DANAMON INDONESIA Tbk.','0119920'),('BDIPIDJ1','523','PT. BANK SAHABAT SAMPOERNA','5230011'),('BDKIIDJ1','111','PT. BANK DKI','1119916'),('BICNIDJA','950','PT. BANK COMMONWEALTH','9500307'),('BIDXIDJA','555','BANK INDEX SELINDO','9500307'),('BKCHIDJA','069','BANK OF CHINA (HONG KONG) LIMITED','690300'),('BKKBIDJA','040','BANGKOK BANK PUBLIC CO.LTD','-'),('BMRIIDJA','008','PT. BANK MANDIRI (PERSERO) TBK','80017'),('BMSEIDJA','548','PT. BANK MULTI ARTA SENTOSA','5480010'),('BNIAIDJA','022','PT. BANK CIMB NIAGA TBK','229920'),('BNINIDJA','009','PT. BANK NEGARA INDONESIA (PERSERO)','90010'),('BNPAIDJA','057','PT. BANK BNP PARIBAS INDONESIA','570307'),('BOFAID2X','033','BANK OF AMERICA NA','330301'),('BOTKIDJX','042','MUFG BANK, LTD (BTMU)','420305'),('BPIAIDJA','047','PT. BANK RESONA PERDANIA','470300'),('BRINIDJA','002','PT. BANK RAKYAT INDONESIA (PERSERO)','20307'),('BSDRIDJA','212','PT. BANK WOORI SAUDARA INDONESIA 1906,TBK','2120001'),('BSMDIDJA','451','PT. BANK SYARIAH MANDIRI Tbk.','-'),('BSSPIDSP','120','PT. BPD SUMSEL DAN BABEL','1209923'),('BTANIDJA','200','PT. BANK TABUNGAN NEGARA (PERSERO)','2009928'),('BUMIIDJA','485','PT. BANK MNC INTERNASIONAL, TBK','4850010'),('BUSTIDJ1','459','PT. BANK BISNIS INTERNASIONAL','-'),('BUTGIDJ1','506','PT. BANK MEGA SYARIAH','5060016'),('CENAIDJA','014','PT. BANK CENTRAL ASIA Tbk.','140397'),('CENAIDJAO','xxx','Mock','0000000'),('CHASIDJX','032','KC JPMORGAN CHASE BANK, N.A','320308'),('CICTIDJA','095','PT. BANK JTRUST INDONESIA, TBK','950011'),('CITIIDJX','031','CITIBANK, NA','310305'),('CTCBIDJA','949','PT. BANK CTBC INDONESIA','9490307'),('DBSBIDJA','046','PT. BANK DBS INDONESIA','460307'),('DEUTIDJA','067','DEUTSCHE BANK AG.','670304'),('DJARIDJ1','422','PT. BANK SYARIAH INDONESIA','4510017'),('FAMAIDJ1','562','PT. BANK FAMA INTERNATIONAL','5620016'),('GNESIDJA','161','PT. BANK GANESHA','1610017'),('HNBNIDJA','484','PT. BANK KEB HANA INDONESIA','4840017'),('HRDAIDJ1','567','PT. ALLO BANK INDONESIA','5670011'),('HSBCIDJA','087','PT. BANK HSBC INDONESIA','870010'),('IAPTIDJA','513','PT. BANK INA PERDANA','5130014'),('IBBKIDJA','016','PT. BANK MAYBANK INDONESIA Tbk.','169925'),('IBKOIDJA','945','PT. BANK IBK INDONESIA','9450305'),('ICBKIDJA','164','PT. BANK ICBC INDONESIA','1640061'),('IDMOIDJ1','498','PT. BANK SBI INDONESIA','4980016'),('INDOIDJA','001','BANK INDONESIA','-'),('JSABIDJ1','472','PT. BANK JASA JAKARTA BANK','4720014'),('KSEBIDJ1','535','PT. BANK SEABANK INDONESIA','5350014'),('LFIBIDJ1','503','PT. BANK NATIONALNOBU','5030017'),('LMANIDJ1','526','PT. BANK OKE INDONESIA','5260010'),('LOMAIDJ1','531','PT. BANK AMAR INDONESIA','5310012'),('MASDIDJ1','157','PT. BANK MASPION','1570018'),('MAYAIDJA','097','PT. BANK MAYAPADA Tbk.','970017'),('MAYOIDJA','553','PT. BANK MAYORA','5530012'),('MCORIDJA','036','PT. BANK CHINA CONSTRUCTION BANK INDONESIA, TBK','360012'),('MEDHIDS1','151','PT. BANK MESTIKA DHARMA','1510010'),('MEEKIDJ1','152','PT. BANK SHINHAN INDONESIA','1520013'),('MEGAIDJA','426','PT. BANK MEGA Tbk.','4260121'),('MHCCIDJA','048','PT. BANK MIZUHO INDONESIA','480303'),('MUABIDJA','147','PT. BANK MUAMALAT INDONESIA','1470011'),('NETBIDJA','947','PT. BANK ALADIN SYARIAH','9470302'),('NISPIDJA','028','PT. BANK OCBC NISP, Tbk.','0289928'),('PDBBIDJ1','137','PT. BANK PEMBANGUNAN DAERAH BANTEN','1370014'),('PDBKIDJ1','133','PT. BPD BENGKULU','1330012'),('PDIJIDJ1','132','PT. BANK PEMBANGUNAN DAERAH PAPUA','1320019'),('PDJBIDJA','110','PT. BANK PEMBANGUNAN DAERAH JABAR DAN BANTEN','-'),('PDJGIDJ1','113','PT. BANK PEMBANGUNAN DAERAH JAWA TENGAH','1139938'),('PDJMIDJ1','115','PT. BANK PEMBANGUNAN DAERAH JAMBI','-'),('PDJTIDJ1','114','PT. BANK PEMBANGUNAN DAERAH JATIM','1149928'),('PDKBIDJ1','123','PT. BANK PEMBANGUNAN DAERAH KALBAR','1239922S'),('PDKGIDJ1','125','PT. BPD KALIMANTAN TENGAH','1250011'),('PDKSIDJ1','122','PT. BANK PEMBANGUNAN DAERAH KALSEL','1229929'),('PDKTIDJ1','124','PT. BANK PEMBANGUNAN DAERAH KALTIM DAN KALTARA','1249925'),('PDLPIDJ1','121','PT. BANK PEMBANGUNAN DAERAH LAMPUNG','1210051'),('PDMLIDJ1','131','PT. BANK PEMBANGUNAN DAERAH MALUKU','1310016'),('PDNBIDJ1','128','PT. BANK PEMBANGUNAN DAERAH NTB','-'),('PDNTIDJ1','130','PT. BANK PEMBANGUNAN DAERAH NTT','1300013'),('PDRIIDJA','119','PT. BANK PEMBANGUNAN DAERAH RIAU KEPRI','1190016'),('PDSBIDJ1','118','PT. BANK PEMBANGUNAN DAERAH SUMATERA BARAT','-'),('PDSUIDJ1','117','PT. BANK PEMBANGUNAN DAERAH SUMUT','1179927'),('PDWGIDJ1','134','PT. BPD SULAWESI TENGAH','1340015'),('PDWRIDJ1','135','PT. BPD SULAWESI TENGGARA','1350018'),('PDWSIDJ1','126','PT. BANK SULSELBAR','-'),('PDWUIDJ1','127','PT. BANK PEMBANGUNAN DAERAH SULUT','1270017'),('PDYKIDJ1','112','PT. BANK PEMBANGUNAN DAERAH DIY','1129922'),('PINBIDJA','019','PT. PANIN BANK Tbk.','190017'),('PMASIDJ1','520','PT. PRIMA MASTER','5200012'),('PUBAIDJ1','547','PT. BANK BTPN SYARIAH','5470017'),('RABOIDJA','089','PT. BANK INTERIM INDONESIA','890016'),('ROYBIDJ1','501','PT. BANK DIGITAL BCA','5010011'),('SBJKIDJA','153','PT. BANK SINARMAS','-'),('SCBLIDJX','050','STANDARD CHARTERED','500306'),('SDOBIDJ1','521','PT. BANK SYARIAH BUKOPIN','5210031'),('SIHBIDJ1','564','PT. BANK MANDIRI TASPEN','5640012'),('SUNIIDJA','213','PT. BANK TABUNGAN PENSIUNAN NASIONAL','2130101'),('SWAGIDJ1','405','PT. BANK VICTORIA SYARIAH','4050072'),('SWBAIDJ1','146','PT. BANK OF INDIA INDONESIA, TBK','1460047'),('SYACIDJ1','116','PT. BANK ACEH SYARIAH','1160017'),('SYBBIDJ1','013','PT. BANK PERMATA,TBK UNIT USAHA SYARIAH','-'),('SYBDIDJ1','011','PT. BANK DANAMON INDONESIA UNIT USAHA SYARIAH','0119920'),('SYBKIDJ1','016','PT. BANK MAYBANK INDONESIA Tbk. UNIT USAHA SYARIAH','169925'),('SYBTIDJ1','200','PT. BANK TABUNGAN NEGARA (PERSERO) UNIT USAHA SYAR','2009928'),('SYCAIDJ1','536','PT. BANK BCA SYARIAH','5360017'),('SYDKIDJ1','111','PT. BANK DKI UNIT USAHA SYARIAH','1119916'),('SYJBIDJ1','425','PT. BANK JABAR BANTEN SYARIAH','-'),('SYJGIDJ1','113','PT. BANK PEMBANGUNAN DAERAH JATENG UNIT USAHA SYAR','1139938'),('SYJMIDJ1','115','PT. BANK PEMBANGUNAN DAERAH JAMBI UUS','-'),('SYJTIDJ1','114','PT. BANK PEMBANGUNAN DAERAH JATIM - UNIT USAHA SYAR','1149928'),('SYKBIDJ1','123','PT. BANK PEMBANGUNAN DAERAH KALBAR UUS','1239922S'),('SYKSIDJ1','122','PT. BANK PEMBANGUNAN DAERAH KALSEL - UNIT USAHA SYARIAH','1229929'),('SYKTIDJ1','124','PT. BANK PEMBANGUNAN DAERAH KALTIM DAN KALTARA-UNIT SYARIAH','1249925'),('SYNAIDJ1','022','PT. BANK CIMB NIAGA TBK - UNIT USAHA SYARIAH','229920'),('SYNIIDJ1','427','PT BANK BNI SYARIAH','-'),('SYONIDJ1','028','PT. BANK OCBC NISP TBK - UNIT USAHA SYARIAH','0289928'),('SYSBIDJ1','118','PT. BANK NAGARI - UNIT USAHA SYARIAH','-'),('SYSSIDJ1','120','PT. BPD SUMSEL DAN BABEL UNIT USAHA SYARIAH','1209923'),('SYSUIDJ1','117','PT. BANK PEMBANGUNAN DAERAH SUMUT UUS','1179927'),('SYTBIDJ1','153','PT. BANK SINARMAS UNIT USAHA SYARIAH','-'),('SYWSIDJ1','126','PT. BANK SULSELBAR UNIT USAHA SYARIAH','-'),('SYYKIDJ1','112','PT. BANK PEMBANGUNAN DAERAH DIY UNIT USAHA SYARIAH','1129922'),('VICTIDJ1','566','PT. BANK VICTORIA INTERNATIONAL','5660018'),('YUDBIDJ1','490','PT. BANK NEO COMMERCE, Tbk.','4900012');
/*!40000 ALTER TABLE `bank` ENABLE KEYS */;

--
-- Table structure for table `bank_transfer`
--

DROP TABLE IF EXISTS `bank_transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_transfer` (
  `uuid` varchar(100) NOT NULL,
  `partner_reference_no` varchar(100) DEFAULT NULL COMMENT 'partner reference no',
  `bank_reference_no` varchar(100) DEFAULT NULL,
  `amount` json DEFAULT NULL,
  `beneficiary_id` varchar(100) NOT NULL COMMENT 'refer to table bt_beneficiary',
  `merchant_id` varchar(36) DEFAULT NULL,
  `external_id` varchar(100) NOT NULL,
  `source_account_no` varchar(100) DEFAULT NULL,
  `source_account_name` varchar(100) DEFAULT NULL,
  `currency` varchar(5) DEFAULT NULL,
  `customer_reference` varchar(100) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `purpose_of_transaction` varchar(100) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `transfer_type` varchar(50) DEFAULT NULL,
  `bank_acquirer` varchar(50) DEFAULT NULL,
  `transaction_date` timestamp NULL DEFAULT NULL,
  `additional_info` json DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`,`created_at`,`external_id`),
  UNIQUE KEY `bank_transfer_external_id_IDX` (`external_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_transfer`
--

/*!40000 ALTER TABLE `bank_transfer` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank_transfer` ENABLE KEYS */;

--
-- Table structure for table `bt_beneficiary`
--

DROP TABLE IF EXISTS `bt_beneficiary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bt_beneficiary` (
  `uuid` varchar(100) NOT NULL,
  `account_name` varchar(100) DEFAULT NULL,
  `account_no` varchar(100) DEFAULT NULL,
  `bank_code` varchar(5) NOT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `customer_residence` varchar(100) DEFAULT NULL,
  `customer_type` varchar(50) DEFAULT NULL,
  `citizen_status` varchar(50) DEFAULT NULL,
  `address` text,
  `bic_code` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `idx_unique_bank_code_account_no` (`bank_code`,`account_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bt_beneficiary`
--

/*!40000 ALTER TABLE `bt_beneficiary` DISABLE KEYS */;
/*!40000 ALTER TABLE `bt_beneficiary` ENABLE KEYS */;

--
-- Table structure for table `bt_transaction`
--

DROP TABLE IF EXISTS `bt_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bt_transaction` (
  `uuid` varchar(50) NOT NULL,
  `bank_transfer_id` varchar(50) NOT NULL,
  `transfer_order` smallint unsigned NOT NULL DEFAULT '0',
  `status` varchar(50) NOT NULL,
  `amount` json DEFAULT NULL,
  `source_account_no` varchar(64) DEFAULT NULL,
  `currency` varchar(5) NOT NULL,
  `customer_reference` varchar(64) DEFAULT NULL,
  `purpose_of_transaction` varchar(5) NOT NULL,
  `transfer_type` varchar(50) NOT NULL,
  `bank_acquirer` varchar(50) NOT NULL,
  `beneficiary_account_no` varchar(34) NOT NULL,
  `beneficiary_bank_code` varchar(8) NOT NULL,
  `beneficiary_account_name` varchar(100) NOT NULL,
  `beneficiary_email` varchar(50) NOT NULL,
  `beneficiary_customer_residence` varchar(50) DEFAULT NULL,
  `beneficiary_citizen_status` varchar(30) DEFAULT NULL,
  `beneficiary_address` varchar(100) NOT NULL,
  `partner_reference_no` varchar(64) DEFAULT NULL,
  `reference_no` varchar(64) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `additional_info` json DEFAULT NULL,
  `transaction_date` timestamp NOT NULL,
  `created_at` timestamp NOT NULL,
  PRIMARY KEY (`uuid`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bt_transaction`
--

/*!40000 ALTER TABLE `bt_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `bt_transaction` ENABLE KEYS */;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `id` int NOT NULL,
  `province_id` int NOT NULL,
  `name` varchar(36) NOT NULL,
  `short_name` varchar(36) NOT NULL,
  `city_acquirer_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

/*!40000 ALTER TABLE `city` DISABLE KEYS */;
/*!40000 ALTER TABLE `city` ENABLE KEYS */;

--
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `district` (
  `id` int NOT NULL,
  `city_id` int NOT NULL,
  `name` varchar(36) NOT NULL,
  `short_name` varchar(36) DEFAULT NULL,
  `postal_code` char(7) DEFAULT NULL,
  `district_acquirer_id` int NOT NULL,
  `acquirer_name` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district`
--

/*!40000 ALTER TABLE `district` DISABLE KEYS */;
/*!40000 ALTER TABLE `district` ENABLE KEYS */;

--
-- Table structure for table `goose_db_version`
--

DROP TABLE IF EXISTS `goose_db_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goose_db_version` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `version_id` bigint NOT NULL,
  `is_applied` tinyint(1) NOT NULL,
  `tstamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goose_db_version`
--

/*!40000 ALTER TABLE `goose_db_version` DISABLE KEYS */;
INSERT INTO `goose_db_version` VALUES (1,0,1,'2024-10-11 07:16:58'),(2,20240208043253,1,'2024-10-11 07:16:58'),(3,20240208043254,1,'2024-10-11 07:16:58'),(4,20240208050106,1,'2024-10-11 07:16:58'),(5,20240208050657,1,'2024-10-11 07:16:58'),(6,20240218080024,1,'2024-10-11 07:16:59'),(7,20240218085748,1,'2024-10-11 07:17:00'),(8,20240219072638,1,'2024-10-11 07:17:00'),(9,20240220103556,1,'2024-10-11 07:17:01'),(10,20240221101945,1,'2024-10-11 07:17:01'),(11,20240222054150,1,'2024-10-11 07:17:01'),(12,20240227073348,1,'2024-10-11 07:17:01'),(13,20240227075832,1,'2024-10-11 07:17:01'),(14,20240228154708,1,'2024-10-11 07:17:01'),(15,20240228174557,1,'2024-10-11 07:17:01'),(16,20240306034047,1,'2024-10-11 07:17:01'),(17,20240321074129,1,'2024-10-11 07:17:01'),(18,20240402102023,1,'2024-10-11 07:17:01'),(19,20240402103042,1,'2024-10-11 07:17:01'),(20,20240413081505,1,'2024-10-11 07:17:01'),(21,20240419093754,1,'2024-10-11 07:17:01'),(22,20240508023403,1,'2024-10-11 07:17:01'),(23,20240508023522,1,'2024-10-11 07:17:02'),(24,20240511060049,1,'2024-10-11 07:17:02'),(25,20240515220058,1,'2024-10-11 07:17:02'),(26,20240515220244,1,'2024-10-11 07:17:02'),(27,20240515221034,1,'2024-10-11 07:17:02'),(28,20240515221200,1,'2024-10-11 07:17:02'),(29,20240517055832,1,'2024-10-11 07:17:02'),(30,20240519072320,1,'2024-10-11 07:17:02'),(31,20240519074130,1,'2024-10-11 07:17:02'),(32,20240603112420,1,'2024-10-11 07:17:02'),(33,20240606083847,1,'2024-10-11 07:17:02'),(34,20240606084047,1,'2024-10-11 07:17:02'),(35,20240612060020,1,'2024-10-11 07:17:02'),(36,20240612060154,1,'2024-10-11 07:17:02'),(37,20240613042938,1,'2024-10-11 07:17:02'),(38,20240620055957,1,'2024-10-11 07:17:02'),(39,20240626040548,1,'2024-10-11 07:17:03'),(40,20240702022410,1,'2024-10-11 07:17:03'),(41,20240715142614,1,'2024-10-11 07:17:03'),(42,20240715142642,1,'2024-10-11 07:17:03'),(43,20240715142655,1,'2024-10-11 07:17:03'),(44,20240716221426,1,'2024-10-11 07:17:03'),(45,20240716224412,1,'2024-10-11 07:17:03'),(46,20240724033525,1,'2024-10-11 07:17:03'),(47,20240724063740,1,'2024-10-11 07:17:03'),(48,20240729070531,1,'2024-10-11 07:17:03'),(49,20240808082041,1,'2024-10-11 07:17:03'),(50,20240808082430,1,'2024-10-11 07:17:03'),(51,20240812025508,1,'2024-10-11 07:17:03'),(52,20240902034237,1,'2024-10-11 07:17:03'),(53,20240911131647,1,'2024-10-11 07:17:03'),(54,20240911141339,1,'2024-10-11 07:17:03'),(55,20240918024833,1,'2024-10-11 07:17:03'),(56,20240926065339,1,'2024-10-11 07:17:03'),(57,20240926065952,1,'2024-10-11 07:17:03'),(58,20241001041432,1,'2024-10-11 07:17:03'),(59,20241020041432,1,'2024-10-22 07:12:59'),(60,20241020041532,1,'2024-10-22 07:13:00'),(61,20241020041632,1,'2024-10-22 07:13:00'),(62,20241022041432,1,'2024-11-12 13:29:22'),(63,20241022041455,1,'2024-11-12 13:29:22'),(64,20241031064115,1,'2024-11-12 13:29:23'),(65,20241112132805,1,'2024-11-12 13:29:23'),(66,20241128155117,1,'2024-12-12 12:42:48'),(67,20241212121111,1,'2024-12-12 12:42:48'),(68,20241216082646,1,'2024-12-20 15:05:01'),(69,20241220150303,1,'2024-12-20 15:05:20'),(70,20241223113501,1,'2024-12-23 11:38:23');
/*!40000 ALTER TABLE `goose_db_version` ENABLE KEYS */;

--
-- Table structure for table `inbound`
--

DROP TABLE IF EXISTS `inbound`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inbound` (
  `uuid` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL COMMENT 'payment,inquiry,etc',
  `acquirer` varchar(100) NOT NULL,
  `request_payload` json DEFAULT NULL COMMENT 'request from bank',
  `response_payload` json DEFAULT NULL COMMENT 'response to bank',
  `additional_info` json DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inbound`
--

/*!40000 ALTER TABLE `inbound` DISABLE KEYS */;
/*!40000 ALTER TABLE `inbound` ENABLE KEYS */;

--
-- Table structure for table `inquiry_account_config`
--

DROP TABLE IF EXISTS `inquiry_account_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inquiry_account_config` (
  `uuid` char(36) NOT NULL,
  `bank_code` char(5) NOT NULL COMMENT 'bank code like 013 (permata)',
  `bank_name` varchar(20) NOT NULL COMMENT 'can reffer to constants acquirer',
  `priority` int NOT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'active' COMMENT 'active, inactive',
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `inquiry_account_config_priority_unique` (`priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inquiry_account_config`
--

/*!40000 ALTER TABLE `inquiry_account_config` DISABLE KEYS */;
INSERT INTO `inquiry_account_config` VALUES ('d019e7a0-87a0-11ef-adf9-0242ac130004','013','PERMATA',1,'active'),('d019ebc8-87a0-11ef-adf9-0242ac130004','002','BRI',2,'active'),('d019f05b-87a0-11ef-adf9-0242ac130004','008','MANDIRI',3,'active');
/*!40000 ALTER TABLE `inquiry_account_config` ENABLE KEYS */;

--
-- Table structure for table `outbound`
--

DROP TABLE IF EXISTS `outbound`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `outbound` (
  `uuid` varchar(100) NOT NULL,
  `origin_type` varchar(20) DEFAULT NULL,
  `origin_id` varchar(36) DEFAULT NULL,
  `transaction_id` varchar(36) DEFAULT NULL,
  `title` varchar(100) NOT NULL COMMENT 'create_va,etc',
  `acquirer` varchar(100) NOT NULL,
  `request_payload` json DEFAULT NULL COMMENT 'request to bank',
  `response_payload` json DEFAULT NULL COMMENT 'response from bank',
  `additional_info` json DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outbound`
--

/*!40000 ALTER TABLE `outbound` DISABLE KEYS */;
/*!40000 ALTER TABLE `outbound` ENABLE KEYS */;

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `province` (
  `id` int NOT NULL,
  `name` varchar(36) NOT NULL,
  `short_name` varchar(36) NOT NULL,
  `province_acquirer_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province`
--

/*!40000 ALTER TABLE `province` DISABLE KEYS */;
/*!40000 ALTER TABLE `province` ENABLE KEYS */;

--
-- Table structure for table `qr_registration`
--

DROP TABLE IF EXISTS `qr_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qr_registration` (
  `uuid` char(36) NOT NULL,
  `registration_id` varchar(50) NOT NULL,
  `merchant_id` char(36) DEFAULT NULL,
  `parent_merchant_id` char(36) DEFAULT NULL,
  `acquirer` varchar(30) DEFAULT NULL,
  `applyment_code` varchar(50) DEFAULT NULL,
  `merchant_type` varchar(20) DEFAULT NULL,
  `merchant_external_id` varchar(26) DEFAULT NULL,
  `address` json DEFAULT NULL,
  `address_detail` text,
  `status` char(20) NOT NULL,
  `metadata` json DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qr_registration`
--

/*!40000 ALTER TABLE `qr_registration` DISABLE KEYS */;
/*!40000 ALTER TABLE `qr_registration` ENABLE KEYS */;

--
-- Table structure for table `qr_registration_document_upload`
--

DROP TABLE IF EXISTS `qr_registration_document_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qr_registration_document_upload` (
  `uuid` char(36) NOT NULL,
  `registration_id` varchar(50) NOT NULL,
  `doc_type` varchar(50) NOT NULL,
  `acquirer_doc_type` varchar(50) NOT NULL,
  `number` varchar(100) NOT NULL,
  `file_name` varchar(100) DEFAULT NULL,
  `upload_status` varchar(20) DEFAULT NULL,
  `media_id` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qr_registration_document_upload`
--

/*!40000 ALTER TABLE `qr_registration_document_upload` DISABLE KEYS */;
/*!40000 ALTER TABLE `qr_registration_document_upload` ENABLE KEYS */;

--
-- Table structure for table `qris`
--

DROP TABLE IF EXISTS `qris`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qris` (
  `uuid` char(36) NOT NULL,
  `merchant_id` char(36) NOT NULL,
  `sub_merchant_id` char(36) DEFAULT NULL,
  `partner_reference_no` varchar(100) NOT NULL,
  `store_id` char(36) DEFAULT NULL,
  `terminal_id` varchar(50) DEFAULT NULL,
  `acquirer_reference_no` varchar(50) DEFAULT NULL,
  `qr_type` varchar(20) DEFAULT NULL COMMENT 'qris type contains: CLOSE_DYNAMIC, OPEN_STATIC',
  `status` varchar(36) DEFAULT NULL COMMENT 'qris status contains: INITIATED, PENDING, EXPIRED, PAID, FAILED',
  `amount` json DEFAULT NULL,
  `fee_amount` json DEFAULT NULL,
  `validity_period` varchar(100) DEFAULT NULL COMMENT 'mandatory if Dynamic Code',
  `tip_type` varchar(100) DEFAULT NULL COMMENT 'mandatory read TIP Type for every acquirer',
  `additional_info` json DEFAULT NULL,
  `qr_content` text,
  `qr_url` varchar(256) DEFAULT NULL,
  `is_active` tinyint NOT NULL DEFAULT '0',
  `expired_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sc_id` varchar(100) DEFAULT NULL,
  `acquirer` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`uuid`,`created_at`,`partner_reference_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qris`
--

/*!40000 ALTER TABLE `qris` DISABLE KEYS */;
INSERT INTO `qris` VALUES ('afd519bc-e846-45b8-9884-64c6724e6275','000550000927',NULL,'QR1734512186','000570000929','','2024121815225375629236403','DYNAMIC','SUCCESS','{\"value\": \"10000.00\", \"currency\": \"IDR\"}',NULL,'100','NO_FEE','{}','00020101021226740025ID.CO.BANKNEOCOMMERCE.WWW011893600490591008046002120005500009270303URE51550025ID.CO.BANKNEOCOMMERCE.WWW0215BNC2407019973840303URE5204152053033605405100005802ID5906Harsya6014TIMOR TENG SEL6105855626233012230018693057190819061770703A0163044FD9','https://sit-marketing-img.bankneo.co.id/qris/merchant/img/KrAI0utmwiiohwAfTTxgH-6J57pCWcBx1COu2ubY91w.png',0,'2025-12-18 08:58:06','2024-12-18 08:56:26','2024-12-18 09:11:44','','BNC');
/*!40000 ALTER TABLE `qris` ENABLE KEYS */;

--
-- Table structure for table `qris_transaction`
--

DROP TABLE IF EXISTS `qris_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qris_transaction` (
  `uuid` char(36) NOT NULL,
  `qris_id` char(36) NOT NULL,
  `acquirer_reference_no` varchar(50) NOT NULL DEFAULT '',
  `partner_reference_no` varchar(50) NOT NULL DEFAULT '',
  `session_id` char(36) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `account_type` varchar(100) DEFAULT NULL,
  `destination_number` varchar(100) DEFAULT NULL,
  `destination_account_name` varchar(100) DEFAULT NULL,
  `amount` json DEFAULT NULL,
  `additional_info` json DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uuid`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qris_transaction`
--

/*!40000 ALTER TABLE `qris_transaction` DISABLE KEYS */;
INSERT INTO `qris_transaction` VALUES ('78a54285-5d07-42b6-ba73-17df5b7024b5','afd519bc-e846-45b8-9884-64c6724e6275','2024121815225375629236403','QR1734512186',NULL,'PENDING',NULL,NULL,NULL,'{\"value\": \"10000.00\", \"currency\": \"IDR\"}','{}','2024-12-18 08:56:27','2024-12-18 08:56:27'),('98ffdc44-5f71-45ab-a6bc-4446aa2975fc','afd519bc-e846-45b8-9884-64c6724e6275','2024121815225375629236403','QR1734512186',NULL,'SUCCESS',NULL,NULL,NULL,'{\"value\": \"10000.00\", \"currency\": \"IDR\"}','{\"acquireReferenceNo\": \"2024092310249320323629787\"}','2024-12-18 09:07:07','2024-12-18 09:07:06'),('b584acb8-299a-4a9d-b606-f50006a097bd','afd519bc-e846-45b8-9884-64c6724e6275','2024121815225375629236403','QR1734512186',NULL,'SUCCESS',NULL,NULL,NULL,'{\"value\": \"10000.00\", \"currency\": \"IDR\"}','{\"acquireReferenceNo\": \"2024092310249320323629787\"}','2024-12-18 09:11:44','2024-12-18 09:11:43');
/*!40000 ALTER TABLE `qris_transaction` ENABLE KEYS */;

--
-- Table structure for table `transfer_account`
--

DROP TABLE IF EXISTS `transfer_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transfer_account` (
  `uuid` char(36) NOT NULL,
  `bank_code` varchar(10) NOT NULL DEFAULT '',
  `bank_name` varchar(50) NOT NULL DEFAULT '',
  `account_no` varchar(50) NOT NULL,
  `account_name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `unique_account_no` (`account_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfer_account`
--

/*!40000 ALTER TABLE `transfer_account` DISABLE KEYS */;
INSERT INTO `transfer_account` VALUES ('13063818-3eac-11ef-a1d8-0242ac120007','046','DBS','208850782','PT Harsya Remittindo','2024-07-10 11:04:34','2024-10-14 03:56:44',NULL),('48d27d2a-8506-433f-b519-497287bfa4e0','008','MANDIRI','2600007057537','PT Harsya Remittindo','2024-05-09 08:51:04','2024-09-25 01:49:27',NULL),('696e5ea7-11cb-11ef-b053-0242ac110004','999','SIMULATION','9999666601230','PT Harsya Remittindo','2024-05-14 08:24:41','2024-05-14 08:24:41',NULL),('7fdabcef-6db3-11ef-9fc0-0242ac120005','014','BCA','1014','PT Harsya Remittindo','2024-09-08 07:25:18','2024-09-11 02:44:47',NULL),('9f89cc7c-76f5-11ef-a32b-0242ac120005','008','MANDIRI_CENTRAL','1140011122234','PT Harsya Remittindo','2024-09-20 02:11:18','2024-09-24 02:22:02',NULL),('b3cc3959-f0fc-4059-9b26-91d1a0b63dd5','013','PERMATA','888801000187508','PT Harsya Remittindo','2024-05-09 08:01:52','2024-10-04 07:30:23',NULL),('b804c008-3a3d-4662-8637-52a46c9c810e','022','CIMB','800000058600','PT Harsya Remittindo','2024-05-13 02:49:45','2024-08-05 08:01:22',NULL),('bcdea332-906c-4345-9578-b77113cd3fa3','002','C2ABRI','1002','PT Harsya Remittindo','2024-05-30 00:44:43','2024-05-31 07:50:30',NULL),('c82ae22e-d9c4-4031-91ef-b6be487a5b08','002','BRI','020601000988301','PT Harsya Remittindo','2024-05-09 08:01:52','2024-10-04 08:00:56',NULL),('ce51a076-1e1d-11ef-a2d2-0242ac110002','008','C2AMANDIRI','1008','PT Harsya Remittindo','2024-05-30 00:44:43','2024-05-30 00:45:23',NULL);
/*!40000 ALTER TABLE `transfer_account` ENABLE KEYS */;

--
-- Table structure for table `transfer_beneficiary_config`
--

DROP TABLE IF EXISTS `transfer_beneficiary_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transfer_beneficiary_config` (
  `uuid` varchar(36) NOT NULL,
  `merchant_id` varchar(36) NOT NULL,
  `beneficiary_id` varchar(36) NOT NULL,
  `status` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `beneficiary_id` (`beneficiary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfer_beneficiary_config`
--

/*!40000 ALTER TABLE `transfer_beneficiary_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `transfer_beneficiary_config` ENABLE KEYS */;

--
-- Table structure for table `transfer_config`
--

DROP TABLE IF EXISTS `transfer_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transfer_config` (
  `uuid` varchar(50) NOT NULL,
  `priority` int NOT NULL DEFAULT '0',
  `is_support_bifast` tinyint(1) NOT NULL DEFAULT '1',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `bank_account_uuid` varchar(36) NOT NULL,
  `transfer_type` varchar(20) NOT NULL,
  `single_trx_limit` decimal(32,2) DEFAULT NULL,
  `periodic_limit` varchar(10) NOT NULL DEFAULT 'DAILY',
  `transfer_limit` decimal(32,2) DEFAULT NULL,
  `allowed_destinations` json DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `transfer_config_unique` (`priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfer_config`
--

/*!40000 ALTER TABLE `transfer_config` DISABLE KEYS */;
INSERT INTO `transfer_config` VALUES ('0E799C89-A59B-48F5-AF81-851920B0954A',11,1,1,'b3cc3959-f0fc-4059-9b26-91d1a0b63dd5','INTERBANK-BIFAST',250000000.00,'DAILY',90000000000.00,'[\"ANY\"]','2024-05-10 10:02:09','2024-10-03 04:56:28',NULL),('13d4db9f-76f7-11ef-a32b-0242ac120005',32,0,0,'9f89cc7c-76f5-11ef-a32b-0242ac120005','INTERBANK-BIFAST',25000000.00,'DAILY',500000000.00,'[\"ANY\"]','2024-08-05 01:52:34','2024-10-01 06:46:53',NULL),('162bfab8-81b7-4836-b78b-e439fea8cf89',15,0,1,'b804c008-3a3d-4662-8637-52a46c9c810e','INTERBANK',650000000.00,'DAILY',100000000.00,'[\"ANY\"]','2024-05-18 17:13:29','2024-11-01 07:46:39',NULL),('1fc96a4e-76f7-11ef-a32b-0242ac120005',33,0,0,'9f89cc7c-76f5-11ef-a32b-0242ac120005','INTERBANK',25000000.00,'DAILY',500000000.00,'[\"ANY\"]','2024-08-05 01:52:34','2024-11-01 07:45:39',NULL),('25092fd7-afe8-4dea-ad67-2ecfdee9046d',2,0,1,'c82ae22e-d9c4-4031-91ef-b6be487a5b08','INTRABANK',250000000.00,'DAILY',90000000000.00,'[\"002\"]','2024-08-12 06:08:00','2024-12-17 03:22:56',NULL),('2a739bef-98f3-40f9-8df8-94bf16b52ae1',4,0,1,'b804c008-3a3d-4662-8637-52a46c9c810e','INTRABANK',250000000.00,'DAILY',90000000000.00,'[\"022\"]','2024-08-12 06:10:00','2024-11-01 07:46:39',NULL),('2d8589f6-5957-11ef-9d05-42010a140005',-2,1,0,'13063818-3eac-11ef-a1d8-0242ac120007','INTERBANK',70000000.00,'DAILY',250000000.00,'[\"013\", \"008\", \"002\", \"014\"]','2024-08-13 09:34:03','2024-08-13 09:52:14','2024-08-13 09:52:14'),('3e59027e-f676-4cf0-a862-a16c5883769b',42,1,0,'48d27d2a-8506-433f-b519-497287bfa4e0','INTERBANK-BIFAST',250000000.00,'DAILY',90000000000.00,'[\"ANY\"]','2024-05-11 08:51:49','2024-08-12 06:43:25',NULL),('3E9CE2B1-1260-4C65-884C-018500A07C76',40,1,1,'c82ae22e-d9c4-4031-91ef-b6be487a5b08','INTERBANK-BIFAST',250000000.00,'DAILY',90000000000.00,'[\"ANY\"]','2024-05-10 10:03:09','2024-12-17 03:23:25',NULL),('4883c30d-76f6-11ef-a32b-0242ac120005',3,0,0,'9f89cc7c-76f5-11ef-a32b-0242ac120005','INTRABANK',25000000.00,'DAILY',500000000.00,'[\"ANY\"]','2024-08-05 01:52:34','2024-11-01 07:45:39',NULL),('48f64e54-219c-11ef-8751-42010a140004',10,0,0,'ce51a076-1e1d-11ef-a2d2-0242ac110002','INTERBANK',250000000.00,'DAILY',90000000000.00,'[\"ANY\"]','2024-05-11 08:52:49','2024-11-01 07:45:39',NULL),('48f656d0-219c-11ef-8751-42010a140004',6,0,0,'bcdea332-906c-4345-9578-b77113cd3fa3','INTRABANK',250000000.00,'DAILY',90000000000.00,'[\"002\"]','2024-05-11 08:52:49','2024-11-01 07:45:39',NULL),('719104cf-3eac-11ef-a1d8-0242ac120007',13,1,0,'13063818-3eac-11ef-a1d8-0242ac120007','INTERBANK-BIFAST',250000000.00,'DAILY',90000000000.00,'[\"ANY\"]','2024-07-12 01:24:32','2024-11-01 07:45:39',NULL),('8946fd27-7b5c-43db-9391-473e4b9e4dde',5,0,0,'ce51a076-1e1d-11ef-a2d2-0242ac110002','INTRABANK',250000000.00,'DAILY',90000000000.00,'[\"008\"]','2024-08-12 06:11:00','2024-11-01 07:45:39',NULL),('91754C5B-99A4-4CA3-BF93-9CE13AB5D089',14,0,1,'b3cc3959-f0fc-4059-9b26-91d1a0b63dd5','INTERBANK',250000000.00,'DAILY',90000000000.00,'[\"ANY\"]','2024-05-10 10:01:09','2024-10-03 04:56:28',NULL),('aa6f49bd-0c57-4db6-a445-83bbf18e8eb6',1,0,1,'b3cc3959-f0fc-4059-9b26-91d1a0b63dd5','INTRABANK',20000000.00,'DAILY',250000000.00,'[\"013\"]','2024-08-12 06:07:00','2024-10-03 04:56:29',NULL),('ab8b015f-11cb-11ef-b053-0242ac110004',9,0,0,'696e5ea7-11cb-11ef-b053-0242ac110004','INTERBANK',250000000.00,'DAILY',90000000000.00,'[\"ANY\"]','2024-05-14 08:26:32','2024-10-29 07:22:58',NULL),('b59a21f1-50a0-11ef-9d05-42010a140005',-1,0,0,'13063818-3eac-11ef-a1d8-0242ac120007','INTERBANK',1000000.00,'DAILY',20000000.00,'[\"ANY\"]','2024-08-02 07:27:44','2024-08-08 09:10:52','2024-08-02 08:42:32'),('c7480f14-ebb2-4f0d-ae21-20028158b7ac',12,0,1,'b804c008-3a3d-4662-8637-52a46c9c810e','INTERBANK-BIFAST',650000000.00,'DAILY',2000000000.00,'[\"ANY\"]','2024-05-18 17:12:29','2024-11-01 07:46:39',NULL),('c8142a3b-6db3-11ef-9fc0-0242ac120005',7,0,1,'7fdabcef-6db3-11ef-9fc0-0242ac120005','INTRABANK',70000000.00,'DAILY',250000000.00,'[\"ANY\"]','2024-09-08 07:27:19','2024-12-17 03:23:45',NULL),('c82ae22e-d9c4-4031-91ef-b6be487a5b08',41,0,1,'c82ae22e-d9c4-4031-91ef-b6be487a5b08','INTERBANK',250000000.00,'DAILY',90000000000.00,'[\"ANY\"]','2024-05-11 08:07:42','2024-12-17 03:23:25',NULL),('e9262c5a-c322-4042-b19a-070bab95259b',8,0,0,'48d27d2a-8506-433f-b519-497287bfa4e0','INTRABANK',250000000.00,'DAILY',90000000000.00,'[\"008\"]','2024-08-12 06:09:00','2024-11-01 07:45:39',NULL),('eeb2c637-dd91-4a35-a2f3-d6f66bbd8808',44,0,0,'9f89cc7c-76f5-11ef-a32b-0242ac120005','RTGS',250000000.00,'DAILY',90000000000.00,'[\"ANY\"]','2024-09-26 04:44:31','2024-09-26 04:44:31',NULL),('f2acf70c-76a1-11ef-9d05-42010a140005',43,0,0,'b3cc3959-f0fc-4059-9b26-91d1a0b63dd5','RTGS',250000000.00,'DAILY',90000000000.00,'[\"ANY\"]','2024-09-19 16:12:57','2024-09-19 16:12:57',NULL);
/*!40000 ALTER TABLE `transfer_config` ENABLE KEYS */;

--
-- Table structure for table `va_transaction`
--

DROP TABLE IF EXISTS `va_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `va_transaction` (
  `uuid` varchar(100) NOT NULL,
  `virtual_account_id` varchar(100) NOT NULL,
  `trx_type` varchar(10) NOT NULL DEFAULT 'INQUIRY' COMMENT 'possible value INQUIRY, PAYMENT',
  `trx_id` varchar(64) DEFAULT NULL COMMENT 'trx id for payment notif',
  `ref_id` varchar(100) NOT NULL COMMENT 'refference number from inquiry or payment',
  `number` varchar(100) NOT NULL,
  `account_name` varchar(100) NOT NULL,
  `acquirer` varchar(100) NOT NULL,
  `total_amount` json DEFAULT NULL,
  `channel_code` varchar(100) DEFAULT NULL COMMENT 'Channel code based on ISO 18245',
  `paid_amount` json DEFAULT NULL,
  `cumulative_payment_amount` json DEFAULT NULL,
  `paid_bills` varchar(100) DEFAULT NULL,
  `trx_date_time` varchar(100) DEFAULT NULL COMMENT 'PJP internal system datetime with timezone, which follows the ISO-8601 standard',
  `reference_no` varchar(100) DEFAULT NULL COMMENT 'Payment auth code generated by PJP',
  `journal_num` varchar(100) DEFAULT NULL COMMENT 'Sequence journal number in PJP Core System',
  `payment_type` int DEFAULT NULL COMMENT 'Type of payment',
  `flag_advise` varchar(100) DEFAULT NULL COMMENT 'Status is this a retry notification (e.g. Y/N)',
  `sub_company` varchar(100) DEFAULT NULL COMMENT 'Sub Company code generated by Partner',
  `bill_details` json DEFAULT NULL,
  `free_texts` json DEFAULT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'pending' COMMENT 'pending,paid,expired',
  `additional_info` json DEFAULT NULL,
  `is_single_use` tinyint(1) NOT NULL DEFAULT '0',
  `is_close_amount` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL,
  `trx_timestamp` timestamp NOT NULL,
  PRIMARY KEY (`uuid`,`created_at`),
  KEY `va_transaction_unique` (`virtual_account_id`,`ref_id`,`created_at`),
  KEY `va_transaction_trx_type_IDX` (`trx_type`,`trx_id`,`acquirer`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `va_transaction`
--

/*!40000 ALTER TABLE `va_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `va_transaction` ENABLE KEYS */;

--
-- Table structure for table `virtual_account`
--

DROP TABLE IF EXISTS `virtual_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `virtual_account` (
  `uuid` varchar(100) NOT NULL,
  `partner_service_id` varchar(100) NOT NULL COMMENT 'Derivative of X-PARTNER-ID , similar to company code, 8 digit left padding space. partnerServiceId + customerNo or virtualAccountNo',
  `customer_no` varchar(100) NOT NULL COMMENT 'Unique number. (up to 20 digits). partnerServiceId + customerNo or virtualAccountNo',
  `inq_ref` varchar(50) DEFAULT NULL COMMENT 'This field filled when inquiry va',
  `number` varchar(100) NOT NULL,
  `account_name` varchar(100) NOT NULL,
  `account_email` varchar(100) NOT NULL,
  `account_phone` varchar(30) NOT NULL,
  `sub_company` varchar(100) DEFAULT NULL COMMENT 'Sub Company code generated by Partner',
  `bill_details` json DEFAULT NULL,
  `free_texts` json DEFAULT NULL,
  `additional_info` json DEFAULT NULL,
  `acquirer` varchar(100) NOT NULL,
  `total_amount` json DEFAULT NULL COMMENT 'fee + amount',
  `fee_amount` json DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `expired_at` timestamp NULL DEFAULT NULL COMMENT 'virtual account expired datetime',
  `updated_at` timestamp NOT NULL,
  `is_single_use` tinyint(1) NOT NULL DEFAULT '0',
  `is_close_amount` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` int NOT NULL DEFAULT '0' COMMENT '0: inactive, 1: active',
  `status` varchar(20) NOT NULL DEFAULT 'pending' COMMENT 'paid, pending, expired',
  PRIMARY KEY (`uuid`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtual_account`
--

/*!40000 ALTER TABLE `virtual_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `virtual_account` ENABLE KEYS */;

--
-- Dumping routines for database 'snap_core_processor'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-26 18:42:12
