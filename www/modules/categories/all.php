<?php
if(!isAdmin() ){
    headed('Location:' . HOST );
    die();
}

$title  = 'Категории блога ' . ' | ';


// Делвем запрос в БД для получение всех категорий


$cats = R::find('categories', 'ORDER BY cat_title ASC');



ob_start();
include  ROOT ."templates/_parts/_header.tpl";
include ROOT . "templates/categories/all.tpl";
$content = ob_get_contents();
ob_end_clean();

include  ROOT ."templates/_parts/_head.tpl";
include  ROOT ."templates/template.tpl";
include  ROOT ."templates/_parts/_footer.tpl";
include  ROOT ."templates/_parts/_foot.tpl"; 


?>