<?php
  
  require '../../controller/database.php';
  

  if (!isset($_COOKIE['user_id'])) {
    header('Location: ../login.php');
  }

  $message = "<h4> Sesión iniciada como: ".$ADATA["user_nombre"]." ".$ADATA["user_apellido"]."</h4>";
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
    <p><?= $message_h ?></p>
    <?php endif; ?>           

    <form name="mod_horario" action="horario.php" method="post">
      Día1: <select name="dia1">
        <option selected="<?= $ADATA['user_dia1'] ?>" ><?= $ADATA['user_dia1'] ?> </option>                
        <option value="N/A">N/A</option>
        <option value="Lunes">Lunes</option>
        <option value="Martes">Martes</option>
        <option value="Miercoles">Miercoles</option>
        <option value="Jueves">Jueves</option>
        <option value="Viernes">Viernes</option>
        <option value="Sabado">Sabado</option>                
      </select>
      Hora día 1: <select name="hora1">
        <option selected="<?= $ADATA['user_hora1'] ?>" ><?= $ADATA['user_hora1'] ?> </option>                
        <option value="N/A">N/A</option>
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
      <br>      
      Día2: <select name="dia2">
        <option selected="<?= $ADATA['user_dia2'] ?>" ><?= $ADATA['user_dia2'] ?> </option>                
        <option value="N/A">N/A</option>
        <option value="Lunes">Lunes</option>
        <option value="Martes">Martes</option>
        <option value="Miercoles">Miercoles</option>
        <option value="Jueves">Jueves</option>
        <option value="Viernes">Viernes</option>
        <option value="Sabado">Sabado</option>                
      </select>


      Hora día 2: <select name="hora2">
        <option selected="<?= $ADATA['user_hora2'] ?>" ><?= $ADATA['user_hora2'] ?> </option>                
        <option value="N/A">N/A</option>
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
      <br>   
      Día3: <select name="dia3">
        <option selected="<?= $ADATA['user_dia3'] ?>" ><?= $ADATA['user_dia3'] ?> </option>                
        <option value="N/A">N/A</option>
        <option value="Lunes">Lunes</option>
        <option value="Martes">Martes</option>
        <option value="Miercoles">Miercoles</option>
        <option value="Jueves">Jueves</option>
        <option value="Viernes">Viernes</option>
        <option value="Sabado">Sabado</option>                
      </select>               

      Hora día 3: <select name="hora3">
        <option selected="<?= $ADATA['user_hora3'] ?>" ><?= $ADATA['user_hora3'] ?> </option>                
        <option value="N/A">N/A</option>
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


