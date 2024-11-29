-- Adminer 4.8.1 MySQL 5.5.5-10.3.32-MariaDB-1:10.3.32+maria~focal dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

CREATE TABLE `connections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `st1_id` int(11) NOT NULL,
  `st2_id` int(11) NOT NULL,
  `connection_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `st1_id` (`st1_id`),
  KEY `st2_id` (`st2_id`),
  CONSTRAINT `connections_ibfk_1` FOREIGN KEY (`st1_id`) REFERENCES `stations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `connections_ibfk_2` FOREIGN KEY (`st2_id`) REFERENCES `stations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `connections` (`id`, `st1_id`, `st2_id`, `connection_type`) VALUES
(1,	2,	2,	'Пересадка'),
(2,	10,	11,	'Пересадка'),
(3,	1,	2,	'Линия'),
(4,	1,	4,	'Линия'),
(5,	2,	4,	'Линия'),
(6,	3,	5,	'Линия'),
(7,	3,	6,	'Линия'),
(8,	3,	7,	'Линия'),
(9,	3,	8,	'Линия'),
(10,	3,	9,	'Линия'),
(11,	3,	10,	'Линия'),
(12,	5,	6,	'Линия'),
(13,	5,	7,	'Линия'),
(14,	5,	8,	'Линия'),
(15,	5,	9,	'Линия'),
(16,	5,	10,	'Линия'),
(17,	6,	7,	'Линия'),
(18,	6,	8,	'Линия'),
(19,	6,	9,	'Линия'),
(20,	6,	10,	'Линия'),
(21,	7,	8,	'Линия'),
(22,	7,	9,	'Линия'),
(23,	7,	10,	'Линия'),
(24,	8,	9,	'Линия'),
(25,	8,	10,	'Линия'),
(26,	9,	10,	'Линия'),
(27,	11,	12,	'Линия'),
(28,	11,	13,	'Линия'),
(29,	11,	14,	'Линия'),
(30,	12,	13,	'Линия'),
(31,	12,	14,	'Линия'),
(32,	13,	14,	'Линия');

CREATE TABLE `lines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `color` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `lines_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `lines` (`id`, `color`, `status_id`) VALUES
(1,	'Червона',	1),
(2,	'Синя',	1),
(3,	'Зелена',	1);

CREATE TABLE `stations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `line_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `num_stations` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `line_id` (`line_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `stations_ibfk_1` FOREIGN KEY (`line_id`) REFERENCES `lines` (`id`) ON DELETE SET NULL,
  CONSTRAINT `stations_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `stations` (`id`, `name`, `line_id`, `status_id`, `num_stations`) VALUES
(1,	'Центральний ринок',	1,	1,	1),
(2,	'Майдан Конституції',	1,	1,	2),
(3,	'Історичний музей',	2,	1,	1),
(4,	'Проспект Гагаріна',	1,	1,	3),
(5,	'Студентська',	2,	1,	2),
(6,	'Академіка Павлова',	2,	1,	3),
(7,	'Академіка Барабашова',	2,	1,	4),
(8,	'Київська',	2,	1,	5),
(9,	'Пушкінська',	2,	1,	6),
(10,	'Університет',	2,	1,	7),
(11,	'Держпром',	3,	1,	1),
(12,	'Архітектора Бекетова',	3,	1,	2),
(13,	'Захисників України',	3,	1,	3),
(14,	'Історичний музей',	3,	1,	4);

CREATE TABLE `statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `statuses` (`id`, `name`) VALUES
(1,	'Активний'),
(2,	'Неактивний');

-- 2024-11-29 07:13:46
