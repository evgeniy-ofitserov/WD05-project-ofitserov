<?php
$recoveryCode = false;
$newPasswordReady = false;

// Находим польз. по емайлу. Он в гет параметре. Если не пустой гет массив email

    if ( !empty($_GET['email']) ) {

    // Выбор в БД юзера с указанным email


    $user = R::findOne('users', 'email = ?', array( $_GET['email']) );

    // Если пользователь найден
    if ( $user ) {
    $user->recovery_code_times--; // Минус 1 попытка
        R::store($user);


    // Проверка количества  попыток 
        if ( $user->recovery_code_times < 1 ) {


        header('Refresh: 3; url= http://wd05-project-ofitserov');
        echo 'Через 3 секунды вы будете перенаправлены на главную страницу сайта';
        
        die;
    }
    // Проверка верности кода
        if ( $user->recovery_code == $_GET['code'] ) {

            $recoveryCode = true;
    } else {
            $recoveryCode = false;
    }
    } else {
            echo "Пользователь с таким email не найден";
             die; 
    }
    } else if ( isset($_POST['new-pass']) ) {


    // Если форма установки нового пароля для пользователя отправлена, Ищем пользователя в БД по Email
    
    $user = R::findOne('users', 'email = ?', array( $_POST['resetemail']) ); // создали 2 скрытых инпута

    $user->recovery_code_times--; // Минус 1 попытка

    // сохр. в БД
    R::store($user);


    $user = R::findOne('users', 'email = ?', array($_POST['resetemail']));

    if ( $user ) {
        // Проверяем на кол-во попыток

        if ( $user->recovery_code_times < 1 ) {
        die();
    }

    // Проверяем onetimecode

    if ( $user->recovery_code == $_POST['onetimecode']) { 

    // Если recovery_code вернен - ставим новый пароль и убиваем код


    $user->password = password_hash($_POST['resetpassword'], PASSWORD_DEFAULT);


    // в любом случае убиваем код. Попытку восстновления
    $user->recovery_code_times = 0; // попыток нет
        R::store($user);
    $success[] = ['title' => "Ваш пароль обновлен"];
        $newPasswordReady = true;
    }
}
    } else {
    
    header("Location: " . HOST ."lost-password");
    exit();
    }

// Готовим контент для центральной части шаблона login.tpl

ob_start();
include  ROOT ."templates/login/set-new-password.tpl";
$contentReg = ob_get_contents();
ob_end_clean();

include  ROOT ."templates/_parts/_head.tpl";
include  ROOT ."templates/login/login-page.tpl";
include  ROOT ."templates/_parts/_foot.tpl";




?>