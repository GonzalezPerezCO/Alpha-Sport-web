<?php  

  require 'controller/database.php';
  
  if (isset($_COOKIE['user_id'])) {   
      $query = "SELECT nombre, apellido FROM testudiantes WHERE id='".$_COOKIE['user_id']."'";      
      $consul = mysqli_query($conn, $query) or die(mysqli_error($conn));
      $results = mysqli_fetch_array($consul);   
      $user=$results["nombre"]." ".$results["apellido"];
    }
?>


<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Deportes</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link rel="stylesheet" href="controller/assets/css/style.css">
  </head>
  <body>
    <h1>Deportes de la Escuela</h1>
    <?php if(!empty($user)): ?>      
      <h3> Sesión iniciada como: <?= $user; ?> </h3>
      <br>         
      <a href="pages/logout.php">
        Logout
      </a>
    <?php else: ?>      
      <h2>Please Login or SignUp</h2>
      <a href="pages/login.php">Login</a> or
      <a href="pages/signup.php">SignUp</a>
    <?php endif; ?>
    <br>
    <br>
    <p> Esta es una <a href=""> iniciativa </a> propia con el apoyo del <a href="http://laboratorio.is.escuelaing.edu.co/"> Laboratorio de Sistemas </a> <br>
    y <a href="https://www.escuelaing.edu.co/es/vida_universitaria/bienestar_universitario/recreacion/programa"> Bienestar Universitario </a>, para la elaboración de horarios de los estudiantes al Gimnasio de la Escuela. <br>
    Saber mas <a href="https://www.escuelaing.edu.co/es/eventosynoticias/descripcion/989"> visite </a>,<a href="http://notiweb.escuelaing.edu.co/blog/2018/07/24/ganadores-de-la-trigesima-sexta-version-de-la-vitrina-academica-2018-i/"> en NOTIWEB . </a>
    <br>
    <br>
    <br>
    <br>
    <b>Cordialmente:</b>
    <br>
    <br>
    Equipo de trabajo:<br>
    Ing. Claudia Patricia Castañeda<br>
    Juan Francisco Gonzalez<br>
    Manuel Sergio Pérez<br>
    <i>Decanatura de Ingeniería de Sistemas</i>
    <br>
    <br>
    </p>
    
  </body>
</html>
