<?php
require_once("connect.php");

function tabulator(array $stmnt)
{
    try {
        echo "<table border='1'><tbody>";
        foreach ($stmnt as $row) {
            echo "<tr>";
            foreach ($row as $val) {
                echo "<td>";
                echo $val;
                echo "</td>";
            }
            echo "</tr>";
        }
        echo "</tbody></table>";
    } catch (PDOException $e) {
        echo $e->getMessage();
    }
}
