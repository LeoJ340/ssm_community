/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 8.0.16 : Database - ssm_community
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ssm_community` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `ssm_community`;

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invitation_id` int(11) NOT NULL,
  `cin_id` int(11) DEFAULT NULL COMMENT '在哪一个评论下',
  `cfor_id` int(11) DEFAULT NULL COMMENT '上级评论',
  `user_id` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `content` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `comment` */

insert  into `comment`(`id`,`invitation_id`,`cin_id`,`cfor_id`,`user_id`,`time`,`content`) values (1,1,NULL,NULL,1,'2019-08-18 23:06:17','<p>第一条评论</p>'),(2,1,NULL,NULL,1,'2019-08-19 11:13:11','<p>第二条评论</p>'),(3,1,1,1,2,'2019-08-19 11:13:55','上去'),(4,1,1,3,3,'2019-08-19 11:14:21','+1'),(5,1,1,1,4,'2019-08-19 14:35:47','+1'),(6,1,NULL,NULL,5,'2019-08-23 03:24:42','<p>第三条评论</p>'),(7,1,NULL,NULL,5,'2019-08-23 03:27:35','<p>第四条评论</p>'),(8,1,1,5,5,'2019-08-23 05:21:43','嘿 马六'),(9,1,7,7,5,'2019-08-23 05:24:05','测试'),(10,10,NULL,NULL,5,'2019-08-23 06:05:23','<p>第五条评论</p>'),(11,6,7,7,5,'2019-08-23 06:07:24','测试'),(12,1,1,8,1,'2019-09-26 14:25:49','test'),(13,1,1,12,1,'2019-09-26 14:26:15','test1');

/*Table structure for table `community` */

DROP TABLE IF EXISTS `community`;

CREATE TABLE `community` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) NOT NULL,
  `introduction` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `community` */

insert  into `community`(`id`,`name`,`introduction`) values (1,'足球','世界第一运动'),(2,'巴塞罗那','més que un club'),(3,'曼城','Pride in Battle'),(4,'Java','面向对象编程语言'),(5,'C','面向过程编程'),(6,'C++',''),(7,'Python','人工智能、机器算法');

/*Table structure for table `invitation` */

DROP TABLE IF EXISTS `invitation`;

CREATE TABLE `invitation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `community_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `time` datetime NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `invitation` */

insert  into `invitation`(`id`,`community_id`,`user_id`,`title`,`time`,`content`) values (1,1,1,'艾克森入籍中国会给中国带来什么改变？','2019-08-17 16:37:54',''),(2,1,1,'足球为什么是世界第一运动？','2019-08-17 16:38:35',''),(3,2,1,'c罗','2019-08-17 16:44:57',''),(4,2,1,'梅西','2019-08-17 16:46:24',''),(5,2,1,'内马尔是否是巴萨目前必须买下的','2019-11-01 16:46:38',''),(6,3,1,'如何看待VAR','2019-08-18 21:43:52',''),(7,4,1,'Java是世界上最好的语言','2019-08-18 21:44:36',''),(8,4,5,'Java零基础个人学习路线总结','2019-08-20 00:00:00',''),(9,5,2,'测试标题','2019-08-23 02:57:28',''),(10,3,5,'新赛季看曼城什么？','2019-08-23 03:01:30',''),(11,5,2,'测试标题','2019-08-23 03:30:33',''),(12,6,5,'C++','2019-08-23 07:51:10','<p>C++</p>');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(16) NOT NULL,
  `birthday` date NOT NULL,
  `email` varchar(32) NOT NULL,
  `tel_number` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`birthday`,`email`,`tel_number`) values (1,'Leo','340','2019-08-20','com','111'),(2,'球王梅西','456','2019-08-20','com','555'),(3,'王五','555','2019-08-20','com','555'),(4,'马六','666','2019-08-20','com','666'),(5,'superadmin','5555555','2019-08-15','email@qq.com','654654');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
