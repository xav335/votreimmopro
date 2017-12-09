-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: votreimmopro
-- ------------------------------------------------------
-- Server version	5.5.44-0+deb8u1

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
INSERT INTO `admin` VALUES (1,'immo','immo33','administrateur'),(2,'admin','admin335','ico');
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (10,'','','xavier@braillard.fr',NULL,'',1,0,0),(11,'','','xavier@braillard.com',NULL,'',1,0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (30,'2016-04-19 00:00:00','MIRAGE expérience','','Entre Bordeaux et le Bassin, MIRAGE expérience  le must du diner spectacle, pourra accueillir 1000 personnes, \r\nOuverture prévue second semestre 2018','/Logo_Texte_mirage_jpeg-30.jpg',1),(31,'2016-10-18 00:00:00','SPECIAL INVESTISSEUR','','Nous vous proposons de nombreux produits de 500 K€ à 14 000 K€, générant des rendements attractifs.','/1-.jpg',1),(32,'2017-06-23 00:00:00','Le B. Retail Park','','En exclusivité, sur la commune de Le Barp, 3715 m2 de surfaces commerciales divisibles à partir de 175 m2.\r\nA proximité des supermarchés SUPER U et LEADER PRICE\r\nLivraison 1 er trimestre 2019\r\n','/17.06.14 - le barp - le b rétail park - perspective 2-.jpg',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offre`
--

LOCK TABLES `offre` WRITE;
/*!40000 ALTER TABLE `offre` DISABLE KEYS */;
INSERT INTO `offre` VALUES (16,'BUREAUX DIVISIBLES',60,0,'Bureaux entièrement cloisonnés d\'une surface de 60 m2 au rez de chaussée d\'un immeuble tertiaire situé à Artigues près Bordeaux.\r\nEtat impeccable, libre de suite.\r\n honoraires inclus\r\n06.35.33.63.26','',129000,'oui','oui'),(27,'BATIMENT D\'ACTIVITE',120,0,'A LOUER, 1000 m2 de locaux d\'activité divisible à partir de 120 m2.\r\nNombreux parkings, accès camions\r\nSitué sur un axe routier très fréquenté Bordeaux-Lyon.\r\nPossibilité bail précaire - Entreprise en création acceptée.\r\nLoyer de 55 € HT à 80 € HT le m2 par an en fonction de la surface.','',550,'oui','oui'),(33,'Ensemble immobilier atypique sur BORDEAUX',2200,0,'Superbe appartement sur les toits de Bordeaux offrant une surface de 146 m2 entièrement rénové, bénéficiant d\'une terrasse de 600 m2 aménagée.\r\nAscenseur privatif.\r\nL\'ensemble dispose de 70 places de parking, (sous sol et rez de chaussée)','',2100000,'oui','oui'),(34,'LE CLOS DE LESPARRA',80,0,'Le Clos de Lesparra, résidence au coeur de la commune de Lesparre, comprenant 10 maisons T3 et T4 avec terrasse, garage, jardin, livrée avec sa cuisine équipée.','',229246,'oui','oui'),(35,'IMMEUBLE RIVE DROITE',450,0,'Ensemble immobilier située rive droite, ZFU, proche du tram, sur un terrain de plus de 750 m2 avec parking.','',370000,'oui','non'),(36,'Propriété sur le Bassin',520,0,'Nichée, au cœur d’une forêt de Chênes de Bouleaux et de Noyers, dans un écrin de verdure à 8 km d’Arcachon, de la dune du Pyla, et des plages océanes, découvrez cette magnifique propriété de plus de 500 m2 habitable implantée sur un foncier de 7,5 ha.\r\nPropriété rare sur le bassin, compte tenu de la surface et des prestations. ?','',2250000,'oui','oui'),(37,'Ensemble immobilier à ODOS (TARBES)',3100,0,'Ensemble immobilier commercial entièrement rénové, y compris toiture, 4 locataires.\r\nFrais de notaire réduit.','',2813600,'oui','oui'),(38,'Le B. Retail Park',250,0,'En exclusivité, sur la commune de Le Barp, 3715 m2 de surfaces commerciales divisibles à partir de 175 m2.\r\nA proximité des supermarchés SUPER U et LEADER PRICE\r\nLivraison 1 er trimestre 2019','/17.06.07 - park event - pdv local 1-38.pdf',288750,'oui','oui');
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
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offre_image`
--

LOCK TABLES `offre_image` WRITE;
/*!40000 ALTER TABLE `offre_image` DISABLE KEYS */;
INSERT INTO `offre_image` VALUES (69,27,'/thumb_IMG_5561_1024-27.jpg','oui'),(78,16,'/Photo_bureaux-16.jpg','oui'),(84,33,'/thumb_IMG_5909_1024-33.jpg','oui'),(85,34,'/2016.07.05 - lesparre interieur - copie-34.jpg','oui'),(86,34,'/2016.07.05 - lesparre 02 jardin fond - copie-34.jpg','non'),(87,35,'/thumb_IMG_5867_1024-35.jpg','non'),(88,35,'/thumb_IMG_5878_1024-35.jpg','oui'),(89,36,'/DSC_0044-36.jpg','oui'),(90,36,'/DSC_0046-36.jpg','non'),(91,36,'/DSC_0052-36.jpg','non'),(92,37,'/161021IMAGEPROJET_1-37.jpg','oui'),(93,38,'/17.06.14 - le barp - le b rétail park - perspective 2-38.jpg','oui');
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
INSERT INTO `offre_type_bien` VALUES (1,1),(2,1),(4,2),(5,3),(6,3),(7,3),(8,3),(9,3),(10,2),(11,2),(12,1),(13,2),(15,2),(16,2),(20,3),(22,1),(23,2),(24,2),(24,3),(25,2),(25,3),(26,2),(27,1),(28,1),(29,2),(30,2),(31,3),(32,3),(33,2),(34,2),(35,2),(36,2),(37,3),(38,2),(39,2);
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

-- Dump completed on 2017-12-09 11:54:14
