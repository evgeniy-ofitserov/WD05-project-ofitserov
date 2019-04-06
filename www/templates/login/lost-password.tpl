
<div class="row">
<div class="col-12 flex--center">
<div class="autorization-content">
    <h1 class="autorization-content__title mb-40">Забыли пароль</h1>
<form class="autorization-content-form"  method="POST" action="<?=HOST?>lost-password" novalidate>
        <div class="notification">
        <?php require ROOT . "templates/_parts/_errors.tpl" ?>
        <?php require ROOT . "templates/_parts/_success.tpl" ?>
            <input class="input mb-10 mt-20" name="email" id="input-reg-email" type="email" placeholder="E-mail" />
            <div class="autorization-content-form-button">
            <input class="button button-enter" type="submit" name="lost-pass" value="Восстановить" /></div>
            </div>
            </form>
        </div>
    </div>
</div>
</div>