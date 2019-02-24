<?php

$title  = 'Блог все записи' . ' | ';


// ПОЛУЧАЕМ ВСЕ ПОСТЫ сортируем по убыванию
$posts = R::find('posts', 'ORDER BY id DESC');


ob_start();
include  ROOT ."templates/_parts/_header.tpl";
include ROOT . "templates/blog/blog-posts-all.tpl";
$content = ob_get_contents();
ob_end_clean();

include  ROOT ."templates/_parts/_head.tpl";
include  ROOT ."templates/template.tpl";
include  ROOT ."templates/_parts/_footer.tpl";
include  ROOT ."templates/_parts/_foot.tpl"; 
?>