<?php
  /*
  require '../controller/database.php';

  $message = '';

  if (!empty($_POST['email']) && !empty($_POST['password'])) {  
    
    $sql = "INSERT INTO USERS (email, password) VALUES (:email, :password)";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':email', $_POST['email']);
    $password = password_hash($_POST['password'], PASSWORD_BCRYPT);
    $stmt->bindParam(':password', $password);

    $query = "INSERT INTO USERS (email, password) VALUES (:email, :password)";
    $consul = mysqli_query($conn, $query);
    $results = mysqli_fetch_array($consul);

    if ($stmt->execute()) {
      $message = 'Successfully created new user';
    } else {
      $message = 'Sorry there must have been an issue creating your account';
    }
  }
  
  */

  require '../controller/database.php';

  $message = '';

  if (!empty($_POST['email']) && !empty($_POST['password']) && !empty($_POST['confirm_password'])) {  

    if($_POST['password'] == $_POST['confirm_password']){

      $query = "SELECT id FROM USERS WHERE email ='".$_POST['email']."'";
      $consul = mysqli_query($conn, $query);
      $results = mysqli_fetch_array($consul);
      
      if (count($results) == 0) {

        $query = "INSERT INTO USERS (email, password) VALUES ('".$_POST['email']."' ,'".$_POST['confirm_password']."')";
        $consul = mysqli_query($conn, $query);     
           
        $message = 'Successfully created new user';

      }
      else{
        $message = 'El email ya existe';
      }

    }else{
      $message="La contraseña no coincide";
    }
    
  }
  else{
    $message="Hay campos vacios, llene los campos";
  }


  
?>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>SignUp</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link rel="stylesheet" href="../controller/assets/css/style.css">
  </head>
  <body>   

    <?php if(!empty($message)): ?>
      <p> <?= $message ?></p>
    <?php endif; ?>

    <h1>SignUp</h1>
    <span>or <a href="login.php">Login</a></span>

    <form action="signup.php" method="POST">
      <input name="email" type="text" placeholder="Enter your email">
      <input name="password" type="password" placeholder="Enter your Password">
      <input name="confirm_password" type="password" placeholder="Confirm Password">
      <input type="submit" value="Submit">
    </form>

  </body>
</html>
