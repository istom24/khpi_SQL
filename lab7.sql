-- Adminer 4.8.1 MySQL 5.5.5-10.3.32-MariaDB-1:10.3.32+maria~focal dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `articles` (`id`, `title`, `content`) VALUES
(1,	'Майбутнє освіти: онлайн проти традиційного навчання',	'Дебати між онлайн і традиційними моделями навчання посилились останніми роками, особливо з ростом цифрових технологій...'),
(2,	'Президентські вибори в США 2024: хто здобув перемогу?',	'На президентських виборах 2024 року Дональд Трамп здобув перемогу, повернувшись до влади після перерви...'),
(3,	'Культура в цифрову епоху: нові форми вираження та взаємодії',	'Сучасна культура переживає період значних змін завдяки цифровим технологіям....');

CREATE TABLE `authors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `email` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `password` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `content` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `authors` (`id`, `username`, `email`, `password`, `content`) VALUES
(1,	'tsvetotsek',	'###############@gmail.com',	'password123',	'Письменник, спеціалізується на технологіях, культурі та політиці. '),
(2,	'jane_smith',	'###############@gmail.com',	'password456',	'Літературний критик, досліджує соціальні проблеми.'),
(3,	'alex_jonson',	'###############@gmail.com',	'password789',	'Спортивний журналіст, з особливим акцентом на футбол та політику.'),
(4,	'michael_brown',	'###############@gmail.com',	'password202',	'Історик, експерт з давніх цивілізацій.');

CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `categories` (`id`, `name`) VALUES
(1,	'Політика'),
(2,	'Спорт'),
(3,	'Культура'),
(4,	'Наука'),
(5,	'Освіта');

CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `new_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `creat_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `new_id` (`new_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`new_id`) REFERENCES `news` (`id`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `comments` (`id`, `new_id`, `user_id`, `content`, `creat_at`) VALUES
(7,	1,	1,	'Цікава стаття! Я вважаю, що онлайн навчання дійсно має великі переваги...',	1699323000),
(8,	1,	2,	'Я згоден з вами, але не можна забувати про важливість особистих зустрічей і взаємодії в класі....',	1699334000),
(9,	2,	1,	'Цікава перспектива на вибори 2024 року. ...',	1699335000),
(10,	2,	3,	'Я не згоден з результатами виборів, але вірю, що це тільки початок нових змін для США...',	1699336000),
(11,	3,	2,	'Цифрові технології дійсно змінюють культуру...',	1699337000),
(12,	3,	3,	'Це правда. Віртуальні галереї та інші цифрові форми мистецтва змінюють спосіб сприйняття культури...',	1699338000);

CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) DEFAULT NULL,
  `article` int(11) DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  `pudlic_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `author` (`author`),
  KEY `article` (`article`),
  KEY `category` (`category`),
  CONSTRAINT `news_ibfk_1` FOREIGN KEY (`article`) REFERENCES `articles` (`id`),
  CONSTRAINT `news_ibfk_2` FOREIGN KEY (`category`) REFERENCES `categories` (`id`),
  CONSTRAINT `news_ibfk_3` FOREIGN KEY (`author`) REFERENCES `authors` (`id`),
  CONSTRAINT `news_ibfk_4` FOREIGN KEY (`article`) REFERENCES `articles` (`id`),
  CONSTRAINT `news_ibfk_5` FOREIGN KEY (`category`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `news` (`id`, `category`, `article`, `author`, `pudlic_at`) VALUES
(1,	5,	1,	1,	'2024-11-07 22:05:11'),
(2,	1,	2,	2,	'2024-11-07 22:05:11'),
(3,	3,	3,	3,	'2024-11-07 22:05:11');

CREATE TABLE `ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `new_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `rating` tinyint(3) unsigned NOT NULL CHECK (`rating` between 1 and 5),
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_article` (`user_id`,`new_id`),
  KEY `new_id` (`new_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`new_id`) REFERENCES `news` (`id`),
  CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `ratings` (`id`, `new_id`, `user_id`, `ip_address`, `rating`) VALUES
(10,	1,	1,	'192.168.1.1',	5),
(11,	1,	2,	'192.168.1.2',	4),
(12,	1,	3,	'192.168.1.3',	3),
(13,	2,	1,	'192.168.1.1',	4),
(14,	2,	3,	'192.168.1.3',	5),
(15,	2,	4,	'192.168.1.4',	2),
(16,	3,	2,	'192.168.1.2',	3),
(17,	3,	4,	'192.168.1.4',	4),
(18,	3,	5,	'192.168.1.5',	1);

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `email` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `password` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `users` (`id`, `username`, `email`, `password`) VALUES
(1,	'sky_fox91',	'sky.fox91@example.com',	'password123'),
(2,	'wave_rider2024',	'wave.rider2024@example.com',	'mypassword'),
(3,	'phantom42',	'phantom42@example.com',	'securepass'),
(4,	'pixel_dreamer77',	'pixel.dreamer77@example.com',	'mriyapass'),
(5,	'shadow_hawk88',	'shadow.hawk88@example.com',	'viter789');

-- 2024-11-08 07:52:59
