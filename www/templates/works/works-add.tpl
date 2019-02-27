<div class="sticky-footer-content">
    <div class="container add-works pl-0 pr-0 pt-80 pb-120">
        <div class="row ml-0 mr-0">
            <div class="col-10 offset-1 pl-0 pr-0">
                <div class="add-works__title">
                     <?php require ( ROOT . "templates/_parts/_errors.tpl" )?>
                    <h1 class="title-general mt-0 mb-0">Добавить работу</h1>
                </div>
                <form class="add-works__form mt-40" action="<?=HOST?>works/works-add" method="POST" enctype="multipart/form-data" novalidate>
                    <div class="add-works__form-item mb-30">
                    <label class="label" for="field-work-name">Название</label>
                    <input class="input" name="workName" id="field-work-name" type="text" placeholder="Введите название работы" value="<?=@$works['work_name']?>" /></div>
                    <div class="add-post-content__name mt-40 mb-40">
                        <label class="label" for="add-post-name">Категории</label>
                        <select name='worksCat'>
                            <?php foreach ($cats as $cat): ?>
                            <option value="<?=$cat['id']?>"><?=$cat['cat_title']?></option>
                            <?php endforeach ?>
                        </select>
                    </div>
                    <div class="add-works__form-item mb-30">
                        <section class="upload-file">
                            <h6 class="upload-file__title">Изображение</h6>
                            <p class="upload-file__description">Изображение jpg или png, рекомендуемая ширина 945px и больше, высота от 400px и более, вес до 2Мб.</p>
                            <input class="input-file" type="file" name="upload-file" id="upload-file" data-multiple-caption="{count}" />
                            <label class="input-file-mark" for="upload-file">Выбрать файл</label><span>Файл не выбран</span>
                        </section>
                    </div>
                    <div class="add-works__form-item mb-30">
                    <div class="mb-20">
                    <label class="label" for="description-work">Содержание</label></div>
                    <textarea class="textarea" name="workDescription" id="workDescription" placeholder="Введите описание"></textarea></div>
                    <div class="add-works__form-item mb-30">
                    <label class="label" for="result-work">Результат</label>
                    <textarea class="textarea" name="workResult" id="workResult" placeholder="Введите описание"></textarea></div>
                    <div class="add-works__form-item mb-30"><label class="label" for="tech-for-work">Технологии</label>
                    <div class="mb-30">
                    <textarea class="textarea" name="workTechnology" id="ckEditor" placeholder="Введите описание"></textarea></div>
                    </div>
                    <div class="row ml-0 mr-0">
                        <div class="col-3 no-paddings mr-30"><label class="label" for="field-link-project">Ссылка на проект</label>
                        <input class="input" name="linkProject" id="field-link-project" type="url" placeholder="Введите ссылку" /></div>
                        <div class="col-3 no-paddings"><label class="label" for="link-on-github">Ссылка на GitHub</label>
                        <input class="input" name="linkGithub" id="link-on-github" type="url" placeholder="Введите ссылку" /></div>
                    </div>
                    <div class="row ml-0 mr-0 mt-30"><input class="button button-save mr-20" type="submit" name="save-button-work" value="Сохранить" />
                    <a class="button" href="<?=HOST?>works"/>Отмена</a></div>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="<?=HOST?>libs\ckeditor\ckeditor.js"></script>

<script>
document.addEventListener('DOMContentLoaded', function(){
CKEDITOR.replace( 'ckEditor' );
});
</script>