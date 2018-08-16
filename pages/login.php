<?php

  if(isset($_COOKIE['user_id'])){
    header('Location: partials/header.php');    
  }else{
    require '../controller/database.php';    

    if (!empty($_POST['email']) && !empty($_POST['password'])) {   
    
      $query = "SELECT testudiantes.id as id, testudiantes.nombre as nombre, testudiantes.apellido as apellido, testudiantes.email as email, dia1, dia2, dia3, hora1, hora2, hora3 FROM thorarios INNER JOIN testudiantes ON thorarios.email = testudiantes.email WHERE thorarios.email= '".$_POST["email"]."' AND password = '".$_POST['password']."'";
      $consul = mysqli_query($conn, $query) or die(mysqli_error($conn));
      $results = mysqli_fetch_array($consul);
      
      $message = '';   
      
      if ( !empty($results)) {

        $tiempo_cook=time()+86400;

        setcookie('user_id', $results["id"], $tiempo_cook);
        setcookie('user_email', $results["email"], $tiempo_cook);
        setcookie('user_nombre', $results["nombre"], $tiempo_cook);
        setcookie('user_apellido', $results["apellido"], $tiempo_cook);
        setcookie('user_dia1', $results["dia1"], $tiempo_cook);
        setcookie('user_dia2', $results["dia2"], $tiempo_cook);
        setcookie('user_dia3', $results["dia3"], $tiempo_cook);
        setcookie('user_hora1', $results["hora1"], $tiempo_cook);
        setcookie('user_hora2', $results["hora2"], $tiempo_cook);
        setcookie('user_hora3', $results["hora3"], $tiempo_cook);
        
        header("Location: partials/header.php");
      } else {
        $message = 'Sorry, those credentials do not match';
      }
    }
  } 

  /*
  session_start();

  if (isset($_SESSION['user_id'])) {
    header('Location: partials/header.php');    
  }else{
    require '../controller/database.php';

    if (!empty($_POST['email']) && !empty($_POST['password'])) {   
    
      $query = "SELECT testudiantes.id as id, testudiantes.nombre as nombre, testudiantes.apellido as apellido, testudiantes.email as email, dia1, dia2, dia3, hora1, hora2, hora3 FROM thorarios INNER JOIN testudiantes ON thorarios.email = testudiantes.email WHERE thorarios.email= '".$_POST["email"]."' AND password = '".$_POST['password']."'";
      $consul = mysqli_query($conn, $query) or die(mysqli_error($conn));
      $results = mysqli_fetch_array($consul);
      
      $message = '';   
      
      if ( !empty($results)) {
        $_SESSION['user_id'] = $results["id"];
        $_SESSION['user_email'] = $results["email"];
        $_SESSION['user_nombre'] = $results["nombre"];
        $_SESSION['user_apellido'] = $results["apellido"];
        $_SESSION['user_dia1'] = $results["dia1"];
        $_SESSION['user_dia2'] = $results["dia2"];
        $_SESSION['user_dia3'] = $results["dia3"];
        $_SESSION['user_hora1'] = $results["hora1"];
        $_SESSION['user_hora2'] = $results["hora2"];
        $_SESSION['user_hora3'] = $results["hora3"];
        
        header("Location: partials/header.php");
      } else {
        $message = 'Sorry, those credentials do not match';
      }
    }

  }  */
?>


<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Deportes - Login</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link rel="stylesheet" href="../controller/assets/css/style.css">
  </head>
  <body>
    <?php if(!empty($message)): ?>
      <p> <?= $message ?></p>
    <?php endif; ?>

    <h1>Login</h1>
    <span>or <a href="signup.php">SignUp</a></span>

    <form action="login.php" method="POST">
      <input name="email" type="text" placeholder="Enter your email">
      <input name="password" type="password" placeholder="Enter your Password">
      <input type="submit" value="Submit">
    </form>
  </body>
</html>
