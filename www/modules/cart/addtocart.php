<?php

// echo '<pre>';
// print_r($_POST);
// echo '</pre>';

// id товара который добавили в корзину

$currentItem = intval($_POST['shopId']);

// Определяем локальную корзину, записываем в куки поль-ля на компьютере $_COOKIE['cart']
if (isset($_COOKIE['cart'])) {
    //  json_decode - ф-я которая преобр-ет JSON формат в объект 
    // Если нам надо получить не объект а ассоц. массив тогда 2 параметром передаем true
    $cartLocal = json_decode($_COOKIE['cart'], true);

}else{

    // Если пол-ть только зашел на сайт и у него нет еще ккуки cart
    $cartLocal = array();

}

// Если такой товар уже есть в корзине тогда увеличиваем его кол-во на 1, если нет то записываем его кол-во на 1

if(isset($cartLocal[$currentItem])){

    $items = $cartLocal[$currentItem];            // пример: 2 товара
    $items++;                                    // прибавили 1 стало // 3 товара
    $cartLocal[$currentItem] = $items;          // результат 3 товара  

}else {

    // Если товара еще не было тогда мы создаем переменную, и добавляем товар.
    $cartLocal[$currentItem] = 1;
}



// Cохраняем это все в куки (массив карт куки. записываем джейсон строку);

// json_encode -  преобразует json ассоц. массив в строку.тк в куки мы не можем записать массив

setcookie("cart", json_encode($cartLocal));


// ::::::::::::::::::: Если пользователь залогинен! :::::::::::::::: //
// Создаем корзину на сервере.

// проверяем, если пользователь залогинен , то сохраняем в БД - isLoggedIn возвращает true если пользователь 


if (isLoggedIn()) {

   // записываем пользователя в переменную
    $currentUser = $_SESSION['logger_user'];
    $user = R::load('users', $currentUser->id);
    $user->cart = json_encode($cartLocal);
    R::store($user);
}

header("Location: " . HOST . "e-shop/e-shop-page?id=" .$currentItem );
exit();