<?php foreach($errors as $error) { ?>
        <?php if(count($errors) == 1) { ?>
            <div class="notification">
                <div class="notification__title notification--error notification--with-description mt-10 mb-10"><?=$error['title']?></div>
            </div>
    <?php } else if(count($errors) == 2)  { ?>
        <div class="notification">
            <div class="notification__title notification--error notification--with-description"><?=$error['title']?></div>
                <div class="notification__description tac">
                    <?=@$error['descr']?>
            </div>
        </div>
    <?php } ?>
<?php } ?>

<?php ?>
