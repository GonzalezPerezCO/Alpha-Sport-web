<?php

require '../../controller/database.php';  

if (!isset($_COOKIE['user_id'])) {
header('Location: ../login.php');
}  

$query = "SELECT dia1, dia2, dia3, hora1, hora2, hora3 FROM thorarios WHERE email = '".$_COOKIE['user_id']."'";
$consul = mysqli_query($conn, $query) or die(mysqli_error($conn));
$results = mysqli_fetch_array($consul);

$bd['dia1']= $results['dia1'];
$bd['dia2']= $results['dia2'];
$bd['dia3']= $results['dia3'];
$bd['hora1']= $results['hora1'];
$bd['hora2']= $results['hora2'];
$bd['hora3']= $results['hora3'];

$new['dia1']= $_POST['dia1'];
$new['dia2']= $_POST['dia2'];
$new['dia3']= $_POST['dia3'];
$new['hora1']= $_POST['hora1'];
$new['hora2']= $_POST['hora2'];
$new['hora3']= $_POST['hora3'];


echo $new['dia1'];
echo $new['dia2'];
echo $new['dia3'];
echo $new['hora1'];
echo $new['hora2'];
echo $new['hora3'];

die();

# Convertir a dia de la semana y hora

$new['dia1']= $_POST['dia1'];
$new['dia2']= $_POST['dia2'];
$new['dia3']= $_POST['dia3'];

# SABER CUANTOS APARICIONES HAY DE CADA DIA
$tlunes=0;
$tmartes=0;
$tmiercoles=0;
$tjueves=0;
$tviernes=0;
$tsabado=0;
$tnada=0;


foreach($new as $value){
  if($value=="Lunes"){
    $tlunes+=1;
  }elseif($value=="Martes"){
    $tmartes+=1;
  }elseif($value=="Miercoles"){
    $tmiercoles+=1;
  }elseif($value=="Jueves"){
    $tjueves+=1;
  }elseif($value=="Viernes"){
    $tviernes+=1;
  }else{
    $nada+=1;
  }
}

/* CRITERIOS PARA MANEJAS EVENTOS DE POST
--------------------------------------------------------------------
1. Solo un día de la semana por día de horario
2. Caso por días
3. Solo hay cambios si POST es diferente a lo que esta en COOKIE
4. N/A para un día/hora, por consiguiente N/A para una hora/día    
-------------------------------------------------------------------- */   

