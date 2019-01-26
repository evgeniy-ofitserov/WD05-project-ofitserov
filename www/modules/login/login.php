<?php 

// Проверяем на ошибки

if (isset($_POST['enter-login'])) {
    

    if (trim($_POST['email']) == '') {
        $errors[] = ['title' => 'Введите Email', 'descr' => '<p>Email обязателен для регистрации.</p>'];
    }
    if (trim($_POST['password']) == '') {
        $errors[] = ['title' => 'Введите пароль'];
    }

    // Если ошибок нет ищем в базе данных того пользователя по email

    if (empty($errors)) {
        $user = R::findOne('users', 'email = ?', array($_POST['email']) );

        // Проверяем пароль

        if ($user) {
            if (password_verify($_POST['password'], $user->password ) ) {

                $_SESSION['logger_user'] = $user;
                $_SESSION['login'] = "1";
                $_SESSION['role'] = $user->role;
                header('Location:' . HOST);
                    exit();
            }else {
                $errors[] = ['title' => 'Пароль введен неверно'];
            }
        }

    }
}
// Готовим контент для центральной части шаблона login.tpl

ob_start();
include  ROOT ."templates/login/form-login.tpl";
$contentReg = ob_get_contents();
ob_end_clean();


include  ROOT ."templates/login/login-page.tpl";




?>