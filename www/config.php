<?php

// Настройка подкл. к БД. Записывае в константы

define('DB_HOST', 'localhost');
define('DB_NAME', 'project');
define('DB_USER', 'root');
define('DB_PASS', '');


// Устанавливаем путь до корневой директории скрипта по протоколу HTTP

// Создаем константу

define('HOST',  $_SERVER['REQUEST_SCHEME'] . '://'. $_SERVER['HTTP_HOST'] . '/');

// Физ.путь к корневой директории скрипта. dirname(__FILE__) - распеч.путь C:\OpenServer\OSPanel\domains\WD05-project-ofitserov\www

define('ROOT',  dirname(__FILE__).'/');

