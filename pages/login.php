<?php

  if(isset($_COOKIE['user_id'])){
    header('Location: partials/header.php');    
  }else{
    require '../controller/database.php';    
      

    if (!empty($_POST['email']) && !empty($_POST['password'])) {   
      /*date_default_timezone_set('America/Bogota');     

      $query = "SELECT email, hora, hora2 as horaS FROM testudiantes WHERE email= '".$_POST["email"]."' AND password = '".$_POST['password']."'";
      $consul = mysqli_query($conn, $query) or die(mysqli_error($conn));
      $results = mysqli_fetch_array($consul);

      $actual = date('h:i:s');
      $inferior= $results['hora'];
      $superior = $results['horaS'];*/

      
      if ( !empty($results)) {
        #echo $actual;
        #echo $inferior;
        #echo $superior;
       
        #if($actual>=$inferior && $actual<=$superior){         
          $tiempo_cook=time()+600; // 10min
          setcookie('user_id', $results["email"], $tiempo_cook, "/");        
          header("Location: partials/header.php");

        #} else{
          #$message = 'No es su hora de registro';
        #}       
      } else {
        $message = 'Sorry, those credentials do not match';
      }
    }
  }   
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
    <div class="container">
      <?php if(!empty($message)): ?>
        <p> <font color='red'> <?= $message ?></font></p>
      <?php endif; ?>
      <header>
        <div class="logoescuela">
          <img src="../media/logo-ESCUELA.svg" width="650" height="auto">
        </div>
      </header>
      <h1>Ingreso</h1>      
      <span>o <a href="signup.php">Registrarse</a></span><br><br>
      <iframe src="http://free.timeanddate.com/clock/i6dk1lhx/n41/tlco4/pa5/tt0" frameborder="0" width="310" height="26"></iframe>      
      <form action="login.php" method="POST">
        <input name="email" type="text" placeholder="Correo escuela">
        <input name="password" type="password" placeholder="Contraseña correo">
        <input type="submit" value="Submit">
      </form>
    </div>
  </body>
</html>