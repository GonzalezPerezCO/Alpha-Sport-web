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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
      
      if($results["done"]==1){ # si es 1 es porque ya hizo horario (true)
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
       

      }else{     
      
      

      }    
      ?>

    
    <form name="mod_horario" method="post">
        Día1: <select name="dia1">
                <option value="Lunes">Lunes</option>
                <option value="Martes">Martes</option>
                <option value="Miércoles">Miércoles</option>
                <option value="Jueves">Jueves</option>
                <option value="Viernes">Viernes</option>
                <option value="Sábado">Sábado</option>
                </select>
        <br><br>
        Hora día 1: <select name="hora1">
                <option value="7:00">7:00</option>
                <option value="8:00">8:00</option>
                <option value="9:00">9:00</option>
                <option value="10:00">10:00</option>
                <option value="11:00">11:00</option>
                <option value="12:00">12:00</option>
                <option value="13:00">13:00</option>
                <option value="14:00">14:00</option>
                <option value="15:00">15:00</option>
                <option value="16:00">16:00</option>
                <option value="17:00">17:00</option>
                </select>
        <br> <br>       
        Día2: <select name="dia1">
                <option value="Lunes">Lunes</option>
                <option value="Martes">Martes</option>
                <option value="Miércoles">Miércoles</option>
                <option value="Jueves">Jueves</option>
                <option value="Viernes">Viernes</option>
                <option value="Sábado">Sábado</option>
                </select>
              
        <br><br>
        Hora día 2: <select name="hora1">
                <option value="7:00">7:00</option>
                <option value="8:00">8:00</option>
                <option value="9:00">9:00</option>
                <option value="10:00">10:00</option>
                <option value="11:00">11:00</option>
                <option value="12:00">12:00</option>
                <option value="13:00">13:00</option>
                <option value="14:00">14:00</option>
                <option value="15:00">15:00</option>
                <option value="16:00">16:00</option>
                <option value="17:00">17:00</option>
                </select>
        <br>  <br>      
        Día3: <select name="dia1">
                <option value="Lunes">Lunes</option>
                <option value="Martes">Martes</option>
                <option value="Miércoles">Miércoles</option>
                <option value="Jueves">Jueves</option>
                <option value="Viernes">Viernes</option>
                <option value="Sábado">Sábado</option>
                </select>               
        <br><br>
        Hora día 3: <select name="hora1">
                <option value="7:00">7:00</option>
                <option value="8:00">8:00</option>
                <option value="9:00">9:00</option>
                <option value="10:00">10:00</option>
                <option value="11:00">11:00</option>
                <option value="12:00">12:00</option>
                <option value="13:00">13:00</option>
                <option value="14:00">14:00</option>
                <option value="15:00">15:00</option>
                <option value="16:00">16:00</option>
                <option value="17:00">17:00</option>
                </select>        
        <br>
      <input type="submit" name="submit" />
      </form>

    </div>


  </body>  
</html>


