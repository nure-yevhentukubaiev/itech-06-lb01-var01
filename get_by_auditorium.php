<?php
require_once("connect.php");
require_once("tabulator.php");
$auditorium = $_GET['auditorium'];
try {
    $stmnt = $dbh->prepare(
        "SELECT DISTINCT"
            . "  `lesson`.`week_day`, `lesson`.`lesson_number`, `lesson`.`disciple`, `lesson`.`type`, `groups`.`title`"
            . "FROM `lesson` "
            . "  JOIN `lesson_groups`"
            . "  ON `lesson`.`ID_Lesson` = `lesson_groups`.`FID_Lesson2`"
            . "  JOIN `groups`"
            . "  ON `groups`.`ID_Groups` = `lesson_groups`.`FID_Groups`"
            . "WHERE"
            . "  `lesson`.`auditorium` = :auditorium"
            . ";"
    );
    $stmnt->bindValue(":auditorium", $auditorium);
    $stmnt->execute();
    tabulator($stmnt->fetchAll(PDO::FETCH_NUM));
} catch (PDOException $ex) {
    echo $ex->GetMessage();
}
$dbh = null;
