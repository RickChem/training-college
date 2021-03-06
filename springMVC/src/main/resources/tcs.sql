DROP TABLE IF EXISTS `tb_student`;
CREATE TABLE `tb_student`(
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) DEFAULT NULL,
  `phone` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) DEFAULT NULL,
  `card_id` INT(11) NOT NULL,
  `card_state` TINYINT DEFAULT 0,
  `card_balance` DOUBLE DEFAULT 0,
  `card_score` INT(11) DEFAULT 0,
  `card_level` INT(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS tb_organization;
CREATE TABLE `tb_orgnization` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `org_name` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) DEFAULT NULL,
  `phone` INT(11) NOT NULL,
  `card_id` INT(11) NOT NULL,
  `card_balance` DOUBLE DEFAULT 0,
  PRIMARY KEY (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tb_std_charge`;
CREATE TABLE `tb_std_charge` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `std_id` INT(11) NOT NULL,
  `asd` BOOLEAN DEFAULT TRUE,
  `money` DOUBLE NOT NULL,
  `time` VARCHAR(255) NOT NULL,
  `op` VARCHAR(255) NOT NULL,
  `op_type` INT(11) NOT NULL,
  `state` TINYINT NOT NULL,
  CONSTRAINT `tb_std_charge_ibfk_1` FOREIGN KEY (`std_id`) REFERENCES `tb_student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tb_org_financial`;
CREATE TABLE `tb_org_financial` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `org_id` INT(11) NOT NULL,
  `asd` BOOLEAN DEFAULT TRUE,
  `money` DOUBLE NOT NULL,
  `time` VARCHAR(255) NOT NULL,
  `op` VARCHAR(255) NOT NULL,
  `op_type` INT(11) NOT NULL,
  `state` TINYINT NOT NULL,
  CONSTRAINT `tb_org_financial_ibfk_1` FOREIGN KEY (`org_id`) REFERENCES tb_organization (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tb_course`;
CREATE TABLE `tb_course` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `org_id` INT(11) NOT NULL,
  `teacher` VARCHAR(255) NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `content` VARCHAR(255) DEFAULT NULL,
  `time` VARCHAR(255) NOT NULL,
  `price` DOUBLE NOT NULL,
  `state` TINYINT NOT NULL,
  `period` INT(11) NOT NULL,
  CONSTRAINT `tb_course_ibfk_1` FOREIGN KEY (`org_id`) REFERENCES tb_organization (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tb_study`;
CREATE TABLE `tb_study` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `std_id` INT(11) NOT NULL,
  `course_id` INT(11) NOT NULL,
  `score` INT(11) DEFAULT -1,
  `state` TINYINT NOT NULL,
  CONSTRAINT `tb_study_ibfk_1` FOREIGN KEY (`std_id`) REFERENCES `tb_student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_study_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `tb_course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tb_platform`;
CREATE TABLE `tb_platform` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `admin_name` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `balance` DOUBLE DEFAULT 0,
  PRIMARY KEY (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tb_study_period`;
CREATE TABLE `tb_study_period` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `study_id` INT(11) NOT NULL,
  `period` INT(11) NOT NULL,
  `state` TINYINT DEFAULT 0,
  `message` VARCHAR(255) DEFAULT NULL,
  CONSTRAINT `tb_study_period_ibfk_1` FOREIGN KEY (`study_id`) REFERENCES `tb_study` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`(
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(255) NOT NULL,
  `cid` INT(11) NOT NULL,
  `state` TINYINT DEFAULT 1,
  `score` INTEGER DEFAULT 0,
  CONSTRAINT `tb_user_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `tb_course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20000 DEFAULT CHARSET=utf8;