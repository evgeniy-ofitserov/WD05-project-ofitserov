<?php

if($_GET['result'] == 'postDeleted'){ ?>

<div class="errors notification__title notification--error notification--with-description mb-50">
Пост удален!
</div>
<?php } ?>

<?php

if($_GET['result'] == 'postCreated'){ ?>
<div class="success notification__title notification--error notification--with-description mb-50">
Пост добавлен !
</div>


<?php } ?>



<?php

if($_GET['result'] == 'postUpdated'){ ?>
<div class="success notification__title notification--error notification--with-description mb-50">
Пост обновлен !
</div>


<?php } ?>