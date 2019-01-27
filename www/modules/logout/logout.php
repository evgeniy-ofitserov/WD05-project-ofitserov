<?php

 // Выход с сайта. Убиваем Элементы массива

unset($_SESSION['logger_user']);
unset($_SESSION['login']);
unset($_SESSION['role']);

// Окончательно убиваем 
session_destroy();

// Убиваем куки.
setcookie(session_name(), '', time() - 1, '/');

//Редерект на главную
header("Location:" . HOST);
























?>