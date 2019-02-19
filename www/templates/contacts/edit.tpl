<div class="sticky-footer-content">
    <div class="container contacts-edit pl-0 pr-0 pt-80 pb-120">

        <div class="contacts-edit__title">
            <h1 class="title-general mt-0 mb-30">Редактировать данные</h1>
				<?php include (ROOT . "templates/_parts/_errors.tpl");?>
        </div>
            <form class="contacts-edit__form mt-40" action="<?=HOST?>contacts-edit" method="POST" novalidate>
            <div class="row">

                <div class="col-md-3 mb-30">
                <label class="label" for="contactName">Имя</label>
                <input class="input mb-30" name="first-name" id="contactName" type="text" placeholder="Введите имя" value="<? echo @$_POST['name'] != '' ? @$_POST['name'] : $contacts['name']; ?>"/>


                <label class="label" for="contactEmail">Email</label>
                <input class="input mb-30" name="email" id="contactEmail" type="text" placeholder="Введите email"  value="<? echo @$_POST['email'] != '' ? @$_POST['email'] : $contacts['email']; ?>"/>
                <label class="label" for="contactVK">Вконтакте</label>
                <input class="input mb-30" name="vkontakte" id="contactVK" type="url" placeholder="Введите ссылку на профиль"  value="<? echo @$_POST['vkontakte'] != '' ? @$_POST['vkontakte'] : $contacts['vk']; ?>" />
                <label class="label" for="contactPhone">Телефон</label>
                <input class="input" name="phone" id="contactPhone" type="tel" placeholder="Введите телефон" value="<? echo @$_POST['phone'] != '' ? @$_POST['phone'] : $contacts['phone']; ?>"/></div>
                <div class="col-md-3">
                <label class="label" for="contactLastName">Фамилия</label>
                <input class="input mb-30" name="last-name" id="contactLastName" type="text" placeholder="Введите фамилию" value="<? echo @$_POST['last-name'] != '' ? @$_POST['last-name'] : $contacts['subname']; ?>"/>
                <label class="label" for="contactSkype">Skype</label>
                <input class="input mb-30" name="skype" id="contactSkype" type="text" placeholder="Введите skype" value="<? echo @$_POST['skype'] != '' ? @$_POST['skype'] : $contacts['skype']; ?>"/>
                <label class="label" for="contactFacebook">Facebook</label>
                <input class="input mb-30" name="facebook" id="contactFacebook" type="url" placeholder="Введите ссылку на профиль" value="<? echo @$_POST['facebook'] != '' ? @$_POST['facebook'] : $contacts['facebook']; ?>"/>
                <label class="label" for="contactAddress">Адрес</label>
                <input class="input" name="address" id="contactAddress" type="text" placeholder="Введите адрес" value="<? echo @$_POST['address'] != '' ? @$_POST['address'] : $contacts['address']; ?>"/></div>
                <div class="col-md-3 position-field">
                <div class="input-box"><label class="label" for="contactGithub">Github</label>
                <input class="input" name="github" id="contactGithub" type="url" placeholder="Введите ссылку на профиль" value="<? echo @$_POST['github'] != '' ? @$_POST['github'] : $contacts['github']; ?>" /></div>
                </div>
                <div class="col-md-3 position-field">
                <div class="input-box">
                <label class="label" for="contactTW">Twitter</label>
                <input class="input" name="twitter" id="contactTW" type="url" placeholder="Введите ссылку на профиль" value="<? echo @$_POST['twitter'] != '' ? @$_POST['twitter'] : $contacts['twitter']; ?>"/></div>
                </div>
                <div class="col-mb-4"><input class="button button-save ml-15 mr-20" type="submit" name="save-button" value="Сохранить" />
                <a href="<?=HOST?>contacts" class="button" />Отмена</a></div>
            </div>
        </form>
    </div>
</div>