<?php
    
  session_start();
  
  require '../../controller/database.php';
  
  if (isset($_SESSION['user_id'])) {
    $query = "SELECT id, email, password FROM testudiantes WHERE id ='".$_SESSION['user_id']."'";
    $consul = mysqli_query($conn, $query);
    $results = mysqli_fetch_array($consul);
  }
  else{
    header('Location: ../login.php');  
  }

  $user = null;
  
  if (count($results) > 0) {
    $user = $results;
  } 

?>

<!DOCTYPE html>
<html>
  <head>   
    <title>Horario</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link rel="stylesheet" href="../../controller/assets/css/style.css">
  </head>
  <body>
  <h1>Deportes de la Escuela</h1>
   <br> <span><a href="../logout.php">LogOut</a></span> 
   <br>
   <br>
   <br>
   
  <div>
  TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO 
  TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO 
  TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO 


  TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO 
  TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO 
  TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO 

  TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO 
  TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO 
  TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO 


  TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO 
  TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO 
  TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO
  TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO 
  TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO 
  TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO TEXTO  TEXTO 

  </div>

  </body>
</html>