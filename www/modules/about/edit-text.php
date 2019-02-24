<?php
if(!isAdmin()){
    header("Location: " . HOST);
    die();
}
$title  = 'Обо мне' . ' | ';

$about = R::load('about',1);

if(isset($_POST['save-button'])) {


    if(trim($_POST['fullName']) == '') {
        $errors[] = ['title' => 'Введите заголовок поста'];
    }
    if(trim($_POST['about-me-info']) == '') {
        $errors[] = ['title' => 'Введите содержание поста'];
    }

    if(empty($errors)) {
        $about->name = htmlentities($_POST['fullName']);
        $about->desciption = $_POST['about-me-info'];

        //Загрузка изображение для поста
        if(isset($_FILES['upload-file']['name']) && $_FILES['upload-file']['tmp_name'] != '') {
            //write file image params in variables
            $fileName = $_FILES['upload-file']['name'];
            $fileTmpLoc = $_FILES['upload-file']['tmp_name'];
            $fileType = $_FILES['upload-file']['type'];
            $fileSize = $_FILES['upload-file']['size'];
            $fileErrorMsg = $_FILES['upload-file']['error'];
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
            }else{

                //Перемещаем загруженный фал в нужную директорию
                $db_file_name = rand(100000000, 999999999) . '.' . $fileExt;
                $postImgFolterLocation = ROOT . 'usercontent/about/';
                $uploadFile = $postImgFolterLocation . $db_file_name;
                $moveResult = move_uploaded_file($fileTmpLoc, $uploadFile);
                if($moveResult != true) {
                    $errors[] = ['title' => 'Ошибка сохранения файла'];

                }
                include_once(ROOT . 'libs/image_resize_imagick.php');

                //Устаналиваем размеры 
                $target_file = $postImgFolterLocation . $db_file_name;
                $wmax = 222;
                $hmax = 222;

                //createThumbnailBig 
                $img = createThumbnail($target_file, $wmax, $hmax);
                $img->writeImage($target_file);
                $about->about__img = $db_file_name;


            }

            }
            if(empty($errors)){
            R::store($about);
                header('Location: ' . HOST . "about");
                exit();
            }
        }
}


ob_start();
include  ROOT ."templates/_parts/_header.tpl";
include ROOT . "templates/about/edit-text.tpl";
$content = ob_get_contents();
ob_end_clean();

include  ROOT ."templates/_parts/_head.tpl";
include  ROOT ."templates/template.tpl";
include  ROOT ."templates/_parts/_footer.tpl";
include  ROOT ."templates/_parts/_foot.tpl"; 

?>