<?php

  setcookie('user_id', false, time()-1, "/",$_SERVER['SERVER_NAME']);
  
  header('Location: ../index.php');
?>
