<?php
if(!isAdmin() ){
    headed('Location:' . HOST );
    die();
}
$title  = 'Удалить работу' . ' | ';

$work = R::load('works', $_GET['id'] );


if(isset($_POST['work-del']) ){
    
    $postImgFolterLocation = ROOT . 'usercontent/work/';


    $workImg = $work->work_file;
                
    if ($workImg != '') {
            
        $picurl = $postImgFolterLocation . $workImg;

        // удаляем аватар

                if ( file_exists($picurl) ) {
                    unlink($picurl);
                }
              
    }

    R::trash($work);
    header('Location:' . HOST . "works?result=workDeleted");
    exit();
}


ob_start();
include  ROOT ."templates/_parts/_header.tpl";
include ROOT . "templates/works/works-deleted.tpl";
$content = ob_get_contents();
ob_end_clean();

include  ROOT ."templates/_parts/_head.tpl";
include  ROOT ."templates/template.tpl";
include  ROOT ."templates/_parts/_footer.tpl";
include  ROOT ."templates/_parts/_foot.tpl"; 
?>