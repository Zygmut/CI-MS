<?php

require_once("dbconection.php");

$sql = "SELECT *
        FROM producto"


$index = mysqli_query($myqli, $sql);
$indexArray = array();

while ($row = $index->fetch_assoc()) {
    $indexArray[] = $row;
}

$indexJSON = json_encode($indexArray);
echo $indexJSON;

?>