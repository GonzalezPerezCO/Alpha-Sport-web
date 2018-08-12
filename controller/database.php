<?php

$server = 'localhost';
$username = 'root';
$password = 'admin';
$database = 'php_login_database';

$conn = mysqli_connect($server, $username, $password, $database) or die('Error al conectar con MySQL Server.');

/*
# CONEXION ANTIGUA
try {
  $conn = new PDO("mysql:host=$server;dbname=$database;", $username, $password);
} catch (PDOException $e) {
  die('Connection Failed: ' . $e->getMessage());
}

# PROBAR CONEXION

$query = "SELECT * from USERS";
$results = mysqli_query($conn, $query);
$row = mysqli_fetch_array($results);

while ($row = mysqli_fetch_array($results)) {
  print_r($row);
  echo "CONN";
}

*/



?>
