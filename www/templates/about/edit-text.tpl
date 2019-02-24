<div class="about-me-edit">
		<div class="container">
			<div class="row">
				<div class="col-md-10 offset-md-1">
					<h1 class="title-general edit-title--color mt-0 mb-35">Редактировать - Обо Мне</h1>
							<?php require(ROOT . 'templates/_parts/_errors.tpl');?>
					<form class="about-me-edit-info-form" id="about-me-edit-info" action="<?HOST?>edit-text" enctype="multipart/form-data" method="POST">
						<div class="edit-name">
						<label class="label" for="editFullName">Имя, фамилия</label>
						<input class="input" name="fullName" id="editFullName" type="text" placeholder="Введите имя и фамилию"  value="<?=$about->name?>"/></div>
						<div class="upload-photo mt-30 mb-35">
							<section class="upload-file">
								<h6 class="upload-file__title">Фотография</h6>
								<p class="upload-file__description">Изображение jpg или png, рекомендуемый размер 205x205 пикселей, и весом до 2Мб.</p>
								<input class="input-file" type="file" name="upload-file" id="upload-file" data-multiple-caption="{count}" />
								<label class="input-file-mark" for="upload-file">Выбрать файл</label><span>Файл не выбран</span>
							</section>
						<?php if($about->about__img == '') { ?>
							<div class="edit-information mt-20"><label class="label" for="about-me-edit-info">Фотография отсутствует</label></div>
						<?php }else{ ?>
							<div class="edit-information mt-20"><label class="label" for="about-me-edit-info">Загруженное фото на главной</label></div>
						<?php } ?>
						<?php if($about->about__img == '') { ?>
							<div class="upload-photo__result"><img src="../../img/avatars/avatar.jpg" alt="user1-photo" /></div>
						<?php }else{ ?>
							<div class="upload-photo__result"><img src="<?=HOST?>usercontent\about\<?=$about->about__img?>" alt="user-photo2" /></div>
						<?php } ?>
						</div>
						<div class="edit-information mb-10"><label class="label" for="about-me-edit-info">Информация на главной</label>
						<div class="mt-20">
						<textarea class="textarea edit-information__textarea" name="about-me-info" id="ckEditor" placeholder="Напишите информацию о себе"><?=$about->desciption?></textarea></div></div>
						<div class="about-me-edit-buttons">
						<input class="button button-save mr-20" type="submit" name="save-button" value="Сохранить" />
						<a href="<?=HOST?>about" class="button" name="cancellation" />Отмена</a></div>
					</form>
				</div>
		</div>
	</div>
</div>
<script src="<?=HOST?>libs\ckeditor\ckeditor.js"></script>
<script>
document.addEventListener('DOMContentLoaded', function(){
CKEDITOR.replace( 'ckEditor' );
});
</script>