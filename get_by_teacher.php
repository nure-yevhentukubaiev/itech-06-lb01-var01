<?php
require_once("connect.php");
require_once("tabulator.php");
$teacher = $_GET['teacher'];
try {
    $stmnt = $dbh->prepare(
        "SELECT DISTINCT"
            . "  `groups`.`title`, `lesson`.`week_day`, `lesson`.`lesson_number`, `lesson`.`auditorium`, `lesson`.`disciple`, `lesson`.`type`"
            . "FROM `lesson`"
            . "  JOIN `lesson_groups`"
            . "  ON `lesson`.`ID_Lesson` = `lesson_groups`.`FID_Lesson2`"
            . "  JOIN `groups`"
            . "  ON `groups`.`ID_Groups` = `lesson_groups`.`FID_Groups`"
            . "  JOIN `lesson_teacher`"
            . "  ON `lesson`.`ID_Lesson` = `lesson_teacher`.`FID_Lesson1`"
            . "  JOIN `teacher`"
            . "  ON `teacher`.`ID_Teacher` = `lesson_teacher`.`FID_Teacher`"
            . "WHERE"
            . "  `teacher`.`name` = :teacher"
            . ";"
    );
    $stmnt->bindValue(":teacher", $teacher);
    $stmnt->execute();
    tabulator($stmnt->fetchAll(PDO::FETCH_NUM));
} catch (PDOException $ex) {
    echo $ex->GetMessage();
}
$dbh = null;
