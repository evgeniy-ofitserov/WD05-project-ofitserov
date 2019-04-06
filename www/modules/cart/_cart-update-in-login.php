<?php 

// Код сравнит одну общую корзину (локальную и на в админки и соединит их в одну.)

// Записываем текущ. пользователя, на случай если придется обновить корзину

$currentUser = $_SESSION['logger_user'];

// Загружаем его из БД этого пользователя 

$user = R::load('users', $currentUser->id);


// Определяем корзину в БД
//Записываем в JSON (массив ассоц, тк true) из БД;
// если корзина есть то в нем находится JSON строка

$cartServer = json_decode($user->cart, true);

// Определяем локальную корзину. она может толи быть толи нет, делаем проверку 

// сравниваем корзины, если есть локальная кука записываем ее в переменную 


if (isset($_COOKIE['cart'])) {
    $cartLocal = json_decode($_COOKIE['cart'], true);

}else{
    $cartLocal = array();
}

// дальше сравниваем количество элементов в корзине, если они есть тогда совмещаем и сохраняем их
if(count($cartServer) > 0 && count($cartLocal) > 0 ){

    // Совмещаем обе корзины и сохраняем в БД и в Cookies 
    // Функция принимает два массива 
    function unitedCarts($cartServer, $cartLocal){


    }


}

?>