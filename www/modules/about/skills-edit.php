<?php

$title  = 'Редактировать - Навыки' . ' | ';

$jobs = R::find('jobs', 'ORDER BY id DESC');

if(isset($_POST['new-job'])){

    if (trim($_POST['period']) == '') {
        $errors[] = ['title' => 'Введите период работы'];
    }
    if (trim($_POST['job-name']) == '') {
        $errors[] = ['title' => 'Введите должность'];
    }
    if (trim($_POST['job-description']) == '') {
        $errors[] = ['title' => 'Введите должность'];
    }

    if(empty($errors)){

        $job = R::dispense('jobs');
        $job->period = htmlentities($_POST['period']);
        $job->job_name = htmlentities($_POST['job-name']);
        $job->job_description = htmlentities($_POST['job-description']);
        R::store($job);

    }

}


    // Удаляем сообщения по клику на кнопку 
    if(isset($_POST['del-jobs']) ){
        // удаляем  сообщение
        $jobsDel = R::load('jobs', $_GET['id']);
        R::trash($jobsDel);
        //$messages = R::find('messages', 'ORDER BY id DESC');
        header('Location:' . HOST . "skills-edit");
        exit();
    }


ob_start();
include  ROOT ."templates/_parts/_header.tpl";
include ROOT . "templates/about/skills-edit.tpl";
$content = ob_get_contents();
ob_end_clean();

include  ROOT ."templates/_parts/_head.tpl";
include  ROOT ."templates/template.tpl";
include  ROOT ."templates/_parts/_footer.tpl";
include  ROOT ."templates/_parts/_foot.tpl"; 


?>