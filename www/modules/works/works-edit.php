<?php
if(!isAdmin() ){
    headed('Location:' . HOST );
    die();
}
$title  = 'Редактировать работу' . ' | ';


$works = R::load('works', $_GET['id'] );

$cats = R::find('categories', 'ORDER BY cat_title ASC');

if (isset($_POST['update-button-work'])) {
    
    if (trim($_POST['workName']) == '') {
        $errors[] = ['title' => 'Введите название работы'];
    }
    if (trim($_POST['workDescription']) == '') {
        $errors[] = ['title' => 'Введите описание работы'];
    }
    if (trim($_POST['workResult']) == '') {
        $errors[] =['title' => 'Какой результат работы ?'];
    }
    if (trim($_POST['workTechnology']) == '') {
        $errors[] = ['title' => 'Какие технологии использовались ?'];
    }

    if(empty($errors)){
     
        $works->work_name = htmlentities($_POST['workName']);
        $works->work_description = htmlentities($_POST['workDescription']);
        $works->work_result = htmlentities($_POST['workResult']);
        $works->work_technology = ($_POST['workTechnology']);
        $works->link_project = htmlentities($_POST['linkProject']);
        $works->link_github = htmlentities($_POST['linkGithub']);
        $works->worksCat = $_POST['worksCat'];
        $works->upDate_time = R::isoDateTime();


        if(isset($_FILES['upload-file']['name']) && $_FILES['upload-file']['tmp_name'] != '') {
            
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
            }

                //Перемещаем загруженный фал в нужную директорию
                $db_file_name = rand(100000000, 999999999) . '.' . $fileExt;
                $postImgFolterLocation = ROOT . 'usercontent/work/';
                $uploadFile = $postImgFolterLocation . $db_file_name;
                $moveResult = move_uploaded_file($fileTmpLoc, $uploadFile);



                // Удаление аватара, при обновлении
                $worksImg = $works->work_file;

                if ($worksImg != '') {
                    
                    $picurl = $postImgFolterLocation . $worksImg;

                    if ( file_exists($picurl) ) {
                        unlink($picurl);
                    }

                }


                if($moveResult != true) {
                    $errors[] = ['title' => 'Ошибка сохранения файла'];

                }
                include_once(ROOT . 'libs/image_resize_imagick.php');

                //Устаналиваем размеры 
                $target_file = $postImgFolterLocation . $db_file_name;
                $wmax = 920;
                $hmax = 620;

                //createThumbnail
                $img = createThumbnail($target_file, $wmax, $hmax);
                $img->writeImage($target_file);
                $works->work_file = $db_file_name;

            
        }

        if(empty($errors)){
            R::store($works);
            header('Location: ' . HOST . "works?result=workUpdated");
            exit();
        }

    }

}

ob_start();
include  ROOT ."templates/_parts/_header.tpl";
include ROOT . "templates/works/works-edit.tpl";
$content = ob_get_contents();
ob_end_clean();

include  ROOT ."templates/_parts/_head.tpl";
include  ROOT ."templates/template.tpl";
include  ROOT ."templates/_parts/_footer.tpl";
include  ROOT ."templates/_parts/_foot.tpl"; 
?>