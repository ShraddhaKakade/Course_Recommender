-- MySQL dump 10.13  Distrib 8.0.40, for macos14 (arm64)
--
-- Host: 127.0.0.1    Database: course_recommender
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `Course`
--

DROP TABLE IF EXISTS `Course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Course` (
  `course_id` int NOT NULL,
  `course_name` varchar(100) DEFAULT NULL,
  `course_description` text,
  `course_credits` int DEFAULT NULL,
  `seats_available` int DEFAULT NULL,
  `semester_offered` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Course`
--

LOCK TABLES `Course` WRITE;
/*!40000 ALTER TABLE `Course` DISABLE KEYS */;
INSERT INTO `Course` VALUES (101,'Intro to Programming','Learn the basics of programming using Python.',3,30,'Fall'),(102,'Data Structures','Understand data structures like lists, stacks, and trees.',4,29,'Spring'),(103,'Algorithms','Explore algorithm design and analysis techniques.',3,28,'Fall'),(104,'Database Systems','Introduction to relational databases and SQL.',4,27,'Spring'),(105,'Operating Systems','Concepts of process management and memory in operating systems.',3,26,'Fall'),(106,'Computer Networks','Study protocols and models in computer networking.',4,30,'Spring'),(107,'Software Engineering','Software development lifecycle and best practices.',3,29,'Fall'),(108,'AI Fundamentals','Fundamentals of artificial intelligence and intelligent agents.',4,28,'Spring'),(109,'Machine Learning','Supervised and unsupervised machine learning techniques.',3,27,'Fall'),(110,'Deep Learning','Deep neural networks and model tuning strategies.',4,26,'Spring'),(111,'Natural Language Processing','Understanding NLP techniques like tokenization and sentiment analysis.',3,30,'Fall'),(112,'Computer Vision','Explore image recognition and feature extraction in computer vision.',4,29,'Spring'),(113,'Web Development','Front-end and back-end web development using modern tools.',3,28,'Fall'),(114,'Mobile App Development','Build native and hybrid apps for Android and iOS platforms.',4,27,'Spring'),(115,'Cybersecurity','Security principles and encryption techniques.',3,26,'Fall'),(116,'Cloud Computing','Learn how to deploy applications on cloud platforms.',4,30,'Spring'),(117,'Big Data Analytics','Analyze large-scale datasets using Hadoop and Spark.',3,29,'Fall'),(118,'Data Visualization','Create meaningful visual stories from complex data.',4,28,'Spring'),(119,'Distributed Systems','Principles of distributed computing and fault tolerance.',3,27,'Fall'),(120,'IoT Systems','Design and implementation of Internet of Things systems.',4,26,'Spring'),(121,'Game Development','Introduction to game design, mechanics, and engines.',3,30,'Fall'),(122,'AR/VR Technologies','Develop immersive experiences using AR and VR.',4,29,'Spring'),(123,'Human-Computer Interaction','Design systems with focus on usability and user experience.',3,28,'Fall'),(124,'Robotics','Programming and control of autonomous robots.',4,27,'Spring'),(125,'Embedded Systems','Build applications for low-level embedded systems.',3,26,'Fall'),(126,'Compiler Design','Translate programming languages using compiler techniques.',4,30,'Spring'),(127,'Information Retrieval','Methods for indexing and searching text-based data.',3,29,'Fall'),(128,'Digital Image Processing','Techniques for enhancing and analyzing digital images.',4,28,'Spring'),(129,'Blockchain Basics','Blockchain architecture and smart contracts.',3,27,'Fall'),(130,'Quantum Computing','Foundations of quantum information processing.',4,26,'Spring'),(131,'Functional Programming','Paradigms in functional programming languages like Haskell.',3,30,'Fall'),(132,'Parallel Programming','Leverage multi-threading and concurrency in programs.',4,29,'Spring'),(133,'Microservices Architecture','Design scalable microservices using Docker and Kubernetes.',3,28,'Fall'),(134,'DevOps Practices','CI/CD pipelines and infrastructure as code.',4,27,'Spring'),(135,'Agile Methodologies','Principles of agile project delivery and Scrum.',3,26,'Fall'),(136,'Project Management','Learn tools and techniques to manage IT projects.',4,30,'Spring'),(137,'IT Ethics','Discuss ethical issues in information technology.',3,29,'Fall'),(138,'E-Commerce Systems','Architecture of online commerce platforms.',4,28,'Spring'),(139,'Digital Marketing','Techniques in digital branding and online ads.',3,27,'Fall'),(140,'Bioinformatics','Application of data science in bioinformatics.',4,26,'Spring'),(141,'Health Informatics','Use data-driven approaches in healthcare analytics.',3,30,'Fall'),(142,'Data Mining','Extract insights from structured and unstructured data.',4,29,'Spring'),(143,'Advanced SQL','Master advanced SQL techniques and query optimization.',3,28,'Fall'),(144,'NoSQL Databases','Explore non-relational databases like MongoDB and Cassandra.',4,27,'Spring'),(145,'Information Security','Safeguard systems against cyber threats.',3,26,'Fall'),(146,'Risk Assessment','Frameworks for identifying and mitigating IT risks.',4,30,'Spring'),(147,'Cloud Architecture','Design scalable solutions in cloud environments.',3,29,'Fall'),(148,'Edge Computing','Data processing at the network edge.',4,28,'Spring'),(149,'Big Data Tools','Tools like Hive, Pig, and Flume in big data pipelines.',3,27,'Fall'),(150,'Data Science Capstone','Final capstone project applying data science skills.',4,26,'Spring');
/*!40000 ALTER TABLE `Course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EnrollmentHistory`
--

DROP TABLE IF EXISTS `EnrollmentHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EnrollmentHistory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int DEFAULT NULL,
  `course_id` int DEFAULT NULL,
  `semester` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `enrollmenthistory_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `Student` (`student_id`),
  CONSTRAINT `enrollmenthistory_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `Course` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EnrollmentHistory`
--

LOCK TABLES `EnrollmentHistory` WRITE;
/*!40000 ALTER TABLE `EnrollmentHistory` DISABLE KEYS */;
INSERT INTO `EnrollmentHistory` VALUES (1,1,101,'Fall'),(2,1,106,'Fall'),(3,2,102,'Spring'),(4,3,103,'Fall'),(5,4,104,'Spring'),(6,5,105,'Fall'),(7,6,107,'Spring'),(8,7,109,'Fall'),(9,8,106,'Fall'),(10,9,109,'Fall'),(11,10,110,'Spring'),(12,11,107,'Spring'),(13,12,102,'Spring'),(14,13,105,'Fall'),(15,14,108,'Spring'),(16,15,105,'Fall'),(17,16,108,'Spring'),(18,17,104,'Spring'),(19,18,110,'Spring'),(20,19,103,'Fall');
/*!40000 ALTER TABLE `EnrollmentHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student`
--

DROP TABLE IF EXISTS `Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Student` (
  `student_id` int NOT NULL,
  `student_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `career_goal` varchar(100) DEFAULT NULL,
  `preferred_subjects` text,
  `available_time_slots` varchar(50) DEFAULT NULL,
  `credit_limit` int DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
INSERT INTO `Student` VALUES (1,'Alice Smith','alice@example.com','Data Scientist','ML, Python','Evenings',9),(2,'Bob Jones','bob@example.com','Software Engineer','Java, Web Dev','Mornings',12),(3,'Clara Doe','clara@example.com','Cybersecurity Analyst','Networks, Linux','Afternoons',9),(4,'David King','david@example.com','Game Developer','AR/VR, Graphics','Evenings',12),(5,'Eva Green','eva@example.com','Business Analyst','SQL, BI Tools','Mornings',9),(6,'Frank White','frank@example.com','ML Engineer','AI, Deep Learning','Mornings',12),(7,'Grace Lee','grace@example.com','Web Developer','HTML, CSS, JS','Afternoons',6),(8,'Henry Ford','henry@example.com','Cloud Engineer','Cloud, GCP','Evenings',9),(9,'Ivy Stone','ivy@example.com','UX Designer','Design, Prototyping','Mornings',6),(10,'Jack Ma','jack@example.com','Big Data Analyst','Spark, Hadoop','Evenings',12),(11,'Kate Bell','kate@example.com','ML Researcher','AI, Python','Afternoons',9),(12,'Leo Grant','leo@example.com','Frontend Dev','React, JS','Mornings',6),(13,'Mona Ray','mona@example.com','Database Admin','SQL, Oracle','Afternoons',12),(14,'Nate Hale','nate@example.com','DevOps Engineer','CI/CD, Docker','Evenings',12),(15,'Olive Kent','olive@example.com','BI Developer','Power BI, SQL','Mornings',9),(16,'Paul Nash','paul@example.com','Backend Dev','Node.js, APIs','Evenings',9),(17,'Quincy Fox','quincy@example.com','VR Engineer','AR/VR, Unity','Afternoons',12),(18,'Rita Sky','rita@example.com','Mobile Dev','Flutter, Kotlin','Mornings',6),(19,'Steve Lin','steve@example.com','Ethical Hacker','Security, Linux','Evenings',9),(20,'Tina Fey','tina@example.com','Full Stack Dev','MERN, Cloud','Afternoons',12),(21,'Uma Raj','uma@example.com','Data Engineer','ETL, Python','Mornings',9),(22,'Victor Chen','victor@example.com','ML Ops','ML, DevOps','Afternoons',9),(23,'Wendy Zhou','wendy@example.com','Researcher','AI Ethics, NLP','Evenings',12),(24,'Xander Dean','xander@example.com','Web Designer','CSS, Figma','Mornings',6),(25,'Yara Lee','yara@example.com','Cloud Architect','AWS, Azure','Afternoons',9),(26,'Zane Will','zane@example.com','App Dev','React Native','Mornings',6),(27,'Ava Stone','ava@example.com','Cyber Analyst','Security, Networks','Evenings',12),(28,'Ben Watts','ben@example.com','System Admin','Linux, Shell','Afternoons',9),(29,'Cindy Marks','cindy@example.com','Database Engineer','PL/SQL, MySQL','Mornings',12),(30,'Dan Woods','dan@example.com','AR Developer','Unity, ARKit','Evenings',9),(31,'Ella Fox','ella@example.com','BI Consultant','Tableau, SQL','Afternoons',9),(32,'Fred Lane','fred@example.com','Product Manager','Scrum, Data','Mornings',9),(33,'Gina Frost','gina@example.com','Data Architect','Snowflake, Python','Evenings',12),(34,'Hank Wells','hank@example.com','DevSecOps','Security, DevOps','Afternoons',12),(35,'Iris Dee','iris@example.com','NLP Scientist','BERT, Transformers','Mornings',9),(36,'Jon Snow','jon@example.com','Game Designer','Unity, UE5','Evenings',12),(37,'Kelly Brook','kelly@example.com','Android Dev','Java, Android','Afternoons',6),(38,'Liam Pace','liam@example.com','ML Analyst','Scikit, NumPy','Mornings',9),(39,'Maya Kim','maya@example.com','AI Engineer','Deep Learning','Afternoons',9),(40,'Nina Gold','nina@example.com','IT Consultant','Agile, BI','Evenings',9),(41,'Owen Hill','owen@example.com','Web Admin','HTML, CMS','Mornings',6),(42,'Pia Nash','pia@example.com','Computer Vision Engg','OpenCV, Python','Afternoons',12),(43,'Ron Gray','ron@example.com','ML Consultant','Regression, DL','Mornings',9),(44,'Sara Pink','sara@example.com','Systems Analyst','SQL, Logic','Evenings',9),(45,'Tom Bright','tom@example.com','AR Specialist','ARKit, Unity','Afternoons',12),(46,'Una Lake','una@example.com','Web App Dev','Django, HTML','Mornings',9),(47,'Vera Hall','vera@example.com','BI Architect','Power BI, ETL','Evenings',9),(48,'Will Knight','will@example.com','Security Analyst','Firewalls, Python','Afternoons',12),(49,'Xenia Ash','xenia@example.com','AI Researcher','LLMs, Python','Mornings',12),(50,'Yusuf Elm','yusuf@example.com','Tech Lead','Agile, Arch','Afternoons',12);
/*!40000 ALTER TABLE `Student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-06 14:50:30
