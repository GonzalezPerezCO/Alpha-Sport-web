<?php

  /*
  session_start();

  #session_unset();

  session_destroy();
  */

  unset($_COOKIE['user_id']);
  unset($_COOKIE['user_email']);
  unset($_COOKIE['user_nombre']);
  unset($_COOKIE['user_apellido']);
  unset($_COOKIE['user_dia1']);
  unset($_COOKIE['user_dia2']);
  unset($_COOKIE['user_dia3']);
  unset($_COOKIE['user_hora1']);
  unset($_COOKIE['user_hora2']);
  unset($_COOKIE['user_hora3']);

  header('Location: ../index.php');



 


?>
