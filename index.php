<!doctype html>
<?php
require_once("connect.php");
?>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <title>itech-06-lb01-var01</title>
</head>

<body>
    <span>Get timetable by group</span>
    <form action="get_by_group.php" method="get">
        <select id="getByGroup" name="group">
            <?php
            try {
                foreach ($dbh->query("SELECT DISTINCT `title` FROM `groups`;") as $row) {
                    echo "<option value='$row[0]'>$row[0]</option>";
                }
            } catch (PDOException $e) {
                echo $e->getMessage();
            }
            ?>
        </select>
        <input type="submit" value="Get">
    </form>
    <br />
    <span>Get timetable by teacher</span>
    <form action="get_by_teacher.php" method="get">
        <select id="getByTeacher" name="teacher">
            <?php
            try {
                foreach ($dbh->query("SELECT DISTINCT `name` FROM `teacher`;") as $row) {
                    echo "<option value='$row[0]'>$row[0]</option>";
                    // echo "a";
                }
            } catch (PDOException $e) {
                echo $e->getMessage();
            }
            ?>
        </select>
        <input type="submit" value="Get">
    </form>
    <br />
    <span>Get timetable by auditory</span>
    <form action="get_by_auditorium.php" method="get">
        <select id="getByAuditorium" name="auditorium">
            <?php
            try {
                foreach ($dbh->query("SELECT DISTINCT `auditorium` FROM `lesson`;") as $row) {
                    echo "<option value='$row[0]'>$row[0]</option>";
                }
            } catch (PDOException $e) {
                echo $e->getMessage();
            }
            ?>
        </select>
        <input type="submit" value="Get">
    </form><br />
</body>

</html>
