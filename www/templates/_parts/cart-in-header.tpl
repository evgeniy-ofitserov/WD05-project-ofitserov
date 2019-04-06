<?php if (isset($_COOKIE['cart'])) { ?>
<?php 

    // кол-во товаров 0
    $itemInCart = 0;


    // корзина из кук 

    $cartFromCookie = $_COOKIE['cart']; // записали JSON строку из кук

    //преобразуем в ассоц. массив  с помощью true
    $cartArray = json_decode($cartFromCookie, true);

    // Считаем сумму всех элементов в корзине 
    // array_sum возвращает сумму всех его элементов. Например в корзине 4 элемент, т.е 1+2+1 вернет 4

    $itemsInCart = array_sum($cartArray);
    // Делаем проверку 

?>


<?php if ($itemsInCart > 0) { ?>
    
    <div class="cart">
    <a href="<?=HOST?>cart"><i class="fas fa-shopping-cart"></i>
    <?=$itemsInCart?> товаров
    </a>
    </div>

    
<?php } 



?>

<?php } ?>