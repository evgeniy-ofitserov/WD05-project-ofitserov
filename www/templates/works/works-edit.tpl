<div class="sticky-footer-content">
    <div class="container add-works pl-0 pr-0 pt-80 pb-120">
        <div class="row ml-0 mr-0">
            <div class="col-10 offset-1 pl-0 pr-0">
            <?php require ( ROOT . "templates/_parts/_errors.tpl" )?>            
                <div class="add-works__title">
                    <h1 class="title-general mt-0 mb-0">Редактировать работу</h1>
                </div>
                <form class="add-works__form mt-40" enctype="multipart/form-data" method="POST" action="<?=HOST?>works/works-edit?id=<?=$works['id']?>" novalidate>
                    <div class="add-works__form-item mb-30"><label class="label" for="field-work-name">Название</label>
                    <input class="input" name="workName" id="field-work-name" type="text" placeholder="Введите название работы" value="<?=$works['work_name']?>" /></div>
                                        <div class="add-post-content__name mt-40 mb-40">
                        <label class="label" for="add-post-name">Категории </label>
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
                
                    <div class="section-ui mb-30">
                             <h6 class="upload-file__title">Загруженная картинка ранее</h6>
                            <section class="upload-file">
                                <div class="upload-file-image-box">
                                <img src="<?=HOST?>/usercontent/work/<?=$works['work_file']?>" alt="Изображение" />
                            </div>
                            </section>
                    </div>
                    <div class="add-works__form-item mb-30"><label class="label" for="description-work">Содержание</label>
                    <textarea class="textarea" name="workDescription" id="description-work" placeholder="Введите описание"><?=$works['work_description']?></textarea></div>
                    <div class="add-works__form-item mb-30"><label class="label" for="result-work">Результат</label>
                    <textarea class="textarea" name="workResult" id="result-work" placeholder="Введите описание"><?=$works['work_result']?></textarea></div>
                    <div class="add-works__form-item mb-30"><label class="label" for="tech-for-work">Технологии</label>
                    <div class="mt-15">
                    <textarea class="textarea" name="workTechnology" id="ckEditor" placeholder="Введите описание"><?=$works['work_technology']?></textarea></div>
                    </div>
                    <div class="row ml-0 mr-0">
                        <div class="col-3 no-paddings mr-30"><label class="label" for="field-link-project">Ссылка на проект</label>
                        <input class="input" name="linkProject" id="field-link-project" type="url" placeholder="Введите ссылку" value="<?=$works['link_project']?>"/></div>
                        <div class="col-3 no-paddings"><label class="label" for="link-on-github">Ссылка на GitHub</label>
                        <input class="input" name="linkGithub" id="link-on-github" type="url" placeholder="Введите ссылку" value="<?=$works['link_github']?>"/></div>
                    </div>
                    <div class="row ml-0 mr-0 mt-30">
                        <input class="button button-save mr-20" type="submit" name="update-button-work" value="Сохранить" />
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