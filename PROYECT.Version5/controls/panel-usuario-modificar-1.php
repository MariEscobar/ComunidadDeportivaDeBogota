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
      
      $nombreanterior ="";
      $nombrenuevo ="";

            // A C T U A L I Z A R

        if(isset($_POST['actualizar']))
        {
          $nombreanterior = $_POST['nombrea'];
          $nombrenuevo = $_POST['nombren'];

        
          if($nombreanterior=="" || $nombrenuevo =="")
          {

            echo "Llene los campos para continuar";

          }
          else
          {

            $existe=0;

          //CONSULTAR

          $resultados = mysqli_query($conexion,"SELECT NombreUs FROM $tablabdu");
          while($consulta = mysqli_fetch_array($resultados))
          {
            $existe++;
          }
          if($existe==0)
          {

            echo "El nombre no existe";

          }
          else 
          {

          //ACTUALIZAR 

          $_UPDATE_SQL="UPDATE $tablabdu Set 
          NombreUs='$nombrenuevo'

          WHERE NombreUs = '$nombreanterior'"; 

          mysqli_query($conexion,$_UPDATE_SQL);
          echo "Actualizacion con exito";

          }

          }
      }

    include("php-cerrar.php");
  ?>
  
</center></h3>
      <center><p>Vuelva a intentarlo</p></center>

      <center><a href="../model/panel-usuario.html"><font color="red"> Volver </font></a></center>

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