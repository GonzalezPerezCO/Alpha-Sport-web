<?php

$server = 'localhost';
$username = 'deportes';
$password = 'deportes20182';
$database = 'deportes';

$conn = mysqli_connect($server, $username, $password, $database) or die(mysqli_error($conn));

?>