<?php
if(!isAdmin() ){
    headed('Location:' . HOST );
    die();
}
$cats = R::find('categories', 'ORDER BY cat_title ASC');

$title  = 'Добавить новую работу' . ' | ';

if (isset($_POST['save-button-work'])) {
    
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

        // создание таблицы работа
        $works = R::dispense('works');
        $works->work_name = htmlentities($_POST['workName']);
        $works->work_description = htmlentities($_POST['workDescription']);
        $works->work_result = htmlentities($_POST['workResult']);
        $works->work_technology = ($_POST['workTechnology']);
        $works->link_project = htmlentities($_POST['linkProject']);
        $works->link_github = htmlentities($_POST['linkGithub']);
        $works->worksCat = $_POST['worksCat'];
        $works->date_time = R::isoDateTime();


        // Проверяем на наличие отправленной картинки, если она есть проверяем ее и записываем в бД

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
                    $errors[] = ['title' => 'Файл не имеет размеров.'];
                }

                if($fileSize > 2000000) {
                    $errors[] = ['title' => 'Размер файла с изображением не должен превышать 2Mb.'];
                }

                if(!preg_match('/\.(gif|jpg|jpeg|png)/', $fileName)) {
                    $errors[] = ['title' => 'Неверный формат файла.'];
                }

                //Перемещаем загруженный фал в нужную директорию
                $db_file_name = rand(100000000, 999999999) . '.' . $fileExt;
                $postImgFolterLocation = ROOT . 'usercontent/work/';
                $uploadFile = $postImgFolterLocation . $db_file_name;
                $moveResult = move_uploaded_file($fileTmpLoc, $uploadFile);
              

                if($moveResult != true) {
                    $errors[] = ['title' => 'Ошибка загрузки файла'];
                }

                if(empty($errors)) { 
                    // Записываем оригинальное название файла от пользователя
                    $works->work_file = $db_file_name;
                    $workImg = $works->work_file;
                }
            }
        }
        if(empty($errors)){
            R::store($works);
            header('Location: ' .HOST. 'works');
        }

} 
ob_start();
include  ROOT ."templates/_parts/_header.tpl";
include ROOT . "templates/works/works-add.tpl";
$content = ob_get_contents();
ob_end_clean();

include  ROOT ."templates/_parts/_head.tpl";
include  ROOT ."templates/template.tpl";
include  ROOT ."templates/_parts/_footer.tpl";
include  ROOT ."templates/_parts/_foot.tpl"; 
?>