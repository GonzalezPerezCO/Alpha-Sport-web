<?php

  if(isset($_COOKIE['user_id'])){
    header('Location: partials/header.php');    
  }else{
    require '../controller/database.php';    
      

    if (!empty($_POST['email']) && !empty($_POST['password'])) {   
    
      $query = "SELECT id FROM testudiantes WHERE email= '".$_POST["email"]."' AND password = '".$_POST['password']."'";
      $consul = mysqli_query($conn, $query) or die(mysqli_error($conn));
      $results = mysqli_fetch_array($consul);

      $message = '';   
      
      if ( !empty($results)) {

        $tiempo_cook=time()+900; // 15min
        setcookie('user_id', $results["id"], $tiempo_cook, "/");
        
        header("Location: partials/header.php");
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
