<?php
    
  session_start();
  
  require '../../controller/database.php';
  
  if (isset($_SESSION['user_id'])) {
    $query = "SELECT id, email, password FROM testudiantes WHERE id ='".$_SESSION['user_id']."'";
    $consul = mysqli_query($conn, $query);
    $results = mysqli_fetch_array($consul);
  }
  else{
    header('Location: ../login.php');  
  }

  $user = null; 
  
  if (count($results) > 0) {
    $user = $results;
  } 

  $message = "<h3> Sesión iniciada como: ".$user["email"]."</h3>";

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
    
    $query = "SELECT thorarios.email as email, dia1, dia2, dia3, hora1, hora2, hora3 FROM thorarios INNER JOIN testudiantes ON thorarios.email = testudiantes.email WHERE thorarios.email= 'mama'";
    $consul = mysqli_query($conn, $query);
    $results = mysqli_fetch_array($consul);

    
    echo'<table class="gridtable" align="center">'; 
      echo'<tr>'; 
        echo '<th>'."Estudiante".'</th>';
        echo '<th>'."Día 1".'</th>';
        echo '<th>'."Día 2".'</th>';
        echo '<th>'."Día 2".'</th>';
      echo'</tr>'; 
      echo'<tr>'; 
        echo '<td>'.$results['email'].'</td>';
        echo '<td>'.$results['dia1'].'<br>'.$results['hora1'].'</td>';
        echo '<td>'.$results['dia2'].'<br>'.$results['hora2'].'</td>';
        echo '<td>'.$results['dia3'].'<br>'.$results['hora3'].'</td>';        
      echo'</tr>';
    echo'</table>';
      
    ?>
   
   
    </div>


  </body>  
</html>


