-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 19 2019 г., 16:50
-- Версия сервера: 5.6.38-log
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
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `cat_title` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `cat_title`) VALUES
(20, 'PHP'),
(21, 'Apple');

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` int(11) UNSIGNED NOT NULL,
  `post_id` int(11) UNSIGNED DEFAULT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `text` text COLLATE utf8mb4_unicode_520_ci,
  `date_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `user_id`, `text`, `date_time`) VALUES
(42, 14, 3, 'привет', '2019-02-17 23:03:30'),
(43, 14, 3, 'werqbrwqbwrqbrwb', '2019-02-17 23:25:02'),
(44, 14, 3, 'rwqbrwqbrwqb', '2019-02-17 23:56:23'),
(45, 14, 3, 'rwqbwrqbrwb', '2019-02-18 00:30:27'),
(46, 14, 3, 'rwqbrwqbwrqb2132132', '2019-02-18 00:40:14'),
(47, 14, 3, '2131244324', '2019-02-18 00:46:13'),
(48, 14, 3, 'rwqbrwqbr', '2019-02-18 00:47:09'),
(49, 15, 3, 'Samsung лучше', '2019-02-18 19:06:40');

-- --------------------------------------------------------

--
-- Структура таблицы `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `subname` varchar(191) DEFAULT NULL,
  `vk` varchar(191) DEFAULT NULL,
  `skype` varchar(191) DEFAULT NULL,
  `facebook` varchar(191) DEFAULT NULL,
  `github` varchar(191) DEFAULT NULL,
  `twitter` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `contacts`
--

INSERT INTO `contacts` (`id`, `email`, `phone`, `address`, `name`, `subname`, `vk`, `skype`, `facebook`, `github`, `twitter`) VALUES
(1, 'root@mail.ru', '9999942671', 'Питер', 'Евгений', 'Офицеров', 'http://wd05-project-ofitserov/blog', 'ofitserov/blog', '://wd05-project-ofitserov/blog', 'sdcdscdscdscds', 'http://wd05-project-ofitserov/blog');

-- --------------------------------------------------------

--
-- Структура таблицы `messages`
--

CREATE TABLE `messages` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_520_ci,
  `message_origin_name_files` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `message_file` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `date_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `messages`
--

