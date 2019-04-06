<?php
if(!isAdmin()){
    header('Location:' .HOST );
    die();
}
    
$title  = 'Магазин - Редактировать товар' . ' | ';

$shop = R::load('shop', $_GET['id']);

if (isset($_POST['edit-e-shop'])) {
    
    if (trim($_POST['shop-name']) == '') {
        $errors[] = ['title' => 'Введите название товара'];
    }
    if(trim($_POST['price']) == ''){
        $errors[] = ['title' => 'Введите цену товара'];
    }
    if($_POST['shop-description'] == ''){
        $errors[] = ['title' => 'Введите описние товара'];
    }
    if(empty($errors)) {
        
        $shop->shop_name = htmlentities($_POST['shop-name']);
        $shop->price = htmlentities($_POST['price']);
        $shop->old_price = htmlentities($_POST['old-price']);
        $shop->description = htmlentities($_POST['shop-description']);
        $shop->update_time = R::isoDateTime();

        if(isset($_FILES['shop_file']['name']) && $_FILES['shop_file']['tmp_name'] != ''){

            $fileName = $_FILES['shop_file']['name'];
            $fileTmpLoc = $_FILES['shop_file']['tmp_name'];
            $fileType = $_FILES['shop_file']['type'];
            $fileSize = $_FILES['shop_file']['size'];
            $fileErrorMsg = $_FILES['shop_file']['error'];
            $kaboom = explode('.', $fileName);
            $fileExt = end($kaboom);
            list($width, $height) = getimagesize($fileTmpLoc);
            if($width < 10 || $height < 10) {
                $errors[] = ['title' => 'Изображение не имеет размеров.', 'descr' => '<p>Загрузите изображение с большим разрешением.</p>'];
            }
            if($fileSize > 10485760) {
                $errors[] = ['title' => 'Размер файла с изображением не должен превышать 10Mb.'];
            }
            if(!preg_match('/\.(gif|png|jpg|jpeg)$/i', $fileName)) {
                $errors[] = ['title' => 'Неверный формат файла.', 'descr' => '<p>Файл изображения должен быть в формате jpg, png или gif.</p>'];
            }
             //Перемещаем загруженный фал в нужную директорию
             $db_file_name = rand(100000000, 999999999) . '.' . $fileExt;
             $postImgFolterLocation = ROOT . 'usercontent/shop/';
             $uploadFile = $postImgFolterLocation . $db_file_name;
             $moveResult = move_uploaded_file($fileTmpLoc, $uploadFile);
             if($moveResult != true) {
                 $errors[] = ['title' => 'Ошибка сохранения файла'];
             }
             include_once(ROOT . 'libs/image_resize_imagick.php');

             //Устаналиваем размеры 
             $target_file = $postImgFolterLocation . $db_file_name;
             $wmax = 920;
             $hmax = 620;

             //createThumbnailBig 

             $img = createThumbnailBig($target_file, $wmax, $hmax);
             $img->writeImage($target_file);
             $shop->shop_img = $db_file_name;

        }
    }

        if(empty($errors)){
            R::store($shop);
            header('Location: ' . HOST . "e-shop?result=shopPageUpdated");
            exit();
        }


    


}


ob_start();
include  ROOT ."templates/_parts/_header.tpl";
include ROOT . "templates/e-shop/e-shop-edit.tpl";

$content = ob_get_contents();
ob_end_clean();

include  ROOT ."templates/_parts/_head.tpl";
include  ROOT ."templates/template.tpl";
include  ROOT ."templates/_parts/_footer.tpl";
include  ROOT ."templates/_parts/_foot.tpl"; 
?>