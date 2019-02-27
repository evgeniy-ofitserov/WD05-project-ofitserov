<!--Шапка админа-->
<div class="header-admin">
    <div class="header-admin__left">
        <div class="user ml-20"><a class="avatar-link" href="#!">
            <div class="user ml-20"><a class="avatar-link" href="<?=HOST?>about">
            <?php if($_SESSION['logger_user'] && $_SESSION['logger_user']['avatar_small'] != '') { ?>
                    <div class="avatar avatar--small"><img src="<?=HOST?>usercontent/avatar/<?=$_SESSION['logger_user']['avatar_small']?>" alt="<?=$_SESSION['logger_user']['avatar_small']?>" /></div>
            <?php }else{ ?>
                    <div class="avatar avatar--small"><img src="../img/avatars/avatar.jpg" alt="<?=$_SESSION['logger_user']['avatar_small']?>" /></div>
            <?php } ?>        
                </a>
                <div class="brif ml-20">
                    <p class="brif__name"><?=$_SESSION['logger_user']['name']?> <?=$_SESSION['logger_user']['subname']?></p><span class="badge">Администратор</span>
                </div>
            </div>
        </div>
        <nav class="admin-nav ml-70"><a href="<?=HOST?>blog/post-new"><i class="fas fa-plus-circle"></i>Пост</a>
        <a href="<?=HOST?>blog/categories">
        <i class="fas fa-folder"></i>Категории</a>
        <a href="<?=HOST?>works"><i class="fas fa-plus-circle"></i>Работа</a>
        <a href="<?=HOST?>about"><i class="fas fa-edit"></i>Обо мне</a>
        <a href="<?=HOST?>contacts"><i class="fas fa-edit"></i>Контакты</a>
        <a href="<?=HOST?>messages"><i class="fas fa-envelope"></i>Сообщения</a></nav>
    </div>
    <div class="header-admin__right"><a href="<?=HOST?>logout"><i class="fas fa-sign-out-alt"></i>Выход</a></div>
</div> 