<?php

  require '../../controller/database.php';
    
    if (!isset($_COOKIE['user_id'])) {
      header('Location: ../login.php');
    }
  /*
  session_start();
  
  require '../../controller/database.php';
  
  if (!isset($_SESSION['user_id'])) {
    header('Location: ../login.php');
  }
  */

  $message_h=" Sin cambios";

if ($_POST['dia1']!="N/A" || $_POST['dia2']!="N/A" || $_POST['dia2']!="N/A" ) {
    $message_h="Solicitud realizada";    
    
    #$query_d = "SELECT dia1, dia2, dia3, hora1, hora2, hora3 FROM thorarios INNER JOIN testudiantes ON thorarios.email = testudiantes.email WHERE thorarios.email= '".$user["email"]."'";
    #$consul_d = mysqli_query($conn, $query_d) or die(mysqli_error($conn));
    #$results_d = mysqli_fetch_array($consul_d);

    #$dia1=$results_d["dia1"];
    #$dia2=$results_d["dia2"];
    #$dia3=$results_d["dia3"];
    #$hora1=$results_d["hora1"];
    #$hora2=$results_d["hora2"];
    #$hora3=$results_d["hora3"];

    /* CRITERIOS PARA MANEJAS EVENTOS DE POST
     --------------------------------------------------------------------
     1. Caso por días
     2. Solo hay cambios si POST es diferente a lo que esta en COOKIE
     3. N/A para un día/hora, por consiguiente N/A para una hora/día
     -------------------------------------------------------------------- */

    # PARA DIA 1
    if($_POST['dia1']!=$_COOKIE['user_dia1']){
      if($_POST['dia1']=="N/A" || $_POST['hora1'=="N/A"]){
        $query_u = "UPDATE thorarios SET dia1='N/A', hora1='N/A' WHERE email='".$_COOKIE['user_email']."'";
        $consul_u= mysqli_query($conn, $query_u) or die(mysqli_error($conn));
        
        $message_h.=" | Eliminado dia 1 | ";
      }

    }
    
    # PARA DIA 2
    if($_POST['dia2']!=$_COOKIE['user_dia2']){
      if($_POST['dia2']=="N/A" || $_POST['hora2'=="N/A"]){
        $query_u = "UPDATE thorarios SET dia2='N/A', hora2='N/A' WHERE email='".$_COOKIE['user_email']."'";
        $consul_u= mysqli_query($conn, $query_u) or die(mysqli_error($conn));

        $message_h.=" | Eliminado dia 2 | ";    
      }

    }
    
    # PARA DIA 3
    if($_POST['dia3']!=$_COOKIE['user_dia3']){
      if($_POST['dia3']=="N/A" || $_POST['hora4'=="N/A"]){
        $query_u = "UPDATE thorarios SET dia3='N/A', hora3='N/A' WHERE email='".$_COOKIE['user_email']."'";
        $consul_u= mysqli_query($conn, $query_u) or die(mysqli_error($conn));

        $message_h.=" | Eliminado dia 3 | ";
      }
      
    }
    
  }
  else{
    $message_h=" <font color='red'> <b>Tiene que inscribir por lo menos un día y una hora</b> </font>";
  }

  $query = "SELECT dia1, dia2, dia3, hora1, hora2, hora3 FROM thorarios WHERE thorarios.email= '".$_COOKIE["user_email"]."'";
  $consul = mysqli_query($conn, $query) or die(mysqli_error($conn));
  $results = mysqli_fetch_array($consul);
  
  # Actualziación de COOKIEs
  setcookie('user_dia1', $results["dia1"]);
  setcookie('user_dia2', $results["dia2"]);
  setcookie('user_dia3', $results["dia3"]);
  setcookie('user_hora1', $results["hora1"]);
  setcookie('user_hora2', $results["hora2"]);
  setcookie('user_hora3', $results["hora3"]);


  header('Location: header.php');
?>