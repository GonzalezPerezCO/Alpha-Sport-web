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
  $message_h="";
/*
  if ($_POST['dia1']!="N/A" || $_POST['dia2']!="N/A" || $_POST['dia2']!="N/A" ) {  
    $message_h="Solicitud realizada";

    $query_d = "SELECT dia1, dia2, dia3, hora1, hora2, hora3 FROM thorarios INNER JOIN testudiantes ON thorarios.email = testudiantes.email WHERE thorarios.email= '".$user["email"]."'";
    $consul_d = mysqli_query($conn, $query_d);
    $results_d = mysqli_fetch_array($consul_d);

    $dia1=$results_d["dia1"];
    $dia2=$results_d["dia2"];
    $dia3=$results_d["dia3"];
    $hora1=$results_d["hora1"];
    $hora2=$results_d["hora2"];
    $hora3=$results_d["hora3"];

    if($dia1!=$_POST['dia1'] ){

    }elseif(){

    }elseif(){

    }elseif(){
    
    }elseif(){

    }elseif(){

    }else{

    
    }
  }
  else{
    $message_h="Tiene que inscribir por lo menos un día y una hora";
  }*/

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
      /*
      $query = "SELECT done FROM thorarios INNER JOIN testudiantes ON thorarios.email = testudiantes.email WHERE thorarios.email= '".$user["email"]."'";
      $consul = mysqli_query($conn, $query);
      $results = mysqli_fetch_array($consul);
      
      if($results["done"]==1){ # si es 1 es porque ya hizo horario (true)
        $query = "SELECT testudiantes.codigo as codigo,  thorarios.email as email, dia1, dia2, dia3, hora1, hora2, hora3 FROM thorarios INNER JOIN testudiantes ON thorarios.email = testudiantes.email WHERE thorarios.email= '".$user["email"]."'";
        $consul = mysqli_query($conn, $query);
        $results = mysqli_fetch_array($consul);

        
        '<table class="gridtable" align="center">'; 
          '<tr>'; 
             '<th>'."Estudiante".'</th>';
             '<th>'."Día 1".'</th>';
             '<th>'."Día 2".'</th>';
             '<th>'."Día 3".'</th>';
          '</tr>'; 
          '<tr>'; 
             '<td>'.$results['codigo'].'</td>';
             '<td>'.$results['dia1'].'<br>'.$results['hora1'].'</td>';
             '<td>'.$results['dia2'].'<br>'.$results['hora2'].'</td>';
             '<td>'.$results['dia3'].'<br>'.$results['hora3'].'</td>';        
          '</tr>';
        '</table>';  
       

      }else{     
      
      

      }    */
      ?>

    <?php if(!empty($message_h)): ?>
      <p> <?= $message_h ?></p>
    <?php endif; ?>

    <?php
    $query_d = "SELECT dia1, dia2, dia3, hora1, hora2, hora3 FROM thorarios INNER JOIN testudiantes ON thorarios.email = testudiantes.email WHERE thorarios.email= '".$user["email"]."'";
    $consul_d = mysqli_query($conn, $query_d);
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


