<?php function skillItem($name, $title){
		global $skills; ?>

	<div class="col-3">
	<div class="about-me-tech__input">
	<label class="label" for="technology-html"><?=$title?></label>
	<input class="input" name="<?=$name?>" id="technology-html" type="number" placeholder="0" min="0" max="100" value="<?=$skills[$name]?>" />
	<p class="percent">%</p>
	</div>
	</div>

<?php } ?>
<div class="content-exp-page">
		<div class="container">
			<div class="row">
				<div class="col-md-9 offset-md-1">

				<?php require(ROOT . 'templates/_parts/_errors.tpl');?>

					<h1 class="title-general mt-0 mb-35">Редактировать - Технологии</h1>
					<form action="<?HOST?>expirience-edit" method="POST" novalidate>
						<div class="row mb-40">
							<?php skillItem('html', 'HTML5');?>
							<?php skillItem('css', 'CSS3');?>
							<?php skillItem('js', 'JS');?>
							<?php skillItem('jquery', 'jQuery');?>
						</div>
						<div class="row mb-40">
							<?php skillItem('php', 'PHP');?>
							<?php skillItem('mysql', 'MYSQL');?>
						</div>
						<div class="row mb-40">
							<?php skillItem('git', 'GIT');?>
							<?php skillItem('gulp', 'GULP');?>
							<?php skillItem('npm', 'NPM');?>
							<?php skillItem('yarn', 'YARN');?>
						</div>
						<div class="row">
							<div class="col-auto pr-30">
							<input class="button button-save" type="submit" name="save-expirience" value="Сохранить" /></div>
							<div class="col-auto">
							<a class="button" href="<?HOST?>about"/>Отмена</a></div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>