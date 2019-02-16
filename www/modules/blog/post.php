<?php



// ПОЛУЧАЕМ  один  ПОСТ со всеми данными 

$sql = 'SELECT 
        posts.id, posts.title, posts.post_img, posts.text, posts.post_cat, posts.date_time, posts.author_id,
        users.name, users.subname,
        categories.cat_title

        FROM `posts`

        INNER JOIN users ON posts.author_id = users.id
        LEFT JOIN categories ON categories.id = posts.post_cat
        WHERE posts.id =  ' . $_GET['id']. ' LIMIT 1 ';


// Выполняет запрос через метод РБ getAll, тк у нас массив
$post = R::getAll($sql);

// echo '<pre>';
// print_r($post);
// echo '</pre>';
// die();



$post = $post[0];

$title  = $post['title'];


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