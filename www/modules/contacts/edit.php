<?php

if(!isAdmin()){
    header("Location: " . HOST);
    die();
}
$title  = 'Редактировать контакты' . ' | ';


// загрузим из БД объект под id 1.Создадим таблицу с 1 id

$contacts = R::load('contacts', 1);


if (isset($_POST['save-button'])) {
   
    if(trim($_POST['email']) == ''){

        $errors[] = ['title' => 'Введите email'];
    
    }
    if(trim($_POST['phone']) == ''){

        $errors[] = ['title' => 'Введите телефон'];
    
    }
    if(trim($_POST['address']) == ''){

        $errors[] = ['title' => 'Введите адрес'];
    
    }

    if(empty($errors)){

        // Если ошибок нет, тогда очищаем нашу форму от пробелов итд.
        $contacts->email = htmlentities($_POST['email']);
        $contacts->phone = htmlentities($_POST['phone']);
        $contacts->address = htmlentities($_POST['address']);

        $contacts->name = htmlentities($_POST['first-name']);
        $contacts->subname = htmlentities($_POST['last-name']);
        $contacts->vk = htmlentities($_POST['vkontakte']);
        $contacts->skype = htmlentities($_POST['skype']);
        $contacts->facebook = htmlentities($_POST['facebook']);
        $contacts->github = htmlentities($_POST['github']);
        $contacts->twitter = htmlentities($_POST['twitter']);



        // Сохраняем в БД
        R::store($contacts);
        header('Location: ' .HOST. "contacts");
        exit();
    }


}










ob_start();
include  ROOT ."templates/_parts/_header.tpl";
include ROOT . "templates/contacts/edit.tpl";
$content = ob_get_contents();
ob_end_clean();
include  ROOT ."templates/_parts/_head.tpl";
include  ROOT ."templates/template.tpl";
include  ROOT ."templates/_parts/_footer.tpl";
include  ROOT ."templates/_parts/_foot.tpl"; 

?>