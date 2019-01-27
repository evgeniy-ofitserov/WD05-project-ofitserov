<?php
require "config.php";
require "db.php";
require "libs/functions.php";
session_start();
/*..............................

         РОУТЕР

................................*/

// получаем http://wd05-project-ofitserov/portfolio/

$uri = $_SERVER["REQUEST_URI"]; // /portfolio/

// Обрезаем слеши с конца
$uri = rtrim($uri, "/"); // /portfolio

// Обрабатываем переменную
$uri = filter_var($uri, FILTER_SANITIZE_URL);

// Вырезаем первый слеш 
$uri = substr($uri, 1); // portfolio

// Разбиваем строчку с помощью explode. Тк на сайте будут передаваться GET запросы.Отделяем GET запрос После обработке функции получим массив
$uri = explode('?', $uri); 

/*..............................

        Конструкция SWITCH
            РОУТЕР
................................*/

switch ($uri[0]) {
    case '':
        include "modules/main/index.php";
        break;


    // ::::::::::::::::::: USERS :::::::::::::::::::


    case 'login':
        require ROOT . "modules/login/login.php";
        break;
    case 'registration':
        require ROOT . "modules/login/registration.php";
        break;
    case 'logout':
        require ROOT . "modules/logout/logout.php";
        break;
    case 'lost-password':
        require ROOT . "modules/login/lost-password.php";
        break;
    case 'set-new-password':
        require ROOT . "modules/login/set-new-password.php";
        break;
    case 'profile':
        require ROOT . "modules/profile/index.php";
        break;
    case 'profile-edit':
        require ROOT . "modules/profile/profile-edit.php";
        break;
        
    // ::::::::::::::::::: END  USERS :::::::::::::::::::
 
        case 'about':
        include "modules/about/index.php";
        break;
        case 'contacts':
        include "modules/contacts/index.php";
        break;
        case 'blog':
        include "modules/blog/index.php";
        break;
    default:
        include "modules/main/index.php";
        break;
}


/*..............................

            Модули сайта

................................*/ 

// Под наши страницы создаем отдельные папки в папке modules. Подкл. их с помощью include к нашим case:



/*..............................

           Шаблоны сайта

................................*/

/*         Таким же способом подкл. все стр. сайта, меняя main.tpl - на шаблон в папке.

            include  ROOT ."templates/_parts/_header.tpl";
            include  ROOT ."templates/contacts/contacts.tpl";
            include  ROOT ."templates/_parts/_footer.tpl";

*/


/*..............................

         Шаблонизатор   сайта

................................*/

// ob_start();
// include  ROOT ."templates/main/main.tpl";
// $content = ob_get_contents();
// ob_end_clean();


/*..............................

         База данных

................................*/


// Cоздаем БД в phpMyAdmin


