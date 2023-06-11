-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cems
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `course_id` varchar(45) NOT NULL,
  `course_name` varchar(45) NOT NULL,
  `course_subject_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  KEY `course_course_subject_id_idx` (`course_subject_id`),
  CONSTRAINT `course_course_subject_id` FOREIGN KEY (`course_subject_id`) REFERENCES `subject` (`subject_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('01','Algebra1','01'),('02','Algebra2','01'),('03','Data Stracture','02'),('04','C Programming','02'),('05','OOP','02'),('06','Physics1','03'),('07','Organic Chemistry','04'),('08','Calculus1','01');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `department_id` varchar(45) NOT NULL,
  `department_name` varchar(45) NOT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('1','Software Engineering'),('2','Information Systems Engineering'),('3','Industrial Engineering');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam`
--

DROP TABLE IF EXISTS `exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam` (
  `exam_number` varchar(3) NOT NULL,
  `subject_id` varchar(45) NOT NULL,
  `course_id` varchar(45) NOT NULL,
  `exam_id` varchar(7) NOT NULL,
  `num_questions` int DEFAULT NULL,
  `time` int DEFAULT NULL,
  `examinees_notes` text,
  `professor_notes` text,
  `professor_full_name` varchar(45) DEFAULT NULL,
  `professor_id` varchar(45) DEFAULT NULL,
  `password` varchar(5) DEFAULT NULL,
  `isActive` varchar(2) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `exam_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`exam_number`,`subject_id`,`course_id`,`exam_id`),
  KEY `exam_professor_id_idx` (`professor_id`),
  KEY `idx_exam_id` (`exam_id`),
  CONSTRAINT `exam_professor_id` FOREIGN KEY (`professor_id`) REFERENCES `professor_subject` (`professor_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam`
--

LOCK TABLES `exam` WRITE;
/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
INSERT INTO `exam` VALUES ('01','01','01','010101',1,60,'Don\'t forget to do something!','Don\'t forget to do nothing!','Daniel Armaganian','209146943','8520','0','Computerized','Algebra1 2022'),('02','02','05','020502',1,60,'Yes	','No','Daniel Armaganian','209146943','1234','0','Computerized','OOP 1921'),('03','02','04','020403',2,120,'Don\'t forget to free memory!','Don\'t forget to give a factor!','Daniel Armaganian','209146943','0010','0','Computerized','C Programming 1936'),('04','01','01','010104',3,45,'Good luck!','Make a lot of noise during the exam.','Tzahi Bakal','315730176','0110','0','Computerized','Algebra1 2020'),('05','01','02','010205',3,10,'','','Daniel Armaganian','209146943','1234','0','Computerized','Algebra2 2031'),('06','01','01','010106',4,90,'Good luck!','','Daniel Armaganian','209146943','3q4k','0','Computerized','Algebra1 2000'),('07','01','08','010807',1,20,'','','Daniel Armaganian','209146943','zqq9','0','Computerized','Calculus1 2012');
/*!40000 ALTER TABLE `exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_question`
--

DROP TABLE IF EXISTS `exam_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_question` (
  `exam_id` varchar(7) NOT NULL,
  `question_id` varchar(6) NOT NULL,
  `score` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`exam_id`,`question_id`),
  KEY `exam_question_question_id_idx` (`question_id`) /*!80000 INVISIBLE */,
  KEY `exam_question_exam_id_idx` (`exam_id`),
  CONSTRAINT `exam_question_exam_id` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`exam_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `exam_question_question_id` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_question`
--

LOCK TABLES `exam_question` WRITE;
/*!40000 ALTER TABLE `exam_question` DISABLE KEYS */;
INSERT INTO `exam_question` VALUES ('010101','01001','100'),('010104','01001','10'),('010104','01003','35'),('010104','01011','55'),('010106','01001','33'),('010106','01003','33'),('010106','01011','28'),('010106','01013','6'),('010205','01003','33'),('010205','01005','33'),('010205','01011','34'),('010807','01012','100'),('020403','02006','50'),('020403','02007','50'),('020502','02004','100');
/*!40000 ALTER TABLE `exam_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_stats`
--

DROP TABLE IF EXISTS `exam_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_stats` (
  `exam_id` varchar(7) NOT NULL,
  `date` date DEFAULT NULL,
  `time` int DEFAULT NULL,
  `actual_time` int DEFAULT NULL,
  `no. student` int DEFAULT NULL,
  `no. completed` int DEFAULT NULL,
  `no. uncomplete` int DEFAULT NULL,
  PRIMARY KEY (`exam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_stats`
--

LOCK TABLES `exam_stats` WRITE;
/*!40000 ALTER TABLE `exam_stats` DISABLE KEYS */;
INSERT INTO `exam_stats` VALUES ('010101','2023-06-20',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `exam_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_time_request`
--

DROP TABLE IF EXISTS `exam_time_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_time_request` (
  `exam_id` varchar(45) NOT NULL,
  `exam_time_request` int DEFAULT NULL,
  `isApproved` varchar(2) DEFAULT NULL,
  `professor_id` varchar(45) DEFAULT NULL,
  `professor_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`exam_id`),
  KEY `professor_id_time_request_idx` (`professor_id`),
  CONSTRAINT `exam_id_time_request` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`exam_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `professor_id_time_request` FOREIGN KEY (`professor_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_time_request`
--

LOCK TABLES `exam_time_request` WRITE;
/*!40000 ALTER TABLE `exam_time_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_time_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manual_exam`
--

DROP TABLE IF EXISTS `manual_exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manual_exam` (
  `idmanual_exam` varchar(20) NOT NULL,
  `manual_exam_file` blob,
  `exam_path` varchar(200) DEFAULT 'C:',
  PRIMARY KEY (`idmanual_exam`),
  UNIQUE KEY `exam_path_UNIQUE` (`exam_path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manual_exam`
--

LOCK TABLES `manual_exam` WRITE;
/*!40000 ALTER TABLE `manual_exam` DISABLE KEYS */;
INSERT INTO `manual_exam` VALUES ('010201',_binary 'PK\0\0\0\0\0!\0ß¤ÒlZ\0\0 \0\0\0[Content_Types].xml ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0´ËnÂ0E÷ú·Ubè¢ª*>-Ré{VýÇ¼þ¾QU\nl\"%3÷Þ3VÆÑÚl	µw%ë=^i7+Ù×ä-d&á0ÞAÉ6l4¼½L60#µÃÍS\nO£Xø\0*V$z3ü3à÷½ÞÞ%p)Oµ^ ²×5}nH\"dÙsÓXgL`´ê|éÔ|PrÛsð\Z?PWìtt4Q+ÈÆ\"¦wa©¯|T\\y¹°¤,NÛàôU¥%´úÚ-D/ÎÜ¢­X¡Ýÿ(¦¼<EãÛ)à\Z\0;çNL?¯FñË¼¤¢Ü\Z¸<FkÝ	h¡yöÏæØÚ¤Îqôi£ã?ÆÞ¯l­Îià\01éÓ]HÖgÏõm @ÈæÛûmø\0\0ÿÿ\0PK\0\0\0\0\0!\0\Z·ï\0\0\0N\0\0\0_rels/.rels ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¬ÁjÃ0@ïýÑ½QÚÁ£N/cÐÛÙ[ILÛØj×þý<ØØ]éaGËÒÓÐzsFuà]ð\ZU\r½	Öù^Ã[û¼x\0¼¥1xÖpâæöfýÊ#I)ÊYÏ\ZøÍÀå*Döå§i\")ÏÔc$³£qU×÷~3 1ÕÖjH[{ª=E¾ºÎ~\nf?±3-ÂÞ²]ÄTê¸2j)õ,\Zl0/%b¬\n\Zð¼Ñêz£¿§Å,	¡	/û|f\\Zþçæ?6ï!Y´_áo]Aó\0\0ÿÿ\0PK\0\0\0\0\0!\0ãQ¢<\0\0\0\0\0\0\0word/document.xml¬_oÚ0Àß\'í;Dy§Î*VÊÄÃ$´®À8XãÈ6öéwÎB®\néxÀñÙ÷»óÙwqîN<±T*&ÒíÞ9¶ES\"\"îgöË¯Õ`b[Jã4ÂHéÌ>Se?Ì¿~¹ÏÃH§©¶\0ª0ÏÈÌµÎB)Çê3\";}GGb·c¢\\ÈyëO*öqzÄÊ®päÔI²±ÔôÔ0Ü!#4E6Èëznåß\nñª\ZöW-Ò¨éÅýH^4îGòÛ¤I?Rë8ñöMap\'$Ç\Zºr8¯l\0àk¶e	Óg`:AÁ,}íáh]Ün&Mü¨¦}iXé.úÆõ°Ô¯MºsSDO:QºÖ]bWª/«ÂRD\rI@Eªb]ªïKÁ¸?\nÀ\'õ¼<s;¦Ú¿JÛ²ÜØÅýjïxRzþ1Ñu:ì¦A\\4º¸ðÖfí	Üî«àºO\rðZÐ/1©4Ùm8¬cZÕrW5u;ÖÀ¿¹D_ûa\Z£~ÅRâÛpõ!£5±º$!ÒÛ8ºàÎü*ÞÙþsIõ]CÖÐØçhë¦¼ææ¢s«JÎë¡>çÌs3¨ºë}*$Þ&à¤Ùb;`þáÐ¦x¤§BnöÚ2õÊÃ\rm+¢³i3x\r|ì»Îrâ-ìB\nï7m¤îr¸|Z-F \rá6ýÙ3?¼t6#Goê.\n+ÙFFMÓ=Ì?bxUÐtðòl£ù=ªQ3»«JêùÚÊ1Ü3µ°^)Í,¦-¸ZÊÜ=63u9¿4Ð^q0|ú6zZ­Þ®x\\ýÞ¬¸ZW-ÚÈwÿ-µ·½]Ý(íÃ q×«EB»ÁÄCfÂlZÀ»ÆÅö±nº[¡µàM?¡»«ÑâÝ±WtwBè«îþ ®S#\"Q U&´Sáá»4§4LXJ7LðÒQT¯»x,*j¾*æ\0\0\0ÿÿ\0PK\0\0\0\0\0!\0Öd³Qô\0\0\01\0\0\0word/_rels/document.xml.rels ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¬ËjÃ0E÷þ}-;}PBälJ!ÛÖý\0E?¨,	Íôá¿¯HIëÐ`ºðr®sÏ6ÛÏÁwÔ{§ Èrè¯{×*x©¯îAkWkë*`[^^lÐjNKÔõD¢8RÐ1µd:4e> K/æ4ÆVm^urçw2NP0Å®Vwõ5jø¶oÞà7o:>S!?pÿÌé8JX[d0KDçEVKÐc2§P,ªÀ£Å©Àa«¿]²Ó.þ¶Æï°s¸YÒ¡ñ+½·è(!O>zù\0\0ÿÿ\0PK\0\0\0\0\0!\0¶ôgÒ\0\0É \0\0\0\0\0word/theme/theme1.xmlìYKG¾ò¹ËzÍèa¬5ÒHòk×6Þµ½Rk¦­iÑÝÚµ0`r	C¹åB1Ääc°IêI3-õÄ]	»U?¾ªþºªºº4sáâý:GÂ[=WqØ$aÇ½}0,µ\\GHe	î¸,Ü;v±ò8:n$åì|¹,F0Ä96Ã	ÌM.ËcAoLËµJ¥QI\\\'A1¨½1vJwg¥|@á_\"\ZQ¾¯TcCBcÇÓªúPî!Úqa1;>À÷¥ëP$$LtÜþsË;Êk!*dsrCý·[\n§5-ÇÃÃµ çù^£»Ö¯TnãÍAcÐXëÓ\04\ZÁNS.¦Îf-ðØ(mZt÷ýzÕÀçô×·ð]_}¼¥Mo?\rs ´éoáý^»×7õkPÚllánßk\Zx\r(I¦[èß¨«Ý®!F/[ámß6kKx*ç¢+OdQ¬ÅèãC\0hç\"IG.fxF%8»$ ðf(a+µÊ°Rÿêãéö(:QN:\Z­!ÅÇ#Nf²ã^­nòêÅ¿|ôûËÇ_>úu¹ö¶Üey¹7?}óÏÓ/¿ûñÍoíxÇ¿þå«×üù_ê¥Aë»g¯?{õý×ýüÄïrtç:>vn±6hY\0ò÷8ÉKtP )z #}}(²àzØ´ãéÂ¼4¿gÞø\\ðZÀ=Æhqë®©µòV\'¡}q>Ïãn!td[;Øðò`>¸\'6A\r7)¸8ÁÒQsl±Eì.!]÷È3Á&Ò¹K\"VC#2¡Ë$¿,lÁßmöî8=FmêûøÈDÂÙ@Ô¦SÃÐ\\¢ØÊÅ4ÜE2²Ü_ðap!ÁÓ!¦Ì±6|aÐ½iÆîö=ºM$djCî\"ÆòÈ>gVÎ$òØ+b\n!LZI0ó¨>ø%î¾C°áî·íÛì¢fæÜv$03ÏãN¶)ïòØH±]N¬ÑÑFhïbLÑ1\ZcìÜ¾bÃ³aóôÕ²Êel³ÍUdÆªê\'X@­¤c0Bv¬ÏÞb#ñ,P#^¤ùúÔ\\u±5^éhj¤RÂÕ¡µ¸!bcZoFÈ+Õöx]pÃïrÆ@æÞÈà÷ÄþÎ¶9@ÔX U-ÝáþLD\'-6·ÊMÌC¹¡¼QôÄ$yk´Qûø¯ö\nãÕO-ØÓ©wìÀT:EÉd³¾)ÂmV5ãcòé5}4Onb¸G,Ð³æ¬¦ùß×4Eçù¬9«dÎ*»ÈG¨d²âE?Z=èÑZâÂ§>Bé¾\\P¼+tÙ#àì0¨;ZhýiAs¹9Òm3ùÑ~f°LU¯¥êP83& pÒÃVÝjÎã=6NG«ÕÕsM@2Âk5eLGÍìÞZ½îúAë}¹ÅLuæjð-$ôÎNEÛÂ¢¥Ô²Ð_K¯Àåä õHÜ÷RFnÒcå§T~åÝS÷t1Ím×,Ûk+®§ãiD.ÜL¹0àòØ>e_·3\Zô)¶i4[Ã×*lä=çÎ\\Ý5#4ë¸øÉÍxúÊTIÇÉ¥¡?$³Ì¸}$¢¦§ÒýÇDbîPC¬çÝ@[µÖT{üDÉµ+åôWÞÉx2Á#Y0ua.Ub=!XuØHïGãcçÎù-òUeÀ1rmÍ1á¹àÎ¬¸®GÑxßQDgZÞ(ùdÂu{M\'·ÍtsWf¹ÃP9éÄ·îÛÔD.i\\ êÖ´çwÉçXeyß`¦îÍ\\×^åº¢[âäBZ¶AM1¶PËFMj§Xä[fÑqÚ·ÁfÔªbUWêÞÖmvx\"¿ÕêJ¡©Â¯Õ+É4èÑUv¹/9\'÷AÅïzAÍJ?(yu¯RjùÝz©ëûõêÀ¯Vú½ÚC0âª®=ût±|o¯Ç·ÞÝÇ«RûÜÅe¦ëà²Öïî«µâw÷Ë<hÔíz»×(µëÝaÉë÷Z¥vÐèú Ùö¿Õ>t#\röºõÀkZ¥F5J^£¢è·Ú¥¦W«u½f·5ðº¶¯¾WæÕ¼vþ\0\0ÿÿ\0PK\0\0\0\0\0!\0\'v\0\0Æ\0\0\0\0\0word/settings.xml´VßoÛ6~°ÿÁÐóY²¬8BÂvæ%E¼u=S\"má¤ì¸Åþ÷)Ñr¢pZäÅ¦î»ûîx<ÞñÝû\'Î;¢4b\ZÄÃ`@D)1ÛiðùaN6H`Ä¤ Óà@tðþú÷ßÞísM5=\0\n¡s^NÊ:\"]V#}!k\"\0ÜHÅOµ8RM×ÈÐ2jQ2fAG#§A£DÞQJj¹1Ö$\r-I÷ç-Ô9~[Y6ã<F0A\n]ÑZ{6þ³l\0Vd÷£Mì8ózûxxÆv÷Rá£Å9áYZÉh\rÄÞqúèèû|w[tT`Ýê4òñëYI^Ç1é8\"°<å¡øu<Ùö³æ@c«W±$>¯µEUH«È2×5>Òx#ÍÎ©º§Bª½]Éð2¿Û\n©PÁ (þÀEg!öÏ-ÉÛ<×Ð#¾HÉû¼&ª\rf<\"`²A\r3¨XYÊAIR¨4D­kTB\r/¤0J2¯åßÒ, ((ñÎÂu~µn»XÄ!ìgg%1´}Þ(z~~­óO]~ëHB7U®µ90²à×ô	ü¡Ñ£ë;¿Á Âzþüp¨É Ó@ÞÈ;%£õ*%ÕÀpÎoæn6DYAùP%÷.Ï·aboä·Ñä_Pû5z²|Kc$¿=Ôäú×NÒÕ{tZ¾0±öOR£ê0&m¤=¹Ì²Ù(ý2[$Wñ¬óßyå¹cÿ(¿²¥;à­ÅñBQ4XÙAYB=Î©ðxA SdÝÃÐ1¶$zÀ%çêúlÜ­Úö¼ú®úÈ#í1Dý¥dS·è^¡º-I¯§igI¹§ÜËuS¬½þw5Ü)§>=ûÜÀ»«}\\©8]\"ÂÙg{¸Å¶HxwßUSk[dêº-®bOF·­/Ï#÷QlK´û@¥Ý(hw^xÙÞÈËF½,õ²´½lÜË2/Ë¬¬v¢°1¿´òdLî	¾íñ¢6	ºB5¹i[?TlÝ,Ð]N`HL\r¼:k9B<L2kÞi3ty¦k1«\\?g°ó´»ÙÑ3cWñßÄbGRI¡:×^ôæ¢\rQ\r]¡¡d¤òØÓËòÎÎÀ´\'Ù(ÅÝ(Çn×8àÜ?Íi;Ì[Ó¯Ãy\'³e&óùe&«pr3EÜ\\¥óx6ÿ×ÝYÿ\0¿þ\0\0ÿÿ\0PK\0\0\0\0\0!\0{×¢¨\0\0Os\0\0\0\0\0word/styles.xml¼]sÛºï;ÓÿÀÑU{ÈòxsÆqÚS;Ç\'²k$Ô ¡Tl÷×\0)	òÜú&±(í/Þ%Òo¿?§2úÅóB¨ì|0z0x«DdóóÁÃý·wQQ²,aReü|ðÂÁïþúßÎòEò\"Ò¬8KãóÁ¢,gÃa/xÊ÷jÉ3ýæLå)+õË|>LYþ¸Z¾Uºd¥\n)ÊááÁÁxPcò.5Qñ*åYiã9¨²b!ÅöÔö¤òd«ÞéTV¼lP*â\\jV¾×;S÷È¢tøèÀþÊ-à8qÌq5c¨#]Hpñ#ÖP$e²@Q×ã:4±¬dV,\\\"Çuêd{IÍ¥ñÙõ<S9JMÒªGZ¸ÈÍ¿zÿÍöOþl·]|Ò^HTüÏØJyßåõËúýïÊÊ\"z:cE,Ä½î n%ºÁ«¬ýgEyQÖøæÂüÑøN\\ÎæÏ\"¡iñç~ûçÃjSñßÍÍKÓ©meóõ6½»xp;g7=LÌ¦©nJ9w}cGÇgRÌY¹Êub0¯,¡Êyr©÷?+&ÍõÀTÿ;Ãµ|ýÊörÉba;Åf%×ib4>0=Âd¥Ãë?VF<¶*UÝTÿo°C Î:Lª¦ßå³?òdRê7Î¶-½ñáú.*×ië|ðÑ¶©7Nx*®DðÌù`¶	ÿ¹àÙCÁíö?¿ÙÔSoÕ*Óí,Eòõ9æKÈô»3~7Ò|z%¶Ûðÿ¬a£Z¶¦øg&G£×Û}âÐDÎÞ63W¯öÝ~\nÕÐÑ[5tüV\r¼UCã·jèô­\ZúðV\rYÌÿ³!%úÀa?Ô}ÑÙÐÐUÐÐÏDGs<óÍñLS§T±o:ýÈ3ÛÛ¹ûaÜý0îþ#@wÂãîÏïaÜýé<»?{q÷\'k<·ZjE×ÚfYÙÛe3¥ÊL<2ÞÞ4i-qixæ Çs$ÀT­>÷¦ÅÌ¾Þ?C¬IÃç¥©#5fbnJÞçÙ/.ÕG,I4s]yF$dNç|ÆsÅrbÓAM%e«tJ07lNÆâYB<|k\"IRØLh]?/IÁ¤NY«þ]S,?Ü¢ÿXHôy%%\'b}§bÕ¿6°þ¥Åô¯,¦aàhF5D5h¤j\ZÑÕ4¢q«æ\'Õ¸Õ4¢q«iDãVÓúÛ½(¥MñîªcÔýÜÝ¥Tæ¢Dï~LÄ<³ge{ês¦ÑËÙ<gËEdÎj7cÝ}Æ¶óY%/Ñ=Å1mC¢Z×Û)bÎelÕ@whTæÚðìµálÃëo±[½L6´+zf²¦µ¤N¦0¹ª´ýÝÆÊþ3lko\"/ÈlÐ%ÁßÍrÖÈIù¶½ìß±-«¿­^g%ÒîÕH^J?Ò¤á«%ÏuYöØôMI©xBG¹ªækùC+I\'ËMV[+í ºê×·3D·lÙ{î$n_ß¥LÈnqu{Ý«¥)3ÍÀÐ\0?«²T)³>ø·|úw^è\"8{!ÚÛ¢ÓCv)2I%D$½Ì 9ZÞ?ùËT±<¡¡Ýå¼º¨äDÄ	KÕ¢À[:/>éüC°\Z²¼±\\óBT¦º\'9§\rÕôß<îê¾«äÌÐ«Ò´K]Më¿LØÁõ_\"X5õáÁÌ_ÝÁõßÙÕÎ^JVÂ{	5Gµ»kõþö/þj*­$Ý\0®d#¸\r¡«4+(÷ØòwØò¨÷pÊXÁ)9ËûG.21,J	£ÁÂ¨4°0Rúß¡ãÀúß¦ãÀúß«SÁ\0jþ®ò80ªyfaTóÌÂ¨æQÍ³£/Íô\"îã ©æ¤;Ðd%O*gùò«äsFp´¢Ýåjf-QYu7Ò£í\nG%òO>%ëaQöà(R)¢skÛÜ½wm_}¤wî$ùBÉç}òÇêzyR=ñºû¶N{Þù¢&ÍÙ~3>Ø¹.ØwÂö7Ø4æãõÃ/Ma·<«tÝQø0Åø¨{°Ñ;ÁÇû·+È°ÍñþÈí*y\'ò´c$lóCÇHëÓÈ6?|aùcãD8m?\ZÏ3ùNÛfÑ&¸±Ù¶´l§m³hÇ*ÑE«PnñÇw3?ã\"?c\'?¥³¯ü6ýà¿9²c¦mos÷ÈûvÝ)sþ¹RÕyûNÝêºÖ§¬àQ#ç¨û«,ãÇÎéÆèwüÎ	Èè¼á¨ä§tÎM~Dç$åG ³<\"à²Çe+­ %$[õXø~Ú¨6j2*2*¤ \nh£BÚ¨p3*ÇÆRB\n)h£BÚ¨6*D \nh£®í½áAF´Q!mT@Õ®{Æã\nãC\n)!F´Q!mT@\"ÐF´Q!eTdTHA\"ÐF´Q«G\rÃ\nãqFñ!F£B\nÚ¨6*D \nh£BÚ¨2*2*¤ \nh£BÚ¨öba£ÂxQa|Q!%Ä¨6*D \nh£BÚ¨6*D \nÂ\n)h£BÚ¨Ñ6?ëK¾ÛìGø³Þ;ö»_ºª;õÃ}ÛEuG­{åguá³RQãG¶ÞèS)=Eí¹¬îrí-¨\\¶?áãÒ{~éRý,½f\nàÇ]#Á9ã¶)ïF\"ï¸m¦»`ÕyÜ}ÝHp<nKºÖëRôá·¥\'xä	oËÖN8â¶íÂnËÌN à¶|ìD&9¿>é8NãÍý¥Ð6Â©Ð6-¡VëtÑU4?¡«z~BWý^^X?\n­°&5´Vêp£ú	X©!!Hj	\Z¢¥¨0©abÄJ\r	X©Ã³$5ÀK\rQÁRCTÔðP\Z°RCVêd/&\\j\n\Z¢Â¤;¬Ô\Z°RCBÔ\0.5DK\rQaR*-5$`¥¬Ô$5ÀK\rQÁRCTÔö,ÊÔ(pÜ\"Ì	Ä@\\rvª%\':°ZrÕÔj­9®ZrEóºªç\'tÑO@ééÅàõ£Ð\nûQaRãª¥&©Ãê\'`¥ÆUK^©qÕR«Ô¸j©Uj\\µä\ZW-5I«¤OÎ~BÔ¸j©Uj\\µÔ*5®ZòK«¤ÆUKMRãª¥&©{½p©qÕR«Ô¸jÉ/5®Zj\ZW-5I«¤ÆUK^©qÕR«Ô¸j©Uj\\µä\ZW-5I«¤ÆUKMRãª%¯Ô¸j©Uj\\µÔ*5®ZºÕ!à+ &)ËËîûâ®X±(Yÿ/\'|Èr^(ù\'í®Þ örø´óóWmÛO¾Ôcf¾Ýy\\)©¾¶Ú^\'©2Á¦\'QýëaõfÛáúrmÕ¢\rMÅÝV\\w§©ú;h7QÙo }Ý°çjmG¶pýézH·ãU}ng´Zû]	ßÒgkÖ1ª<ãëàÇ:	ìë¡îÏTV?¦ÿ¸Î\rxª.¬êiòÌ*~ÿKyËªO«¥ÿ£ÏÊêÝÑýÊWïO«oßóÆç6M{ÃÝÎT/ëmówõ}üõýÞ)irQÃpÛYúô¶oë¿Oÿ\0\0ÿÿ\0PK\0\0\0\0\0!\0ï\n)NN\0\0~\0\0\0\0\0word/webSettings.xmlÓ_kÂ0\0ð÷Á¾CÉ»¦Ê)VaÇ^Æ`ÛéÕ%¹«îÓïÚ©søb÷ÿ÷ã.!óåÎÙäô¹\rS×X¿ÉÅûÛj0	EåeÑC.ö@b¹¸½7YëWORÂ§Ìé\\T1Ö¤+pXçÍS§a#\nÛz ÑÕ*µ±&îå8M§âÀk,K£áõÖ]¼`YDO©é¨5×h\r¢¨ëqöÇsÊø3º»Ñ	Ë8äbuÒnäì/0é/©]?cv0$G;¦èçLO)Îÿ%sPª2>Þ«lcUT¢ê\\~IMNÜÞµwätö´ñÔÚ²Ä¯ðÃ%Ü¶\\ÛuCØuëm	bÁëhùû\rAí²²çGÈ?¿fñ\r\0\0ÿÿ\0PK\0\0\0\0\0!\0¸²c\0\0\0\0\0\0\0word/fontTable.xmlÜÛÛ0ï}£ûeç°©Ygé¶(^,ÛPd9ÕÁh8yûd\'\rÀºÐBë[þGóyæ·æáñ U²¤5%É&$Âp[I³-É÷×õÝ$à©²Fä(<®Þ¿{èÚ\Z	æ(4/Iã}[¤)ðFhÛ\nÁÚ:Í<¾ºmªû±kï¸Õ-ór#ôÇ4§tA{ÅÖµäâ³å;-ù©\nÖ@#[8Ñº·Ð:ëªÖY.\0°g­zfÒ1Ùì\n¤%wlí\'ØÌPQDazFãJ«_ù8@~XpqÇX3/9²\ZÇY9²ºàü^1\0¨|Õ¢ä\'_ÓË<k4D1®¨ùwÔÁ#Í/[cÛ($á_OðÇ%îØxÄ¥8D=´@VÃ($]aÆÌOLÉ1Ð2cAdÛ3UìaMç4ôÓ;IÃFÞ0\"@ú´k¦¥:Tè$@h¥çÍIß3\'CÕ}ä;ØÐ<Ï(Í×kÒ+Vç;Ý?\rJ¾¯2=+4(<râkÖsxä÷à7ÓÞ+\'>bYêOtôND7þ¬ôÊTîó¿âÃ«Ôo¢K^¬fæ#9:2ÅÓ1\'d:Ê¹ÿ#Ã$_å¶ñ7\'%ÌÇ:)ÃV?\0\0ÿÿ\0PK\0\0\0\0\0!\0¯ª(Ç\0\0ý\0\0\0docProps/core.xml ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0±NÃ0w$Þ!ò8i BQJ:Q	\"±¯­iâX¶Û´Â\n ^(¯´)Øî|ßýwþíx´É3g\rJóB$(ð|ä ãb ûéØ½@6D0´FééILeD·ª íX%¡#*´0FFkºhÏÂgÊ±©cIèÌ|s0Cp-èÊNí$í$åJe\0£2ÈA/ÀÖÊõÑ¦òÌ¹ÙJ8î½Ñ¼Ë²ôÊ°Aíþ~ÜÜ5Wu¹¨½¢ÒÑÈpA\ZãCh#½z~jÚã.±1U@L¡Òê­ú®Þê£z­>«/¾7ì¾^;¿mY(¦­J/³MÆ¾g;£w`éh3±<ãÀ.·ÇÇýÅêNk^ÿtÐ]\ZïLoWæX³¢ÖÚ}å!¼ºQ:ð¡ë»a0õQF¾ÿToÙë?æ»þ¯xÖWÜ´Fõ?lú\0\0ÿÿ\0PK\0\0\0\0\0!\0z\'m\0\0Â\0\0\0docProps/app.xml ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0RËNÃ0¼#ñï­Ó\0U[W¨âÀKjhÏ³I,Û²Ýþ=!>íÌzG³cÃê½5ÙCÔÎ.Ùl³­r¥¶õ½wÅ$m)³¸d\'l%ÎÏà%8!iIØ¸dMJ~ÁyT\r¶2N©m©S¹ÐÊD0ÔÜUV¸qêÐ¢M|çWßÚËY¯¸8¦ÿNuþâ®8yÒP`ëL(ºI|  pIB·(fD\0^d±ãúö.Q\\ïX72H(:1¿>pë½ÑJ&ÊT<j\\tUÊ?fÝ8ðñ ó[T ÓIäÀÇ´ímôÙ\n²Ò7_Þ[%\r®imQIøk×ziIé½ÅW_¸MÃ×Èor´ã^§fë¥\"ùxÛQ¶ÄbIö÷ôÁtò4kk,¿ïümtùíú/)fWÓÎg`ß­=üñ\0\0ÿÿ\0PK-\0\0\0\0\0\0!\0ß¤ÒlZ\0\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0[Content_Types].xmlPK-\0\0\0\0\0\0!\0\Z·ï\0\0\0N\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0_rels/.relsPK-\0\0\0\0\0\0!\0ãQ¢<\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0³\0\0word/document.xmlPK-\0\0\0\0\0\0!\0Öd³Qô\0\0\01\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\n\0\0word/_rels/document.xml.relsPK-\0\0\0\0\0\0!\0¶ôgÒ\0\0É \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0word/theme/theme1.xmlPK-\0\0\0\0\0\0!\0\'v\0\0Æ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Y\0\0word/settings.xmlPK-\0\0\0\0\0\0!\0{×¢¨\0\0Os\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0word/styles.xmlPK-\0\0\0\0\0\0!\0ï\n)NN\0\0~\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0o#\0\0word/webSettings.xmlPK-\0\0\0\0\0\0!\0¸²c\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ï$\0\0word/fontTable.xmlPK-\0\0\0\0\0\0!\0¯ª(Ç\0\0ý\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\"\'\0\0docProps/core.xmlPK-\0\0\0\0\0\0!\0z\'m\0\0Â\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ú)\0\0docProps/app.xmlPK\0\0\0\0\0\0Á\0\0},\0\0\0\0','C:\\\\Test\\\\keeping _afile.docx'),('cdc',_binary 'calming tune slow speaking \r\npause before important \r\ndoesnt look at the screen \r\nthe presentaion \r\njokes ','C:');
/*!40000 ALTER TABLE `manual_exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor_subject`
--

DROP TABLE IF EXISTS `professor_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor_subject` (
  `professor_id` varchar(45) NOT NULL,
  `subject_id` varchar(45) NOT NULL,
  PRIMARY KEY (`professor_id`,`subject_id`),
  KEY `professor_subject_idx` (`subject_id`),
  CONSTRAINT `professor_subject_professor_id` FOREIGN KEY (`professor_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `professor_subject_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor_subject`
--

LOCK TABLES `professor_subject` WRITE;
/*!40000 ALTER TABLE `professor_subject` DISABLE KEYS */;
INSERT INTO `professor_subject` VALUES ('209146943','01'),('315730176','01'),('209146943','02'),('315730176','02'),('315730176','04');
/*!40000 ALTER TABLE `professor_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `question_number` varchar(4) NOT NULL,
  `subject_id` varchar(45) NOT NULL,
  `id` varchar(6) NOT NULL,
  `question_text` text,
  `professor_full_name` varchar(45) DEFAULT NULL,
  `professor_id` varchar(45) NOT NULL,
  `correct_answer` varchar(2) NOT NULL,
  `answer1` varchar(45) DEFAULT NULL,
  `answer2` varchar(45) DEFAULT NULL,
  `answer3` varchar(45) DEFAULT NULL,
  `answer4` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`question_number`,`subject_id`,`id`,`professor_id`),
  KEY `question_professor_first_name_idx` (`professor_full_name`),
  KEY `question_subject_id_idx` (`subject_id`),
  KEY `question_professor_id_idx` (`professor_id`),
  KEY `question_id_index` (`id`),
  CONSTRAINT `question_professor_id` FOREIGN KEY (`professor_id`) REFERENCES `professor_subject` (`professor_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `question_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `professor_subject` (`subject_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES ('001','01','01001','1 + 1 = ?','Daniel Armaganian','209146943','2','1','2','3','4'),('002','02','02002','What is the time complexity of merge sort algorithm?','Daniel Armaganian','209146943','2','O(Logn)','O(nLogn)','O(n^2)','O(n)'),('003','01','01003','solve for x:\n4x + 2 = 6\nx = ?','Daniel Armaganian','209146943','1','2','1','3','4'),('004','02','02004','Which of the following is not an OOP question?','Daniel Armaganian','209146943','3','Ruby','C','C++','Java'),('005','01','01005','Calculate det of mat M\nM = {{1,2 3}, {4, 5, 6}, {7, 8, 9}}','Daniel Armaganian','209146943','2','-4','-6','12','31'),('006','02','02006','How many bytes is an int?','Daniel Armaganian','209146943','1','4','1','64','32'),('007','02','02007','What is the time complexity of Bubble sort?','Daniel Armaganian','209146943','3','O(logn)','O(n^loglogn)','O(n^2)','O(1)'),('008','04','04008','What is the general formula for alkanes?','Tzahi Bakal','315730176','2','Cn+2n','CnH2n+2','H2O','Olives'),('009','04','04009','What is the difference between an alkene and an alkyne?','Tzahi Bakal','315730176','1','double bond and triple bond','both single bond','both triple bond','both double done'),('010','02','02010','What do you prefer:\nComputer science or lawn mowing ?','Tzahi Bakal','315730176','2','Computer Science','Lawn Mowing','Neither','Both'),('011','01','01011','123456789 + 987654321 = ?','Tzahi Bakal','315730176','1','1111111110','347','135000000004','24'),('012','01','01012','What is the derivative of the function f(x) = x^2?','Tzahi Bakal','315730176','4','f\'(x) = sqrt(33)','0','f\'(x) = 11x','f\'(x) = 2x'),('013','01','01013','Is math good?	','Daniel Armaganian','209146943','4','YES!','NO!','Maybe?','Lawn Mowing is better');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_course`
--

DROP TABLE IF EXISTS `question_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_course` (
  `question_id` varchar(6) NOT NULL,
  `course_id` varchar(45) NOT NULL,
  PRIMARY KEY (`question_id`,`course_id`),
  KEY `question_course_course_id_idx` (`course_id`),
  CONSTRAINT `question_course_course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `question_course_question_id` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_course`
--

LOCK TABLES `question_course` WRITE;
/*!40000 ALTER TABLE `question_course` DISABLE KEYS */;
INSERT INTO `question_course` VALUES ('01001','01'),('01003','01'),('01011','01'),('01013','01'),('01003','02'),('01005','02'),('01011','02'),('01013','02'),('02002','03'),('02010','03'),('02006','04'),('02007','04'),('02010','04'),('02004','05'),('02010','05'),('04008','07'),('04009','07'),('01012','08'),('01013','08');
/*!40000 ALTER TABLE `question_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_exam`
--

DROP TABLE IF EXISTS `student_exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_exam` (
  `exam_id` varchar(45) NOT NULL,
  `student_id` varchar(45) NOT NULL,
  `grade` int DEFAULT NULL,
  `correct_answers` varchar(45) DEFAULT NULL,
  `wrong_answer` varchar(45) DEFAULT NULL,
  `comment` varchar(45) DEFAULT NULL,
  `isConfirmed` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`exam_id`,`student_id`),
  KEY `student_id_exam_idx` (`student_id`),
  CONSTRAINT `student_id_exam` FOREIGN KEY (`student_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_exam`
--

LOCK TABLES `student_exam` WRITE;
/*!40000 ALTER TABLE `student_exam` DISABLE KEYS */;
INSERT INTO `student_exam` VALUES ('010101','068798452',100,'1','','fine','1'),('010101','123456789',100,'1','','fine','1'),('010101','159753684',0,'','1#2','fine','1'),('010101','252525252',0,'','1#1','too bad','1'),('010101','500000000',100,'1','','fine','1'),('010104','068798452',45,'1,2','3#3','fine','1'),('010104','159753684',100,'1,2,3','','fine','1'),('010104','252525252',45,'1,2','3#2','ok','1'),('010104','500000000',45,'1,2','3#3','fine','1'),('010205','068798452',66,'1,2','3#3','fine','1'),('010205','159753684',67,'1,3','2#3','fine','1'),('010205','252525252',100,'1,2,3',NULL,'great','1'),('010205','500000000',67,'2,3','1#3','fine','1');
/*!40000 ALTER TABLE `student_exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_grade_toremove`
--

DROP TABLE IF EXISTS `student_grade_toremove`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_grade_toremove` (
  `student_id` varchar(45) NOT NULL,
  `exam_id` varchar(7) NOT NULL,
  `exam_grade` int DEFAULT NULL,
  `exam_comment` text,
  `isConfirmed` int DEFAULT NULL,
  PRIMARY KEY (`student_id`,`exam_id`),
  KEY `student_grade_exam_id_idx` (`exam_id`),
  CONSTRAINT `student_grade_exam_id` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`exam_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_grade_student_id` FOREIGN KEY (`student_id`) REFERENCES `student_question_remove` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_grade_toremove`
--

LOCK TABLES `student_grade_toremove` WRITE;
/*!40000 ALTER TABLE `student_grade_toremove` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_grade_toremove` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_question_remove`
--

DROP TABLE IF EXISTS `student_question_remove`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_question_remove` (
  `student_id` varchar(45) NOT NULL,
  `exam_id` varchar(45) NOT NULL,
  `question_id` varchar(6) NOT NULL,
  `answer` int DEFAULT NULL,
  PRIMARY KEY (`student_id`,`exam_id`,`question_id`),
  KEY `student_question_question_id_idx` (`question_id`),
  KEY `student_question_exam_question_idx` (`exam_id`),
  CONSTRAINT `student_question_exam_question` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`exam_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_question_question_id` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_question_remove`
--

LOCK TABLES `student_question_remove` WRITE;
/*!40000 ALTER TABLE `student_question_remove` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_question_remove` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `subject_id` varchar(45) NOT NULL,
  `subject_name` varchar(45) NOT NULL,
  PRIMARY KEY (`subject_id`,`subject_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES ('01','Mathematics'),('02','Computer Science'),('03','Physics'),('04','Chemistry');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `role` varchar(45) DEFAULT NULL,
  `isLogged` int DEFAULT '0',
  PRIMARY KEY (`user_id`,`username`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('068798452','Yana','nana','yana@gmail.com','yana','123456','student',0),('123456789','Almog','Kadosh','almod@gmai.com','almog','123456','student',0),('147852369','Barak','Obama','obarak@gmail.com','barak','123456','student',0),('159753684','Dana','Cohen','dana@gmail.com','dana','123456','student',0),('209146943','Daniel','Armaganian','daniarmag@gmail.com','daniel','123456','professor',0),('252525252','randa','rousi','r@gmail.com','randa','123456','student',0),('315730176','Tzahi','Bakal','tzahi.bakal@gmail.com','tzahi','123456','professor',0),('319003935','Matan','Czuckermann','cz.matan@gmail.com','matan','123456','head',0),('500000000','Guy','Edri','guy@gmail.com','gutadri','123456','student',0);
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

-- Dump completed on 2023-06-11 20:33:45
