-- MySQL dump 10.13  Distrib 5.5.58, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: votreimmopro
-- ------------------------------------------------------
-- Server version	5.5.58-0+deb8u1

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(30) NOT NULL,
  `mdp` varchar(30) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'immo','immo33335','administrateur'),(2,'admin','admin335335','ico');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorie` (
  `id` int(10) unsigned NOT NULL,
  `categorie` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorie`
--

LOCK TABLES `categorie` WRITE;
/*!40000 ALTER TABLE `categorie` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catproduct`
--

DROP TABLE IF EXISTS `catproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catproduct` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(250) NOT NULL,
  `description` text,
  `parent` int(11) NOT NULL DEFAULT '0',
  `image` varchar(250) DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT '0',
  `ordre` smallint(6) NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catproduct`
--

LOCK TABLES `catproduct` WRITE;
/*!40000 ALTER TABLE `catproduct` DISABLE KEYS */;
INSERT INTO `catproduct` VALUES (1,'Les Huiles Essentielles, Végétales et Eaux Florales ','Notre large gamme est issue de plantes cultivées et récoltées en Drôme et en Ardèche.\r\n(60% de plantes françaises et 50% cultivées dans la Drôme et l\'Ardèche.)\r\nNos huiles essentielles et eaux florales sont 100% pures et bio et sont distillée en France.\r\nLes huiles essentielles sont à utiliser en général en mélange avec une huile végétale. Elles sont interdites aux enfants de moins de 3 ans et au femmes enceintes.',0,'/huiles-1.jpg',0,1),(4,'Les plantes médicinales','Un véritable comptoir d\'herboristerie, au mille fleurs et couleurs.\r\nNos tisanes sont toutes labellisées « Nature et Progrès »\r\n\r\nVous trouverez les plantes en racines, fleurs, feuilles, graines ou écorce et vous pourrez les déguster en mélanges ou seules après le repas ou au petit déjeuner.\r\nElles sont le fruit de Dame Nature et nous apportent soins, bien-être et réconfort.',0,'/tisane_bloc_accueil_menu_produi-4.jpg',0,2),(13,'Les Pains','Nos pains sont faits au levain, ils sont complets ou demi-complet, avec des graines de tournesol, de lins, de courge, etc.. Vous trouverez aussi nos spécialités : pain au kamut, petit épeautre, seigle, brioches au beurre, aux fruits secs, etc..\r\nEgalement <b>le pain Montignac</b>, conçu avec de la farine intégrale, et dont l\'index glycémique est très bas.\r\nIl est disponible en 1kg, miche ou moulé, tranché ou non, <b>sur commande.</b>\r\nVous dégusterez notre gamme de biscuits en vrac : citron, amandes, noisettes, nougatine, épeautre, etc..',0,'/pain1-13.jpg',0,6),(35,'Les Elixirs Floraux','Toute la gamme est présente dans le magasin.\r\nNos fleurs sont recueillis dans les Pyrénées Orientales, sur les flancs du Mont Canigou où se trouve un site très riche d\'une nature encore sauvage.\r\nLes Elixirs rétablissent un équilibre psychologique en profitant au maximum de l\'énergie des fleurs.\r\nC\'est un soutien non négligeable dans les cas de déséquilibres externes ou internes.',0,'/elixir1-35.jpg',0,3),(36,'Les produits à base de Propolis','Toutes les formes de Propolis sont présentent dans le magasin : extrait, sirop, spray .....\r\nLa Propolis provient d\'une substance résineuse collectée par les abeilles sur les bourgeons de certains arbres. Les abeilles mélanges ensuite cette substance à leurs propres sécrétions salivaires, à la cire et aux pollens pour donner naissance à la Propolis. \r\nLa Propolis protège des germes, des bactéries et autres envahisseurs. Elle protège ainsi les voies ORL.',0,'/propolis_menu_produit_2_-36.png',0,4),(37,'Les Compléments Alimentaires','Préservez-vous de l\'hiver avec l\'extrait de pépins de pamplemousse (antibiotique naturel) ou avec la vitamine C naturelle (cynorrhodon) barrière contre les virus et bactéries. \r\nVous découvrirez les vertus de l\'aloe vera (dépurative, anti-inflammatoire et cicatrisante) et de l\'aloe arborescens.\r\nFaites appel au Quinton pour relancer votre organisme en cas d\'épuisement.\r\nNettoyer votre foie avec le Desmodium, votre organisme avec la sève de bouleau.\r\nAssouplissez vos articulations avec le silicium organique.',0,'/complementsalimentaires-37.jpg',0,5),(38,'Epicerie','De nombreux produits à disposition : pâtes, riz, farine, huiles, chocolats, jus fruits, vins, bières, produits sans gluten, etc...',0,'/epicerie1-38.jpg',0,7),(39,'Cosmétique','Alors qu\' Ecocert n\'oblige qu\'à 10% d\'ingrédients biologiques dans les cosmétiques, nous avons choisi des gammes <br />qui contiennent entre 35 et 87% d\'ingrédients biologiques, dans un souci d\'efficacité et de respect de la peau.',0,'/cosmetic1-39.jpg',0,8),(40,'Fruits et Légumes','Les fruits et légumes sont frais et de saison.',0,'/fruit-40.jpg',0,9);
/*!40000 ALTER TABLE `catproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `message` text,
  `newsletter` tinyint(4) NOT NULL DEFAULT '0',
  `fromgoldbook` tinyint(4) NOT NULL DEFAULT '0',
  `fromcontact` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (10,'','','xavier@braillard.fr',NULL,'',1,0,0),(11,'','','xavier@braillard.com',NULL,'',1,0,0),(12,'','','cscrain1@aol.com',NULL,'',1,0,0),(13,'','','kaeru9201@yahoo.co.jp',NULL,'',1,0,0),(14,'','','garysloan884@hotmail.co.uk',NULL,'',1,0,0),(15,'','','tamud@web.de',NULL,'',1,0,0),(16,'','','mtmusso1@icloud.com',NULL,'',1,0,0),(17,'','','pradyumna.gurusamy@gmail.com',NULL,'',1,0,0),(18,'','','jinlin.wang@auryc.com',NULL,'',1,0,0),(19,'','','lucrancourt558@live.fr',NULL,'',1,0,0),(20,'','','vlugo993@gmail.com',NULL,'',1,0,0),(21,'','','kelkock@aol.com',NULL,'',1,0,0),(22,'','','jgaddis@gaddispearsonconstruction.com',NULL,'',1,0,0),(23,'','','dorothea.schaefer@arcor.de',NULL,'',1,0,0),(24,'','','liz.rollet@moodys.com',NULL,'',1,0,0),(25,'','','debrakimmel@gmail.com',NULL,'',1,0,0),(26,'','','belladonnasragdoll@yahoo.com',NULL,'',1,0,0),(27,'','','jwallentine25@gmail.com',NULL,'',1,0,0),(28,'','','mshelford54@gmail.com',NULL,'',1,0,0),(29,'','','mikhail.sooknanan@gmail.com',NULL,'',1,0,0),(30,'','','rtyre@earthlink.net',NULL,'',1,0,0),(31,'','','inarwhalzzz@icloud.com',NULL,'',1,0,0),(32,'','','awesomejaden13@gmail.com',NULL,'',1,0,0),(33,'','','spauldinglo@yahoo.com',NULL,'',1,0,0),(34,'','','brigitte.bunevod@icloud.com',NULL,'',1,0,0),(35,'','','brendon_li@yahoo.com',NULL,'',1,0,0),(36,'','','charlesmarc@att.net',NULL,'',1,0,0),(37,'','','accounting@crystalspringscatering.com',NULL,'',1,0,0),(38,'','','valerienewton@sbcglobal.net',NULL,'',1,0,0),(39,'','','robertwillis@msn.com',NULL,'',1,0,0),(40,'','','janeathome4@gmail.com',NULL,'',1,0,0),(41,'','','mwlindstedt@optonline.net',NULL,'',1,0,0),(42,'','','mackadoodle25@aol.com',NULL,'',1,0,0),(43,'','','chris.dritsas@sbcglobal.net',NULL,'',1,0,0),(44,'','','thomaskugel@t-online.de',NULL,'',1,0,0),(45,'','','mrathe@pacbell.net',NULL,'',1,0,0),(46,'','','megsgarcia14@icloud.com',NULL,'',1,0,0),(47,'','','jennmagliola@optonline.net',NULL,'',1,0,0),(48,'','','okamikeyfan@sbcglobal.net',NULL,'',1,0,0),(49,'','','mpolnerow@che-east.org',NULL,'',1,0,0),(50,'','','f.geigenmueller@t-online.de',NULL,'',1,0,0),(51,'','','info@kotterik.de',NULL,'',1,0,0),(52,'','','jabbs24@gmail.com',NULL,'',1,0,0),(53,'','','msommovigo@siuprem.com',NULL,'',1,0,0),(54,'','','fatmatt8978@yahoo.co.uk',NULL,'',1,0,0),(55,'','','yardenustin@yahoo.com',NULL,'',1,0,0),(56,'','','westburybeverage@yahoo.com',NULL,'',1,0,0),(57,'','','alindajane@cox.net',NULL,'',1,0,0),(58,'','','a1l1i1@aol.com',NULL,'',1,0,0),(59,'','','rewilfert@gmail.com',NULL,'',1,0,0),(60,'','','glenda@hooverexcavating.com',NULL,'',1,0,0),(61,'','','nicoleandrews1993@aol.com',NULL,'',1,0,0),(62,'','','pietrusblock@gmail.com',NULL,'',1,0,0),(63,'','','aircanada@latka.ca',NULL,'',1,0,0),(64,'','','dianestarr76@yahoo.com',NULL,'',1,0,0),(65,'','','lanee122@yahoo.com',NULL,'',1,0,0),(66,'','','greeremily@yahoo.com',NULL,'',1,0,0),(67,'','','mnpeetmnnt@gmail.com',NULL,'',1,0,0),(68,'','','cedenehy@gmail.com',NULL,'',1,0,0),(69,'','','lhilly22@gmail.com',NULL,'',1,0,0),(70,'','','jayt@five-star-rv.com',NULL,'',1,0,0),(71,'','','faitheccles123@gmail.com',NULL,'',1,0,0),(72,'','','ofelia_lopez13@yahoo.com',NULL,'',1,0,0),(73,'','','navdeep.darha@gmail.com',NULL,'',1,0,0),(74,'','','shindmarch@graycliffpartners.com',NULL,'',1,0,0),(75,'','','lizard2ca@yahoo.com',NULL,'',1,0,0),(76,'','','pinkdout@san.rr.com',NULL,'',1,0,0),(77,'','','tomgoode.music@gmail.com',NULL,'',1,0,0),(78,'','','dan_rog81@yahoo.com',NULL,'',1,0,0),(79,'','','streeters@cox.net',NULL,'',1,0,0),(80,'','','sales@abnfinest.co.uk',NULL,'',1,0,0),(81,'','','amanda.g.laliberte@gmail.com',NULL,'',1,0,0),(82,'','','lauren@aol.com',NULL,'',1,0,0),(83,'','','avdoucette@gmail.com',NULL,'',1,0,0),(84,'','','william.poccia@gmail.com',NULL,'',1,0,0),(85,'','','wallerjs2010@yahoo.com',NULL,'',1,0,0),(86,'','','tammyjodearen@gmail.com',NULL,'',1,0,0),(87,'','','flax59@msn.com',NULL,'',1,0,0),(88,'','','jojonkimi@cox.net',NULL,'',1,0,0),(89,'','','davidkay77@yahoo.com',NULL,'',1,0,0),(90,'','','donaldedmonston@yahoo.com',NULL,'',1,0,0),(91,'','','alexc_g@hotmail.com',NULL,'',1,0,0),(92,'','','plorenz@lorenz.ca',NULL,'',1,0,0),(93,'','','info@fwblaw.net',NULL,'',1,0,0),(94,'','','allengarcia92@gmail.com',NULL,'',1,0,0),(95,'','','bcates0311@hotmail.com',NULL,'',1,0,0),(96,'','','balaji_kasturi@yahoo.com',NULL,'',1,0,0),(97,'','','stcronley@gmail.com',NULL,'',1,0,0),(98,'','','rami_jhimb@hotmail.com',NULL,'',1,0,0),(99,'','','coachshawnsullivan@gmail.com',NULL,'',1,0,0),(100,'','','gcis26@aol.com',NULL,'',1,0,0),(101,'','','emo.gardner@gmail.com',NULL,'',1,0,0),(102,'','','customerservice@ecobrandsltd.com',NULL,'',1,0,0),(103,'','','yolandaduarte7@gmail.com',NULL,'',1,0,0),(104,'','','patricia_gordon@bellsouth.net',NULL,'',1,0,0),(105,'','GONZALEZ','fjavi.gonzalez@gmail.com',NULL,'dedec   ',0,0,1),(106,'','','gail.gerner@gmail.com',NULL,'',1,0,0),(107,'','','shobha_nadig@hotmail.com',NULL,'',1,0,0),(108,'','','schouten06@gmail.com',NULL,'',1,0,0),(109,'','','waqas327@hotmail.com',NULL,'',1,0,0),(110,'','','adamchasehansen@gmail.com',NULL,'',1,0,0),(111,'','','damiradisa@msn.com',NULL,'',1,0,0),(112,'','','rebeccaf789@gmail.com',NULL,'',1,0,0),(113,'','','kristin@goodbuygear.com',NULL,'',1,0,0),(114,'','','lisa@republicpromos.com',NULL,'',1,0,0),(115,'','','daymanmedearis@yahoo.com',NULL,'',1,0,0),(116,'','','bigfella316@aol.com',NULL,'',1,0,0),(117,'','','ja.hinton@comcast.net',NULL,'',1,0,0),(118,'','','cbabers2@gmail.com',NULL,'',1,0,0),(119,'','','jbullen1@cox.net',NULL,'',1,0,0),(120,'','','beckybrunsen@gmail.com',NULL,'',1,0,0),(121,'','','arb@nuke.africa',NULL,'',1,0,0),(122,'','','analegin@yahoo.co.uk',NULL,'',1,0,0),(123,'','Eric','eric@talkwithcustomer.com',NULL,'\r\nHello votreimmopro.com,\r\n\r\nPeople ask, “why does TalkWithCustomer work so well?”\r\n\r\nIt’s simple.\r\n\r\nTalkWithCustomer enables you to connect with a prospective customer at EXACTLY the Perfect Time.\r\n\r\n- NOT one week, two weeks, three weeks after they’ve checked out your website votreimmopro.com.\r\n- NOT with a form letter style email that looks like it was written by a bot.\r\n- NOT with a robocall that could come at any time out of the blue.\r\n\r\nTalkWithCustomer connects you to that person within seconds of THEM asking to hear from YOU.\r\n\r\nThey kick off the conversation.\r\n\r\nThey take that first step.\r\n\r\nThey ask to hear from you regarding what you have to offer and how it can make their life better. \r\n\r\nAnd it happens almost immediately. In real time. While they’re still looking over your website votreimmopro.com, trying to make up their mind whether you are right for them.\r\n\r\nWhen you connect with them at that very moment it’s the ultimate in Perfect Timing – as one famous marketer put it, “you’re entering the conversation already going on in their mind.”\r\n\r\nYou can’t find a better opportunity than that.\r\n\r\nAnd you can’t find an easier way to seize that chance than TalkWithCustomer. \r\n\r\nCLICK HERE http://www.talkwithcustomer.com now to take a free, 14-day test drive and see what a difference “Perfect Timing” can make to your business.\r\n\r\nSincerely,\r\nEric\r\n\r\nPS:  If you’re wondering whether NOW is the perfect time to try TalkWithCustomer, ask yourself this:\r\nWill doing what I’m already doing now produce up to 100X more leads?\r\nBecause those are the kinds of results we know TalkWithCustomer can deliver.  \r\nIt shouldn’t even be a question, especially since it will cost you ZERO to give it a try. \r\nCLICK HERE http://www.talkwithcustomer.com to start your free 14-day test drive today.\r\n\r\nIf you\'d like to unsubscribe click here http://liveserveronline.com/talkwithcustomer.aspx?d=votreimmopro.com\r\n\r\n',0,0,1),(124,'','','chucko22@aol.com',NULL,'',1,0,0),(125,'','','costlyokoro@yahoo.co.uk',NULL,'',1,0,0),(126,'','','praxis@laemmlerundtheil.de',NULL,'',1,0,0),(127,'','','vwalsheider@hotmail.com',NULL,'',1,0,0),(128,'','','mygamesyouneed@gmail.com',NULL,'',1,0,0),(129,'','','pastsb@aol.com',NULL,'',1,0,0),(130,'','','lissomlionel@yahoo.fr',NULL,'',1,0,0),(131,'','','usedcellphones.pay@protonmail.com',NULL,'',1,0,0),(132,'','','aliense99@hotmail.com',NULL,'',1,0,0),(133,'','','lucky13tar@aol.com',NULL,'',1,0,0),(134,'','','robboproductions@gmail.com',NULL,'',1,0,0),(135,'','','coupon9994@gmail.com',NULL,'',1,0,0),(136,'','','leopold.marko@web.de',NULL,'',1,0,0),(137,'','','martiaubin@aol.com',NULL,'',1,0,0),(138,'','','jonashauge82@gmail.com',NULL,'',1,0,0),(139,'','','randymaxwell392@yahoo.com',NULL,'',1,0,0),(140,'','','zhangsheng264@hotmail.com',NULL,'',1,0,0),(141,'','','dshashoua@yahoo.com',NULL,'',1,0,0),(142,'','','4schneider@rogers.com',NULL,'',1,0,0),(143,'','','kurt@bangormotorsports.net',NULL,'',1,0,0),(144,'','','allydewing@gmail.com',NULL,'',1,0,0),(145,'','','polixus@msn.com',NULL,'',1,0,0),(146,'','AnthonyRoP','raphaeUnamunusisk@gmail.com',NULL,'Good day!  votreimmopro.com \r\n \r\nDo you know the best way to state your product or services? Sending messages exploitation feedback forms will allow you to simply enter the markets of any country (full geographical coverage for all countries of the world).  The advantage of such a mailing  is that the emails which will be sent through it\'ll end up within the mailbox that\'s supposed for such messages. Sending messages using Feedback forms is not blocked by mail systems, which implies it\'s certain to reach the client. You\'ll be ready to send your provide to potential customers who were previously unprocurable thanks to email filters. \r\nWe offer you to check our service for gratis. We\'ll send up to 50,000 message for you. \r\nThe cost of sending one million messages is us $ 49. \r\n \r\nThis message is created automatically. Please use the contact details below to contact us. \r\n \r\nContact us. \r\nTelegram - @FeedbackMessages \r\nSkype  live:contactform_18 \r\nEmail - make-success@mail.ru',0,0,1),(147,'','','deanlisa84@yahoo.com',NULL,'',1,0,0),(148,'','','bfjones11@hotmail.co',NULL,'',1,0,0),(149,'','','marionforster12@gmail.com',NULL,'',1,0,0),(150,'','','pigiiep@gmail.com',NULL,'',1,0,0),(151,'','','tmorgart@bokf.com',NULL,'',1,0,0),(152,'','','q.tien99@gmail.com',NULL,'',1,0,0),(153,'','','sarahborgers1999@hotmail.com',NULL,'',1,0,0),(154,'','','arvindk1@aol.com',NULL,'',1,0,0),(155,'','','johnhui@hotmail.com',NULL,'',1,0,0),(156,'','','akakou1228@yahoo.co.jp',NULL,'',1,0,0),(157,'','','felton.financial@gmail.com',NULL,'',1,0,0),(158,'','','willmaddy@hotmail.co.uk',NULL,'',1,0,0),(159,'','','teri_wilson@hotmail.com',NULL,'',1,0,0),(160,'','','mstazswan@aol.com',NULL,'',1,0,0),(161,'','','bwalts59@gmail.com',NULL,'',1,0,0),(162,'','','horseracing.game@yahoo.com',NULL,'',1,0,0),(163,'','','satuparikh@gmail.com',NULL,'',1,0,0),(164,'','','juanchapulin@aol.com',NULL,'',1,0,0),(165,'','','roseednewhart@rochester.rr.com',NULL,'',1,0,0),(166,'','','nanniepop1@aol.com',NULL,'',1,0,0),(167,'','','sales@icotec.com',NULL,'',1,0,0),(168,'','','ppeachey@telus.net',NULL,'',1,0,0),(169,'','','chillin4once@yahoo.com',NULL,'',1,0,0),(170,'','','mtimoni@aol.com',NULL,'',1,0,0),(171,'','','daddybyrd@ameritech.net',NULL,'',1,0,0),(172,'','','colojerez18@yahoo.com',NULL,'',1,0,0),(173,'','','nelsot57@gmail.com',NULL,'',1,0,0),(174,'','','headphonejackbuisness@gmail.com',NULL,'',1,0,0),(175,'','','pekinwebguy@gmail.com',NULL,'',1,0,0),(176,'','','pitrello48@cox.net',NULL,'',1,0,0),(177,'','','kcisneros0822@gmail.com',NULL,'',1,0,0),(178,'','','jennifer.jeffery@yahoo.com',NULL,'',1,0,0),(179,'','','pmoore@aevitascreative.com',NULL,'',1,0,0),(180,'','','dyerneed1@yahoo.com',NULL,'',1,0,0),(181,'','','shannonwilk@verizon.net',NULL,'',1,0,0),(182,'','','mhilton@precisionrathole.com',NULL,'',1,0,0),(183,'','','dbharwani@msn.com',NULL,'',1,0,0),(184,'','','bklein71@geffenacademy.ucla.edu',NULL,'',1,0,0),(185,'','','putu2sleep99@aol.com',NULL,'',1,0,0),(186,'','','john.hadley@diamondnet.us',NULL,'',1,0,0),(187,'','','tshen11@illinois.edu',NULL,'',1,0,0),(188,'','','mahmut.hanci@gmx.de',NULL,'',1,0,0),(189,'','','nck1285@gmail.com',NULL,'',1,0,0),(190,'','','andrea.kusa@seznam.cz',NULL,'',1,0,0),(191,'','','tyounis@aol.com',NULL,'',1,0,0),(192,'','','suegottfred@yahoo.com',NULL,'',1,0,0),(193,'','','mulebox@cgsmule.com',NULL,'',1,0,0),(194,'','','merklyn56@yahoo.com',NULL,'',1,0,0),(195,'','','hartreginald87@gmail.com',NULL,'',1,0,0),(196,'','','bgreenaway@shaw.ca',NULL,'',1,0,0),(197,'','','heat1085@yahoo.com',NULL,'',1,0,0),(198,'','','chestermendoza@cox.net',NULL,'',1,0,0),(199,'','','rheawang@telus.net',NULL,'',1,0,0),(200,'','','khelenrm@gmail.com',NULL,'',1,0,0),(201,'','','info@hiltonmgmt.com',NULL,'',1,0,0),(202,'','','postmaster@mikesarchery.com',NULL,'',1,0,0),(203,'','','serge_gavr@yahoo.com',NULL,'',1,0,0),(204,'','BobbyAbump','unpropteco1980@bestjacob.online',NULL,'<a href=http://skoperations.site/q_demo_account.php>New search engine. - 1000 000$ </a> \r\n \r\nThus, the cash in your wallet and with your bank account is actually a promissory keep in mind. At 2011 prices I would cut back on my holdings, not increase my investment. Currencies can be extremely erratic. \r\n \r\n<a href=\"http://skoperations.site/q_demo_account.php\"> 1000 000</a> \r\n \r\n \r\nYou have to have to quickly learn how you can invest your money, if you would like to be capable to piling up your investment portfolio. Time is with the essence, because every day that you delay investing is an occasion lost to earn money on ignore the.',0,0,1),(205,'','','eliza.decesare@gmail.com',NULL,'',1,0,0),(206,'','','shawnmquinn@gmail.com',NULL,'',1,0,0),(207,'','contactrirckh','jerome_sesso37@rambler.ru',NULL,'Dear Madame, Dear Sirs! \r\n \r\nWe offer sending newsletters of Your messages via contact forms to the sites ofcompanies via any countries of the world in any languages.  \r\n \r\nhttps://xn----7sbb1bbndheurc1a.xn--p1ai \r\n \r\nYour offer is sent to E-mail address \r\n of organization 100% will get to incoming! \r\n \r\nTest: \r\nten thousand messages on foreign zones to your email - 20 $. \r\nWe need from You only E-mail, title and text of the letter. \r\n \r\nIn our price there are more 800 databases for all domains of the world. \r\nCommon databases: \r\nAll Europe 44 countries 60726150 of domain names - 1100$ \r\nAll European Union 28 countries 56752547 of domain names- 1000$ \r\nAll Asia 48 countries 14662004 of domains - 300$ \r\nAll Africa 50 countries 1594390 of sites - 200$ \r\nAll North and Central America in 35 countries 7441637 of sites - 300$ \r\nAll South America 14 countries 5826884 of domains - 200$ \r\nCompanies and Enterprises of the Russian Federation 4025015 - 300$ \r\nUkraine 605745 of sites - 100$ \r\nAll Russian-speaking countries minus Russian Federation are 14 countries and there are 1979217 of domains - 200$ \r\n \r\nDatabases: \r\nWhois-service databases of domains for all nations of the world. \r\nYou can purchase our databases separately from newsletter\'s service at the request. \r\n \r\nP.S. \r\nPls., do not respond to this commercial offer from your electronic box, as it has been generated in automatic mode and will not reach us! \r\nUse the contact form from the site https://xn----7sbb1bbndheurc1a.xn--p1ai \r\n \r\nPRICE LIST: \r\n \r\nTest mailing: $20 – 10000 contact forms websites \r\n \r\nAll Europe 44 countries there are 60726150 websites – $1100 \r\n \r\nAll EU 28 countries there are 56752547 websites – $1000 \r\n \r\nAll Asia 48 countries there are 14662004 websites – $500 \r\n \r\nAll Africa 50 countries there are 1594390 websites – $200 \r\n \r\nAll North and Central America is 35 countries there are 7441637 websites – $300 \r\n \r\nAll South America 14 countries there are 5826884 websites – $200 \r\n \r\nTop 1 Million World’s Best websites – $100 \r\n \r\nTop 16821856 the most visited websites in the world – $300 \r\n \r\nNew websites from around the world registered 24-48 hours ago. (A cycle of 15 mailings during the month) – 500$ \r\n \r\nBusinesses and organizations of the Russian Federation – there are 3012045 websites – $300 \r\n \r\nAll Russian-speaking countries minus Russia – there are 14 countries and 1850186 websites – $200 \r\n \r\nNew websites of the Russian Federation, registered 24-48 hours ago. (A cycle of 15 mailings during the month) – \r\n \r\n250$ \r\n \r\n1499203 of hosting websites around the world (there are selections for all countries, are excluded from databases \r\n \r\nfor mailings) – $150 \r\n \r\n142018 websites of public authorities of all countries of the world (selections for all countries, are excluded \r\n \r\nfrom databases for mailings) – $100 \r\n \r\nCMS mailings: \r\n \r\nAmiro 1794 websites $50 \r\nBitrix 199550 websites $80 \r\nConcrete5 39121 websites $50 \r\nCONTENIDO 5069 websites $50 \r\nCubeCart 1062 websites $50 \r\nDatalife Engine 23220 websites $50 \r\nDiscuz 47962 websites $50 \r\nDotnetnuke 22859 websites $50 \r\nDrupal 802121 websites $100 \r\nFlexbe 15072 websites $50 \r\nHostCMS 5042 websites $50 \r\nInstantCMS 4136 websites $50 \r\nInSales 11081 websites $50 \r\nInvision Power Board 265 websites $30 \r\nJoomla 1906994 websites $200 \r\nLiferay 5137 websites $50 \r\nMagento 269488 websites $80 \r\nMODx 64023 websites $50 \r\nMovable Type 9171 websites $50 \r\nNetCat 6636 websites $50 \r\nNopCommerce 3892 websites $50 \r\nOpenCart 321057 websites $80 \r\nosCommerce 68468 websites $50 \r\nphpBB 2182 websites $50 \r\nPrestashop 92949 websites $50 \r\nShopify 604387 websites $80 \r\nSimpla 17429 websites $50 \r\nSitefinity 4183 websites $50 \r\nTextpattern 882 websites $30 \r\nTilda 47396 websites $50 \r\nTYPO3 192006 websites $80 \r\nUMI.CMS 13191 websites $50 \r\nvBulletin 8407 websites $50 \r\nWix 3379081 websites $250 \r\nWordpress 15574051 websites $450 \r\nWooCommerce 2097367 websites $210 \r\n \r\n.com 141528448 websites commercial - $1950 \r\n.biz 2361884 websites business - $150 \r\n.info 6216929 websites information - $250 \r\n.net 15689222 websites network - $450 \r\n.org 10922428 websites organization - $350 \r\n \r\n.abogado 381 websites - $30 \r\n.ac 2365 websites - $30 \r\n.academy 34531 websites - $50 \r\n.accountant 96540 websites - $50 \r\n.accountants 1653 websites - $30 \r\n.actor 2287 websites - $30 \r\n.ad 323 websites - $30 \r\n.adult 10541 websites- $50 \r\n.ae 200462 websites UAE - $50 \r\n.ae 1820 websites International zone UAE:.com .net .biz .info .name .tel .mobi .asia-$30 \r\n.aero 23635 websites- $50 \r\n.af 3778 websites - $30 \r\n.africa	23341 websites- $50 \r\n.ag 11931 websites - $50 \r\n.agency 66462 websites - $50 \r\n.ai 24137 websites - $50 \r\n.airforce 592 websites - $30 \r\n.al 6078 websites - $30 \r\n.alsace	1982 websites - $50 \r\n.am 21995 websites Armenia - $50 \r\n.am 1684 websites International zone Armenia:.com .net .biz .info .name .tel .mobi .asia \r\n.amsterdam 28141 websites Amsterdam, Kingdom of the Netherlands - $30 \r\n.ao 904 websites - $30 \r\n.apartments 3758 websites - $30 \r\n.app 661404 websites - $80 \r\n.ar 551804 websites Argentina - $80 \r\n.ar 64008 websites International zone Argentina:.com .net .biz .info .name .tel .mobi .asia-$50 \r\n.archi 2084 websites - $30 \r\n.army 2282 websites - $30 \r\n.art 69227 websites - $50 \r\n.as 10525 websites - $50 \r\n.asia 228418 websites - $80 \r\n.associates 3340 websites - $30 \r\n.at 1356722 websites Austria - $100 \r\n.at 181907 websites International zone Austria :.com .net .biz .info .name .tel .mobi .asia-$50 \r\n.attorney 8204 websites - $30 \r\n.au 2432174 websites Australia - $150 \r\n.au 461279 websites International zone Australia:.com .net .biz .info .name .tel .mobi .asia-$80 \r\n.auction 4125 websites - $30 \r\n.audio 23052 websites - $50 \r\n.auto 400 websites - $30 \r\n.aw 235 websites - $30 \r\n.az 11104 websites Azerbaijan - $50 \r\n.az 2036 websites International zone Azerbaijan:.com .net .biz .info .name .tel .mobi .asia-$30 \r\n.ba 2291 websites international zone Bosnia and Herzegovina:.com.net.biz.info.org.name.tel.mobi.asia-$30 \r\n.ba 7012 websites Bosnia and Herzegovina - $30 \r\n.baby 2051 websites - $30 \r\n.band 13515 websites - $50 \r\n.bank 20424 websites - $50 \r\n.bar 50267 websites - $50 \r\n.barcelona 7919 websites - $30 \r\n.bargains 2997 websites - $30 \r\n.bargains 2346 websites - $30 \r\n.bayern 32565 websites - $50 \r\n.bb 2277 websites- $30 \r\n.be 1349658 websites Belgium - $150 \r\n.be 184810 websites International zone Belgium:.com .net .biz .info .name .tel .mobi .asia-$50 \r\n.beer 13834 websites- $50 \r\n.berlin 58088 websites Berlin - $50 \r\n.best 93390 websites - $50 \r\n.bet 17637 websites - $50 \r\n.bf 238 websites - $30 \r\n.bg 37152 websites Bulgaria - $50 \r\n.bg 50685 websites International zone Bulgaria:.com .net .biz .info .name .tel .mobi .asia-$50 \r\n.bh 453 websites - $30 \r\n.bi 2328 websites Burundi - $30 \r\n.bible 1760 websites - $30 \r\n.bid 474509 websites - $80 \r\n.bike 15229 websites - $50 \r\n.bingo 1232 websites - $30 \r\n.bio 15531 websites- $50 \r\n.bj 147 websites - $30 \r\n.black 6582 websites - $30 \r\n.blackfriday 12106 websites - $50 \r\n.blog 178562 websites - $80 \r\n.blue 16852 websites - $50 \r\n.bm 8089 websites Bermuda - $30 \r\n.bn 20 websites - $30 \r\n.bo 2602 websites- $30 \r\n.bo 29415 websites International zone Bolivia:.com .net .biz .info .name .tel .mobi .asia-$50 \r\n.boats 266 websites - $30 \r\n.boston	21762 websites- $50 \r\n.boutique 8834 websites - $50 \r\n.br 2589383 websites Brazil - $250 \r\n.br 933750 websites International zone Brazil:.com .net .biz .info .name .tel .mobi .asia-$80 \r\n.bradesco 179 websites- $30 \r\n.broadway 261 websites- $30 \r\n.broker	1060 websites- $30 \r\n.brussels 7181 websites - $30 \r\n.bs 330 websites- $30 \r\n.bt 284 websites- $30 \r\n.build 3857 websites- $30 \r\n.builders 3906 websites- $30 \r\n.business 35168 websites - $50 \r\n.buzz 534984 websites - $80 \r\n.bw 1160 websites - $30 \r\n.by 92679 websites Belarus - $50 \r\n.by 1574 websites International zone Belarus:.com .net .biz .info .name .tel .mobi .asia-$30 \r\n.bz 7751 websites - $30 \r\n.bzh 5403 websites - $30 \r\n.ca 2587463 websites Canada - $250 \r\n.ca 288395 websites International zone Canada:.com .net .biz .info .name .tel .mobi .asia-$50 \r\n.cab 3223 websites - $30 \r\n.cafe 15406 websites - $50 \r\n.cam 10316 websites - $50 \r\n.camera 5236 websites - $30 \r\n.camp 6315 websites - $30 \r\n.capetown 4750 websites - $30 \r\n.capital 14387 websites - $50 \r\n.car 342 websites - $30 \r\n.cards 5992 websites - $30 \r\n.care 23004 websites - $50 \r\n.career	1217 websites - $30 \r\n.careers 7555 websites - $30 \r\n.cars 309 websites - $30 \r\n.casa 24158 websites - $50 \r\n.cash 13193 websites - $50 \r\n.casino	5354 websites - $30 \r\n.cat 108569 websites - $50 \r\n.catering 3482 websites - $30 \r\n.cc 1920589 websites Cocos Keeling Islands- $200 \r\n.cd 5865 websites - $30 \r\n.center 39353 websites - $50 \r\n.ceo 2458 websites - $30 \r\n.cf 2291460 websites Central African Republic - $200 \r\n.cg 166 websites - $30 \r\n.ch 1627450 websites Switzerland - $150 \r\n.ch 205292 websites International zone Switzerland:.com .net .biz .info .name .tel .mobi .asia-$50 \r\n.chat 15026 websites - $50 \r\n.cheap 3267 websites - $30 \r\n.christmas 15255 websites - $50 \r\n.church 24104 websites - $50 \r\n.ci 5663 websites Cote d\'Ivoire - $30 \r\n.ci 112 websites International zone Cote d\'Ivoire:.com .net .biz .info .name .tel .mobi .asia-$30 \r\n.city 46171 websites - $50 \r\n.cl 590401 websites Chile - $80 \r\n.cl 65996 websites International zone Chile:.com .net .biz .info .name .tel .mobi .asia-$50 \r\n.claims	2374 websites - $30 \r\n.cleaning 2385 websites - $30 \r\n.click 181015 websites - $50 \r\n.clinic 8006 websites - $30 \r\n.clothing 13639 websites - $50 \r\n.cloud	164113 websites - $50 \r\n.club 1230555 websites - $100 \r\n.cm 29221 websites Cameroon- $50 \r\n.cn 23160610 websites China - $600 \r\n.cn 1372416 websites International zone China:.com .net .biz .info .name .tel .mobi .asia-$100 \r\n.co 1878923 websites Colombia - $200 \r\n.co 10854 websites International zone Colombia:.com .net .biz .info .name .tel .mobi .asia-$30 \r\n.coach 16002 websites- $50 \r\n.codes 12044 websites - $50 \r\n.coffee 19257 websites - $50 \r\n.cologne 10157 websites - $50 \r\n.com.ar 657716 websites Argentina - $80 \r\n.com.br 942898 websites Brazil – $100 \r\n.com.cy	11153 websites Cyprus - $50 \r\n.com.ni 23747 websites - $50 \r\n.com.np 38828 websites - $50 \r\n.com.ru, .net.ru, .org.ru, .spb.ru, .msk.ru 98375 websites Russia - $50 \r\n.community 15013 websites - $50 \r\n.company 64217 websites - $50 \r\n.computer 5539 websites - $30 \r\n.condos	2192 websites - $30 \r\n.construction 7104 websites - $30 \r\n.consulting 27128 websites - $50 \r\n.contractors 3982 websites - $30 \r\n.cooking 1476 websites - $30 \r\n.cool 22008 websites - $50 \r\n.coop 7479 websites - $30 \r\n.corsica 1042 websites - $30 \r\n.country 7144 websites - $30 \r\n.cr 7934 websites - $30 \r\n.credit	4020 websites - $30 \r\n.creditcard 825 websites - $30 \r\n.creditunion 511 websites - $30 \r\n.cricket 33413 websites - $50 \r\n.cruises 2234 websites - $30 \r\n.cu 137 websites - $30 \r\n.cv 2279 websites - $30 \r\n.cx 15753 websites - $50 \r\n.cy 11092 websites Cyprus - $50 \r\n.cy 710 websites International zone Cyprus:.com .net .biz .info .name .tel .mobi .asia-$30 \r\n.cymru 7314 websites - $30 \r\n.cz 1001208 websites Czech Republic - $100 \r\n.cz 193400 websites International zone Czech Republic:.com .net .biz .info .name .tel .mobi .asia-$50 \r\n.dance	7490 websites - $30 \r\n.date 10800 websites - $50 \r\n.dating	2892 websites - $30 \r\n.de 15078512 websites Germany - $450 \r\n.de 3894156 websites International zone Germany:.com .net .biz .info .name .tel .mobi .asia-$200 \r\n.deals 8332 websites - $30 \r\n.degree	2178 websites - $30 \r\n.delivery 6282 websites - $30 \r\n.democrat 1072 websites - $30 \r\n.dental 7841 websites - $30 \r\n.dentist 3046 websites - $30 \r\n.desi 2647 websites - $50 \r\n.design 103712 websites - $50 \r\n.dev	190456 websites - $50 \r\n.diamonds 2730 websites - $30 \r\n.diet 18291 websites - $50 \r\n.digital 49449 websites - $50 \r\n.direct 12129 websites - $50 \r\n.directory 15157 websites - $50 \r\n.discount 3898 websites - $30 \r\n.dj 7680 websites - $30 \r\n.dk 1319155 websites Denmark - $100 \r\n.dk 148164 websites International zone Denmark:.com .net .biz .info .name .tel .mobi .asia-$50 \r\n.dm 23318 websites - $50 \r\n.do 5255 websites Dominican Republic- $30 \r\n.doctor	5601 websites - $30 \r\n.dog 10030 websites - $50 \r\n.dog 12435 websites - $50 \r\n.domains 6253 websites - $30 \r\n.download 7886 websites - $30 \r\n.durban	2247 websites - $30 \r\n.dz 982 websites - $30 \r\n.earth	23412 websites - $50 \r\n.ec 11731 websites Ecuador - $50 \r\n.ec 2897 websites International zone Ecuador:.com .net .biz .info .name .tel .mobi .asia-$30 \r\n.edu 4445 websites - $30 \r\n.edu.np 4883 websites- $30 \r\n.education 25003 websites - $50 \r\n.ee 119701 websites Estonia- $50 \r\n.ee 10490 websites International zone Estonia:.com .net .biz .info .name .tel .mobi .asia-$30 \r\n.eg 1699 websites - $30 \r\n.email 100440 websites - $50 \r\n.energy 12399 websites - $50 \r\n.engineer 3785 websites - $30 \r\n.engineering 6533 websites - $30 \r\n.enterprises 6253 websites - $30 \r\n.equipment 5060 websites - $30 \r\n.es 1509048 websites Spain - $150 \r\n.es 683845 websites International zone Spain:.com .net .biz .info .name .tel .mobi .asia-$80 \r\n.estate 9285 websites - $30 \r\n.et 134 websites - $30 \r\n.eu 3046076 websites Europe - $150 \r\n.eu 633384 websites International zone Europe:.com .net .biz .info .name .tel .mobi .asia-$80 \r\n.eus 10116 websites - $50 \r\n.events 25115 websites - $50 \r\n.exchange 10432 websites - $50 \r\n.expert 34040 websites - $50 \r\n.exposed 2880 websites - $30 \r\n.express 7019 websites - $30 \r\n.fail 3692 websites - $30 \r\n.faith 4019 websites - $30 \r\n.family 21577 websites - $50 \r\n.fan 28607 websites - $50 \r\n.fans 1688 websites - $30 \r\n.farm 17009 websites - $50 \r\n.fashion 9011 websites - $30 \r\n.feedback 1301 websites - $30 \r\n.fi 188337 websites Finland - $50 \r\n.fi 69631 websites International zone Finland:.com .net .biz .info .name .tel .mobi .asia-$50 \r\n.film 4501 websites - $30 \r\n.finance 9082 websites - $30 \r\n.financial 5086 websites - $30 \r\n.fish 4562 websites - $30 \r\n.fishing 1422 websites - $30 \r\n.fit 109855 websites - $50 \r\n.fitness 10689 websites - $50 \r\n.flights 2169 websites - $30 \r\n.florist 2071 websites - $30 \r\n.flowers 1187 websites - $30 \r\n.fm 3775 websites - $30 \r\n.fo 10415 websites- $50 \r\n.football 4677 websites - $30 \r\n.forex	282 websites - $30 \r\n.forsale 7118 websites - $30 \r\n.foundation 15401 websites - $50 \r\n.fr 2810983 websites France - $250 \r\n.fr 639546 websites International zone France:.com .net .biz .info .name .tel .mobi .asia-$80 \r\n.frl 13028 websites - $50 \r\n.fun 485622 websites - $50 \r\n.fund 14501 websites - $50 \r\n.furniture 2276 websites - $30 \r\n.futbol	2709 websites - $30 \r\n.fyi 15872 websites - $50 \r\n.ga 5041 websites Gabon - $30 \r\n.gal 5106 websites - $30 \r\n.gallery 17663 websites - $50 \r\n.game 2066 websites - $30 \r\n.games 20294 websites - $50 \r\n.garden	 2618 websites - $30 \r\n.gd 3038 websites - $30 \r\n.ge 17359 websites Georgia - $50 \r\n.ge 1676 websites International zone Georgia:.com .net .biz .info .name .tel .mobi .asia-$30 \r\n.gent 3388 websites - $30 \r\n.gf 105 websites French Guiana - $30 \r\n.gg 7443 websites - $30 \r\n.gh 703 websites - $30 \r\n.gi 981 websites - $30 \r\n.gift 5001 websites - $30 \r\n.gifts 3357 websites - $30 \r\n.gives 1759 websites - $30 \r\n.gl 3558 websites - $30 \r\n.glass	3239 websites - $30 \r\n.global 48572 websites - $50 \r\n.gm 287 websites - $30 \r\n.gmbh 20786 websites - $50 \r\n.gold 9581 websites - $30 \r\n.golf 10319 websites - $50 \r\n.gop 1340 websites - $30 \r\n.gov 4195 websites - $30 \r\n.gov.np 1937 websites- $30 \r\n.gp 2014 websites - $30 \r\n.gq 63622 websites - $50 \r\n.gr 323168 websites Greece - $80 \r\n.gr 57984 websites International zone Greece:.com .net .biz .info .name .tel .mobi .asia-$150 \r\n.graphics 6555 websites - $30 \r\n.gratis	4113 websites - $30 \r\n.green 5161 websites - $30 \r\n.gripe 1175 websites - $30 \r\n.group 65583 websites - $50 \r\n.gs 1008 websites Georgia - $30 \r\n.gt 15351 websites - $50 \r\n.guide 15044 websites - $50 \r\n.guitars 965 websites - $30 \r\n.guru 53088 websites - $50 \r\n.gy 2047 websites Guyana - $30 \r\n.hamburg 21585 websites - $50 \r\n.haus 5686 websites - $30 \r\n.health	13716 websites - $50 \r\n.healthcare 9001 websites - $30 \r\n.help 13098 websites - $50 \r\n.hiphop 518 websites - $30 \r\n.hiv 279 websites - $30 \r\n.hk 116093 websites - $50 \r\n.hm 229 websites - $30 \r\n.hn 4732 websites - $30 \r\n.hockey	1402 websites - $30 \r\n.holdings 5812 websites - $30 \r\n.holiday 4517 websites - $30 \r\n.homes 12499 websites - $50 \r\n.horse 2516 websites - $30 \r\n.hospital 1805 websites - $30 \r\n.host 79977 websites - $50 \r\n.hosting 3322 websites - $30 \r\n.house 19296 websites - $50 \r\n.how 2557 websites - $30 \r\n.hr 48565 websites Croatia - $50 \r\n.hr 16592 websites International zone Croatia:.com .net .biz .info .name .tel .mobi .asia \r\n.ht 1299 websites - $30 \r\n.hu 618532 websites Hungary - $80 \r\n.hu 53940 websites International zone Hungary:.com .net .biz .info .name .tel .mobi .asia-$50 \r\n.icu 6331371 websites - $350 \r\n.id 61744 websites - $50 \r\n.ie 195987 websites Ireland - $50 \r\n.ie 49861 websites International zone Ireland:.com .net .biz .info .name .tel .mobi .asia-$50 \r\n.il 196266 websites Israel - $80 \r\n.il 38537 websites International zone Israel:.com .net .biz .info .name .tel .mobi .asia-$50 \r\n.im 18701 websites - $50 \r\n.immo 15409 websites - $50 \r\n.immobilien 6805 websites - $30 \r\n.in 1143482 websites India - $100 \r\n.in 266179 websites International zone India:.com .net .biz .info .name .tel .mobi .asia-$50 \r\n.industries 4312 websites - $30 \r\n.ink 28117 websites - $50 \r\n.institute 12134 websites - $50 \r\n.insure	5015 websites - $30 \r\n.int 451 websites - $30 \r\n.international 25430 websites - $50 \r\n.investments 4813 websites - $30 \r\n.io 496216 websites British Indian Ocean - $80 \r\n.iq 2401 websites - $30 \r\n.ir 427735 websites Iran - $80 \r\n.ir 15487 websites International zone Iran:.com .net .biz .info .name .tel .mobi .asia \r\n.irish 3126 websites - $30 \r\n.is 32176 websites Iceland - $50 \r\n.ist 9060 websites - $30 \r\n.istanbul 12839 websites - $50 \r\n.it 2410105 websites Italy – $250 \r\n.it 954040 websites International zone Italy:.com.net.biz.info.org.name.tel.mobi.asia-$100 \r\n.je 3016 websites - $30 \r\n.jetzt 18207 websites - $50 \r\n.jewelry 3250 websites - $30 \r\n.jo 555 websites - $30 \r\n.jobs 44024 websites- $50 \r\n.joburg	3138 websites - $30 \r\n.jp 1299921 websites Japan - $150 \r\n.jp 4683252 websites International zone Japan:.com.net.biz.info.org.name.tel.mobi.asia-$450 \r\n.juegos	644 websites - $30 \r\n.kaufen 6134 websites - $30 \r\n.ke 14677 websites - $50 \r\n.kg 3619 websites Kyrgyzstan - $30 \r\n.kg 664 websites International zone Kyrgyzstan:.com .net .biz .info .name .tel .mobi .asia-$30 \r\n.ki 79 websites - $30 \r\n.kim 12007 websites- $50 \r\n.kitchen 6881 websites - $30 \r\n.kiwi 13426 websites - $50 \r\n.kn 3211 websites - $30 \r\n.koeln 23320 websites - $50 \r\n.kr 272463 websites Korea- $50 \r\n.krd 374 websites - $30 \r\n.kred 8921 websites - $30 \r\n.kw 484 websites - $30 \r\n.ky 5783 websites - $30 \r\n.kyoto 658 websites - $30 \r\n.kz 113180 websites Kazakhstan - $50 \r\n.kz 5876 websites International zone Kazakhstan:.com .net .biz .info .name .tel .mobi .asia-$30 \r\n.la 34189 websites Laos - $50 \r\n.land 15474 websites- $50 \r\n.lat 4171 websites - $30 \r\n.law 12002 websites - $50 \r\n.lawyer 10996 websites- $50 \r\n.lc 481 websites- $30 \r\n.lease 1755 websites- $30 \r\n.leclerc 165 websites- $30 \r\n.legal 13047 websites- $50 \r\n.lgbt 2247 websites- $30 \r\n.li 10044 websites - $50 \r\n.life 195950 websites - $50 \r\n.lighting 5870 websites - $30 \r\n.limited 5365 websites - $30 \r\n.limo 1981 websites- $30 \r\n.link 117273 websites - $50 \r\n.live 662010 websites - $80 \r\n.lk 4971 websites - $30 \r\n.llc 12888 websites - $50 \r\n.loan 23738 websites - $50 \r\n.loans 3994 websites - $30 \r\n.lol 8121 websites - $30 \r\n.london 48933 websites London, United Kingdom- $50 \r\n.love 28434 websites - $50 \r\n.ls 236 websites - $30 \r\n.lt 94484 websites Lithuania- $50 \r\n.lt 27710 websites International zone Lithuania:.com .net .biz .info .name .tel .mobi .asia- $50 \r\n.ltd 100152 websites - $50 \r\n.lu 47052 websites Luxembourg - $50 \r\n.lu 4125 websites International zone Luxembourg:.com .net .biz .info .name .tel .mobi .asia-$30 \r\n.luxe 14037 websites - $50 \r\n.luxury	805 websites - $30 \r\n.lv 67886 websites Latvia - $50 \r\n.lv 8887 websites International zone Latvia:.com .net .biz .info .name .tel .mobi .asia-$30 \r\n.ly 8413 websites - $30 \r\n.ma 41462 websites Morocco - $50 \r\n.madrid	2919 websites - $30 \r\n.maison	1003 websites - $30 \r\n.management 10788 websites- $50 \r\n.market 18741 websites- $50 \r\n.marketing 22656 websites- $50 \r\n.markets 899 websites- $30 \r\n.mba 2510 websites- $30 \r\n.mc 3046 websites Monaco - $30 \r\n.md 16135 websites Moldova - $50 \r\n.md 1293 websites International zone Moldova:.com .net .biz .info .name .tel .mobi .asia-$30 \r\n.me 761596 websites Montenegro - $80 \r\n.me 86897 websites International zone Montenegro:.com .net .biz .info .name .tel .mobi .asia-$50 \r\n.media 49573 websites - $50 \r\n.melbourne 10041 websites - $50 \r\n.memorial 712 websites - $30 \r\n.men 24451 websites - $50 \r\n.menu 5002 websites restaurants- $30 \r\n.mg 3680 websites Madagascar- $30 \r\n.miami 9210 websites Miami, USA - $30 \r\n.mk 12704 websites - $50 \r\n.ml 128001 websites - $50 \r\n.mma 1705 websites - $30 \r\n.mn 17044 websites - $50 \r\n.mo 775 websites - $30 \r\n.mobi 381422 websites- $80 \r\n.moda 2741 websites - $30 \r\n.moe 8709 websites - $30 \r\n.mom 2085 websites - $30 \r\n.money 12000 websites - $50 \r\n.monster 54325 websites - $50 \r\n.mortgage 3198 websites - $30 \r\n.moscow 17741 websites Moscow Russian Federation- $50 \r\n.movie 3275 websites - $30 \r\n.mq 119 websites - $30 \r\n.mr 199 websites - $30 \r\n.ms 7265 websites - $30 \r\n.mt 1402 websites Malta - $30 \r\n.mu 6475 websites - $30 \r\n.museum	1260 websites - $30 \r\n.mv 1905 websites - $30 \r\n.mw 8579 websites Malawi - $30 \r\n.mx 670901 websites Mexico- $80 \r\n.mx 174571 websites International zone Mexico:.com .net .biz .info .name .tel .mobi .asia-$50 \r\n.my 143039 websites Malaysia- $80 \r\n.mz 985 websites - $30 \r\n.na 1094 websites - $30 \r\n.nagoya	7807 websites - $30 \r\n.name 120331 websites- $50 \r\n.navy 799 websites - $30 \r\n.nc 999 websites - $30 \r\n.network 51331 websites - $50 \r\n.news 57899 websites - $50 \r\n.ng 23864 websites - $50 \r\n.ngo 3421 websites - $30 \r\n.ninja 31719 websites - $50 \r\n.nl 3925784 websites Netherlands - $200 \r\n.nl 1019697 websites International zone Netherlands:.com .net .biz .info .name .tel .mobi .asia-$100 \r\n.no 620882 websites Norway - $80 \r\n.no 74318 websites International zone Norway:.com .net .biz .info .name .tel .mobi .asia-$50 \r\n.nra 131 websites - $30 \r\n.nrw 17487 websites - $50 \r\n.nu 236821 websites Niue- $50 \r\n.nyc 64003 websites - $50 \r\n.nz 593127 websites New Zealand - $80 \r\n.om 1701 websites - $30 \r\n.one 71859 websites - $50 \r\n.ong 3420 websites - $30 \r\n.onl 7059 websites - $30 \r\n.online 1356725 websites - $100 \r\n.ooo 15719 websites - $50 \r\n.org.np 7082 websites - $30 \r\n.org.ua 41362 websites - $50 \r\n.organic 1631 websites - $30 \r\n.osaka	664 websites - $30 \r\n.ovh 50056 websites - $50 \r\n.pa 1578 websites - $30 \r\n.page 61259 websites - $50 \r\n.paris 19098 websites - $50 \r\n.partners 8576 websites - $30 \r\n.parts 6042 websites - $30 \r\n.party 19563 websites- $50 \r\n.pe 83224 websites Peru - $50 \r\n.pe 59157 websites International zone Peru:.com .net .biz .info .name .tel .mobi .asia-$50 \r\n.pet 10381 websites - $50 \r\n.pf 319 websites - $30 \r\n.pg 2105 websites Papua - $30 \r\n.ph 17940 websites Philippines - $50 \r\n.photo 17365 websites- $50 \r\n.photography 45234 websites- $50 \r\n.photos	21407 websites- $50 \r\n.physio	1159 websites- $30 \r\n.pics 5559 websites- $30 \r\n.pictures 8375 websites- $30 \r\n.pink 8173 websites- $30 \r\n.pizza 6365 websites - $30 \r\n.pk 44464 websites Pakistan - $50 \r\n.pl 1795299 websites Poland - $150 \r\n.pl 327587 websites International zone Poland:.com .net .biz .info .name .tel .mobi .asia-$50 \r\n.place 3504 websites - $30 \r\n.plumbing 2815 websites - $30 \r\n.plus 18915 websites - $50 \r\n.pm 4051 websites - $30 \r\n.poker 3207 websites - $30 \r\n.porn 10323 websites- $50 \r\n.post 441 websites - $30 \r\n.pr 1229 websites - $30 \r\n.press 35132 websites - $50 \r\n.productions 7907 websites - $30 \r\n.promo 5720 websites - $30 \r\n.properties 13804 websites - $50 \r\n.property 3274 websites - $30 \r\n.ps 1572 websites - $30 \r\n.pt 263136 websites Portugal - $80 \r\n.pt 17691 websites International zone Portugal:.com .net .biz .info .name .tel .mobi .asia-$50 \r\n.pub 25225 websites - $50 \r\n.pw 8023 websites - $30 \r\n.py 5593 websites Paraguay - $30 \r\n.py 653 websites International zone Paraguay:.com .net .biz .info .name .tel .mobi .asia-$30 \r\n.qa 9080 websites - $30 \r\n.quebec 8742 websites - $30 \r\n.racing 3320 websites - $30 \r\n.radio 2274 websites - $30 \r\n.re 11013 websites - $50 \r\n.realestate 18187 websites - $50 \r\n.realtor 39865 websites - $50 \r\n.realty 2204 websites - $30 \r\n.recipes 6245 websites - $30 \r\n.red 24701 websites - $50 \r\n.rehab 1756 websites - $30 \r\n.reise 1071 websites - $30 \r\n.reisen	4805 websites - $30 \r\n.reit 101 websites - $30 \r\n.ren 16501 websites - $50 \r\n.rent 4474 websites - $30 \r\n.rentals 11901 websites- $50 \r\n.repair 6828 websites- $30 \r\n.report 7269 websites - $30 \r\n.republican 852 websites - $30 \r\n.rest 47992 websites - $50 \r\n.restaurant 7735 websites - $30 \r\n.review 12121 websites - $80 \r\n.reviews 17432 websites- $50 \r\n.rio 1062 websites- $30 \r\n.rip 3599 websites- $30 \r\n.ro 423021 websites Romania - $80 \r\n.ro 42046 websites International zone Romania:.com .net .biz .info .name .tel .mobi .asia-$50 \r\n.rocks 90108 websites - $50 \r\n.rs 85503 websites Serbia - $50 \r\n.ru 514668 websites International zone Russian:.com .net .biz .info .name .tel .mobi .asia-$80 \r\n.ru 5025331 websites Russian - $250 \r\n.ru, .su, .рф websites 5800000 - $250 \r\n.ru.com 6499 websites Russia - $30 \r\n.ruhr 9687 websites - $30 \r\n.run 19122 websites - $50 \r\n.rw 3245 websites - $30 \r\n.sa 20421 websites Saudi Arabia- $50 \r\n.sa 5064 websites International zone Saudi Arabia:.com .net .biz .info .name .tel .mobi .asia \r\n.saarland 3925 websites - $30 \r\n.sale 15249 websites - $50 \r\n.salon 2722 websites - $30 \r\n.sarl 919 websites - $30 \r\n.sc 4442 websites Seychelles- $30 \r\n.school 14272 websites - $50 \r\n.schule	2913 websites - $30 \r\n.science 13625 websites - $80 \r\n.scot 11375 websites - $50 \r\n.sd 515 websites - $30 \r\n.se 1383322 websites Sweden - $150 \r\n.se 293316 websites International zone Sweden:.com .net .biz .info .name .tel .mobi .asia-$50 \r\n.seat 688 websites - $30 \r\n.security 287 websites - $30 \r\n.services 50298 websites - $50 \r\n.sex 7751 websites - $30 \r\n.sexy 5756 websites - $30 \r\n.sg 150351 websites Republic Of Singapore - $50 \r\n.sh 2706 websites - $30 \r\n.shiksha 911 websites - $30 \r\n.shoes 4676 websites - $30 \r\n.shop 631693 websites - $80 \r\n.shopping 6337 websites - $30 \r\n.show 12092 websites - $50 \r\n.si 39749 websites Slovenia- $50 \r\n.si 12879 websites International zone Slovenia:.com .net .biz .info .name .tel .mobi .asia-$50 \r\n.singles 3589 websites - $30 \r\n.site 1855897 websites - $150 \r\n.sk 301001 websites Slovakia- $80 \r\n.sk 31572 websites International zone Slovakia:.com .net .biz .info .name .tel .mobi .asia-$50 \r\n.ski 5530 websites - $30 \r\n.sl 1504 websites - $30 \r\n.sm 8897 websites - $30 \r\n.sn 4465 websites Senegal - $30 \r\n.sn 344 websites International zone Senegal:.com .net .biz .info .name .tel .mobi .asia-$30 \r\n.so 9703 websites - $30 \r\n.soccer	2933 websites - $30 \r\n.social 23263 websites - $50 \r\n.software 16006 websites - $50 \r\n.solar 6575 websites - $30 \r\n.solutions 78770 websites - $50 \r\n.soy 1405 websites - $30 \r\n.space 409707 websites - $80 \r\n.sport 8578 websites - $30 \r\n.sr 580 websites Suriname - $30 \r\n.srl 5591 websites - $30 \r\n.st 8041 websites - $30 \r\n.storage 411 websites - $30 \r\n.store 328721 websites - $50 \r\n.stream 12901 websites - $80 \r\n.studio 53390 websites - $50 \r\n.study	5136 websites - $30 \r\n.style 11421 websites - $50 \r\n.su 110538 websites Russian- $50 \r\n.sucks 7329 websites - $30 \r\n.supplies 3079 websites - $30 \r\n.supply	5280 websites - $30 \r\n.support 23377 websites - $50 \r\n.surf 7373 websites - $30 \r\n.surgery 1778 websites - $30 \r\n.sv 8432 websites Salvador- $30 \r\n.swiss 17623 websites - $50 \r\n.sx 2901 websites - $30 \r\n.sy 2663 websites - $30 \r\n.sydney 10073 websites - $50 \r\n.systems 29044 websites - $50 \r\n.sz 321 websites - $30 \r\n.taipei	5664 websites - $30 \r\n.tattoo 7394 websites- $30 \r\n.tax 7388 websites - $30 \r\n.taxi 6034 websites - $30 \r\n.tc 16384 websites Turks and Caicos Islands- $50 \r\n.team 27421 websites- $50 \r\n.tech 276164 websites - $50 \r\n.technology 31533 websites- $50 \r\n.tel 90552 websites- $50 \r\n.tennis	1804 websites - $30 \r\n.tf 19841 websites - $50 \r\n.tg 1230 websites - $30 \r\n.th 22368 websites Kingdom Of Thailand- $50 \r\n.theater 1253 websites - $30 \r\n.tickets 1941 websites - $30 \r\n.tienda	1902 websites - $30 \r\n.tips 29380 websites- $50 \r\n.tires 941 websites - $30 \r\n.tirol 5472 websites - $30 \r\n.tj 6874 websites Tajikistan- $30 \r\n.tj 34 websites International zone Tajikistan:.com .net .biz .info .name .tel .mobi .asia \r\n.tk 20085806 websites Tokelau - $500 \r\n.tl 2748 websites - $30 \r\n.tm 6395 websites Turkmenistan- $30 \r\n.tm 44 websites International zone Turkmenistan:.com .net .biz .info .name .tel .mobi .asia \r\n.tn 16345 websites - $50 \r\n.to 16987 websites Tonga- $50 \r\n.today 81155 websites - $50 \r\n.tokyo 166544 websites - $50 \r\n.tools 13341 websites - $50 \r\n.top 3609373 websites - $250 \r\n.tours 10771 websites - $50 \r\n.town 4104 websites - $30 \r\n.toys 4566 websites - $30 \r\n.tr 243347 websites Turkey - $80 \r\n.tr 138818 International zone Turkey:.com .net .biz .info .name .tel .mobi .asia -$50 \r\n.trade 16130 websites - $50 \r\n.trading 1150 websites - $30 \r\n.training 19811 websites - $50 \r\n.travel 20461 websites - $50 \r\n.tt 535 websites - $30 \r\n.tube 3252 websites - $30 \r\n.tv 559502 websites Tuvalu - $80 \r\n.tw 982620 websites Taiwan - $100 \r\n.tz 4708 websites - $30 \r\n.ua 553216 websites Ukraina - $80 \r\n.ua 147202 websites International zone Ukraine:.com .net .biz .info .name .tel .mobi .asia-$50 \r\n.ua, .com.ua, .kiev.ua 	193080 websites - $50 \r\n.ug 2561 websites Uganda - $30 \r\n.uk 4606907 websites United Kingdom - $350 \r\n.uk 3304606 websites International zone United Kingdom:.com .net .biz .info .name .tel .mobi .asia-$150 \r\n.university 6821 websites - $30 \r\n.uno 18694 websites - $50 \r\n.us 3139563 websites USA - $250 \r\n.us 578927 websites International zone USA:.com .net .biz .info .name .tel .mobi .asia-$80 \r\n.uy 15571 websites Uruguay - $50 \r\n.uy 31812 websites International zone Uruguay:.com .net .biz .info .name .tel .mobi .asia-$30 \r\n.uz 38357 websites Uzbekistan - $50 \r\n.uz  365 websites International zone Uzbekistan:.com .net .biz .info .name .tel .mobi .asia \r\n.vacations 3826 websites - $50 \r\n.vc 18641 websites - $50 \r\n.ve 14015 websites Venezuela - $50 \r\n.ve 2898 websites International zone Venezuela:.com .net .biz .info .name .tel .mobi .asia \r\n.vegas 17708 websites Las Vegas NV United States of America - $50 \r\n.ventures 13870 websites - $50 \r\n.versicherung 2005 websites - $30 \r\n.vet 7060 websites - $30 \r\n.vg 8389 websites - $50 \r\n.vi 109 websites - $30 \r\n.viajes	1065 websites - $30 \r\n.video 21392 websites- $50 \r\n.villas	11791 websites - $50 \r\n.vin 5494 websites - $30 \r\n.vip 1324303 websites - $100 \r\n.vision 7120 websites - $30 \r\n.vlaanderen 6014 websites - $30 \r\n.vn 436005 websites Vietnam - $80 \r\n.vn 161855 websites International zone Vietnam:.com .net .biz .info .name .tel .mobi .asia - $50 \r\n.vodka 1410 websites - $30 \r\n.vote 2316 websites - $30 \r\n.voto 3180 websites - $30 \r\n.voyage	2663 websites - $30 \r\n.vu 1051 websites - $30 \r\n.wales 12863 websites - $50 \r\n.wang 1352025 websites - $100 \r\n.watch 9902 websites - $30 \r\n.webcam	17340 websites - $50 \r\n.website 308840 websites -$50 \r\n.wedding 20162 websites - $50 \r\n.wf 1133 websites - $30 \r\n.wien 14413 websites - $50 \r\n.wiki 18129 websites wikis - $50 \r\n.win 73425 websites - $50 \r\n.wine 14831 websites - $50 \r\n.work 608563 websites - $80 \r\n.works 20702 websites - $50 \r\n.world 134234 websites - $50 \r\n.ws 99308 websites Samoa- $80 \r\n.wtf 17638 websites - $50 \r\n.xin 56857 websites - $50 \r\n.xn--3ds443g 26521 websites - $50 \r\n.xn--55qx5d 36965 websites - $50 \r\n.xn--6qq986b3xl 16188 websites - $50 \r\n.xn--czr694b 19910 websites - $50 \r\n.xn--czru2d 21621 websites - $50 \r\n.xn--fiq228c5hs 12145 websites - $50 \r\n.xn--io0a7i 24704 websites - $50 \r\n.xn--j6w193g 31764 websites - $50 \r\n.xn--kput3i 33006 websites - $50 \r\n.xn--mgbaam7a8h	2038 websites - $30 \r\n.xn--mgberp4a5d4ar 2534 websites - $30 \r\n.xn--mk1bu44c 6001 websites - $30 \r\n.xn--rhqv96g 7723 websites - $30 \r\n.xn--ses554g 126268 websites - $80 \r\n.xn--tckwe 6197 websites - $30 \r\n.xn--vuq861b 19706 websites - $50 \r\n.xxx 119879 websites- $50 \r\n.xyz 2650949 websites - $250 \r\n.yachts	254 websites - $30 \r\n.ye 18 websites - $30 \r\n.yoga 11563 websites - $50 \r\n.yokohama 8140 websites - $30 \r\n.yt 2004 websites - $30 \r\n.za 986900 websites South Africa - $100 \r\n.zm 508 websites - $30 \r\n.zone 26798 websites - $50 \r\n.бг (.xn--90ae) 3470 websites - $30 \r\n.дети 169 websites - $30 \r\n.москва (.xn--80adxhks) 19582 websites Moscow - $50 \r\n.онлайн	3403 websites - $30 \r\n.орг 1160 websites - $30 \r\n.рус (.xn--p1acf) 110789 websites - $50 \r\n.рф (.xn--p1ai) 869759 websites Russia - $80 \r\n.сайт 1005 websites - $30 \r\n.укр (.xn--j1amh) 10563 websites- $50 \r\n \r\n.بازار	550 websites - $30 \r\n.شبكة	834 websites - $30 \r\n.موقع	479 websites - $30 \r\n.संगठन	 106 websites - $30 \r\n.みんな  946 websites - $30 \r\n.コム    6533 websites - $30 \r\n.世界   4172 websites - $30 \r\n.公司   46162 websites - $50 \r\n.商城   6906 websites - $30 \r\n.商标   9866 websites - $30 \r\n.我爱你 15466 websites - $50 \r\n.手机   31544 websites - $50 \r\n.机构   244 websites - $30 \r\n.游戏   162 websites - $30 \r\n.移动   1152 websites - $30 \r\n.网店   3710 websites - $30 \r\n.网络   30809 websites - $50 \r\n.닷컴   5938 websites - $30',0,0,1),(208,'','','herndonx5@cox.net',NULL,'',1,0,0),(209,'','','felixschonarth@aol.com',NULL,'',1,0,0),(210,'','','leannhilton@hiltonmgmt.com',NULL,'',1,0,0),(211,'','','sylvie.fauvel70@orange.fr',NULL,'',1,0,0),(212,'','','rick@listo.com',NULL,'',1,0,0),(213,'','','marlena@valleyforgeflowers.com',NULL,'',1,0,0),(214,'','','mariauitz@msn.com',NULL,'',1,0,0),(215,'','','5125964681@vtext.com',NULL,'',1,0,0),(216,'','','nepomuk_2003@yahoo.de',NULL,'',1,0,0),(217,'','','surrenders@bluewin.ch',NULL,'',1,0,0),(218,'','','edrussel@russellconveyor.com',NULL,'',1,0,0),(219,'','','aaronmaskell@shaw.ca',NULL,'',1,0,0),(220,'','','chertaylor71@yahoo.com',NULL,'',1,0,0),(221,'','','bmclendon@slb.com',NULL,'',1,0,0),(222,'','','aysharajan@hotmail.com',NULL,'',1,0,0),(223,'','','t_.nguyen@hotmail.com',NULL,'',1,0,0),(224,'','','resalee4u@gmail.com',NULL,'',1,0,0),(225,'','','dhyres@yahoo.com',NULL,'',1,0,0),(226,'','','pay.invoice12@gmail.com',NULL,'',1,0,0),(227,'','ContactToBia','no-replyUnamunusisk@gmail.com',NULL,'Gооd dаy!  votreimmopro.com \r\n \r\nDid yоu knоw thаt it is pоssiblе tо sеnd prоpоsаl pеrfесtly lеgаlly? \r\nWе put а nеw lеgаl wаy оf sеnding businеss оffеr thrоugh fееdbасk fоrms. Suсh fоrms аrе lосаtеd оn mаny sitеs. \r\nWhеn suсh businеss оffеrs аrе sеnt, nо pеrsоnаl dаtа is usеd, аnd mеssаgеs аrе sеnt tо fоrms spесifiсаlly dеsignеd tо rесеivе mеssаgеs аnd аppеаls. \r\nаlsо, mеssаgеs sеnt thrоugh соntасt Fоrms dо nоt gеt intо spаm bесаusе suсh mеssаgеs аrе соnsidеrеd impоrtаnt. \r\nWе оffеr yоu tо tеst оur sеrviсе fоr frее. Wе will sеnd up tо 50,000 mеssаgеs fоr yоu. \r\nThе соst оf sеnding оnе milliоn mеssаgеs is 49 USD. \r\n \r\nThis mеssаgе is сrеаtеd аutоmаtiсаlly. Plеаsе usе thе соntасt dеtаils bеlоw tо соntасt us. \r\n \r\nContact us. \r\nTelegram - @FeedbackFormEU \r\nSkype  live:feedbackform2019 \r\nWhatsApp - +375259112693',0,0,1),(228,'','Niccoholos','zheleziamarat@gmail.com',NULL,'Hi dear site owner, \r\n \r\nIf you received this letter, it means that your site has a vulnerability and is potentially susceptible to various types of automatic attacks. \r\n \r\nWrite \"I want a report\" to this email address - pentesting4u@yandex.com and specify your site. Within a few days we will send information about vulnerabilities that hackers can use to harm your site or server. \r\n \r\nSincerelly, \r\nYour pentest team',0,0,1),(229,'','JaoWoo','borovikov.a0.45@gmail.com',NULL,'Hi! \r\n \r\nI offer the service of mailing your advertising to millions contact forms on various sites. This is well suited for advert b2b offers. It is possible to sort the sites by country and, possibly, even by site topic (additional option). \r\n \r\nAlso I make email spam sending. Send your ad to users and get thousands of unique visitors and leads to your website. \r\n \r\nFind out more details and discuss about your project by this email - jaowoo@protonmail.com',0,0,1),(230,'','','afarrow85@outlook.com',NULL,'',1,0,0),(231,'','','a.fackman@ntlworld.com',NULL,'',1,0,0),(232,'','','5129819640@vzwpix.com',NULL,'',1,0,0),(233,'','','leann.hilton@yahoo.com',NULL,'',1,0,0),(234,'','','sneakerheadstore1@gmail.com',NULL,'',1,0,0),(235,'','','alun.james@sky.com',NULL,'',1,0,0),(236,'','','ash.ohara4@yahoo.com',NULL,'',1,0,0),(237,'','','c.avato@aol.com',NULL,'',1,0,0),(238,'','','Jed24@gmail.com',NULL,'',1,0,0),(239,'','','thimler@gmail.com',NULL,'',1,0,0),(240,'','Eric','ericjonesonline@outlook.com',NULL,'My name’s Eric and I just found your site votreimmopro.com.\r\n\r\nIt’s got a lot going for it, but here’s an idea to make it even MORE effective.\r\n\r\nTalk With Web Visitor – CLICK HERE http://www.talkwithwebvisitors.com for a live demo now.\r\n\r\nTalk With Web Visitor is a software widget that’s works on your site, ready to capture any visitor’s Name, Email address and Phone Number.  It signals you the moment they let you know they’re interested – so that you can talk to that lead while they’re literally looking over your site.\r\n\r\nAnd once you’ve captured their phone number, with our new SMS Text With Lead feature, you can automatically start a text (SMS) conversation… and if they don’t take you up on your offer then, you can follow up with text messages for new offers, content links, even just “how you doing?” notes to build a relationship.\r\n\r\nCLICK HERE http://www.talkwithwebvisitors.com to discover what Talk With Web Visitor can do for your business.\r\n\r\nThe difference between contacting someone within 5 minutes versus a half-hour means you could be converting up to 100X more leads today!\r\n\r\nEric\r\nPS: Studies show that 70% of a site’s visitors disappear and are gone forever after just a moment. Don’t keep losing them. \r\nTalk With Web Visitor offers a FREE 14 days trial – and it even includes International Long Distance Calling. \r\nYou have customers waiting to talk with you right now… don’t keep them waiting. \r\nCLICK HERE http://www.talkwithwebvisitors.com to try Talk With Web Visitor now.\r\n\r\nIf you\'d like to unsubscribe click here http://talkwithwebvisitors.com/unsubscribe.aspx?d=votreimmopro.com\r\n',0,0,1),(241,'','','andreas.scherer@advantech.de',NULL,'',1,0,0),(242,'','PARTIDO3698','TUCKETT7429@thefmail.com',NULL,'Thank you!!1',0,0,1),(243,'','','info@document-rapide.com',NULL,'',1,0,0),(244,'','','kellymiles2014@yahoo.com',NULL,'',1,0,0),(245,'','','mtsweeney@yahoo.com',NULL,'',1,0,0),(246,'','','cjlbraham@icloud.com',NULL,'',1,0,0),(247,'','','jmormilo@gmail.com',NULL,'',1,0,0),(248,'','','oleandrrybalov@gmail.com',NULL,'',1,0,0),(249,'','','lavieille.laura1701@gmail.com',NULL,'',1,0,0),(250,'','','guinfin@aol.com',NULL,'',1,0,0);
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_categorie`
--

DROP TABLE IF EXISTS `contact_categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_categorie` (
  `id_contact` int(11) unsigned NOT NULL,
  `id_categorie` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_categorie`
--

LOCK TABLES `contact_categorie` WRITE;
/*!40000 ALTER TABLE `contact_categorie` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_categorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goldbook`
--

DROP TABLE IF EXISTS `goldbook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goldbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `nom` varchar(250) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `message` text,
  `online` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goldbook`
--

LOCK TABLES `goldbook` WRITE;
/*!40000 ALTER TABLE `goldbook` DISABLE KEYS */;
INSERT INTO `goldbook` VALUES (1,'2015-09-06 00:00:00','Franck Langleron','franck_langleron@hotmail.com','Très professionnel ! je recommande',1),(2,'2015-09-07 00:00:00','Xavier Gonzalez','xavier@gonzalez.pm','Prestation nickel, très pro, très satisfait',1);
/*!40000 ALTER TABLE `goldbook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_news`
--

DROP TABLE IF EXISTS `media_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_news` int(11) NOT NULL,
  `url_media` varchar(250) NOT NULL,
  `url_apercu` varchar(250) NOT NULL,
  `type_media` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`id_news`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_news`
--

LOCK TABLES `media_news` WRITE;
/*!40000 ALTER TABLE `media_news` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id_news` int(11) NOT NULL AUTO_INCREMENT,
  `date_news` datetime NOT NULL,
  `titre` varchar(250) NOT NULL,
  `accroche` text,
  `contenu` text,
  `image1` varchar(250) DEFAULT NULL,
  `online` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_news`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (32,'2020-01-24 00:00:00','Le B. Retail Park','linkedin','En exclusivité, sur la commune de Le Barp, 3672 m2 de surfaces commerciales VENTE ou LOCATION divisibles à partir de 121 m2.\r\nA proximité des supermarchés SUPER U et LEADER PRICE\r\nLivraison second semestre 2022\r\n','/2018.11.05 - le barp 01 final-32.jpg',1);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter`
--

DROP TABLE IF EXISTS `newsletter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `titre` varchar(250) DEFAULT NULL,
  `bas_page` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter`
--

LOCK TABLES `newsletter` WRITE;
/*!40000 ALTER TABLE `newsletter` DISABLE KEYS */;
INSERT INTO `newsletter` VALUES (12,'2015-01-01 00:00:00','Une offre à ne pas rater',' '),(13,'2015-10-03 00:00:00','EXCLUVITE',''),(14,'2015-10-03 00:00:00','EXCLUSIVITE !! Espace commercial MACODA',''),(15,'2016-04-26 00:00:00','MIRAGE','');
/*!40000 ALTER TABLE `newsletter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_detail`
--

DROP TABLE IF EXISTS `newsletter_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletter_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_newsletter` int(10) unsigned NOT NULL,
  `titre` varchar(250) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `link` varchar(250) DEFAULT NULL,
  `texte` text,
  PRIMARY KEY (`id`,`id_newsletter`)
) ENGINE=InnoDB AUTO_INCREMENT=333 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_detail`
--

LOCK TABLES `newsletter_detail` WRITE;
/*!40000 ALTER TABLE `newsletter_detail` DISABLE KEYS */;
INSERT INTO `newsletter_detail` VALUES (325,12,'','/IMG_5187-12.jpg','http://www.votreimmopro.com',''),(330,14,'Livraison 1er semestre 2017','/IMG_5659-.jpg','http://www.votreimmopro.com/','Au coeur du parc d\'activité de La Teste, 6150 m2 de surfaces commerciales'),(332,15,'','/1-.jpg','http://www.votreimmopro.com/','Entre Bordeaux et le Bassin, MIRAGE est le nom du cabaret spectacle actuellement en projet.\r\nLa demande de permis de construire va être déposée prochainement. (A suivre.....)');
/*!40000 ALTER TABLE `newsletter_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_journal`
--

DROP TABLE IF EXISTS `newsletter_journal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletter_journal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_envoi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_newsletter` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_journal`
--

LOCK TABLES `newsletter_journal` WRITE;
/*!40000 ALTER TABLE `newsletter_journal` DISABLE KEYS */;
INSERT INTO `newsletter_journal` VALUES (21,'2015-10-03 12:23:37',12);
/*!40000 ALTER TABLE `newsletter_journal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_journal_detail`
--

DROP TABLE IF EXISTS `newsletter_journal_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletter_journal_detail` (
  `id_newsletter_journal` int(11) unsigned NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 NOT NULL,
  `read` tinyint(4) NOT NULL DEFAULT '0',
  `coderandom` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `error` varchar(250) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_journal_detail`
--

LOCK TABLES `newsletter_journal_detail` WRITE;
/*!40000 ALTER TABLE `newsletter_journal_detail` DISABLE KEYS */;
INSERT INTO `newsletter_journal_detail` VALUES (21,'jav_gonz@yahoo.com',1,'UCosoqlwA97C',''),(21,'xavier.gonzalez@free.fr',1,'WyxEwoIulZTe',''),(21,'xavier.gonzalez@laposte.net',1,'XglZcgvWGKcS',''),(21,'fjavi.gonzalez@gmail.com',1,'YleokbO7zbyT',''),(21,'xav335@hotmail.com',0,'n7bzVVBI2Kw2','');
/*!40000 ALTER TABLE `newsletter_journal_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offre`
--

DROP TABLE IF EXISTS `offre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offre` (
  `num_offre` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(100) NOT NULL,
  `surface` int(11) NOT NULL,
  `nb_piece` int(11) NOT NULL,
  `description` text NOT NULL,
  `fichier_pdf` varchar(100) NOT NULL,
  `prix` int(11) NOT NULL,
  `a_la_une` enum('oui','non') NOT NULL DEFAULT 'non',
  `online` enum('oui','non') NOT NULL,
  PRIMARY KEY (`num_offre`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offre`
--

LOCK TABLES `offre` WRITE;
/*!40000 ALTER TABLE `offre` DISABLE KEYS */;
INSERT INTO `offre` VALUES (16,'PLATEAU DE BUREAUX',552,0,'Plateau de bureaux, loué à un groupe de dimension internationale.\r\nAu coeur d\'un parc tertiaire, bord rocade Bordeaux.\r\nDossier de présentation sur demande.\r\nRendement 7,5 % acte en main','',1110000,'non','oui'),(38,'Le B. Retail Park',239,0,'A LOUER, en exclusivité, sur la commune de Le Barp, 3715 m2 de surfaces commerciales divisibles à partir de 239 m2.\r\nA proximité des supermarchés SUPER U et LEADER PRICE\r\nLivraison second semestre 2022, loyer annuel 29 900 € HT, LOT C 1, Bail 6 ans ferme.\r\nHonoraires: 30 % HT','',29000,'oui','oui'),(52,'LOCAL COMMERCIAL TARBES',1800,0,'Local commercial d\'une surface de 1800 m2, façade en première ligne, sur axe principal de Tarbes.\r\nIdéal activité négoce, mobilier,.......\r\ndisponible immédiatement.\r\nHonoraires preneur 15 % HT ','',8750,'non','oui'),(64,'Le B. Retail Park',428,0,'A LOUER, en exclusivité, sur la commune de Le Barp, 3715 m2 de surfaces commerciales.\r\nA proximité des supermarchés SUPER U et LEADER PRICE\r\nLivraison second semestre 2022, loyer annuel 46 000 € HT, LOT C 2, Bail 6 ans ferme.\r\nHonoraires: 30 % HT','',46000,'oui','oui'),(65,'Le B. Retail Park',184,0,'A LOUER, en exclusivité, sur la commune de Le Barp, 3715 m2 de surfaces commerciales.\r\nA proximité des supermarchés SUPER U et LEADER PRICE\r\nLivraison second semestre 2022, loyer annuel 23 000 € HT, LOT C 3, Bail 6 ans ferme.\r\nHonoraires: 30 % HT','',23000,'oui','oui'),(66,'Le B. Retail Park',1200,0,'A LOUER, en exclusivité, sur la commune de Le Barp, 3715 m2 de surfaces commerciales.\r\nA proximité des supermarchés SUPER U et LEADER PRICE\r\nLivraison second semestre 2022, loyer annuel 78 000 € HT, LOT C 4, Bail 6 ans ferme.\r\nHonoraires: 30 % HT','',78000,'oui','oui'),(67,'Le B. Retail Park',331,0,'A LOUER, en exclusivité, sur la commune de Le Barp, 3715 m2 de surfaces commerciales.\r\nA proximité des supermarchés SUPER U et LEADER PRICE\r\nLivraison second semestre 2022, loyer annuel 33 100 € HT, LOT C 5, Bail 6 ans ferme.\r\nHonoraires: 30 % HT','',33100,'oui','oui'),(68,'Le B. Retail Park',121,0,'A LOUER, en exclusivité, sur la commune de Le Barp, 3715 m2 de surfaces commerciales.\r\nA proximité des supermarchés SUPER U et LEADER PRICE\r\nLivraison second semestre 2022, loyer annuel 16 000 € HT, LOT C 6a, Bail 6 ans ferme.\r\nHonoraires: 30 % HT','',16000,'oui','oui'),(69,'Le B. Retail Park',121,0,'A LOUER, en exclusivité, sur la commune de Le Barp, 3715 m2 de surfaces commerciales.\r\nA proximité des supermarchés SUPER U et LEADER PRICE\r\nLivraison second semestre 2022, loyer annuel 16 000 € HT, LOT C 6b, Bail 6 ans ferme.\r\nHonoraires: 30 % HT','',16000,'oui','oui'),(70,'Le B. Retail Park',271,0,'A LOUER, en exclusivité, sur la commune de Le Barp, 3715 m2 de surfaces commerciales.\r\nA proximité des supermarchés SUPER U et LEADER PRICE\r\nLivraison second semestre 2022, loyer annuel 32 000 € HT, LOT C 7, Bail 6 ans ferme.\r\nHonoraires: 30 % HT','',32000,'oui','oui'),(71,'Le B. Retail Park',271,0,'A LOUER, en exclusivité, sur la commune de Le Barp, 3715 m2 de surfaces commerciales.\r\nA proximité des supermarchés SUPER U et LEADER PRICE\r\nLivraison second semestre 2022, loyer annuel 36 000 € HT, LOT C 8, Bail 6 ans ferme.\r\nHonoraires: 30 % HT','',36000,'oui','oui'),(72,'Le B. Retail Park',348,0,'A LOUER, en exclusivité, sur la commune de Le Barp, 3715 m2 de surfaces commerciales.\r\nA proximité des supermarchés SUPER U et LEADER PRICE\r\nLivraison second semestre 2022, loyer annuel 45 000 € HT, LOT C 9, Bail 6 ans ferme.\r\nHonoraires: 30 % HT','',45000,'oui','oui');
/*!40000 ALTER TABLE `offre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offre_image`
--

DROP TABLE IF EXISTS `offre_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offre_image` (
  `num_image` int(11) NOT NULL AUTO_INCREMENT,
  `num_offre` int(11) NOT NULL,
  `fichier` varchar(100) NOT NULL,
  `defaut` enum('oui','non') NOT NULL DEFAULT 'non',
  PRIMARY KEY (`num_image`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offre_image`
--

LOCK TABLES `offre_image` WRITE;
/*!40000 ALTER TABLE `offre_image` DISABLE KEYS */;
INSERT INTO `offre_image` VALUES (95,16,'/Capture_d_cran_2018_04_04_16..56-16.png','oui'),(109,38,'/2018.11.05 - le barp 01 final-38.jpg','oui'),(120,38,'/EXTRAIT_IMAGE_1-38.png','non'),(131,52,'/Diapositive1-52.jpg','oui'),(137,64,'/2018.11.05 - le barp 01 final-64.jpg','non'),(138,65,'/2018.11.05 - le barp 01 final-65.jpg','non'),(139,66,'/2018.11.05 - le barp 01 final-66.jpg','non'),(140,67,'/2018.11.05 - le barp 01 final-67.jpg','non'),(141,68,'/2018.11.05 - le barp 01 final-68.jpg','non'),(142,69,'/2018.11.05 - le barp 01 final-69.jpg','non'),(143,70,'/2018.11.05 - le barp 01 final-70.jpg','non'),(144,71,'/2018.11.05 - le barp 01 final-71.jpg','non'),(145,72,'/2018.11.05 - le barp 01 final-72.jpg','non');
/*!40000 ALTER TABLE `offre_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offre_type_bien`
--

DROP TABLE IF EXISTS `offre_type_bien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offre_type_bien` (
  `num_offre` int(11) NOT NULL,
  `num_type_bien` int(11) NOT NULL,
  PRIMARY KEY (`num_offre`,`num_type_bien`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offre_type_bien`
--

LOCK TABLES `offre_type_bien` WRITE;
/*!40000 ALTER TABLE `offre_type_bien` DISABLE KEYS */;
INSERT INTO `offre_type_bien` VALUES (1,1),(2,1),(4,2),(5,3),(6,3),(7,3),(8,3),(9,3),(10,2),(11,2),(12,1),(13,2),(15,2),(16,2),(16,3),(20,3),(22,1),(23,2),(24,2),(24,3),(25,2),(25,3),(26,2),(27,1),(28,1),(29,2),(30,2),(31,3),(32,3),(33,2),(34,2),(35,2),(36,2),(37,3),(38,1),(39,1),(40,2),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,2),(50,1),(51,1),(52,1),(53,2),(54,2),(55,1),(56,2),(57,2),(58,2),(59,2),(60,2),(61,2),(62,2),(63,2),(64,1),(65,1),(66,1),(67,1),(68,1),(69,1),(70,1),(71,1),(72,1);
/*!40000 ALTER TABLE `offre_type_bien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planning`
--

DROP TABLE IF EXISTS `planning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planning` (
  `id` tinyint(4) NOT NULL,
  `titre` varchar(250) DEFAULT NULL,
  `url` varchar(250) NOT NULL,
  `pdf` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planning`
--

LOCK TABLES `planning` WRITE;
/*!40000 ALTER TABLE `planning` DISABLE KEYS */;
INSERT INTO `planning` VALUES (1,'Période 2014 - 2015','','/Bon_de_commandeV2-20150223.pdf');
/*!40000 ALTER TABLE `planning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(250) DEFAULT NULL,
  `prix` decimal(10,2) DEFAULT NULL,
  `libprix` varchar(120) DEFAULT NULL,
  `label` varchar(250) NOT NULL,
  `titreaccroche` varchar(250) DEFAULT NULL,
  `accroche` text,
  `description` text,
  `image1` varchar(250) DEFAULT NULL,
  `image2` varchar(250) DEFAULT NULL,
  `image3` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (29,'2587',25.80,'€','Vitamine C 500mg','Les conseils','Produit entièrement naturel, 500mg de vitamine C par comprimé, à croquer','Vitamine C 500 mg cynorrhodon','/DSC00145-29.jpg','',''),(30,'Dermaclay',0.00,'€','Gamme Dermaclay','Dermaclay','Gamme complète : crème de jour, de nuit, pour le corps et les cheveux. Alors qu\' Ecocert n\'oblige qu\'à 10% d\'ingrédients bio dans la cosmétique, Dermaclay propose des produits allant jusqu\'à 86% d\'ingrédients bio.','','/DSC00945 - Copy 1-.jpg','',''),(31,'Les Sens des fleurs',0.00,'€','Gamme Les Sens des fleurs','Les Sens des fleurs','Ligne visage et corps, cosmétique bio qui contient un minimum de 45% d\'ingrédients bio. Elle contient des fleurs de Bach qui font de cette gamme un véritable soin et vous permet de réaliser à quel point vous êtes magnifiques !','','/DSC00937-.jpg','',''),(33,'Calendula',0.00,'€','Gamme Calendula','Calendula','Ligne visage et corps aux extraits de calendula (souci), d\'huile de germe de blé, de jojoba et d\'amande douce. Elle convient à tous les types de peau, agréable et généreuse.','','/DSC00925-.jpg','',''),(34,'Karéthic',0.00,'€','Gamme Karéthic ','Karéthic','Des produits au véritable beurre de karité, garanti non raffiné, 100% beurre de karité.','','/DSC00957-.jpg','',''),(35,'Produits frais disponible en magasin',0.00,'€','Légumes','Légumes','','','/DSC00229_2_-.jpg','/DSC00360-.jpg',''),(36,'Fruits de saison disponible en magasin',0.00,'€','Fruits','Fruits','','','/DSC00355_2_-.jpg','/DSC00228_2_-.jpg',''),(37,'Pains disponibles en magasin',0.00,'€','Pains','Les + produit','Pains au levain, complets. Pain de seigle, kamut, petit épeautre, sésame et/ou avec des graines','','/DSC00226_2_-.jpg','',''),(38,'Pains disponibles en magasin',8.50,'€','Pains Montignac ','Gamme Montignac sur commande','Pain intégral moulé ou miche, en 1kg, dont l\'index glycémique est très bas.\r\nPain sur commande.\r\nPossibilité de le trancher.','','/DSC00453-.jpg','/DSC00449_2_ - Copy 2-.jpg',''),(39,'Biscuits en vrac disponible en magasin',0.00,'€','Biscuits','Biscuits','Croc en figue, granola, citron amandes, nougatine, sablés framboise ....','','/DSC00342_2_-.jpg','',''),(40,'2009',26.70,'€','Vitamine C 1000mg','Les conseils','Vitamine complètement naturelle, 1gr de vitamine C par comprimé, facilement sécable','','/DSC00144-.jpg','',''),(42,'Propolia',0.00,'€','Propolia','Les + produit','','GAMME PROPOLIA à base de propolis et miel','/DSC00158-.jpg','',''),(44,'3826',46.95,'€','ALOE ARBORESCENS','Les conseils','Détoxifiant, reminéralisant et reconstituant. L\'aloe arborescens contient plus de 160 composants. C\'est une plane adaptogène dont l\'action est bénéfique sur le système immunitaire et la restauration de l\'ensemble des métabolismes.','','/DSC00146-.jpg','',''),(45,'3922',23.00,'€','Cuivre Or Argent','Les conseils','Oligo-éléments ionisés sur base d\'argent colloïdal. Renforce le système immunitaire.','','/DSC00147-.jpg','',''),(47,'3441',37.90,'€','Saccharomyces Boulardii','Les conseils','Levure dosée à 300mg/gélules. Régénère et apaise le colon irrité, fragile, traitement des muqueuses intestinales, maladie de Crohn ...','','/DSC00150-.jpg','',''),(48,'3674',27.90,'€','SILICIUM BIOGENIQUE','Les conseils','Silicium organique sur base de diatomées marines + curcuma + bromélaïne + glucosamine. Améliore la mobilité et flexibilité de vos articulations. En comprimés.','','/DSC00157-.jpg','',''),(49,'3281',9.40,'€','GAULTHERIE','Les conseils','Cette huile essentielle est anti-inflammatoire, elle apaise les douleurs et chauffe localement le muscle. Elle s\'utilise en synergie avec l\'huile macérée d\'arnica ou de millepertuis. (en massage local). ','','/DSC00214-.jpg','',''),(50,'3501',9.60,'€','LAVANDE ASPIC','Les conseils','Cette huile essentielle est antivenin et antitoxique, c\'est un excellent fongicide (antichampignon) et un cicatrisant exceptionnel.\r\nA utiliser en cas de morsures, piqûres ou pour soigner la plupart des problèmes dermatologiques : mycoses, crevasses, psoriasis ...','','/DSC00216-.jpg','',''),(51,'3568',9.60,'€','PALMAROSA','Les conseils','Cette huile essentielle est un déodorant formidable. Elle remplace haut la main n\'importe quel déodorant, même les plus puissant, son activité dure largement toute la journée, même en été, une seule goutte à étaler sous chaque aisselle le matin et vous êtes tranquille !! (pensez cependant à vous laver les mains par la suite)','','/DSC00217-.jpg','',''),(52,'3594',32.90,'€','HELICHRYSE ITALIENNE ou immortelle','Les conseils','Cette huile essentielle est antihématome (bleus), le plus puissant actuellement connu. Elle possède une remarquable action antiphlébite, fibrinolytique (elle détruit les caillots sanguins) et est tonique de la circulation artérielle. En massage sur les zones douloureuses ou sur les jambes pour favoriser le retour veineux.','','/DSC00215-.jpg','',''),(53,'4032',4.30,'€','HYSOPE OFFICINALIS','Les conseils','C\'est une plante expectorante, une des plus puissante. Si vous souffrez d\'encombrement elle vous fera le plus grand bien.\r\n3 fois par jour à raison de 20 grammes de plante par litre d\'eau.','','/DSC00219-.jpg','',''),(54,'3425',4.41,'€','ANGELIQUE SEMENCE','Les conseils','La graine (semence) est excellente pour tonifier le système digestif alors que la racine est très puissante pour fortifier le système nerveux. Elle améliore donc la récupération de l\'organisme et les fonctions digestives.','','/DSC00220-.jpg','',''),(55,'1342',4.26,'€','TISANE DRAINANTE DU FOIE','Les conseils','Mélange de pissenlit, romarin, camomille matricaire, chardon marie, chicorée, artichaut, gentiane.\r\nEn infusion ou décoction, un peu amère mais efficace.','','/DSC00221-.jpg','',''),(56,'3798',6.72,'€','DESMODIUM (adscendens)','Les conseils','Cette plante a des propriétés hépato-protectrice. Elle favorise l\'élimination des déchets médicamenteux ou toxiniques issus de la destruction des cellules par une chimiothérapie par exemple, ainsi que les métaux lourds. Elle fortifie en même temps l\'immunité  car diminue l\'inflammation. Il est donc conseillé de la prendre durant un jeûne ou une diète.','','/DSC00222-.jpg','',''),(57,'2297',3.62,'€','MELISSE','Les conseils','Cette plante est tonique du système nerveux et apaise les douleurs spasmodiques. La mélisse décontracte l\'estomac, stimule les sécrétions biliaires et évite les ralentissement de transit dûs au stress. Elle est à la fois tonique tout en étant sédative.','','/DSC00223-.jpg','',''),(58,'1341',4.65,'€','TISANE DIGESTIVE','Les conseils','C\'est un mélange d\'anis vert, verveine, mélisse, badiane et guimauve. A consommer après chaque repas en tisane ou décoction.','','/DSC00224-.jpg','',''),(59,'4118',8.45,'€','ELIXIR DE SECOURS  N°39','Les conseils','Il est constitué de 5 élixirs floraux : Hélianthème, Dame de onze heure, Impatiente, Prunus et Clématite. Il permet de gérer les chocs émotionnels importants (accident, examens, frayeurs ...)\r\n\r\n','','/DSC00249-.jpg','',''),(60,'00000',6.60,'€','Tous les autres élixirs (ou N°) sont disponibles','Les conseils','38 remèdes floraux qui répondent à des états négatifs et qui peuvent jouer un rôle de soutien non négligeable dans le cas de déséquilibres externes et /ou internes pour maintenir la personne dans un état psychique harmonieux.','','/DSC00250-.jpg','',''),(61,'3359',12.69,'€','SIROP A LA PROPOLIS','Les conseils','Le sirop aide à stimuler les défenses naturelles de l\'organisme et contribue ainsi à rester en bonne forme durant la période hivernale. de plus il aide à respirer plus librement et adoucit la gorge. Ainsi, il exerce une action positive sur l\'ensemble du système ORL.','','/DSC00255-61.jpg','',''),(62,'3355',12.23,'€','EXTRAIT DE PROPOLIS','Les conseils','Il renforce le système de défenses naturelles de l\'organisme. La propolis possède des propriétés immunologique, anti-oxydante et anti-inflammatoire.','','/DSC00256-62.jpg','',''),(63,'3354',24.37,'€','AMPOULE PROPOLIS    IMMUNO +','Les conseils','C\'est une préparation buvable concentrée à base d\'échinacée, d\'extrait de propolis, de gelée royale, d\'acérola et de vitamine C.\r\nC\'est une cure de 20 ampoules qui favorise le tonus et qui stimule le système immunitaire.','','/DSC00257-.jpg','','');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_categorie`
--

DROP TABLE IF EXISTS `product_categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_categorie` (
  `id_product` int(11) NOT NULL,
  `id_categorie` int(11) NOT NULL,
  PRIMARY KEY (`id_product`,`id_categorie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_categorie`
--

LOCK TABLES `product_categorie` WRITE;
/*!40000 ALTER TABLE `product_categorie` DISABLE KEYS */;
INSERT INTO `product_categorie` VALUES (29,37),(30,39),(31,39),(33,39),(34,39),(35,40),(36,40),(37,13),(38,13),(39,13),(40,37),(42,39),(44,37),(45,37),(47,37),(48,37),(49,1),(50,1),(51,1),(52,1),(53,4),(54,4),(55,4),(56,4),(57,4),(58,4),(59,35),(60,35),(61,36),(62,36),(63,36);
/*!40000 ALTER TABLE `product_categorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_bien`
--

DROP TABLE IF EXISTS `type_bien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_bien` (
  `num_type_bien` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(30) NOT NULL,
  PRIMARY KEY (`num_type_bien`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_bien`
--

LOCK TABLES `type_bien` WRITE;
/*!40000 ALTER TABLE `type_bien` DISABLE KEYS */;
INSERT INTO `type_bien` VALUES (1,'A la location'),(2,'A la vente'),(3,'Spéciales investisseurs');
/*!40000 ALTER TABLE `type_bien` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-24 19:19:25
