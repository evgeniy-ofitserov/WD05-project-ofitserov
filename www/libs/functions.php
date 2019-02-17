<?php

function adopt($text)
{

    return '=?UTF-8?B?' . base64_encode($text) . '?=';

}


function commentNumber ($num) {
    //Оставляем две последние цифры от $num
    $number = substr($num, -2);

    //Если 2 последние цифры входят в диапазон от 11 до 14
    //Тогда подставляем окончание "ЕВ" 
    if($number > 10 and $number < 15)
    {
        $term = "ев";
    } else { 

        $number = substr($number, -1);

        if($number == 0) {$term = "ев";}
        if($number == 1 ) {$term = "й";}
        if($number > 1 ) {$term = "я";}
        if($number > 4 ) {$term = "ев";}
    }

    echo  $num.' комментари'.$term;
}

function isAdmin(){

    $resault = false;
    if(isset( $_SESSION['logger_user'] ) && $_SESSION['login'] == 1){

    if($_SESSION['role'] == 'admin'){
        $resault = true;
    }
        return $resault;
    }
}


function isLoggedIn(){
    $result = false;
    if (isset($_SESSION['logger_user']) && $_SESSION['login'] == 1) {
        $result = true;
    }
    return $result;
}



function rus_date() {
    // Перевод
    $translate = array(
        "am" => "дп",
        "pm" => "пп",
        "AM" => "ДП",
        "PM" => "ПП",
        "Monday" => "Понедельник",
        "Mon" => "Пн",
        "Tuesday" => "Вторник",
        "Tue" => "Вт",
        "Wednesday" => "Среда",
        "Wed" => "Ср",
        "Thursday" => "Четверг",
        "Thu" => "Чт",
        "Friday" => "Пятница",
        "Fri" => "Пт",
        "Saturday" => "Суббота",
        "Sat" => "Сб",
        "Sunday" => "Воскресенье",
        "Sun" => "Вс",
        "January" => "Января",
        "Jan" => "Янв",
        "Fevruary" => "Февраля",
        "Fev" => "Фев",
        "March" => "Марта",
        "Mar" => "Мар",
        "April" => "Апреля",
        "Apr" => "Апр",
        "May" => "Мая",
        "May" => "Мая",
        "June" => "Июня",
        "Jun" => "Июн",
        "July" => "Июля",
        "Jul" => "Июл",
        "August" => "Августа",
        "Aug" => "Авг",
        "September" => "Сентября",
        "Sep" => "Сен",
        "October" => "Октября",
        "Oct" => "Окт",
        "November" => "Ноября",
        "Nov" => "Ноя",
        "December" => "Декабря",
        "Dec" => "Дек",
        "st" => "ое",
        "nd" => "ое",
        "rd" => "е",
        "th" => "ое"
    );
    // если передали дату, то переводим ее
    if (func_num_args() > 1) {
        $timestamp = func_get_arg(1);
        return strtr(date(func_get_arg(0), $timestamp), $translate);
    } else {
    // иначе текущую дату
        return strtr(date(func_get_arg(0)), $translate);
    }
}


function mbCutString($string, $length, $postFix = '...', $encoding = 'UTF-8'){

    // апроверяем на кол-во символов в заголовке

    if(mb_strlen($string, $encoding) <= $length){

        return $string;

    }

        $temp =  mb_substr($string, 0, $length, $encoding);
        $spacePost =  mb_strripos($temp, " ",  0, $encoding);
        $resault = mb_substr($temp, 0, $spacePost, $encoding ) . '...';
        return $resault;
}
?>