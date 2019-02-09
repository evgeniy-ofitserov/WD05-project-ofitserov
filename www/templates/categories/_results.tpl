<?php



if($_GET['result'] == 'catCreated'){ ?>

<div class="success notification__title notification--error notification--with-description mb-50">
<p>Категория добавлена</p>

</div>
<?php } ?>



<?php

if($_GET['result'] == 'catUpdated'){ ?>
<div class="success notification__title notification--error notification--with-description mb-50">
<p> Категория обновлена </p>
</div>


<?php } ?>




<?php

if($_GET['result'] == 'catDeleted'){ ?>
<div class="errors notification__title notification--error notification--with-description mb-50">
<p> Категория удалена !</p>
</div>


<?php } ?>
