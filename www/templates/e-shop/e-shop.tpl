<div class="container pb-120 pt-80 pl-0 pr-0">
<?php include (ROOT . "templates/e-shop/_results.tpl");?>
    <div class="blog-title mb-40">
        <h1 class="title-general mb-0 mt-0 blog-title--color">Товары магазина</h1>
    <?php  if(isAdmin()){?>
        <a class="button button-edit" href="<?=HOST?>e-shop/e-shop-add">Добавить товар</a>
    <?php }?>
    </div>

    <div class="row ml-0 mr-0 mb-50">
    <?php foreach ($shop as $item) { ?>
        <div class="col-auto pl-0 pr-0 mr-20">
            <div class="card-box card-box--eshop">
                <div class="card-box__img-blog card-box__img-blog--eshop"><img src="<?=HOST?>usercontent\shop\<?=$item->shop_img?>"/></div>
                <div class="card-box__title card-box__title--eshop"><?=$item->shop_name?></div>
                <div class="title_price">Цена:</div>
                <div class=" d-flex">
                <span class="shop_price shop_price--red"><?=$item->price?></span>
                <strike><span class="shop_price"><?=$item->old_price?></span></strike>
                <a class="button card-box--button" href="<?=HOST?>e-shop/e-shop-page?id=<?=$item->id?>">Подробнее</a>
            
            </div>
            </div>
        </div>
    <?php } ?>  

<?php if (count($shop) == 0) { ?>

    <p>Товары отсутствуют..</p>

<?php } ?>

    </div>
</div>