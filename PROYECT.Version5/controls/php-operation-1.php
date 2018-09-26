<!DOCTYPE html>
<html lang="en">
<head>
  <title>Login U C.D.B</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
  <link rel="stylesheet" type="text/css" href="../vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
  <link rel="stylesheet" type="text/css" href="../fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
  <link rel="stylesheet" type="text/css" href="../fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
  <link rel="stylesheet" type="text/css" href="../vendor/animate/animate.css">
<!--===============================================================================================-->  
  <link rel="stylesheet" type="text/css" href="../vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
  <link rel="stylesheet" type="text/css" href="../vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
  <link rel="stylesheet" type="text/css" href="../vendor/select2/select2.min.css">
<!--===============================================================================================-->  
  <link rel="stylesheet" type="text/css" href="../vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
  <link rel="stylesheet" type="text/css" href="../css/util.css">
  <link rel="stylesheet" type="text/css" href="../css/main.css">
<!--===============================================================================================-->
</head>
<body>

  <div class="limiter">
    <div class="container-login100" style="background-image: url('../images/bg-01.jpg');">
      <div class="jumbotron" style="background: rgba(255, 255, 255, 0); ">

      <h3 class="display-1"><center>

  <?php
    include("php-conexion.php");

      if(isset($_POST['registrarse']))
      {      
        $correo = $_POST['correo'];
        $nombre = $_POST['nombre'];
        $clave = $_POST['clave'];
        
          if($correo =="" ||$nombre=="" || $clave =="")
          {

            echo "Llene los campos para continuar";

          }
          else
          {


          mysqli_query($conexion, "INSERT INTO $tablabdu
          (CorreoUs, NombreUs, ClaveUs) 
          values 
          ('$correo','$nombre', '$clave')");

          echo "Se registro correctamente";

          }
        }

    include("php-cerrar.php");
  ?>
  
</center></h3>
      <center><p>Vuelva al login para poder ingresar al panel del usuario</p></center>

      <center><a href="../model/login.html"><font color="red"> Volver </font></a></center>

    </div>
  </div>
</div>

<!--===============================================================================================-->
  <script src="../vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
  <script src="../vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
  <script src="../vendor/bootstrap/js/popper.js"></script>
  <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
  <script src="../vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
  <script src="../vendor/daterangepicker/moment.min.js"></script>
  <script src="../vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
  <script src="../vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
  <script src="../js/main.js"></script>

</body>
</html>