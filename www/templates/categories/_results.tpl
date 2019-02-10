<?php



if($_GET['result'] == 'catCreated'){ ?>

<div class="success notification__title notification--error notification--with-description mb-50">
<p>Категория добавлена</p>

</div>
<?php } ?>



<?php

if($_GET['result'] == 'catUpdated'){ ?>
<div class="success notification__title notification--error notification--with-description mb-50">
Категория обновлена
</div>


<?php } ?>




<?php

if($_GET['result'] == 'catDeleted'){ ?>
<div class="errors notification__title notification--error notification--with-description mb-50">
 Категория удалена !
</div>


<?php } ?>
<?php