if($tlunes>0){

  $nombres_tablas = "lunesf8, lunesf9, lunesf10, lunesf11, lunesf12, lunesf13, lunesf14, lunesf15, lunesf16";
  $query = "SELECT ".$nombres_tablas." FROM tcupos";
  $consul = mysqli_query($conn, $query) or die(mysqli_error($conn));
  $results = mysqli_fetch_array($consul);

  $cupos['lunesf8']=$results['lunesf8'];
  $cupos['lunesf9']=$results['lunesf9'];
  $cupos['lunesf10']=$results['lunesf10'];
  $cupos['lunesf11']=$results['lunesf11'];
  $cupos['lunesf12']=$results['lunesf12'];
  $cupos['lunesf13']=$results['lunesf13'];
  $cupos['lunesf14']=$results['lunesf14'];
  $cupos['lunesf15']=$results['lunesf15'];
  $cupos['lunesf16']=$results['lunesf16'];

  if($tlunes==1){
    
    if($new['dia1']=='Lunes' && $new['hora1']=='8' && $cupos['lunesf8']>0){      
      $query = "UPDATE thorarios SET dia='Lunes', hora1='8' WHERE email=".$_COOKIE['user_id']."";
      $consul = mysqli_query($conn, $query) or die(mysqli_error($conn));

      $cupos['lunesf8']-=$cupos['lunesf8'];
      $query = "UPDATE tcupos SET lunesf8 = '".$cupos['lunesf8']."'";
      $consul = mysqli_query($conn, $query) or die(mysqli_error($conn));

      $mensaje_d1 = " Agregado Lunes a las 8. ";

    }elseif($new['dia1']=='Lunes' && $new['hora1']=='9' && $cupos['lunesf9']>0){
      $query = "UPDATE thorarios SET dia='Lunes', hora1='9' WHERE email=".$_COOKIE['user_id']."";
      $consul = mysqli_query($conn, $query) or die(mysqli_error($conn));

      $cupos['lunesf9']-=$cupos['lunesf9'];
      $query = "UPDATE tcupos SET lunesf9 = '".$cupos['lunesf9']."'";
      $consul = mysqli_query($conn, $query) or die(mysqli_error($conn));

      $mensaje_d1 = " Agregado Lunes a las 9. ";
   
    }elseif($new['dia1']=='Lunes' && $new['hora1']=='10' && $cupos['lunesf10']>0){
      $query = "UPDATE thorarios SET dia='Lunes', hora1='10' WHERE email=".$_COOKIE['user_id']."";
      $consul = mysqli_query($conn, $query) or die(mysqli_error($conn));

      $cupos['lunesf10']-=$cupos['lunesf10'];
      $query = "UPDATE tcupos SET lunesf10 = '".$cupos['lunesf10']."'";
      $consul = mysqli_query($conn, $query) or die(mysqli_error($conn));

      $mensaje_d1 = " Agregado Lunes a las 10. ";
      
    }elseif($new['dia1']=='Lunes' && $new['hora1']=='11' && $cupos['lunesf11']>0){
      $query = "UPDATE thorarios SET dia='Lunes', hora1='11' WHERE email=".$_COOKIE['user_id']."";
      $consul = mysqli_query($conn, $query) or die(mysqli_error($conn));

      $cupos['lunesf11']-=$cupos['lunesf11'];
      $query = "UPDATE tcupos SET lunesf11 = '".$cupos['lunesf11']."'";
      $consul = mysqli_query($conn, $query) or die(mysqli_error($conn));

      $mensaje_d1 = " Agregado Lunes a las 11. ";
    
    }elseif($new['dia1']=='Lunes' && $new['hora1']=='12' && $cupos['lunesf12']>0){
      $query = "UPDATE thorarios SET dia='Lunes', hora1='12' WHERE email=".$_COOKIE['user_id']."";
      $consul = mysqli_query($conn, $query) or die(mysqli_error($conn));

      $cupos['lunesf12']-=$cupos['lunesf12'];
      $query = "UPDATE tcupos SET lunesf12 = '".$cupos['lunesf12']."'";
      $consul = mysqli_query($conn, $query) or die(mysqli_error($conn));

      $mensaje_d1 = " Agregado Lunes a las 12. ";
    
    }elseif($new['dia1']=='Lunes' && $new['hora1']=='13' && $cupos['lunesf13']>0){
      $query = "UPDATE thorarios SET dia='Lunes', hora1='13' WHERE email=".$_COOKIE['user_id']."";
      $consul = mysqli_query($conn, $query) or die(mysqli_error($conn));

      $cupos['lunesf13']-=$cupos['lunesf13'];
      $query = "UPDATE tcupos SET lunesf13 = '".$cupos['lunesf13']."'";
      $consul = mysqli_query($conn, $query) or die(mysqli_error($conn));

      $mensaje_d1 = " Agregado Lunes a las 13. ";
   
    }elseif($new['dia1']=='Lunes' && $new['hora1']=='14' && $cupos['lunesf14']>0){
      $query = "UPDATE thorarios SET dia='Lunes', hora1='14' WHERE email=".$_COOKIE['user_id']."";
      $consul = mysqli_query($conn, $query) or die(mysqli_error($conn));

      $cupos['lunesf14']-=$cupos['lunesf14'];
      $query = "UPDATE tcupos SET lunesf14 = '".$cupos['lunesf14']."'";
      $consul = mysqli_query($conn, $query) or die(mysqli_error($conn));

      $mensaje_d1 = " Agregado Lunes a las 14. ";
   
    }elseif($new['dia1']=='Lunes' && $new['hora1']=='15' && $cupos['lunesf15']>0){
      $query = "UPDATE thorarios SET dia='Lunes', hora1='15' WHERE email=".$_COOKIE['user_id']."";
      $consul = mysqli_query($conn, $query) or die(mysqli_error($conn));

      $cupos['lunesf15']-=$cupos['lunesf15'];
      $query = "UPDATE tcupos SET lunesf15 = '".$cupos['lunesf15']."'";
      $consul = mysqli_query($conn, $query) or die(mysqli_error($conn));

      $mensaje_d1 = " Agregado Lunes a las 15. ";
    
    }elseif($new['dia1']=='Lunes' && $new['hora1']=='16' && $cupos['lunesf16']>0){
      $query = "UPDATE thorarios SET dia='Lunes', hora1='16' WHERE email=".$_COOKIE['user_id']."";
      $consul = mysqli_query($conn, $query) or die(mysqli_error($conn));

      $cupos['lunesf16']-=$cupos['lunesf16'];
      $query = "UPDATE tcupos SET lunesf16 = '".$cupos['lunesf16']."'";
      $consul = mysqli_query($conn, $query) or die(mysqli_error($conn));

      $mensaje_d1 = " Agregado Lunes a las 16. ";

    }else{
      
      $mensaje_d1 = " No hay cupos el Lunes. ";
    
    }   
  
  }else{
    $mensaje_d1="No es posible inscribir mas de una vez el mismo día";
  }

}






header('Location: header.php?message_d1='.$mensaje_d1.'');
?>