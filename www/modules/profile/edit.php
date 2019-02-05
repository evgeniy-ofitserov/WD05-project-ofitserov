<?php

$title  = 'Редактировать профиль ' . ' | ';

$currentUser = $_SESSION['logger_user'];
$email = false;

$user = R::load('users', $currentUser->id);

// phpinfo();

// Проверяем на наличие ошибок


if ( isset($_POST['update'])) {

    if (trim($_POST['email']) == '') {
        $errors[] = ['title' => 'Введите Email', 'descr' => '<p>Email обязателен.</p>'];
    }else{
        
        $email = $_POST['email'];

        // Проверяем на корректность введенного email
        
        if (preg_match("/^(?:[a-z0-9]+(?:[-_.]?[a-z0-9]+)?@[a-z0-9_.-]+(?:\.?[a-z0-9]+)?\.[a-z]{2,5})$/i", $email)) {
            $email = true;

        }else{
            $errors[] = ['title' => 'Неверный формат email', 'descr' => '<p>Укажите правильный формат, напимер: - MyEmail@mail.ru </p>'];
        }
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
        

        // Проверяем на загр. аватарке с компа

        if ( isset($_FILES['avatar']['name'] ) && $_FILES['avatar']['tmp_name'] != "" ) {

        // Запишем в переменные параметры в массив FILES

            $fileName = $_FILES['avatar']['name'];
            $fileTmpLoc = $_FILES['avatar']['tmp_name'];
            $fileType = $_FILES['avatar']['type'];
            $fileSize = $_FILES['avatar']['size'];
            $fileErrors = $_FILES['avatar']['error'];

        // получим рсширение файла разбив имя на две строчки. и берем из него последний элемент. запишем в переменные

        // по разделителю .

            $kaboom = explode(".", $fileName); 

        // Последний элемент

            $fileExt = end($kaboom); // Получаем расширение

        // проверяем на файл его ли передает пользователь
        // Записываем в функцию list ширину и высоту которая проверяет загр.размер временного  храняш. файла

            list($width,$height) = getimagesize($fileTmpLoc);

        // проверяем на загруженность файла

            if ( $width < 10 || $height < 10 ) {
                $errors[] = ['title' => 'У картинке нет размера.Загрузите картинку'];

            }
        // проверяем на размер файла

            if ( $fileSize > 1000000 ) {
                $errors[] = ['title' => 'Превышен максимально допустимый размер'];
                
            }

        // Проверяем на рег.выражение (указываем допустимое расширение файла) имени файла. Если не соответствует выводим ошибку
            if ( !preg_match('/\.(gif|jpg|png|jpeg)$/i', $fileName) ) {

                $errors[] = ['title' => 'Недопустимое расширение файла',
                              'descr' => '<p>Разрешенный формат gif, jpg, png, gif </p>'];
             
            } 
            if ( $fileErrors == 1 ) {

                $errors[] = ['title' => 'При загрузке изображения произошла ошибка'];
                
            } 

        // Проверяем установлен ли аватар у пользователя

            $avatar = $user['avatar'];

            // Запишем в переменную путь где будут храниться все аватарки(создадим эту папку)

            $avatarFolderLoc = ROOT . 'usercontent/avatar/';

        // если аватар уже заполнен ранее, то удаляем его(чтоб новый загрузить)

            if ($avatar != '') {
                
        // Запишем в переменную путь до папке с аватаром, и текущий аватар польз. в итоге получим полный путь до аватара текущего польз.
            
                $picurl = $avatarFolderLoc . $avatar;

        // удаляем аватар

                if ( file_exists($picurl) ) {
                    unlink($picurl);
                }
                $picurl48 = $avatarFolderLoc . 'size48x48-' . $avatar;

                if ( file_exists($picurl48) ) {
                    unlink($picurl48);
                }
            }

        // Перемещаем загруженный файл в директорию + генерируем уникальное имя для изобр.

        // Записываем в переменную случайное имя и добавляем расширение к нему

            $db_file_name = rand(100000000000, 999999999999) . "." . $fileExt;

            $uploadfile = $avatarFolderLoc . $db_file_name;

        // Перемещаем в новую папку (функция принимает файл который нужно взять (fileTmpLoc) и 2 параметр куда его перенести(uploadfile))

            $moveResault = move_uploaded_file($fileTmpLoc, $uploadfile);

        // Проверяем на ошибки 
                if ($moveResault != true) {
                    $errors[] = ['title'=> 'При cохранении файла, произошла ошибка. Пвторите загрузку файла' ];
                }

        // Если ошибок нет, тогда подкл. библиотеку для обработки аватарки

                include_once (ROOT . "/libs/image_resize_imagick.php");


        // Итоговый файл который мы сохранили запишем в переменную $target_file

                $target_file = $avatarFolderLoc . $db_file_name;

        // Cоздаем значение аватарки как мы ее будем изменять ( по ширине и по длинне );

                $wmax = 222;
                $hmax = 222;

        // в переменную записываем функцию которая берется из библиотеки, которая принимает путь и имя файла ее ширину и длинну. Взвращает объект
        // Cоздает превью

                $img = createThumbnail($target_file, $wmax, $hmax);

        // Записываем файл
                $img->writeImage($target_file);

        // В таблицу user (БД) в колонку avatar  мы записываем уже готовый путь к картинке с аватаркой(Большую аватарку. На странице профиля)
                $user->avatar = $db_file_name;



        // :::::::::::::::::::::: Для маленькой картинки :::::::::::::::::::::::::::::::::: // 

        // Берем большой файл
                $target_file = $avatarFolderLoc . $db_file_name;

        // Размер файла 48 - это ( 48x48 )
                $resize_file = $avatarFolderLoc . "size48x48-" . $db_file_name;
        // Cоздаем значение аватарки как мы ее будем изменять ( по ширине и по длинне );

                $wmax = 48;
                $hmax = 48;

        // Cоздает превью
                $img = createThumbnail($target_file, $wmax, $hmax);

        // Записываем файл обрезанный 48 на 48
                    $img->writeImage($resize_file);


            // В таблицу user (БД) в колонку avatarSmall  мы записываем уже готовый путь к картинке с аватаркой(Мальнькую 48 на 48 аватарку. На странице профиля)
                    $user->avatarSmall = "size48x48-" . $db_file_name;

        }

        
        // Cохраняем в БД и записываем уже обновленного пользователя
        // Если ошибок нет, тогда записываем в БД
        if ( empty($errors) ) {
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