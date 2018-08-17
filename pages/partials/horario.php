<?php

  require '../../controller/database.php';
  
    
  if (!isset($_COOKIE['user_id'])) {
    header('Location: ../login.php');
  }  

  #$message_h=" Sin cambios";

  $message_h=" Solicitud realizada ";    

  /* CRITERIOS PARA MANEJAS EVENTOS DE POST
    --------------------------------------------------------------------
    1. Solo un día de la semana por día de horario
    2. Caso por días
    3. Solo hay cambios si POST es diferente a lo que esta en COOKIE
    4. N/A para un día/hora, por consiguiente N/A para una hora/día    
    -------------------------------------------------------------------- */
    
  if($_POST['dia1'] == $_POST['dia2'] || $_POST['dia1'] == $_POST['dia3'] || $_POST['dia3'] == $_POST['dia1']){

    $message_h=" Hay días repetidos, no es posible asignar mas de una franja en un solo día ";
  }else{

    # PARA DIA 1
  if($_POST['dia1']!=$ADATA['user_dia1'] || $_POST['hora1']!=$ADATA['user_hora1'] ){      
    if($_POST['dia1']=="N/A" || $_POST['hora1'] =="N/A"){
      $query = "UPDATE thorarios SET dia1='N/A', hora1='N/A' WHERE email='".$ADATA['user_email']."'";
      $consul= mysqli_query($conn, $query) or die(mysqli_error($conn));

      $message_h=$message_h." | Eliminado dia 1 | ";
    }else{
      $query = "UPDATE thorarios SET dia1='".$_POST['dia1']."', hora1='".$_POST['hora1']."' WHERE email='".$ADATA['user_email']."'";
      $consul= mysqli_query($conn, $query) or die(mysqli_error($conn));

      $message_h=$message_h." | Modificado dia 1 | ";
    }


  }
  
  # PARA DIA 2
  if($_POST['dia2']!=$ADATA['user_dia2'] || $_POST['hora2']!=$ADATA['user_hora2'] ){      
    if($_POST['dia2']=="N/A" || $_POST['hora2'] =="N/A"){
      $query = "UPDATE thorarios SET dia2='N/A', hora2='N/A' WHERE email='".$ADATA['user_email']."'";
      $consul= mysqli_query($conn, $query) or die(mysqli_error($conn));

      $message_h=$message_h." | Eliminado dia 2 | ";    
    }else{
      $query = "UPDATE thorarios SET dia2='".$_POST['dia2']."', hora2='".$_POST['hora2']."' WHERE email='".$ADATA['user_email']."'";
      $consul= mysqli_query($conn, $query) or die(mysqli_error($conn));

      $message_h=$message_h." | Modificado dia 2 | ";
    }

  }
  
  # PARA DIA 3
  if($_POST['dia3']!=$ADATA['user_dia3'] || $_POST['hora3']!=$ADATA['user_hora3'] ){      
    if($_POST['dia3']=="N/A" || $_POST['hora3'] =="N/A"){
      $query = "UPDATE thorarios SET dia3='N/A', hora3='N/A' WHERE email='".$ADATA['user_email']."'";
      $consul= mysqli_query($conn, $query) or die(mysqli_error($conn));

      $message_h=$message_h." | Eliminado dia 3 | ";
    }else{
      $query = "UPDATE thorarios SET dia3='".$_POST['dia3']."', hora3='".$_POST['hora3']."' WHERE email='".$ADATA['user_email']."'";
      $consul= mysqli_query($conn, $query) or die(mysqli_error($conn));

      $message_h=$message_h." | Modificado dia 3 | ";
    }
    
  }

  }  

  #$message_h=" <font color='red'> <b>Tiene que inscribir por lo menos un día y una hora</b> </font>";


  $query = "SELECT testudiantes.id as id, testudiantes.nombre as nombre, testudiantes.apellido as apellido, testudiantes.email as email, dia1, dia2, dia3, hora1, hora2, hora3 FROM thorarios INNER JOIN testudiantes ON thorarios.email = testudiantes.email WHERE thorarios.email= '".$_POST["email"]."' AND password = '".$_POST['password']."'";
  $consul = mysqli_query($conn, $query) or die(mysqli_error($conn));
  $results = mysqli_fetch_array($consul);
   

  $tiempo_cook=time()+900; // tiempo

  #setcookie('user_id', $results["id"], $tiempo_cook, "/");
  #setcookie('user_email', $results["email"], $tiempo_cook, "/");
  #setcookie('user_nombre', $results["nombre"], $tiempo_cook, "/");
  #setcookie('user_apellido', $results["apellido"], $tiempo_cook, "/");
  #setcookie('user_dia1', $results["dia1"], $tiempo_cook, "/");
  #setcookie('user_dia2', $results["dia2"], $tiempo_cook, "/");
  #setcookie('user_dia3', $results["dia3"], $tiempo_cook, "/");
  #setcookie('user_hora1', $results["hora1"], $tiempo_cook, "/");
  #setcookie('user_hora2', $results["hora2"], $tiempo_cook, "/");
  #setcookie('user_hora3', $results["hora3"], $tiempo_cook, "/"); 

  header('Location: header.php');
?>