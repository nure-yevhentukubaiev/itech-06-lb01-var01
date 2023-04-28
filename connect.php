<?php
try {
    $dsn = "mysql:host=localhost;dbname=lb_pdo_lessons";
    $user = 'geuonne';
    $pass = 'pONyeS';
    $dbh = new PDO($dsn, $user, $pass);
} catch (PDOException $e) {
    echo $e->getMessage();
}
