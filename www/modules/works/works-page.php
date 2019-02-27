<?php

$title  = 'Страница работы' . ' | ';



$sqlWorks = "SELECT
    works.id, works.work_name,works.work_description, works.date_time,
    works.work_result, works.work_technology, works.link_project,
    works.link_github, works.work_file,works.up_date_time,
    works.works_cat,
    categories.cat_title 
    
    FROM `works`
    
    LEFT JOIN categories
    ON works.works_cat = categories.id
    WHERE works.id = " . $_GET['id'] . " LIMIT 1";

$work = R::getAll($sqlWorks);



// echo '<pre>';
// print_r($work);
// echo '</pre>';



// что бы не получить ошт=ибку устанавливаем индекс

$work = $work[0];


ob_start();
include  ROOT ."templates/_parts/_header.tpl";
include ROOT . "templates/works/works-page.tpl";
$content = ob_get_contents();
ob_end_clean();
include  ROOT ."templates/_parts/_head.tpl";
include  ROOT ."templates/template.tpl";
include  ROOT ."templates/_parts/_footer.tpl";
include  ROOT ."templates/_parts/_foot.tpl"; 
?>