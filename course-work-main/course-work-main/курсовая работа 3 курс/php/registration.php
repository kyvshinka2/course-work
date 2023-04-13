<?php
// функция trim удаляет лишние пробелы
// убираем лишние html символы
$name = $_POST['name'];
$login = $_POST['login'];
$password = $_POST['password'];

if (mb_strlen($login) < 5 || mb_strlen($login) > 40) {
    echo "Недопустимая длина логина (от 5 до 40 символов)";
    // после этой строчки код не будет работать дальше
    exit(); 
} else if (mb_strlen($name) < 20 || mb_strlen($name) > 100) {
    echo "Недопустимая длина имени (от 20 до 100 символов)";
    exit();
} else if (mb_strlen($password) < 2 || mb_strlen($password) > 6) {
    echo "Недопустимая длина пароля (от 2 до 6 символов)";
    exit();
}

$mysql = new mysqli('localhost', 'root', '', 'English_School');
$mysql->set_charset('utf8');


$query = 'INSERT INTO `Student` (`Full name`, `Log_In`, `Password`) VALUES('$name', '$login', '$password')';

$result = mysqli_query($mysql, $query);

$mysql->close();
?>