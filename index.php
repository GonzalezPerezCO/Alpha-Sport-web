
<?php
  
  /* 
  session_start();

  require 'controller/database.php';
 
  if (isset($_SESSION['user_id'])) {

    #$records = $conn->prepare('SELECT id, email, password FROM USERS WHERE id = :id');
    #$records->bindParam(':id', $_SESSION['user_id']);
    #$records->execute();
    #$results = $records->fetch(PDO::FETCH_ASSOC);
    */
        
    session_start();

    require 'controller/database.php';
    
    if (isset($_SESSION['user_id'])) {
      $query = "SELECT id, email, password FROM USERS WHERE id ='".$_SESSION['user_id']."'";
      $consul = mysqli_query($conn, $query);
      $results = mysqli_fetch_array($consul);
    }

    $user = null;
    
    if (count($results) > 0) {
      $user = $results;
    }
  

?>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Welcome to you WebApp</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link rel="stylesheet" href="controller/assets/css/style.css">
  </head>
  <body>
    <h1>Your App</h1>
    <?php if(!empty($user)): ?>      
      <a href="pages/logout.php">
        Logout
      </a>
    <?php else: ?>      
      <h2>Please Login or SignUp</h2>
      <a href="pages/login.php">Login</a> or
      <a href="pages/signup.php">SignUp</a>
    <?php endif; ?>
  </body>
</html>
