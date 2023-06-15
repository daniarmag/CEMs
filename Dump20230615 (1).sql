-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cems
-- ------------------------------------------------------
-- Server version	8.0.21

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
INSERT INTO `course` VALUES ('01','Algebra1','01'),('02','Algebra2','01'),('03','Data Stracture','02'),('04','C Programming','02'),('05','OOP','02'),('06','Physics1','03'),('07','Organic Chemistry','04'),('08','Calculus1','01'),('09','Software Testing','02'),('10','Logic Gates','06'),('11','Circuit Analysis','06'),('12','Electromagnetic Fields and Waves','06'),('13','Control Systems','06'),('14','Anatomy','05');
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
  `head_of_department` varchar(45) NOT NULL,
  PRIMARY KEY (`department_id`,`head_of_department`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('1','Software Engineering','319003935'),('2','Information Systems Engineering','398765432'),('3','Industrial Engineering','224466880'),('4','Electrical Engineering','321455555');
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
  `isActive` varchar(3) DEFAULT NULL,
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
INSERT INTO `exam` VALUES ('01','01','01','010101',1,60,'Don\'t forget to do something!','Don\'t forget to do nothing!','Daniel Armaganian','209146943','8520','0','Computerized','Algebra1 2022'),('02','02','05','020502',1,60,'Yes	','No','Daniel Armaganian','209146943','1234','-1','Computerized','OOP 1921'),('03','02','04','020403',2,120,'Don\'t forget to free memory!','Don\'t forget to give a factor!','Daniel Armaganian','209146943','0010','0','Computerized','C Programming 1936'),('04','01','01','010104',3,45,'Good luck!','Make a lot of noise during the exam.','Tzahi Bakal','315730176','0110','0','Computerized','Algebra1 2020'),('05','01','02','010205',3,10,'','','Daniel Armaganian','209146943','1234','0','Computerized','Algebra2 2031'),('06','01','01','010106',4,90,'Good luck!','','Daniel Armaganian','209146943','3q4k','-1','Computerized','Algebra1 2000'),('07','01','08','010807',1,20,'','','Daniel Armaganian','209146943','zqq9','0','Computerized','Calculus1 2012'),('08','01','02','010208',0,30,NULL,NULL,'Daniel Armaganian','209146943','6565','0','Manual','Algebra2 manual'),('09','06','13','061309',5,60,'Before providing your response, \nplease take the time to carefully read each question.','A test on the basic knowledge of the course.','Daniel Armaganian','209146943','1111','-1','Computerized','Control Systems 2023A'),('10','05','14','051410',6,90,'GOOD LUCK !','','Noa Kirel','333444555','2222','0','Computerized','Anatomy 2022B'),('11','01','01','010111',8,90,'Before providing your response, please take the time to\ncarefully read each question.','Please note that this test does not include a formula page.\nBasic level test.','Noa Kirel','333444555','1122','0','Computerized','Algebra1 2022A');
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
INSERT INTO `exam_question` VALUES ('010101','01001','100'),('010104','01001','10'),('010104','01003','35'),('010104','01011','55'),('010106','01001','33'),('010106','01003','33'),('010106','01011','28'),('010106','01013','6'),('010111','01001','15'),('010111','01003','15'),('010111','01011','10'),('010111','01025','10'),('010111','01026','15'),('010111','01027','15'),('010111','01028','10'),('010111','01029','10'),('010205','01003','33'),('010205','01005','33'),('010205','01011','34'),('010807','01012','100'),('020403','02006','50'),('020403','02007','50'),('020502','02004','100'),('051410','05019','15'),('051410','05020','20'),('051410','05021','15'),('051410','05022','15'),('051410','05023','20'),('051410','05024','15'),('061309','06014','20'),('061309','06015','20'),('061309','06016','20'),('061309','06017','20'),('061309','06018','20');
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
  `date` varchar(12) DEFAULT NULL,
  `time` int DEFAULT NULL,
  `actual_time` int DEFAULT NULL,
  `students_total` int DEFAULT NULL,
  `students_completed` int DEFAULT NULL,
  `students_uncompleted` int DEFAULT NULL,
  PRIMARY KEY (`exam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_stats`
--

LOCK TABLES `exam_stats` WRITE;
/*!40000 ALTER TABLE `exam_stats` DISABLE KEYS */;
INSERT INTO `exam_stats` VALUES ('020502','2023-06-13',60,60,2,1,1),('061309','2023-06-13',60,31,3,3,0);
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
  `isApproved` varchar(3) DEFAULT NULL,
  `professor_id` varchar(45) DEFAULT NULL,
  `professor_name` varchar(45) DEFAULT NULL,
  `reason` varchar(150) DEFAULT NULL,
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
  `manual_exam_file` longblob,
  PRIMARY KEY (`idmanual_exam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manual_exam`
--

LOCK TABLES `manual_exam` WRITE;
/*!40000 ALTER TABLE `manual_exam` DISABLE KEYS */;
INSERT INTO `manual_exam` VALUES ('010208',_binary 'PK\0\0\0\0\0!\02‘oWf\0\0¥\0\0\0[Content_Types].xml ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0´”\Ëj\Ã0E÷…şƒÑ¶\ØJº(¥\ÄÉ¢ehúŠ4NDõB£¼ş¾\ã81¥$14\É\Æ \Ï\Ü{\Ï1ƒ\ÑÚšl	µw%\ë=–“^i7+\Ù\×\ä-d&\á”0\ŞA\É6€l4¼½L60#µÃ’\ÍS\nOœ£œƒXø\0*•V$:\ÆB~‹ğû^\ïK\ï¸”§Úƒ\r/P‰…I\Ù\ëš~7$²\ì¹i¬³J&B0ZŠDu¾t\êOJ¾K(H¹\íÁ¹xG\rŒL¨+\Çvººš¨dcÓ»°\Ô\ÅW>*®¼\\XR§mpúª\ÒZ}\í¢—€HwnM\ÑV¬\Ğn\Ï”\Ã-\ì\")/\ÒZwB`\ÚÀ\Ë4¾\İñ	®°s\îDXÁôój¿\Ì;A*Êˆ©\Ëc´Ö‰\Ö\04\ßş\Ù[›S‘\Ô9> ­•ø±÷{£V\ç4p€˜ô\éW\×&’õ\ÙóA½’¨\Ù|»d‡?\0\0\0ÿÿ\0PK\0\0\0\0\0!\0‘\Z·\ï\0\0\0N\0\0\0_rels/.rels ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¬’Áj\Ã0@\ïƒıƒÑ½Q\ÚÁ£N/c\Ğ\Û\Ù[IL\Û\Øj\×şı<\Ø\Ø]\éaG\Ë\ÒÓ“\ĞzsœFu\à”]ğ\Z–U\rŠ½	\Öù^\Ã[û¼x\0•…¼¥1x\Öp\â›\æöfı\Ê#I)Êƒ‹YŠ\Ï\Z‘øˆ˜\ÍÀ\å*Dö\å§i\")\Ï\Ôc$³£qU\×÷˜~3 ™1\Õ\ÖjH[{ª=E¾†º\Î~\nf?±—3-\ÂŞ²]\ÄTê“¸2j)õ,\Zl0/%œ‘b¬\n\Zğ¼\Ñ\êz£¿§Å‰…,	¡	‰/û|f\\Zş\çŠ\æ?6\ï!Y´_\áoœ]Aó\0\0ÿÿ\0PK\0\0\0\0\0!\0«*9®F\0\0\Ì\\\0\0\0\0word/document.xml\ì]_s£H’¿ˆûu~\ê‰q\Û@ñ×±\í	şv÷\í\ìNGw\ï\Î\Í#Fe‰5¢´€¬ö\Ä=\ì×¸ˆ»/7Ÿ\äª\n\0!X°›~hY Šª¬\Ì_fefeı\é§oó\0<¢(öqøî‚¿\â.\0\n=<ñ\Ãé»‹¿}uŞª N\Üp\â8D\ï.P|ñ\Ó\í¿ÿÛŸV7\ì-\ç(L\0i\"ŒoV\ï\İ\Å,I7\××±7Cs7¾šû^„c|Ÿ\\yx~\ï\ï}]¯p4¹8c-\"\ì¡8&\ï3\İğÑ/²\æ¼o\íZ›D\îŠ<L¯½™%\èÛ¦\r¾s#Òµv­n7$ôhˆŒPà·›‚›’¯i¯¶\Z{5DzµÕ’Ô¯¥šÁ\ÉıZ¶[Rúµ·[Rûµ´\ÅNóm\Ç’›÷8š»	ù\ZM¯\çnô°\\¼%\r/\ÜÄ¿ó?y\"mrrŞŒ\ë‡=zDZ·0‡“\Î-(\×s<Aœ\ä­\àw\Ë(¼É»~vı&}>ûX?‚v¯%¯Ó®Ñ·$ˆ“üÙ¨\r\í\ÒÇ­XÕ®#:\â0ù‹5:\Ìû¶Fn\ÎòF›ğ8òß­|KQ\ÛmV:\r›\Ût?›»yö¼¹Ek1›´‰õmºP~gŞ“9\á\àÍ‹{‘¦@\\¾%ø\ä\r[\r\Èj©,ò6Ô¬ko#İ´¿¥X\å\í¤³B\Ûñ7„\å[b`µ3…&\ËNM0\ïı ÚŠ\'\ÉdÖ­¹|®\é³n\â\Î\Üx-4´E\Ôm€Òº¹§yŞ‹\éó„\ê}„—‹MkşóZû¸\×5t:´•	g0\â\çu\æ\Ë\Ì]Ô{7§!Ü»€ôˆˆ\Z \Ò\Ø\Ğÿ	\Ó\Ñö\'úÆ®Ó¹¯.n‰…v‡\'OôsA\î‰77r?‡–#\ØP\Ô/\ØU¢\ßzU\Éş‘«7\Ä\Zœ|~wÁq†.ˆP^_²Ğ½»’\í;Ÿ\n—\Ø?E\ìış\Ä\'¿xt‰\Ú\à.®\é¥(»Ã¾Ü™1ûŒ\Ï…ôgñ\ïf\\¾v={½n=ı¯o{«›e~R<@Å—¬n’ÛŸ\é·$½\ÆŞ”S\áSDG«K²®òl´\Ç\ë\á‚O†\ä>p4—zE‰±=Á‚\ÎÉ’\ÆU&˜3-hHºú½LpT,o\â…\ë)ZD(F\Ñ#º¸ı«;G7 şŸ\å&\ä^ZKœ&¨üÎ…i/­wùÿj\ç0¹²¬\×wÁ—\ä)@ù¨øt \äò¯\äÒŠœ|&O2(w™\àõ\íŸ1~XOŠ¨³Ÿ\İûQœ|\Æ+\Úù\Z¸Ù·\ÍM\Ë9]n\ç÷ó\ì\'!ş`÷ú\Û\ß\Óo¬Ot0…N¿ü	ısJ>Ii_eM\Ó\Ö^N›ÈŸLÖ°Vb\Ä‡s\ĞV5K³›9ü+E›<mrŒk“Œ!¼ğ¾LZnó¯µØ•-j\á\É$#ûŠQXüNn©Io¿\çow¶^”\ßù¹úÂ¬‡\ÛOd7\ÊdÏ¥\ÃKÿ¯\'\r\ÇmˆS&M±ıöŒ4|\ÒPZd\Æ\Ø\äB6ù\æ\æ¤ËˆUQq¼j)\ê43e\ì¦\ÚÛ8Yi‹\Å®Ş\Åò¨&ƒõ©ı\åt\ä\ä\Ë\ç%5\ß6¸‘\Ãl¥…»\rª\æm®¡WP·¡7½V\åÕ¡Ê¢h²\Ş\ç\"‰L\ÄZ\Ùt«\Ë\Û(¦~\Åß«\ZI‡\ÍM\Ã+\"‡	}Ö=Ÿ,\0\ŞûñÌ¥dŸ\éa\\ü\î\Åù—VÚª…\âMÊ‚¢•9\ê‘bòe\Å\ïh¼(˜İ™­u2\Ê”õ²Ó‹÷N~+c\âö}\äNĞ\\e³ö|AQ¢ş4\Ìo\Ä\ËŠb/òIu\ÉlP\ï\Åû†\Ù3%ı\Õ»yÃ”TE®˜\ÌÇ«†¡QyÚƒİ›š#[\âMÁ”¥\î\â4\Ú(;õ\ë\ÍÉŒ\Î\İ\à\È t£M0h­»\á\ÅIõjÊ¿\Ï\ç\çN\ê\ïŒ†J\à_’Y€{\×Kv\åq\Ó\âµ!/y\Üq\ÓP\Ë\â—?\Ô\0üPL\Ü\r\Ãô#m 4%¨U,èˆ¢Ó«\Ï^»¥ˆ˜¢c\Ê\àr\\d°;®\İ^\ÇÚ³(œ\ÑÌ”\ã\Úm3\ÔÂ‹1Ÿ‘Gó6V8z\0o\æn‚\"\ß\r@\â.§³ø! ¿|ôñ2s@ÿp³ÃVY*ó:ÁƒºBÏ¿\":Š,˜Š \È=¨•²oËªJmèƒ‘pDû^RVoyvµzş¾\Ë\ê)\Íö3^€=÷n¸\ÑSõEı\Û\Üa¿\à{@\ìª\Ã1¼\ÍÙ’*[Í’²mÄŒúú0úZqDN4T¡™şß£¾®×ƒ2§Y†\æô	öMgXûJ\È{Gƒpo\î\Ûn/A\è\Î³e\èW—ß‹\ã{;¢£Ieh\Z¹ó/‰1÷\ß†ù¨ºÁk»`‡“\ì\É\Z¾\ä-G\Ô9…º›Gûl/ê‰¦a©ŠIŸ(R‹zkU“b\á1©UoŠõ\ÑV\Ï4\ÅÎ¨­r\Éù¤7w”q {;-\ã\àPü)/“\n8À¦Ğ„–‹(°ö]\Íüğ‹gBÑ¹‹¤©$¨@†¤5 \á¨pÉ€²‘¼#:u2\nÀ\Ó\àª!tB?\ÒgK©\Õÿª,óV¶.\\ûLx\Ş\á-®³\rœõx\\Ú±	\ÈBúÿ.ÒŒƒ¶IŠ9UÙ“\Ô`\èò’Á2\ç^¼¡Û˜\ÈY\ĞC•ñ?\Û,üx\Ü\ÉÄ§\Û#\Ü\0¬=y~–1š€7.ˆK÷r\í\ÇDA]—¹ı\Zñ0N€]j\à¨~Mª‚/S·¦\çF“ø\Ü¦ŸeWº´e@\Ç\Ç4\âQRM—©\ïCfÅŸŠj?ì›¬TL;¾vonó\"@nŒ€›$®7\ÄrH0ó¥>g°\ÜğªF¡n¯jDM\Ó\Í\Ìg4®jö@¶aB\ÉvhxZ¼$›ºh5f-¥¼À‰Š \Ğ\ÈM?.Jªv‘¥Ù\ÖÉš“\Í~6\ë1Ó‰ñ\Ü\ZJ^`/\è\è¦jv\Ï-²Yd¼®ó–\Ñ\ß\"KsEó‹g±\È\äX¬&½vU\Ö\ï|GL)\Ó\r\ßNp=$‹\ĞT¤zh$}…ô¿,P\ä&ş#jO}‘Û²i\î\ßh\ì…	\Ó4U\Ê§§\Ö\è\Û,ˆ\Î3¤\ämI,²ÿv-Çˆ e8A«\å\âG>J³\ã­±»É’\Ñ\r§,ğq\ï\ÎıÀw#b™/|/o*o\ÜI;Š®¦Wm\Ü,{šF/Hw\Éjn¾Œ}\ï`Ò»\È}DÁ`ùI‚B°ò“ S\n>‚\Çu\Ø;+£ÄŸ“‘\Ç\Ëmˆ,’ï€\Ë8¡˜ƒÃ”(d¼É’¼ô’, ó%´“/ÿ\\ú[YO\Ü}Ú´\Ï@\çhQ\ntdK\Ò\Î¥®\"uD€ªR±f´‘d\æ&ÀĞš»ü:&1¸ğ<c³K@úÑŸ\ç\Ø\ï\é2ÖŸ»Sòü0ó\ç\×3D\åL—dyK„,ÀI(\á“Ÿ¦cõ\á)‰°”añ•(•\ÈŠD–z#Oœ§(K¹a¼\"³ıO2\Õ¢\Ü\áeü¤ƒõ3\Ê)ƒªU\ÙW\Äñ†&üf\×¥¶dK’±\ÙÏš_–\ÆÛ°v…^ş9›\æ\ì\Ò8Í¦™ıQ\Ü@“OD\Ê\r¢!\Òe[½\Òb\\QU\×Å™\ÔlN°\ÒÀØ&b1\Ö\ÜûT-\ç\ßû^E>UÛ”UjCP[\æ8†ª?óğ{â°µ]wTPûU]i\ÕA?R|+1mHVt‚_B5k¢\Â[cœ²	j\Æ8\å.\é¹Ü•4Í‰Vlf\Êİ€—•z\É/¾\\\×\ÌvÍšn‹\Î\Åwû‰.”\È\ê(ö—“\Õ\ê\Õ\Ô8Ep„Š¡s¢\åĞ‹s\Ù\ÈP\×8›™ôE³Ú–©‰\éh	ÜŒ\Û^@Ô†	\ÛP:µÓ’5Ü˜®~˜\Öô©Ë‰-š\ìcN4½>un`£›\Ó]»[¹¥ÁŒıÁ\æv†\Ü ™={Œ\'—\ÕŞ¿\0º<}\Ì\âe·\ÈÈ£\ëbP\ÙGö¢JM(øfV\È]@Ä\âºOœ\Ïi:!\æO¿‰ü\élû*«z3LÀ˜‚7#~Ï¯\Í\İhJ‹j¦­ÿ\×²¾{wA7\é¡(¿øÛ»‹·<\Ç\Ë\ëNdz„|—	û\Å\Ï\î•¬üÖ½ÿ\re.\Öj\é*Ş®`v¹\Ğû\ÖlD²;JW­-\Û}¥«xQ\Ë\ÆWº¬qŞ–®ŠP¨»,Hµ—y¹ş²Z\Ûö®\Ë;Ú#\ìPYK”-\Ç\Ôµ;{¬¬µ±\Äv±´±C/–˜P\n>\ì44yhÛ†fõˆR\'©³•Q]g‹\æ\â\Ğm¾÷‰\Â\Ú\Ø\îâ˜¢e\ë\éUÉ´\Í>«°c\åğ¶^šyuE8jl\â\Ú\îM\ÔÀø\ê\Ï\Ë{\Ï\Z¹u=SLƒµ*Á±LS–#™£*0Ñ¡˜q/«\é^\â?úIy÷mÁ‘Y‡ 5:BCt³©’c¡cKv\ëœ\ãŞ¿$Õ‚M“\Ú;¿r\Ç\ĞşFM4|ş\Å\Æ}\0™-ZsOkxXò€ö¿Œ€|z@şK¾\ë\æ¯M\Ğd\Ä\å~‹º\àm%O,Q\ç\ì\Ş!\ìs\ãòó¹\Î$4Á/\Ñ\Ô\rı\ßS7\êz¾K*B®7ó\Ãi]\Ñ^\ì4² X:|F¾ùˆ€GªSó\â/wÿ@\Ô*E\àÍ¯~û©\Û\Õ@ ›0ú_y¶:C ›\ŞS\ÎV‘ŸúA –úŠ+~\\\êjü²p×µ†sx½Dr†\í\èº:¼õü\é\Ï\éq_e«´Ä…ô#ıñúm;\éa\n²••³\Î\'P5(\Ø\â¡NDHÁ\éû\nœ&\ÑD%9\rx^\\óu>“cú\ËN¤\è\ä\Ñ\åt\ÅM#c\âAB!ù$»QJ>\Éİ¿]¢K³\">\ãe\â‡u\Ë\Å*%%NwK\ê_	mH”¬¢lÈº&rTH^\ëÁ0-\Ét^\ÑÛ›WcX¤]\Ê /CI¨JºÀ+–\ÍK-xD\âC¢\Õz\Ä#­¦»g\\A\Ö%\Í\á­Ş¨&ˆ<g­O]SË†Z¶W¡f\ÓyŠ>P…\Ë_÷OÀG\ìŒ\Ã\År\á%]|\Ş\ŞE)Œ\Ü\nW\à^±½`Ox	<qŸ~\Z`G\ë\İ\ãğ\nüJ·¦ùtK,\ä&tGZ\à? l(m¶ğŠ\æp\Ğ\î‚¡\â%AÅªT%o`ÀQ\Ï\æ\â\ãr\ÂÏŒ\ÓSÆ¦‡yÖ²÷h6\í7›:LuY”ş\é$\Ïˆxùœ±4\Ì\ïJ“\Ö\Ä\"	ü\ë§E\Ë\â(ºÿø\×ÿ\Ì\éBD÷-‡T±]‚\ÙF\ËıôÇ¿şoOu°ó(c:,ªÇˆ|_\ß/ƒ€ü‘ ¢\â\"?¡c¡7\È8d\ßa7š\\U‡q\Öizü\0\Ä\ÔØ¡8\Å\êô­;^\îk#Võ]‹†£A\È÷–Óµ[tT\ä‡W\ä{´\î_R\Î)\×•][e\×-ú	A‡‚\Ù;úyx!:\îh\Èn\åÛ°\áŠaiÈ°´óhøg¡\Õ:ô\Ì\é8yÀøùhuˆ€±hZ/\í+\Ùx«\\®¦eWY°\Ä7ô#eº¨ıŠ\Ğn\è¶,j{Œ\ÆB–˜µS\ÌR\àeQ‚Ò€r\İ3®J\Ì=úhUƒ›[„\ä,[·\í\×ü\íª\Z\Æ`W;«K³5Î‚•¢\Ğmx\äEš¬[\Ã7u\ÓR\åJ\Í\ZYRe[77\åµvŠ\Èn\r(˜²e¯‹.œ&·<\×Ş´\ê»+\Érd²ªhJhª¶¤3?\à\êA™\Ó\nLV õ$JL\Öa²†«v38…\Ïó¯\Û)\ßvg\'ÿ\Ñ\\oÁ‚¢]ªzsú~¾\Ç\0?\Ò\n3´9]·Pœô\î©q†*›öq\ë_\ì‚G(MOr\ÈjVFòš‹vØŠ¤\ÈÇ­s±·\Ó1-¡zˆÖ‰M\Ë2VjBT	B\ÔYû<FªN©’TA’ƒª£„²\Åp•œ\é\rw°›ô^Z”„\Ç14„7ñ| \\”\ã´À3E¡€n//Alz˜L«²˜‚nCNz§¾†¨Nq;³°[€IQ\ä\ä¦±\èKp\Ú\ÖE˜¶$\nšŠ-:ƒ2Œ\ÑF›£Š\Â[¢¬+–)õvÆ%`\ØR;h\Â6!º\Æ\" gX’dõˆEŒ\Øğ”F!\ë\Zt¾w­\ŞQg¼ñ‡mi¹@\ĞZg¨†®+\ìD‡1>»Y½Kª\nEa\Ï6µq\îN~d\ëğfQƒ\ÖmC!¦$™¦\ÑÛƒğÚƒÖ¿,\Ë?~ó3r\'oı°Õ¡Y‚fjŠñš·\Ü*¦\"*\Ò{™ü†È›¢!8ökE\ÎPT\İdšıµ±½17&Z´¬\à©hª\ä\Ğ}Á\ÅL¨(\Ì\Îc\Ú\Ã#õ‡8È¢\ÍÎ\í\Ä#¬/0Ì5İ­T\×;X¤g.´!\'\ë\æóNH,Ee:¸‰‹‘o-õ{•XD\ìZ2œN­vn²¢[¦X\Ü)\İ\Ï\ã‚\ßğò\ëòz($\Î¸(±°\'\n\ÍI¦m3~ø\È\é6&\Úü[°bû.1\ÛM>*\Ã\Û{T\ìĞ‡\ë‡\0Gvˆg›±m—;}Y\â\Ä}\ÊY¶²y¶:¨\ã\çLjP5\Z¬ªƒd‘—9Ë¨drP0uKd6­^N\ï\Ëtô\î0°£ñ¢°>“uTLQL\Û*gF¤8\nüğD7>dôq\Â&t\æ\ÓSŸ(¶„Àe‹Og2\ïhi\Æ>\ämVq…¿p\È1øoğ!S\é÷/˜,–\ïqşì³»ÿ\éz\àÁÌ¹†\àm®dªL½\î~S\'\ÇÜ£ƒ.º\åA‹WuE«`Œ AÙ–µ‡¹\í\Æ\Å\æ}\Æ\ì^+¾¢|\Ñ\Û_\İ\Ä\ËÒ„R#,œ\ä\'3»ë³™¯\Úó{\ÏDE²yC²\é\æ\Z\Zª,¨Æ¦BT¹>l@\ë;s~6–YÁ\ÙL\n÷·}[Z\'Œ\Ø\Û{;–¬v8“úQ\Êò\Ø\ŞO\×\àƒ\é%^¬}Qf3Lf\Û#\Ôh¨k»±‘œ!òôø\Øş;\ÉÆ½\ÙG´Š\ëğ\å\à(\×’\Æ\Ë½%M\ê7|¥!~(ñĞ¨nË«ReÜ‚İ+;E³eIuS\Ğ\ÙW0,)\ëDRJ¿1`¿°\ß\á\ìFdñÄ¶Tİ·ñ§‰–¡÷TRøniœŸ\ç\æ£:\ÃnKShª\Î\Ûú«NL\Ùq\Ô›\Ñ_NÂ‡\"J†ªô¶¤_ÀEÕ„‚\Æü¯uˆœ H¼¬½fY”¡\Í\é\â«\Êi©šœm\ëÎD\Ò=DJŠ£\ØÔ‡øje‘3-S\ÚW®\ée+\r^ š¿÷Æˆ— ‹\ä™\Õ4{µÖ.[’õª†x\İ\Ú4f	¶‹qºj¨}p;Í†À\Õqw€ñ\Ğ0%\ÈÓ¾‡Ï‹\Zgˆ\Ï+\Ç^9o9¦KX•\ÃF’-µTJ{WCğ\Çr2f¥!^\rµTñfWC?ò\'\È\ê\ÔM\ZJ\Í5\î\Ş{a™3E!8jpÿS„\Ê\n\Â\0\'Ë\ìe\àôµKhQw?œ¾m\å\'Sy^Q¸ª»•È±¢q•’EI \\˜2I¸œ§·ı\à1¨¹÷q’_Ë«Ä¬¥\î\ÜRW\æ|I„ºTNE;}İ­<#:ñ“ =”š~!\\½\'óYQlû\Ìõ·hNsS9]ÑœÄ»·,Ûš<\Ù\\6Nx¬§·!=9„\åºÏŸ’YÙ¡=@\"^Ë½e§İ¥Eø¦ş#İ¡ˆ¾¹´\êT\ÜÌ¬!®p\æwò\Ş\Ş4vV\Òx\Û\Î\Û\Ù÷8˜\Üûñ\Ì\ÜG\\\0\ß* F\'`\æ8zºc\à\'yyÁVg’\É<\ÏzÕ›\Îk–ek<\Ã\è~ŠS„¢¬§5G\Å9š«\ÏB\Æ/»$ó\Zû6\Õ\ÍM`arsJa\ÍÓƒ\Åz7µ¾—,\É-–\Å\Û\Ôó‚Ô­\ç´\Ã[vOš?”wJ%3º\Í`EÀ0B`ŠYy\Õ\ì0(¦H›w\Ş\è:/\Êg\Ætº©Ÿ%w?°³¬W’\Öl—pP\ÖÕ“ñûÎ•\âP†Yø\à¡C™Å§jp÷\ä\Ç\ĞoY\ÓIQD£‘dQw«¼¥ªÖ£—3¿XPÛš.r,µ~\\\ïjû\ĞÏ†Š\Â	Š\Ğ\ä“;E\å6T¢\Ğ=7¤µLš¥‰—\Ï*³\Ô\Éº£;™RÄ€Ğ”FÙ¬\à‰ö\Ğ\ì\Ó\é?|SwxS\Ñ\Ô3¯¹ll^Á#Š\î\èÉ¢	\İMÑ·ç•›”$(\Z\ÒD\Ïv\å=”in6©B\íd\Ô\ÒO¬U\äQ\Ûw(j\ê®\Ä	‚y\æHÁO@+\Ñ#`‰´Ğ•A€\Ü(D“­Š\æM#\Év˜ŸŠ	\Ò\â\ê•uªôp\â_5J\ĞI%\Ãñ*v(sqÚö_˜ˆ,©–ó¼zCcdz\\3\ìc\Æ_g~€Z…]P4Ù¬\ìz\â™,ôòvqB.\İfVe\Éò\ã,‹óÍ¢\ã²ø{cñÛ¯›JW\ëc\ë™\×*&\\&ÁS““m\É2Oæ³¬¨üz™#²\"Z]\Ùrİ’ ¶\É$£½ß­jd.»4\Ê\Ü(s\ÇQ+\ï#¼\\\0\Ï(ñi9“m\ÏN‘y9KT¤“­Ë¨_g]g%n4½-M\æ*Å“No/V!¯tQw$Z\Üõ¬]d\"r\Ù\Ø\Í!Pò#@\ßK®\Ì\È†s\æ5[lœ>‹¹E1¿wË„F\rW~¤\Éó¥7s!0YFù)O\È\İsŞ¡Â‰¼|\æ@\ïG\Zm\ì¥j\ËğÜ½t	¥‡NI:\çS¦\æˆz½š½EºÂ›\Ê\Éü^·[u3G¾¬<X# ¨² œû|\Ğ7	\"òhT. ?HŠ®-€,1²(µ°‡#\î{¼‚<\Ç\ÛÊ™©8)Ş‘®S]r\àa§£f\0:­0İºC\'#ğ\Üh\î#<ó\'p\çNY\Î]b§IPkQJpz3Y5\ÖCPœ\à#\ãŒ\'–\â4÷\ã\Ä}@Ä‚Iµ>\Æ=¼¢6Kª»Z«‘\Õi,ºi˜†%ñ¶x\Şaî±³T\Ù\âOi	\ÜN&™­Øˆµ§%\İmn \Ä \áe0¡	\×4˜RÖ§“\'\Ì5õÜ¶9õ\Üa;Ğˆ)C`Køœ\Ó h«c9‘\Ü^­\×#ª*\ÊF£3l_²VM ¤@¡FÙ?ú¹\Î\è\çJ9…òÎ¸\Ñû u 5*Qq<KŠnófóÖ…£\×\"¥ÿ5%Àı^&º<L\İÿ¬0úøL\Ã~¨2C~ğªQqC[0t›õ)¹½¤.ù2ô=7Au\è\ßsV,\Ğ:ı\é[\n¦Ejn¬]”­;Z6¹\Z…£g\Ñh(CEµD­\Ì\í\ËDX\'8›\Ì\Ú1Z}Ø¢Ñµ\ÄNy\ãe\É0q·L\Ö\ÚÖ„\"\'È•½ñœj`{öLtC±ƒ\Ò\á\ãD÷Ğ«w©\í\ÑTğ!¹ı‘­\Ú:Teõe»Ÿ.ˆ¦\ÍJiI\Ò$(©-jéŸ¥v÷…•.ƒúh’Có\æ$(FŸ\Z3ûpgT0ıÅ¢=\î4ü²¥\Ô£\Æb\Ş\í0ŠwL‰\×\ÌsT»\Éy¤\ŞÔEx®÷¬¯³\Ê84¡#\Zû¨2$\Şd‰\ïÇn¥\×m™“tø:j oGÏ¯™ı\Ï\Ñ\nG5\nm\Ë\Ğ\ásœ\×Tü´½\Î.¶;Ã±tk\ëX\æ!h\ÆC°‘zV\ê#)—ûŸt*·\Óxğ\å\è\å9^~…S \íØ½KŒ^ºyµİ”U{<Alğ\Ò\ÄÌ¾jü%µ\Ã\ÊeVF4i‹&\İ| ¼-K²>\Ä\ÃÂ&‡ğlB¨ÛŠ%È˜A\æù<2:$K€\Ñ\Å!)ªœFó\Şç¸½N¿\ÏÉš`[{l‘ö~¿o«‘³R¦\ÏÆlr\0o\Õ5m6£o%ªöû­»¶OT»ùı `É¦0úıvøı\Ì\0\Ç\Ë\ÕØ™[”\ä4ò\Îk:h4¥÷‹[\'·4-\ÕpøŠ\n\àQ³uó%)F&Ÿ^õÊ¥«9£¤ıûn…\Z\Ñ\İÁ\×=]˜² ¨</R\â&U„–\ã\ØXwN\ê1,ı\ï\Î*X\Ïõ)ö\Ş\ç3·•†w¬>tcvz\0m¥*Nƒ\éa½ø7\×€:\'›Ç­’u€1|EA\0–t\×tˆV\à\Şõ\è\Æ\Ã={½EK”²\rqd\Å\ÒpM£\á8\Å9r™•Œ&Á÷©Õ¶(†F«\n745‚ı	Y‹¼4	j\ÔB£M1\Ú\Ê»ª[K\äu[Q¹JZ›¤K–A­k¹\Ú)¯\ÖXşŒ\ÜÀÿ\íWCDt\r­A7˜\Ì\İE¾°›ôB‚¾W>\r\é+; \İ\ß\r\Ğ;ôı–ª@¶‰ø©ZX4-\ây\Õ`¤<ŸF2O{†%\Ú\ç(*2ª‡‰\èn\åò*Úƒ-\í²¾SV/\é\åV,;3O\Ì-[4µ·\Ãó\Õj•_g8\È\n<ôÁ\ÎCR%M\ç\İ\ê}\àø©ƒ…\Ô\çó\ç³\Ğ1›¶t‡ó3\Ğqø‘[vvL	»DnÉš—mVL\áõEn\é\Ç]P;\"\ä-¥šƒ\Ê\Û\Zgª:£=ƒ\Îvj·ta[w§ü–b2-\Çq\Òkõd ¿$k„OQÇ‘|!Ñ«º(\èRºµp1ıB{ÁŒe•\í¸™‘¿ycM\á\ÈG!y& \ì{\î¥ı\\Lÿ\âÒ—“µù±¢¥Œ\äOg	\rWŠŒ?\ïp’\àù\æv€\îwgÈ ˆ&6\Òıƒ7÷\'…¯\Ó%=\ÚcM=”,„(œš±¡sJ\İ$xÏ`\ß&\Ø{O´}¥¢O~\âÍ¨\ä\\•Rıy‡\'O\ìò\ÈrNzûÿ\0\0\0ÿÿ\0PK\0\0\0\0\0!\0]\Ô`SH\0\0y\0\0\0word/_rels/document.xml.rels ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¬”\Ën\Â0E÷•ú‘\İ5†´@\ÕbØ´•XtC\ágò~Dö„¿¯K	*º\Èrn\ä3g\Ær\æËƒ’Á¬+ŒfdH\0Z˜¤\Ğ#\Û\Íûı	rpi40Ò€#\Ë\Å\í\Í|\r’£?\äò¢t§h\ÇHX>S\êDŠ»Ğ” ı—\ÔX\ÅÑ—6£%;F£)µ]Y\\0ƒUÂˆ]%$\Ø4%ü‡mÒ´ğjD¥@\ã•\Ô¢Ÿ\Ìy&· #§$ô,B¯+Ì†T@\Úş\Çò\'÷9Dƒ®	\İ%\ë¾ö\ã!\Û\ëJ\Å`ı\Ö[ƒs\Ô\'1R\"5\Z7<–»8G}“!%rO²²Ğ»V\â\ë<·®\ë°1V1„\Â(Zsùr\Ï&\É:ŠòX\êi}\ÇUù‚l6;_\å‡I¼\Ù\ÛÁjş\çCPCüù\ëUu\Â\Ó.\é\Åcñ\0\0ÿÿ\0PK\0\0\0\0\0!\0¶ôg˜\Ò\0\0\É \0\0\0\0\0word/theme/theme1.xml\ìYK‹G¾ò†¹\Ëz\Í\èa¬5\ÒHòk\×6Şµƒ½Rk¦­i\Ñ\İÚµ0†`Ÿr	œC¹\åB1\Ä\ä’c°Iœ‘\êI3-õÄ]ƒ	»‚U?¾ªşºªºº4s\á\âı˜:G˜Â’[=WqœŒØ˜$aÇ½}0,µ\\GH”Œe	\î¸,Ü‹;Ÿv—±ò‰8:n$\å\ì|¹,F0Œ\Ä96\Ã	\ÌM‘„.\ËcAoLËµJ¥QI\\\'A1¨½1™v”Jwg¥|@\á_\"…\ZQ¾¯TcCBc\ÇÓªúP\î!\Úqa1;>À÷¥\ëP$$LtÜŠşs\Ë;\Êk!*dsrCı·”[\nŒ§5-\Ç\ÃÃµ \çù^£»Ö¯Tn\ã\ÍAc\ĞX\ë\Ó\04\ZÁNS.¦\Îf-ğ–\Ø(mZt÷›ız\ÕÀ\çô×·ğ]_}¼¥Mo?™\rs ´\éo\áı^»\×7õkP\Úllá›•n\ßk\Zx\rŠ(I¦[\èŠß¨«İ®!F/[\ám\ß6kKx†*\ç¢+•OdQ¬\Å\è\ãC\0h\ç\"IG.fx‚F€%‡œ8»$Œ ğf(a†+µÊ°R‡ÿ\ê\ã\é–ö(:QN:\Z‰­!\Å\Ç#Nf²\ã^­nò\êÅ‹—¿|ôû\ËÇ_>úu¹ö¶\Üe”„y¹7?}ó\Ï\Ó/¿ûñÍ“o\íx‘Ç¿ş\å«\×üù_\ê¥A\ë»g¯Ÿ?{õı\×ıü\Ä\ïrt˜‡\ç:>vn±6hY\0ò÷“8ˆ\ÉKt“P )z #}}(²\àzØ´\ã\é\Â¼4¿gŞø\\ğZÀ=\Æhqë®©µòV˜\'¡}q>\Ï\ãn!td[;\Øğò`>ƒ¸\'6•A„\rš7)¸…8Á\ÒQslŠ±E\ì.!†]÷Èˆ3Á&Ò¹Kœ\"V“C#š2¡\Ë$¿,lÁß†mö\î8=Fm\êûø\ÈD\Â\Ù@Ô¦SÃŒ—\Ğ\\¢\Ø\Ê\Å4\ÜE2²‘\Ü_ğ‘ap!Á\Ó!¦\ÌŒ±6™|aĞ½i\Æ\îö=ºˆM$—djC\î\"\Æò\È>›ŠgV\Î$‰ò\Ø+b\n!Šœ›LZI0ó„¨>ø%…\î¾C°\áî·Ÿ\íÛ†\ì¢f\æ\Üv$03\Ï\ã‚N¶)\ïò\ØH±]N¬\ÑÑ›‡Fh\ïbL\Ñ1\Zc\ìÜ¾bÃ³™aóŒô\Õ²\Êel³\ÍUdÆª\ê\'X@­¤Š‹c‰0Bv‡¬€\Ï\Şb#ñ,P#^¤ùú\Ô™\\u±5^\éhj¤R\ÂÕ¡µ“¸!bc…ZoF\È+\Õöx]p\Ã\ïr\Æ@\æ\Ş\È\à÷–\ÄşÎ¶9@\ÔX ˜U†-İ‚ˆ\áşLD\'-6·\ÊM\ÌC›¹¡¼Qô\Ä$yk´Qûø¯ö\n\ã\ÕO-\ØÓ©w\ìÀ“T:E\Éd³¾)\ÂmV5\ãcò\é5}4Onb¸G,Ğ³šæ¬¦ù\ß\×4E\çù¬’9«d\Î*»\ÈG¨d²\âE?Z=\è\ÑZ\âÂ§>B\é¾\\P¼+t\Ù#\àì‡0¨;ZhıiAs¹œ9\Òm‡3ù‘\Ñ~„f°LU¯Š¥\êP83& p\Ò\ÃV\İj‚\Î\ã=6NG«\Õ\ÕsM@2‡\Âk5ešLG\Í\ì\ŞZ½\î…úAëŠ€’}¹\ÅLu‰\æjğ-$ô\ÎN…E\ÛÂ¢¥\Ô²\Ğ_K¯À\å\ä õH\Ü÷RFn\Òc\å§T~\å\İS÷t‘1\Ím\×,\Ûk+®§\ãiƒD.\ÜL¹0Œ\àò\Ø>e_·3—\Zô”)¶i4[\Ã\×*‰l\äš˜=\ç\Î\\\İ5#4\ë¸ø\É\Íxú„\ÊTˆ†I\ÇÉ¥¡?$³Ì¸}$¢¦§\Òı\ÇDb\îPC¬\ç\İ@“Œ[µ\ÖT{üDÉµ+Ÿ\åôW\Ş\Éx2Á#Y0’ua.Ub=!Xu\ØH\ïG\ãc\ç\Îù-†ò›UeÀ1rm\Í1\á¹\àÎ¬¸‘®–G\Ñxß’QDgZ\Ş(ùd\Âu{M\'·\ÍtsWf¹™\ÃP9\éÄ·\îÛ…\ÔD.i\\ \êÖ´çw\É\çXey\ß`•¦\î\Í\\\×^åº¢[\â\äBZ¶˜AM1¶P\ËFMj§X\ä–[‡f\ÑqÚ·ÁfÔªbUW\ê\ŞÖ‹mvx\"¿\Õ\êœJ¡©Â¯‚\Õ+\É4\è\ÑUv¹/9\'÷A\Å\ïzA\ÍJ•–?(yu¯Rjù\İz©\ëûõ\êÀ¯Vú½\ÚC0ŠŒâªŸ®=„ût±|o¯Ç·\Ş\İÇ«RûÜˆ\Åe¦\ë\à²\Ö\ïî«µ\âw÷\Ë<hÔ†\íz»\×(µ\ë\İa\É\ë÷Z¥v\Ğ\è•ú \Ùö¿\Õ>t#\röºõÀkZ¥F5J^£¢\è·Ú¥¦W«u½f·5ğº—¶†¯¾W\æÕ¼vş\0\0ÿÿ\0PK\0\0\0\0\0!\0Q\æ:\ê“\0\0\0\0\0\0\0word/settings.xml´XKo\Û8¾/°ÿÁğyK\Ô\ÓF\ÓB\ÏmŠd»¨³\Ø3-\Ñ6I(:[\ì\ß!%\ÅN:-’½\Ä\Ô|ó\â\Ìp8Ì›wu5¹g²ã¢¹œ\Ú\ÖtÂšB”¼\Ù^Nÿ¹\Íg\át\Ò)Ú”´\r»œY7}÷ö÷\ß\Ş–S\nØº	¨hºe]\\NwJµ\Ëù¼+v¬¦İ…hY\àFÈš*ø”\ÛyM\åİ¾¢n©\âk^quœ\Ëò§ƒ\Zq9\İ\Ëf9¨˜Õ¼¢¥E–b³\á~F	ù»½H*Š}\Í\Ze,\Î%«À\Ñt;\Şv£¶úGµ¸•\Üo÷u5òl\ë\Û=Y>J¼\Ä=-\ĞJQ°®ƒ\Õ\Õ\è oN†İ¯=Ú¾\0\Û\Ã*·-³:÷\Ü{ò•¿`¯\Ó:\æ y®‡—¯\Ó\ã?\ê\á§À\Úş9s¦ +U¹{•2\Æu®e©¢;\Ú=V‘\Ö\È^\ç”÷¨\îXŸb\ÔU/©šº\ækIe&‡’©‹\åÕ¶’®+pJgÙŸ\ïô_¢ş1Kö`\è:Ó·\Ğ#>QOË–\É\n4Ëš\Î5\0\å)6+E¨Xv-«*\ÓqŠŠQ°xXn%­¡WŒ#S²\r\İWê–®WJ´ÀtOacT;*i¡˜\\µ´\0m‰h”\Õ\ÈWŠ¿„J \ïH8ƒ„\éB§Õª\ïh \Ñ\Ğ\Z¶ú¤Kİˆ’i\Ïö’¿<\'ZÀX·½s“\Ï\r	\èÀ’—\ìV‡x¥\ËÁùÿÌ¢¦ü°\ï¦Wı„\ßs€5\ÚòG(Š\Ûc\ËrF\Õ\Âô‹Œ™L\äoo¸”B^5%\Ô\Æ/3\Æ7&Á\0‡Z»ò\áRLœ\ß3Z\Â\Å÷‹\ì\î;ö/0Ã™tn¡,\ïb¡”¨\ß\Û\Äú\ç2i\ê}~^¾p}—İ¸ø$„zdµâˆ¸\ß{ª\ÑbYd‘…8\ä	A›\ÄùE|²ˆY±z†DÁ\"\ËP$ö\Ü<@‘\ÄI¸\Ä\ÉHŠ\"©x(b/\Ü8D}³“`\â2¹›\ç(B,ÇĞˆÛ²3t?„\Ø\à7Š8\Ä(’øi†#i\Æ9Š\äã ™s\"\ËOP¯,\r\ë’‘8B½v-\Ï!hD]\Çõñ\n\ìø1Zon\ê’\0õÀƒ\È%\èN=\ÏIC\\fagj\Ç\Ë</Fc\àû\à\0º?óRü”–kûŠ„~j\ãHf‘(Á\Ğ\'\ß\Èv˜:V\Æ \Ì|÷`¹V†öƒE\ê¸º\Óø–¢9\å÷\ï3$€„ú•£D‘\íúhD£\ÜKp;±\å%x‰}7óP;qdx\â\ĞO2´F¿\İG\ãÔ³3Còƒf!±!¨¶$µHˆ\ÖA\n… 2\éÂ‡	C²À|4sYf…øù\É/	Ñ³»P½¨|a»\Äx=\ï!¸\ê¥~ı-Ç•i&u/‘\Ğz-9\Ü\èG\Ó\\s¬\å]Ì›_3˜L\Ù9²Ú¯Gp6ë®¦U•\Ã\å:ÆµzYò®M\ÙÆ¬«*·\'½‡D©0_~xÔ¥\çU&ÿ”b\ßö\èAÒ¶UF\ÛuIŞ¨k^ôn¿^R\r\Ì\ÒgĞ¾)?\ŞK§SxKW¿ù®©!Ö¼Ôƒ›]]÷\Ñ.*¹\Òó»¡mÛ\ë­}9­øv§l=(ø*\áqm>\Ö[2`\Ä`¤\Ç\Ì-ôÖ€{Xœhd¤ñ9#\Í9\ÑÜ‘\æh\ŞHóN4¤ùš¶ƒÁRÂ”—š¾U%¬|Â¿\"õA\èv´eiÿ€ú=axt“û%{€\'+¹šNº–—5}\Ğ/b\Î\ÌÀ]Ñ£Ø«\'¼\Z\Ó\Ì\íS\rú56\Ìxó\'Â¦ÆŸù¢\'‡z\\\ëõ\é\Íq\Ñ;^ñ\æ\Ã\'J\Èû\Ã`¶»,EqG	V†\î9y”\æCÛ°=ó¬Qf„„¼b›˜v¬°Q\Ô\ëE¿D\ãi\ìÎ²,g®‘Y¤şšZ»¾\ã\Åyş\ßpJ\Çß¼ı\0\0ÿÿ\0PK\0\0\0\0\0!\0 FC3$\0\0‰ \0\0\0\0\0word/numbering.xml\ì˜\Ën\ã6†÷ú†ö‰\î²-Œ3˜&q‘¢˜]\Óm\áE );\Ş\Î\Ë\Ì#ô±\æz(Y²¥$§­\Î\"´IG?y¨?ùğñ™\Ñ\Ñ\ZKEŸY\îµc0ODJøjfıñ8¿šX#¥OÏ¬-V\ÖÇ›ø°‰yÁX\Â\Ä0¸Š7y2³2­óØ¶U’a†\Ô5#‰J,õu\"˜-–K’`{#dj{ë”Ÿr)¬pn_#e\íp\És7Z*\Ñ‚\r0°“IŸ÷·7$´§ö¤\rò€\à	=·ò{£\"\Ûd\Õƒ@U‹#½òp\Ñ0’\×&‡‘ü6i2Œ\Ô:N¬}ÀE9.…dH\ÃW¹²’OE~\ài² ”\è-0¨\Æ ÂŸdQ\rùio\Â\Øf\"\Å\ÔOkŠ˜Y…\äñ.şª‰7©\ÇUü®i\"0\í¶,,7µñ³¦J×±²‹vUøH\n†¹.U³%¦ £\à*#ys;°¡4\Ìj\Èú-ÖŒ\Öó6¹Û±\Ôş\éj»«¶a\ì’şn\ï­2›\è:v\Ó šˆ.)¯Yg\Â\à\ï$Í¸n\ÇË§x-@”\à/‹š1\Ù1\ìd_İ†C:–UÍ©v\Åp\È^X·\ãø2™@ZôBx~‡iLøK¥:\Íú\á\ê=²M,\Ò(Cª)\ZC\Äı0lp[v w¾:­¨~–¢\È÷4r\Z\ía½nŒ\Ó\éÁ\Ú\çá…¡NK\æK†r¸uY?¬¸hA!#(µTË¨\ÜóiÊø¹\ì7{=2÷•u\r-”–(ÑŸ6:úö\0\ç¬\Ğb‰Á\ßI\ÓY¹¹OK\åO£\'3\ÅP¸2\ë\Äk—¿{7;®X¶a\Õ\äW¼\Æôq›\ãzN¶]H’şfÆ¨«\æj–\Óz\Æı\í½s\ïN5B\×f€@S%\ëœÂ›t5?n™C™c“DtÎš\ÎEA)\Ö\rñ\Ş>õ\Ğ÷¯5ı¿$u/\Å\Ë\İôüwi\Z\Â\Ícš\î™5ö\ÊL2\ÄW¥ö£2Y»™,w\Í\\p­Œ¸*!p¿l\ÙB\Ğ2ô\èv\ÔA8€S¼D \ÌVR\ì2±—J¸-%ü²\Şdğ:\\c3\ãdeD_]\Ü &Ì­($Árôo\ÔyÑ›¨ö\Ä~ªy-\Õ\Â÷W\íû\×o}uó\Üh˜n\Âló×˜:P\í¸¯Ÿ@\Õ!:.°A \Ş\çM&ÿw\ÅgYq \ÃYW\\U_\çWq?ğ\nïŠ‹Î´\âBg\àUş~7>ËŠ\Ç\ï\êÿ¨\â&gZqQ0ğ\n?½\â\ì#wk\Öx\Óúš\ìm}\ÇAx†Î´zşÁ\Öw>v<\ï>j\Äm¶õb}/\Ö÷b}/\Ö÷b}ka.\ÖwX\Å]¬\ï\Åú«¸‹õVqge}yiyù\Õ5ÿ)Ó¢ü?r\Ù\éÁÔŸD®_ªu\ä\ë\ç­ó\ç¯@\ÕhA\Ã\É\Ôu\Çc¿rÎ¯2Ë¨™U[9ï›¿\0\0ÿÿ\0PK\0\0\0\0\0!\07\èŒOs\0\0r‹\0\0\0\0\0word/styles.xml\ì[sÛ¸\Ç\ß;\Ó\ïÀ\ÑSû\à•\åk6³Î\íÄµ§I\Ö9›gˆ„,\Ô$¡ò\Ûùô@\"u\nD¼i§›™µ$òüpù\ã\àğúË¯OI|¥Y\Îxz6™ı´?	h\Zòˆ¥÷g“\ÏwW{¯&A^4\"1O\é\Ù\ä™\æ“_\ßüõ/¿<¾Î‹\ç˜\æ\0¤ù\ë$<›¬Šbız:\Í\ÃMHş_\ÓTl\\ò,!…øš\İO’=”ë½\'kR°‹Yñ<=\Ø\ß?™hLfC\á\Ë%\é[–	Me?\Íh,ˆ<\ÍWl×´G\Ú#Ï¢u\ÆCš\ç¢\ÑI\\ñ\Â\Ò3; „…\Ïù²øI4F\×H¡„ùl_}J\â\r\à8\0€“>\á¯4c*,\Û\á8\'\r‡E-[eZ€<*¢ŠrP÷\ëTÚ’‚¬H¾j)®R\Ç\r\î9‘}”„¯o\îS‘E,HBõ@(°ü¿h¿ü£>\Ò\'õ»l\Â\äğ…ˆ‡oé’”q‘Ë¯\Ùm¦¿\êo\ê\ÏO‹<x|Mò±;QAQJ\ÂD\×\çi\Î&b%yq3Ò»q%?ôn	ó¢õó‹\Ød*KÌ¿‰_I|698¨¹”5\èü“ô¾UöÙ„¦{Ÿç’»$Ñ¥t\ï\æ½\Üuª›Rım5p½ıMµ&!Sd²,¨p\ì\ÙÉ¾„\ÆLÆ‘ƒ\ãŸ\ë/ŸJ\Ùİ¤,¸.Dª¿\rv\núXø»ğşy„\ÄVº|\Ï\Ã\Z\Í±\ál¢\Ê?~¾¹\Í\ÏD 9›ü¬\Ê?\ÎiÂ®YÑ´µcºbı²¢\é\çœF›\ß¿RÁBÿò2ŸOO”\îq½{\n\éZ†±5%R…\Ò –{—lS¸2ÿw\r›\é¾\ï³_Q\"\ão0\ÛF¨\ê£\Ò\"oµ¶ŸYnµ]\í…*\èğ¥\n:z©‚_ª “—*\èô¥\nzõR)\Ì÷,ˆ¥‘õjX \î\â¼\Í18šcğ%4\Ç\à*hÁ\Ğ\Ã@Gs\ã\Í1S§\à¡i¶û¡a´sw\Ïn\Ü\İS‚w÷\à\Æ\İğİ¸»\ã»ww8w\ã\î\Şn\Ü\İÁ\ZÏ­–ZÁp³´\íeKÎ‹”4(\è\Óx\ZIK%¥~xrÒ£™—FzÀT‘MOÄ£i!Q\ßw\å¤\îóy!s»€/ƒ%»/3š®8M¿Ò˜¯i@¢Hğ<3Z”™¡G\\\ÆtF—4£iH}lP™	i™,<Œ\Í5¹÷Æ¢i\ä¹ûj¢— \Ğh‘?¯¤“0ƒ:!a\Æ\ÇWoñ\á=\Ë\Ç÷•„eSO¬~†˜b\Ï\rf|j 0\ã3…Ÿ´4ó\ÕEšæ©§4\ÍS‡iš§~«Æ§¯~\Ó4Oı¦iúM\Ó\Æ÷\Û+b\âÛ«™ı±»Ë˜\Ë\Ó£\ë1g÷)€ñÓ>f\ZÜ’Œ\Ügd½\n\äq\è~l»\Í\Ør.xô\Üù˜\Ó\Z’¯u½\Z\"—¢\Õ,-\Çwh‡\æË¹\Z\'÷jx¬\áw±b™,h\×~ò™y¹(zV‘¬œvN\â²ZĞ÷6RŒa¸bY\î\Í\rú±FğG¹œ•rúˆ|›Z¯Ø†5Ş­¶£’\×\êi¤‡Z\Æ<|ğ†¯Ÿ\×4i\Ù\Ãh\ÒcşH#\Äy‘ñj¬µ]ş@Ib\åò\ï’õŠ\äL\åJ„ıT__€| \ë\Ñ\rº	Kı\èön/!,ü­ ®\ï>¼\îøZ¦™²cü\0/xQğ\ÄS	ü\Ûºø»Ÿ\n‹$8}ö\Ô\ÚsO‡‡\ì’y˜d*<‘\Ä2“¥\Ì\Ëªxÿ¤\ÏN²\È\í6£\Õ5?õDœ“d]-:<ø–ˆ‹\"şxX\r)\Ş$cò¸/§ºók6\Ì\ËÅ¿h8>\Ô}ä—#C¿•…:ş¨–º\Ê\Únü2¡ƒ¿DPjŠ\éA_\í\à\Æ7¶ƒó\Õ\ØË˜\ä93Bu\æùjn\Íó\İ\ŞñÉŸ\æñ˜g\Ë2ö×5\Ğ[\Ö@o]\È\ã2IsŸ-V<\rV<\ß\íõ8d\Ï\Ã!9\ÅûG\Æ\"ob(˜/%Ì—\n\æKó*Àø+tZ°ñ—\é´`\ã¯Õ©`–\0-˜¯q\æuú÷t–§ó5\Î\Ì\×8S0_\ãLÁ|³Ã·].\Å\"\Ø\ß\ÓBú\Zs-¤¿‰&-h²\æÉ=!\ß\Åôx8@Z\Ñn3¾”7ƒğ´ºˆ\ÛR£=.¶+œ/‘¿Ğ…·ªI–\Ïzy8\"J\â˜sO\Ç\Ö6²\ì^»¶\ËLİ»1º\n·1	\éŠ\Ç\Ím2ÛŠ|y^İ–±]}U\r«Ã\ï\Ùıª\æ«\æhs²¿Ó²N\Ø;f»\ì\ëó“ú–>³4beRW\ŞLqrho¬Ft\Çøh·ñf%Ñ±<¶´„e\ì¶Ü¬’;–§––°\ÌW––\ÊO;–Cşğ–d½\áthü49ağ¢Æ¸·Ø¡\ÔXö\rÁÓ¡Q\Ôq•\à<\å\Ù¨Ï˜\í\íœ\Çlñ\"3\ãNfŠµ_™Cö‰~erf\ÇMU^sõˆûjm9/yuÜ¾s\Â\Éş¦®±pJs\Zôr\íO\\u¢Œ¹­Ãaw\Ì\ë\0dFXE\"£9*$™)Ö±ÉŒ°Rf:ZÁ­ =.ZA{—h).\Ñj\Ä*ÀŒ°^˜hG…´£X)˜(G\æN\n)hG…´£B\ÚQ\á\ç¨\Ğ\ç¨\Ğ\Ş\ÅQ!\Å\ÅQ!\í¨vTˆ@;*D \"Ğê¸¶7š;9*¤ \"Ğ\nhGU\ë\Å\n\íq\n\í]R\\RĞ\nhG…´£B\ÚQ!\í¨rT`\îä¨‚vTˆ@;*D µº\Õ\Ğ\İQ¡=\ÎQ¡½‹£BŠ‹£B\n\ÚQ!\í¨vTˆ@;*D \"P\nÌRĞ\nhG…´£ª“…#\Ú\ãÚ»8*¤¸8*¤ \"Ğ\nhG…´£B\ÚQ!\å¨À\Ü\ÉQ!\í¨vTˆ\ZŸú¥\é2ûş¨§ñŠ}ûSWºRŸÚ·r·Q‡ö¨ºVf–ı½œ?½7ª|\Ã\Â1\ã\êµ\á´z›«.‰@øü\írøŸ6}\äC—ô½\êœ)€\ÙZ‚c*GCC¾m	’¼£¡‘Ş¶«Î£¡\èÛ¶\Ó\à\ÑP\ĞU~Y_”\"¦#`<fZ\Æ3ƒùP´n™\Ã.Š\Ñ-C\Ø\ÃC‘¹e;x(·œ·­-ûé¤¹¾††c‹pj&\rK¨U¡cØŠf&Øªg&\Ø\Êh& ô4bğÂšQh…\Í(7©¡›a¥vwT3+5$8I\r0\îRC”³\Ô\å&5ŒX©!+µ{p6œ¤w©!\ÊYjˆr“\ZNeX©!+5$`¥9!1\îRC”³\Ô\å&5\\\Üa¥†¬Ô€•\Zœ¤w©!\ÊYjˆr“\Zd\Éh©!+5$`¥†\'©\Æ]jˆr–\Z¢†¤VGQ:R£n™\ãa-CÜ„\Ü2\Äç–¡C¶Ô²vÌ–Z\Çl	jUkË–Ú¢™	¶\ê™	¶2š	(=¼°fZa3\ÊMj\\¶\Ô\'µ»£š	X©qÙ’Qj\\¶4(5.[\Z”\Z—-™¥\ÆeK}Rã²¥>©İƒ³™\à$5.[\Z”\Z—-\rJË–\ÌRã²¥>©q\ÙRŸÔ¸l©O\ê‘²\ã.5.[\Z”\Z—-™¥\ÆeK}Rã²¥>©q\ÙRŸÔ¸l\É(5.[\Z”\Z—-\rJË–\ÌRã²¥>©q\ÙRŸÔ¸l©Oj\\¶d”\Z—-\rJË–¥\ÆeK„	óğ¨yB²\"ğ÷¼¸k’¯\n2şá„ŸÓŒ\æ<şJ£ÀoSß£Z9}\ì¼şJ²\Õ\Ûø\Äş…\è3ùô\Ö\íJQõX\rT;\ŞQo°’•ôÁô‹«T]õ™Zõ9\ËE:­÷\Ùß¿8?8:\Ô~ª\ßõµ`S\ßÁK¿Ú¯ü:j¾ô¿ò\Ëğ¦´³\ÉKh|¤Á\'\Õå›·•õlToJ\ë\İ\æğ\çª\â›W¥\éS¶W¥Õ§q«W¥©ßª·¤UÕ¯_‹¦úª®„¡~¼—I} ‡\áÉ½ª&¬÷\Öcl3€ªı:Ã§ª­¡–…Œ\0C5œL;LõúY\Ã]\ÕXÄ•ş\â\ÃM*GÜ£@U£\'R¡\ÄöK\Z\ÇHµ7_›wé²¨¶\ÎöÕ£¶¶/ª§\Z\í35]\Óneª¯Ãƒ¡z/¾\Â\Ô\Õ=]­.\è\Û\Ëò7µ8\Ü;\Õ\èOª®$¢ˆ\ßd`S{= a]\ë	vgXù_ˆ&z\ïD“z^Š&]wPqş¼ i4g\ß\Z9t\×{ˆ\ÉÛ¼\Ç\Ï\"š©É¢rµ]>­\\\ëşMH£>ˆn§\Íû\År\àlr~,ÿ©\á/b 	¢Ë•şõ\Å1•§ù…6\î\é[{µOj\åûM\'oBÁF\ÛLš+o[\Ê\'0A•ƒiÁU“/sõW•[\×ñJı·]ú‚„÷/Ó¨^´‡N¥{¨]iÕ¸ZS¢f\"\İ2\å8\â\ë’\Å1h\ç•úq«™ŠY5P·\Ë\ĞÊ˜6r¨\ÂE\Ø?^#^\Öqj¬Z\í¬ûgK‰ª ö}¤F‚¨\à\èN\êê”©uÜ\ÓL9|´²f~¸F.DğıA³B5Ñ’>²m*\ïk}³\é\ï1+}§	„‰%AD¯\"ª£R*‘\Øa£\Ë\İn¦‡\ê<\ÚV§·d›`„ªOn\İ=ş§\n‹˜ƒk‹u\ß~¶¸3E¤0U\ì^\Ô]\rZ\ë„Aoù\Âğ_“0\\\\\É\Û#±=·Ö›\ä\Í.T\Z@_û\ÎE¹\Ì\rÎ…9L\Ì\Îem\ÍN/R\Ú/RZ’~„$\Ëv\Íû§¤?#z\×qR³\Íbl»\Íj×‚\Ü>U8ÿšnƒ©B{‹\î\Ô+u¦\Ä\ëzùO¬¯yú\ïœl\Ë\\Ueµ}Ts\rWk\ÃRÀr¾—\çš¬\æòk\Z¥‰¬Y=‹\ßÉ8›$,\å\Ù;ı›Ü®\'ò\Í\Ö\\=\Ó2\Ûsuı›«e\rE{²½ùùVô°\éÌ¦\ëˆ\áH\ì\æ±t\İT‡ú|\ê$S‡\ä\åü,o\ÕK’P>\Í÷©(I¬,\ÚÁ\Ü\È\Î	‘¦‘›\Ó}\Ûm\İl\ém¦®Ë˜s\İ\Ö_¼iªH™b_üw¥§¿²şQO|½*×Ÿò7ÿ\0\0ÿÿ\0PK\0\0\0\0\0!\0\ï\n)NN\0\0~\0\0\0\0\0word/webSettings.xmlœ\Ó_k\Â0\0ğ÷Á¾CÉ»¦\Ê)Va\Ç^\Æ`\Ûˆ\éÕ†%¹’‹«\î\Ó\ïÚ©søb÷’ÿ÷\ã.!ó\å\Î\Ù\äô¹\rS‘€\×X¿\É\Åû\Ûj0	E\åe\ÑC.ö@b¹¸½™7Y\ëWˆ‘ORÂŠ§\Ì\é\\T1Ö™”¤+pŠ†Xƒ\ç\ÍƒS‘§a#\n\Ûz \Ñ\Õ*šµ±&\î\å8M§\âÀ„k,K£\áõÖ]¼`YDO•©\é¨5\×h\r†¢¨ˆ\ëqö\Çs\Êø3º»€œ\Ñ	\Ë8\äbu‡\Òn\ä\ì/0\éŒ/€©†]?cv0$G;¦\è\çLO)Îœÿ%sP‹ª—2>Ş«lcUT•¢\ê\\„~IMN\ÜŞµw\ätö´ñ\ÔÚ²Ä¯ğ\Ã%Ü¶\\\ÛuC\Øu\ëm	bÁ\ëhœù‚†û€\rA\í²²›—\çG\È?¿fñ\r\0\0ÿÿ\0PK\0\0\0\0\0!\0c\éb\0\0œ\n\0\0\0\0\0word/fontTable.xml\ì•[o\Ó0€ß‘ø‘\ß\×\\š^V­\ØØ€—=ÀÏ®\ã4±ù¸·Ï±“v­\ÒBi‰\Ú8\Çöû‹ss»‘e°\â„VS÷\"p\Åt&\ÔbJ¾>?^I\0–ªŒ–Zñ)\Ùr ·³·onÖ“\\+öW0‘lJ\nk«I+¸¤\Ğ\ÓWX™k#©\Å[³%5ß—\ÕÓ²¢V\ÌE)\ì6L¢hH\ZŒ¹„¢ó\\0ş^³¥\ä\Êúş¡\á%µ‚BT°£­/¡­µ\É*£À9Ë²\æI*\Ô§-\ÌhĞ¹\í\ádšyv#_’\å`\Ğ\r´\0C\Æ7\İ\ã†b\ÏCÈºq†{\È8¿7˜\0d6+:Q’\×\Ğõ¥–ŠC\"\ï6¨Á·•Î‘d“O¥\r—HÂ·\à‹<\Øı\ãü\İ\Åù\Æ\Ç\İÈ¬I…`=QTb\Ï/[9×¥WTi\à1V­h9%\Ñ\0\Ï8rKd\rñ:ˆF$t\rYA\rpÇ¨&u8§R”\Û]\ÔhIU]Q	ËŠ]|Epƒ®«@,°b	ó9\ÍA\êHŒ~IZmú\Ç\æ9\ã\ãH|\ĞŸ\ÖZ\"…\ä<ñuğÙü”÷Z‡QM¤øK°”6\âŸô\çFp\Ì\É\Ã\ãã‹‘{ŒŒÆƒ»–‘\ëŸñ·qÍ¹\ÜÈ½^\ZÁsr\Æ\Æ\r\\{+\ÎF\ÚÉ†\Ô7§t\äbÃ³\Ë]¤ı\á\ân·\î3g2¥ut\Èº´ú%\Ê;\Ö\é\r#‰\î0=R¿ \ê³Ë‚€µ\0xE\éñ‘—+n£ÿ]Šó\êÍ¡ş\á¦ùW=ø5=\Æ/\Õ\ŞC\êGŸ&\İr£¾O\â_xh\n0û\0\0ÿÿ\0PK\0\0\0\0\0!\0ôŒ\ãG‹\0\0÷\0\0\0docProps/core.xml ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0œ’AN\Ã0E÷H\Ü!ò>u’‚(\r n E v\ÆZ\ÓÄ¶l\Ó\Ğ{°A \Ä\n¸‘¯ƒ“´)E¬\Ø\Íø¿ù\Z;;|,‹`\Úp)(\îE(\0A%\ãb2@—\ãa¸c‰`¤h\æ\Û[U)•\ZÎµT -x\'aRªhj­J16t\n%1=O/\ŞI]\ë[=ÁŠ\Ğ™\0N¢h—`	#–\à\Ú0T#ZZ2\ÚYª]4Œb( a\r{1^³tişh”d\É\íBÁŸ\èJ\ì\èG\Ã;°ªª^\ÕoP¿Œ¯Gg\ÍUC.\ê¬( <c4µ\Ügx]ú\Ê<\Ü\Şµ\íq\×øšj V\êü´š‹\àbJ´\rµR\ê\Ìg°¨¤f\Æ\Ïotc`¨\æ\Êú—l\İ7<]cGşi\ï8°£E\î\ŞÜ«{qOûp\Ï\î\İ}º¯\ÆôVOj˜óú‡\äICtm¶Œ»]X\àcJ\ÛPW\ÊUÿød<Dy%ı0\Ú	“ƒq¼—\î\î¦QtSo¹1¿6,—ü\Ûqe\ĞµùUóo\0\0\0ÿÿ\0PK\0\0\0\0\0!\0÷Q¸}\0\0\Î\0\0\0docProps/app.xml ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0œR\ËN\Ã0¼#ñQ\î\Ô!…Rª­*BxI\rôlÙ›\ÄÂ±-\Û ú÷l„ n\ä´;\ë\ÏL\ï\É\Ş0D\í\ì:?y†V:¥m³ÎŸª\ë£e\Å$¬\ÆY\\\ç{Œù?<€\Ç\à<†¤1fDa\ã:oSò+Æ¢l±qFcK“Ú…N$jC\Ã\\]k‰WN¾vh+‹bÁğ=¡U¨üH˜Œ«·ô_R\åd¯/>W{O|*\ì¼	ù}¿ifÊ¥ØˆB\å’0•î—\r<Š#?6°sAE~r~l(aÓŠ d¢y¹œ/M\0¸ô\Şh)…\Ë\ï´.º:eŸŠ³\0\Øô‹-\Ê× ÓÀ¦-\ÜjK\n\Ê9°¡\"mA4Aø6òE/p\ì`+…Á\rÀka\"û`\ã:/,ñ±±\"¾—ø\ä+w\Õgñµòœ\Ø\Ü\é\Ôn½$a>/Ï§†\'#\ØŠŠŒ\ZF\0n\è¯\Ó_@»¶Aõ}\æï ğyxüx1+\èû\Ì\ì#\ã\ã»\á\0\0\0ÿÿ\0PK-\0\0\0\0\0\0!\02‘oWf\0\0¥\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0[Content_Types].xmlPK-\0\0\0\0\0\0!\0‘\Z·\ï\0\0\0N\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ÿ\0\0_rels/.relsPK-\0\0\0\0\0\0!\0«*9®F\0\0\Ì\\\0\0\0\0\0\0\0\0\0\0\0\0\0\0¿\0\0word/document.xmlPK-\0\0\0\0\0\0!\0]\Ô`SH\0\0y\0\0\0\0\0\0\0\0\0\0\0\0\0\0\04%\0\0word/_rels/document.xml.relsPK-\0\0\0\0\0\0!\0¶ôg˜\Ò\0\0\É \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¾\'\0\0word/theme/theme1.xmlPK-\0\0\0\0\0\0!\0Q\æ:\ê“\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ã.\0\0word/settings.xmlPK-\0\0\0\0\0\0!\0 FC3$\0\0‰ \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0…4\0\0word/numbering.xmlPK-\0\0\0\0\0\0!\07\èŒOs\0\0r‹\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ù8\0\0word/styles.xmlPK-\0\0\0\0\0\0!\0\ï\n)NN\0\0~\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0yG\0\0word/webSettings.xmlPK-\0\0\0\0\0\0!\0c\éb\0\0œ\n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ùH\0\0word/fontTable.xmlPK-\0\0\0\0\0\0!\0ôŒ\ãG‹\0\0÷\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0‹K\0\0docProps/core.xmlPK-\0\0\0\0\0\0!\0÷Q¸}\0\0\Î\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0MN\0\0docProps/app.xmlPK\0\0\0\0\0\0\0\0\0Q\0\0\0\0');
/*!40000 ALTER TABLE `manual_exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor_department`
--

DROP TABLE IF EXISTS `professor_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor_department` (
  `professor_name` varchar(45) NOT NULL,
  `professor_id` varchar(45) NOT NULL,
  `head_of_department_id` varchar(45) NOT NULL,
  PRIMARY KEY (`professor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor_department`
--

LOCK TABLES `professor_department` WRITE;
/*!40000 ALTER TABLE `professor_department` DISABLE KEYS */;
INSERT INTO `professor_department` VALUES ('Daniel Armaganian','209146943','319003935'),('Tzahi Bakal','315730176','319003935');
/*!40000 ALTER TABLE `professor_department` ENABLE KEYS */;
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
INSERT INTO `professor_subject` VALUES ('209146943','01'),('246810121','01'),('315730176','01'),('333444555','01'),('135791113','02'),('209146943','02'),('315730176','02'),('246810121','03'),('333444555','03'),('315730176','04'),('333444555','04'),('135791113','05'),('315730176','05'),('333444555','05'),('135791113','06'),('209146943','06'),('246810121','06');
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
  `answer1` varchar(60) DEFAULT NULL,
  `answer2` varchar(60) DEFAULT NULL,
  `answer3` varchar(60) DEFAULT NULL,
  `answer4` varchar(60) DEFAULT NULL,
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
INSERT INTO `question` VALUES ('001','01','01001','1 + 1 = ?','Daniel Armaganian','209146943','2','1','2','3','4'),('002','02','02002','What is the time complexity of merge sort algorithm?','Daniel Armaganian','209146943','2','O(Logn)','O(nLogn)','O(n^2)','O(n)'),('003','01','01003','solve for x:\n4x + 2 = 6\nx = ?','Daniel Armaganian','209146943','1','2','1','3','4'),('004','02','02004','Which of the following is not an OOP question?','Daniel Armaganian','209146943','2','Ruby','C','C++','Java'),('005','01','01005','Calculate det of mat M\nM = {{1,2 3}, {4, 5, 6}, {7, 8, 9}}','Daniel Armaganian','209146943','2','-4','-6','12','31'),('006','02','02006','How many bytes is an int?','Daniel Armaganian','209146943','1','4','1','64','32'),('007','02','02007','What is the time complexity of Bubble sort?','Daniel Armaganian','209146943','3','O(logn)','O(n^loglogn)','O(n^2)','O(1)'),('008','04','04008','What is the general formula for alkanes?','Tzahi Bakal','315730176','2','Cn+2n','CnH2n+2','H2O','Olives'),('009','04','04009','What is the difference between an alkene and an alkyne?','Tzahi Bakal','315730176','1','double bond and triple bond','both single bond','both triple bond','both double done'),('010','02','02010','What do you prefer:\nComputer science or lawn mowing ?','Tzahi Bakal','315730176','2','Computer Science','Lawn Mowing','Neither','Both'),('011','01','01011','123456789 + 987654321 = ?','Tzahi Bakal','315730176','1','1111111110','347','135000000004','24'),('012','01','01012','What is the derivative of the function f(x) = x^2?','Tzahi Bakal','315730176','4','f\'(x) = sqrt(33)','0','f\'(x) = 11x','f\'(x) = 2x'),('013','01','01013','Is math good?	','Daniel Armaganian','209146943','4','YES!','NO!','Maybe?','Lawn Mowing is better'),('014','06','06014','What is the main objective of a control system?','Daniel Armaganian','209146943','3','To amplify the signal','To measure the input','To regulate the output','To store energy'),('015','06','06015','What is the transfer function of a control system?','Daniel Armaganian','209146943','2','The ratio of output to input','The mathematical model of the system','The time delay of the system','The control action applied to the system'),('016','06','06016','Which type of control system maintains a constant output in the presence of disturbances?','Daniel Armaganian','209146943','2','Open-loop control system',' Closed-loop control system','Feedback control system','Feedforward control system'),('017','06','06017','What is the unit of measurement for the stability of a control system?','Daniel Armaganian','209146943','4',' Decibel (dB)','Hertz (Hz)','Ohm (ÃÂ©)','No unit'),('018','06','06018','Which control system parameter determines the response speed of the system?','Daniel Armaganian','209146943','2','Gain','Time constant','Damping ratio','Bandwidth'),('019','05','05019','What is the primary function of the respiratory system?','Noa Kirel','333444555','4','Pumping blood throughout the body','Regulating body temperature','Producing hormones','Facilitating gas exchange'),('020','05','05020','What is the purpose of red blood cells in the human body?','Noa Kirel','333444555','1','Carrying oxygen to body tissues','Fighting off infections','Breaking down food particles','Regulating body temperature'),('021','05','05021','Which of the following is a long bone in the human body?','Noa Kirel','333444555','3','Skull','Rib','Femur','Vertebra'),('022','05','05022','Which organ is responsible for filtering waste products from the blood?','Noa Kirel','333444555','1','Kidney','Liver','Stomach','Pancreas'),('023','05','05023','What is the purpose of the lymphatic system in the human body?','Noa Kirel','333444555','4','Pumping blood throughout the body','Regulating body temperature','Carrying nutrients to body cells','Defending against infections and diseases'),('024','05','05024','Which of the following is a function of the skeletal system?','Noa Kirel','333444555','3','Producing hormones','Facilitating digestion','Providing support and protection for the body','Regulating blood pressure'),('025','01','01025','Which operation is used to find the inverse of a matrix?','Noa Kirel','333444555','4','Addition','Subtraction','Multiplication','Inversion'),('026','01','01026','What is the degree of the zero polynomial?','Noa Kirel','333444555','4','0','1','2','It has no degree (undefined)'),('027','01','01027','Which property states that the order of numbers can be changed when adding or multiplying?','Noa Kirel','333444555','2','Associative property','Commutative property','Distributive property','Identity property'),('028','01','01028','What is the value of 4x + 3y when \nx=2 and y=5?','Noa Kirel','333444555','3','20','23','28','32'),('029','01','01029','Which of the following is a quadratic equation?','Noa Kirel','333444555','2','2x +3 =7','x^2 +3x+2=0','3x-2=5x+1','4x-6=10x'),('030','05','05030','Which of the following is responsible for pumping \nblood throughout the body?','Roni Aloni','135791113','3','Lungs','Liver','Heart','Kidneys'),('031','05','05031','Which organ system is responsible for providing \nsupport, protection, and movement in the human body?','Roni Aloni','135791113','4','Nervous system','Endocrine system','Muscular system','Skeletal system'),('032','05','05032','Which of the following is a part of the central\nnervous system?','Roni Aloni','135791113','1','Spinal cord','Spleen','Adrenal gland','Gallbladder'),('033','05','05033','What is the function of the gallbladder in the\ndigestive system?','Roni Aloni','135791113','2','Producing bile','Storing and concentrating bile','Breaking down carbohydrates','Absorbing water and electrolytes'),('034','05','05034','Which organ is responsible for producing insulin \nin the endocrine system?','Roni Aloni','135791113','3','Thyroid gland','Adrenal gland','Pancreas','Pituitary gland'),('035','05','05035','What is the function of the red bone marrow \nin the skeletal system?\n','Roni Aloni','135791113','1','Producing red and white blood cells','Storing minerals such as calcium','Supporting and protecting organs','Facilitating muscle contraction'),('036','05','05036','Which of the following is responsible for producing \nurine in the human body?','Roni Aloni','135791113','3','Liver','Lungs','Kidneys','Stomach'),('037','05','05037','Which organ is responsible for detoxifying harmful \nsubstances in the human body?','Roni Aloni','135791113','3','Pancreas','Spleen','Liver','Gallbladder'),('038','05','05038','What is the function of the small intestine in the \ndigestive system?','Roni Aloni','135791113','1','Absorbing nutrients from food','Storing bile',' Producing enzymes for digestion','Filtering waste products'),('039','05','05039','What is the primary function of the pancreas in the \ndigestive system?\n','Roni Aloni','135791113','2','Producing bile','Regulating blood sugar levels','Breaking down proteins','Absorbing nutrients'),('040','05','05040','Which organ system is responsible for providing \nsupport, protection, and movement in\nthe human body?','Roni Aloni','135791113','4','Nervous system','Endocrine system','Muscular system','Skeletal system'),('041','05','05041','Which part of the brain is responsible for \nregulating balance and coordination?','Tzahi Bakal','315730176','2','Cerebrum','Cerebellum',' Medulla oblongata','Hypothalamus'),('042','05','05042','Which organ is responsible for producing and\nsecreting bile in the digestive system?','Tzahi Bakal','315730176','1','Liver','Pancreas','Stomach','Small intestine'),('043','05','05043','What is the function of the red blood cells\nin the circulatory system?','Tzahi Bakal','315730176','2','Fighting off infections','Carrying oxygen to body tissues','Breaking down food particles','Regulating body temperature'),('044','05','05044','What is the purpose of the mitral valve in the heart?','Tzahi Bakal','315730176','2','Regulating blood sugar levels','Preventing blood from flowing back into the left atrium','Pumping oxygenated blood to the body','Facilitating gas exchange');
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
INSERT INTO `question_course` VALUES ('01001','01'),('01003','01'),('01011','01'),('01013','01'),('01025','01'),('01026','01'),('01027','01'),('01028','01'),('01029','01'),('01003','02'),('01005','02'),('01011','02'),('01013','02'),('02002','03'),('02010','03'),('02006','04'),('02007','04'),('02010','04'),('02004','05'),('02010','05'),('04008','07'),('04009','07'),('01012','08'),('01013','08'),('06014','13'),('06015','13'),('06016','13'),('06017','13'),('06018','13'),('05019','14'),('05020','14'),('05021','14'),('05022','14'),('05023','14'),('05024','14'),('05030','14'),('05031','14'),('05032','14'),('05033','14'),('05034','14'),('05035','14'),('05036','14'),('05037','14'),('05038','14'),('05039','14'),('05040','14'),('05041','14'),('05042','14'),('05043','14'),('05044','14');
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
  `uploaded_exam_file` longblob,
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
INSERT INTO `student_exam` VALUES ('010101','068798452',100,'1','','fine','1',NULL),('010101','159753684',0,'','1#2','fine','1',NULL),('010101','252525252',0,'','1#1','too bad','1',NULL),('010101','500000000',100,'1','','fine','1',NULL),('010104','068798452',45,'1,2','3#3','fine','1',NULL),('010104','159753684',100,'1,2,3','','fine','1',NULL),('010104','252525252',45,'1,2','3#2','ok','1',NULL),('010104','500000000',45,'1,2','3#3','fine','1',NULL),('010106','068798452',94,'01001,01003,01011','01013#2',NULL,'0',NULL),('010106','123456789',39,'01001,01013','01003#3,01011#4',NULL,'0',NULL),('010205','068798452',66,'1,2','3#3','fine','1',NULL),('010205','159753684',67,'1,3','2#3','fine','1',NULL),('010205','252525252',100,'1,2,3',NULL,'great','1',NULL),('010205','500000000',67,'2,3','1#3','fine','1',NULL),('020502','068798452',100,'02004','',NULL,'0',NULL),('020502','123456789',0,'','02004#','too bad','1',NULL),('061309','159753684',0,NULL,'06014#1,06015#1,06016#1,06017#1,06018#1',NULL,'0',NULL),('061309','252525252',0,'','06014#1,06015#1,06016#1,06017#1,06018#1',NULL,'0',NULL),('061309','500000000',0,'','06014#1,06015#1,06016#1,06017#1,06018#1',NULL,'0',NULL);
/*!40000 ALTER TABLE `student_exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_manual_exam`
--

DROP TABLE IF EXISTS `student_manual_exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_manual_exam` (
  `exam_id` varchar(7) NOT NULL,
  `student_id` varchar(45) NOT NULL,
  `uploaded_file` longblob,
  PRIMARY KEY (`exam_id`,`student_id`),
  KEY `student_manual_exam_student_id_idx` (`student_id`),
  KEY `student_manual_exam_exam_id_idx` (`exam_id`),
  CONSTRAINT `student_manual_exam_exam_id` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`exam_id`),
  CONSTRAINT `student_manual_exam_student_id` FOREIGN KEY (`student_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_manual_exam`
--

LOCK TABLES `student_manual_exam` WRITE;
/*!40000 ALTER TABLE `student_manual_exam` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_manual_exam` ENABLE KEYS */;
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
  `head_department_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`subject_id`,`subject_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES ('01','Mathematics','319003935'),('02','Computer Science','319003935'),('03','Physics',NULL),('04','Chemistry',NULL),('05','Biology',NULL),('06','Electricity','319003935');
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
INSERT INTO `users` VALUES ('023456781','Yehuda','Levi','yehuda@gmail.com','yehuda','123456','student',0),('068798452','Yana','nana','yana@gmail.com','yana','123456','student',0),('078543399','Yarden','Vizel','yarden@gmail.com','yarden','123456','student',0),('087452683','Bar','Zomer','bar@gmail.com','bar','123456','student',0),('123456789','Almog','Kadosh','almog@gmai.com','almog','123456','student',0),('135791113','Roni','Aloni','roni@gmail.com','roni','123456','professor',0),('147852369','Barak','Obama','obarak@gmail.com','barak','123456','student',0),('159753684','Dana','Cohen','dana@gmail.com','dana','123456','student',0),('209146943','Daniel','Armaganian','daniarmag@gmail.com','daniel','123456','professor',0),('222233334','Aviv','Peretz','aviv@gmail.com','aviv','123456','student',0),('224466880','Shira','Oren','shira@gmail.com','shira','123456','head',0),('245890666','Omer','Adam','omer@gmail.com','omer','123456','student',0),('246810121','Alon','Ahron','alon@gmail.com','alon','123456','professor',0),('252525252','randa','rousi','r@gmail.com','randa','123456','student',0),('315730176','Tzahi','Bakal','tzahi.bakal@gmail.com','tzahi','123456','professor',0),('319003935','Matan','Czuckermann','cz.matan@gmail.com','matan','123456','head',0),('320126999','Idan','Raichel','idan@gmail.com','idan','123456','student',0),('321455555','Yossi','Adi','yossi@gmail.com','yossi','123456','head',0),('323232323','Ron','Gabay','ron@gmail.com','ron','123456','student',0),('326789112','Bill','Gates','bill@gmail.com','bill','123456','student',0),('333444555','Noa','Kirel','noa@gmail.com','noa','123456','professor',0),('342255667','Gili','Bili','gili@gmail.com','gili','123456','student',0),('345678912','Maya','Zamir','maya@gmail.com','maya','123456','student',0),('398765432','Ben','Ashor','ben@gmail.com','ben','123456','head',0),('432456432','Anna','Zak','anna@gmal.com','anna','123456','student',0),('500000000','Guy','Edri','guy@gmail.com','guy','123456','student',0),('654322889','Yael','Shalbia','yael@gmail.com','yael','123456','student',0);
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

-- Dump completed on 2023-06-15 18:42:08
