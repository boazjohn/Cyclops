-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.54-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema mimto
--

CREATE DATABASE IF NOT EXISTS mimto;
USE mimto;

--
-- Definition of table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `aname` varchar(255) DEFAULT NULL,
  `usrname` varchar(255) DEFAULT NULL,
  `passwd` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` (`id`,`aname`,`usrname`,`passwd`) VALUES 
 (1,'Root Admin','admin','yahoo');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;


--
-- Definition of table `im_link`
--

DROP TABLE IF EXISTS `im_link`;
CREATE TABLE `im_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `link` varchar(2048) DEFAULT NULL,
  `img_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`link_id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `im_link`
--

/*!40000 ALTER TABLE `im_link` DISABLE KEYS */;
INSERT INTO `im_link` (`link_id`,`link`,`img_id`) VALUES 
 (1,'www.audi.com',2),
 (2,'www.audi.co.in',3),
 (3,'www.audi.com',4),
 (4,'lambo.com',5),
 (5,'bmwcars.blog.com',6),
 (6,'www.audi.com',7),
 (7,'gdfgdfg',8),
 (8,'http://www.artcentergallery.com/gallery/michael-godard/mg2007-flower-set.htm',9),
 (9,'http://www.indiauto.in/2010/12/new-audi-r8-in-audi-ahmedabad.html',10),
 (52,'gdfgdfg',346);
/*!40000 ALTER TABLE `im_link` ENABLE KEYS */;


--
-- Definition of table `im_tag`
--

DROP TABLE IF EXISTS `im_tag`;
CREATE TABLE `im_tag` (
  `tag_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(2048) DEFAULT NULL,
  `tag_weight` int(11) DEFAULT NULL,
  `img_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=MyISAM AUTO_INCREMENT=891 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `im_tag`
--

/*!40000 ALTER TABLE `im_tag` DISABLE KEYS */;
INSERT INTO `im_tag` (`tag_id`,`tag`,`tag_weight`,`img_id`) VALUES 
 (1,'flower',1,2),
 (2,'tulip',1,2),
 (3,'yellow',1,2),
 (4,'audi',1,3),
 (5,'car',1,3),
 (6,'silver',1,3),
 (7,'landscape',1,3),
 (8,'audi',1,4),
 (9,'a4',1,4),
 (10,'car',1,4),
 (11,'red',1,4),
 (12,'lamborgini',1,5),
 (13,'logo',1,5),
 (14,'car logo',1,5),
 (15,'bull',1,5),
 (16,'BMW',1,6),
 (17,'red',1,6),
 (18,' 7 series',1,6),
 (19,' expo',1,6),
 (20,'audi',1,7),
 (21,'conceptcar',1,7),
 (22,'red',1,7),
 (23,' 2seater',1,7),
 (24,'gdgdfb',1,8),
 (25,'Chrysanthemum',1,9),
 (26,' flower',1,9),
 (27,' red',1,9),
 (28,'audi',1,10),
 (29,'red',1,10),
 (30,'car',1,10),
 (890,'gdgdfb',1,346);
/*!40000 ALTER TABLE `im_tag` ENABLE KEYS */;


--
-- Definition of table `up_images`
--

DROP TABLE IF EXISTS `up_images`;
CREATE TABLE `up_images` (
  `img_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(1024) DEFAULT NULL,
  `descr` varchar(2048) DEFAULT NULL,
  `other` varchar(1024) DEFAULT NULL,
  `valid` int(11) DEFAULT NULL,
  `fname` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`img_id`)
) ENGINE=MyISAM AUTO_INCREMENT=347 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `up_images`
--

/*!40000 ALTER TABLE `up_images` DISABLE KEYS */;
INSERT INTO `up_images` (`img_id`,`name`,`descr`,`other`,`valid`,`fname`) VALUES 
 (1,'Tulips.jpg','abcd','',1,'1.jpg'),
 (2,'Tulips.jpg','efgh','nothing',1,'2.jpg'),
 (3,'audi1.jpg','audi','Awesome Car',1,'3.jpg'),
 (4,'audi2 (2).jpg','audi red','good car, powerful',1,'4.jpg'),
 (5,'b b bb.jpg','logo','world famous',1,'5.jpg'),
 (6,'206xs16s_1118354033_minibull_1118334772_electric_red.jpg','bmw','auto trans',1,'6.jpg'),
 (7,'2010_audi_r8_v10_live_detroit_image_009.jpg','audi','audi',1,'7.jpg'),
 (8,'red-bmw1.jpg','dsgdfgd','bdbfbd',1,'8.jpg'),
 (9,'Chrysanthemum.jpg','red flowertt','none',1,'9.jpg'),
 (10,'206xs16s_1118354033_minibull_1118334772_electric_red.jpg','Audi','',1,'10.jpg'),
 (346,'Tulips.jpg','dsgdfgd','bdbfbd',1,'11.jpg');
/*!40000 ALTER TABLE `up_images` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
