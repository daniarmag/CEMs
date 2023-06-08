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
  CONSTRAINT `course_course_subject_id` FOREIGN KEY (`course_subject_id`) REFERENCES `subject` (`subject_id`)
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
  CONSTRAINT `exam_professor_id` FOREIGN KEY (`professor_id`) REFERENCES `professor_subject` (`professor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam`
--

LOCK TABLES `exam` WRITE;
/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
INSERT INTO `exam` VALUES ('01','01','01','010101',3,60,'Don\'t forget to do something!','Don\'t forget to do nothing!','Daniel Armaganian','209146943','8520','0','computerized',NULL),('02','02','05','020502',1,60,'Yes	','No','Daniel Armaganian','209146943','1234','0','computerized',NULL),('03','01','01','010103',2,40,'test','test','Daniel Armaganian','209146943','1234','1','computerized',NULL);
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
  CONSTRAINT `exam_question_question_id` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_question`
--

LOCK TABLES `exam_question` WRITE;
/*!40000 ALTER TABLE `exam_question` DISABLE KEYS */;
INSERT INTO `exam_question` VALUES ('010101','01001','100'),('010103','01001','50'),('010103','01003','50'),('020502','02004','100');
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
INSERT INTO `manual_exam` VALUES ('010201',_binary 'PK\0\0\0\0\0!\0ß¤\ÒlZ\0\0 \0\0\0[Content_Types].xml ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0´”\Ën\Â0E÷•ú‘·Ubè¢ª*‹>–-R\é{Vý’Ç¼þ¾QU‘\nl\"%3÷\Þ3VÆƒ\ÑÚšl	µw%\ë=–“^i7+\Ù\×\ä-d&\á”0\ÞA\É6€l4¼½L60#µÃ’\ÍS\nOœ£œƒXø\0Ž*•V$z3„ü3\à÷½\Þ—\Þ%p)Oµ^ “²\×5}nH\"d\Ùs\ÓXg•L„`´‰\ê|\éÔŸ”|—PrÛƒsðŽ\Z?˜PWŽ\ìtt4Q+\È\Æ\"¦wa©‹¯|T\\y¹°¤,N\Û\àôU¥%´ú\Ú-D/‘\ÎÜš¢­X¡Ýžÿ(¦¼<E\ã\Û)‘\à\Z\0;\çN„L?¯FñË¼¤¢Ü‰˜\Z¸<Fk\Ý	‘h¡yö\Ï\æ\ØÚœŠ¤\Îqôi£\ã?\ÆÞ¯l­\Îi\à\01\é\Ó]›H\Ög\Ïõm @\È\æ\Ûûmø\0\0ÿÿ\0PK\0\0\0\0\0!\0‘\Z·\ï\0\0\0N\0\0\0_rels/.rels ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¬’Áj\Ã0@\ïƒýƒÑ½Q\ÚÁ£N/c\Ð\Û\Ù[IL\Û\Øj\×þý<\Ø\Ø]\éaG\Ë\ÒÓ“\ÐzsœFu\à”]ð\Z–U\rŠ½	\Öù^\Ã[û¼x\0•…¼¥1x\Öp\â›\æöfý\Ê#I)Êƒ‹YŠ\Ï\Z‘øˆ˜\ÍÀ\å*Dö\å§i\")\Ï\Ôc$³£žqU\×÷˜~3 ™1\Õ\ÖjH[{ª=E¾†º\Î~\nf?±—3-\ÂÞ²]\ÄTê“¸2j)õ,\Zl0/%œ‘b¬\n\Zð¼\Ñ\êz£¿§Å‰…,	¡	‰/û|f\\Zþ\çŠ\æ?6\ï!Y´_\áoœ]Aó\0\0ÿÿ\0PK\0\0\0\0\0!\0\ã…Q¢<\0\0›\0\0\0\0\0word/document.xml¬—_o\Ú0À\ß\'\í;Dy§\Î*V\Ê\Ä\Ã$´®À8†X\ã\È6ö\éw\ÎB—®\n\éxÀñ\Ù÷»ó\Ùwq\îN<±ŽT*&Ò™\í\Þ9¶ES\"\"–\îgöË¯\Õ`b[J\ã4Â‰H\é\Ì>Se?Ì¿~¹\Ï\ÃH§©¶\0‘ª0\Ï\ÈÌŽµ\ÎB„‰)\Ç\êŽ3\"…;}GGb·c„¢\\\ÈyŽ\ëO™„*öqz\ÄÊ®p\äÔIœƒ²‰±\Ôô\Ô0Ü›!#4E“6\È\ë‚zn\åßŒ\nñª\ZöW-Ò¨\é\ÅýH^›4\îGòÛ¤I?R\ë8ñöMap\'$\Ç\Zºr8–¯‡l\0\àk¶e	\Óg`:AÁ,}\í\áh]Ün&ŒMü¨¦ˆ™}iX\é.ú\Æõ°Ô¯š‹Mº™sSDO:QºÖ•]bWª/«\ÂRD\rIš@Eªb–]ª\ïKƒÁ¸†?\nÀ‘\'õ¼<s;¦Ú¿JÛ²Ü†\Ø\Åýj\ïxRzþ1\Ñu:\ì¦A\\4º¸ð\Öf\í	‡\Ü\îš«\àº‹O\rðZ€€ÐŽ/‹š1©ˆ4\Ùm8¬cZÕœrW‡5u;\ÖÀ¿¹D‡›ž_ûa\Z£~\ÅR‘Ž\â\Ûpõ!£‹5Ž±º$!\Ò\Û8º\à\Îü*\Þ\ÙþsIõ]ŠC\Ö\Ð\Ø\çhë¦¼\æ\æ¢s«J\Îë‚¡>\ç\ÌsŒ3¨ºœ„\ë}*$\Þ&\à¤š\Ùb;`þ\áÐ™¦x¤§Bnö\Ú2õÊž\Ã\rm+¢³i3†–x\r|\ì»\Îr\â-\ìB\n\ï7m¤\îr¸|Z-F \r\á6ýœÙŽ3‚…?¼ˆ–t‡‰6#‹Go\ê.\n+\ÙFšF–M‚\Ó=\Ì?bxU\Ðtðòl£ù=ª†Q3»«J\êù\Ú\Ê1\Ü3µ°^)\Í,¦-¸Z\Ê\Ü=™63u9¿4\Ð^q0|ú6zZ­Þ®x\\ýÞ¬¸ZW-\Ú\Èw„ÿ-µ·Š½‘]\Ý(Œ\íŸ\Ã q×š«EBŽ»ÁÄŸCf\ÂlˆZÀ»\Æ‚\Åö±nº[¡µ\àM?¡»«Ñ˜âˆ‚Ý±WtwB\è«\îþ ‹®Sš#\"Q U&´œSˆ\á\á»4§4LXJ7Lð\ÒŠQT¯»x,*j¾*\æ\0\0\0ÿÿ\0PK\0\0\0\0\0!\0\Öd³Qô\0\0\01\0\0\0word/_rels/document.xml.rels ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¬’\Ëj\Ã0E÷…þƒ˜}-;}PB\älJ!\Û\Öý\0E?¨,	\Íôá¿¯HI\ë\Ð`ºðr®˜sÏ€6\Û\ÏÁŠwŒ\Ô{§ \ÈrèŒ¯{\×*x©¯\îAkWk\ë*‘`[^^lž\ÐjNK\ÔõD¢8R\Ð1‡µ”d:4e> K/ƒ\æ4\ÆVm^u‹r•\çw2NPž0Å®Vwõ5ˆjø¶oš\Þ\àƒ7o:>S!?pÿŒ\Ì\é8JX[d“0KD\çEVKŠ\Ð‹c2§P,ªÀ£Å©Àaž«¿]²ž\Ó.þ¶\Æï°˜s¸YÒ¡ñŽ+½·Ÿ\è(!O>zù\0\0ÿÿ\0PK\0\0\0\0\0!\0¶ôg˜\Ò\0\0\É \0\0\0\0\0word/theme/theme1.xml\ìYK‹G¾ò†¹\Ëz\Í\èa¬5\ÒHòk\×6Þµƒ½Rk¦­ži\Ñ\ÝÚµ0†`Ÿr	œC¹\åB1\Ä\ä’c°Iœ‘\êI3-õÄ]ƒ	»‚U?¾ªþºªºº4s\á\âý˜:G˜Â’Ž[=WqœŒØ˜$aÇ½}0,µ\\GH”Œe	\î¸,Ü‹;Ÿv—Ž±ò‰8:n$\å\ì|¹,F0Œ\Ä96\Ã	\ÌM‘„.\ËcŽŽAoLËµJ¥QŽI\\\'A1¨½1™v”Jwg¥|@\á_\"…\ZQ¾¯TcCBc\ÇÓªúP\î!\Úqa1;>À÷¥\ëP$$LtÜŠþs\Ë;\Êk!*dsrCý·”[\nŒ§5-\Ç\ÃÃµ \çù^£»Ö¯Tn\ã\ÍAc\ÐX\ë\Ó\04\ZÁNS.¦\Îf-ð–\Ø(mZt÷›ýz\ÕÀ\çô×·ð]_}¼¥Mo?™\rs ´\éo\áý^»\×7õkP\Úllá›•n\ßk\Zx\rŠ(I¦[\èŠß¨«Ý®!F/[\ám\ß6kKx†*\ç¢+•OdQ¬\Å\è\ãC\0h\ç\"IG.fx‚F€%‡œ8»$Œ ðf(a†+µÊ°R‡ÿ\ê\ã\é–ö(:QN:\Z‰­!\Å\Ç#Nf²\ã^­nò\êÅ‹—ž¿|ôû\ËÇ_>úu¹ö¶\Üe”„y¹7?}ó\Ï\Ó/¿ûñÍ“o\íx‘Ç¿þ\å«\×üù_\ê¥A\ë»g¯Ÿ?{õý\×ýü\Ä\ïrt˜‡\ç:>vn±6hY\0ò÷“8ˆ\ÉKt“P )z #}}(²\àzØ´\ã\é\Â¼4¿gÞø\\ðZÀ=\Æhqëž®©µòV˜\'¡}q>\Ï\ãn!td[;\Øðò`>ƒ¸\'6•A„\rš7)¸…8Á\ÒQslŠ±E\ì.!†]÷Èˆ3Á&Ò¹Kœ\"V“C#š2¡\Ë$¿,lÁß†mö\î8=Fm\êûø\ÈD\Â\Ù@Ô¦SÃŒ—\Ð\\¢\Ø\Ê\Å4\ÜE2²‘\Ü_ð‘ap!Á\Ó!¦\ÌŒ±6™|aÐ½i\Æ\îö=ºˆM$—djC\î\"\Æò\È>›ŠgV\Î$‰ò\Ø+b\n!Šœ›LZI0ó„¨>ø%…\î¾C°\áî·Ÿ\íÛ†\ì¢f\æ\Üv$03\Ï\ã‚N¶)\ïò\ØH±]N¬\ÑÑ›‡Fh\ïbL\Ñ1\Zc\ìÜ¾bÃ³™aóŒô\Õ²\Êel³\ÍUdÆª\ê\'X@­¤Š‹c‰0Bv‡¬€\Ï\Þb#ñ,P#^¤ùú\Ô™\\u±5^\éhj¤R\ÂÕ¡µ“¸!bc…ZoF\È+\Õöx]p\Ã\ïr\Æ@\æ\Þ\È\à÷–\ÄþÎ¶9@\ÔX ˜U†-Ý‚ˆ\áþLD\'-6·\ÊM\ÌC›¹¡¼Qô\Ä$yk´Qûø¯ö\n\ã\ÕO-\ØÓ©w\ìÀ“T:E\Éd³¾)\ÂmV5\ãcò\é5}4Onb¸G,Ð³šæ¬¦ù\ß\×4E\çù¬’9«d\Î*»\ÈG¨d²\âE?Z=\è\ÑZ\âÂ§>B\é¾\\P¼+t\Ù#\àì‡0¨;ZhýiAs¹œ9\Òm‡3ù‘\Ñ~„f°LU¯Š¥\êP83& p\Ò\ÃV\Ýj‚\Î\ã=6NG«\Õ\ÕsM@2‡\Âk5ešLG\Í\ì\ÞZ½\î…úAëŠ€’}¹\ÅLu‰\æjð-$ô\ÎN…E\ÛÂ¢¥\Ô²\Ð_K¯À\å\ä õH\Ü÷RFn\Òc\å§T~\å\ÝS÷t‘1\Ím\×,\Ûk+®§\ãiƒD.\ÜL¹0Œ\àò\Ø>e_·3—\Zô”)¶i4[\Ã\×*‰l\äš˜=\ç\Î\\\Ý5#4\ë¸ø\É\Íxú„\ÊTˆ†I\ÇÉ¥¡?$³Ì¸}$¢¦§\Òý\ÇDb\îPC¬\ç\Ý@“Œ[µ\ÖT{üDÉµ+Ÿž\åôW\Þ\Éx2Á#Y0’ua.Ub=!Xu\ØH\ïG\ãc\ç\Îù-†ò›UeÀ1rm\Í1\á¹\àÎ¬¸‘®–G\Ñxß’QDgZ\Þ(ùdž\Âu{M\'·\ÍtsWf¹™\ÃP9\éÄ·\îÛ…\ÔD.i\\ \êÖ´çw\É\çXey\ß`•¦\î\Í\\\×^åº¢[\â\äBŽZ¶˜AM1¶P\ËFMj§X\ä–[‡f\ÑqÚ·ÁfÔªbUW\ê\ÞÖ‹mvx\"¿\Õ\êœJ¡©Â¯Ž‚\Õ+\É4\è\ÑUv¹/9\'÷A\Å\ïzA\ÍJ•–?(yu¯Rjù\Ýz©\ëûõ\êÀ¯Vú½\ÚC0ŠŒâªŸ®=„ût±|o¯Ç·\Þ\ÝÇ«RûÜˆ\Åe¦\ë\à²\Ö\ïî«µ\âw÷\Ë<hÔ†\íz»\×(µ\ë\Ýa\É\ë÷Z¥v\Ð\è•ú \Ùö¿\Õ>t#\röºõÀkZ¥F5J^£¢\è·Ú¥¦W«u½f·5ðº—¶†¯¾W\æÕ¼vþ\0\0ÿÿ\0PK\0\0\0\0\0!\0ž\'v\0\0\Æ\0\0\0\0\0word/settings.xml´V\ßo\Û6~°ÿÁ\ÐóY²¬8B\Âv\æ%E¼uŠ=S\"m\á¤\ì¸\Åþ÷)\Ñrš¢pZ\äÅ¦\î»û\îx<\Þñ\Ýû\'\Î;¢4•b\Z\Ä\Ã`@D)1\ÛiðùaN‚6H`Ä¤ \Ó\à@tðþú÷\ß\Þ\ísMŒ5=\0\n¡s^NƒÊ˜:\"]V„#}!k\"\0\ÜHÅ‘Oµ8RM–’\×\ÈÐ‚2jQ2fAG#§A£D\ÞQ„œ–Jj¹1\Ö$—›\r-I÷\ç-\Ô9~[“Y6œ\ã<FŠ0ˆA\n]\ÑZ{6þ³l\0Vžd÷£M\ì8ózûxx\Æv÷R\á£\Å9\áYƒZÉ’h\rÄ™Š\Þqú‚\è\èû|w[tT`\Ý\ê4òñ\ë’YIž^\Ç1\é8\"°<\å¡øu<Ù‘‡ö‰³Ÿ\æ„@cƒ«W±$>¯‘µEUH«\È2’\×5>\ÒxŸ#\ÍÎ©šº§…Bª½“]\Éð2¿\Û\n©PÁ (œþÀEg!‰ö\Ï-É““\Û<\×\Ð#¾H\Éû¼&ª„‹\rf<\"`²A\r3¨XYƒ\ÊA—I—R¨4D­kTB\r/¤0J2¯‡\å\ß\Ò, ‡((ñ\Î\Âu”~µn»X\Ä!\ìgg%1´}\Þ(z~~­óO]~\ëHB7U“›®µ90²„\à\×ô™	ü¡Ñ†£\ë;¿Á \Âzþüp¨É’ \Ó@š\ÞÈ™;‰%£õŠ*%ÕÀp\Îo\æŒn6DŠYAùP%÷.Ï·abo\ä·\Ñ\ä_P†û5z€²|œKc$¿=\Ô\äú\×N\Ò\Õ{tZ¾0Š±ö‹ORš£\ê0Ž&m¤=¹Ì²\Ù(ý2[$Wñ¬ó\ßy\å¹cÿ(¿²¥;\à­\ÅñBQ4X\ÙAYB=Î©ðxA ›Sd\Ý\Ã\Ð1¶„$zÀ%€\ç˜\êú†lÜš­\Úö¼†ú®úÈ‡#—\í1Dý¥dS·\è^¡º-I¯§igI…¹§\Ü\ËuS¬½•€þw5\Ü)—§>=û\ÜÀ»«}\\©8]\"\Â\Ùg{¸Å¶Hxw\ßUSk[d…\êº-®bOF·•‰­‰/\Ï#÷Ql“K–´˜û@¥\Ý(hw‹^–xÙ‰\Þ\È\ËF½,õ²´—½l\Ü\Ë2/Ë¬¬‚v¢°1¿´òdL\î	¾\íñ¢6	ºB5¹i[?T›l\Ý,Ðƒ]Nž`HL\r¼:kŠ9‚B<L2k\Þi3ty¦k1«\\?g°ó´»\Ù\Ñ3cWñ\ß\ÄbGRI¡:\×^ô“\æ¢\rœQ\r]¡†¡d¤ò\Ø‹\Ó\Ëò\Î\ÎÀ´•\'\Ù(›\Å\Ý(‹\Çn˜\×8\à\Ü?‘\Íi‚;Ì›Ž[Ó¯\Ãy\'³e&óùe˜&‹«pr3ž„“Eœ\Ü\\¥óx6ÿ\×\ÝYÿ\0¿þ\0\0ÿÿ\0PK\0\0\0\0\0!\0{×¢¨\0\0Os\0\0\0\0\0word/styles.xml¼]sÛº†\ï;\ÓÿÀ\ÑU{‘\Èò‡œxŽs\Æq’\ÚS;\Ç\'²›kˆ„$\Ô ¡’Tl÷\×\0)	ò\Üú&±(\í/\Þ%–\Òo¿?§2ú\ÅóB¨\ì|0z0ˆx«DdóóÁ\Ãý·wQQ²,aReü|ðÂ‹Á\ïŸþú—ßžÎŠòEò\"Ò€¬8K\ãóÁ¢,—g\Ãa/xÊŠ÷j\É3ý\æL\å)+õ\Ë|>LYþ¸Z¾‹Uºd¥˜\n)Ê—\á\áÁÁxPcò.5›‰˜Qñ*\åYi\ã‡9—š¨²b!–ÅšöÔ…ö¤òd™«˜…\Þ\éTV¼”‰lƒP*\â\\jV¾\×;S÷È¢tø\èÀþ•\Ê-\à8€qÌŸqŒ5c¨#]ŽHpœñ†#‡\ÖP$e²@Q\×\ã:4±¬dV,\\\"\Çu\êdƒ{I\Í¥ñ\Ùõ<S9›JMÒªGZ¸È‚Í¿zÿ\ÍöOþl·›]|\Ò^HTü…\Ï\ØJ–…y™\ß\åõ\Ëú•ý\ï›\Ê\Ê\"z:cE,Ä½\î n%ºÁ«‹¬ýgEyQ\Öø\æ\Âü\ÑøN\\”\Î\æ\Ï\"ƒ¡iñ‘\ç™~û“\çƒ\ÃjSñ\ßÍ†Í–KÓ©m’eóõ6ž½»xp;g7=LÌ¦©nJ9w}cG\ÇgR\ÌY¹\Êub0¯,¡\Êyr©÷Ÿ?—+&Í‡‡õÀTÿ;Ãµ|ý\Êör\Éba;\Åf%\×ib4>0=\Âd¥Ã“\ë?VF<¶*UÝˆTÿo°C ˜\Î:—Lª”¦\ß\å³?òdR\ê7\Î¶-½ñ\áú.*\×i\ë|ðÑ¶©7Nx*®D’ð\Ìù`¶	ÿ¹\à\ÙCÁ“\íö?¿\Ù\ÔSoˆ\Õ*\ÓŽ\í,’Eòõ9\æK“\Èô»3š~7\Ò|z%¶\Ûðÿ¬a£Z¶¦øg&›G£\×\Û}\â\ÐD\Î\Þ63W¯ö\Ý~\n\Õ\Ð\Ñ[5tüV\r¼UC\ã·j\èô­\ZúðV\rY\Ìÿ³!‘%úÀa?›\Ô}\Ñ\Ù\Ð—\ÐU\Ð\Ð\ÏDGs<ó\ÍñLS§T±o:“ý\È3\ÛÛ¹ûa\Üý‡„0\îþ#@w\Â\ã\î\Ï\ïa\Üý\é<Œ»?{‡q÷\'k<·ZjE\×\ÚfY\Ù\Ûe3¥\ÊL•<2‹\Þ\Þ4–i–-qix\æ \Çs’$ÀT™­>÷¦\ÅÌ¾\Þ?C¬IÃç¥©#5‹fbnJž\Þ\ç\Ù/.Õ’G,I4˜s]”yF$dN\ç|\ÆsžÅœrb\ÓAM%e«tJ07—lN\Æ\âYB<|k\"IR\ØLh]?/ŒIÁ¤NYœ«þ]SŒ,?Üˆ¢ÿXHôy%%\'b}§™b–Õ¿6°˜þ¥\Åô¯,¦a\àhF5D5h¤j\ZÑ€\Õ4¢q«\æ\'Õ¸\Õ4¢q«iD\ãV\ÓúÛ½(¥Mñ\îªc\Ôý\ÜÝ¥T\æ¢D\ï~L\Ä<³ge{“\ês¦\Ñ\Ë\Ù<g\ËEd\Îj7c\Ý}Æ¶óY%/\Ñ=\Å1mC¢Z\×\Û)b\Îe‹l\Õ@whT\æ\Úðˆ\ìµ\ál\Ã\ëo±[½L6´+šzf²š–¦µ¤N¦0¹ª´ý\Ý\Æ\Êþ3lk€o\"/\ÈlÐŒ%˜Á\ß\Ír\Ö\ÈI‘ù¶½\ìß±-«¿­^g%\Ò\î\ÕH‚^J?Ò¤á«—%\ÏuYöØ›ôMI©žxBGœ”¹ª\æškùC+I\'\ËM—V[+\í º\ê×·3D·l\Ù{‡\î$n_ß¥LÈˆnqu{Ý«¥)3\ÍÀ\Ð\0?«²T)³>ø·Ÿ|úwš^\è\"8{!\Ú\Û¢\ÓCv)2I%D$½\Ì™ 9†Z\Þ?ù\ËT±<¡¡\Ýå¼ºƒ¨\äD\Ä	K—Õ¢ƒÀ[:/>\éüC°\Z²¼±\\˜óBT¦º\'9§\r‹\Õô\ß<\îŸê¾«ˆ\ä\Ì\Ð«Òž´K]M‡\ë¿L\ØÁõ_\"X5õ\áÁ\Ì_‚\ÝÁõ\ß\Ù\Õ\Î^JV\Â{	5˜Gµ»kõþö/þjž’*Ÿ­$\Ý\0®d#¸’\r¡’«4+(÷\Øòw\Øò¨÷—p\ÊXÁ)9\ËûG.21,ŒJ	£’ÁÂ¨4°0Rúß¡\ãÀúß¦\ãÀúß«SÁˆ–\0Œjž‘þ‰®ò80ªyfaTó\ÌÂ¨æ™…QÍ³£/Ÿ\Íô\"˜\î\ã ©æœƒ¤;\Ðd%O—*gùò«\äsFp‚´¢\Ý\åjf-QYu7Òœ£–„‹\í\nG%òO>%\ëšaQö‹\àŒ(“R)¢sk\ÛŽÜ½wm_˜}¤w\î$‹ùBÉ„\çž}ò\Ç\êzyR=–ñºû¶N{Þˆù¢Œ&‹\Í\Ù~3>\Ø¹.\Øw\Âö7\Ø4\æ\ãõ\Ã/Ma·<«t\ÝQø0\Åø¨{°\Ñ;Á\Çûƒ·+‰È“Ž‘°\Íñþ\È\í*y\'ò´c$lóC\ÇH\ëÓ\È6?|aùc\ãD8m›?›\Z\Ï3ùN\Ûf\Ñ&¸±Ù¶‰´‰lš‚§m³h\Ç*\ÑE›«Pnžñ\Çw3?\ã\"?c\'?¥³¯üˆ6ƒýà¿„9²c’¦mos÷\Èûv\Ý)sþ¹R\ÕyûN\Ý\êº\Ö§¬\àQ#\ç¨û…«,\ã\Ç\Î\éÆ\èœwüˆ\Î	Èè”‰¼á¨”\ä§t\ÎM~D\ç$\åG ³<\"\à²Œ\Çe+’­ %$[õXø—~Ú¨6j•‚2*2*¤ \nh£BÚ¨p†3*Œ\ÇÆ‡RBŒ\n)h£BÚ¨6*D \nh£®\í½\áAF…´Q!mTˆ@Õ®{\Æ\ãŒ\n\ãCŒ\n)!F…´Q!mTˆ@\"\ÐF…´Q!eTdTHA\"\ÐF…´Q«G\rÃ\n\ãqF…ñ!F…”£B\nÚ¨6*D \nh£BÚ¨2*2*¤ \nh£BÚ¨öba£\ÂxœQa|ˆQ!%Ä¨‚6*D \nh£BÚ¨6*D Œ\nÂƒŒ\n)h£BÚ¨\Ñ6?\ëK”¾\Û\ìGø³ž\Þ;ö»_ºª;õ\Ã}”\ÛEuG­{\ågu\á³RQãƒ‡G¶\Þ\èS)”=E\í¹¬\îr\í-¨Ÿ\\¶?\á\ã\Ò{~\éRý,„½f\n\à\Ç]#Á9•\ã¶)\ïF‚\"\ï¸m¦»‘`\ÕyÜ–}\ÝHp<nKºÖ—\ë›Rô\á·¥\'x\ä	o\Ë\ÖN8\â¶\í\Ân\Ë\ÌN \à¶|\ìžD&9¿Ž>\é8N\ã\Íý¥€\Ð6Â©Ÿ\Ð6-¡V\ët\ÑU4?¡«z~BWý”ž^^X?\n­°&5´V\êp£ú	X©!!Hj€	—\Z¢‚¥†¨0©ab\ÄJ\r	X©Ã“³Ÿ$5À„K\rQÁRCT˜\ÔðP†•\Z°RCV\êžd/&\\jˆ\n–\Z¢Â¤†‹;¬Ô€•\Z°RCB\Ô\0.5DK\rQaRƒ*-5$`¥†¬Ô$5À„K\rQÁRCT›\Ôö,ÊŽ\Ô(…p\Ü\"\Ì	\Ä@\\rvª%\':°Zr\Õ\Ôj­9®ZrEóºª\ç\'t•\ÑO@\é\é\Å\à…õ£\Ð\nûQaRãª¥&©Ã\ê\'`¥\ÆUK^©q\ÕR«Ô¸j©Uj\\µ\ä—\ZW-5I«–š¤O\Î~BÔ¸j©Uj\\µ\Ô*5®ZòK«–š¤\ÆUKMRãª¥&©{½˜p©q\ÕR«Ô¸j\É/5®Zj’\ZW-5I«–š¤\ÆUK^©q\ÕR«Ô¸j©Uj\\µ\ä—\ZW-5I«–š¤\ÆUKMR\ãª%¯Ô¸j©Uj\\µ\Ô*5®Zº\Õ!‚\à+ &)\ËËˆ\îû\â®X±(Yÿ/\'|\Èr^(ù‹\'\í®Þ örø´óóW†m\ÛO¾\Ôcf¾\Ýy\\)©¾¶\Ú^\'›Ÿ©2Á¦\'Qý\ëaõf\Û\áúrmÕ¢\r„M\Å\ÝV\\w•§©ú;h7Q\Ùo }Ý°\ç‹jmG¶pý\ézH·\ãU}ng´Zû]š	\ß\Ògkˆ\Ö1ª<\ã\ë\à\Ç:	\ì\ë¡\î\ÏTV?™¦ÿ¸\Î\rxª.¬\êiò\Ì*”~ÿ’KyËªO«¥ÿ£’\Ï\Ê\ê\ÝÑýÊ‚W\ïO«o\ßó\Æ\ç6M{\Ã\Ý\ÎT/\ëŸmóŒwõ}üõý\Þ)irQ\ÃpÛ›YúŽô¶oë¿ŠOÿ\0\0ÿÿ\0PK\0\0\0\0\0!\0\ï\n)NN\0\0~\0\0\0\0\0word/webSettings.xmlœ\Ó_k\Â0\0ð÷Á¾CÉ»¦\Ê)Va\Ç^\Æ`\Ûˆ\éÕ†%¹’‹«\î\Ó\ïÚ©søb÷’ÿ÷\ã.!ó\å\Î\Ù\äô¹\rS‘€\×X¿\É\Åû\Ûj0	E\åe\ÑC.ö@b¹¸½™7Y\ëWˆ‘ORÂŠ§\Ì\é\\T1Ö™”¤+pŠ†Xƒ\ç\ÍƒS‘§a#\n\Ûz \Ñ\Õ*šµ±&\î\å8M§\âÀ„k,K£\áõÖ]¼`YDO•©\é¨5\×h\r†¢¨ˆ\ëqö\Çs\Êø3º»€œ\Ñ	\Ë8\äbu‡\Òn\ä\ì/0\éŒ/€©†]?cv0$Gž;¦\è\çLOŽ)Îœÿ%sP‹ª—2>Þ«lcUT•¢\ê\\„~IMN\ÜÞµw\ätö´ñ\ÔÚ²Ä¯žð\Ã%Ü¶\\\ÛuC\Øu\ëm	bÁ\ëhœù‚†û€\rA\í²²›—\çGž\È?¿fñ\r\0\0ÿÿ\0PK\0\0\0\0\0!\0¸²c\0\0‚\0\0\0\0\0word/fontTable.xmlÜ“ÛŠ\Û0†\ï}£ûeç°©Yg\é¶(”^,\ÛPd9\ÕÁh”8yûŽd\'\r„Àº\ÐB\ë[þGóy\æ·\æ\áñ U²¤5%\É&”$\Âp[I³-\É÷\×õÝ’$\à™©˜²F”\ä(€<®Þ¿{\èŠ\Ú\Z	\æ(4/I\ã}[¤)ðFh\Û\nƒÁ\Ú:\Í<¾ºmª™û±k\ï¸\Õ-ór#•ô\Ç4§tAŒ{\ÅÖµ\ä\â³\å;-Œù©\n‰\Ö@#[8Ñº·\Ð:\ëª\ÖY.\0°g­zžfÒœ1\Ù\ì\n¤%wl\í\'\Ø\ÌPQDazF\ãJ«_€ù8@~Xpq\ÇXŒ3/9²\Z\ÇYœ9²º\àü^1\0¨|ÕŒ¢\ä\'_Ó\Ë<k4—D1®¨ùw\ÔÁ#Í‹/[c\Û($\á_Oð\Ç%\î\ØxÄ¥8D=´@V\Ã($]a˜\Æ\ÌOLÉ“1\Ð2cAd\Û3U\ìaM\ç4ô’\Ó†;I\ÃF\Þ0\"@ú´—k¦¥:žT\è$@h¥\ç\ÍI\ß3\'C\Õ}\ä;\ØÐ’<\Ï(ÍŸ\×k\Ò+V‡\ç;Ÿ\Ý?\rJ¾¯ƒ2=+4(<r\âk\Ösx\äœ÷\à7\ÓÞ+\'>bY\ê†OtôND7þ¬ô\ÊT\î—ó¿\âÃ«\Ô’o¢K^¬f\æ†#9:2\Å\Ó1‹\'d:\Ê¹ÿŽ#ÃŒ$_\å¶ñ7\'%\Ì\Ç:)\ÃV?\0\0ÿÿ\0PK\0\0\0\0\0!\0¯ª(Ç\0\0ý\0\0\0docProps/core.xml ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Œ’±N\Ã0†w$\Þ!òž8i BQ’J€:Q	‰\"›±¯­i\âX¶Û´\Â\n ^(¯ƒ“´)\Ø\î|\ßýwþ\íx´\É3g\rJóB$(ð|ä€ \ãbž û\éØ½@Ž6D0’´F\é\éILeD·ª \íX%¡#*´0FFkº€œh\Ï\Âg…Ê‰±©šcI\è’\Ì|ˆs0„Cp-\è\ÊN\í$\í$\åJe\0£2\ÈA/ÀÖ€\ÊõÑ†¦ò‹Ì¹\ÙJ8Š\î‹½Ñ¼Ë²ôÊ°A\íþ~œ\Ü\Ü5Wu¹¨½¢€Ò˜\Ñ\Èp“A\Z\ãCh#½z~j\Ú\ã.±1U@L¡\Ò\ê­ú®Þ\ê£z­>«/›¾7\ì¾^;¿„mY(¦­J/³M—Æ¾g;£w`\éŒh3±<\ãÀ.·\Ç\Çý\Å\êNk^ÿ“t\Ð]\Z\ïLoW\æX³¢\Ö\Ú}\å!¼ºžŽQ:ð¡ëŸ»a0õ‡QF¾ÿTo\Ù\ë?\æ»þ¯x\ÖW\Ü´Fõ?lú\0\0ÿÿ\0PK\0\0\0\0\0!\0z\'Žm\0\0\Â\0\0\0docProps/app.xml ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0œR\ËN\Ã0¼#ñ‘\ï­Ó‚\0U[W¨\âÀKjhÏ–³I,Û²ÝŠþ=!ˆ>\í\ÌzG³c\Ã\ê½5\ÙC\Ô\Î.\Ùlš³­r¥¶õ’½w“–\Å$m)³¸d\'Œl%\Î\Ï\à%8!iŒIØ¸dMJ~ÁyT\r¶2N©m©S¹\Ð\ÊD0\Ô\ÜU•V¸q\êÐ¢M|ž\çW\ß\ÚË‰Y¯¸8¦ÿŠ–Nuþ\â®8y\ÒP`\ëL(žºI|  pIšB·(fD\0^d±\ãúö.”Q\\\ïX72H•(:1¿>‚p\ë½\ÑJ&\ÊT<j\\tUÊž?f\Ý8ðñ ó[T‡ \ÓI\äÀ\Ç´\ímô\Ù\n²\Ò7_\Þ[%\r®imQIøk\×ziIŽ\é½\ÅW_¸M\Ã\×\Èor´\ã^§f\ë¥\"ùx\ÛQ¶\ÄbIö÷ôÁtò4kk,¿\ïümtù\íú/)fWÓœ\Îg`\ß­=üñ\0\0ÿÿ\0PK-\0\0\0\0\0\0!\0ß¤\ÒlZ\0\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0[Content_Types].xmlPK-\0\0\0\0\0\0!\0‘\Z·\ï\0\0\0N\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0“\0\0_rels/.relsPK-\0\0\0\0\0\0!\0\ã…Q¢<\0\0›\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0³\0\0word/document.xmlPK-\0\0\0\0\0\0!\0\Öd³Qô\0\0\01\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\n\0\0word/_rels/document.xml.relsPK-\0\0\0\0\0\0!\0¶ôg˜\Ò\0\0\É \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0word/theme/theme1.xmlPK-\0\0\0\0\0\0!\0ž\'v\0\0\Æ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Y\0\0word/settings.xmlPK-\0\0\0\0\0\0!\0{×¢¨\0\0Os\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0š\0\0word/styles.xmlPK-\0\0\0\0\0\0!\0\ï\n)NN\0\0~\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0o#\0\0word/webSettings.xmlPK-\0\0\0\0\0\0!\0¸²c\0\0‚\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ï$\0\0word/fontTable.xmlPK-\0\0\0\0\0\0!\0¯ª(Ç\0\0ý\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\"\'\0\0docProps/core.xmlPK-\0\0\0\0\0\0!\0z\'Žm\0\0\Â\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ú)\0\0docProps/app.xmlPK\0\0\0\0\0\0Á\0\0},\0\0\0\0','C:\\\\Test\\\\keeping _afile.docx'),('cdc',_binary 'calming tune slow speaking \r\npause before important \r\ndoesnt look at the screen \r\nthe presentaion \r\njokes ','C:');
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
  CONSTRAINT `professor_subject_professor_id` FOREIGN KEY (`professor_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `professor_subject_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`)
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
  CONSTRAINT `question_professor_id` FOREIGN KEY (`professor_id`) REFERENCES `professor_subject` (`professor_id`),
  CONSTRAINT `question_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `professor_subject` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES ('001','01','01001','1 + 1 = ?','Daniel Armaganian','209146943','2','1','2','3','4'),('002','02','02002','What is the time complexity of merge sort algorithm?','Daniel Armaganian','209146943','2','O(Logn)','O(nLogn)','O(n^2)','O(n)'),('003','01','01003','solve for x:\n4x + 2 = 6\nx = ?','Daniel Armaganian','209146943','1','2','1','3','4'),('004','02','02004','Which of the following is not an OOP question?','Daniel Armaganian','209146943','3','Ruby','C','C++','Java');
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
  CONSTRAINT `question_course_course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  CONSTRAINT `question_course_question_id` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_course`
--

LOCK TABLES `question_course` WRITE;
/*!40000 ALTER TABLE `question_course` DISABLE KEYS */;
INSERT INTO `question_course` VALUES ('01001','01'),('01003','01'),('01003','02'),('02002','03'),('02004','05');
/*!40000 ALTER TABLE `question_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_course`
--

DROP TABLE IF EXISTS `student_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_course` (
  `student_id` varchar(45) NOT NULL,
  `course_id` varchar(45) NOT NULL,
  PRIMARY KEY (`student_id`,`course_id`),
  KEY `student_course_course_id_idx` (`course_id`),
  CONSTRAINT `student_course_course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  CONSTRAINT `student_course_student_id` FOREIGN KEY (`student_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_course`
--

LOCK TABLES `student_course` WRITE;
/*!40000 ALTER TABLE `student_course` DISABLE KEYS */;
INSERT INTO `student_course` VALUES ('200000000','01'),('200000001','01'),('200000000','02');
/*!40000 ALTER TABLE `student_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_exam_merge_with_garde`
--

DROP TABLE IF EXISTS `student_exam_merge_with_garde`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_exam_merge_with_garde` (
  `student_id` varchar(45) NOT NULL,
  `exam_id` varchar(45) NOT NULL,
  `correct_answer` varchar(45) DEFAULT NULL,
  `wrong_answer` varchar(45) DEFAULT NULL,
  `exam_grade` int DEFAULT NULL,
  `exam_comment` varchar(45) DEFAULT NULL,
  `is_confirmed` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`student_id`,`exam_id`),
  KEY `exam_id_idx` (`exam_id`),
  CONSTRAINT `exam_id` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`exam_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_exam_student` FOREIGN KEY (`student_id`) REFERENCES `student_course` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_exam_merge_with_garde`
--

LOCK TABLES `student_exam_merge_with_garde` WRITE;
/*!40000 ALTER TABLE `student_exam_merge_with_garde` DISABLE KEYS */;
INSERT INTO `student_exam_merge_with_garde` VALUES ('200000001','010101','1,2',NULL,100,'none','1'),('200000001','010103','1,2,3',NULL,80,'none','1');
/*!40000 ALTER TABLE `student_exam_merge_with_garde` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_grade`
--

DROP TABLE IF EXISTS `student_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_grade` (
  `student_id` varchar(45) NOT NULL,
  `exam_id` varchar(7) NOT NULL,
  `exam_grade` int DEFAULT NULL,
  `exam_comment` text,
  `isConfirmed` int DEFAULT NULL,
  PRIMARY KEY (`student_id`,`exam_id`),
  KEY `student_grade_exam_id_idx` (`exam_id`),
  CONSTRAINT `student_grade_exam_id` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`exam_id`),
  CONSTRAINT `student_grade_student_id` FOREIGN KEY (`student_id`) REFERENCES `student_question_remove` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_grade`
--

LOCK TABLES `student_grade` WRITE;
/*!40000 ALTER TABLE `student_grade` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_grade` ENABLE KEYS */;
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
  CONSTRAINT `student_question_question_id` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`),
  CONSTRAINT `student_question_student_id` FOREIGN KEY (`student_id`) REFERENCES `student_course` (`student_id`)
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
  PRIMARY KEY (`user_id`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('200000000','Test','Testovich','test@gmail.com','test','123456','student',0),('200000001','Almog','Kadosh','almod@gmai.com','almog','123456','student',0),('209146943','Daniel','Armaganian','daniarmag@gmail.com','daniel','123456','professor',0),('315730176','Tzahi','Bakal','tzahi.bakal@gmail.com','tzahi','123456','professor',0),('319003935','Matan','Czuckermann','cz.matan@gmail.com','matan','123456','head',0);
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

-- Dump completed on 2023-06-08 14:20:25
