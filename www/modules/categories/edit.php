<?php

$title  = 'Редактировать  категорию ' . ' | ';



$cat = R::load('categories', $_GET['id']);


if(isset($_POST['cat-edit'])){

    if(trim($_POST['categoryName']) == ''){

        $errors[] = ['title' => 'Введите название категории'];
    
    }

    if( empty($errors)){

        // Создаем категорию
        $cat->cat_title = htmlentities($_POST['categoryName']);

        R::store($cat);
        header('Location:' . HOST . "blog/categories?result=catUpdated");
        exit();

    }

}



ob_start();
include  ROOT ."templates/_parts/_header.tpl";
include ROOT . "templates/blog/edit.tpl";
$content = ob_get_contents();
ob_end_clean();

include  ROOT ."templates/_parts/_head.tpl";
include  ROOT ."templates/template.tpl";
include  ROOT ."templates/_parts/_footer.tpl";
include  ROOT ."templates/_parts/_foot.tpl"; 


?>