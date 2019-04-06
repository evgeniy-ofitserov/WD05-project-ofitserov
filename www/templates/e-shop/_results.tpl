<?php 
if(@$_GET['result'] == 'addShopSuccess'){ ?>
<div class="notification">
<div class="success notification__title notification--error notification--with-description mb-50">
Товар добавлен на страницу!
</div>
</div>
<?php } ?>


<?php 
if(@$_GET['result'] == 'shopPageUpdated'){ ?>
<div class="notification">
<div class="success notification__title notification--error notification--with-description mb-50">
Товар обновлен!
</div>
</div>
<?php } ?>
<?php 
if(@$_GET['result'] == 'shopDeleted'){ ?>
<div class="notification">
<div class="errors notification__title notification--error notification--with-description mb-50">
Товар удален!
</div>
</div>
<?php } ?>
