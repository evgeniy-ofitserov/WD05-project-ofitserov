<div class="container pt-55 pb-80">
    <div class="row">
    <?php if(isAdmin()): ?>
        <div class="col-12 clearfix mb-30">
            <a class="button float-right" href="<?=HOST?>contacts-messages">Сообщения</a>
            <a class="button button-edit float-right mr-20" href="<?=HOST?>contacts-edit">Редактировать</a>
        </div>
    <?php endif ?>
    </div>
</div>
