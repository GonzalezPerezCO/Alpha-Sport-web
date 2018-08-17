<?php

  setcookie('user_id', false, time()-1, "/");
  
  header('Location: ../index.php');
?>
