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
						<div class="post-info__comments"><a class="postlink" href="#">2 комментария</a></div>
					</div>
                        <div class="post-img">
                       
					    <?php if($post['post_img'] != '') { ?>
                            <img src="<?=HOST?>usercontent/post/<?=$post['post_img']?>" alt="<?=$post['title']?>" />

                        <?php } ?>

                    </div>
					<div class="post-content mb-25">
						<p class="post-content__text"><?=$post['text']?></p>
					</div>
					<div class="post-buttons-nav mb-25"><a class="button button-previous" href="#">Назад <span class="button__icon button__icon--mright float-left"><i class="mr-0 fas fa-arrow-left"></i></span></a><a class="button button-next" href="#">Вперед <span class="button__icon"><i class="fas fa-arrow-right"></i></span></a></div>
				</div>
			</div>
		</div>
		<div class="user-comments-wrapper mb-25">
			<div class="row">
				<div class="col-10 offset-1">
					<div class="title-2">2 комментария</div>
					<div class="user-comment">
						<div class="user-comment__avatar">
							<div class="avatar avatar--small"><img src="../img/avatars/avatar.jpg" alt="Джон До собственной персоной" /></div>
						</div>
						<div class="user-comment-info-wrapper"><span class="user-comment__name">Джон До</span><span class="user-comment__date"><i class="far fa-clock"></i>01 декабря 2018 года в 15:37</span>
							<div class="user-comment__text">
								<p>Замечательный парк, обязательно отправлюсь туда этим летом. </p>
							</div>
						</div>
					</div>
					<div class="user-comment">
						<div class="user-comment__avatar">
							<div class="avatar avatar--small"><img src="../img/avatars/avatar.jpg" alt="Джейн До собственной персоной" /></div>
						</div>
						<div class="user-comment-info-wrapper"><span class="user-comment__name">Джейн До</span><span class="user-comment__date"><i class="far fa-clock"></i>02 декабря 2018 года в 19:47</span>
							<div class="user-comment__text">
						<p class="post-content__text"> Центром парка является долина <a class="link" href="#">Йосемити</a> круглый год переполненная туристами, зато в большей части парка никаких туристов нет. Если вы хотите погулять по территории парка, к вашим услугам огромная разветвлённая система троп, по которым проложены маршруты длительностью от получаса до нескольких дней. Ко всем этим прелестям бесплатно прилагаются животные и птицы. Если, на ваше счастье, медведей вы скорее всего не увидите, то оленей или бурундуков увидите почти гарантированно, даже не обладая специальными навыками. </p>
								<p></p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-10 offset-1">

				<h2 class="title-2 m-0 mb-15">Оставить комментарий</h2>
				<div class="comments-submit">
					<div class="avatar avatar--small">
					    <?php    
                                if( $_SESSION['logger_user']['avatar_small'] != '' ){?>
                                <img src="<?=HOST?>usercontent/avatar/<?=$_SESSION['logger_user']['avatar_small']?>" alt="<?=$_SESSION['logger_user']['avatar_small']?> "/>
                                    
                             <?php   }else{ ?>
                                <img src="../img/avatars/avatar.jpg" alt="alt text avatar" />
                            <?php    
                                }
                        ?>
					<img src="<?=HOST?>usercontent/avatar/<?=$_SESSION['logger_user']['avatar_small']?>" alt="<?=$pos['title']?>" /></div>
					<div class="comments-form"><b class="comments__author"><?=$_SESSION['logger_user']['name']?>
					<?=$_SESSION['logger_user']['subname']?></b>

						<form action="<?=HOST?>blog/post?id=<?=$post['id']?>" id="form-comment" method="POST">
						<div class="notification">
              			  <?php require(ROOT . 'templates/_parts/_errors.tpl');?>

						<div class="notification__title notification--error ">Комментарий не может быть пустым</div>
						</div>

						<textarea class="textarea" name="comment-text" id="comment-text" placeholder="Присоединиться к обсуждению..."></textarea>
						<input type="hidden"  name="comment-add" />
						<input class="button mt-10" type="submit" id="comment-add"  value="Опубликовать" />
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>