<?php

$title  = 'Контакты' . ' | ';



// Загружаем контакты

$contacts = R::load('contacts', 1);


if(isset($_POST['message-button'])){

    if(trim($_POST['name']) == ''){
        $errors[] = ['title' => 'Введите имя пользователя'];
    }
    if(trim($_POST['email']) == '' ){
        $errors[] = ['title' => 'Введите Email пользователя'];
    }
    if(trim($_POST['message']) == '' ){
        $errors[] = ['title' => 'Введите текст сообщения'];
    }

    if(empty($errors)){

        // Cоздаем таблицу для наших сообщений 
        $message = R::dispense('messages');

        // наполняем таблицу данными из POST массива

        $message->name = htmlentities($_POST['name']);
        $message->email = htmlentities($_POST['email']);
        $message->message = htmlentities($_POST['message']);
        $message->date_time = R::isoDateTime();
        // проверяем на наличие загруженного файла 

        if(isset($_FILES['file']['name']) && $_FILES['file']['tmp_name'] != ''){

            //write file image params in variables
            $fileName = $_FILES['file']['name'];
            $fileTmpLoc = $_FILES['file']['tmp_name'];
            $fileType = $_FILES['file']['type'];
            $fileSize = $_FILES['file']['size'];
            $fileErrorMsg = $_FILES['file']['error'];
            $kaboom = explode('.', $fileName);
            $fileExt = end($kaboom);
            list($width, $height) = getimagesize($fileTmpLoc);
            if($width < 10 || $height < 10) {
                $errors[] = ['title' => 'Изображение не имеет размеров.', 'descr' => '<p>Загрузите изображение с большим разрешением.</p>'];
            }
            if($fileSize > 2000000) {
                $errors[] = ['title' => 'Размер файла с изображением не должен превышать 2Mb.'];
            }
            if(!preg_match('/\.(gif|png|jpg|jpeg)$/i', $fileName)) {
                $errors[] = ['title' => 'Неверный формат файла.', 'descr' => '<p>Файл изображения должен быть в формате jpg, png или gif.</p>'];
            }else{

                //Перемещаем загруженный фал в нужную директорию
                $db_file_name = rand(100000000, 999999999) . '.' . $fileExt;
                $postImgFolterLocation = ROOT . 'usercontent/upload-files/';
                $uploadFile = $postImgFolterLocation . $db_file_name;

                $moveResult = move_uploaded_file($fileTmpLoc, $uploadFile);

                if($moveResult != true) {
                    $errors[] = ['title' => 'Ошибка загрузки файла'];

                }
                // Записываем оригинальное название файла от пользователя
                $message->message_origin_nameFiles = $fileName;
                $message->message_file = $db_file_name;

        }
                // Cохраняем файл 
                R::store($message);
                $success[] = ['title' => 'Сообщение успешно отправлено!'];
    }

    }

}

ob_start();
include  ROOT ."templates/_parts/_header.tpl";
include ROOT . "templates/contacts/contacts.tpl";
$content = ob_get_contents();
ob_end_clean();

include  ROOT ."templates/_parts/_head.tpl";
include  ROOT ."templates/template.tpl";
include  ROOT ."templates/_parts/_footer.tpl";
include  ROOT ."templates/_parts/_foot.tpl"; 


?>