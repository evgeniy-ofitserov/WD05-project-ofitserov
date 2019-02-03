-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 03 2019 г., 15:00
-- Версия сервера: 5.6.38
-- Версия PHP: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `wd05-project-ofitserov`
--

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `subname` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `city` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `country` varchar(155) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `avatar` varchar(150) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `avatar_small` varchar(150) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `recovery_code` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `recovery_code_times` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `role`, `name`, `subname`, `city`, `country`, `avatar`, `avatar_small`, `recovery_code`, `recovery_code_times`) VALUES
(11, 'root@mail.ru', '$2y$10$517HDBbDgrN.MVCqMlV9RuEiYaaAit2uAV.jxvbpHeRXPDMd8xuk6', 'admin', 'Евгений', 'Офицеров', 'Москва', 'Россия', '-256718348.jpg', 'size48x48--256718348.jpg', 'Kf8ceU2v31EBbCl', 3),
(12, 'mala@yandex.ru', '$2y$10$jxYhSb6e9FZG0yyHo2h6EupxlS1PcOb2ZR8e9HRqAbsJRarLrc6GW', 'user', 'Джейсон', 'Стетхем', 'Честер', 'Англия', '599035442.jpg', 'size48x48-599035442.jpg', 'BzAlLURZy9r7S1M', 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
