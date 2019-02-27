<div class="sticky-footer-content">
    <div class="container content--padding">
        <div class="row">
            <div class="col-10 offset-1">
                <h1 class="title-general contacts-messages-title--color mt-0 mb-0">Сообщения от посетителей</h1>
                <?php foreach($messages as $message): ?>
                <div class="user-from-messages mt-30 mb-20">
                    <div class="message-user">
                    <form method="POST" action="<?=HOST?>messages?id=<?=$message['id']?>">

                    <input type="submit" name="deleted-message" class="button button-delete button--small-delete float-right" value="Удалить">
                    </form>
                        <div class="message-user__date mb-20"><?=$message['date_time']?>
                        <a class="contact-message--email" href= "<?=$message['email']?>" ><?=$message['email']?></a>
                        </div>
                        <div class="message-user-info"><span class="message-user-info__name"><?=$message['name']?></a></div>

                        <p class="message-user__text"><?=$message['message']?></p>
                    <?php if($message['message_origin_name_files'] != '') { ?>
                        <span class="message-info-files strong">Прикрепленные файлы
                        <a class="message-user-info-files__link ml-20" target="_blank" href="<?=HOST?>usercontent/upload-files/<?=$message['message_file']?>"><?=$message['message_origin_name_files']?></a></span>
                    <?php } ?>
                    </div>
                </div>
            <?php endforeach ?>
            <?php if(count(@$message) == 0) { ?>
                    <p class="message-user__text">Cписок сообщений пуст..</p>
            <?php } ?>
            </div>
        </div>
    </div>
</div>