<?php 

// Выводим title  на странице

$title = 'Вход на сайт ' . ' | ' ;
$userEmail = '';
$userPass = '';
$email = false;

// Проверяем на ошибки

if (isset($_POST['enter-login'])) {


    if (trim($_POST['email']) == '') {
        $errors[] = ['title' => 'Введите Email', 'descr' => '<p>Email обязателен для регистрации.</p>'];
    }else{
        
        $email = $_POST['email'];

        if (preg_match("/^(?:[a-z0-9]+(?:[-_.]?[a-z0-9]+)?@[a-z0-9_.-]+(?:\.?[a-z0-9]+)?\.[a-z]{2,5})$/i", $email)) {
            $email = true;

        }else{
            $errors[] = ['title' => 'Неверный формат email', 'descr' => '<p>Укажите правильный формат, напимер: - MyEmail@mail.ru </p>'];
        }
    }
    if (trim($_POST['password']) == '') {
        $errors[] = ['title' => 'Введите пароль'];
    }

    $userEmail = $_POST['email'];
    $userPass = $_POST['password'];

    // Если ошибок нет ищем в базе данных того пользователя по email

    
	if ( empty($errors)) {
		// ищем пользователя в базе
		$user = R::findOne('users', 'email = ?', array($_POST['email']) );
		if ( $user ) {
			// проверяем пароль пользователя
			if ( password_verify( $_POST['password'], $user->password ) ) {
				$_SESSION['logger_user'] = $user;
				$_SESSION['login'] = "1";
				$_SESSION['role'] = $user->role;
				header("Location: " . HOST);
				exit();
			} else {
				$errors[] = ['title' => 'Пароль введен неверно' ];
			}
		}else {
            $errors[] = ['title' => 'Такого пользователя нет',
                        'descr' => 'Зарегистрируйтесь!' ];
        }
	}
}

// Готовим контент для центральной части шаблона login.tpl

ob_start();
include  ROOT ."templates/login/form-login.tpl";
$contentReg = ob_get_contents();
ob_end_clean();

include  ROOT ."templates/_parts/_head.tpl";
include  ROOT ."templates/login/login-page.tpl";

?>