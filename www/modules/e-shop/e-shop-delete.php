<?php
if(!isAdmin()){
    header('Location:' .HOST );
    die();
}    

$title  = 'Магазин - Удалить товар' . ' | ';

$shop = R::load('shop', $_GET['id'] );


if(isset($_POST['e-shop-del']) ){
    
    $postImgFolterLocation = ROOT . 'usercontent/shop/';


    $shopImg = $shop->shop_img;
                
    if ($shopImg != '') {
            
        $picurl = $postImgFolterLocation . $shopImg;

        // удаляем аватар

                if ( file_exists($picurl) ) {
                    unlink($picurl);
                }
              
    }

    R::trash($shop);
    header('Location:' . HOST . "e-shop?result=shopDeleted");
    exit();
}



ob_start();
include  ROOT ."templates/_parts/_header.tpl";
include ROOT . "templates/e-shop/e-shop-delete.tpl";

$content = ob_get_contents();
ob_end_clean();

include  ROOT ."templates/_parts/_head.tpl";
include  ROOT ."templates/template.tpl";
include  ROOT ."templates/_parts/_footer.tpl";
include  ROOT ."templates/_parts/_foot.tpl"; 
?>