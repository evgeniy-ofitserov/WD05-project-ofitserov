<div class="container pl-0 pr-0 pt-80 pb-120">
    <div class="row m-0">
        <div class="col-10 offset-1 p-0">
            <div class="add-post-content">
                <h1 class="title-general mt-0 mb-10">Удалить категорию</h1>

                <form method="POST" action="<?=HOST?>blog/category-delete?id=<?=$cat['id']?>">
                    <div class="add-post-content__name mt-40">
                       <p>Вы действительно хотите удалить категорию <strong>"<?=$cat['cat_title']?></strong> ?</p>
                       
                    </div>
                    <div class="add-post-content__submit mt-30">
                        <input class="button button-delete mr-20" type="submit" name="cat-del" value="Удалить"/>
                        <a class="button" href="<?=HOST?>blog/categories">Отмена</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>