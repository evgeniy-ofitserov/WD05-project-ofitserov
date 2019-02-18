
<?php if(isLoggedIn() ) { ?>
		<h2 class="title-2 m-0 mb-15">Оставить комментарий</h2>
		<div class="comments-submit">
			<div class="avatar avatar--small">
				<?php if( $_SESSION['logger_user']['avatar_small'] != '' ) { ?>
					<img src="<?=HOST?>usercontent/avatar/<?=$_SESSION['logger_user']['avatar_small']?>" alt="<?=$_SESSION['logger_user']['avatar_small']?> "/>
				<?php } else { ?>
					<img src="../img/avatars/avatar.jpg" alt="alt text avatar" />
				<?php } ?>
			<img src="<?=HOST?>usercontent/avatar/<?=$_SESSION['logger_user']['avatar_small']?>" alt="<?=$post['title']?>" /></div>
			<div class="comments-form"><b class="comments__author"><?=$_SESSION['logger_user']['name']?>
			<?=$_SESSION['logger_user']['subname']?></b>
				<?php include(ROOT . 'templates/_parts/_errors.tpl');?>
				<form action="<?=HOST?>blog/post?id=<?=$post['id']?>" id="form-comment" method="POST">
				<textarea class="textarea" name="comment-text" id="comment-text" placeholder="Присоединиться к обсуждению..."></textarea>
				<input class="button mt-10" name="comment-add" type="submit" id="comment-add"  value="Опубликовать" />
				</form>
			</div>
		</div>
<?php } else { ?>
    <div class="comments-unregistered">
        <p class="comments-unregistered__note">
            <a class="link" href="<?=HOST?>login">Войдите</a> или 
            <a class="link" href="<?=HOST?>registration">Зарегистрируйтесь</a> чтобы оставить комментарий
        </p>
    </div>
<?php } ?>