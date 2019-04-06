	<div class="separate-work-wrapper">
		<div class="separate-work-header-bg mb-50">
			<div class="container">
				<div class="separate-work-head">
					<div class="row no-gutters justify-content-between">
						<div class="col-8 offset-1">
							<h1 class="title-general separate-work-title--size"><?=$work['work_name']?></h1>
						</div>
						<?php if(isAdmin()){ ?>
						<div class="col-2">
							<div class="separate-work-head__button-edit">
							<a class="button button-edit mb-15" href="<?=HOST?>works/works-edit?id=<?=$work['id']?>">Редактировать</a>
							<a class="button button-delete" href="<?=HOST?>works/works-delete?id=<?=$work['id']?>">Удалить</a></div>
						</div>
						<?php } ?>
					</div>
				</div>

				<div class="separate-work-info mt-10">
					<div class="row">
						<div class="col-8 offset-1"><span class="separate-work-info__author mr-20"></span>
						<a class="separate-work-info__category mr-20" href="#">Категория: <?=$work['cat_title']?></a>
						<span class="separate-work-info__date">
						<?php if ($work['up_date_time'] == '') { ?>
						<?php echo rus_date('j F Y H:i', strtotime($work['date_time']))?>
						<?php }else{ ?>
							<span>Обновлено:</span>
						<?php echo rus_date('j F Y H:i', strtotime($work['up_date_time']))?>
						<?php }?>
						</span></div>
					</div>
				</div>
				<div class="separate-work-image mt-55">
					<div class="row">
						<div class="col-10 offset-1">
						<img src="<?=HOST?>usercontent/work/<?=$work['work_file']?>" alt="Сайт компании" /></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="separate-work-description-wrapper">
				<div class="row">
					<div class="col-5 offset-1">
						<div class="separate-work-description">
							<h3 class="title-3 mt-0 mb-20 strong">Кратко о проекте</h3>
							<p><?=$work['work_description']?></p>

						</div>
						<div class="separate-work-result">
							<h3 class="title-3 mb-20 mt-20 strong">Результат</h3>
							<p><?=$work['work_result']?></p>
						</div>
					</div>
					<div class="col-5">
						<div class="separate-work-technologies">
							<h3 class="title-3 mb-20 mt-0 strong">Технологии</h3>
							<p><?=$work['work_technology']?></p>
						</div>
						<div class="separate-work-link-project mb-35">
							<h3 class="title-3 mb-20 mt-25 strong">Ссылка на проект</h3><a class="separate-work-link-project__link" href="<?=$work['link_project']?>"><?=$work['link_project']?></a>
						</div>
						<div class="separate-work-link-github">
							<h3 class="title-3 title-3 mb-20 mt-0 strong">Код на github</h3><a class="separate-work-link-github__link" href="<?=$work['link_github']?>"><?=$work['link_github']?></a>
						</div>
					</div>
				</div>
			</div>
			<div class="separate-work-pagination-wrapper mt-45">
				<div class="row">
					<div class="col-10 offset-1 offset--footer">
						<div class="separate-work-pagination"><a class="button button-previous button-work-pagination-prev" href="#">Все работы <span class="button__icon button__icon--mright float-left"><i class="mr-0 fas fa-arrow-left"></i></span></a><a class="button button-next button-work-pagination-next" href="#">Следующая работа <span class="button__icon"><i class="mr-0 fas fa-arrow-right"></i></span></a></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	