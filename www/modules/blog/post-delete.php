<?php
if(!isAdmin() ){
    headed('Location:' . HOST );
    die();
}
$title  = 'Удалить  пост' . ' | ';

// Получаем список всех категорий  и постов 
$post = R::load('posts', $_GET['id'] );


if(isset($_POST['post-del']) ){
    
    $postImgFolterLocation = ROOT . 'usercontent/post/';


    $postImg = $post->post_img;
                
    if ($postImg != '') {
            
        $picurl = $postImgFolterLocation . $postImg;

        // удаляем аватар

                if ( file_exists($picurl) ) {
                    unlink($picurl);
                }
                $picurl320 = $postImgFolterLocation . '320-' . $postImg;

                if ( file_exists($picurl320) ) {
                    unlink($picurl320);
                }
    }

    R::trash($post);
    header('Location:' . HOST . "blog?result=postDeleted");
    exit();
}


ob_start();
include  ROOT ."templates/_parts/_header.tpl";
include ROOT . "templates/blog/post-delete.tpl";
$content = ob_get_contents();
ob_end_clean();

include  ROOT ."templates/_parts/_head.tpl";
include  ROOT ."templates/template.tpl";
include  ROOT ."templates/_parts/_footer.tpl";
include  ROOT ."templates/_parts/_foot.tpl"; 


?>