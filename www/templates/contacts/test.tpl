<?php if($contacts['email'] != '') { ?>
    <div class="row mb-15">
        <div class="col-6 contacts-category">
            <p>Email</p>
        </div>
        <div class="col-6 link-box-info">
            <p><a class="link" href="#!"><?=$contacts['email']?></a></p>
        </div>
    </div>
<?php } ?>

<?php if($contacts['skype'] != '') { ?>
    <div class="row mb-15">
        <div class="col-6 contacts-category">
            <p>Skype</p>
        </div>
        <div class="col-6 link-box-info">
            <p><a class="link" href="#!"><?=$contacts['skype']?></a></p>
        </div>
    </div>
<?php } ?>

<div class="row mb-15">
    <div class="col-6 contacts-category">
        <p>Социальные сети</p>
    </div>
    <div class="col-6 link-box-info">
        <?php if($contacts['vk'] != '') { ?>
                <p><a class="link link--bold" href="<?=$contacts['vk']?>">Вконтакте</a></p>
        <?php }?>
        <?php if($contacts['facebook'] != '') { ?>
                <p><a class="link link--bold" href="<?=$contacts['facebook']?>">Facebook</a></p>
        <?php }?>
    </div>
</div>



<?php if($contacts['github'] != '') { ?>
    <div class="row mb-15">
        <div class="col-6 contacts-category">
            <p>GitHub</p>
        </div>
        <div class="col-6 info">
        <p><a class="link link--bold" href="<?=$contacts['github']?>">GitHub</a></p>
        </div>
    </div>
<?php } ?>


<?php if($contacts['twitter'] != '') { ?>
    <div class="row mb-15">
        <div class="col-6 contacts-category">
            <p>Twitter</p>
        </div>
        <div class="col-6 info">
        <p><a class="link link--bold" href="<?=$contacts['twitter']?>">Twitter</a></p>
        </div>
    </div>
<?php }?>


<div class="row mb-15">
    <?php if($contacts['phone'] != '') { ?>
        <div class="col-6 contacts-category">
            <p>Телефон</p>
        </div>
        <div class="col-6 info">
            <p><?=$contacts['phone']?></p>
        </div>
    <?php }?>
</div>


<?php if($contacts['phone'] != '') { ?>
    <div class="row mb-15">
        <div class="col-6 contacts-category">
            <p>Адрес</p>
        </div>
        <div class="col-6 info">
            <p><?=$contacts['address']?></p>
        </div>
    </div>
<?php } ?>


<div class="title-general mb-40">Связаться со мной</div>
<?php require(ROOT . 'templates/_parts/_errors.tpl');?>
<?php require ROOT . "templates/_parts/_success.tpl" ?>

<form class="feedback-form" action="<?=HOST?>contacts" method="POST" enctype="multipart/form-data" novalidate>
    <input class="input" name="name" type="text" placeholder="Введите имя" />
    <input class="input" name="email" type="email" placeholder="Email" />
    <textarea class="textarea mb-20" name="message" placeholder="Сообщение"></textarea>
    <section class="upload-file">
        <h6 class="upload-file__title">Прикрепить файл</h6>
        <p class="upload-file__description">jpg, png, pdf, doc, весом до 2Мб.</p>
        <input class="input-file" type="file" name="file" id="upload-file" data-multiple-caption="{count}" />
        <label class="input-file-mark input-file-mark--rounded" for="upload-file">Выбрать файл</label><span>Файл не выбран</span>
    </section>
    <input class="button button-save mt-20" type="submit" name="message-button" value="Отправить" />
</form>

