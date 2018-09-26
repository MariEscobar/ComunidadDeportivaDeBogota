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

    if (isset($_POST['ingresar'])) {

    $documento = $_POST['documento'];
    $clave = $_POST['clave'];

    $conexion = mysqli_connect("localhost", "root", "", "mydb") or die("No conecto a la base de datos");

    $consultar = "SELECT * FROM admin WHERE NombreAd = '$documento' and ClaveAd = '$clave'";

    $resultado = mysqli_query($conexion, $consultar);

    $filas = mysqli_num_rows($resultado);

    if ($filas > 0) {
      
      header("location: ../model/panel-administrador.html");

    }
    else {

      echo "Error en la autentificacion";

    }

    mysqli_free_result($resultado);
    mysqli_close($conexion);

    }

  ?>
  
</center></h3>
      <center><p>Vuelva al login para poder ingresar al panel del administrador</p></center>

      <center><a href="../model/login_ad.html"><font color="red"> Volver </font></a></center>

    </div>
    </div>
  </div>

  <div id="dropDownSelect1"></div>
  
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