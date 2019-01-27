<!-- <h1>Шаблон Header</h1> -->

<?php 

    // Проверка на поль-ля.
    if(isset($_SESSION['logger_user']) && $_SESSION['login'] == 1 && $_SESSION['role'] == 'admin'){
        include  ROOT ."templates/_parts/_admin-panel.tpl";
    }
?>


<header class="header">

    // Такой пример кода сделал специально(!) для теста :)

            <?php include( ROOT ."templates/_parts/_header-logo.tpl");?>    
                       
<?php 
            if(isset($_SESSION['logger_user']) && $_SESSION['login'] == 1 ){

                //пользователь есть на сайте (авторизован)
            
                if($_SESSION['role'] == 'admin') {
                    // На сайте админ

                     include( ROOT ."templates/_parts/_header-user-profile.tpl");

                }else{
                       
                    include( ROOT ."templates/_parts/_header-user-badge.tpl");
                    include( ROOT ."templates/_parts/_header-user-profile.tpl");
             
                }
                
            }else{

                // пользователь не авторизован (гость)

            include( ROOT ."templates/_parts/_header-user-links.tpl");
            include( ROOT ."templates/_parts/_header-user-profile.tpl");

} ?>

</header>