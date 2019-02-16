<?php 

// Выводим title  на странице

$title = 'Восстановление пароля ' . ' | ' ;
$email = false;


// Если есть такое массив, тогда выполняем проверку 

    if ( isset($_POST['lost-pass'])) {
    
        // проверка на ввод email
        if (trim($_POST['email']) == '') {
            $errors[] = ['title' => 'Введите Email', 'descr' => '<p>Email обязателен для восстановления.</p>'];
        }else{
            
            $email = $_POST['email'];
    
            if (preg_match("/^(?:[a-z0-9]+(?:[-_.]?[a-z0-9]+)?@[a-z0-9_.-]+(?:\.?[a-z0-9]+)?\.[a-z]{2,5})$/i", $email)) {
                $email = true;
    
            }else{
                $errors[] = ['title' => 'Неверный формат email', 'descr' => '<p>Укажите правильный формат, напимер: - MyEmail@mail.ru </p>'];
            }
        }
        // Если ошибок нет
        if ( empty($errors)) {

                // Находим пользователя с таким email, и если он есть
            $user = R::findOne('users', 'email = ?', array($_POST['email']) );
            if ( $user ) {
                // Генерация кода и сохранение кода в БД
                function random_str( $num = 30 ) {
                    return substr(str_shuffle('0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'), 0, $num);
                }
                // записываем рандомное число
                $recovery_code = random_str(15);
                // Результат в БД
                $user->recovery_code = $recovery_code;
                //  Делаем три попытки
                $user->recovery_code_times = 3;
                R::store($user);


                // Высылаем инструкции на почту 
                $recovery_message = "<p>Код для сброса пароля: <b>$recovery_code</b></p>";
                $recovery_message .= "<p>Для сброса пароля перейдите по ссылке ниже, и установите новый пароль:</p>";
                $recovery_message .= '<p><a href="' . HOST;
                $recovery_message .= "set-new-password?email=" . $_POST['email'] . "&code=" . $recovery_code;
                $recovery_message .= '" target="_blank">';
                $recovery_message .= "Установить новый пароль</a></p>";


                // Корректное отображение письма (Заголовки письма)
                $headers = 	"MIME-Version: 1.0" . PHP_EOL . 
                            "Content-Type: text/html; charset=utf-8" . PHP_EOL .
                            "From:" . adopt( SITE_NAME ) . "<" . SITE_EMAIL . " >" . PHP_EOL .
                            "Reply-To:" . ADMIN_EMAIL;
                

                // отправка письма
                mail($_POST['email'], 'Восстановление доступа', $recovery_message, $headers);
                
                // $success[] = "Инструкции по восстановлению доступа высланы на " . $_POST['email'];
                $success[] = [
                        'title' => "Получилось !" ,
                        'descr' => "<p>Инструкции по восстановлению доступа высланы на {$_POST['email']}</p>" 
                    ];
            } else {
                // Если такого пользователя нет
                $errors[] = ['title' => "Пользователь с таким {$_POST['email']} не зарегистрирован" ];
            }
        }
    }
    




// Готовим контент для центральной части шаблона login.tpl

ob_start();
include  ROOT ."templates/login/lost-password.tpl";
$contentReg = ob_get_contents();
ob_end_clean();

include  ROOT ."templates/_parts/_head.tpl";
include  ROOT ."templates/login/login-page.tpl";
include  ROOT ."templates/_parts/_foot.tpl";

?>