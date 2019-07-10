-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 10 2019 г., 17:22
-- Версия сервера: 5.7.26
-- Версия PHP: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `wtip`
--

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `is_published` tinyint(1) NOT NULL DEFAULT '0',
  `date_published` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`id`, `title`, `description`, `is_published`, `date_published`) VALUES
(1, 'How to Create MySQL Users Accounts and Grant Privileges\r\n', 'MySQL is the most popular open-source relational database management system. MySQL server allows us to create numerous user accounts and grant appropriate privileges so that users can access and access and manage databases.\r\n\r\nThis tutorial describes how to create MySQL user accounts and grant privileges.\r\n\r\nBefore you Begin\r\nBefore you start with this tutorial, we are assuming that you already have MySQL or MariaDB server installed on your system. If not, you can easily install it by following one of the tutorials below:\r\n\r\nInstall MySQL on CentOS 7, Ubuntu 18.04, Debian 9.\r\nInstall MariaDB on CentOS 7, Ubuntu 18.04, Debian 9\r\nAll commands will be executed inside the MySQL shell as an administrative user (the minimum privileges required to create user accounts and define their privileges is CREATE USER and GRANT) or with a root account.\r\n\r\nTo access the MySQL shell type the following command and enter your MySQL root user password when prompted:', 1, '2019-07-02 12:32:00'),
(2, 'PSR-4: Autoloader\r\n', 'The key words “MUST”, “MUST NOT”, “REQUIRED”, “SHALL”, “SHALL NOT”, “SHOULD”, “SHOULD NOT”, “RECOMMENDED”, “MAY”, and “OPTIONAL” in this document are to be interpreted as described in RFC 2119.\r\n\r\n1. Overview\r\nThis PSR describes a specification for autoloading classes from file paths. It is fully interoperable, and can be used in addition to any other autoloading specification, including PSR-0. This PSR also describes where to place files that will be autoloaded according to the specification.\r\n\r\n2. Specification\r\nThe term “class” refers to classes, interfaces, traits, and other similar structures.\r\n\r\nA fully qualified class name has the following form:\r\n\r\n \\<NamespaceName>(\\<SubNamespaceNames>)*\\<ClassName>\r\nThe fully qualified class name MUST have a top-level namespace name, also known as a “vendor namespace”.\r\n\r\nThe fully qualified class name MAY have one or more sub-namespace names.\r\n\r\nThe fully qualified class name MUST have a terminating class name.\r\n\r\nUnderscores have no special meaning in any portion of the fully qualified class name.\r\n\r\nAlphabetic characters in the fully qualified class name MAY be any combination of lower case and upper case.\r\n\r\nAll class names MUST be referenced in a case-sensitive fashion.\r\n\r\nWhen loading a file that corresponds to a fully qualified class name …\r\n\r\nA contiguous series of one or more leading namespace and sub-namespace names, not including the leading namespace separator, in the fully qualified class name (a “namespace prefix”) corresponds to at least one “base directory”.\r\n\r\nThe contiguous sub-namespace names after the “namespace prefix” correspond to a subdirectory within a “base directory”, in which the namespace separators represent directory separators. The subdirectory name MUST match the case of the sub-namespace names.\r\n\r\nThe terminating class name corresponds to a file name ending in .php. The file name MUST match the case of the terminating class name.\r\n\r\nAutoloader implementations MUST NOT throw exceptions, MUST NOT raise errors of any level, and SHOULD NOT return a value.', 1, '2019-07-01 06:20:19'),
(3, 'Symfony', 'Symfony — свободный фреймворк, написанный на PHP, который использует паттерн Model-View-Controller.\r\n\r\nSymfony предлагает быструю разработку и управление веб-приложениями, позволяет легко решать рутинные задачи веб-программиста. Работает только с PHP 5 и выше. Имеет поддержку множества баз данных (MySQL, PostgreSQL, SQLite или любая другая PDO-совместимая СУБД). Информация о реляционной базе данных в проекте должна быть связана с объектной моделью. Это можно сделать при помощи ORM инструмента. Symfony поставляется с двумя из них: Propel и Doctrine.\r\n\r\nSymfony бесплатен и публикуется под лицензией MIT.\r\n\r\nПроект спонсируется французской компанией Sensio.', 0, '2019-07-19 00:00:00'),
(4, 'The Loop Variable\r\n', 'When looping, a $loop variable will be available inside of your loop. This variable provides access to some useful bits of information such as the current loop index and whether this is the first or last iteration through the loop:\r\n\r\n@foreach ($users as $user)\r\n    @if ($loop->first)\r\n        This is the first iteration.\r\n    @endif\r\n\r\n    @if ($loop->last)\r\n        This is the last iteration.\r\n    @endif\r\n\r\n    <p>This is user {{ $user->id }}</p>\r\n@endforeach', 1, '2019-07-03 07:20:28'),
(5, 'CSRF Field\r\n', 'Anytime you define an HTML form in your application, you should include a hidden CSRF token field in the form so that the CSRF protection middleware can validate the request. You may use the @csrf Blade directive to generate the token field:\r\n\r\n<form method=\"POST\" action=\"/profile\">\r\n    @csrf\r\n\r\n    ...\r\n</form>', 1, '2019-07-07 10:25:15');

-- --------------------------------------------------------

--
-- Структура таблицы `news_authors`
--

DROP TABLE IF EXISTS `news_authors`;
CREATE TABLE IF NOT EXISTS `news_authors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `news_id` (`news_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `news_authors`
--

INSERT INTO `news_authors` (`id`, `news_id`, `user_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 4, 2),
(4, 5, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`) VALUES
(1, 'alexey'),
(2, 'devid');

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `news_authors`
--
ALTER TABLE `news_authors`
  ADD CONSTRAINT `news_authors_ibfk_1` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `news_authors_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
