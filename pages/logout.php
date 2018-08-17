<?php

  /*unset($_COOKIE['user_id']);
  unset($_COOKIE['user_email']);
  unset($_COOKIE['user_nombre']);
  unset($_COOKIE['user_apellido']);
  unset($_COOKIE['user_dia1']);
  unset($_COOKIE['user_dia2']);
  unset($_COOKIE['user_dia3']);
  unset($_COOKIE['user_hora1']);
  unset($_COOKIE['user_hora2']);
  unset($_COOKIE['user_hora3']);*/


  setcookie('user_id', false, time()-1, "/");
  #setcookie('user_email', false, time()-1, "/");
  #setcookie('user_nombre', false, time()-1, "/");
  #setcookie('user_apellido', false, time()-1, "/");
  #setcookie('user_dia1', false, time()-1, "/");
  #setcookie('user_dia2', false, time()-1, "/");
  #setcookie('user_dia3', false, time()-1, "/");
  #setcookie('user_hora1', false, time()-1, "/");
  #setcookie('user_hora2', false, time()-1, "/");
  #setcookie('user_hora3', false, time()-1, "/");

  $ADATA=array();

  header('Location: ../index.php');



 


?>
