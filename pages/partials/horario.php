<?php

require '../../controller/database.php';  

if (!isset($_COOKIE['user_id'])) {
header('Location: ../login.php');
}  

$query = "SELECT email, CURRENT_TIME() as current, hora FROM testudiantes WHERE email= '".$_POST["email"]."' AND password = '".$_POST['password']."'";
$consul = mysqli_query($conn, $query) or die(mysqli_error($conn));
$results = mysqli_fetch_array($consul);

$current = $results['current'];
$hora= $results['hora'];
$maximo =  date('h:i:s', strtotime("+10 minutes", strtotime($results['hora'])));      

if($current<$hora || $current>$maximo){
  header('Location: ../logout.php');
}         



$query = "SELECT dia1, dia2, dia3, hora1, hora2, hora3 FROM thorarios WHERE email = '".$_COOKIE['user_id']."'";
$consul = mysqli_query($conn, $query) or die(mysqli_error($conn));
$bdestudiante = mysqli_fetch_array($consul);

$new['dia1']= $_POST['dia1'];
$new['dia2']= $_POST['dia2'];
$new['dia3']= $_POST['dia3'];
$new['hora1']= $_POST['hora1'];
$new['hora2']= $_POST['hora2'];
$new['hora3']= $_POST['hora3'];


/* CRITERIOS PARA MANEJAS EVENTOS DE POST
--------------------------------------------------------------------
1. Solo un día de la semana por día de horario
2. Caso por días
3. Solo hay cambios si POST es diferente a lo que esta en COOKIE
4. N/A para un día/hora, por consiguiente N/A para una hora/día    
-------------------------------------------------------------------- */   

for ($i=1; $i < 4; $i++) {   
  
  # recuperar cupos
  $query = "UPDATE thorarios SET dia".$i."='N/A', hora".$i."='N/A' WHERE email='".$_COOKIE['user_id']."'";
  $consul = mysqli_query($conn, $query) or die(mysqli_error($conn));
   
  if($bdestudiante['dia'.$i]== 'N/A')continue;

  $query = "UPDATE tcupos SET ".strtolower($bdestudiante['dia'.$i]).'f'.$bdestudiante['hora'.$i]." = ".strtolower($bdestudiante['dia'.$i]).'f'.$bdestudiante['hora'.$i]."+1";
  $consul = mysqli_query($conn, $query) or die(mysqli_error($conn));
}

$nombres_tablas = "lunesf8, lunesf9, lunesf10, lunesf11, lunesf12, lunesf13, lunesf14, lunesf15, lunesf16, martesf8, martesf9, martesf10, martesf11, martesf12, martesf13, martesf14, martesf15, martesf16, miercolesf8, miercolesf9, miercolesf10, miercolesf11, miercolesf12, miercolesf13, miercolesf14, miercolesf15, miercolesf16, juevesf8, juevesf9, juevesf10, juevesf11, juevesf12, juevesf13, juevesf14, juevesf15, juevesf16, viernesf8, viernesf9, viernesf10, viernesf11, viernesf12, viernesf13, viernesf14, viernesf15, viernesf16 ";

$query = "SELECT ".$nombres_tablas." FROM tcupos";

$consul = mysqli_query($conn, $query) or die(mysqli_error($conn));
$cupos = mysqli_fetch_array($consul);

$memo_dia=array();
for ($i=1; $i < 4; $i++) { 
  if($new['dia'.$i]=='N/A' || $new['hora'.$i]=='N/A') continue; 

  if(isset($memo_dia[$new['dia'.$i]])) continue;
  else $memo_dia[$new['dia'.$i]] = true;
  
  if($cupos[strtolower($new['dia'.$i]).'f'.$new['hora'.$i]]>0){      
    $query = "UPDATE thorarios SET dia".$i."='".$new['dia'.$i]."', hora".$i."='".$new['hora'.$i]."' WHERE email='".$_COOKIE['user_id']."'";
    $consul = mysqli_query($conn, $query) or die(mysqli_error($conn));
      
    $query = "UPDATE tcupos SET ".strtolower($new['dia'.$i]).'f'.$new['hora'.$i]." = ".strtolower($new['dia'.$i]).'f'.$new['hora'.$i]."-1";
    $consul = mysqli_query($conn, $query) or die(mysqli_error($conn));
  
    $mensajes .= " Agregado ".$new['dia'.$i]." a las ".$new['hora'.$i]." ";
  }
}


header('Location: header.php?mensajes='.$mensajes.'');
?>


