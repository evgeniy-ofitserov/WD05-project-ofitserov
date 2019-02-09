<?php

$title  = 'Создать новую категорию ' . ' | ';

if(isset($_POST['cat-new'])){

    if(trim($_POST['cat-title']) == ''){

        $errors[] = ['title' => 'Введите название категории'];
    
    }

    if( empty($errors)){

        // Создаем категорию

        $cat = R::dispense('categories');
        $cat->cat_title = htmlentities($_POST['cat-title']);


        R::store($cat);
        header('Location:' . HOST . "blog/categories?result=catCreated");
        exit();

    }

}


ob_start();
include  ROOT ."templates/_parts/_header.tpl";
include ROOT . "templates/categories/new.tpl";
$content = ob_get_contents();
ob_end_clean();

include  ROOT ."templates/_parts/_head.tpl";
include  ROOT ."templates/template.tpl";
include  ROOT ."templates/_parts/_footer.tpl";
include  ROOT ."templates/_parts/_foot.tpl"; 


?>