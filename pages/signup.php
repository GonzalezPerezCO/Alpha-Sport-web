<?php
    $master = "Inscripciones Terminadas";

    #borrar para dejar habilitado
    if(!empty(master)) header('Location: ../index.php');

  if (isset($_COOKIE['user_id'])) header('Location: logout.php');
  else{
    require '../controller/database.php';  
    include '../controller/global.php';  

    $message = '';
    
    if (!empty($_POST['reserva']) && !empty($_POST['documento']) && !empty($_POST['carrera']) && !empty($_POST['email']) && !empty($_POST['codigo']) && !empty($_POST['semestre']) && !empty($_POST['password']) && !empty($_POST['confirm_password'])) {  

      if($_POST['password'] == $_POST['confirm_password']){

        $query = "SELECT id, email, reserva FROM testudiantes".$PERIODO." WHERE reserva ='".$_POST['reserva']."'";
        $consul = mysqli_query($conn, $query) or die(mysqli_error($conn));
        $results = mysqli_fetch_array($consul);
        
        if (count($results) > 0) {
          if($results['email']!=$results['reserva']){
              $message = 'El código de reserva ya fue usado';
          }
          else{
            $query = "UPDATE testudiantes".$PERIODO." SET documento = '".$_POST['documento']."', carrera = '".$_POST['carrera']."', email = '".$_POST['email']."', codigo = '".$_POST['codigo']."', semestre = '".$_POST['semestre']."', password = '".$_POST['password']."' WHERE reserva='".$_POST['reserva']."'";
            $consul = mysqli_query($conn, $query) or die(mysqli_error($conn));
              
            $message = 'Successfully created new user';
            header('Location: logout.php');  
          }
        }
        else{           
          $message = 'El código de reserva no existe'; 
        }   
      }else{ $message="La contraseña no coincide"; }      
    }
    else{ $message="Hay campos vacios, llene los campos"; }
  }  
?>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Deportes - SignUp</title>
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
<link rel="stylesheet" href="../controller/assets/css/style.css">
</head>
<body>   
  <div class="container">
    <?php if(!empty($message)): ?>
    <p><font color="blue"><?= $message ?></font></p>
    <?php endif; ?>
    <iframe src="http://free.timeanddate.com/clock/i6dk1lhx/n41/tlco4/pa5/tt0" frameborder="0" width="310" height="26"></iframe>
    <h1>Registrarse</h1>    
    <span>o <a href="login.php">Ingresar</a></span>
    <br>
      <h4><font color="red">Escriba su código de reserva para que los datos se asocien con los que dio en el Gimnasio.</font><h4>
    <form action="signup.php" method="POST">
      <input name="reserva" type="number" placeholder="Código de reserva">
      <input name="documento" type="number" placeholder="Documento">
      <input name="carrera" type="text" placeholder="Programa académico">
      <input name="email" type="text" placeholder="Correo de la Escuela">
      <input name="codigo" type="number" placeholder="Código">
      <input name="semestre" type="number" placeholder="Semestre">
      <input name="password" type="password" placeholder="Contraseña">
      <input name="confirm_password" type="password" placeholder="Confirme la contraseña">
      <input type="submit" value="Submit">
    </form>
  </div>
</body>
</html>