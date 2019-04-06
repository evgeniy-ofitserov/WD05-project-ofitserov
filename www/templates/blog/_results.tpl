<?php

if($_GET['result'] == 'postDeleted'){ ?>
<div class="notification">
<div class="errors notification__title notification--error notification--with-description mb-50">
Пост удален!
</div>
</div>
<?php } ?>

<?php

if($_GET['result'] == 'postCreated'){ ?>
<div class="notification">
<div class="success notification__title notification--error notification--with-description mb-50">
Пост добавлен !
</div>

</div>
<?php } ?>



<?php

if($_GET['result'] == 'postUpdated'){ ?>
<div class="notification">
<div class="success notification__title notification--error notification--with-description mb-50">
Пост обновлен !
</div>
</div>
<?php } ?>

<?php

if($_GET['result'] == 'workUpdated'){ ?>
<div class="notification">
<div class="success notification__title notification--error notification--with-description mb-50">
Работа обновлена!
</div>
</div>
<?php } ?>

<?php

if($_GET['result'] == 'workDeleted'){ ?>
<div class="notification">
<div class="errors notification__title notification--error notification--with-description mb-50">
Работа удалена!
</div>
</div>
<?php } ?>


