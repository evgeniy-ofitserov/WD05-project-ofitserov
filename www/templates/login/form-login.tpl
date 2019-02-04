<div class="container">
    <div class="row">
        <div class="col-12 flex--center">
            <div class="autorization-content">
                <h1 class="autorization-content__title mb-40">Вход на сайт</h1>
                <form class="autorization-content-form" action="" method="POST" novalidate>
                    <div class="notification">
                         <?php require ROOT . "templates/_parts/_errors.tpl" ?>
                    </div>
                    <input class="input mb-10 mt-20" name="email" id="input-email" type="email" placeholder="E-mail" value="<?=$userEmail?>"/>
                    <input class="input mb-25" name="password" id="input-password" type="password" placeholder="Пароль" value="<?=$userPass?>"/>
                    <div class="autorization-content-form-help mb-30">
                    <label class="form__label-checkbox">
                    <input class="form__input-checkbox" type="checkbox" checked="checked" /><span class="form__checkbox"> </span>Запомнить меня </label>
                    <a class="link" href="<?=HOST?>lost-password">Забыл пароль</a></div>
                    <div class="autorization-content-form-button"><input class="button button-enter" type="submit" name="enter-login" value="Войти" /></div>
                </form>
            </div>
        </div>

