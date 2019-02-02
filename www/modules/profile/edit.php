<?php

$title  = 'Редактировать профиль ' . ' | ';

$currentUser = $_SESSION['logger_user'];


$user = R::load('users', $currentUser->id);


// Проверяем на наличие ошибок


if ( isset($_POST['update'])) {

    if ( trim($_POST['email'])  == '') {
        $errors[] = ['title' => 'Введите Email'];
    }
    if ( trim($_POST['name'])  == '') {
        $errors[] = ['title' => 'Введите Имя'];
    }
    if ( trim($_POST['subname'])  == '') {
        $errors[] = ['title' => 'Введите Фамилию'];
    }
 

    // Если ошибок нет, тогда записываем 

    if (empty($errors) ) {
        
        $user->email = htmlentities($_POST['email'] );
        $user->name = htmlentities($_POST['name'] );
        $user->subname = htmlentities($_POST['subname'] );
        $user->country = htmlentities($_POST['country'] );
        $user->city = htmlentities($_POST['city'] );
        
        // Cохраняем в БД и записываем уже обновленного пользователя

        R::store($user);
        $_SESSION['logger_user'] = $user;        
        header('Location: ' . HOST . "profile");
        
        exit();

        }





    }

}

ob_start();
include  ROOT ."templates/_parts/_header.tpl";
include ROOT . "templates/profile/profile-edit.tpl";
$content = ob_get_contents();
ob_end_clean();

include  ROOT ."templates/_parts/_head.tpl";
include  ROOT ."templates/template.tpl";
include  ROOT ."templates/_parts/_footer.tpl";
include  ROOT ."templates/_parts/_foot.tpl"; 


?>