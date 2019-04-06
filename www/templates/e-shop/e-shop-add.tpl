<div class="container pl-0 pr-0 pt-80 pb-120">
    <div class="row m-0">
        <div class="col-10 offset-1 p-0">
            <div class="add-post-content">
                <h1 class="title-general mt-0 mb-0">Добавить товар</h1>
				<?php include (ROOT . "templates/_parts/_errors.tpl");?>
                <form enctype="multipart/form-data" method="POST" action="<?=HOST?>e-shop/e-shop-add">
                    <div class="add-post-content__name mt-40"><label class="label" for="add-post-name">Название товара</label>
                    <input class="input" name="shop-name" id="shop-name" type="text" placeholder="Введите название товара" />
                </div>
            <div class="shop">
                <div class="add-post-content__name mt-40"><label class="label" for="add-post-name">Цена</label>
                    <input class="input" name="price" id="price" type="text" placeholder="Введите цену товара" />
                </div>
                <div class="add-post-content__name mt-40"><label class="label" for="add-post-name">Старая цена</label>
                    <input class="input" name="old-price" id="old-price" type="text" placeholder="Введите цену товара" />
                </div>
            </div>
                    <div class="add-post-content__img mt-30">
                        <section class="upload-file">
                            <h6 class="upload-file__title">Изображение</h6>
                            <p class="upload-file__description">изображение и параметры 945px и больше, высота от 400px</p>
                            <input class="input-file" type="file" name="shop_file" id="shop-file" data-multiple-caption="{count}" />
                            <label class="input-file-mark" for="shop-file">Выбрать файл</label><span>Файл не выбран</span>
                        </section>
                    </div>
                    <div class="add-post-content__main mt-30"><label class="label" for="add-post-city">Описание товара</label>
                    <textarea class="textarea" name="shop-description" id="add-post-city" placeholder="Введите описание товара"></textarea></div>
                    <div class="add-post-content__submit mt-30">
                    <input class="button button-save mr-20" type="submit" name="add-e-shop" value="Сохранить" />
                    <a class="button" href="<?=HOST?>e-shop">Отмена</a></div>
                </form>
            </div>
        </div>
    </div>
</div>