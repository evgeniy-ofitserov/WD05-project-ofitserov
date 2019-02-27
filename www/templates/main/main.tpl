<div class="main-wrapper">
		<div class="about-me container section">
			<div class="wrapper-space-around">
            <?php if($about->about__img == '') { ?>
					<div class="avatar"><img src="../../img/avatars/avatar.jpg" alt="user-photo" /></div>
		<?php }else{ ?>
					<div class="avatar"><img src="<?=HOST?>usercontent\about\<?=$about->about__img?>" alt="user-photo" /></div>
        <?php } ?>
				<div class="about-me__description col-md-9">
					<h3 class="title-1 title-1--blue title-1--weight"><?=$about->name?></h3>
					<p class="paragraph paragraph--distance"><?=$about->desciption?></p>
		<?php if(mb_strlen($about->desciption, 'utf-8') > 1000 ) { ?>
					<div class="about-me__button"><a class="button" href="<?=HOST?>main?id=aboutFullpages">Подробнее</a></div>
		<?php }?>
				</div>
			</div>
		</div>
		<div class="line"></div>
		<div class="new-works container section">
			<div class="row">
				<div class="col-md-12">
					<h2 class="title-2 title-1--weight mb-30"> Новые <a href="<?HOST?>works"> <span class="title-1--underline">работы</span></a></h2>
				</div>
			</div>
			<div class="row">
			<?php foreach ($works as $item): ?>
			<div class="col-auto pl-0 pr-0 mr-20 mb-20">
				<div class="card-box card-box--height">
					<div class="card-box__img-portfolio">
					<?php if ($item->work_file != '') { ?>
						<img src="<?=HOST?>usercontent\work\<?=$item->work_file?>" />
					<?php } ?>						
						<img src="<?=HOST?>usercontent\work\no_image.png" />
					</div>

					<div class="card-box__title"><?=$item->work_name?></div>
					<a class="button card-box--button" href="<?=HOST?>works/page?id=<?=$item->id?>">Смотреть кейс</a>
				</div>
			</div>
		<?php endforeach ?>
		<?php if (count(@$item) == 0 ) { ?>
			<p>Список работ, пока пуст..</p>
		<?php }?>
			</div>
		</div>
		<div class="blog-entries container">
			<div class="row">
				<div class="col-md-12">
					<h2 class="title-2 title-1--weight"> Новые записи в <a href="blog"><span class="title-1--underline">блоге</span></a></h2>
				</div>
			</div>
			<div class="row">
        <?php foreach($posts as $post) { ?>
				<div class="col-md-4 mb-30">
					<div class="card-box">
						<div class="card-box__img-blog">
                        <?php if($post->post_img_small != '') { ?>
                            <img src="<?=HOST?>usercontent/post/<?=$post['post_img_small']?>" alt="<?=$post['title']?>" />
                        <?php } else { ?>
                            <img src="<?=HOST?>usercontent/post/image.png?>" alt="<?=$post['title']?>" />
                        <?php } ?>    
                        </div>
						<div class="card-box__title"><?=mbCutString($post['title'], 49)?></div><a class="button card-box--button" href="<?=HOST?>blog/post?id=<?=$post['id']?>">Читать</a>
					</div>
				</div>
		 <?php } ?>
		 <?php if (count($posts) == 0 ) { ?>
			<p>Новых записей пока нет..</p>
		<?php }?>
			</div>
		</div>
	</div>