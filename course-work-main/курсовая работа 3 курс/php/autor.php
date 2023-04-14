<?php
$login = $_POST['login'];
$password = $_POST['password'];

if (mb_strlen($login) < 5 || mb_strlen($login) > 40) {
    echo "Недопустимая длина логина (от 5 до 40 символов)";
    // после этой строчки код не будет работать дальше
    exit(); 
} else if (mb_strlen($password) < 2 || mb_strlen($password) > 6) {
    echo "Недопустимая длина пароля (от 2 до 6 символов)";
    exit();
}

$mysql = new mysqli('localhost', 'root', '', 'English_School');
$mysql->set_charset('utf8');
if($mysql->connect_error){
    die("Ошибка: " . $mysql->connect_error);
}

$result = "SELECT * FROM `Student` WHERE `Log_In` = '$login' AND `Password` = '$password'";
$user = $result->fetch_assoc();
if (count($user) == 0) {
    echo "Такого пользователя нет";
    exit();
}

setcookie('User', $user['name'], time() + 3600, "/");

header('Location: ../page/root.html');
$mysql->close();
?>