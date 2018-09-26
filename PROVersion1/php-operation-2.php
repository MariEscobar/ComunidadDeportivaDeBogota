<?php

    $nombre ="";
    $clave ="";

    // L O G I N

    if (isset($_POST['ingresar'])) {

    $nombre = $_POST['nombre'];
    $clave = $_POST['clave'];

    $conexion = mysqli_connect("localhost", "root", "", "prueba") or die("No conecto a la base de datos");

    $consultar = "SELECT * FROM administrator WHERE name = '$nombre' and password = '$clave'";

    $resultado = mysqli_query($conexion, $consultar);

    $filas = mysqli_num_rows($resultado);

    if ($filas > 0) {
      
      header("location: panel-administrator.html");

    }
    else {

      echo "Error en la autentificacion";

    }

    mysqli_free_result($resultado);
    mysqli_close($conexion);

    }

  ?>