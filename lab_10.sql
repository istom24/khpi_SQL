-- Adminer 4.8.1 MySQL 5.5.5-10.3.32-MariaDB-1:10.3.32+maria~focal dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

CREATE TABLE `connections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `st1_id` int(11) DEFAULT NULL,
  `st2_id` int(11) DEFAULT NULL,
  `connection_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `st1_id` (`st1_id`),
  KEY `st2_id` (`st2_id`),
  CONSTRAINT `connections_ibfk_1` FOREIGN KEY (`st1_id`) REFERENCES `stations` (`id`),
  CONSTRAINT `connections_ibfk_2` FOREIGN KEY (`st2_id`) REFERENCES `stations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `connections` (`id`, `st1_id`, `st2_id`, `connection_type`) VALUES
(1,	2,	2,	'Пересадка'),
(2,	10,	11,	'Пересадка');

CREATE TABLE `lines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `color` varchar(255) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `lines_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `lines` (`id`, `color`, `status_id`) VALUES
(1,	'Червона',	1),
(2,	'Синя',	1),
(3,	'Зелена',	1);

CREATE TABLE `stations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `line_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `line_id` (`line_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `stations_ibfk_1` FOREIGN KEY (`line_id`) REFERENCES `lines` (`id`),
  CONSTRAINT `stations_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `lines` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `stations` (`id`, `name`, `line_id`, `status_id`) VALUES
(1,	'Центральний ринок',	1,	1),
(2,	'Майдан Конституції',	1,	1),
(3,	'Історичний музей',	2,	1),
(4,	'Проспект Гагаріна',	1,	1),
(5,	'Студентська',	2,	1),
(6,	'Академіка Павлова',	2,	1),
(7,	'Академіка Барабашова',	2,	1),
(8,	'Київська',	2,	1),
(9,	'Пушкінська',	2,	1),
(10,	'Університет',	2,	1),
(11,	'Держпром',	3,	1),
(12,	'Архітектора Бекетова',	3,	1),
(13,	'Захисників України',	3,	1),
(14,	'Історичний музей',	3,	1);

CREATE TABLE `station_lines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `station_id` int(11) DEFAULT NULL,
  `line_id` int(11) DEFAULT NULL,
  `process` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `station_id` (`station_id`),
  KEY `line_id` (`line_id`),
  CONSTRAINT `station_lines_ibfk_1` FOREIGN KEY (`station_id`) REFERENCES `stations` (`id`),
  CONSTRAINT `station_lines_ibfk_2` FOREIGN KEY (`line_id`) REFERENCES `lines` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `station_lines` (`id`, `station_id`, `line_id`, `process`) VALUES
(1,	1,	1,	1),
(2,	2,	1,	1),
(3,	3,	2,	1),
(4,	4,	1,	1),
(5,	5,	2,	1),
(6,	6,	2,	1),
(7,	7,	2,	1),
(8,	8,	2,	1),
(9,	9,	2,	1),
(10,	10,	2,	1),
(11,	11,	3,	1),
(12,	12,	3,	1),
(13,	13,	3,	1),
(14,	14,	3,	1);

CREATE TABLE `statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `statuses` (`id`, `name`) VALUES
(1,	'Активний'),
(2,	'Неактивний');

-- 2024-11-23 19:55:28
