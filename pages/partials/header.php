<?php
    
  session_start();
  
  require '../../controller/database.php';
  
  if (isset($_SESSION['user_id'])) {
    $query_u = "SELECT * FROM testudiantes WHERE id ='".$_SESSION['user_id']."'";
    $consul_u = mysqli_query($conn, $query_u);
    $results_u = mysqli_fetch_array($consul_u);
  }
  else{
    header('Location: ../login.php');  
  }
  $user = null; 

  if (count($results_u) > 0) {
    $user = $results_u;
  } 

  $message = "<h4> Sesión iniciada como: ".$user["nombre"]." ".$user["apellido"]."</h4>";

?>

<!DOCTYPE html>
<html>
  <head>   
    <title>Horario</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link rel="stylesheet" href="../../controller/assets/css/style.css">
  </head>
  <body>
  <h1>Deportes de la Escuela</h1>
   <br> 
   <?php if(!empty($message)): ?>
      <p> <?= $message ?></p>
    <?php endif; ?>
   <span><a href="../logout.php">LogOut</a></span> 
   <br>
   <br>
   <br>
    
    <!-- img src="../../media/logo.png" width="384,4" height="151,5" alt="Escuela Colombiana de Ingeniería Julio Garavito" align="middle" -->
    <div id = "tabla">
    
      <?php 

      $query = "SELECT done FROM thorarios INNER JOIN testudiantes ON thorarios.email = testudiantes.email WHERE thorarios.email= '".$user["email"]."'";
      $consul = mysqli_query($conn, $query);
      $results = mysqli_fetch_array($consul);
      
      if($results["done"]==0){ # si es 0 es porque no ha hecho horario (false)
        $query = "SELECT testudiantes.codigo as codigo,  thorarios.email as email, dia1, dia2, dia3, hora1, hora2, hora3 FROM thorarios INNER JOIN testudiantes ON thorarios.email = testudiantes.email WHERE thorarios.email= '".$user["email"]."'";
        $consul = mysqli_query($conn, $query);
        $results = mysqli_fetch_array($consul);

        
        echo'<table class="gridtable" align="center">'; 
          echo'<tr>'; 
            echo '<th>'."Estudiante".'</th>';
            echo '<th>'."Día 1".'</th>';
            echo '<th>'."Día 2".'</th>';
            echo '<th>'."Día 3".'</th>';
          echo'</tr>'; 
          echo'<tr>'; 
            echo '<td>'.$results['codigo'].'</td>';
            echo '<td>'.$results['dia1'].'<br>'.$results['hora1'].'</td>';
            echo '<td>'.$results['dia2'].'<br>'.$results['hora2'].'</td>';
            echo '<td>'.$results['dia3'].'<br>'.$results['hora3'].'</td>';        
          echo'</tr>';
        echo'</table>';  
        
        echo "<br> <br>  <button type='button'>Modificar horario</button> ";
        
      }else{

        echo "<br> <br>  <button type='button'>Crear horario</button> ";

      }
      

            
      ?>
    
   
    </div>


  </body>  
</html>


