<?php



// ПОЛУЧАЕМ  один  ПОСТ со всеми данными 

$sqlPost = 'SELECT 
        posts.id, posts.title, posts.post_img, posts.text, posts.post_cat, posts.date_time, posts.author_id,
        users.name, users.subname,
        categories.cat_title

        FROM `posts`


        LEFT JOIN categories
        ON posts.post_cat = categories.id
        INNER JOIN users
        ON posts.author_id = users.id
        WHERE posts.id =  ' .$_GET['id']. ' LIMIT 1 ';


// Выполняет запрос через метод РБ getAll, тк у нас массив
$post = R::getAll($sqlPost);

$post = $post[0];

$title  = $post['title'];



$sqlComments = 'SELECT 
        comments.text, comments.date_time, comments.user_id,
        users.name, users.subname, users.avatar_small

        FROM `comments`
        
        INNER JOIN users
        ON comments.user_id = users.id
        WHERE comments.post_id =  ' .$_GET['id'];

$comments = R::getAll($sqlComments);



if(!empty($_POST)) { 
        if( isset($_POST['comment-add'])) {

                if(trim($_POST['comment-text']) == '') {
                        $errors[] = ['title' => 'Комментарий не может быть пустым'];
                }
                
                if( empty($errors)) {
                        $comment = R::dispense('comments');
                        $comment->postId = htmlentities($_GET['id']);
                        $comment->userId = htmlentities($_SESSION['logger_user']['id']);
                        $comment->text = trim($_POST['comment-text']);
                        $comment->date_time = R::isoDateTime();

                        R::store($comment);
                        header('Location: ' . HOST . "blog/post?id=" . $_GET['id']);
                        exit();
                }
        }
}



ob_start();
include  ROOT ."templates/_parts/_header.tpl";
include ROOT . "templates/blog/blog-post.tpl";
$content = ob_get_contents();
ob_end_clean();

include  ROOT ."templates/_parts/_head.tpl";
include  ROOT ."templates/template.tpl";
include  ROOT ."templates/_parts/_footer.tpl";
include  ROOT ."templates/_parts/_foot.tpl"; 


?>