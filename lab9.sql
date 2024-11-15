SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

CREATE TABLE `files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `task_id` int(11) DEFAULT NULL,
  `link` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  KEY `user_id` (`user_id`),
  KEY `task_id` (`task_id`),
  CONSTRAINT `files_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  CONSTRAINT `files_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `files_ibfk_3` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `files` (`id`, `project_id`, `user_id`, `task_id`, `link`) VALUES
(1,	1,	1,	1,	'https://youtu.be/SR6iYWJxHqs?si=WfTb-gvE0YnpSPW0'),
(2,	1,	2,	2,	'https://www.youtube.com/watch?si=lQIj_0HKhA8ptQ-U&v=tkBAvP85jvc&feature=youtu.be'),
(3,	2,	1,	3,	'https://youtu.be/uGthVEza97U?si=JQtEo-FtApHhiXpp'),
(4,	2,	2,	4,	'https://youtu.be/FVnxKAoFzBg?si=VqbxqVJdd_QzFIeA'),
(5,	3,	5,	5,	'https://youtu.be/3O1_3zBUKM8?si=7GMDf_7cYyovwGQ5'),
(6,	3,	6,	6,	'https://youtu.be/SR6iYWJxHqs?si=WfTb-gvE0YnpSPW0');

CREATE TABLE `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `members` (`id`, `name`, `email`) VALUES
(1,	'Іван Іванов',	'1############@egmail.com'),
(2,	'Марія Петрівна',	'2############@egmail.com'),
(3,	'Олексій Олексійович',	'3############@egmail.com'),
(4,	'Наталія Сидоренко',	'4############@egmail.com'),
(5,	'Дмитро Ковальчук',	'5############@egmail.com');

CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique_name` (`name`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `projects` (`id`, `name`, `description`, `created_at`, `user_id`) VALUES
(1,	'Проект 1',	'Опис першого проекту',	NULL,	1),
(2,	'Проект 2',	'Опис другого проекту',	NULL,	2),
(3,	'Проект 3',	'Опис четвертого проекту',	NULL,	2),
(4,	'Проект 5',	'Опис n+2 проекту',	NULL,	2),
(5,	'Проект 4',	'Опис n проекту',	NULL,	2);

CREATE TABLE `projectusers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11),
  `project_id` int(11),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `projectusers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `projectusers_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `projectusers` (`id`, `user_id`, `project_id`) VALUES
(1,	1,	1),
(2,	2,	1),
(3,	2,	2),
(4,	3,	2),
(5,	3,	3),
(6,	1,	3),
(7,	2,	4),
(8,	3,	4),
(9,	4,	5),
(10,	2,	5);

CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role` (`role`),
  KEY `role_2` (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `roles` (`id`, `role`) VALUES
(4,	'Інші'),
(1,	'Автор'),
(5,	'Гість'),
(3,	'Користувач'),
(2,	'Менеджер проекту');

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  KEY `user_id` (`user_id`),
  KEY `name` (`name`),
  CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  CONSTRAINT `tasks_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `tasks` (`id`, `name`, `description`, `project_id`, `user_id`, `start_date`, `due_date`) VALUES
(1,	'Проектування бази даних',	'Створення та оптимізація структури бази даних',	1,	1,	'2024-11-01',	'2024-11-10'),
(2,	'Розробка фронтенду',	'Розробка інтерфейсу користувача для проекту',	1,	2,	'2024-11-05',	'2024-11-15'),
(3,	'Розробка API бекенду',	'Створення та тестування API для бекенду',	2,	1,	'2024-11-08',	'2024-11-20'),
(4,	'Документація проекту',	'Написання документації до проекту',	2,	2,	'2024-11-01',	'2024-11-15'),
(5,	'Тестування інтерфейсу',	'Проведення тестування інтерфейсу та юзабіліті',	3,	5,	'2024-11-10',	'2024-11-18'),
(6,	'Розширення функціоналу',	'Покращення існуючих функцій проекту',	3,	6,	'2024-11-12',	'2024-11-22'),
(7,	'Виправлення помилок',	'Виявлення та виправлення помилок у проекті',	4,	2,	'2024-11-15',	'2024-11-25'),
(8,	'Підготовка до релізу',	'Підготовка до остаточного релізу',	4,	5,	'2024-11-20',	'2024-11-30'),
(9,	'Розгляд відгуків клієнтів',	'Аналіз відгуків клієнтів і внесення змін',	5,	5,	'2024-11-10',	'2024-11-20'),
(10,	'Технічне обслуговування',	'Підтримка та оновлення проекту за необхідності',	5,	6,	'2024-11-15',	'2024-11-25');

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`),
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `users` (`id`, `member_id`, `role_id`) VALUES
(1,	1,	1),
(2,	2,	2),
(3,	3,	3),
(4,	1,	4),
(5,	1,	1),
(6,	2,	2),
(7,	3,	3),
(8,	1,	4),
(9,	5,	5),
(10,	1,	4);

CREATE TABLE `usertasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11),
  `user_id` int(11),
  PRIMARY KEY (`id`),
  KEY `task_id` (`task_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `usertasks_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`),
  CONSTRAINT `usertasks_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `usertasks` (`id`, `task_id`, `user_id`) VALUES
(1,	1,	1),
(2,	2,	2),
(3,	3,	1),
(4,	4,	2),
(5,	5,	5),
(6,	6,	6),
(7,	7,	2),
(8,	8,	5),
(9,	9,	5),
(10,	10,	6);
