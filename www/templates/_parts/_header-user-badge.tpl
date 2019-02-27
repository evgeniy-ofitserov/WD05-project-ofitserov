
<div class="user-block">
        <div class="user-block__wrapper">
            <div class="row user-group">
                <div class="avatar avatar--small">
            <?php    
                if( $_SESSION['logger_user']['avatar_small'] != '' ){?>
                <img src="<?=HOST?>usercontent/avatar/<?=$_SESSION['logger_user']['avatar_small']?>" alt="<?=$_SESSION['logger_user']['avatar_small']?> "/>
                <?php   }else{ ?>
                <img src="../img/avatars/avatar.jpg" alt="alt text avatar" />
            <?php    
                }
            ?>
            </div>
                <div class="user-name"><span><?=$_SESSION['logger_user']['name']?> <?=$_SESSION['logger_user']['subname']?> </span>
                    <p>Пользователь</p>
                <div class="row user-buttons">
                    <a class="button button-profile" href="<?=HOST?>edit">Профиль</a>
                    <a class="button button-profile" href="<?=HOST?>logout">Выход</a></div>
                </div>
            </div>
        </div>
    </div>
</div>
