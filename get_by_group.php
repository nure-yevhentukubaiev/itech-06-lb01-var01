<?php
require_once("connect.php");
require_once("tabulator.php");
$group = $_GET['group'];
try {
    $stmnt = $dbh->prepare(
        "SELECT DISTINCT"
            . "  `lesson`.`week_day`, `lesson`.`lesson_number`, `lesson`.`auditorium`, `lesson`.`disciple`, `lesson`.`type`"
            . "FROM `lesson` "
            . "  JOIN `lesson_groups`"
            . "  ON `lesson`.`ID_Lesson` = `lesson_groups`.`FID_Lesson2`"
            . "  JOIN `groups`"
            . "  ON `groups`.`ID_Groups` = `lesson_groups`.`FID_Groups`"
            . "WHERE"
            . "  `groups`.`title` = :group"
            . ";"
    );
    $stmnt->bindValue(":group", $group);
    $stmnt->execute();
    tabulator($stmnt->fetchAll(PDO::FETCH_NUM));
} catch (PDOException $ex) {
    $ex->GetMessage();
}
$dbh = null;
