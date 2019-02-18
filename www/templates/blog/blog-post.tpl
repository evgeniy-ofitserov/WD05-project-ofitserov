<div class="container pt-80 pb-120">
		<div class="post">
			<div class="row">
				<div class="col-10 offset-1">
				   <?php if( isAdmin() ) { ?>
					<div class="post-head">
						<h1><?=$post['title']?></h1>
                        <a href="<?=HOST?>blog/post-edit?id=<?=$post['id']?>" class="button button-edit post-head--position " name="edit-button"/>Редактировать</a>
					</div>
				<?php } ?>
				 <?php if( isAdmin() ) { ?>
					<div class="post-head mt-30">
						<a href="<?=HOST?>blog/post-delete?id=<?=$post['id']?>" class="button button-delete post-head--position post-head--position--del" name="delete-button"/>Удалить</a>
					</div>
				<?php } ?>
					<div class="post-info">
						<div class="post-info__author"><?=$post['name']?> <?=$post['subname']?></div>
						<div class="post-info__topic"><a class="postlink" href="#"><?=$post['cat_title']?></a></div>
						<div class="post-info__date"><? echo rus_date('j F Y H:i', strtotime($post['date_time']))?></div>
						<div class="post-info__comments"><a class="postlink" href="#"><?php commentNumber(count($comments))?></a></div>
					</div>
                        <div class="post-img">
					    <?php if($post['post_img'] != '') { ?>
                            <img src="<?=HOST?>usercontent/post/<?=$post['post_img']?>" alt="<?=$post['title']?>" />
                        <?php } ?>
                    </div>
					<div class="post-content mb-25">
						<p class="post-content__text"><?=$post['text']?></p>
					</div>
					<div class="post-buttons-nav mb-25">
					<a class="button button-previous" href="#">Назад <span class="button__icon button__icon--mright float-left"><i class="mr-0 fas fa-arrow-left"></i></span></a>
					<a class="button button-next" href="#">Вперед <span class="button__icon"><i class="fas fa-arrow-right"></i></span></a></div>
				</div>
			</div>
		</div>
		<div class="user-comments-wrapper mb-25">
			<div class="row">
				<div class="col-10 offset-1">	
				<?php if(count($comments) > 0 ) {?>
				<div class="title-2"><?php commentNumber(count($comments))?></div>
					<?php foreach ($comments as $comment) {?>
					<?php include ROOT . "templates/blog/_comment-card.tpl" ?>
				<?php }?>

				<?php }?>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-10 offset-1">
				<?php include(ROOT . 'templates/blog/_add-comment.tpl');?>
			</div>
		</div>
	</div>