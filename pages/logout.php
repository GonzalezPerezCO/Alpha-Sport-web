<?php

  /*
  session_start();

  #session_unset();

  session_destroy();
  */

  unset($_COOKIE['user_id']);
  unset($_COOKIE['email']);
  unset($_COOKIE['nombre']);
  unset($_COOKIE['apellido']);
  unset($_COOKIE['dia1']);
  unset($_COOKIE['dia2']);
  unset($_COOKIE['dia3']);
  unset($_COOKIE['hora1']);
  unset($_COOKIE['hora2']);
  unset($_COOKIE['hora3']);


  setcookie('user_id', null, -1);
  setcookie('email', null, -1);
  setcookie('nombre', null, -1);
  setcookie('apellido', null, -1);
  setcookie('dia1', null, -1);
  setcookie('dia2', null, -1);
  setcookie('dia3', null, -1);
  setcookie('hora1', null, -1);
  setcookie('hora2', null, -1);
  setcookie('hora3', null, -1);


  header('Location: ../index.php');



 


?>
