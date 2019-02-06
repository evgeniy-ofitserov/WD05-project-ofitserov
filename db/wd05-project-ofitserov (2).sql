-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 06 2019 г., 21:46
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
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `text` text COLLATE utf8mb4_unicode_520_ci,
  `date` int(11) UNSIGNED DEFAULT NULL,
  `author_id` int(11) UNSIGNED DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `data_time` datetime DEFAULT NULL,
  `post_img` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `post_img_small` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `title`, `text`, `date`, `author_id`, `date_time`, `data_time`, `post_img`, `post_img_small`) VALUES
(9, 'Что такое PHP?', 'PHP: Hypertext Preprocessor (Препроцессор Гипертекста) — это серверный язык программирования, созданный специально для web-разработки. PHP — один из самых популярных языков программирования, используемых при разработке сайтов и web-приложений. Его преимуществом перед другими языками является возможность внедрения PHP-кода непосредственно в HTML.', NULL, 3, NULL, '2019-02-06 11:03:19', '568209838.jpg', '320-568209838.jpg'),
(10, 'MySQL - это просто!', 'Сначала ответим на вопрос — что такое MySQL? Это База Данных (БД), в которой структурировано хранятся данные. Следует второй вопрос — зачем отказываться от простых и удобных файлов к сложной БД? Потому что файлы, генерируемые каким либо скриптом на основе файловой БД (гостевые книги, CMS, форумы), постепенно начинают увеличиваться в размере, а так же их количество неуклонно растет. Поиск сильно затруднен. После преодоления некоторого порога (1000, 10000 файлов..) скрипт начинает жутко тормозить, и приходится подолгу ждать, когда он закончит свою работу. БД лишены этих недостатков — даже если в таблице будет миллион записей, поиск среди них будет идти доли секунды. Так уж они устроены, чтобы манипулировать огромным количеством данных. Но тут и возникает вопрос — а как работать с БД, в данном случае с MySQL? Эта статья как раз об этом.', NULL, 3, NULL, '2019-02-06 11:04:16', '463647460.png', '320-463647460.png'),
(11, 'RedBean PHP и какие у неё требования?', 'RedBeanPHP был создан для значительного облегчения жизни программистов в процессе работы с базами данных. RedBeanPHP требует версию PHP >= 5.3.4. Под капотом используется драйвер PDO, поэтому защита от SQL- инъекций при правильном применении гарантированна. К поддерживаемым СУБД RedBeanPHP относятся MySQL, MariaDB, PostgreSQL, SQLite, CUBRID.\r\n\r\nORM это способ задания связи объектов и РСУБД. Всего есть 2 модели ORM-систем: Data Mapper и Active Record. Так вот RedBeanPHP это Data Mapper и каждый объект записи здесь называется бином. Эти бины можно воспринимать как самые обычные объекты, свойства которых представляют собой записи в Ваших таблицах. То есть одна запись это один бин, а его свойства это поля Вашей записи. Работать с бином можно точно также как с обычным массивом.', NULL, 3, NULL, '2019-02-06 11:05:51', '188000488.jpg', '320-188000488.jpg'),
(12, 'Язык SQL', 'Язык SQL или Structured Query Language (язык структурированных запросов) предназначен для управления данными в системе реляционных баз данных (RDBMS). В этой статье будет рассказано о часто используемых командах SQL, с которыми должен быть знаком каждый программист. Этот материал идеально подойдёт для тех, кто хочет освежить свои знания об SQL перед собеседованием на работу. Для этого разберите приведённые в статье примеры и вспомните, что проходили на парах по базам данных.\r\n\r\nОбратите внимание, что в некоторых системах баз данных требуется указывать точку с запятой в конце каждого оператора. Точка с запятой является стандартным указателем на конец каждого оператора в SQL. В примерах используется MySQL, поэтому точка с запятой требуется.', NULL, 3, NULL, '2019-02-06 11:07:25', '954846191.jpg', '320-954846191.jpg'),
(13, 'Что такое JavaScript?', 'JavaScript® (часто просто JS) — это легковесный, интерпретируемый или JIT-компилируемый, объектно-ориентированный язык с функциями первого класса. Наиболее широкое применение находит как язык сценариев веб-страниц, но также используется и в других программных продуктах, например, node.js или Apache CouchDB. JavaScript это прототипно-ориентированный, мультипарадигменный язык с динамической типизацией, который поддерживает объектно-ориентированный, императивный и декларативный (например, функциональное программирование) стили программирования. Подробнее о JavaScript.', NULL, 3, NULL, '2019-02-06 11:11:27', '154354858.jpg', '320-154354858.jpg'),
(20, 'Что такое css и как его использовать?', 'Так что css — это photoshop веб-разработчика, если можно так сказать.\r\nПрежде чем растолковывать дальше, вы должны знать о первом языке, который нужно знать в сайтостроении — html. На эту тему у меня есть соответствующая статья. Я советую прочитать ее всем, кто мало знает об html.\r\n\r\nДело в том, что html и css нужно изучать вместе, но сначала именно первый язык, так как с его помощью создается разметка веб-страниц. Css же нужен для того, чтобы правильно оформить и разместить элементы на странице в соответствии с дизайном.\r\n\r\nСинтаксис\r\nУ css один из самых простых синтаксисов, разобраться с ним можно буквально за пару часов. Вся таблица стилей (то есть css-файл) состоит из селекторов и описания свойств и значений для них. Вот пример:', NULL, 3, NULL, '2019-02-06 21:23:12', '968579101.png', '320-968579101.png');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `subname` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `avatar_small` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `recovery_code` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `recovery_code_times` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `role`, `password`, `name`, `subname`, `country`, `city`, `avatar`, `avatar_small`, `recovery_code`, `recovery_code_times`) VALUES
(3, 'root@mail.ru', 'admin', '$2y$10$RO9mq9cACUv6nhdYgCqFZuW8ErsFWnEHFg.Kgf69p73e9ySaC0dti', 'евгений', 'офицеров', 'Россия', 'Москва', '1021901514.jpg', 'size48x48-1021901514.jpg', 'HOQkwh8sWLc2X3C', 3),
(16, 'lolo@ma.ru', 'user', '$2y$10$Rx71RkezJkCQGKXFgrpFjeVpcrzX0cMDzZNp/E6ovIrEaxHCzIQrq', 'Евгений', 'Еремин', 'Россия', 'Самара', '450845523.jpg', 'size48x48-450845523.jpg', NULL, NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_foreignkey_posts_author` (`author_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
