<?php 

// Выводим title  на странице
$title = 'Регистрация нового пользователя ' . ' | ';

$email = '';
$pass = '';
// Проверяем нашу форму на отправку в Post - массиве


// Клик на форму отправки (input)

if (isset($_POST['enter-button'])) {
    

    if (trim($_POST['email']) == '') {
        $errors[] = ['title' => 'Введите Email', 'descr' => '<p>Email обязателен для регистрации.</p>'];
    }else{
        
            $email = $_POST['email'];

        if (preg_match("/^(?:[a-z0-9]+(?:[-_.]?[a-z0-9]+)?@[a-z0-9_.-]+(?:\.?[a-z0-9]+)?\.[a-z]{2,5})$/i", $email)) {

        }else{
            $errors[] = ['title' => 'Неверный формат email', 'descr' => '<p>Укажите правильный формат, напимер: - MyEmail@mail.ru </p>'];
        }
    }
    if (trim($_POST['password']) == '') {
        $errors[] = ['title' => 'Введите пароль'];
    }else{

    // Проверка что польз. не существует

    // Делаем запрос в БД , и с помощью функции R::count() - возвр. кол-во записей, сколько их найдено
    // В таблице users - искать по email - который соответствует нашему POST - массиву. В итоге вернет 0 либо 1

    if (R::count('users', 'email = ?', array($_POST['email']) ) > 0) {
        $errors[] = ['title' => '<p>Такой email уже зарегистрирован</p>', 'descr' => '<p>Забыли пароль? Воспользуйтесь  <a href="#">Восстановлением пароля</a>, чтобы войти на сайт.</p>'];
    }

    // Если ошибки пустые, значит записываем данные 

        if (empty($errors)) {
            
        // Создаем запрос к бД, где (автом. если ее нет, создается таблица user), передаем данные
            $user = R::dispense('users'); 
            // в таблицу $user  записать в строку email = (функц.htmlentities, очищает от инъекций) пост - массив $_POST['email']
            $user->email = htmlentities($_POST['email']);
            $user->role = 'user'; 
            // в таблицу $users  записать в строку password = (функц.password_hash, КОДИРУЕТ ПАРОЛЬ В ХЭШ ) пост - массив $_POST['password'], ГДЕ PASSWORD_DEFAULT - МЕХАНИЗМ ШИФРОВАНИЯ
            $user->password = password_hash($_POST['password'], PASSWORD_DEFAULT);
            // опредлим роль. добавим в таблицу строку role куда запишем = user
            $user->role = 'user'; 
            // СОХРАНЯЕМ ПОЛЬЗОВАТЕЛЯ В БД

            R::store($user);

                    // Запускаем сессию
            $_SESSION['logger_user'] = $user;
            $_SESSION['login'] = "1";
            $_SESSION['role'] = $user->role;

            header('Location:' . HOST . "profile");
            exit();

        } 
  

    }

}








// Готовим контент для центральной части

ob_start();
include  ROOT ."templates/login/form-registration.tpl";
$contentReg = ob_get_contents();
ob_end_clean();

include  ROOT ."templates/_parts/_head.tpl";
include  ROOT ."templates/login/login-page.tpl";

?>