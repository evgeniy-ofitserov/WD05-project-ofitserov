<?php
if(!isAdmin()){
    header("Location: " . HOST);
    die();
}

// Находим все сообщения и сортируем их
$messages = R::find('messages', 'ORDER BY id DESC');


// Удаляем сообщения по клику на кнопку 

if(isset($_POST['deleted-message']) ){
        // удаляем  сообщение
    $messageDel = R::load('messages', $_GET['id']);

        R::trash($messageDel);
        header('Location:' . HOST . "messages");
        exit();
    
}


$title  = 'Сообщения от пользователей'. ' | ';
ob_start();
include  ROOT ."templates/_parts/_header.tpl";
include ROOT . "templates/contacts/messages.tpl";
$content = ob_get_contents();
ob_end_clean();

include  ROOT ."templates/_parts/_head.tpl";
include  ROOT ."templates/template.tpl";
include  ROOT ."templates/_parts/_footer.tpl";
include  ROOT ."templates/_parts/_foot.tpl"; 


?>