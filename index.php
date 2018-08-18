<?php  

  require 'controller/database.php';
  
  if (isset($_COOKIE['user_id'])) {   
      $query = "SELECT nombre, apellido FROM testudiantes WHERE email='".$_COOKIE['user_id']."'";      
      $consul = mysqli_query($conn, $query) or die(mysqli_error($conn));
      $results = mysqli_fetch_array($consul);   
      $user=$results["nombre"]." ".$results["apellido"];
    }
?>


<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Deportes</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link rel="stylesheet" href="controller/assets/css/style.css">
  </head>
  <body>
  <div class="container">
    <header>
      <div class="logoescuela">
        <img src="media/logo-ESCUELA.svg" width="650" height="auto">
      </div>
    </header>
    <section>
        <h1>Deportes de la Escuela <br><font color="blue">Inscripciones Terminadas</font></h1>
        <iframe src="http://free.timeanddate.com/clock/i6dk1lhx/n41/tlco4/pa5/tt0" frameborder="0" width="310" height="26"></iframe>
        <br>
      <?php if(!empty($user)): ?>      
        <h3> Sesión iniciada como: <?= $user; ?> </h3>         
        <a href="pages/logout.php">
          Salir
        </a>
      <?php else: ?>      
        <h3>Por favor ingrese o regístrese</h3>
        <a href="pages/login.php">Ingresar</a> <br>
        o
        <br><a href="pages/signup.php">Registrarse</a>
      <?php endif; ?>
    
      <p>
      <b>Instrucciones:</b><br>
      Sí necesita ayuda con el sistema, puede comunicarse a los correos de los desarrolladores que verá en la parte inferior,
      Primero registrese en <b>Registrarse</b> con su número de reserva y complete los datos que se le piden. El registro lo puede hacer en cualquier momento de día
      hoy Agosto 18.
      </p>
      <p>
      Despues de crear su cuenta inicie sesión. Luego de esto puede hacer su horario.      
      </p>
      <p>
      <b>Recuerde que tiene 10 minutos para hacer su horario.</b>   
      </p>
      <br>
      <h3><a href="cupos_dis.php">Ver Cupos Disponibles</a></h3>

      <p class="desc">
        Esta es una <a href=""> iniciativa </a> propia con el apoyo del <a href="http://laboratorio.is.escuelaing.edu.co/"> Laboratorio de Sistemas </a>
      y <a href="https://www.escuelaing.edu.co/es/vida_universitaria/bienestar_universitario/recreacion/programa"> Bienestar Universitario</a>, para la elaboración de horarios de los estudiantes al Gimnasio de la Escuela.
      Para saber mas visite<a href="http://notiweb.escuelaing.edu.co/blog/2018/07/24/ganadores-de-la-trigesima-sexta-version-de-la-vitrina-academica-2018-i/"> el NOTIWEB. </a>
      </p>
      </section>

    <footer>
      <p>
      <b>Cordialmente:</b><br>
      <br>Desarrolladores:<br>    
      Juan Francisco Gonzalez <font color="blue">juan.gonzalez@mail.escuelaing.edu.co</font><br>
      Manuel Sergio Pérez <font color="blue">manuel.perez-e@mail.escuelaing.edu.co</font><br>
      Directora:
      Ing. Claudia Patricia Castañeda<br>
      <i>Decanatura de Ingeniería de Sistemas</i><br>
      <i>PGR - 2018-i - 2018-2</i>
      </p>
    </footer>
  </div>
  </body>
</html>