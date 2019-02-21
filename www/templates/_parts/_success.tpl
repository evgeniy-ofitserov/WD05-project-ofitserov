<?php foreach($success as $itemSuccess) {
    if(count($itemSuccess) == 1) { ?> 
        <div class="notification">
            <div class="notification__title notification--success mt-10 mb-10">
                <?=$itemSuccess['title']?>
            </div>
        </div>
    <?php } else if(count($itemSuccess) == 2) { ?>
        <div class="notification">
            <div class="notification__title notification--success notification--with-description"><?=$itemSuccess['title']?></div>
                <div class="notification__description tac">
                    <?=@$itemSuccess['descr']?>
                </div>
            </div>
        </div>
    <?php } ?>
<?php } ?>

