
<?php          
    session_start();

    if (isset($_SESSION['user_id'])) {
      header('Location: pages/partials/header.php');    
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
