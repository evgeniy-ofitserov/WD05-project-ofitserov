<?php

$title  = 'Магазин - Главная страница' . ' | ';

$shop = R::find('shop', 'ORDER BY id DESC LIMIT 6');

// echo '<pre>';
// print_r($goods);
// echo '</pre>';

ob_start();
include  ROOT ."templates/_parts/_header.tpl";
include ROOT . "templates/e-shop/e-shop.tpl";
$content = ob_get_contents();
ob_end_clean();
include  ROOT ."templates/_parts/_head.tpl";
include  ROOT ."templates/template.tpl";
include  ROOT ."templates/_parts/_footer.tpl";
include  ROOT ."templates/_parts/_foot.tpl"; 
?>