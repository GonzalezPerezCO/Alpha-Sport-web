<?php
  
  require '../../controller/database.php'; 

  if (!isset($_COOKIE['user_id'])) {
    header('Location: ../login.php');
  }

  $nombres_tablas = "lunesf8, lunesf9, lunesf10, lunesf11, lunesf12, lunesf13, lunesf14, lunesf15, lunesf16, martesf8, martesf9, martesf10, martesf11, martesf12, martesf13, martesf14, martesf15, martesf16, miercolesf8, miercolesf9, miercolesf10, miercolesf11, miercolesf12, miercolesf13, miercolesf14, miercolesf15, miercolesf16, juevesf8, juevesf9, juevesf10, juevesf11, juevesf12, juevesf13, juevesf14, juevesf15, juevesf16, viernesf8, viernesf9, viernesf10, viernesf11, viernesf12, viernesf13, viernesf14, viernesf15, viernesf16";
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
  $cupos['martesf8']=$results['martesf8'];
  $cupos['martesf9']=$results['martesf9'];
  $cupos['martesf10']=$results['martesf10'];
  $cupos['martesf11']=$results['martesf11'];
  $cupos['martesf12']=$results['martesf12'];
  $cupos['martesf13']=$results['martesf13'];
  $cupos['martesf14']=$results['martesf14'];
  $cupos['martesf15']=$results['martesf15'];
  $cupos['martesf16']=$results['martesf16'];
  $cupos['miercolesf8']=$results['miercolesf8'];
  $cupos['miercolesf9']=$results['miercolesf9'];
  $cupos['miercolesf10']=$results['miercolesf10'];
  $cupos['miercolesf11']=$results['miercolesf11'];
  $cupos['miercolesf12']=$results['miercolesf12'];
  $cupos['miercolesf13']=$results['miercolesf13'];
  $cupos['miercolesf14']=$results['miercolesf14'];
  $cupos['miercolesf15']=$results['miercolesf15'];
  $cupos['miercolesf16']=$results['miercolesf16'];
  $cupos['juevesf8']=$results['juevesf8'];
  $cupos['juevesf9']=$results['juevesf9'];
  $cupos['juevesf10']=$results['juevesf10'];
  $cupos['juevesf11']=$results['juevesf11'];
  $cupos['juevesf12']=$results['juevesf12'];
  $cupos['juevesf13']=$results['juevesf13'];
  $cupos['juevesf14']=$results['juevesf14'];
  $cupos['juevesf15']=$results['juevesf15'];
  $cupos['juevesf16']=$results['juevesf16'];
  $cupos['viernesf8']=$results['viernesf8'];
  $cupos['viernesf9']=$results['viernesf9'];
  $cupos['viernesf10']=$results['viernesf10'];
  $cupos['viernesf11']=$results['viernesf11'];
  $cupos['viernesf12']=$results['viernesf12'];
  $cupos['viernesf13']=$results['viernesf13'];
  $cupos['viernesf14']=$results['viernesf14'];
  $cupos['viernesf15']=$results['viernesf15'];
  $cupos['viernesf16']=$results['viernesf16'];



  $query = "SELECT testudiantes.nombre as nombre, testudiantes.apellido as apellido, dia1, dia2, dia3, hora1, hora2, hora3 FROM thorarios INNER JOIN testudiantes ON thorarios.email = testudiantes.email WHERE testudiantes.email = thorarios.email AND testudiantes.email= '".$_COOKIE['user_id']."'";
  $consul = mysqli_query($conn, $query) or die(mysqli_error($conn));
  $results = mysqli_fetch_array($consul);

  $ADATA['user_nombre']= $results["nombre"];
  $ADATA['user_apellido']= $results["apellido"];
  $ADATA['user_dia1']= $results["dia1"];
  $ADATA['user_dia2']= $results["dia2"];
  $ADATA['user_dia3']= $results["dia3"];
  $ADATA['user_hora1']= $results["hora1"];
  $ADATA['user_hora2']= $results["hora2"];
  $ADATA['user_hora3']= $results["hora3"];
  
  $message = "<h4> Sesión iniciada como: ".$ADATA['user_nombre']." ".$ADATA['user_apellido']."</h4>";
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

  <?php if(!empty($_GET['message_h'])): ?>
  <p><?= $_GET['message_h']?></p>
  <?php endif; ?>

  <hr>
  <div id="cupos">
    <h3>Disponibilidad de cupos para franja horaria</h3>
    <table class="gridtable" align="center">
    <tr>
      <th>Hora</th>
      <th>Lunes</th>
      <th>Martes</th>
      <th>Miercoles</th>
      <th>Jueves</th>
      <th>Viernes</th>
    </tr>
    <tr>
      <td class="cajon">8-9</td>
      <td><?= $cupos['lunesf8'] ?></td>
      <td><?= $cupos['martesf8'] ?></td>
      <td><?= $cupos['miercolesf8'] ?></td>
      <td><?= $cupos['juevesf8'] ?></td>
      <td><?= $cupos['viernesf8'] ?></td>
    </tr>
    <tr>
      <td class="cajon">9-10</td>
      <td><?= $cupos['lunesf9'] ?></td>
      <td><?= $cupos['martesf9'] ?></td>
      <td><?= $cupos['miercolesf9'] ?></td>
      <td><?= $cupos['juevesf9'] ?></td>
      <td><?= $cupos['viernesf9'] ?></td>
    </tr>
    <tr>
      <td class="cajon">10-11</td>
      <td><?= $cupos['lunesf10'] ?></td>
      <td><?= $cupos['martesf10'] ?></td>
      <td><?= $cupos['miercolesf10'] ?></td>
      <td><?= $cupos['juevesf10'] ?></td>
      <td><?= $cupos['viernesf10'] ?></td>
    </tr>
    <tr>
      <td class="cajon">11-12</td>
      <td><?= $cupos['lunesf11'] ?></td>
      <td><?= $cupos['martesf11'] ?></td>
      <td><?= $cupos['miercolesf11'] ?></td>
      <td><?= $cupos['juevesf11'] ?></td>
      <td><?= $cupos['viernesf11'] ?></td>
    </tr>
    <tr>
      <td class="cajon">12-13</td>
      <td><?= $cupos['lunesf12'] ?></td>
      <td><?= $cupos['martesf12'] ?></td>
      <td><?= $cupos['miercolesf12'] ?></td>
      <td><?= $cupos['juevesf12'] ?></td>
      <td><?= $cupos['viernesf12'] ?></td>
    </tr>
    <tr>
      <td class="cajon">13-14</td>
      <td><?= $cupos['lunesf13'] ?></td>
      <td><?= $cupos['martesf13'] ?></td>
      <td><?= $cupos['miercolesf13'] ?></td>
      <td><?= $cupos['juevesf13'] ?></td>
      <td><?= $cupos['viernesf13'] ?></td>
    </tr>
    <tr>
      <td class="cajon">14-15</td>
      <td><?= $cupos['lunesf14'] ?></td>
      <td><?= $cupos['martesf14'] ?></td>
      <td><?= $cupos['miercolesf14'] ?></td>
      <td><?= $cupos['juevesf14'] ?></td>
      <td><?= $cupos['viernesf14'] ?></td>
    </tr>
    <tr>
      <td class="cajon">15-16</td>
      <td><?= $cupos['lunesf15'] ?></td>
      <td><?= $cupos['martesf15'] ?></td>
      <td><?= $cupos['miercolesf15'] ?></td>
      <td><?= $cupos['juevesf15'] ?></td>
      <td><?= $cupos['viernesf15'] ?></td>
    </tr>
    <tr>
      <td class="cajon">16-17</td>
      <td><?= $cupos['lunesf16'] ?></td>
      <td><?= $cupos['martesf16'] ?></td>
      <td><?= $cupos['miercolesf16'] ?></td>
      <td><?= $cupos['juevesf16'] ?></td>
      <td><?= $cupos['viernesf16'] ?></td>
    </tr>
  </table>
    
  </div>

  <br>


  <div id = "tabla"> 
    <form name="mod_horario" action="horario.php" method="post">
      Día1: <select name="dia1">
        <option selected="<?= $ADATA['user_dia1'] ?>" ><?= $ADATA['user_dia1'] ?> </option>                
        <option value="N/A">N/A</option>
        <option value="Lunes">Lunes</option>
        <option value="Martes">Martes</option>
        <option value="Miercoles">Miercoles</option>
        <option value="Jueves">Jueves</option>
        <option value="Viernes">Viernes</option>          
      </select>
      Hora día 1: <select name="hora1">
        <option selected="<?= $ADATA['user_hora1'] ?>" ><?= $ADATA['user_hora1'] ?> </option>                
        <option value="N/A">N/A</option>
        <option value="8:00<">8:00</option>
        <option value="9:00<">9:00</option>
        <option value="10:00">10:00</option>
        <option value="11:00">11:00</option>
        <option value="12:00">12:00</option>
        <option value="13:00">13:00</option>
        <option value="14:00">14:00</option>
        <option value="15:00">15:00</option>
        <option value="16:00">16:00</option>
      </select>
      <br>
      <br>      
      Día2: <select name="dia2">
        <option selected="<?= $ADATA['user_dia2'] ?>" ><?= $ADATA['user_dia2'] ?> </option>                
        <option value="N/A">N/A</option>
        <option value="Lunes">Lunes</option>
        <option value="Martes">Martes</option>
        <option value="Miercoles">Miercoles</option>
        <option value="Jueves">Jueves</option>
        <option value="Viernes">Viernes</option>            
      </select>


      Hora día 2: <select name="hora2">
        <option selected="<?= $ADATA['user_hora2'] ?>" ><?= $ADATA['user_hora2'] ?> </option>                
        <option value="N/A">N/A</option>
        <option value="8:00<">8:00</option>
        <option value="9:00<">9:00</option>
        <option value="10:00">10:00</option>
        <option value="11:00">11:00</option>
        <option value="12:00">12:00</option>
        <option value="13:00">13:00</option>
        <option value="14:00">14:00</option>
        <option value="15:00">15:00</option>
        <option value="16:00">16:00</option>
      </select>
      <br>
      <br>   
      Día3: <select name="dia3">
        <option selected="<?= $ADATA['user_dia3'] ?>" ><?= $ADATA['user_dia3'] ?> </option>                
        <option value="N/A">N/A</option>
        <option value="Lunes">Lunes</option>
        <option value="Martes">Martes</option>
        <option value="Miercoles">Miercoles</option>
        <option value="Jueves">Jueves</option>
        <option value="Viernes">Viernes</option>            
      </select>               

      Hora día 3: <select name="hora3">
        <option selected="<?= $ADATA['user_hora3'] ?>" ><?= $ADATA['user_hora3'] ?> </option>                
        <option value="N/A">N/A</option>
        <option value="8:00<">8:00</option>
        <option value="9:00<">9:00</option>
        <option value="10:00">10:00</option>
        <option value="11:00">11:00</option>
        <option value="12:00">12:00</option>
        <option value="13:00">13:00</option>
        <option value="14:00">14:00</option>
        <option value="15:00">15:00</option>
        <option value="16:00">16:00</option>
      </select>        
      <br>
      <input type="submit" name="submit" />
    </form>


  </div>


</body>  
</html>