INSERT INTO `messages` (`id`, `name`, `email`, `message`, `message_origin_name_files`, `message_file`, `date_time`) VALUES
(17, 'Андрей', 'andrey@yandex.ru', 'RedBeanPHP работает с bean\'ами. Для начала вы можете просто создать bean. Это объект с публичными свойствами и типом. Тип bean\'а используется для сопоставления таблице в БД и, опционально, для указания вашего класса. Bean создается таким образом: $book = R::dispense( \'book\' ); Теперь у нас есть пустой bean типа book. Зададим ему пару свойств: $book-&gt;title = \'Boost development with RedBeanPHP\'; $book-&gt;author = \'Charles Xavie', NULL, NULL, '2019-02-19 15:25:38');

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `text` text COLLATE utf8mb4_unicode_520_ci,
  `author_id` int(11) UNSIGNED DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `post_img` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `post_img_small` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `post_cat` int(11) UNSIGNED DEFAULT NULL,
  `data_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `title`, `text`, `author_id`, `date_time`, `post_img`, `post_img_small`, `post_cat`, `data_time`, `update_time`) VALUES
(14, 'Xiaomi Mi A2 4GB/32GB Blue (Голубой)', '<p>Xiaomi была основана восемью партнёрами 6 апреля 2010 года.</p>\r\n\r\n<p>16 августа 2010 года Xiaomi официально запустила прошивку&nbsp;<a href=\"https://ru.wikipedia.org/wiki/MIUI\">MIUI</a>, основанную на системе&nbsp;<a href=\"https://ru.wikipedia.org/wiki/Android\">Android</a>&nbsp;и совмещающую стили&nbsp;<a href=\"https://ru.wikipedia.org/wiki/Samsung\">Samsung</a>&nbsp;<a href=\"https://ru.wikipedia.org/wiki/TouchWiz\">TouchWiz</a>&nbsp;и&nbsp;<a href=\"https://ru.wikipedia.org/wiki/Apple\">Apple</a>&nbsp;<a href=\"https://ru.wikipedia.org/wiki/IOS\">iOS</a>.</p>\r\n\r\n<p>Первый смартфон&nbsp;&mdash; Mi 1 был анонсирован в августе 2011 года. Он поставлялся в двух версиях&nbsp;&mdash; с прошивкой MIUI и с &laquo;чистым&raquo; Android. В августе 2012 года компания представила смартфон&nbsp;<a href=\"https://ru.wikipedia.org/wiki/Xiaomi_Mi_2\">Mi 2</a>, к сентябрю 2013 года было продано более 10 миллионов копий устройства.</p>\r\n\r\n<p>5 сентября 2013 CEO Лэй Цзюнь объявил о планах запуска 3D-телевизора под управлением Android с диагональю 47 дюймов, который будет собираться на заводе корпорации Wistron на Тайване.</p>\r\n\r\n<p>В сентябре 2013 года Xiaomi анонсировала смартфон&nbsp;<a href=\"https://ru.wikipedia.org/wiki/Xiaomi_Mi_3\">Mi 3</a>. 25 сентября 2013 года было объявлено о планах открыть первый флагманский магазин в Пекине. В октябре 2013 Xiaomi стала пятым мобильным брендом в Китае<a href=\"https://ru.wikipedia.org/wiki/Xiaomi#cite_note-presstrendforcecom_1-7\">[7]</a>.</p>\r\n\r\n<p>Символ Xiaomi&nbsp;&mdash; заяц в шапке-ушанке с красной звёздочкой и с красным пионерским галстуком на шее<a href=\"https://ru.wikipedia.org/wiki/Xiaomi#cite_note-mobile-review.com_1-8\">[8]</a>. В 2014 году Xiaomi впервые сообщила о международной экспансии в связи с открытием первого магазина в&nbsp;<a href=\"https://ru.wikipedia.org/wiki/%D0%A1%D0%B8%D0%BD%D0%B3%D0%B0%D0%BF%D1%83%D1%80\">Сингапуре</a>. Были озвучены планы компании выйти на рынки&nbsp;<a href=\"https://ru.wikipedia.org/wiki/%D0%9C%D0%B0%D0%BB%D0%B0%D0%B9%D0%B7%D0%B8%D1%8F\">Малайзии</a>&nbsp;и&nbsp;<a href=\"https://ru.wikipedia.org/wiki/%D0%98%D0%BD%D0%B4%D0%B8%D1%8F\">Индии</a>. 17 марта 2014 года был анонсирован Redmi Note (также известный как HongMi Note). Redmi Note был оснащён 5,5-дюймовым HD IPS-дисплеем с технологией OGS и восьмиядерным процессором от&nbsp;<a href=\"https://ru.wikipedia.org/wiki/MediaTek\">MediaTek</a>.</p>\r\n\r\n<p>В апреле 2014 года компанией было объявлено о начале расширения на международные рынки десяти стран, включая Россию<a href=\"https://ru.wikipedia.org/wiki/Xiaomi#cite_note-bloomberg_1-9\">[9]</a>. Ответственным был назначен один из бывших сотрудников&nbsp;<a href=\"https://ru.wikipedia.org/wiki/Google_(%D0%BA%D0%BE%D0%BC%D0%BF%D0%B0%D0%BD%D0%B8%D1%8F)\">Google</a>&nbsp;Хьюго Барра<a href=\"https://ru.wikipedia.org/wiki/Xiaomi#cite_note-cnews.ru_1-10\">[10]</a>.</p>\r\n\r\n<p>В июне 2015 года Xiaomi подписала контракт с российской компанией &laquo;Марвел-Дистрибуция&raquo; на поставку планшетов MiPad<a href=\"https://ru.wikipedia.org/wiki/Xiaomi#cite_note-11\">[11]</a>. 18 июня 2015 года планшеты Xiaomi MiPad официально стали продавать в розничной сети &laquo;Связной&raquo;<a href=\"https://ru.wikipedia.org/wiki/Xiaomi#cite_note-12\">[12]</a><a href=\"https://ru.wikipedia.org/wiki/Xiaomi#cite_note-13\">[13]</a>. По итогам 2016 года компания не попала в первую десятку по количеству проданных устройств и выручке от их реализации. Однако в первом квартале 2017 года, по оценке ритейлера &laquo;Связной&raquo;, Xiaomi оказалась в топ-10 российских компаний по объему выручки<a href=\"https://ru.wikipedia.org/wiki/Xiaomi#cite_note-14\">[14]</a>.</p>\r\n\r\n<p>В октябре 2016 года открыт первый официальный монобрендовый магазин Xiaomi в Москве[<em><a href=\"https://ru.wikipedia.org/wiki/%D0%92%D0%B8%D0%BA%D0%B8%D0%BF%D0%B5%D0%B4%D0%B8%D1%8F:%D0%97%D0%BD%D0%B0%D1%87%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D1%8C_%D1%84%D0%B0%D0%BA%D1%82%D0%B0\">значимость факта?</a></em>].</p>\r\n\r\n<p>Лэй Цзунь назвал цели компании на 2017 год, среди которых четырёхкратное увеличение числа физических магазинов, до 200 торговых точек, расширение присутствия Xiaomi в мире, углубление исследований в области искусственного интеллекта и финансовых онлайн-услуг.</p>\r\n\r\n<p>В 2017 году компания официально представила[<em><a href=\"https://ru.wikipedia.org/wiki/%D0%92%D0%B8%D0%BA%D0%B8%D0%BF%D0%B5%D0%B4%D0%B8%D1%8F:%D0%A1%D1%81%D1%8B%D0%BB%D0%BA%D0%B8_%D0%BD%D0%B0_%D0%B8%D1%81%D1%82%D0%BE%D1%87%D0%BD%D0%B8%D0%BA%D0%B8\">источник не указан 115 дней</a></em>]&nbsp;на российском рынке ряд смартфонов и &laquo;умных&raquo; устройств, включая полноэкранный концепт-флагман Mi MIX, смартфон-фаблет Mi Max 2, смартфон Mi A1 на операционной системе Android One и др.</p>\r\n\r\n<p>По результатам 3 квартала 2017 года Xiaomi заняла третье место на рынке смартфонов в России (по ввозу в страну)<a href=\"https://ru.wikipedia.org/wiki/Xiaomi#cite_note-15\">[15]</a>.</p>\r\n\r\n<p>С 14 декабря 2017 года смартфон Redmi 5A официально продается через российское подразделение Tmall (<a href=\"https://ru.wikipedia.org/wiki/AliExpress\">AliExpress</a>). На официальную и сертифицированную продукцию распространяется гарантия бренда.</p>\r\n\r\n<p>В феврале 2018 года компания представила в России лимитированную серию флагманского смартфона Mi MIX 2 Special Edition в цельнокерамическом корпусе и белом цвете. В марте в стране начали продаваться доступные полноэкранные модели Redmi 5 и Redmi 5 Plus, а в мае&nbsp;&mdash; Redmi Note 5.</p>\r\n\r\n<p>В марте 2018 года Xiaomi впервые поднялась<a href=\"https://ru.wikipedia.org/wiki/Xiaomi#cite_note-16\">[16]</a>&nbsp;на первое место в России по продажам в интернет-магазинах.</p>\r\n\r\n<p>На протяжении 2017&mdash;2018 годов продолжается активный рост сети официальных авторизованных розничных магазинов Mi Stores в городах России. В мае 2018 года был открыт 60-й магазин сети<a href=\"https://ru.wikipedia.org/wiki/Xiaomi#cite_note-17\">[17]</a>.</p>\r\n', 3, '2019-02-16 11:47:25', '890301513.png', '320-890301513.png', 21, NULL, '2019-02-16 11:49:30'),
(15, 'Apple', '<p>Apple &mdash; американская корпорация, производитель персональных и планшетных компьютеров, аудиоплееров, телефонов, программного обеспечения. Один из пионеров в области персональных компьютеров и современных многозадачных операционных систем с графическим интерфейсом. Штаб-квартира &mdash; в Купертино, штат Калифорния.</p>\r\n', 3, '2019-02-18 19:05:12', '923892211.png', '320-923892211.png', 21, NULL, '2019-02-18 19:05:56');

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
(16, 'lolo@ma.ru', 'user', '$2y$10$Rx71RkezJkCQGKXFgrpFjeVpcrzX0cMDzZNp/E6ovIrEaxHCzIQrq', 'Евгений', 'Еремин', 'Россия', 'Самара', '450845523.jpg', 'size48x48-450845523.jpg', NULL, NULL),
(17, 'lala@mai.ru', 'user', '$2y$10$q3OFy51V07HEhDkyT.7PR.ITOjRy0ZXEXuRw7ExSgj5pim2xVZhXK', 'Иван', 'Казаков', 'Россия', 'Москва', '501428157.jpg', 'size48x48-501428157.jpg', NULL, NULL),
(18, 'lala@ya.ru', 'user', '$2y$10$L7WuKhkSjGB8aqSQtsWg3.G2.9XXN8jd4t8R76m1NEfZgeVt0.M1y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_foreignkey_comments_post` (`post_id`),
  ADD KEY `index_foreignkey_comments_user` (`user_id`);

--
-- Индексы таблицы `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT для таблицы `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
