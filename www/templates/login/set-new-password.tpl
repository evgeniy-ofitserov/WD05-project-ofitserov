<div class="container">
        <div class="row">
            <div class="col-12 flex--center">
                <div class="autorization-content">
    
                    <h1 class="autorization-content__title mb-40">Восстановление пароля</h1>
                    <form class="autorization-content-form" action="<?=HOST?>set-new-password" method="POST" novalidate>
                        <div class="notification">
                             <?php require ROOT . "templates/_parts/_errors.tpl" ?>
                             <?php require ROOT . "templates/_parts/_success.tpl" ?>
                        </div>

                        <?php if ($newPasswordReady === false) :?>

                        <input class="input mb-10 mt-20" name="resetpassword" id="input-email" type="password" placeholder="Новый пароль" />
                          <?php endif ?>
                        <div class="autorization-content-form-help mb-30">
                        <a class="link flex--center" href="<?=HOST?>login">Вход на сайт</a></div>

                        <?php if ($newPasswordReady === false) :?>
                        <div class="autorization-content-form-button">
                        <input type="hidden" name="resetemail" value="<?=$_GET['email']?>">
                        <input type="hidden" name="onetimecode" value="<?=$_GET['code']?>">
                        <input class="button button-enter" type="submit" name="new-pass" value="Установить пароль" />
                        <?php endif ?>
                   </div>
                    </form>
                </div>
            </div>