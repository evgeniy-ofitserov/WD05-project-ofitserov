<?php

$title  = 'Главная страница ' . ' | ';


$about = R::findOne('about',1);
$posts = R::find('posts', 'ORDER BY id DESC  LIMIT 3');
$works = R::find('works', 'ORDER BY work_name ASC LIMIT 3');

ob_start();
include  ROOT ."templates/_parts/_header.tpl";
include  ROOT ."templates/main/main.tpl";
$content = ob_get_contents();
ob_end_clean();

include  ROOT ."templates/_parts/_head.tpl";
include  ROOT ."templates/template.tpl";
include  ROOT ."templates/_parts/_footer.tpl";
include  ROOT ."templates/_parts/_foot.tpl"; 














?>