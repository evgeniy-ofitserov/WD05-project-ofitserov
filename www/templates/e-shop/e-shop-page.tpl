<div class="container pt-80 pb-120">
		<div class="row">
			<div class="col-10 offset-1">
				<div class="post">
					<div class="post-head">
                        <h1 class="title-general mb-0 mt-0"><?=$shop->shop_name?></h1>
				
                    <?php if(isAdmin()) { ?>
					<div class="d-flex">
                        <a class="button button-edit post-head--position" href="<?=HOST?>e-shop/e-shop-edit?id=<?=$shop->id?>">Редактировать</a>
					</div>
					<a class="button button-delete post-head--position" href="<?=HOST?>e-shop/e-shop-delete?id=<?=$shop->id?>">Удалить</a>

                    <?php } ?>
					</div>
					<div class="post-img mt-50">
                        <img src="<?=HOST?>usercontent\shop\<?=$shop->shop_img?>" alt="<?=$shop->shop_name?>" />
                    </div>
					<div class="post-content mb-25">
						<p><?=$shop->description?></p>
					</div>
				</div>
 
				<div class="title_price center">Цена товара:</div>
                <div class=" d-flex">
                <span class="shop_price shop_price--red"><?=$shop->price?></span>
                <strike><span class="shop_price"><?=$shop->old_price?></span></strike>

				<form action="<?=HOST?>e-shop/addtocart" id="addToCart" method="POST" >
                <input type="hidden" name="shopId" class="button card-box--button" value="<?=$shop->id?>">
                <input type="submit" name="itemId" class="button card-box--button" value="В корзину">
				</form>
 

            </div>
            </div>
			</div>
		</div>
	</div>