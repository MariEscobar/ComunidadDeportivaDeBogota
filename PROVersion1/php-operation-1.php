<?php

    include("php-conexion.php");
      
      $nombre ="";
      $correo ="";
      $clave ="";

      // R E G I S T R O

      if(isset($_POST['registrarse']))
      {      
        $nombre = $_POST['nombre'];
        $correo = $_POST['correo'];
        $clave= $_POST['clave'];
        
          if($nombre=="" || $correo=="" || $clave=="")
          {

            echo "Llene los campos para continuar";

          }
          else
          {

            echo "Se registro exitosamente!!";

          mysqli_query($conexion, "INSERT INTO $tablabd
          (name, email, password) 
          values 
          ('$nombre','$correo', '$clave')");

          }
        }

    include("php-cerrar.php");
  ?>