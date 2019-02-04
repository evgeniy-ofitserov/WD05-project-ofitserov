<?php

// Настройка подкл. к БД. Записывае в константы

define('DB_HOST', 'localhost');
define('DB_NAME', 'wd05-project-ofitserov');
define('DB_USER', 'root');
define('DB_PASS', '');


// Устанавливаем путь до корневой директории скрипта по протоколу HTTP

// Создаем константу

define('HOST',  $_SERVER['REQUEST_SCHEME'] . '://'. $_SERVER['HTTP_HOST'] . '/');

// Физ.путь к корневой директории скрипта. dirname(__FILE__) - распеч.путь C:\OpenServer\OSPanel\domains\WD05-project-ofitserov\www

define('ROOT',  dirname(__FILE__).'/');

$errors = array();
$success = array();




// Константы поль-ля ADMIN

define('SITE_NAME', 'Сайт-портфолио - WebDev05');
define('SITE_EMAIL', 'admin@site.ru');
define('ADMIN_EMAIL', 'root@ya.ru');

