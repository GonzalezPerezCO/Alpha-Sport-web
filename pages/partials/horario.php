<?php
  require '../../controller/database.php';
    
  if (!isset($_COOKIE['user_id'])) {
    header('Location: ../login.php');
  }  

  #$message_h=" Sin cambios";

  $message_h=" Solicitud realizada ";    

  /* CRITERIOS PARA MANEJAS EVENTOS DE POST
    --------------------------------------------------------------------
    1. Caso por días
    2. Solo hay cambios si POST es diferente a lo que esta en COOKIE
    3. N/A para un día/hora, por consiguiente N/A para una hora/día
    -------------------------------------------------------------------- */
    
  # PARA DIA 1
  if($_POST['dia1']!=$_COOKIE['dia1'] || $_POST['hora1']!=$_COOKIE['hora1'] ){      
    if($_POST['dia1']=="N/A" || $_POST['hora1'] =="N/A"){
      $query = "UPDATE thorarios SET dia1='N/A', hora1='N/A' WHERE email='".$_COOKIE['email']."'";
      $consul= mysqli_query($conn, $query) or die(mysqli_error($conn));

      $message_h=$message_h." | Eliminado dia 1 | ";
    }else{
      $query = "UPDATE thorarios SET dia1='".$_POST['dia1']."', hora1='".$_POST['hora1']."' WHERE email='".$_COOKIE['email']."'";
      $consul= mysqli_query($conn, $query) or die(mysqli_error($conn));

      $message_h=$message_h." | Modificado dia 1 | ";
    }


  }
  
  # PARA DIA 2
  if($_POST['dia2']!=$_COOKIE['dia2'] || $_POST['hora2']!=$_COOKIE['hora2'] ){      
    if($_POST['dia2']=="N/A" || $_POST['hora2'] =="N/A"){
      $query = "UPDATE thorarios SET dia2='N/A', hora2='N/A' WHERE email='".$_COOKIE['email']."'";
      $consul= mysqli_query($conn, $query) or die(mysqli_error($conn));

      $message_h=$message_h." | Eliminado dia 2 | ";    
    }else{
      $query = "UPDATE thorarios SET dia2='".$_POST['dia2']."', hora2='".$_POST['hora2']."' WHERE email='".$_COOKIE['email']."'";
      $consul= mysqli_query($conn, $query) or die(mysqli_error($conn));

      $message_h=$message_h." | Modificado dia 2 | ";
    }

  }
  
  # PARA DIA 3
  if($_POST['dia3']!=$_COOKIE['dia3'] || $_POST['hora3']!=$_COOKIE['hora3'] ){      
    if($_POST['dia3']=="N/A" || $_POST['hora3'] =="N/A"){
      $query = "UPDATE thorarios SET dia3='N/A', hora3='N/A' WHERE email='".$_COOKIE['email']."'";
      $consul= mysqli_query($conn, $query) or die(mysqli_error($conn));

      $message_h=$message_h." | Eliminado dia 3 | ";
    }else{
      $query = "UPDATE thorarios SET dia3='".$_POST['dia3']."', hora3='".$_POST['hora3']."' WHERE email='".$_COOKIE['email']."'";
      $consul= mysqli_query($conn, $query) or die(mysqli_error($conn));

      $message_h=$message_h." | Modificado dia 3 | ";
    }
    
  }

  #$message_h=" <font color='red'> <b>Tiene que inscribir por lo menos un día y una hora</b> </font>";


  $query_u = "SELECT dia1, dia2, dia3, hora1, hora2, hora3 FROM thorarios WHERE thorarios.email= '".$_COOKIE["user_email"]."'";
  $consul_u = mysqli_query($conn, $query_u) or die(mysqli_error($conn));
  $results_u = mysqli_fetch_array($consul_u);
  
  # Actualziación de COOKIEs
  setcookie('dia1', $results_u["dia1"]);
  setcookie('dia2', $results_u["dia2"]);
  setcookie('dia3', $results_u["dia3"]);
  setcookie('hora1', $results_u["hora1"]);
  setcookie('hora2', $results_u["hora2"]);
  setcookie('hora3', $results_u["hora3"]);

  header('Location: header.php');
?>