<?php

function adopt($text)
{

    return '=?UTF-8?B?' . base64_encode($text) . '?=';

}



?>