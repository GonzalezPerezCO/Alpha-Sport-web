<?php
  
  require '../../controller/database.php'; 

  if (!isset($_COOKIE['user_id'])) {
    header('Location: ../login.php');
  }

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

  <div id = "tabla"> 
    <form name="mod_horario" action="horario.php" method="post">
      Día1: <select name="dia1">
        <option selected="<?= $ADATA['user_dia1'] ?>" ><?= $ADATA['user_dia1'] ?> </option>                
        <option value="N/A">N/A</option>
        <option value="lunes">Lunes</option>
        <option value="martes">Martes</option>
        <option value="miercoles">Miercoles</option>
        <option value="jueves">Jueves</option>
        <option value="viernes">Viernes</option>          
      </select>
      Hora día 1: <select name="hora1">
        <option selected="<?= $ADATA['user_hora1'] ?>" ><?= $ADATA['user_hora1'] ?> </option>                
        <option value="N/A">N/A</option>
        <option value="f8">8:00</option>
        <option value="f9">9:00</option>
        <option value="f10">10:00</option>
        <option value="f11">11:00</option>
        <option value="f12">12:00</option>
        <option value="f13">13:00</option>
        <option value="f14">14:00</option>
        <option value="f15">15:00</option>
        <option value="f16">16:00</option>
      </select>
      <br>
      <br>      
      Día2: <select name="dia2">
        <option selected="<?= $ADATA['user_dia2'] ?>" ><?= $ADATA['user_dia2'] ?> </option>                
        <option value="N/A">N/A</option>
        <option value="lunes">Lunes</option>
        <option value="martes">Martes</option>
        <option value="miercoles">Miercoles</option>
        <option value="jueves">Jueves</option>
        <option value="viernes">Viernes</option>            
      </select>


      Hora día 2: <select name="hora2">
        <option selected="<?= $ADATA['user_hora2'] ?>" ><?= $ADATA['user_hora2'] ?> </option>                
        <option value="N/A">N/A</option>
        <option value="f8">8:00</option>
        <option value="f9">9:00</option>
        <option value="f10">10:00</option>
        <option value="f11">11:00</option>
        <option value="f12">12:00</option>
        <option value="f13">13:00</option>
        <option value="f14">14:00</option>
        <option value="f15">15:00</option>
        <option value="f16">16:00</option>
      </select>
      <br>
      <br>   
      Día3: <select name="dia3">
        <option selected="<?= $ADATA['user_dia3'] ?>" ><?= $ADATA['user_dia3'] ?> </option>                
        <option value="N/A">N/A</option>
        <option value="lunes">Lunes</option>
        <option value="martes">Martes</option>
        <option value="miercoles">Miercoles</option>
        <option value="jueves">Jueves</option>
        <option value="viernes">Viernes</option>            
      </select>               

      Hora día 3: <select name="hora3">
        <option selected="<?= $ADATA['user_hora3'] ?>" ><?= $ADATA['user_hora3'] ?> </option>                
        <option value="N/A">N/A</option>
        <option value="f8">8:00</option>
        <option value="f9">9:00</option>
        <option value="f10">10:00</option>
        <option value="f11">11:00</option>
        <option value="f12">12:00</option>
        <option value="f13">13:00</option>
        <option value="f14">14:00</option>
        <option value="f15">15:00</option>
        <option value="f16">16:00</option>
      </select>        
      <br>
      <input type="submit" name="submit" />
    </form>


  </div>


</body>  
</html>


