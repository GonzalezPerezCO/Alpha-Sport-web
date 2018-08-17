<?php

$actual_link = "http://$_SERVER[HTTP_HOST]";

$server = str_replace("http://","",$actual_link);
$username = 'deportes';
$password = 'deportes20182';
$database = 'deportes';

$conn = mysqli_connect($server, $username, $password, $database) or die(mysqli_error($conn));

echo $actual_link;

?>