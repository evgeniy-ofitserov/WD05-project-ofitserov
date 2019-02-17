<div class="user-comment">
    <div class="user-comment__avatar">
    <?php    
        if( $comment['avatar_small'] != '') {?>
            <img src="<?=HOST?>usercontent/avatar/<?=$comment['avatar_small']?>" alt="<?=$comment['name']?> <?=$comment['subname']?>"/>
        
            <?php   }else{ ?>
            <img src="../img/avatars/avatar.jpg" alt="alt text avatar" />
        <?php    
            }
    ?>

</div>
    <div class="user-comment-info-wrapper">
    <span class="user-comment__name"><?=$comment['name']?> <?=$comment['subname']?></span>
    <span class="user-comment__date"><i class="far fa-clock"></i><?=$comment['date_time']?></span>
        <div class="user-comment__text">
            <p><?=$comment['text']?></p>
        </div>
    </div>
</div>