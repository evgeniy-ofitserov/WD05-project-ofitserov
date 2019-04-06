<?php

$title  = 'Магазин - Cтраница товара' . ' | ';

$shop = R::load('shop', $_GET['id']);

// echo '<pre>';
// print_r($goodsPage);
// echo '</pre>';

ob_start();
include  ROOT ."templates/_parts/_header.tpl";
include ROOT . "templates/e-shop/e-shop-page.tpl";
$content = ob_get_contents();
ob_end_clean();
include  ROOT ."templates/_parts/_head.tpl";
include  ROOT ."templates/template.tpl";
include  ROOT ."templates/_parts/_footer.tpl";
include  ROOT ."templates/_parts/_foot.tpl"; 
?>