<div class="container pb-120 pt-80 pl-0 pr-0">
<?php if(isset($_GET['result'])){include ROOT . "templates/blog/_results.tpl";}?>
		<div class="works-title mb-35">
			<div class="works-title-left">
				<h1 class="works-title-text">
                <span class="works-title-text--bold">Работы</span>, которые сделал я и моя команда</h1>
            </div>

			<div class="works-title-right">
            <?php if(isAdmin()) { ?>
                <a class="button button-edit" href="<?=HOST?>works/works-add">Добавить работу</a>
				
         <?php } ?>
            </div>
        </div>
       
		<div class="row ml-0 mr-0 mb-50">
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
		<?php if (count($works) == 0 ) { ?>
			<p>Список работ, пока пуст..</p>
		<?php }?>
	</div>
</div>