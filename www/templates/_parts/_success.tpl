
<?php 

foreach($success as $value){
    if( count($value) == 1 ){?>


        <div class="success notification__title notification--error notification--with-description"><?=$value['title']?></div>


 <?php   }else if( count($value) == 2 ){ ?>
    
    <div class="success notification__title notification--error notification--with-description"><?=$value['title']?></div>
        <div class="notification__description">
                <?=@$value['descr']?>
        </div>
<?php    
    }

} 

?>

