<div class="content-exp-page">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-10">
				<h1 class="title-general mt-0 mb-35">Редактировать - Опыт работы</h1>

			<?php foreach ($jobs as $job){ ?>
				<div class="message-user mb-20">
				<form action="<?=HOST?>skills-edit?id=<?=$job['id']?>" method="POST">
				<input class="button button-delete button--small-delete float-right" name="del-jobs" type="submit" value="Удалить">
				</form>
				<div class="message-user__date mb-20"><?=$job->period?></div>
				<div class="message-user-info">
					<h4 class="title-4 mt-0 mb-0"><?=$job->job_name?></h4>
				</div>
				<p class="about-me-job__text"><?=$job->job_description?></p>
			</div>
			<?php } ?>

				<form action="<?=HOST?>skills-edit" method="POST" novalidate >
				<h3 class="title-3 mt-0 mb-35">Добавить новое место</h3>

				<?php require(ROOT . 'templates/_parts/_errors.tpl');?>

				<div class="about-me-edit-form">
				<label class="label" for="work-date">Период</label>
				<input class="input" name="period" id="work-date" type="text" placeholder="Введите даты начала и окончания работы" value="<?=@$_POST['period']?>" />
				<label class="label" for="name-post">Название должности</label>
				<input class="input" name="job-name" id="name-post" type="text" placeholder="Введите название должности" value="<?=@$_POST['job-name']?>" />
				<label class="label" for="description-text">Описание работы, должностные обязанности, достигнутые результаты</label>
				<textarea class="textarea" name="job-description" id="description-text" placeholder="Напишите краткое содержательное описание"><?=@$_POST['job-description']?></textarea>
				<input class="button button-save" type="submit" name="new-job" value="Добавить" />
				</div>
				</form>
			</div>
		</div>
	</div>
</div>