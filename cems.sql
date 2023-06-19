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
INSERT INTO `course` VALUES ('01','Algebra1','01'),('02','Algebra2','01'),('04','C Programming','02'),('05','OOP','02'),('06','Physics1','03'),('07','Organic Chemistry','04'),('08','Calculus1','01'),('09','Software Testing','02'),('10','Logic Gates','06'),('13','Control Systems','06'),('14','Anatomy','05');
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
INSERT INTO `exam` VALUES ('01','01','01','010101',1,60,'Don\'t forget to do something!','Don\'t forget to do nothing!','Daniel Armaganian','209146943','8520','-1','Computerized','Algebra1 2023A'),('02','02','05','020502',1,60,'Yes	','No','Daniel Armaganian','209146943','1234','-1','Computerized','OOP 2022A'),('03','02','04','020403',2,120,'Don\'t forget to free memory!','Don\'t forget to give a factor!','Daniel Armaganian','209146943','0010','-1','Computerized','C 2023A'),('04','01','01','010104',3,45,'Good luck!','Make a lot of noise during the exam.','Tzahi Bakal','315730176','0110','0','Computerized','Algebra1 2020A'),('05','01','02','010205',3,10,'','','Daniel Armaganian','209146943','1234','-1','Computerized','Algebra2 2023A'),('06','01','01','010106',4,90,'Good luck!','','Daniel Armaganian','209146943','3q4k','0','Computerized','Algebra1 2022A'),('07','01','08','010807',1,20,'','','Daniel Armaganian','209146943','zqq9','-1','Computerized','Calculus1 2022A'),('08','01','02','010208',0,30,NULL,NULL,'Daniel Armaganian','209146943','6565','0','Manual','Algebra2 manual'),('09','06','13','061309',5,60,'Before providing your response, \nplease take the time to carefully read each question.','A test on the basic knowledge of the course.','Daniel Armaganian','209146943','1111','-1','Computerized','Control 2023A'),('10','05','14','051410',6,90,'GOOD LUCK !','','Noa Kirel','333444555','2222','0','Computerized','Anatomy 2022B'),('11','01','01','010111',8,90,'Before providing your response, please take the time to\ncarefully read each question.','Please note that this test does not include a formula page.\nBasic level test.','Noa Kirel','333444555','1122','0','Computerized','Algebra1 2022B'),('12','01','08','010812',10,120,'No auxiliary material can \nbe used.\nEach question has one \ncorrect answer.\ntime: 2 hours.','The test checks basic\nknowledge of a calculus\ncourse.','Tzahi Bakal','315730176','ca22','-1','Computerized','Calculus1 2022B'),('13','04','07','040713',10,120,'Reference material: \r personal formula \r sheet.\r Test time: 2 hours.','The test checks basic knowledge in the course.','Tzahi Bakal','315730176','an22','-1','Computerized','Anatomy 2022A'),('14','04','07','040714',10,120,'Reference material: \nperiodic table of the \nelements. \nTest time: 2 hours.','The test tests the student\'s\nknowledge and \nunderstanding of the \nperiodic table.','Tzahi Bakal','315730176','or23','-1','Computerized','Organic 2023A'),('15','02','09','020915',7,90,'Reference material: None.\nTime: 1.5 hours.','The test tests basic\nknowledge of the course.','Tzahi Bakal','315730176','te23','-1','Computerized','Testing 2023A'),('16','03','06','030616',5,45,'Reference material: Formulas page.\nTime: 45 minuts.','The test tests basic \nknowledge of the course.','Noa Kirel','333444555','ph23','0','Computerized','Physics1 2023A'),('17','04','07','040717',7,90,'Reference material:  \nperiodic table of the  \nelements.  \nTest time: 2 hours.','The test tests the student\'s \nknowledge and  \nunderstanding of the  \nperiodic table.','Noa Kirel','333444555','c23b','0','Computerized','Organic 2023B'),('18','01','02','010218',7,90,'Reference material: \nFormulas page.\nTime: 1.5 hours.','The test has 7 questions \ndealing with matrices only.','Noa Kirel','333444555','al23','0','Computerized','Algebra2 2023B'),('19','06','13','061319',8,90,'Reference material: None. \nTime: 1.5 hours.','The test tests basic \nknowledge of the course.','Roni Aloni','135791113','co23','0','Computerized','Control 2023B'),('20','02','04','020420',8,90,'Reference material: \nFormulas page.\nTime: 1.5 hours.','The test has 8 questions \ndealing with basic \nprogramming in C.','Roni Aloni','135791113','c123','0','Computerized','C 2023B'),('21','06','10','061021',7,90,'Reference material: None.\nTime: 1.5 hours.','The test has 7 questions \ndealing with basic \nlogic gates.','Roni Aloni','135791113','lo23','0','Computerized','Logic 2023A'),('22','05','14','051422',9,120,'Reference material:  \npersonal formula  sheet. \nTest time: 2 hours.','The test checks basic \nknowledge in the course.','Roni Aloni','135791113','an23','0','Computerized','Anatomy 2023A'),('23','02','05','020523',10,120,'Reference material: None.\nTime: 2 hours.','The test contains \ncomprehension questions \nabout OOP taught in \nthe first lessons.','Roni Aloni','135791113','op22','0','Computerized','OOP 2022B'),('24','03','06','030624',9,120,'Reference material: \nFormulas page. \nTime: 2 hours.','The test tests basic  \nknowledge of the course.','Alon Ahron','246810121','ph11','-1','Computerized','Physics1 2023B'),('25','06','10','061025',8,90,'Reference material: Formulas page.\r Time: 45 minuts.','The test has 8 questions  \ndealing with basic  \nlogic gates.','Alon Ahron','246810121','lo11','0','Computerized','Logic 2023B'),('26','06','13','061326',6,45,'Reference material: None. \nTime: 45 minuts.\n','5 simple questions about \nthe beginning of the \nmaterial in the course.','Alon Ahron','246810121','co22','0','Computerized','Control 2022A'),('27','01','08','010827',9,90,'No auxiliary material can  \nbe used. \nEach question has one  \ncorrect answer. \nTime: 1.5 hours.','The test checks basic \nknowledge of a calculus \ncourse.','Alon Ahron','246810121','ca23','0','Computerized','Calculus1 2023A'),('28','03','06','030628',8,120,'Reference material: \nFormulas page. \nTime: 2 hours.','The test tests basic  \nknowledge of the course.','Alon Ahron','246810121','ph22','0','Computerized','Physics1 2022A'),('29','06','10','061029',7,90,'Reference material: None. \nTime: 1.5 hours.','The test has 7 questions  \ndealing with basic  \nlogic gates.','Alon Ahron','246810121','lo22','0','Computerized','Logic 2022A'),('30','02','09','020930',6,45,'Reference material: None. \nTime: 45 minuts.','The test tests basic \nknowledge of the course.','Roni Aloni','135791113','te11','0','Computerized','Testing 2023B'),('31','04','07','040731',2,90,'Good luck!','','Tzahi Bakal','315730176','or26','-1','Computerized','Organic 2026'),('32','02','09','020932',2,20,'Good luck have fun!','','Tzahi Bakal','315730176','te29','0','Computerized','TestingA 2029 '),('33','05','14','051433',1,24,'Easy exam for you','','Tzahi Bakal','315730176','an17','0','Computerized','AnatomyB 3017');
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
  CONSTRAINT `exam_question_question_id` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_question`
--

LOCK TABLES `exam_question` WRITE;
/*!40000 ALTER TABLE `exam_question` DISABLE KEYS */;
INSERT INTO `exam_question` VALUES ('010101','01001','100'),('010104','01001','10'),('010104','01003','35'),('010104','01011','55'),('010106','01001','33'),('010106','01003','33'),('010106','01011','28'),('010106','01013','6'),('010111','01001','15'),('010111','01003','15'),('010111','01011','10'),('010111','01025','10'),('010111','01026','15'),('010111','01027','15'),('010111','01028','10'),('010111','01029','10'),('010205','01003','33'),('010205','01005','33'),('010205','01011','34'),('010218','01108','10'),('010218','01109','15'),('010218','01110','15'),('010218','01111','15'),('010218','01112','15'),('010218','01113','15'),('010218','01114','15'),('010807','01012','100'),('010812','01012','10'),('010812','01013','10'),('010812','01062','10'),('010812','01063','10'),('010812','01064','10'),('010812','01065','10'),('010812','01066','10'),('010812','01067','10'),('010812','01068','10'),('010812','01069','10'),('010827','01012','10'),('010827','01062','10'),('010827','01064','10'),('010827','01067','10'),('010827','01070','10'),('010827','01073','10'),('010827','01075','10'),('010827','01078','15'),('010827','01080','15'),('020403','02006','50'),('020403','02007','50'),('020420','02125','10'),('020420','02126','15'),('020420','02127','10'),('020420','02128','15'),('020420','02129','10'),('020420','02130','10'),('020420','02131','10'),('020420','02132','20'),('020502','02004','100'),('020523','02004','10'),('020523','02010','10'),('020523','02140','10'),('020523','02141','10'),('020523','02142','10'),('020523','02143','10'),('020523','02144','10'),('020523','02145','10'),('020523','02146','10'),('020523','02147','10'),('020915','02086','15'),('020915','02087','15'),('020915','02088','15'),('020915','02089','15'),('020915','02090','15'),('020915','02091','15'),('020915','02092','10'),('020930','02086','15'),('020930','02088','15'),('020930','02090','15'),('020930','02092','15'),('020930','02093','20'),('020930','02094','20'),('020932','02086','64'),('020932','02089','36'),('030616','03045','20'),('030616','03046','20'),('030616','03047','20'),('030616','03048','20'),('030616','03049','20'),('030624','03050','10'),('030624','03051','15'),('030624','03095','10'),('030624','03096','10'),('030624','03097','10'),('030624','03098','15'),('030624','03099','10'),('030624','03100','10'),('030624','03101','10'),('030628','03045','10'),('030628','03048','10'),('030628','03049','10'),('030628','03051','10'),('030628','03097','15'),('030628','03099','15'),('030628','03101','15'),('030628','03103','15'),('040713','04008','10'),('040713','04057','10'),('040713','04059','10'),('040713','04060','10'),('040713','04061','10'),('040713','04081','10'),('040713','04082','10'),('040713','04083','10'),('040713','04084','10'),('040713','04085','10'),('040714','04008','10'),('040714','04052','10'),('040714','04053','10'),('040714','04054','10'),('040714','04058','10'),('040714','04059','10'),('040714','04060','10'),('040714','04081','10'),('040714','04082','10'),('040714','04084','10'),('040717','04060','15'),('040717','04061','15'),('040717','04081','15'),('040717','04082','15'),('040717','04083','10'),('040717','04084','15'),('040717','04085','15'),('040731','04008','37'),('040731','04009','63'),('051410','05019','15'),('051410','05020','20'),('051410','05021','15'),('051410','05022','15'),('051410','05023','20'),('051410','05024','15'),('051422','05020','10'),('051422','05024','10'),('051422','05031','10'),('051422','05035','10'),('051422','05037','15'),('051422','05040','10'),('051422','05041','10'),('051422','05043','15'),('051422','05044','10'),('051433','05044','100'),('061021','06133','10'),('061021','06134','15'),('061021','06135','15'),('061021','06136','15'),('061021','06137','15'),('061021','06138','15'),('061021','06139','15'),('061025','06138','10'),('061025','06139','10'),('061025','06148','15'),('061025','06149','15'),('061025','06150','10'),('061025','06151','15'),('061025','06152','15'),('061025','06153','10'),('061029','06133','15'),('061029','06135','15'),('061029','06137','15'),('061029','06138','15'),('061029','06148','15'),('061029','06151','15'),('061029','06153','10'),('061309','06014','20'),('061309','06015','20'),('061309','06016','20'),('061309','06017','20'),('061309','06018','20'),('061319','06017','10'),('061319','06018','10'),('061319','06115','15'),('061319','06116','10'),('061319','06117','10'),('061319','06118','15'),('061319','06119','15'),('061319','06120','15'),('061326','06014','20'),('061326','06017','15'),('061326','06115','20'),('061326','06116','15'),('061326','06118','15'),('061326','06120','15');
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
INSERT INTO `exam_stats` VALUES ('010101','2023-06-17',60,2,3,3,0),('010205','2023-06-17',10,3,3,3,0),('010807','2023-06-17',20,1,3,3,0),('010812','2023-06-17',120,13,9,9,0),('020403','2023-06-17',120,3,5,5,0),('020502','2023-06-13',60,60,2,1,1),('020915','2023-06-17',120,4,2,2,0),('030624','2023-06-17',120,7,4,4,0),('040713','2023-06-17',20,3,2,2,0),('040714','2023-06-17',120,7,5,5,0),('040731','2023-06-17',90,1,1,1,0),('061309','2023-06-13',60,31,3,3,0);
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
  `exam_name` varchar(45) DEFAULT NULL,
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
INSERT INTO `exam_time_request` VALUES ('020915',120,'1','315730176','Tzahi Bakal','Not enough time','Testing 2023A'),('040713',20,'1','315730176','Tzahi Bakal','I need to go earlier','Anatomy 2022A');
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
INSERT INTO `manual_exam` VALUES ('010208',_binary 'PK\0\0\0\0\0!\02oWf\0\0¥\0\0\0[Content_Types].xml ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0´ËjÃ0E÷þÑ¶ØJº(¥ÄÉ¢ehú4NDõB£¼þ¾ã81¥$14ÉÆ ÏÜ{Ï1ÑÚl	µw%ë=^i7+Ù×ä-d&á0ÞAÉ6l4¼½L60#µÃÍS\nO£Xø\0*V$:ÆB~ðû^ïKï¸§Ú\r/PIÙë~7$²ì¹i¬³J&B0ZDu¾têOJ¾K(H¹íÁ¹xG\rL¨+Çvºº¨dcÓ»°ÔÅW>*®¼\\XR§mpúªÒZ}í¢HwnMÑV¬ÐnÏÃ-ì\")/ÒZwB`ÚÀË4¾Ýñ	®°sîDXÁôój¿Ì;A*Ê©Ëc´ÖÖ\04ßþÙ[SÔ9> ­ø±÷{£Vç4pôéW×&õÙóA½¨Ù|»d?\0\0\0ÿÿ\0PK\0\0\0\0\0!\0\Z·ï\0\0\0N\0\0\0_rels/.rels ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¬ÁjÃ0@ïýÑ½QÚÁ£N/cÐÛÙ[ILÛØj×þý<ØØ]éaGËÒÓÐzsFuà]ð\ZU\r½	Öù^Ã[û¼x\0¼¥1xÖpâæöfýÊ#I)ÊYÏ\ZøÍÀå*Döå§i\")ÏÔc$³£qU×÷~3 1ÕÖjH[{ª=E¾ºÎ~\nf?±3-ÂÞ²]ÄTê¸2j)õ,\Zl0/%b¬\n\Zð¼Ñêz£¿§Å,	¡	/û|f\\Zþçæ?6ï!Y´_áo]Aó\0\0ÿÿ\0PK\0\0\0\0\0!\0«*9®F\0\0Ì\\\0\0\0\0word/document.xmlì]_s£H¿ûu~êqÛ@ñ×±í	þv÷íìNGwïÎÍ#Fe5¢´¬öÄ=ì×¸»/7äª\n\0!X°~hY ª¬Ì_fefeýé§oó\0<¢(öqøî¿â.\0\n=<ñÃé»¿}uÞª NÜpâ8Dï.P|ñÓí¿ÿÛV7ì-ç(L\0i\"oVïÝÅ,I7××±7Cs7¾û^c|\\yx~ïï}]¯p4¹8c-\"ì¡8&ï3ÝðÑ/²æ¼oíZDî<L¯½%èÛ¦\r¾s#Òµv­n7$ôhPà·¯i¯¶\Z{5DzµÕÔ¯¥ÁÉýZ¶[Rúµ·[Rûµ´ÅNómÇ÷8»	ù\ZM¯çnô°\\¼%\r/ÜÄ¿ó?y\"mrrÞë=zDZ·0Î-(×s<Aä­àwË(¼É»~vý&}>ûX?v¯%¯Ó®Ñ·$üÙ¨\ríÒÇ­XÕ®#:â0ù5:Ìû¶FnÎòFð8òß­|KQÛmV:\rÛt?»yö¼¹Ek1´õmºP~gÞ9áàÍ{¦@\\¾%øä\r[\rÈj©,ò6Ô¬ko#Ý´¿¥Xåí¤³BÛñ7å[b`µ3&ËNM0ïý Ú\'ÉdÖ­¹|®é³nâÎÜx-4´EÔmÒº¹§yÞéóê}MkþóZû¸×5t:´	g0âçuæËÌ]Ô{7§!Ü»ô\Z ÒØÐÿ	ÓÑö\'úÆ®Ó¹¯.nv\'OôsAî77r?#ØPÔ/ØU¢ßzUÉþ«7Ä\Z|~wÁq.P^_²Ð½»í;\nØ?EìýþÄ\'¿xtÚà.®é¥(»Ã¾Ü1ûÏôgñïf\\¾v={½n=ý¯o{«e~R<@Å¬nÛé·$½ÆÞSáSDG«K²®òl´ÇëáOä>p4zE±=ÁÎÉÆU&3-hHºú½LpT,oâë)ZD(FÑ#º¸ý«;G7 þå&ä^ZK&¨üÎi/­wùÿjç0¹²¬×wÁä)@ù¨øt äò¯äÒ|&O2(wàõí1~XO¨³ÝûQ|Æ+Úù\Z¸Ù·ÍMË9]nç÷óì\'!þ`÷úÛßÓo¬Ot0N¿ü	ýsJ>Ii_eMÓÖ^NÈLÖ°VbÄsÐV5K³9ü+E<mrk!¼ð¾LZnó¯µØ-jáÉ$#ûQXüNn©Io¿çow¶^ßù¹úÂ¬ÛOd7ÊdÏ¥ÃKÿ¯\'\rÇmS&M±ýö4|ÒPZdÆØäB6ùææ¤ËUQq¼j)ê43eì¦ÚÛ8YiÅ®ÞÅò¨&õ©ýåtääËç%5ß6¸Ãl¥»\rªæm®¡WP·¡7½VåÕ¡Ê¢h²Þç\"LÄZÙt«ËÛ(¦~Åß«\ZIÍMÃ+\"	}Ö=,\0ÞûñÌ¥déa\\üîÅùVÚªâMÊ¢9êbòeÅïh¼(Ý­u2Êõ²Ó÷N~+câö}äNÐ\\e³ö|AQ¢þ4ÌoÄËb/òIuÉlPïÅûÙ3%ýÕ»yÃTE®ÌÇ«¡QyÚÝ#[âMÁ¥îâ4Ú(;õëÍÉÎÝàÈ t£M0h­»áÅIõjÊ¿ÏççNêïJà_Y{×KvåqÓâµ!/yÜqÓPËâ?Ô\0üPLÜ\rÃô#m 4%¨U,è¢Ó«Ï^»¥¢cÊàr\\d°;®Ý^ÇÚ³(ÑÌãÚm3ÔÂ1Gó6V8z\0oæn\"ß\r@â.§³ø! ¿|ôñ2s@ÿp³ÃVY*ó:ÁºBÏ¿\":, È=¨²oËªJmèpDû^RVoyvµzþ¾Ëê)Íö3^=÷n¸ÑSõEýÛÜa¿à{@ìªÃ1¼ÍÙ*[Í²mÄúú0úZqDN4T¡þß£¾®×2§Yæô	öMgXûJÈ{GpoîÛn/AèÎ³eèWßã{;¢£Ieh\Z¹ó/1÷ßù¨ºÁk»`ìÉ\Z¾ä-GÔ9ºGûl/ê¦a©I(RzkUbá1©UoõÑVÏ4ÅÎ¨­rÉù¤7wq {;-ãàPü)/\n8À¦Ð(°ö]ÍüðgBÑ¹¤©$¨@¤5 á¨pÉ²¼#:u2\nÀÓàª!tB?ÒgK©Õÿª,óV¶.\\ûLxÞá-®³\rõx\\Ú±	ÈBúÿ.Ò¶I9UÙÔ`èòÁ2ç^¼¡ÛÈYÐCñ?Û,üxÜÉÄ§Û#Ü\0¬=y~17.K÷ríÇDA]¹ý\Zñ0N]jà¨~Mª/S·¦çFøÜ¦eWº´e@ÇÇ4âQRM©ïCfÅj?ì¬TL;¾vonó\"@n$®7ÄrH0ó¥>g°ÜðªF¡n¯jDMÓÍÌg4®jö@¶aBÉvhxZ¼$ºh5f-¥¼À ÐÈM?.Jªv¥ÙÖÉÍ~6ë1ÓñÜ\ZJ^`/èè¦jvÏ-²Yd¼®óÑß\"KsEóg±ÈäX¬&½vUÖï|GL)Ó\rßNp=$ÐT¤zh$}ô¿,Pä&þ#jO}Û²iîßhì	Ó4UÊ§§ÖèÛ,Î3¤ämI,²ÿv-Ç e8A«åâG>J³ã­±»ÉÑ\r§,ðqïÎýÀw#b/|/o*oÜI;®¦WmÜ,{F/HwÉjn¾}ï`Ò»È}DÁ`ùIB°ò S\n>ÇuØ;+£ÄÇËm,ïË8¡Ã(d¼É¼ô, ó%´/ÿ\\ú[YOÜ}Ú´Ï@çhQ\ntdKÒÎ¥®\"uDªR±f´dæ&ÀÐ»ü:&1¸ð<c³K@úÑçØïé2Ö»Sòü0óç×3DåLdyK,ÀI(á¦cõá)°añ(ÈDz#O§(K¹a¼\"³ýO2Õ¢Üáeü¤õ3Ê)ªUÙWÄñ&üf×¥¶dK±ÙÏ_ÆÛ°v^þ9æìÒ8Í¦ýQÜ@ODÊ\r¢!Òe[½Òb\\QU×ÅÔlN°ÒÀØ&b1ÖÜûT-çßû^E>UÛUjCP[æ8ª?óð{â°µ]wTPûU]iÕA?R|+1mHVt_B5k¢Â[c²	jÆ8å.é¹Ü4ÍVlfÊÝzÉ/¾\\×ÌvÍnÎÅwû.Èê(öÕêÕÔ8Ep¡s¢åÐsÙÈP×8ôE³Ú©éh	ÜÛ^@Ô	ÛP:µÓ5Ü®~Öô©Ë-ìcN4½>un`£Ó]»[¹¥ÁýÁævÜ ={\'ÕÞ¿\0º<}Ìâe·ÈÈ£ëbPÙGö¢JM(øfVÈ]@ÄâºOÏi:!æO¿üélû*«z3LÀ7#~Ï¯ÍÝhJj¦­ÿ×²¾{wA7é¡(¿øÛ»·<ÇËëNdz|	ûÅÏî¬üÖ½ÿ\re.Öjé*Þ®`v¹ÐûÖlD²;JW­-Û}¥«xQËÆWº¬qÞ®P¨»,Hµy¹þ²ZÛö®Ë;Ú#ìPYK-ÇÔµ;{¬¬µ±Äv±´±C/P\n>ì44yhÛfõR\'©³Q]gæâÐm¾÷ÂÚØîâ¢eëéUÉ´Í>«°cåð¶^yuE8jlâÚîMÔÀøêÏË{Ï\Z¹u=SLµ*Á±LS#£*0Ñ¡q/«é^â?úIy÷mÁY 5:BCt³©c¡cKvëãÞ¿$ÕMÚ;¿rÇÐþFM4|þÅÆ}\0-ZsOkxXòö¿|z@þK¾ëæ¯MÐdÄå~ºàm%O,QçìÞ!ìsãòó¹Î$4Á/ÑÔ\rýßS7êz¾K*B®7óÃi]Ñ^ì4² X:|F¾ùGªSóâ/wÿ@Ô*EàÍ¯~û©ÛÕ@ 0ú_y¶:C ÞSÎVúA ú+~\\êjü²p×µsx½Dríèº:¼õüéÏéq_e«´Äô#ýñúm;éa\n²³Î\'P5(Øâ¡NDHÁéû\n&ÑD%9\rx^\\óu>cúËN¤èäÑåtÅM#câAB!ù$»QJ>ÉÝ¿]¢K³\">ãeâuËÅ*%%NwKê_	mH¬¢lÈº&rTH^ëÁ0-Ét^ÑÛWcX¤]Ê /CI¨JºÀ+ÍK-xDâC¢ÕzÄ#­¦»g\\AÖ%Íá­Þ¨&<g­O]SËZ¶W¡fÓy>PË_÷OÀGìÃÅrá%]|ÞÞE)Ü\nWà^±½`Ox	<q~\Z`GëÝãð\nüJ·¦ùtK,ä&tGZà? l(m¶ðæpÐî¡â%AÅªT%o`ÀQÏæâãrÂÏÓSÆ¦yÖ²÷h6í7:LuYþé$Ïxù±4ÌïJÖÄ\"	üë§EËâ(ºÿø×ÿÌéBD÷-T±]ÙFËýôÇ¿þoOu°ó(c:,ªÇ|_ß/ü ¢â\"?¡c¡7È8dßa7\\UqÖizü\0ÄÔØ¡8Åêô­;^îk#Võ]£AÈ÷Óµ[tTäWä{´î_RÎ)×][e×-ú	AÙ;úyx!:îhÈnåÛ°áaiÈ°´óhøg¡Õ:ôÌé8yÀøùhu±hZ/í+Ùx«\\®¦eWY°Ä7ô#eº¨ýÐnè¶,j{ÆBµSÌRàeQÒrÝ3®JÌ=úhU[ä,[·í×üíª\ZÆ`W;«K³5Î¢ÐmxäE¬[Ã7uÓRåJÍ\ZYRe[77åµvÈn\r(²e¯.&·<×Þ´ê»+Érd²ªhJhª¶¤3?àêAÓ\nLV õ$JLÖa²«v38Ïó¯Û)ßvg\'ÿÑ\\oÁ¢]ªzsú~¾Ç\0?Ò\n3´9]·Pôî©q*öqë_ìG(MOrÈjVFòvØ¤ÈÇ­s±·Ó1-¡zÖMË2VjBT	BÔYû<FªN©TAª£²Åpé\rw°ô^ZÇ147ñ| \\ã´À3E¡n//AlzL«²nCNz§¾¨Nq;³°[IQää¦±èKpÚÖE¶$\n-:2ÑF£Â[¢¬+)õvÆ%`ØR;hÂ6!ºÆ\" gXdõEØðF!ë\Zt¾w­ÞQg¼ñmi¹@ÐZg¨®+ìD1>»Y½Kª\nEaÏ6µqîN~dëðfQÖmC!¦$¦ÑÛðÚÖ¿,Ë?~ó3r\'oý°Õ¡Yfjñ·Ü*¦\"*Ò{üÈ¢!8ökEÎPTÝdýµ±½17&Z´¬à©hªäÐ}ÁÅL¨(ÌÎcÚÃ#õ8È¢ÍÎíÄ#¬/0Ì5Ý­T×;X¤g.´!\'ëæóNH,Ee:¸o-õ{XDìZ2N­vn²¢[¦XÜ)ÝÏãßðòëòz($Î¸(±°\'\nÍI¦m3~øÈé6&Úü[°bû.1ÛM>*ÃÛ{TìÐë\0Gvg±m;}YâÄ}ÊY¶²y¶:¨ãçLjP5\Z¬ªd9Ë¨drP0uKd6­^NïËtôî0°£ñ¢°>uTLQLÛ*gF¤8\nüðD7>dôqÂ&tæÓS(¶ÀeOg2ïhiÆ>ämVq¿pÈ1øoð!Sé÷/,ïqþì³»ÿézàÁÌ¹àm®dªL½î~S\'ÇÜ£.ºåAWuE«` AÙµ¹íÆÅæ}Æì^+¾¢|ÑÛ_ÝÄËÒR#,ä\'3»ë³¯Úó{ÏDE²yC²éæ\Z\Zª,¨Æ¦BT¹>l@ë;s~6YÁÙL\n÷·}[Z\'ØÛ{;¬v8úQÊòØÞO×àé%^¬}Qf3LfÛ#Ôh¨k»±!òôøØþ;ÉÆ½ÙG´ëðåà(×ÆË½%Mê7|¥!~(ñÐ¨nË«ReÜÝ+;E³eIuSÐÙW0,)ëDRJ¿1`¿°ßáìFdñÄ¶TÝ·ñ§¡÷TRøniçæ£:ÃnKShªÎÛú«NLÙqÔÑ_NÂ\"Jªô¶¤_ÀEÕÆü¯u H¼¬½fY¡Íéâ«Êi©mëÎDÒ=DJ£ØÔøje3-SÚW®ée+\r^ ¿÷Æ äÕ4{µÖ.[õªxÝÚ4f	¶qºj¨}p;ÍÀÕqwñÐ0%ÈÓ¾Ï\ZgÏ+Ç^9o9¦KXÃF-µTJ{WCðÇr2f¥!^\rµTñfWC?ò\'ÈêÔM\ZJÍ5îÞ{a3E!8jpÿSÊ\nÂ\0\'ËìeàôµKhQw?¾må\'Sy^Q¸ª»È±¢qEI \\2I¸§·ýà1¨¹÷q_Ë«Ä¬¥îÜRWæ|IºTNE;}Ý­<#:ñ =~!\\½\'óYQlûÌõ·hNsS9]ÑÄ»·,Û<Ù\\6Nx¬§·!=9åºÏYÙ¡=@\"^Ë½e§Ý¥Eø¦þ#Ý¡¾¹´êTÜÌ¬!®pæwòÞÞ4vVÒxÛÎÛÙ÷8ÜûñÌÜG\\\0ß* F\'`æ8zºcà\'yyÁVgÉ<ÏzÕÎkek<Ãè~S¢¬§5GÅ9«ÏBÆ/»$ó\Zû6ÕÍM`arsJaÍÓÅz7µ¾,É-ÅÛÔóÔ­ç´Ã[vO?wJ%3ºÍ`EÀ0B`YyÕì0(¦HwÞè:/ÊgÆtº©%w?°³¬WÖlpPÖÕñûÎâPYøà¡CÅ§jp÷äÇÐoYÓIQD£dQw«¼¥ªÖ£3¿XPÛ.r,µ~\\ïjûÐÏÂ	Ðä;Eå6T¢Ð=7¤µL¥Ï*³ÔÉº£;RÄÐFÙ¬àöÐìÓé?|SwxSÑÔ3¯¹ll^Á#îèÉ¢	ÝMÑ·ç$(\ZÒDÏvå=in6©BídÔÒO¬UäQÛw(jê®Ä	yæHÁO@+Ñ#`´ÐAÜ(D­æM#Év	Òâêuªôpâ_5JÐI%Ãñ*v(sqÚö_,©ó¼zCcdz\\3ìcÆ_g~Z]P4Ù¬ìzâ,ôòvqB.ÝfVeÉòã,óÍ¢ã²ø{cñÛ¯JWëcë×*&\\&ÁSmÉ2Oæ³¬¨üz#²\"Z]ÙrÝ ¶É$£½ß­jd.»4ÊÜ(sÇQ+ï#¼\\\0Ï(ñi9mÏNy9KT¤­Ë¨_g]g%n4½-Mæ*ÅNo/V!¯tQw$ZÜõ¬]d\"rÙØÍ!Pò#@ßK®ÌÈsæ5[l>¹E1¿wËF\rW~¤Éó¥7s!0YFù)OÈÝsÞ¡Â¼|æ@ïG\Zmì¥jËðÜ½t	¥NI:çS¦æz½½EºÂÊÉü^·[u3G¾¬<X# ¨² û|Ð7	\"òhT. ?H®-,1²(µ°#î{¼<ÇÛÊ©8)Þ®S]ràa§£f\0:­0ÝºC\'#ðÜhî#<ó\'pçNYÎ]b§IPkQJpz3Y5ÖCPà#ã\'â4÷ãÄ}@ÄIµ>Æ=¼¢6Kª»Z«Õi,ºi%ñ¶xÞaî±³TÙâOi	ÜN&­Øµ§%Ýmn Ä áe0¡	×4RÖ§\'Ì5õÜ¶9õÜa;Ð)C`KøÓ h«c9Ü^­×#ª*ÊF£3l_²VM ¤@¡FÙ?ú¹ÎèçJ9òÎ¸Ñû u 5*Qq<KnófóÖ£×\"¥ÿ5%Àý^&º<LÝÿ¬0úøLÃ~¨2C~ðªQqC[0tõ)¹½¤.ù2ô=7AuèßsV,Ð:ýé[\n¦Ejn¬]­;Z6¹\Z£gÑh(CEµD­ÌíËDX\'8ÌÚ1Z}Ø¢ÑµÄNyãeÉ0q·LÖÚÖ\"\'È½ñj`{öLtC±ÒáãD÷Ð«w©íÑTð!¹ý­Ú:Teõe».¦ÍJiIÒ$(©-jé¥v÷.úhCóæ$(F\Z3ûpgT0ýÅ¢=î4ü²¥Ô£ÆbÞí0wL×ÌsT»Éy¤ÞÔEx®÷¬¯³Ê84¡#\Zû¨2$ÞdïÇn¥×mtø:j oGÏ¯ýÏÑ\nG5\nmËÐás×Tü´½Î.¶;Ã±tkëXæ!hÆC°zVê#)ût*·Óxðåèå9^~S íØ½K^ºyµÝU{<AlðÒÄÌ¾jü%µÃÊeVF4i&Ý| ¼-K²>ÄÃÂ&ðlB¨Û%ÈAæù<2:$KÑÅ!)ªFóÞç¸½N¿ÏÉ`[{lö~¿o«³R¦ÏÆlr\0oÕ5m6£o%ªöû­»¶OT»ùý `É¦0úývøýÌ\0ÇËÕØ[ä4òÎk:h4¥÷[\'·4-Õpø\nàQ³uó%)F&^õÊ¥«9£¤ýûn\ZÑÝÁ×=]² ¨</Râ&UãØXwNê1,ýïÎ*XÏõ)öÞç3·w¬>tcvz\0m¥*Néa½ø7×:\'Ç­u1|EA\0t×tVàÞõèÆÃ={½EK²\rqdÅÒpM£á8Å9r&Á÷©Õ¶(F«\n745ý	Y¼4	jÔB£M1ÚÊ»ª[Käu[Q¹JZ¤KA­k¹Ú)¯ÖXþÜÀÿíWCDt\r­A7ÌÝE¾°ôB¾W>\ré+; Ýß\rÐ;ôýª@¶ø©ZX4-âyÕ`¤<F2O{%Úç(*2ªènåò*Ú-í²¾SV/éåV,;3OÌ-[4µ·ÃóÕj_g8È\n<ôÁÎCR%MçÝê}àø©Ôçóç³Ð1¶tó3Ðqø[vvL	»DnÉmVLáõEnéÇ]P;\"ä-¥ÊÛ\Zgª:£=Îvj·ta[w§üb2-ÇqÒkõd ¿$kOQÇ|!Ñ«º(èRºµp1ýB{Áeí¸¿ycMáÈG!y& ì{î¥ý\\LÿâÒµù±¢¥äOg	\rW?ïpàùævîwgÈ &6Òý7÷\'¯Ó%=ÚcM=,(±¡sJÝ$xÏ`ß&Ø{O´}¥¢O~âÍ¨ä\\Rýy\'OìòÈrNzûÿ\0\0\0ÿÿ\0PK\0\0\0\0\0!\0]Ô`SH\0\0y\0\0\0word/_rels/document.xml.rels ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¬ËnÂ0E÷úÝ5´@ÕbØ´XtCágò~Dö¿¯K	*ºÈrnä3gÆræËÁ¬+fdH\0Z¤Ð#ÛÍûý	rpi40Ò#ËÅíÍ|\r£?äò¢t§hÇHX>SêD»Ð ýÔXÅÑ6£%;F£)µ]Y\\0UÂ]%$Ø4%ümÒ´ðjD¥@ãÔ¢Ìy&· #§$ô,B¯+ÌT@ÚþÇò\'÷9D®	Ý%ë¾öã!ÛëJÅ`ýÖ[sÔ\'1R\"5\Z7<»8G}!%rO²²Ð»Vâë<·®ë°1V1Â(ZsùrÏ&É:òXêi}ÇUùl6;_åI¼ÙÛÁjþçCPCüùëUuÂÓ.éÅcñ\0\0ÿÿ\0PK\0\0\0\0\0!\0¶ôgÒ\0\0É \0\0\0\0\0word/theme/theme1.xmlìYKG¾ò¹ËzÍèa¬5ÒHòk×6Þµ½Rk¦­iÑÝÚµ0`r	C¹åB1Ääc°IêI3-õÄ]	»U?¾ªþºªºº4sáâý:GÂ[=WqØ$aÇ½}0,µ\\GHe	î¸,Ü;v±ò8:n$åì|¹,F0Ä96Ã	ÌM.ËcAoLËµJ¥QI\\\'A1¨½1vJwg¥|@á_\"\ZQ¾¯TcCBcÇÓªúPî!Úqa1;>À÷¥ëP$$LtÜþsË;Êk!*dsrCý·[\n§5-ÇÃÃµ çù^£»Ö¯TnãÍAcÐXëÓ\04\ZÁNS.¦Îf-ðØ(mZt÷ýzÕÀçô×·ð]_}¼¥Mo?\rs ´éoáý^»×7õkPÚllánßk\Zx\r(I¦[èß¨«Ý®!F/[ámß6kKx*ç¢+OdQ¬ÅèãC\0hç\"IG.fxF%8»$ ðf(a+µÊ°Rÿêãéö(:QN:\Z­!ÅÇ#Nf²ã^­nòêÅ¿|ôûËÇ_>úu¹ö¶Üey¹7?}óÏÓ/¿ûñÍoíxÇ¿þå«×üù_ê¥Aë»g¯?{õý×ýüÄïrtç:>vn±6hY\0ò÷8ÉKtP )z #}}(²àzØ´ãéÂ¼4¿gÞø\\ðZÀ=Æhqë®©µòV\'¡}q>Ïãn!td[;Øðò`>¸\'6A\r7)¸8ÁÒQsl±Eì.!]÷È3Á&Ò¹K\"VC#2¡Ë$¿,lÁßmöî8=FmêûøÈDÂÙ@Ô¦SÃÐ\\¢ØÊÅ4ÜE2²Ü_ðap!ÁÓ!¦Ì±6|aÐ½iÆîö=ºM$djCî\"ÆòÈ>gVÎ$òØ+b\n!LZI0ó¨>ø%î¾C°áî·íÛì¢fæÜv$03ÏãN¶)ïòØH±]N¬ÑÑFhïbLÑ1\ZcìÜ¾bÃ³aóôÕ²Êel³ÍUdÆªê\'X@­¤c0Bv¬ÏÞb#ñ,P#^¤ùúÔ\\u±5^éhj¤RÂÕ¡µ¸!bcZoFÈ+Õöx]pÃïrÆ@æÞÈà÷ÄþÎ¶9@ÔX U-ÝáþLD\'-6·ÊMÌC¹¡¼QôÄ$yk´Qûø¯ö\nãÕO-ØÓ©wìÀT:EÉd³¾)ÂmV5ãcòé5}4Onb¸G,Ð³æ¬¦ùß×4Eçù¬9«dÎ*»ÈG¨d²âE?Z=èÑZâÂ§>Bé¾\\P¼+tÙ#àì0¨;ZhýiAs¹9Òm3ùÑ~f°LU¯¥êP83& pÒÃVÝjÎã=6NG«ÕÕsM@2Âk5eLGÍìÞZ½îúAë}¹ÅLuæjð-$ôÎNEÛÂ¢¥Ô²Ð_K¯Àåä õHÜ÷RFnÒcå§T~åÝS÷t1Ím×,Ûk+®§ãiD.ÜL¹0àòØ>e_·3\Zô)¶i4[Ã×*lä=çÎ\\Ý5#4ë¸øÉÍxúÊTIÇÉ¥¡?$³Ì¸}$¢¦§ÒýÇDbîPC¬çÝ@[µÖT{üDÉµ+åôWÞÉx2Á#Y0ua.Ub=!XuØHïGãcçÎù-òUeÀ1rmÍ1á¹àÎ¬¸®GÑxßQDgZÞ(ùdÂu{M\'·ÍtsWf¹ÃP9éÄ·îÛÔD.i\\ êÖ´çwÉçXeyß`¦îÍ\\×^åº¢[âäBZ¶AM1¶PËFMj§Xä[fÑqÚ·ÁfÔªbUWêÞÖmvx\"¿ÕêJ¡©Â¯Õ+É4èÑUv¹/9\'÷AÅïzAÍJ?(yu¯RjùÝz©ëûõêÀ¯Vú½ÚC0âª®=ût±|o¯Ç·ÞÝÇ«RûÜÅe¦ëà²Öïî«µâw÷Ë<hÔíz»×(µëÝaÉë÷Z¥vÐèú Ùö¿Õ>t#\röºõÀkZ¥F5J^£¢è·Ú¥¦W«u½f·5ðº¶¯¾WæÕ¼vþ\0\0ÿÿ\0PK\0\0\0\0\0!\0Qæ:ê\0\0\0\0\0\0\0word/settings.xml´XKoÛ8¾/°ÿÁðyKÔÓFÓBÏmd»¨³Ø3-Ñ6I(:[ìß!%ÅN:-½ÄÔ|óâÌp8Ìwu5¹g²ã¢¹ÚÖtÂB¼Ù^Nÿ¹ÍgátÒ)Ú´\r»Y7}÷ö÷ßÞS\nØº	¨hºe]\\NwJµËù¼+v¬¦ÝhYàFÈ*øÛyMåÝ¾¢n©âk^quËò§\Zq9ÝËf9¨Õ¼¢¥Eb³á~F	ù»½H*}Í\Ze,Î%«ÀÑt;Þv£¶úGµ¸Üo÷u5òlëÛ=Y>J¼Ä=-ÐJQ°®ÕÕè oNÝ¯=Ú¾\0ÛÃ*·-³:÷Ü{ò¿`¯Ó:æ y®¯Óã?êá§ÀÚþ9s¦ +U¹{2Æu®e©¢;Ú=VÖÈ^ç÷¨îXbÔU/©ºækIe&©åÕ¶®+pJgÙïô_¢þ1Kö`è:Ó·Ð#>QOËÉ\n4ËÎ5\0å)6+E¨Xv-«*ÓqQ°xXn%­¡W#S²\rÝWê®WJ´ÀtOacT;*i¡\\µ´\0mhÕÈW¿J ïH8éB§Õªïh ÑÐ\Z¶ú¤KÝiÏö¿<\'ZÀX·½sÏ\r	èÀìVx¥ËÁùÿÌ¢¦ü°ï¦Wýßs5ÚòG(ÛcËrFÕÂôLäoo¸B^5%ÔÆ/3Æ7&Á\0Z»òáRLß3ZÂÅ÷ìî;ö/0Ãtn¡,ïb¡¨ßÛÄúç2iê}~^¾p}Ý¸ø$zdµâ¸ß{ªÑbYd8ä	AÄùE|²Y±zDÁ\"ËP$öÜ<@ÄI¸ÄÉH\"©x(b/Ü8D}³`â2¹ç(B,ÇÐÛ²3t?Øà78Ä(øi#iÆ9äã s\"ËOP¯,\rë8B½v-Ï!hD]Çõñ\nìø1Zonê\0õÀÈ%èN=ÏIC\\fagjÇË</Fcàûà\0º?óRükû~jãHf(ÁÐ\'ßÈv:VÆ Ì|÷`¹VöEê¸ºÓø¢9å÷ï3$ú£DíúhD£ÜKp;±å%x}7óP;qdxâÐO2´F¿ÝGãÔ³3Còf!±!¨¶$µHÖA\n 2éÂ	C²À|4sYføùÉ/	Ñ³»P½¨|a»Äx=ï!¸ê¥~ý-Çi&u/Ðz-9ÜèGÓ\\s¬å]Ì_3LÙ9²Ú¯Gp6ë®¦UÃå:ÆµzYò®MÙÆ¬«*·\'½D©0_~xÔ¥çU&ÿbßöèAÒ¶UFÛuIÞ¨k^ôn¿^R\rÌÒgÐ¾)?ÞK§SxKW¿ù®©!Ö¼Ô]]÷Ñ.*¹Òó»¡mÛë­}9­øv§l=(ø*áqm>Ö[2`Ä`¤ÇÌ-ôÖ{Xhd¤ñ9#Í9ÑÜæhÞHóN4¤ù¶ÁRÂ¾U%¬|Â¿\"õAèv´eiÿú=axtû%{\'+¹Nº5}Ð/bÎÌÀ]Ñ£Ø«\'¼\ZÓÌíS\rú56Ìxó\'Â¦Æù¢\'z\\ëõéÍqÑ;^ñæÃ\'JÈûÃ`¶»,EqG	Vî9yæCÛ°=ó¬Qf¼bv¬°QÔëE¿DãiìÎ²,g®Y¤þZ»¾ãÅyþßpJÇß¼ý\0\0ÿÿ\0PK\0\0\0\0\0!\0 FC3$\0\0 \0\0\0\0\0word/numbering.xmlìËnã6÷úöî²-3&q¢]ÓmáE );ÞÎËÌ#ô±æz(Y²¥$§­Î\"´IG?y¨?ùðñÑÑ\ZKEYîµc0ODJøjfýñ8¿X#¥OÏ¬-VÖÇø°yÁXÂÄ0¸7y2³2­óØ¶UaÔ5#J,õu\"-K`{#dj{ër)¬pn_#eípÉs7Z*Ñ\r0°I÷·7$´§ö¤\ròà	=·ò{£\"ÛdÕ@U#½òpÑ0×&ü6i2Ô:N¬}ÀE9.dHÃW¹²OE~ài² è-0¨Æ ÂdQ\rùioÂØf\"ÅÔOkYäñ.þª7©ÇUü®i\"0í¶,,7µñ³¦J×±²vUøH\n¹.U³%¦ £à*#ys;°¡4ÌjÈú-ÖÖó6¹Û±Ôþéj»«¶aìþnï­2è:vÓ .)¯YgÂàï$Í¸nÇË§x-@à/1Ù1ìd_ÝC:UÍ©vÅpÈ^X·ãø2@ZôBx~iLøK¥:Íúáê=²M,Ò(Cª)\ZCÄý0lp[v w¾:­¨~¢È÷4r\Zía½nÓéÁÚçá¡NKæKr¸uY?¬¸hA!#(µTË¨ÜóiÊø¹ì7{=2÷u\r-(Ñ6:úö\0ç¬ÐbÁßIÓY¹¹OKåO£\'3ÅP¸2ëÄk¿{7;®X¶aÕäW¼ÆôqãzN¶]HþfÆ¨«æjÓzÆýí½sïN5B×f@S%ëÂt5?nCcDtÎÎEA)Ö\rñÞ>õÐ÷¯5ý¿$u/ÅËÝôüwi\ZÂÍcî5öÊL2ÄW¥ö£2Y»,wÍ\\p­¸*!p¿lÙBÐ2ôèvÔA8S¼D ÌVRì2±J¸-%ü²Þdð:\\c3ãdeD_]Ü &Ì­($ÁrôoÔyÑ¨öÄ~ªy-ÕÂ÷Wíû×o}uóÜhnÂló×:Pí¸¯@Õ!:.°A ÞçM&ÿwÅgYq ÃYW\\U_çWq?ð\nïÎ´âBgàUþ~7>ËÇïêÿ¨â&gZqQ0ð\n?½âì#wkÖxÓúìm}ÇAxÎ´zþÁÖw>v<ï>jÄm¶õb}/Ö÷b}/Ö÷b}ka.ÖwXÅ]¬ïÅú«¸õVqge}yiyùÕ5ÿ)Ó¢ü?rÙéÁÔD®_ªuäëç­óç¯@ÕhAÃÉÔuÇc¿rÎ¯2Ë¨U[9ï¿\0\0ÿÿ\0PK\0\0\0\0\0!\07èOs\0\0r\0\0\0\0\0word/styles.xmlì[sÛ¸Çß;ÓïÀÑSûàåk6³ÎíÄµ§IÖ9g,Ô$¡òÛùô@\"u\nD¼i§µ$òüpùãàðúË¯OI|¥YÎxz6ý´?	h\Zò¥÷gÏwW{¯&A^4\"1OéÙäæ_ßüõ/¿<¾Îçæ\0¤ùë$<¬býz:ÍÃMHþ_ÓTl\\ò,!øÝO=ë½\'kR°Yñ<=Øß?hLfCáË%é[	Me?Íh,<ÍWl×´GÚ#Ï¢uÆCç¢ÑI\\ñÂÒ3; Ïù²øI4F×H¡ùl_}Jâ\rà8\0>á¯4c*,Ûá8\'\rE-[eZ<*¢rP÷ëTÚ¬H¾j)®RÇ\rî9}¯oîSE,HBõ@(°ü¿h¿ü£>Ò\'õ»lÂäðoéqË¯Ùm¦¿êoêÏO<x|Mò±;QAQJÂD×çiÎ&b%yq3Ò»q%?ôn	ó¢õóØd*KÌ¿_I|698¨¹5èüô¾UöÙ¦{ç»$Ñ¥tïæ½ÜuªRým5p½ýMµ&!Sd²,¨pìÙÉ¾ÆLÆãë/JÙÝ¤,¸.Dª¿\rv\núXø»ðþyÄVº|ÏÃ\ZÍ±ál¢Ê?~¾¹ÍÏD 9ü¬Ê?ÎiÂ®YÑ´µcºbý²¢éçFß¿RÁBÿò2OOîq½{\néZ±5%RÒ {lS¸2ÿw\ré¾ï³_Q\"ão0ÛF¨ê£Ò\"oµ¶Ynµ]í*èð¥\n:z©_ª *èô¥\nzõR)Ì÷,¥õjX îâ¼Í18cð%4Çà*hÁÐÃ@GsãÍ1S§à¡i¶û¡a´swÏnÜÝSw÷àÆÝðÝ¸»ã»ww8wãîÞnÜÝÁ\ZÏ­ZÁp³´íeKÎ4(èÓx\ZIK%¥~xrÒ£FzÀTMOÄ£i!Qßwå¤îóy!s»/%»/3®8M¿Ò¯i@¢Hð<3Z¡G\\ÆtF4£iH}lP	i,<Í5¹÷Æ¢iä¹ûj¢ Ðh?¯¤0:!aÆÇWoñá=ËÇ÷eSO¬~bÏ\rf|j 0ã3´4óÕEæ©§4ÍSi§~«Æ§¯~Ó4Oý¦iúMÓÆ÷Û+bâÛ«ý±»ËËÓ£ë1g÷)ñÓ>f\ZÜÜgd½\näqè~l»ÍØr.xôÜùÓ\Z¯u½\Z\"¢Õ,-ÇwhæË¹\Z\'÷jx¬áw±b,h×~òy¹(zV¬vNâ²ZÐ÷6Ra¸bYîÍ\rú±FðG¹rú|Z¯Ø5Þ­¶£×êi¤ZÆ<|ð¯×4iÙÃhÒcþH#Äyñj¬µ]þ@IbåòïõäLåJýT__| ëÑ\rº	Kýèön/!,ü­ ®ï>¼îøZ¦²cü\0/xQðÄS	üÛºø»\n$8}öÔÚsOìyd*<Ä2¥ÌËªxÿ¤ÏN²Èí6£Õ5?õDd]-:<ø\"þxX\r)Þ$cò¸/§ºók6ÌËÅ¿h8>Ô}ä#C¿:þ¨ºÊÚnü2¡¿DPjéA_íàÆ7¶óÕØËä93BuæùjnÍóÝÞñÉæñgË2ö×5Ð[Ö@o]Èã2Is-V<\rV<ßíõ8dÏÃ!9ÅûGÆ\"ob(/%Ì\næKó*Àø+tZ°ñé´`ã¯Õ©`\0-¯qæuú÷t§ó5ÎÌ×8S0_ãLÁ|³Ã·].Å\"ØßÓBú\Zs-¤¿&-h²æÉ=!ßÅôx8@ZÑn3¾7ð´ºÛR£=.¶+/¿Ð·ªIÏzy8\"JâsOÇÖ6²ì^»¶ËLÝ»1º\n·1	éÇÍm2Û|y^Ý±]}U\r«ÃïÙýªæ«æhs²¿Ó²NØ;f»ìëóú>³4beRWÞLqrho¬FtÇøh·ñf%Ñ±<¶´eì¶Ü¬;§°ÌWÊO;Cþðd½áthü49að¢Æ¸·Ø¡ÔXö\rÁÓ¡QÔqà<åÙ¨ÏííÇlñ\"3ãNfµ_Cö~erfÇMU^sõûjm9/yuÜ¾sÂÉþ¦®±pJs\ZôríO\\u¢¹­ÃawÌë\0dFXE\"£9*$)Ö±É°Rf:ZÁ­ =.ZA{h).ÑjÄ*À°^hG´£X)(GæN\n)hG´£BÚQáç¨Ðç¨ÐÞÅQ!ÅÅQ!í¨vT@;*D \"Ðê¸¶7;9*¤ \"Ð\nhGUëÅ\níq\ní]R\\RÐ\nhG´£BÚQ!í¨rT`îä¨vT@;*D µºÕÐÝQ¡=ÎQ¡½£B£B\nÚQ!í¨vT@;*D \"P\nÌRÐ\nhG´£ª#ÚãÚ»8*¤¸8*¤ \"Ð\nhG´£BÚQ!å¨ÀÜÉQ!í¨vT\Zú¥é2ûþ¨§ñ}ûSWºRÚ·r·Qö¨ºVfý½?½7ª|ÃÂ1ãêµá´z«.@øüírø6}äCô½ê)ÙZc*GCC¾m	¼£¡Þ¶«Î£¡èÛ¶ÓàÑPÐU~Y_\"¦#`<fZÆ3ùP´nÃ.Ñ-CØÃC¹e;x(··­-ûé¤¹¾cpj&\rK¨U¡cØf&Øªg&ØÊh& ô4bðÂQhÍ(7©¡a¥vwT3+5$8I\r0îRC³Ôå&5X©!+µ{p6¤w©!ÊYjr\ZNeX©!+5$`¥9!1îRC³Ôå&5\\Üa¥¬Ô\Z¤w©!ÊYjr\ZdÉh©!+5$`¥\'©Æ]jr\Z¢¤VGQ:R£nãa-CÜÜ2Äç¡C¶Ô²vÌZÇl	jUkËÚ¢	¶ê	¶2	(=¼°fZa3ÊMj\\¶Ô\'µ»£	X©qÙQj\\¶4(5.[\Z\Z-¥ÆeK}Rã²¥>©Ý³à$5.[\Z\Z-\rJËÌRã²¥>©qÙRÔ¸l©Oê²ã.5.[\Z\Z-¥ÆeK}Rã²¥>©qÙRÔ¸lÉ(5.[\Z\Z-\rJËÌRã²¥>©qÙRÔ¸l©Oj\\¶d\Z-\rJË¥ÆeK	óð¨yB²\"ð÷¼¸k¯\n2þáÓæ<þJ£ÀoSß£Z9}ì¼þJ²ÕÛøÄþè3ùôÖíJQõX\rT;ÞQo°ôÁô«T]õZõ9ËE:­÷Ùß¿8?8:Ô~ªßõµ`SßÁK¿Ú¯ü:j¾ô¿òËð¦´³ÉKh|¤Á\'Õå·õlToJëÝæðçªâW¥éS¶W¥Õ§q«W¥©ßª·¤UÕ¯_¦úª®¡~¼I} áÉ½ª&¬÷Öcl3ªý:Ã§ª­¡\0C5L;LõúYÃ]ÕXÄþâÃM*GÜ£@U£\'R¡ÄöK\ZÇHµ7_wé²¨¶ÎöÕ£¶¶/ª§\Zí35]Óneª¯Ã¡z/¾ÂÔÕ=]­.èÛËò7µ8Ü;ÕèOª®$¢ßd`S{= a]ë	vgXù_&zïDz^&]wPqþ¼ i4gß\Z9t×{ÉÛ¼ÇÏ\"©É¢rµ]>­\\ëþMH£>n§ÍûÅràlr~,ÿ©á/b 	¢ËþõÅ1§ù6îé[{µOjåûM\'oBÁFÛL+o[Ê\'0AiÁU/sõW[×ñJý·]ú÷/Ó¨^´N¥{¨]iÕ¸ZS¢f\"Ý2å8âëÅ1hçúq«Y5P·ËÐÊ6r¨ÂEØ?^#^Öqj¬Zí¬ûgKª ö}¤F¨àèNêê©uÜÓL9|´²f~¸F.DðýA³B5Ñ>²m*ïk}³éï1+}§	%AD¯\"ª£R*Øa£ËÝn¦ê<ÚV§·d`ªOnÝ=þ§\nkuß~¶¸3E¤0Uì^Ô]\rZëAoùÂð_0\\\\ÉÛ#±=·ÖäÍ.T\Z@_ûÎE¹Ì\rÎ9LÌÎemÍN/RÚ/RZ~$ËvÍû§¤?#z×qR³Íbl»Íj×Ü>U8ÿn©B{îÔ+u¦ÄëzùO¬¯yúïlË\\Ueµ}Ts\rWkÃRÀr¾ç¬æòk\Z¥¬Y=ßÉ8$,åÙ;ýÜ®\'òÍÖ\\=Ó2Ûsuý«e\rE{²½ùùVô°éÌ¦ëáHìæ±tÝTú|ê$Säåü,oÕKP>Í÷©(I¬,ÚÁÜÈÎ	¦Ó}ÛmÝlém¦®ËsÝÖ_¼iªHb_üw¥§¿²þQO|½*×ò7ÿ\0\0ÿÿ\0PK\0\0\0\0\0!\0ï\n)NN\0\0~\0\0\0\0\0word/webSettings.xmlÓ_kÂ0\0ð÷Á¾CÉ»¦Ê)VaÇ^Æ`ÛéÕ%¹«îÓïÚ©søb÷ÿ÷ã.!óåÎÙäô¹\rS×X¿ÉÅûÛj0	EåeÑC.ö@b¹¸½7YëWORÂ§Ìé\\T1Ö¤+pXçÍS§a#\nÛz ÑÕ*µ±&îå8M§âÀk,K£áõÖ]¼`YDO©é¨5×h\r¢¨ëqöÇsÊø3º»Ñ	Ë8äbuÒnäì/0é/©]?cv0$G;¦èçLO)Îÿ%sPª2>Þ«lcUT¢ê\\~IMNÜÞµwätö´ñÔÚ²Ä¯ðÃ%Ü¶\\ÛuCØuëm	bÁëhùû\rAí²²çGÈ?¿fñ\r\0\0ÿÿ\0PK\0\0\0\0\0!\0céb\0\0\n\0\0\0\0\0word/fontTable.xmlì[oÓ0ßøß×\\^V­ØØ=ÀÏ®ã4±ù¸·Ï±v­ÒBiÚ8Çöûss»e°âVS÷\"pÅt&ÔbJ¾>?^I\0ªZñ)Ùr ·³·onÖ\\+öW0lJ\nk«I+¸¤ÐÓWXk#©Å[³%5ßÕÓ²¢VÌE)ì6L¢hH\Z¹¢ó\\0þ^³¥äÊúþ¡á%µBT°£­/¡­µÉ*£À9Ë²æI*Ô§-ÌhÐ¹íádyv#_å`Ð\r´\0CÆ7ÝãbÏCÈºq{È8¿7\0d6+:Q×Ðõ¥C\"ï6¨Á·ÎdO¥\rHÂ·à<ØýãüÝÅùÆÇÝÈ¬I`=QTbÏ/[9×¥WTià1V­h9%Ñ\0Ï8rKd\rñ:F$t\rYA\rpÇ¨&u8§RÛ]ÔhIU]Q	Ë]|Ep®«@,°b	ó9ÍAêH~IZmúÇæ9ããH|ÐÖZ\"ä<ñuðÙü÷ZQM¤øK°6âôçFpÌÉÃãã{Æ»ëñ·qÍ¹ÜÈ½^\ZÁsrÆÆ\r\\{+ÎFÚÉÔ7§täbÃ³Ë]¤ýáân·î3g2¥utÈº´ú%Ê;Öé\r#î0=R¿ ê³Ëµ\0xEéñ+n£ÿ]óêÍ¡þá¦ùW=ø5=Æ/ÕÞCêG&Ýr£¾Oâ_xh\n0û\0\0ÿÿ\0PK\0\0\0\0\0!\0ôãG\0\0÷\0\0\0docProps/core.xml ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ANÃ0E÷HÜ!ò>u(\r n E vÆZÓÄ¶lÓÐ{°A Ä\n¸¯´)E¬ØÍø¿ù\Z;;|,`Úp)(îE(\0A%ãb2@ãa¸c`¤hæÛ[U)\ZÎµT -x\'aRªhj­J16t\n%1=O/ÞI]ë[=ÁÐ\0N¢h`	#àÚ0T#ZZ2ÚYª]4b( a\r{1^³tiþhdÉíBÁèJìèGÃ;°ªª^ÕoP¿¯GgÍUC.ê¬( <c4µÜgx]úÊ<ÜÞµíq×øj Vêü´àbJ´\rµRêÌg°¨¤fÆÏotc`¨æÊúlÝ7<]cGþiï8°£EîÞÜ«{qOûpÏîÝ}º¯ÆôVOjóúäICtm¶»]XàcJÛPWÊUÿød<Dy%ý0Ú	q¼îî¦QtSo¹1¿6,üÛqeÐµùUóo\0\0\0ÿÿ\0PK\0\0\0\0\0!\0÷Q¸}\0\0Î\0\0\0docProps/app.xml ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0RËNÃ0¼#ñQîÔ!Rª­*BxI\rôlÙÄÂ±-Û ú÷l nä´;ëÏLïÉÞ0Díì:?yV:¥m³Îªë£eÅ$¬ÆY\\ç{ù?<Çà<¤1fDaã:oSò+Æ¢l±qFcKÚN$jCÃ\\]kWN¾vh+bÁð=¡U¨üH«·ô_Råd¯/>W{O|*ì¼	ù}¿ifÊ¥ØBå0î\r<#?6°sAE~r~l(aÓ d¢y¹/M\0¸ôÞh)Ëï´.º:e³\0Øô-Ê× ÓÀ¦-ÜjK\nÊ9°¡\"mA4Aø6òE/pì`+Á\rÀka\"û`ã:/,ñ±±\"¾øä+wÕgñµòØÜéÔn½$a>/Ï§\'#Ø\ZF\0nè¯Ó_@»¶Aõ}æï ðyxüx1+èûÌì#ãã»á\0\0\0ÿÿ\0PK-\0\0\0\0\0\0!\02oWf\0\0¥\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0[Content_Types].xmlPK-\0\0\0\0\0\0!\0\Z·ï\0\0\0N\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0_rels/.relsPK-\0\0\0\0\0\0!\0«*9®F\0\0Ì\\\0\0\0\0\0\0\0\0\0\0\0\0\0\0¿\0\0word/document.xmlPK-\0\0\0\0\0\0!\0]Ô`SH\0\0y\0\0\0\0\0\0\0\0\0\0\0\0\0\0\04%\0\0word/_rels/document.xml.relsPK-\0\0\0\0\0\0!\0¶ôgÒ\0\0É \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¾\'\0\0word/theme/theme1.xmlPK-\0\0\0\0\0\0!\0Qæ:ê\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ã.\0\0word/settings.xmlPK-\0\0\0\0\0\0!\0 FC3$\0\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\04\0\0word/numbering.xmlPK-\0\0\0\0\0\0!\07èOs\0\0r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ù8\0\0word/styles.xmlPK-\0\0\0\0\0\0!\0ï\n)NN\0\0~\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0yG\0\0word/webSettings.xmlPK-\0\0\0\0\0\0!\0céb\0\0\n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ùH\0\0word/fontTable.xmlPK-\0\0\0\0\0\0!\0ôãG\0\0÷\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0K\0\0docProps/core.xmlPK-\0\0\0\0\0\0!\0÷Q¸}\0\0Î\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0MN\0\0docProps/app.xmlPK\0\0\0\0\0\0\0\0\0Q\0\0\0\0');
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
INSERT INTO `question` VALUES ('001','01','01001','1 + 1 = ?','Daniel Armaganian','209146943','2','1','2','3','4'),('002','02','02002','What is the time complexity of merge sort algorithm?','Daniel Armaganian','209146943','2','O(Logn)','O(nLogn)','O(n^2)','O(n)'),('003','01','01003','solve for x:\n4x + 2 = 6\nx = ?','Daniel Armaganian','209146943','2','2','1','3','4'),('004','02','02004','Which of the following is not an OOP question?','Daniel Armaganian','209146943','2','Ruby','C','C++','Java'),('005','01','01005','Calculate det of mat M\nM = {{1,2 3}, {4, 5, 6}, {7, 8, 9}}','Daniel Armaganian','209146943','2','-4','-6','12','31'),('006','02','02006','How many bytes is an int?','Daniel Armaganian','209146943','1','4','1','64','32'),('007','02','02007','What is the time complexity of Bubble sort?','Daniel Armaganian','209146943','3','O(logn)','O(n^loglogn)','O(n^2)','O(1)'),('008','04','04008','What is the general formula for alkanes?','Tzahi Bakal','315730176','2','Cn+2n','CnH2n+2','H2O','Olives'),('009','04','04009','What is the difference between an alkene and an alkyne?','Tzahi Bakal','315730176','1','double bond and triple bond','both single bond','both triple bond','both double done'),('010','02','02010','What do you prefer:\nComputer science or lawn mowing ?','Tzahi Bakal','315730176','2','Computer Science','Lawn Mowing','Neither','Both'),('011','01','01011','123456789 + 987654321 = ?','Tzahi Bakal','315730176','1','1111111110','347','135000000004','24'),('012','01','01012','What is the derivative of the function f(x) = x^2?','Tzahi Bakal','315730176','4','f\'(x) = sqrt(33)','0','f\'(x) = 11x','f\'(x) = 2x'),('013','01','01013','Is math good?	','Daniel Armaganian','209146943','4','YES!','NO!','Maybe?','Lawn Mowing is better'),('014','06','06014','What is the main objective of a control system?','Daniel Armaganian','209146943','3','To amplify the signal','To measure the input','To regulate the output','To store energy'),('015','06','06015','What is the transfer function of a control system?','Daniel Armaganian','209146943','2','The ratio of output to input','The mathematical model of the system','The time delay of the system','The control action applied to the system'),('016','06','06016','Which type of control system maintains a constant output in the presence of disturbances?','Daniel Armaganian','209146943','2','Open-loop control system',' Closed-loop control system','Feedback control system','Feedforward control system'),('017','06','06017','What is the unit of measurement for the stability of a control system?','Daniel Armaganian','209146943','4',' Decibel (dB)','Hertz (Hz)','Ohm (ÃÂ©)','No unit'),('018','06','06018','Which control system parameter determines the response speed of the system?','Daniel Armaganian','209146943','2','Gain','Time constant','Damping ratio','Bandwidth'),('019','05','05019','What is the primary function of the respiratory system?','Noa Kirel','333444555','4','Pumping blood throughout the body','Regulating body temperature','Producing hormones','Facilitating gas exchange'),('020','05','05020','What is the purpose of red blood cells in the human body?','Noa Kirel','333444555','1','Carrying oxygen to body tissues','Fighting off infections','Breaking down food particles','Regulating body temperature'),('021','05','05021','Which of the following is a long bone in the human body?','Noa Kirel','333444555','3','Skull','Rib','Femur','Vertebra'),('022','05','05022','Which organ is responsible for filtering waste products from the blood?','Noa Kirel','333444555','1','Kidney','Liver','Stomach','Pancreas'),('023','05','05023','What is the purpose of the lymphatic system in the human body?','Noa Kirel','333444555','4','Pumping blood throughout the body','Regulating body temperature','Carrying nutrients to body cells','Defending against infections and diseases'),('024','05','05024','Which of the following is a function of the skeletal system?','Noa Kirel','333444555','3','Producing hormones','Facilitating digestion','Providing support and protection for the body','Regulating blood pressure'),('025','01','01025','Which operation is used to find the inverse of a matrix?','Noa Kirel','333444555','4','Addition','Subtraction','Multiplication','Inversion'),('026','01','01026','What is the degree of the zero polynomial?','Noa Kirel','333444555','4','0','1','2','It has no degree (undefined)'),('027','01','01027','Which property states that the order of numbers can be changed when adding or multiplying?','Noa Kirel','333444555','2','Associative property','Commutative property','Distributive property','Identity property'),('028','01','01028','What is the value of 4x + 3y when \nx=2 and y=5?','Noa Kirel','333444555','3','20','23','28','32'),('029','01','01029','Which of the following is a quadratic equation?','Noa Kirel','333444555','2','2x +3 =7','x^2 +3x+2=0','3x-2=5x+1','4x-6=10x'),('030','05','05030','Which of the following is responsible for pumping \nblood throughout the body?','Roni Aloni','135791113','3','Lungs','Liver','Heart','Kidneys'),('031','05','05031','Which organ system is responsible for providing \nsupport, protection, and movement in the human body?','Roni Aloni','135791113','4','Nervous system','Endocrine system','Muscular system','Skeletal system'),('032','05','05032','Which of the following is a part of the central\nnervous system?','Roni Aloni','135791113','1','Spinal cord','Spleen','Adrenal gland','Gallbladder'),('033','05','05033','What is the function of the gallbladder in the\ndigestive system?','Roni Aloni','135791113','2','Producing bile','Storing and concentrating bile','Breaking down carbohydrates','Absorbing water and electrolytes'),('034','05','05034','Which organ is responsible for producing insulin \nin the endocrine system?','Roni Aloni','135791113','3','Thyroid gland','Adrenal gland','Pancreas','Pituitary gland'),('035','05','05035','What is the function of the red bone marrow \nin the skeletal system?\n','Roni Aloni','135791113','1','Producing red and white blood cells','Storing minerals such as calcium','Supporting and protecting organs','Facilitating muscle contraction'),('036','05','05036','Which of the following is responsible for producing \nurine in the human body?','Roni Aloni','135791113','3','Liver','Lungs','Kidneys','Stomach'),('037','05','05037','Which organ is responsible for detoxifying harmful \nsubstances in the human body?','Roni Aloni','135791113','3','Pancreas','Spleen','Liver','Gallbladder'),('038','05','05038','What is the function of the small intestine in the \ndigestive system?','Roni Aloni','135791113','1','Absorbing nutrients from food','Storing bile',' Producing enzymes for digestion','Filtering waste products'),('039','05','05039','What is the primary function of the pancreas in the \ndigestive system?\n','Roni Aloni','135791113','2','Producing bile','Regulating blood sugar levels','Breaking down proteins','Absorbing nutrients'),('040','05','05040','Which organ system is responsible for providing \nsupport, protection, and movement in\nthe human body?','Roni Aloni','135791113','4','Nervous system','Endocrine system','Muscular system','Skeletal system'),('041','05','05041','Which part of the brain is responsible for \nregulating balance and coordination?','Tzahi Bakal','315730176','2','Cerebrum','Cerebellum',' Medulla oblongata','Hypothalamus'),('042','05','05042','Which organ is responsible for producing and\nsecreting bile in the digestive system?','Tzahi Bakal','315730176','1','Liver','Pancreas','Stomach','Small intestine'),('043','05','05043','What is the function of the red blood cells\nin the circulatory system?','Tzahi Bakal','315730176','2','Fighting off infections','Carrying oxygen to body tissues','Breaking down food particles','Regulating body temperature'),('044','05','05044','What is the purpose of the mitral valve in the heart?','Tzahi Bakal','315730176','2','Regulating blood sugar levels','Preventing blood from flowing back into the left atrium','Pumping oxygenated blood to the body','Facilitating gas exchange'),('045','03','03045','Which of the following is an example of\na vector quantity?','Noa Kirel','333444555','4','Temperature','Speed','Time','Displacement'),('046','03','03046','What is the formula to calculate acceleration?','Noa Kirel','333444555','4',' v = u + at','s = ut + 0.5at^2','F = ma','a = (v - u) / t'),('047','03','03047','Which of the following is a scalar quantity?','Noa Kirel','333444555','2','Velocity','Distance','Force','Acceleration'),('048','03','03048','What is the formula for calculating average speed?','Noa Kirel','333444555','3',' Speed = Distance × Time','Speed = Time / Distance','Speed = Distance / Time','Speed = Time - Distance'),('049','03','03049','Which of Newton\'s laws of motion describes the \nconcept of inertia?','Noa Kirel','333444555','1','Newton\'s First Law','Newton\'s Second Law','Newton\'s Third Law','Newton\'s Law of Universal Gravitation'),('050','03','03050','What is the unit of force in the International \nSystem of Units (SI)?','Noa Kirel','333444555','1','Newton',' Kilogram','Meter','Watt'),('051','03','03051','What is the relationship between force, mass, \nand acceleration according to Newton\'s Second Law?','Noa Kirel','333444555','2','Force = Mass / Acceleration','Force = Mass × Acceleration','Force = Mass + Acceleration','Force = Mass - Acceleration'),('052','04','04052','Which of the following is a hydrocarbon compound?','Noa Kirel','333444555','4',' H2O','CH3COOH','C6H12O6','C3H8'),('053','04','04053','What is the functional group of an alcohol?','Noa Kirel','333444555','1','-OH','-COOH','-CO','-NH2'),('054','04','04054','What is the IUPAC name for CH3CH2CHO?','Noa Kirel','333444555','3','Ethanol','Acetic acid','Ethanal','Propanone'),('055','04','04055','Which of the following is a primary alcohol?','Noa Kirel','333444555','2','CH3OH','CH3CH2OH','CH3COOH','CH3COCH3'),('056','04','04056','Which compound is classified as an alkene?','Noa Kirel','333444555','3','Methanol','Ethane','Ethene','Propanol'),('057','04','04057','What is the process called when a large \nmolecule is broken down into smaller molecules \nby the addition of water?','Noa Kirel','333444555','3','Esterification',' Saponification','Hydrolysis','Polymerization'),('058','04','04058','What is the name of the functional group \nrepresented by -COOH?\n','Noa Kirel','333444555','1','Carboxyl group','Hydroxyl group','Carbonyl group','Amino group'),('059','04','04059','Which compound is an aldehyde?','Noa Kirel','333444555','3','Ethanol','Methanoic acid',' Propanal','Butanone'),('060','04','04060','What is the process called when a compound \ngains oxygen or loses hydrogen?','Noa Kirel','333444555','2','Reduction','Oxidation','Hydrogenation','Dehydration'),('061','04','04061','Which compound is an ester?','Noa Kirel','333444555','3','Ethanol','Ethanoic acid','Ethyl acetate','Ethene'),('062','01','01062','What is the derivative of a constant function?','Noa Kirel','333444555','2','1','0','-1','Undefined'),('063','01','01063','What is the integral of a constant function?','Noa Kirel','333444555','4','x','1','C','Cx'),('064','01','01064','What is the derivative of sin(x)?','Noa Kirel','333444555','1','cos(x)','-sin(x)','sec^2(x)','1/cos(x)'),('065','01','01065','What is the integral of x^2?','Noa Kirel','333444555','1','x^3/3','2x','3x^2','1/x^2'),('066','01','01066','What is the derivative of ln(x)?','Noa Kirel','333444555','1','1/x','x','e^x','-1/x^2'),('067','01','01067','What is the integral of e^x?','Noa Kirel','333444555','3','e^x','e^(x+1)','e^x + C','1/(e^x)'),('068','01','01068','What is the derivative of x^3 + 2x^2 - 5x + 1?','Noa Kirel','333444555','4','3x^2 + 4x - 5','3x^2 - 4x + 5','2x^3 + 4x^2 - 5x','3x^2 + 4x - 5'),('069','01','01069','What is the integral of 1/x?','Noa Kirel','333444555','1','ln(x)','x','1/x','e^x'),('070','01','01070','What is the derivative of cos(x)?','Noa Kirel','333444555','1','sin(x)','-cos(x)','sec^2(x)','1/sin(x)'),('071','01','01071','What is the integral of 2x?','Noa Kirel','333444555','2','x^2',' x^2 + C','2x^2','1/x'),('072','01','01072','What is the derivative of e^(2x)?','Tzahi Bakal','315730176','2','e^(2x)','2e^(2x)',' 2e^x',' 1/(2e^x)'),('073','01','01073','What is the integral of 3/(x^2 + 1)?','Tzahi Bakal','315730176','3','3tan^(-1)(x)','3ln(x)','3tan^(-1)(x) + C','3/(x^2 + 1)'),('074','01','01074','What is the derivative of ln(cos(x))?','Tzahi Bakal','315730176','1','-tan(x)','sec(x)','-1/(cos(x))','-1/(sin(x))'),('075','01','01075','What is the integral of x^(-1/2)?','Tzahi Bakal','315730176','3','x^(1/2)','2x^(3/2)','2x^(1/2) + C','1/(2x^(1/2))'),('076','01','01076','What is the derivative of 3x^2 + 4x + 1?','Tzahi Bakal','315730176','2','2x + 4','6x + 4','3x + 2','4x^2 + 1'),('077','01','01077','What is the integral of sin(2x)?','Tzahi Bakal','315730176','2','-cos(2x)','-sin(2x)/2','cos(2x)','sin(2x)/2'),('078','01','01078','What is the derivative of x^(3/2)?','Tzahi Bakal','315730176','2','3x^(1/2)',' (3/2)x^(1/2)','(1/2)x^(3/2)','(3/2)x^(5/2)'),('079','01','01079','What is the integral of e^(-2x)?','Tzahi Bakal','315730176','2','-e^(-2x)','e^(-2x)/(-2)',' -e^(2x)','e^(2x)/(-2)'),('080','01','01080','What is the derivative of ln(3x^2 + 2x)?','Tzahi Bakal','315730176','4','1/(3x^2 + 2x)','6x + 2','6x + 2/(3x^2 + 2x)','6x + 2/(3x^2 + 2x)'),('081','04','04081','Which compound is an ester?','Tzahi Bakal','315730176','3','Ethanol','Ethanoic acid','Ethyl acetate',' Ethene'),('082','04','04082','What is the IUPAC name for CH3CH2CH2OH?','Tzahi Bakal','315730176','1','Propanol','Butanol','Pentanol','Hexanol'),('083','04','04083','What is the molecular formula of benzene?','Tzahi Bakal','315730176','1','C6H6','C6H12','C6H10','C6H8'),('084','04','04084','Which of the following is a characteristic \nof an aromatic compound?','Tzahi Bakal','315730176','2','Contains a triple bond','Contains a benzene ring','Contains a functional group','Contains a halogen atom'),('085','04','04085','What is the process called when a compound \nreacts with oxygen to produce carbon \ndioxide and water, releasing energy?','Tzahi Bakal','315730176','1','Combustion','Sublimation','Saponification','Esterification'),('086','02','02086','What is software testing?','Tzahi Bakal','315730176','4','The process of writing code','The process of fixing bugs','The process of evaluating software quality','The process of documenting software features'),('087','02','02087','What is the purpose of unit testing?','Tzahi Bakal','315730176','3','To test the entire software system','To test the integration between multiple systems','To test individual components or modules of software','To test the software performance'),('088','02','02088','Which testing technique involves testing\nthe software with large volumes of data to evaluate \nperformance and stability?','Tzahi Bakal','315730176','3','Integration testing','Regression testing','Load testing','User acceptance testing'),('089','02','02089','What is the main goal of functional testing?','Tzahi Bakal','315730176','3','To test the user interface of the software','To test the performance of the software','To test the functionality of the software','To test the security of the software'),('090','02','02090','Which testing technique involves testing \nthe software with real end-users to gather \nfeedback and identify usability issues?','Tzahi Bakal','315730176','3','Integration testing','System testing','User acceptance testing','Performance testing'),('091','02','02091','What is the purpose of load testing?','Tzahi Bakal','315730176','4','Stress testing the software','Testing software performance','Simulating user loads','Assessing system behavior'),('092','02','02092','What is the main goal of regression testing?','Tzahi Bakal','315730176','4','Testing new features','Retesting failed cases','Validating software changes','Ensuring software stability'),('093','02','02093','What does a bug report document?','Tzahi Bakal','315730176','4','Steps to reproduce','Detailed issue description','Expected and actual results','All of the above'),('094','02','02094','What is the role of a test plan?','Tzahi Bakal','315730176','4','Outlining test objectives','Defining test scope','Describing test environment','All of the above*'),('095','03','03095','What is the acceleration due to gravity on Earth?','Alon Ahron','246810121','1','9.8 m/s^2*','6.7 m/s^2',' 3.5 m/s^2','5.2 m/s^2'),('096','03','03096','Which of the following is an example of \nprojectile motion?','Alon Ahron','246810121','3','A car accelerating on a straight road','A person climbing a staircase',' A ball thrown in the air and falling back to the ground','A pendulum swinging back and forth'),('097','03','03097','What is the formula for calculating \nmechanical advantage?','Alon Ahron','246810121','3','MA = Force × Distance','MA = Distance / Force','MA = Output Force / Input Force','MA = Output Force - Input Force'),('098','03','03098','What does the term \"hertz\" measure?','Alon Ahron','246810121','2','Electric current','Frequency','Voltage','Power'),('099','03','03099','Which type of electromagnetic wave has the \nhighest frequency?','Alon Ahron','246810121','3','Infrared','X-rays','Gamma rays','Radio waves'),('100','03','03100','What is the relationship between pressure \nand volume in Boyle\'s Law?','Alon Ahron','246810121','2',' P ∝ V','P ∝ 1/V','P ∝ V^2','P ∝ √V'),('101','03','03101','What is the law of universal gravitation?','Alon Ahron','246810121','1',' Every object in the universe is attracted to each other','Every object at rest stays at rest','Force equals mass times acceleration','Acceleration is directly proportional to force'),('102','03','03102','What is the formula for calculating force?','Alon Ahron','246810121','1','F = ma','F = mc^2','F = mg',' F = 1/2 mv^2'),('103','03','03103','What is the formula for calculating \ngravitational potential energy?','Alon Ahron','246810121','1','PE = mgh','PE = 1/2 mv^2','PE = Fd','PE = QV'),('104','03','03104','What is the principle of conservation of momentum?','Alon Ahron','246810121','3','Momentum increases with time','Momentum is inversely proportional to mass','The total momentum of a closed system remains constant','Momentum is directly proportional to velocity'),('105','03','03105','What is the SI unit for measuring force?','Alon Ahron','246810121','1',' Newton','Joule','Watt','Pascal'),('106','03','03106','What is the formula for calculating acceleration?','Alon Ahron','246810121','3','a = vf - vi','a = (vf - vi) / t','a = F/m','a = (vf + vi) / t'),('107','01','01107','What is the sum of two matrices with the \nsame dimensions?\n','Noa Kirel','333444555','2','Matrix multiplication','Element-wise addition','Scalar multiplication','Matrix exponentiation'),('108','01','01108','What is the product of a matrix and its inverse?','Noa Kirel','333444555','2','Zero matrix','Identity matrix','Diagonal matrix','Transpose matrix'),('109','01','01109','What is the determinant of a 2x2 matrix?','Noa Kirel','333444555','4','The sum of the diagonal elements','The product of the diagonal elements','The difference of the diagonal elements','The difference of the product of the diagonal elements'),('110','01','01110',' What is the rank of a matrix?','Noa Kirel','333444555','3','The number of rows','The number of columns','The number of non-zero rows after row reduction','The sum of the row and column indices'),('111','01','01111',' What is the transpose of a matrix?','Noa Kirel','333444555','3',' Flipping the matrix horizontally','Flipping the matrix vertically','Interchanging rows and columns','Reversing the order of the elements'),('112','01','01112','What is an orthogonal matrix?','Noa Kirel','333444555','3','A matrix with equal rows and columns','A square matrix with ones on the main diagonal','A matrix that preserves the dot product of vectors','A matrix with all zero elements'),('113','01','01113','What is the inverse of a non-square matrix?','Noa Kirel','333444555','4','It does not have an inverse','It is the identity matrix','It is the transpose matrix','It is not defined'),('114','01','01114','What is the main diagonal of a matrix?','Noa Kirel','333444555','3','The first row of the matrix','The first column of the matrix','The diagonal elements from the top-left to bottom-right','The diagonal elements from the bottom-left to top-right'),('115','06','06115','What is a test case?','Roni Aloni','135791113','4','Instructions for testing','Documentation of defects','Recorded test results','A specific input with expected output'),('116','06','06116','What is the purpose of a boundary test?','Roni Aloni','135791113','1','Validating input limits','Checking error messages','Assessing performance','Testing user interface'),('117','06','06117','What is the difference between black-box \nand white-box testing?','Roni Aloni','135791113','1','External vs internal focus','Manual vs automated approach','Unit vs system level','Positive vs negative scenarios'),('118','06','06118','What does usability testing evaluate?','Roni Aloni','135791113','1','User-friendliness','Software functionality','Performance under load','Compatibility with browsers'),('119','06','06119',' What is the objective of smoke testing?','Roni Aloni','135791113','1','Validating basic functionality',' Detecting memory leaks','Assessing security risks','Analyzing software design'),('120','06','06120','What is the purpose of exploratory testing?','Roni Aloni','135791113','1','Uncovering defects dynamically','Executing scripted scenarios','Assessing scalability issues','Testing code coverage'),('121','02','02121','Which function is used to read input\nfrom the user in C?','Roni Aloni','135791113','4','printf','read','gets','scanf'),('122','02','02122','What is the correct way to initialize a constant \nvariable in C?','Roni Aloni','135791113','1','const int value = 10;','int const value = 10;','int value = const 10;','int value; value = 10;'),('123','02','02123','Which loop allows executing a block of code multiple times in C?','Roni Aloni','135791113','1','for','if','while','switch'),('124','02','02124','How do you access the nth element of \nan array in C?','Roni Aloni','135791113','2','array(n)','array[n]','array.n','array.nth'),('125','02','02125','What is the purpose of the \"sizeof\" operator in C?','Roni Aloni','135791113','3',' Returns the size of a file','Returns the number of elements in an array','Returns the size of a data type in bytes','Returns the size of a string'),('126','02','02126','Which operator is used to access the address \nof a variable in C?','Roni Aloni','135791113','4','+','-','*','&'),('127','02','02127','How do you allocate memory dynamically in C?','Roni Aloni','135791113','1','malloc','new','allocate','memory'),('128','02','02128','What is the purpose of the \"break\" statement \nin a switch statement?','Roni Aloni','135791113','4','Ends the loop and exits the program','Skips the current iteration of a loop','Transfers control to the next case','Exits the switch statement and continues after it'),('129','02','02129','What is the correct syntax for a function \ndeclaration in C?','Roni Aloni','135791113','3','returnType functionName(parameters)','functionName returnType(parameters)',' returnType functionName(parameters)','functionName(parameters) returnType'),('130','02','02130','How do you include a header file in C?','Roni Aloni','135791113','2','#header \"filename\"','#include \"filename.h\"','#file \"filename.h\"','#import \"filename\"'),('131','02','02131','What is the purpose of the \"strcmp\" function in C?','Roni Aloni','135791113','2','Concatenates two strings','Compares two strings','Copies one string to another','Finds the length of a string'),('132','02','02132','What is the output of the following code snippet?\nint i = 5;\nprintf(\"%d\", ++i);','Roni Aloni','135791113','3','4','5','6','Undefined'),('133','06','06133','Which logic gate performs the logical \nAND operation?','Roni Aloni','135791113','1','AND','OR','NOT','XOR'),('134','06','06134','Which logic gate performs the logical OR operation?','Roni Aloni','135791113','2','AND','OR','NOT','XOR'),('135','06','06135','Which logic gate performs the logical \nNOT operation?','Roni Aloni','135791113','3','AND','OR','NOT',' XOR'),('136','06','06136','Which logic gate performs the logical XOR \n(exclusive OR) operation?','Roni Aloni','135791113','4','AND','OR','NOT','XOR'),('137','06','06137','Which logic gate performs the logical NAND \n(NOT AND) operation?','Roni Aloni','135791113','1','NAND','NOR','NOT','XOR'),('138','06','06138','Which logic gate performs the logical NOR \n(NOT OR) operation?','Roni Aloni','135791113','2','NAND','NOR','NOT','XOR'),('139','06','06139','Which logic gate performs the logical XNOR\n (exclusive NOR) operation?','Roni Aloni','135791113','4','NAND','NOR','NOT','XNOR'),('140','02','02140','What is the core principle of OOP?','Roni Aloni','135791113','4','Inheritance','Polymorphism','Encapsulation','All of the above'),('141','02','02141','What is an object in OOP?','Roni Aloni','135791113','1','An instance of a class','A variable','A method','A data structure'),('142','02','02142','What is the process of creating a new \nobject called?','Roni Aloni','135791113','1','Instantiation','Inheritance',' Polymorphism','Encapsulation'),('143','02','02143','Which OOP concept allows one class to \ninherit properties and methods \nfrom another class?','Roni Aloni','135791113','1','Inheritance','Polymorphism','Encapsulation','Abstraction'),('144','02','02144','What is the term used to describe the ability \nof an object to take on many forms?','Roni Aloni','135791113','2','Inheritance','Polymorphism','Encapsulation','Abstraction'),('145','02','02145','Which OOP concept hides the internal details \nof an object and provides an interface \nfor interaction?','Roni Aloni','135791113','3','Inheritance','Polymorphism','Encapsulation','Abstraction'),('146','02','02146','What is a class in OOP?','Roni Aloni','135791113','1','A blueprint for creating objects','An object','A method','A data structure'),('147','02','02147','Which OOP concept allows us to define common\n characteristics and behavior for a group\n of objects?','Roni Aloni','135791113','4','Inheritance','Polymorphism','Encapsulation','Abstraction'),('148','06','06148','What is the output of an AND gate if both \ninputs are 1?','Alon Ahron','246810121','2','0','1',' Undefined','Depends on other factors'),('149','06','06149','What is the output of an OR gate if both inputs are 0?','Alon Ahron','246810121','1','0','1','Undefined','Depends on other factors'),('150','06','06150','What is the output of a NOT gate if the input is 0?','Alon Ahron','246810121','2','0','1','Undefined',' Depends on other factors'),('151','06','06151','What is the output of an XOR gate if both \ninputs are 1?','Alon Ahron','246810121','2','0','1','Undefined','Depends on other factors'),('152','06','06152','What is the output of a NAND gate if one \nof the inputs is 0?','Alon Ahron','246810121','2','0','1','Undefined','Depends on other factors'),('153','06','06153','What is the output of a NOR gate if one \nof the inputs is 1?','Alon Ahron','246810121','1','0','1','Undefined','Depends on other factors');
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
INSERT INTO `question_course` VALUES ('01001','01'),('01003','01'),('01011','01'),('01013','01'),('01025','01'),('01026','01'),('01027','01'),('01028','01'),('01029','01'),('01003','02'),('01005','02'),('01011','02'),('01013','02'),('01107','02'),('01108','02'),('01109','02'),('01110','02'),('01111','02'),('01112','02'),('01113','02'),('01114','02'),('02006','04'),('02007','04'),('02010','04'),('02121','04'),('02122','04'),('02123','04'),('02124','04'),('02125','04'),('02126','04'),('02127','04'),('02128','04'),('02129','04'),('02130','04'),('02131','04'),('02132','04'),('02004','05'),('02010','05'),('02140','05'),('02141','05'),('02142','05'),('02143','05'),('02144','05'),('02145','05'),('02146','05'),('02147','05'),('03045','06'),('03046','06'),('03047','06'),('03048','06'),('03049','06'),('03050','06'),('03051','06'),('03095','06'),('03096','06'),('03097','06'),('03098','06'),('03099','06'),('03100','06'),('03101','06'),('03102','06'),('03103','06'),('03104','06'),('03105','06'),('03106','06'),('04008','07'),('04009','07'),('04052','07'),('04053','07'),('04054','07'),('04055','07'),('04056','07'),('04057','07'),('04058','07'),('04059','07'),('04060','07'),('04061','07'),('04081','07'),('04082','07'),('04083','07'),('04084','07'),('04085','07'),('01012','08'),('01013','08'),('01062','08'),('01063','08'),('01064','08'),('01065','08'),('01066','08'),('01067','08'),('01068','08'),('01069','08'),('01070','08'),('01071','08'),('01072','08'),('01073','08'),('01074','08'),('01075','08'),('01076','08'),('01077','08'),('01078','08'),('01079','08'),('01080','08'),('02086','09'),('02087','09'),('02088','09'),('02089','09'),('02090','09'),('02091','09'),('02092','09'),('02093','09'),('02094','09'),('06133','10'),('06134','10'),('06135','10'),('06136','10'),('06137','10'),('06138','10'),('06139','10'),('06148','10'),('06149','10'),('06150','10'),('06151','10'),('06152','10'),('06153','10'),('06014','13'),('06015','13'),('06016','13'),('06017','13'),('06018','13'),('06115','13'),('06116','13'),('06117','13'),('06118','13'),('06119','13'),('06120','13'),('05019','14'),('05020','14'),('05021','14'),('05022','14'),('05023','14'),('05024','14'),('05030','14'),('05031','14'),('05032','14'),('05033','14'),('05034','14'),('05035','14'),('05036','14'),('05037','14'),('05038','14'),('05039','14'),('05040','14'),('05041','14'),('05042','14'),('05043','14'),('05044','14');
/*!40000 ALTER TABLE `question_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simulation_external_users`
--

DROP TABLE IF EXISTS `simulation_external_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `simulation_external_users` (
  `user_id` varchar(45) NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  `isLogged` int DEFAULT NULL,
  PRIMARY KEY (`user_id`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simulation_external_users`
--

LOCK TABLES `simulation_external_users` WRITE;
/*!40000 ALTER TABLE `simulation_external_users` DISABLE KEYS */;
INSERT INTO `simulation_external_users` VALUES ('023456781','Yehuda','Levi','yehuda@gmail.com','yehuda','123456','student',0),('068798452','Yana','Nana','yana@gmail.com','yana','123456','student',0),('078543399','Yarden','Vizel','yarden@gmail.com','yarden','123456','student',0),('087452683','Bar','Zomer','bar@gmail.com','bar','123456','student',0),('111177777','Elon','Musk','elonmusk@gmail.com','elon','123456','student',0),('123456789','Almog','Kadosh','almog@gmai.com','almog','123456','student',0),('123654789','Cheli','Kotler','cheli.kotler@gmail.com','cheli','123456','student',0),('135791113','Roni','Aloni','roni@gmail.com','roni','123456','professor',0),('147852369','Barak','Obama','obarak@gmail.com','barak','123456','student',0),('159753684','Dana','Cohen','dana@gmail.com','dana','123456','student',0),('209146943','Daniel','Armaganian','daniarmag@gmail.com','daniel','123456','professor',0),('222233334','Aviv','Peretz','aviv@gmail.com','aviv','123456','student',0),('224466880','Shira','Oren','shira@gmail.com','shira','123456','head',0),('245890666','Omer','Adam','omer@gmail.com','omer','123456','student',0),('246810121','Alon','Ahron','alon@gmail.com','alon','123456','professor',0),('252525252','Randa','Rousi','r@gmail.com','randa','123456','student',0),('315730176','Tzahi','Bakal','tzahi.bakal@gmail.com','tzahi','123456','professor',0),('319003935','Matan','Czuckermann','cz.matan@gmail.com','matan','123456','head',0),('320126999','Idan','Raichel','idan@gmail.com','idan','123456','student',0),('321455555','Yossi','Adi','yossi@gmail.com','yossi','123456','head',0),('323232323','Ron','Gabay','ron@gmail.com','ron','123456','student',0),('326789112','Bill','Gates','bill@gmail.com','bill','123456','student',0),('333377777','Nicole','Bakal','nicolebakal@gmail.com','nicole','123456','student',0),('333444555','Noa','Kirel','noa@gmail.com','noa','123456','professor',0),('342255667','Gili','Bili','gili@gmail.com','gili','123456','student',0),('345678912','Maya','Zamir','maya@gmail.com','maya','123456','student',0),('398765432','Ben','Ashor','ben@gmail.com','ben','123456','head',0),('432456432','Anna','Zak','anna@gmal.com','anna','123456','student',0),('500000000','Guy','Edri','guy@gmail.com','guy','123456','student',0),('654322889','Yael','Shalbia','yael@gmail.com','yael','123456','student',0);
/*!40000 ALTER TABLE `simulation_external_users` ENABLE KEYS */;
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
  `correct_answers` varchar(250) DEFAULT NULL,
  `wrong_answer` varchar(250) DEFAULT NULL,
  `comment` varchar(250) DEFAULT NULL,
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
INSERT INTO `student_exam` VALUES ('010101','068798452',0,'','01001#3','','1',NULL),('010101','111177777',100,'01001','','','1',NULL),('010101','123654789',100,'01001','','','1',NULL),('010205','123654789',100,'01003,01005,01011','',NULL,'0',NULL),('010205','323232323',0,'','01003#3,01005#1,01011#3',NULL,'0',NULL),('010205','326789112',33,'01003','01005#3,01011#4',NULL,'0',NULL),('010807','123654789',100,'01012','','','1',NULL),('010807','252525252',100,'01012','','','1',NULL),('010807','333377777',100,'01012','','','1',NULL),('010812','123456789',40,'01012,01013,01064,01069','01062#4,01063#1,01065#2,01066#3,01067#4,01068#1','','1',NULL),('010812','123654789',100,'01012,01013,01062,01063,01064,01065,01066,01067,01068,01069','','','1',NULL),('010812','147852369',30,'01013,01067,01069','01012#1,01062#3,01063#2,01064#2,01065#2,01066#2,01068#3','','1',NULL),('010812','245890666',0,'','01012#1,01013#3,01062#,01063#,01064#,01065#,01066#,01067#,01068#,01069#','','1',NULL),('010812','252525252',0,'','01012#,01013#,01062#,01063#,01064#,01065#,01066#,01067#,01068#,01069#','','1',NULL),('010812','342255667',40,'01013,01063,01065,01068','01012#1,01062#4,01064#2,01066#3,01067#4,01069#2',NULL,'0',NULL),('010812','432456432',30,'01064,01065,01066','01012#1,01013#1,01062#1,01063#1,01067#1,01068#1,01069#1','','1',NULL),('010812','500000000',20,'01067,01069','01012#3,01013#3,01062#3,01063#3,01064#3,01065#3,01066#3,01068#3','','1',NULL),('010812','654322889',10,'01062','01012#2,01013#2,01063#2,01064#2,01065#2,01066#2,01067#2,01068#2,01069#2',NULL,'0',NULL),('020403','023456781',50,'02007','02006#4',NULL,'0',NULL),('020403','123456789',100,'02006,02007','',NULL,'0',NULL),('020403','123654789',100,'02006,02007','',NULL,'0',NULL),('020403','222233334',0,'','02006#3,02007#1',NULL,'0',NULL),('020403','345678912',50,'02006','02007#2',NULL,'0',NULL),('020502','068798452',100,'02004','','','1',NULL),('020502','123456789',0,'','02004#','too bad','1',NULL),('020915','333377777',40,'02087,02091,02092','02086#1,02088#1,02089#2,02090#1','','1',NULL),('020915','500000000',45,'02086,02088,02090','02087#2,02089#4,02091#3,02092#1','','1',NULL),('030624','023456781',45,'03051,03095,03099,03101','03050#3,03096#4,03097#1,03098#4,03100#1',NULL,'0',NULL),('030624','068798452',75,'03050,03051,03095,03096,03099,03100,03101','03097#2,03098#1',NULL,'0',NULL),('030624','078543399',65,'03051,03095,03096,03099,03100,03101','03050#2,03097#4,03098#3',NULL,'0',NULL),('030624','087452683',30,'03050,03095,03096','03051#1,03097#2,03098#1,03099#4,03100#3,03101#2',NULL,'0',NULL),('040713','123456789',0,'','04008#1,04057#4,04059#4,04060#3,04061#1,04081#2,04082#3,04083#4,04084#1,04085#3','','1',NULL),('040713','252525252',40,'04057,04060,04061,04082','04008#1,04059#4,04081#4,04083#3,04084#3,04085#3','','1',NULL),('040714','123654789',100,'04008,04052,04053,04054,04058,04059,04060,04081,04082,04084','','','1',NULL),('040714','320126999',10,'04053','04008#3,04052#3,04054#4,04058#2,04059#1,04060#3,04081#2,04082#4,04084#3','','1',NULL),('040714','323232323',30,'04008,04053,04054','04052#2,04058#4,04059#4,04060#3,04081#1,04082#3,04084#1','','1',NULL),('040714','326789112',0,'','04008#1,04052#3,04053#4,04054#2,04058#2,04059#1,04060#3,04081#2,04082#2,04084#1','','1',NULL),('040714','333377777',50,'04008,04053,04054,04059,04082','04052#2,04058#2,04060#3,04081#4,04084#1',NULL,'0',NULL),('040731','342255667',37,'04008','04009#3',NULL,'0',NULL),('061309','159753684',0,NULL,'06014#1,06015#1,06016#1,06017#1,06018#1',NULL,'0',NULL),('061309','252525252',0,'','06014#1,06015#1,06016#1,06017#1,06018#1',NULL,'0',NULL),('061309','500000000',0,'','06014#1,06015#1,06016#1,06017#1,06018#1',NULL,'0',NULL);
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
INSERT INTO `subject` VALUES ('01','Mathematics','319003935'),('02','Computer Science','319003935'),('03','Physics','398765432'),('04','Chemistry','319003935'),('05','Biology','319003935'),('06','Electricity','319003935');
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
INSERT INTO `users` VALUES ('023456781','Yehuda','Levi','yehuda@gmail.com','yehuda','123456','student',0),('068798452','Yana','Nana','yana@gmail.com','yana','123456','student',0),('078543399','Yarden','Vizel','yarden@gmail.com','yarden','123456','student',0),('087452683','Bar','Zomer','bar@gmail.com','bar','123456','student',0),('111177777','Elon','Musk','elonmusk@gmail.com','elon','123456','student',0),('123456789','Almog','Kadosh','almog@gmai.com','almog','123456','student',0),('123654789','Cheli','Kotler','cheli.kotler@gmail.com','cheli','123456','student',0),('135791113','Roni','Aloni','roni@gmail.com','roni','123456','professor',0),('147852369','Barak','Obama','obarak@gmail.com','barak','123456','student',0),('159753684','Dana','Cohen','dana@gmail.com','dana','123456','student',0),('209146943','Daniel','Armaganian','daniarmag@gmail.com','daniel','123456','professor',0),('222233334','Aviv','Peretz','aviv@gmail.com','aviv','123456','student',0),('224466880','Shira','Oren','shira@gmail.com','shira','123456','head',0),('245890666','Omer','Adam','omer@gmail.com','omer','123456','student',0),('246810121','Alon','Ahron','alon@gmail.com','alon','123456','professor',0),('252525252','Randa','Rousi','r@gmail.com','randa','123456','student',0),('315730176','Tzahi','Bakal','tzahi.bakal@gmail.com','tzahi','123456','professor',0),('319003935','Matan','Czuckermann','cz.matan@gmail.com','matan','123456','head',0),('320126999','Idan','Raichel','idan@gmail.com','idan','123456','student',0),('321455555','Yossi','Adi','yossi@gmail.com','yossi','123456','head',0),('323232323','Ron','Gabay','ron@gmail.com','ron','123456','student',0),('326789112','Bill','Gates','bill@gmail.com','bill','123456','student',0),('333377777','Nicole','Bakal','nicolebakal@gmail.com','nicole','123456','student',0),('333444555','Noa','Kirel','noa@gmail.com','noa','123456','professor',0),('342255667','Gili','Bili','gili@gmail.com','gili','123456','student',0),('345678912','Maya','Zamir','maya@gmail.com','maya','123456','student',0),('398765432','Ben','Ashor','ben@gmail.com','ben','123456','head',0),('432456432','Anna','Zak','anna@gmal.com','anna','123456','student',0),('500000000','Guy','Edri','guy@gmail.com','guy','123456','student',0),('654322889','Yael','Shalbia','yael@gmail.com','yael','123456','student',0);
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

-- Dump completed on 2023-06-19 18:12:09
