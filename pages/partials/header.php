<?php
    
  session_start();
  
  require '../../controller/database.php';
  
  
  if (!isset($_SESSION['user_id'])) {
    header('Location: ../login.php');
  }
  
  $message = "<h4> Sesión iniciada como: ".$_SESSION["user_nombre1"]." ".$_SESSION["user_apellido1"]."</h4>";
  
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

    <div id = "tabla">        

      <?php if(!empty($message_h)): ?>
        <p> <?= $message_h ?></p>
      <?php endif; ?>

      <?php
      #require 'horario.php';

      $query_d = "SELECT dia1, dia2, dia3, hora1, hora2, hora3 FROM thorarios INNER JOIN testudiantes ON thorarios.email = testudiantes.email WHERE thorarios.email= '".$user["email"]."'";
      $consul_d = mysqli_query($conn, $query_d) or die(mysqli_error($conn));
      $results_d = mysqli_fetch_array($consul_d);

      
      echo '<form name="mod_horario" action="header.php" method="post">';
      echo '    Día1: <select name="dia1">';
      echo '            <option selected="'.$results_d['dia1'].'" >'.$results_d['dia1'].'</option>                ';
      echo '            <option value="ninguno">N/A</option>';
      echo '            <option value="Lunes">Lunes</option>';
      echo '            <option value="Martes">Martes</option>';
      echo '            <option value="Miércoles">Miércoles</option>';
      echo '            <option value="Jueves">Jueves</option>';
      echo '            <option value="Viernes">Viernes</option>';
      echo '            <option value="Sábado">Sábado</option>                ';
      echo '            </select>';
      echo '    Hora día 1: <select name="hora1">';
      echo '            <option selected="'.$results_d['hora1'].'" >'.$results_d['hora1'].'</option>                ';
      echo '            <option value="7:00">7:00</option>';
      echo '            <option value="8:00">8:00</option>';
      echo '            <option value="9:00">9:00</option>';
      echo '            <option value="10:00">10:00</option>';
      echo '            <option value="11:00">11:00</option>';
      echo '            <option value="12:00">12:00</option>';
      echo '            <option value="13:00">13:00</option>';
      echo '            <option value="14:00">14:00</option>';
      echo '            <option value="15:00">15:00</option>';
      echo '            <option value="16:00">16:00</option>';
      echo '            <option value="17:00">17:00</option>';
      echo '            </select>';
      echo '    <br><br>      ';
      echo '    Día2: <select name="dia2">';
      echo '            <option selected="'.$results_d['dia2'].'" >'.$results_d['dia2'].'</option>                ';
      echo '            <option value="Lunes">Lunes</option>';
      echo '            <option value="Martes">Martes</option>';
      echo '            <option value="Miércoles">Miércoles</option>';
      echo '            <option value="Jueves">Jueves</option>';
      echo '            <option value="Viernes">Viernes</option>';
      echo '            <option value="Sábado">Sábado</option>                ';
      echo '            </select>';
      echo '          ';
      echo '    ';
      echo '    Hora día 2: <select name="hora2">';
      echo '            <option selected="'.$results_d['hora2'].'" >'.$results_d['hora2'].'</option>                ';
      echo '            <option value="7:00">7:00</option>';
      echo '            <option value="8:00">8:00</option>';
      echo '            <option value="9:00">9:00</option>';
      echo '            <option value="10:00">10:00</option>';
      echo '            <option value="11:00">11:00</option>';
      echo '            <option value="12:00">12:00</option>';
      echo '            <option value="13:00">13:00</option>';
      echo '            <option value="14:00">14:00</option>';
      echo '            <option value="15:00">15:00</option>';
      echo '            <option value="16:00">16:00</option>';
      echo '            <option value="17:00">17:00</option>';
      echo '            </select>';
      echo '    <br><br>      ';
      echo '    Día3: <select name="dia3">';
      echo '            <option selected="'.$results_d['dia3'].'" >'.$results_d['dia3'].'</option>                ';
      echo '            <option value="Lunes">Lunes</option>';
      echo '            <option value="Martes">Martes</option>';
      echo '            <option value="Miércoles">Miércoles</option>';
      echo '            <option value="Jueves">Jueves</option>';
      echo '            <option value="Viernes">Viernes</option>';
      echo '            <option value="Sábado">Sábado</option>                ';
      echo '            </select>               ';
      echo '    ';
      echo '    Hora día 3: <select name="hora3">';
      echo '            <option selected="'.$results_d['hora3'].'" >'.$results_d['hora3'].'</option>                ';
      echo '            <option value="7:00">7:00</option>';
      echo '            <option value="8:00">8:00</option>';
      echo '            <option value="9:00">9:00</option>';
      echo '            <option value="10:00">10:00</option>';
      echo '            <option value="11:00">11:00</option>';
      echo '            <option value="12:00">12:00</option>';
      echo '            <option value="13:00">13:00</option>';
      echo '            <option value="14:00">14:00</option>';
      echo '            <option value="15:00">15:00</option>';
      echo '            <option value="16:00">16:00</option>';
      echo '            <option value="17:00">17:00</option>';
      echo '            </select>        ';
      echo '    <br>';
      echo '  <input type="submit" name="submit" />';
      echo '  </form>';
      ?>

    </div>


  </body>  
</html>


