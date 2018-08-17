<?php

  require '../../controller/database.php';  
    
  if (!isset($_COOKIE['user_id'])) {
    header('Location: ../login.php');
  }  

  $query = "SELECT testudiantes.nombre as nombre, testudiantes.apellido as apellido, testudiantes.email as email, dia1, dia2, dia3, hora1, hora2, hora3 FROM thorarios INNER JOIN testudiantes ON thorarios.email = testudiantes.email WHERE testudiantes.email = thorarios.email AND testudiantes.email= '".$_COOKIE['user_id']."'";
  $consul = mysqli_query($conn, $query) or die(mysqli_error($conn));
  $results = mysqli_fetch_array($consul);

  $ADATA['user_nombre']= $results["nombre"];
  $ADATA['user_apellido']= $results["apellido"];
  $ADATA['user_email']= $results["email"];
  $ADATA['user_dia1']= $results["dia1"];
  $ADATA['user_dia2']= $results["dia2"];
  $ADATA['user_dia3']= $results["dia3"];
  $ADATA['user_hora1']= $results["hora1"];
  $ADATA['user_hora2']= $results["hora2"];
  $ADATA['user_hora3']= $results["hora3"];


  /* CRITERIOS PARA MANEJAS EVENTOS DE POST
    --------------------------------------------------------------------
    1. Solo un día de la semana por día de horario
    2. Caso por días
    3. Solo hay cambios si POST es diferente a lo que esta en COOKIE
    4. N/A para un día/hora, por consiguiente N/A para una hora/día    
    -------------------------------------------------------------------- */   
  


  header('Location: header.php');
?>