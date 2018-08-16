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

  $message_h="Sin cambios";

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

    if($_POST['dia1']!="N/A"){

    
    }else{

    
    }
  }
  else{
    $message_h="Tiene que inscribir por lo menos un día y una hora";
  }
?>