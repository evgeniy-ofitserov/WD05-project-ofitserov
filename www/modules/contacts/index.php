<?php

$title  = 'Контакты' . ' | ';



// Загружаем контакты

$contacts = R::load('contacts', 1);


if(!empty($_POST)) {
    if(isset($_POST['message-button'])) {
        if(trim($_POST['name']) == '') {
            $errors[] = ['title' => 'Введите имя'];
        }

        if(trim($_POST['email']) == '') {
            $errors[] = ['title' => 'Введите email'];
        }

        if(trim($_POST['message']) == '') {
            $errors[] = ['title' => 'Введите текст сообщения'];
        }

        if(empty($errors)) {
            $message = R::dispense('messages');
            $message->name = htmlentities($_POST['name']);
            $message->email = htmlentities($_POST['email']);
            $message->message = htmlentities($_POST['message']);
            $message->date_time = R::isoDateTime();
            
            if(isset($_FILES['file']['name']) && $_FILES['file']['tmp_name'] != '') {
                $fileName = $_FILES['file']['name'];
                $fileTmpLoc = $_FILES['file']['tmp_name'];
                $fileType = $_FILES['file']['type'];
                $fileSize = $_FILES['file']['size'];
                $fileErrorMsg = $_FILES['file']['error'];
                $kaboom = explode('.', $fileName);
                $fileExt = end($kaboom);

                list($width, $height) = getimagesize($fileTmpLoc);

                if($width < 10 || $height < 10) {
                    $errors[] = ['title' => 'Файл не имеет размеров.'];
                }

                if($fileSize > 2000000) {
                    $errors[] = ['title' => 'Размер файла с изображением не должен превышать 2Mb.'];
                }

                if(!preg_match('/\.(gif|jpg|jpeg|png)/', $fileName)) {
                    $errors[] = ['title' => 'Неверный формат файла.'];
                }

                //Перемещаем загруженный фал в нужную директорию
                $db_file_name = rand(100000000, 999999999) . '.' . $fileExt;
                $postImgFolterLocation = ROOT . 'usercontent/upload-files/';
                $uploadFile = $postImgFolterLocation . $db_file_name;
                $moveResult = move_uploaded_file($fileTmpLoc, $uploadFile);

                if($moveResult != true) {
                    $errors[] = ['title' => 'Ошибка загрузки файла'];
                }

                if(empty($errors)) { 
                    // Записываем оригинальное название файла от пользователя
                    $message->message_origin_nameFiles = $fileName;
                    $message->message_file = $db_file_name;
                }
            }

            //Запись в БД
            if(empty($errors)) {
                R::store($message);
                $success[] = ['title' => 'Сообщение успешно отправлено!'];
            }
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