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
INSERT INTO `exam` VALUES ('01','01','01','010101',1,60,'Don\'t forget to do something!','Don\'t forget to do nothing!','Daniel Armaganian','209146943','8520','0','Computerized','Algebra1 2022'),('02','02','05','020502',1,60,'Yes	','No','Daniel Armaganian','209146943','1234','0','Computerized','OOP 1921'),('03','02','04','020403',2,120,'Don\'t forget to free memory!','Don\'t forget to give a factor!','Daniel Armaganian','209146943','0010','1','Computerized','C Programming 1936'),('04','01','01','010104',3,45,'Good luck!','Make a lot of noise during the exam.','Tzahi Bakal','315730176','0110','0','Computerized','Algebra1 2020'),('05','01','02','010205',3,10,'','','Daniel Armaganian','209146943','1234','0','Computerized','Algebra2 2031'),('06','01','01','010106',4,90,'Good luck!','','Daniel Armaganian','209146943','3q4k','0','Computerized','Algebra1 2000'),('07','01','08','010807',1,20,'','','Daniel Armaganian','209146943','zqq9','0','Computerized','Calculus1 2012'),('08','01','02','010208',0,30,NULL,NULL,'Daniel Armaganian','209146943','6565','0','Manual','Algebra manual');
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
INSERT INTO `manual_exam` VALUES ('010208',_binary 'PK\0\0\0\0\0!\02‘oWf\0\0¥\0\0\0[Content_Types].xml ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0´”\Ëj\Ã0E÷…þƒÑ¶\ØJº(¥\ÄÉ¢ehúŠ4NDõB£¼þ¾\ã81¥$14\É\Æ \Ï\Ü{\Ï1ƒ\ÑÚšl	µw%\ë=–“^i7+\Ù\×\ä-d&\á”0\ÞA\É6€l4¼½L60#µÃ’\ÍS\nOœ£œƒXø\0Ž*•V$:\ÆB~‹ðû^\ïK\ï¸”§Úƒ\r/P‰…I\Ù\ëš~7$²\ì¹i¬³J&B0ZŠDu¾t\êOJ¾K(H¹\íÁ¹xG\rŒL¨+\Çvººš¨dcÓ»°\Ô\ÅW>*®¼\\XR§mpúª\ÒZ}\í¢—€HwnM\ÑV¬\Ðn\Ï”\Ã-\ì\")/\ÒZwB`\ÚÀ\Ë4¾\Ýñ	®°s\îDXÁôój¿\Ì;A*Êˆ©\Ëc´Ö‰\Ö\04\ßþ\Ù[›S‘\Ô9Ž> ­•ø±÷{£V\ç4p€˜ô\éW\×&’õ\ÙóA½’¨\Ù|»d‡?\0\0\0ÿÿ\0PK\0\0\0\0\0!\0‘\Z·\ï\0\0\0N\0\0\0_rels/.rels ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¬’Áj\Ã0@\ïƒýƒÑ½Q\ÚÁ£N/c\Ð\Û\Ù[IL\Û\Øj\×þý<\Ø\Ø]\éaG\Ë\ÒÓ“\ÐzsœFu\à”]ð\Z–U\rŠ½	\Öù^\Ã[û¼x\0•…¼¥1x\Öp\â›\æöfý\Ê#I)Êƒ‹YŠ\Ï\Z‘øˆ˜\ÍÀ\å*Dö\å§i\")\Ï\Ôc$³£žqU\×÷˜~3 ™1\Õ\ÖjH[{ª=E¾†º\Î~\nf?±—3-\ÂÞ²]\ÄTê“¸2j)õ,\Zl0/%œ‘b¬\n\Zð¼\Ñ\êz£¿§Å‰…,	¡	‰/û|f\\Zþ\çŠ\æ?6\ï!Y´_\áoœ]Aó\0\0ÿÿ\0PK\0\0\0\0\0!\0 ¹Y¸£\0\0K?\0\0\0\0\0word/document.xml\ì[\Ín\ã8¾°\ï@ø´L\"JÔ¯\ÑIC\Ö\Ïl\Ènz°\Ø##Ñ–I(:Ž÷41\ÌqOs\Ø\Ê}ŸdIùO’·\ì\Îô$\Ó\ê\0-‹?«\ê+E\ê\Ýû\Ç<„U)-®F\ê%RD4N‹\Ù\Õ\èÇ\á…=\ÇEŒ3Z«Ñ’T£÷\×ù\æ\Ýb\Óhž“‚QT\ãE]\ÎË±¢TQBr\\]\æi\ÄhE§ü2¢¹B§\Ó4\"Ê‚²XÑ \n\ë_%£©*ÑŸ‡‹\\\Öp\Ñc?´˜\á…h,u%J0\ã\äq‡¡žb(Žb\ïig\0‰j\ê>:\ÊT¤T{@úY@Bª=$\ã<¤ƒ3\ÏC\Òö‘¬ó\Ð>’}Òž;\åûNKRˆ\Ê)e9\æ\â–Í”³ûyy!€K\ÌÓ»4KùR`Bsƒ\Ó\âþ‰D«-BŽ\â“,%§1\ÉP¼A¡W£9+\Æ\ëö\ÛöRôñªýú²mA²~ÝŠ\î…<ò¬â›¶¬\îV\Íýu`©µ¦0’	=Ò¢J\Òròs\ÑDe²y8¦€‡<\Û<·(ÕžT{.´ù+3\ì\0ûˆ¿¶]ž­$?Ž¨\ÂÖ”\Û}Dh÷¹‘$¼\ëø,\Õ4”«ö>\0mÀŒH\Ï\Ébƒa¯1”h\Çn‰“ö¤\Õge‰“\î«öŒ]a\Z\0ñü$\rm\äÙ¼U\Å<NNƒ\Û\ØH‘m1\Ç	®¶¤‘ˆ\ä´\Z[¸e\Þ\Ðw9û<R}\Ï\è¼Ü¡¥Ÿ‡öa^2\Ñ9kM\ÎfÀ¨>O˜\Û—\"\ê\æ\ÑøÃ¬ \ßeB\"A5 \Øj\Èÿ…\Ó\ÉKý“<\Ö\å\Ò\Ö@Æ«Ñµ\È\Ð\îh¼”\×R\Ô\é\ã3üA8¸á¸®c@T—Šù\ËR}\âº\ËrE\éXdƒñ?®FP˜Î„hW\ä“)žg\\\Ö Wu\íÉ¦\æ¦ñp\Ý\á\r“¶ºd¸˜‰°˜=Hqñ\ã\íH¹~§¬«•\Ý\Ó}›,\Æüú\ïsRÕ³ñ\nð„\09\áž\ÊÂ±|”¯\Z¬z\Ø×‚\ê¾\ãa[\Öú\ß1-Ü°\ãªi×¼€j@wB\ÝFª\ì\è…\ÐË¶i!œoœ‘©h‚L(\åÞŽŠ…´\à•¨\ÆU”\n^zøfi‘J\È\Ä-ªNQT5\îkœ\ê\ß¥hú¦Ä“€²tp€”\\\Ò?T J\Ò\èž Á\n\Ì(k‡]\ÒùûNŠ‚À¶‘\Û6FÈ¿ß±ú‘\ÚÔœRÏ£\äiv/O#*RW\îðIF‡6\Ô=m£›¾\áY~(K£¿£\Ë\é~\\•8³s\ÉHE\Ø]ƒ&’\ï	g±´9ˆ)¨J\Êx\Õ\Çú–\í\È÷Ô¶õ\r3„ôd ¬ÿZ(ÿ7º\09.–@˜šU€NA•RJ{K³„\Ä\"&\È\×g\â‚3ž,ûx€f\ÙþÄ±;ù2\'º®†N\Û6R¶Á^	ÿ—]\àbm.X¦\Î9a\Â]¦-ghódÔ»\íÃ¯\Ô:\ÇfhžŽl£b‘g \ÏFZ‹`¶f¸Á®\èSk?^l]\Ô XyË—\ÙHÑ—gXÿ%Ù«0mŸtA¾\ä	H«ÿýô\Û\Ûd\Õe™y¦k\è¾\Þv\\\Ã\Ô\rúr%;8\î‘3\Ò\\Cõt£­=\Óô \ê¢\í¬8h\ï\r\Ñ\ÞÇ¬¹\ÐJ«÷KF\é4`r<|YŠYz\Æp~\Ë1\ãk\í¿•Š°vÙŽ\Ï.(\âu\ÛC™¥\ézRQ›:ô,c¢¶3\Ë!~\ì\Ç7Ý‘¯]\Z\ÚS¡£\Z°ŽÉƒö\ÞZü¸­—\å`–>ª\Î\×3\Ê\åBn#\Ç\ÂR}\Ó1µNþ¬ùª¥Ùž\\¶D8FL\Ï6 ew´gš\Ðt­‰=h\ï\r†‘\í—<\ßm—þ’o-º=3/Û†¯iZçj…º:Cfú	Bi6B\Ð\×:;y¦i{ª[\ët\Ð\Þ[#”\×\Ü4‹pr|OjVM	\ÉÀáœ°Kð‘Í‰2\ÅYE:s\Úv \ìû\Ú\Ç\Þ\'`¨HuÕ‘³E\Ó\åµ\êP5—?0\á[¦\ëwvÎ¡Ðž:\Ãû¿·0\Ü,Û½¨\0f­]×¯8R@¶:©„\ÈPÍ†c‘\â°ö\Â\É\Ä6\ê-³\æJGw\ÉD÷\í½½Hqx\Ë\î_\"³Xo\Øo7\ëAZ\Ô\ç\Ê\È)\ÒböÀ\Åj;‘Š`³\Ú\é\ÝOD.AŸ\é;°‘\n½\Î	\Í\Ðl\ë§H©NL]$üCQ–&(©\Õo\çž\Õ\ÞñCzÿ¾Ä¤%©F‹l¹;Q3	]\è\ëc‚oLÔ¦³„·ˆÕ‡Wzh:\ÊÀ\Ü\Ü\Ó ô‘Öžìž§ÐŸ\Ë3ž™\×ô	tà¤“\ëžUµ\×_‹¢j·zul9¼\Æ@$º1øk7—=\0IZ›F\Õ)\Â3žõ\Ä\Ó\ÏO¿=ýúôñ÷\Ë\Ó_H\è—\Ôò·/§\È/›·€x—\Ï.p\Ó‰h„°³“eÈžõ²xˆ“\ë3öjØž\ß92 û¾\ï\è\îg\Å5L\Ýò¶oûo\í}Áò‡ö±\ë\Ë\Ó@}òd8šå‡e\Þ\ïô-ÈŸ€$‰ø\rë«–zˆ³[)\ÆB\ähª#?…Â‹ß¦\ìUÿ\å\ì,9-e§¯N:\Ë$pw{G9§ù\î~uFus—Ñ¯kZM)\å\Û\Ù\\®Ô„T«î„‹H¬ª|¦.Žiô=“_U…þ\ÈMÊ£d{VÙŒ»þ¹ú´J\Ù}ý\0\0\0ÿÿ\0PK\0\0\0\0\0!\0³¾‹\0\0¶\0\0\0word/_rels/document.xml.rels ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¬“\Íj\Ã0„ï…¾ƒ\Ø{-;mC	‘s)\\[÷d{ýCõc¤MZ¿}EJ‡ÓƒŽ3bg¾…\Õzó­; ó½5²$†¦²uoZ\Åö\á˜\'ij©¬A#z\Ø\ä÷w\ë7T’Â\ïúÁ³b¼€ŽhXq\î«µô‰Ð„—\Æ:-)H\×òAVŸ²E¾H\Ó%w\ÓÈ¯2Ù®\àvõ#°bð?Ù¶iú\n_mµ\×h\èF÷H6ó!SºIÀ\ÉIBð\Û‹¨4*œõ\\}³\Þ\ìu‰.l|!8[sË˜fñp”¿f6\Çð“¡±†\nYª	\ÇÙšƒxŠ	ñ…\åûŸ“œ˜\'~õ\Ûò\0\0\0ÿÿ\0PK\0\0\0\0\0!\0¶ôg˜\Ò\0\0\É \0\0\0\0\0word/theme/theme1.xml\ìYK‹G¾ò†¹\Ëz\Í\èa¬5\ÒHòk\×6Þµƒ½Rk¦­ži\Ñ\ÝÚµ0†`Ÿr	œC¹\åB1\Ä\ä’c°Iœ‘\êI3-õÄ]ƒ	»‚U?¾ªþºªºº4s\á\âý˜:G˜Â’Ž[=WqœŒØ˜$aÇ½}0,µ\\GH”Œe	\î¸,Ü‹;Ÿv—Ž±ò‰8:n$\å\ì|¹,F0Œ\Ä96\Ã	\ÌM‘„.\ËcŽŽAoLËµJ¥QŽI\\\'A1¨½1™v”Jwg¥|@\á_\"…\ZQ¾¯TcCBc\ÇÓªúP\î!\Úqa1;>À÷¥\ëP$$LtÜŠþs\Ë;\Êk!*dsrCý·”[\nŒ§5-\Ç\ÃÃµ \çù^£»Ö¯Tn\ã\ÍAc\ÐX\ë\Ó\04\ZÁNS.¦\Îf-ð–\Ø(mZt÷›ýz\ÕÀ\çô×·ð]_}¼¥Mo?™\rs ´\éo\áý^»\×7õkP\Úllá›•n\ßk\Zx\rŠ(I¦[\èŠß¨«Ý®!F/[\ám\ß6kKx†*\ç¢+•OdQ¬\Å\è\ãC\0h\ç\"IG.fx‚F€%‡œ8»$Œ ðf(a†+µÊ°R‡ÿ\ê\ã\é–ö(:QN:\Z‰­!\Å\Ç#Nf²\ã^­nò\êÅ‹—ž¿|ôû\ËÇ_>úu¹ö¶\Üe”„y¹7?}ó\Ï\Ó/¿ûñÍ“o\íx‘Ç¿þ\å«\×üù_\ê¥A\ë»g¯Ÿ?{õý\×ýü\Ä\ïrt˜‡\ç:>vn±6hY\0ò÷“8ˆ\ÉKt“P )z #}}(²\àzØ´\ã\é\Â¼4¿gÞø\\ðZÀ=\Æhqëž®©µòV˜\'¡}q>\Ï\ãn!td[;\Øðò`>ƒ¸\'6•A„\rš7)¸…8Á\ÒQslŠ±E\ì.!†]÷Èˆ3Á&Ò¹Kœ\"V“C#š2¡\Ë$¿,lÁß†mö\î8=Fm\êûø\ÈD\Â\Ù@Ô¦SÃŒ—\Ð\\¢\Ø\Ê\Å4\ÜE2²‘\Ü_ð‘ap!Á\Ó!¦\ÌŒ±6™|aÐ½i\Æ\îö=ºˆM$—djC\î\"\Æò\È>›ŠgV\Î$‰ò\Ø+b\n!Šœ›LZI0ó„¨>ø%…\î¾C°\áî·Ÿ\íÛ†\ì¢f\æ\Üv$03\Ï\ã‚N¶)\ïò\ØH±]N¬\ÑÑ›‡Fh\ïbL\Ñ1\Zc\ìÜ¾bÃ³™aóŒô\Õ²\Êel³\ÍUdÆª\ê\'X@­¤Š‹c‰0Bv‡¬€\Ï\Þb#ñ,P#^¤ùú\Ô™\\u±5^\éhj¤R\ÂÕ¡µ“¸!bc…ZoF\È+\Õöx]p\Ã\ïr\Æ@\æ\Þ\È\à÷–\ÄþÎ¶9@\ÔX ˜U†-Ý‚ˆ\áþLD\'-6·\ÊM\ÌC›¹¡¼Qô\Ä$yk´Qûø¯ö\n\ã\ÕO-\ØÓ©w\ìÀ“T:E\Éd³¾)\ÂmV5\ãcò\é5}4Onb¸G,Ð³šæ¬¦ù\ß\×4E\çù¬’9«d\Î*»\ÈG¨d²\âE?Z=\è\ÑZ\âÂ§>B\é¾\\P¼+t\Ù#\àì‡0¨;ZhýiAs¹œ9\Òm‡3ù‘\Ñ~„f°LU¯Š¥\êP83& p\Ò\ÃV\Ýj‚\Î\ã=6NG«\Õ\ÕsM@2‡\Âk5ešLG\Í\ì\ÞZ½\î…úAëŠ€’}¹\ÅLu‰\æjð-$ô\ÎN…E\ÛÂ¢¥\Ô²\Ð_K¯À\å\ä õH\Ü÷RFn\Òc\å§T~\å\ÝS÷t‘1\Ím\×,\Ûk+®§\ãiƒD.\ÜL¹0Œ\àò\Ø>e_·3—\Zô”)¶i4[\Ã\×*‰l\äš˜=\ç\Î\\\Ý5#4\ë¸ø\É\Íxú„\ÊTˆ†I\ÇÉ¥¡?$³Ì¸}$¢¦§\Òý\ÇDb\îPC¬\ç\Ý@“Œ[µ\ÖT{üDÉµ+Ÿž\åôW\Þ\Éx2Á#Y0’ua.Ub=!Xu\ØH\ïG\ãc\ç\Îù-†ò›UeÀ1rm\Í1\á¹\àÎ¬¸‘®–G\Ñxß’QDgZ\Þ(ùdž\Âu{M\'·\ÍtsWf¹™\ÃP9\éÄ·\îÛ…\ÔD.i\\ \êÖ´çw\É\çXey\ß`•¦\î\Í\\\×^åº¢[\â\äBŽZ¶˜AM1¶P\ËFMj§X\ä–[‡f\ÑqÚ·ÁfÔªbUW\ê\ÞÖ‹mvx\"¿\Õ\êœJ¡©Â¯Ž‚\Õ+\É4\è\ÑUv¹/9\'÷A\Å\ïzA\ÍJ•–?(yu¯Rjù\Ýz©\ëûõ\êÀ¯Vú½\ÚC0ŠŒâªŸ®=„ût±|o¯Ç·\Þ\ÝÇ«RûÜˆ\Åe¦\ë\à²\Ö\ïî«µ\âw÷\Ë<hÔ†\íz»\×(µ\ë\Ýa\É\ë÷Z¥v\Ð\è•ú \Ùö¿\Õ>t#\röºõÀkZ¥F5J^£¢\è·Ú¥¦W«u½f·5ðº—¶†¯¾W\æÕ¼vþ\0\0ÿÿ\0PK\0\0\0\0\0!\0G©õ‘<\0\0:\0\0\0\0\0word/settings.xml´V\ßo\Û6~°ÿÁ\Ðóý²G¨S\ØN½¤ˆ×¢Î°gJ¤,\"¤(”w\Øÿ¾#%ZN“I‹¼\Ø\ä}w\ß\Ç;½{ÿÀ\ÙhG¤¢¢žy\áY\àH]L\ë\í\Ìûûn5žz#¥Q5™y¢¼÷—¿ÿönŸ)¢5¨©P\Ô*\ã\ÅÌ«´n2\ßWEE8Rg¢!5€¥i\ØÊ­Ï‘¼o›q!xƒ4\Í)£ú\àGAz=˜y­¬³žb\Ìi!…¥6&™(KZþ\ÏYÈ—ø\íL®D\ÑrRk\ëÑ—„A¢Vm”c\ã?\Ë`\åHv?:ÄŽ3§·ƒw/$>Z¼$<c\ÐHQ¥\à‚8s\Òzp<yBtô}¾û#Z*0»:<yAô„ -\È\Ã\ë8¦=‡–§<¿Ž\'=ò\Ð!±aúsÁœ(¬qõ*–\È\å\Õ7¶H£\n©cFòº ’#Ý9R\ì%U\ÓA·4—Hvo²/^d7\ÛZH”3Jg·?²Ñ™_H¢ù³Kò`\å&\Þ%ôˆ¯Bð\Ñ>kˆ,\à¡@ƒ	\Ï7\0”§(7\Zi \ÈTC³§`\Ç}¶•ˆC¯pkƒI‰Z¦\ïP¾Ñ¢¥‚ƒG=eQ!‰\nM\ä¦A°-E­¥`N‹¿„^Bß‘ð,zÛ…†Õ¦\ëh`Q#G}Ô¥\ÖY+\é\Ë\ï\ÄX\ïar\êò[G:°¤˜Ü™oô‘¿¡_É¼\Æ[¥)0\Ú^õü(\0RÏŸ (\î\rY¤[H\Ó9³7±b´YS)…¼©1\ÔÆ›9£eI$8 Pkk(*\Å\Þ\æùš ƒ\ïü¶Šü\Êð&\ã;(\Ëû…\ÐZð\ëCSA®\í&m½û§\å\ã+·ø\"„>ª\áE¼:Ÿw‘\ZôI\Ò ~ù®M<\ç\Ó\ÅsH’NÎ—\Ó\çi”\Ì?D\Ï\"“$Jmý\ãxf\ég\éV\æ!Œxg±D<—\Öf\ÔúF#—÷Z;<\'\Ð\Ï\È)²isŽ\Ç 8blW\â\0›Nžaªš+R\Ú5[#¹x{\rù¬º\Ò\Ç#—\érDþ)E\Ût\è^¢¦+p§N&½%­õ-\åN®\Ú|\ã¬j\èÀ\'P[\ãO;ió4¤gŸi(\Û(n‘-¼œbSNd|s\ÛW&“SUdš¦+\Î|\Î<F·•M=i\Øaø$³›|õXd±¨\Ã\ì\æh \Ý/Y\äd\'z±“Åƒl\âd“A–8Y2\ÈR\'K¬‚v$a6\Ü\ÃÁ\Ü\Ò\ÈKÁ˜\Ø|=\àOD]T…\ZrÕ¨/\Ñ	úY¢F»Œ<À`\"˜jø\Òm(\æ\èÁÌ©(5\æ½6C\Ñ\êGº3\Ê\Íc3\Ãû\Î\à?2¶5þM,f¤\êqs\àù0©ÎºÀU\ÐU\ZjZH‡ýa±p’aQÜ˜¹;\é\ä\ÑE<\r.º a:\Ûa¨m\ã{ÿB\ÊR÷˜3M:\Ó\ç\é‡y´Z\Î\ÇóE²OÒ«p<¢x|\ÇË«\Åj/\Ï/þ\ë_©û\è¿ü\0\0ÿÿ\0PK\0\0\0\0\0!\0€4K\æ\0\0\Å\0\0\0\0\0word/numbering.xml¼–\Ûn\ã6†\ïô½L¨“%YXg‘d\ã\"Å¶Xl\Ó %\Ú\"\"’IŸö\é;\ÔÉŽ\å’8L›\ä|üg8$\ç\Ë\×=\Ë\'[\"|n9·¶5!<)\å\ë¹õ\ß\Ë\â&²&Jcž\â\\p2·DY_\ï~ÿ\í\Ë.\æ¶$&N€ÁU¼+’¹•i]\Ä©$#«[F)”X\é\ÛD0$V+š´2E®\í\Ø\å·BŠ„(œGÌ·XY5.\Ù÷£¥\ïÀ\Ø\0}”dXj²?2œÁ)š¡¨rG€ÀC\×é¢¼Á¨\0U?\nª:¤\é8\Ò\ç‚q$·K\nÇ‘¼.)\ZG\ê¤\ë&¸(‡Á•kø)×ˆaùº)n\0\\`M—4§ú\0L;h0˜ò\×ŠÀª%0/L)É½´¡ˆ¹µ‘<®\íoZ{#=®\ìë¦µ y¿ea¹\"{+\Ý\Ø\Ê>±«Ì¿‰d\Ã\×eÔ$9\ÄQp•Ñ¢½\ØX\Zf\rdûQ\0¶,o\æ\í\n§\çQ{\ïjûVm\Ã\ØG~½w,¯”Lt\ì»i­E	o\×l”0\È\à\ãÂ£Bs\\§\ç\å\Ó\0\Ü HH\ÏÇ¢aD5%\Ç\Óm8´\ç±j8Õ®=\Ö\éyž‹9¤›A\×kt˜Æ˜Ÿ°Tª\Ól®\Ù#dl±\ÆV\í¡1D2\ÌÁi‹;°“x\ë\Ïª?¥\ØG\Zý\íùx½\îL¥3€U\Î\ÓC}NÌ¿.\à\ÖeIü¼\æB\âeŠ\à¨M\à´L\Ê0Ÿt¦)¿’}\Ùoözb\î+\ëJ4¼TZ\âDÿ³a“7¿ž!Ï¡\ÔZ,	\Ôw\ÒtV\Õ\ÜýJù 	~5S…+³N¼\Åpùûa`{‹©…\Ì\Û\äš~\'[’¿\n\Ò\Ì\ÉKIÓ¿\ÍXnÆª¹šy3\ãÑ±Ÿž|»\ZÉ·f€BS‰Šu‘\ÃK\ëOAzA©¡\ÔØ˜;• \Öv¦$¡×‹\ëžŸf\ì\ç¶\íÿ+izs²\ÒUwñCš†r\ã§\éž[¡[J\É0_—µ°”jQ;Y\Ö\ÍBp­LtUB!\ï%\Æò\âvò;Q§ƒ”k#y…!J•†D\äB6\Ò\ÏüW\êW\ëwTK(\×F¥;\çtŽ„Ä„?gVöÀ¯è–˜ýš‹‘ß‰†t¸TwpP\ßÿ0ª—]r;.=|Æ¥Ÿ‚a~\Ù#\ï’G’®³÷]r\à­KN\Ô\Ã%\ï\Ü%{1Ò¥\Ó\Þ¼Cn\Ø!ÿzI7\ìx0Â¥\éÕ’.žt¾wv;õJº\à:IÞ¡©=\æZ¯—t\Ñp—Â³k¡—K\ÑÕ’n6<\éÿ\ìjx\'\éÐ›J£–6)?M\Ùa¨²t‰\ÓMYØ˜\Î\é,|\ß	§\çeË³Y¿×¬\Å\r³j«‚\å\î\0\0\0ÿÿ\0PK\0\0\0\0\0!\0w¬õ´\É\0\0\Âs\0\0\0\0\0word/styles.xml¼[sÛº\Ç\ß;\Ó\ïÀ\ÑSû\ÈòEN2\Ç\çŒ\ã$µ§v\â9\Í3DBjPy‰\í~ú %A^‚\â‚[¿$\Öe\0ñ\Ç‰\åM¿ýñ”\Ê\è\Ï¡²³\Ñ\ä\íÁ(\âY¬‘ÝŸ~\Ü}yón%\Ë&U\Æ\ÏFÏ¼ýñû_ÿò\Ûã‡¢|–¼ˆ4 +>¤ñ\ÙhY–«\ãq/yÊŠ·j\Å3ý\áB\å)+õ\Ëü~œ²ü¡Z½‰Uºb¥˜)\Ê\çñ\áÁÁt\Ô`ò>µXˆ˜Rq•ò¬´ñ\ãœKMTY±«bM{\ìC{Ty²\ÊUÌ‹Bot*k^\ÊD¶ÁLŽ(q®\nµ(\ß\êizdQ:|r`ÿJ\åp‚À4\æO8Æ»†1Ö‘.G$8\Ît\Ã‰\Ã	\ëŒ(’2Y¢(‡\ëq›XV²%+–.‘\ã:u²Á=§fŒ\Òø\Ã\Õ}¦r6—š¤U´p‘›õö›ÿ\ìŸüÉ¾o6aô»öB¢\âO|Á*Y\æe~›7/›Wö¿/*+‹\èñ+b!\îtu+©\Ð\r^žg…\éO8+\ÊóB°\Ö—\æ\ÖO\â¢t\Þþ(1\Z›‹ÿ\ê1y6:<\\¿saz°óždÙ½\ÓöÙˆgo~\Ìw®IzHù›«kó\Õq³)õÿ\Î®^¾²M­X,,™-J®=™¨&ž¼_¿ø^™\áfU©šF, þƒƒ1\Ö~\×\îŸ\ÕIH\Ê\×*~\àÉ¬\Ôœl[ú\ÍW·¹P¹N4g£÷¶MýæŒ§\âR$	Ïœ/fK‘ðŸKžý(x²}ÿ\Ï/6Y4oÄª\Êô\ßG§S«»,’\ÏO1_™Ô£?Í˜Q\á«	\æÛ•\Ø6n\Ãÿ³†Mš±o‹_rfòo4y‰°\ÝG!MD\álm;³z±\íö[¨†Ž^«¡\ã\×j\è\äµ\Zš¾VC§¯\ÕÐ»\×j\ÈbþŸ\r‰,Ñ©\Þ~6¨û87¢9³¡9/¡9« 9\' 9ž‰Ž\æx\æ1šã™¦N©b\ß,t&û‘g¶ws÷\ï#Â¸ûw	a\Üý{€0\îþ„\ÆÝŸ\ßÃ¸û\Óywö\ã\îO\Öxn½ÔŠ®´Í²r°\ËJ•™*yTò§\á4–i–-Jixf§\Çs’$ÀÔ™­\Ù¦\ÅÌ¾\Þ?C¬I\Ã÷ç¥©\í\"µˆ\â¾\Êy1¸\ã<ûÅ¥Zñˆ%‰\æs^V¹gDB\æt\Î<\çY\Ì)\'6\ÔT‚QV¥s‚¹¹b÷d,ž%\ÄÃ·&’$…Í„\ÖõóÒ˜DL\ê”Å¹\Z\Þ5\Å\ÈòÃµ(†•D+)9\ë+\Í³¬áµ\Å/\r,fxe`1\ÃG3ª!jhD#\ÕÐˆ¬¡[=?©Æ­¡[C#\Z·†6|\Ü\îD)mŠwW“þ\Ç\î.¤2§÷c&\î3¦\0\Ãw7\Í1\Ó\è–\å\ì>g«edŽC·c\ÝmÆ¶óQ%\Ï\Ñ\Å>mC¢Z\×\Û)r¡·Zd\ÕðÝ¡Q™k\Ã#²×†Gd°\ro¸\Ånô2\Ù,\Ð.i\ê™Y5/[MkI½L;c²ª´\Ã\Ý\Æ\Ê\á3lk€/\"/\ÈlÐŽ%˜Á_\Ír\Ö\ÈI‘ù¶½Þ±-k¸­^f%\Ò\î5H‚^J?Ð¤\á\Ë\ç\ÏuYö0˜ôEI©yBGœ•¹ª\çškùC+I/\ËNWKV[+\í ú\ï\ê\× D7l5xƒn%nŸß¤LÈˆnqywsÝ©•)3\ÍÀ\Ð\0?ª²T)³9ø·Ÿ|þwšž\ë\"8{&\Ú\Ús¢\ÃCv!v25I%D$½\Ì™ Ù‡Z\Þ?ùó\\±<¡¡\Ýæ¼¾\æ§\äD\ÄKWõ¢ƒÀ[:/>\êüC°\Z²¼±\\˜\ãBT¦º#9‡\r‹jþoOu_UDrd\è[U\Ú\ãv©k£\épÃ—	;¸\áK«¦\Þ=˜ùK°±;¸\á»ƒ£\Ú\ØÉŠBxO¡ó¨6wÍ£\Þ\Þ\á\Å_\ÃSR\å‹J\Ò\r\à\ZH6‚k \Ù*Y¥YA¹Å–G¸Á–G½½„S\Æò\ÉY\Þ?r‘‰aaTJX•F¥…‘\n0ü\n6ü26üZ\ZF´p`TóŒt÷Ot–ÇQ\Í3£šgF5\Ï,Œjž}Šøb¡Át»I5\ç$ÝŽ&+yºR9ËŸ‰Ÿ%¿gHk\Úm®\æf•\Õq \Í1jI¸Ø®qT\"ÿ\äs²®e¿Žˆ2)•\":¶¶\Ý\á\Ø\È\Ýk\×ö…\Ù{7w\áV²˜/•Lx\î\Ù&¬®—gõm/»o»\Ñ\ë°çµ¸_–\Ñl¹9\Ú\ïb¦{#\×ûN\Øþ\Û\Æ|º¾ƒ¥-\ì†\'¢J\×…7SLú\Û½|¼?x»’Ø‰<\é	Ûœ\îÜ®’w\"O{F\Â6\ßõŒ´>Ý‰\ìò\Ã\'–?´N„Ó®ù³©ñ<“\ï´km‚[›\íšH›È¶)x\Ú5‹v¬Ç±9[\0\Õ\é\ç|?óø\ã1.òS0vòSzûÊ\è2\ØwþK˜=;&i\Úö6WO€¼oÑ½2çŸ•ª\Û\ïœp\êS×•^8eZ9GýO\\\ídÿ8öN7~D\ï¼\ãGôN@~D¯L\ä\rG¥$?¥wnò#z\')?­\à—­`<.[Áøl)!\ÙjÀ*À\è½ð#\ÐF…´Q¬ü”QAxQ!mTˆ@\"\ÐF…0œQa<Î¨0>Ä¨bTHA\"\ÐF…´Q!mTˆ@5pm\ï\r2*¤ \nh£BÚ¨v½8À¨0gTbTH	1*¤ \nh£BÚ¨6*D \n(£‚ð £B\nÚ¨6*D Z\ßjnT3*Œ1*¤„R\ÐF…´Q!mTˆ@\"\ÐF…”QAxQ!mTˆ@\"\ÐFµ\'\Æ\ãŒ\n\ãCŒ\n)!F…´Q!mTˆ@\"\ÐF…´Q!eTdTHA\"\ÐF…ˆ®ùÙœ¢ô]f?Áõô^±\ßÿ\ÔUÓ©\ï\î­\Ü.\ê¨?j\Ý+?«ÿ½•zˆZo<<²õF?ˆ˜K¡\ì!j\Ïiu—k/‰@øüv\Ñ}‡KøÐ¥\æ^{\ÎÀûF‚c*\Ç]SÞE\Þq\×Lw#Áªó¸+ûº‘`7xÜ•t­/\×¥\è\Ý\îJ3Nð\ÄÞ•­p8\Ä]9\Ú	„#Ü•™@8À]ù\Ø	<‰Lr~}\Òsœ¦›\ëK¡k::„S?¡kZB­\Ö\é\Z£¯h~B_õü„¾2ú	(=½¼°~Za?*Ljh3¬\Ô\áFõ°RCB\Ô\0.5DK\rQaR\ÃÄˆ•\Z°R‡\'g?!Hj€	—\Z¢‚¥†¨0©\á®+5$`¥†¬\Ôw\È^L¸\Ô,5D…I\rwX©!+5$`¥†„ ©&\\jˆ\n–\Z¢Â¤U2ZjHÀJ\r	X©!!Hj€	—\Z¢‚¥†¨.©\íQ”©Q\n;\á¸E˜ˆ\Û!;¸\ä\ìTKNt`µ\ä«%¨\ÕZs\\µ\äŠ\æ\'ôU\ÏO\è+£Ÿ€\ÒÓ‹Á\ëG¡ö£Â¤\ÆUKmR‡\ÕOÀJ«–¼Rãª¥N©q\ÕR§Ô¸j\É/5®Zj“\ZW-µIžœý„ ©q\ÕR§Ô¸j©Sj\\µ\ä—\ZW-µI«–Ú¤\ÆUKmR\Ü!{1\áRãª¥N©qÕ’_j\\µ\Ô&5®Zj“\ZW-µI«–¼Rãª¥N©q\ÕR§Ô¸j\É/5®Zj“\ZW-µI«–Ú¤\ÆUK^©q\ÕR§Ô¸j©Sj\\µt£CÁ# f)\ËËˆ\îyq—¬X–lø\Ã	d9/”üÅ“ˆvS¯Q[9~\Üùù+Ã¶¿Æ§¿_\ê13O@wnWJ\ê\'À6@û\Å+Mbö¬L\'¢\æÁš®²}m\Î\ÔÖ\Ù\ØJ¼\Ô\Í\Ä\Íc«|­€f<O¤µ\Íng\Úú\Û\Í\Øm¦þ\ÞÎ°tö²43»«‡\Ï@Ôžðõ\ë}cò}\ÓÝ˜\Ëú\'\ÑôWY¢\ÍÏ\ÕLžXÒŸ_p)oXýmµòUòEY:9°$xñù¼~ºž7>·i\Ø\ïv¦~\Ùü,›g˜\ë\ç\í7\×ø†ú°e¨\í…*CG\Ùß¯+l{rzb\Ó\àö>¿z™\Æ3fµ_ivó¨9Ï¿u\âB­\í\ç\ïO\Î?7©³ù…<a\ç‚Q\Ò\\\Ó$û\Ø<á©¬˜l\îÔ®7ný›x\ÍF®ÿ*~ÿ\0\0\0ÿÿ\0PK\0\0\0\0\0!\0\ï\n)NN\0\0~\0\0\0\0\0word/webSettings.xmlœ\Ó_k\Â0\0ð÷Á¾CÉ»¦\Ê)Va\Ç^\Æ`\Ûˆ\éÕ†%¹’‹«\î\Ó\ïÚ©søb÷’ÿ÷\ã.!ó\å\Î\Ù\äô¹\rS‘€\×X¿\É\Åû\Ûj0	E\åe\ÑC.ö@b¹¸½™7Y\ëWˆ‘ORÂŠ§\Ì\é\\T1Ö™”¤+pŠ†Xƒ\ç\ÍƒS‘§a#\n\Ûz \Ñ\Õ*šµ±&\î\å8M§\âÀ„k,K£\áõÖ]¼`YDO•©\é¨5\×h\r†¢¨ˆ\ëqö\Çs\Êø3º»€œ\Ñ	\Ë8\äbu‡\Òn\ä\ì/0\éŒ/€©†]?cv0$Gž;¦\è\çLOŽ)Îœÿ%sP‹ª—2>Þ«lcUT•¢\ê\\„~IMN\ÜÞµw\ätö´ñ\ÔÚ²Ä¯žð\Ã%Ü¶\\\ÛuC\Øu\ëm	bÁ\ëhœù‚†û€\rA\í²²›—\çGž\È?¿fñ\r\0\0ÿÿ\0PK\0\0\0\0\0!\0¶Qa\çú\0\0K\0\0\0\0\0word/fontTable.xmlÔ“\ßn\Ú0\Æ\ï\'\í\"ß—80Š\Z*\Úi7»˜º0ŽC¬ùO\äc¼ýNœ2¡­¤w	œ\ïøü|¾\Ï\Ê\Ã\ãQ«\è Hkr’L(‰„á¶f—“Ÿ¯›»‰À3S0e\È\ÉI\0y\\}þô\Ð,Kk<D\Øo`©yN*\ï\ëe¯„f0±µ0X,­\Ó\Ì\ã£\ÛÅš¹_ûúŽ[]3/·RIŠSJ\ç¤Ç¸[(¶,%_-\ßka|èPH´*YÃ™\Ö\ÜBk¬+jg¹\0@\ÏZu<Í¤0\É\ì\n¤%wl\é\'h¦Ÿ( °=¡a¥\Õ H¯\0s.Ž\ã‹žc\ç%G\ã8ó#‹\ÎÇ†¹\0@\á‹j%=\ç\Z·½Ì³ŠAuI\ã†\Ê\ÜI·i¾ü¶3Ö±­B\Þz„pû‹þÛ¿°Ç ·Èª¢fi˜\ÆÎµ“L¹fÆ‚H°r`*\'\è\à‰\ÎéŒ¶^º\ïŒ\Ä\íF^1¢Eti\'—LKu:«\ÐH€®PKÏ«³~`x \ÎÜ•@î°°‡-\Í\É¥4}\ÙlH§$9yF\å\Ë\"{ê•´=+|\î{e:(´Ux\à„Ç¤\ãðÀö\à™q\çÿ*‡W©D\ßEý°š™¿$’b\"Sša*®§£qûÿ$ò\ÌVI#C·\Ý9w²ö£,®“$K\ç—\Ýd\ë?,&gCÿ¶xÿž\Å~«\ß\0\0\0ÿÿ\0PK\0\0\0\0\0!\0¿÷yÊ‹\0\0÷\0\0\0docProps/core.xml ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0œ’AN\Ã0E÷H\Ü!ò>u’BQ\Z$@\Ý\0E vÆž¶†Ä¶l—\Ð{°A \Ä\n¸‘¯ƒ“´)E¬\Ø\Íø¿ù\Z;;x,‹\à´\áRQÜ‹P\0‚J\Æ\Åtˆ.Ç£p\ÆÁH!\Ñ:È··2ªR*5œk©@[&ðNÂ¤T\r\Ñ\ÌZ•bl\èJbzž^œH]\ë[=ÅŠ\Ð{2œD\Ñ\0—`	#–\à\Ú0T#ZZ2\ÚYª¹.\ZF1P‚°Ç½¯Yº44\Ê²\äv¡\àOt%vô£\áXUU¯\ê7¨\ß?\Æ\×g§\ÍUC.\ê¬( <c4µ\Ügx]ú\Ê\Ìo\ï€\Úö¸k|M5+u~RH\ÍEp1#ZŠ†Z)u\æ÷°¨¤f\Æ\Ïotc`¨\æ\Êú—l\Ý7<]c\Ïü\ÓN8°\ÃE\î\ÞÜ«{qOûp\Ï\î\Ý}º¯\ÆôVOjx\àõÉ“†\è\Úlw»\"°ÀÇ”¶¡®”«þ\Ññx„ò$Júa´&û\ãx\î\Ò(º©·Ü˜_–\Ëþ\í¸2hƒ\Úüªù7\0\0\0ÿÿ\0PK\0\0\0\0\0!\0ðbW\Ø\0\0\Û\0\0\0docProps/app.xml ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0œSÁn\Û0½\Ø?º7rŠ4\ØEÅb\èa[\ÄmÏšL\'\ÂdIØ \Ù×²O\ÙvšO\Ô\Ó#)‹\Û\×\ÞVGˆ\Éx·fóY\Í*pÚ·\Æ\í\×\ì±ù|õU	•k•õ\Ö\ì‰\Ý\Ê÷\ï\Ä6ú\0\r¤Š$\\Z³bXqžôz•f”v”\é|\ìR÷\Üw\Ñp\çõKùu]/9¼\"¸Ú«0	²Qqu\Äÿm½\Îþ\ÒSs\n¤\'E}°\nA~\Ë\'\í¬õ\Ø>±¢ñ¨lczs¢§@l\ÕR\æF ž}l“üx#øˆ\Äæ ¢\ÒH”7‹¥\àE,>…`VH£•_Ž>ù«‡Áo•\Ï^–\êaú%\Z<\ÉZð2_Œ£û‚€ŒEµ*\Þ\ÜM‘\ØieaC\Ý\ËN\Ù‚ÿ&\Ä=¨¼Ù­2\Ù\ßWG\Ð\èc•\ÌO\Ú\í5«¾«yfkvT\Ñ(‡l,ƒÛ0\ÊÆ %\í)`YVb³\È&GpY8ƒÂ—\î†\ÒCG½\á?\Ì\ÎK³ƒ‡\Ñja§tv¾\ãÕ\ïƒr4_>!\Zðô\Z—_\Æ\Û/\Éb\ë\Ï» 4\íd¹¨\Ëý±#ZZè´“‰÷\ÔA´YŸÎº=´çš¿ùE=ÿªœ/g5}\Ã:sô¦ŸHþ\0\0ÿÿ\0PK-\0\0\0\0\0\0!\02‘oWf\0\0¥\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0[Content_Types].xmlPK-\0\0\0\0\0\0!\0‘\Z·\ï\0\0\0N\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ÿ\0\0_rels/.relsPK-\0\0\0\0\0\0!\0 ¹Y¸£\0\0K?\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¿\0\0word/document.xmlPK-\0\0\0\0\0\0!\0³¾‹\0\0¶\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0‘\0\0word/_rels/document.xml.relsPK-\0\0\0\0\0\0!\0¶ôg˜\Ò\0\0\É \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ø\0\0word/theme/theme1.xmlPK-\0\0\0\0\0\0!\0G©õ‘<\0\0:\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ý\0\0word/settings.xmlPK-\0\0\0\0\0\0!\0€4K\æ\0\0\Å\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0H\0\0word/numbering.xmlPK-\0\0\0\0\0\0!\0w¬õ´\É\0\0\Âs\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0^ \0\0word/styles.xmlPK-\0\0\0\0\0\0!\0\ï\n)NN\0\0~\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T,\0\0word/webSettings.xmlPK-\0\0\0\0\0\0!\0¶Qa\çú\0\0K\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ô-\0\0word/fontTable.xmlPK-\0\0\0\0\0\0!\0¿÷yÊ‹\0\0÷\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0þ/\0\0docProps/core.xmlPK-\0\0\0\0\0\0!\0ðbW\Ø\0\0\Û\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0À2\0\0docProps/app.xmlPK\0\0\0\0\0\0\0\0\Î5\0\0\0\0','C');
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

-- Dump completed on 2023-06-12 11:21:45
