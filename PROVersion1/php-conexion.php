<?php

	$host = "localhost";
	$basededatos = "prueba";
	$usuariodb = "root";
	$clavedb = "";

	//Lista de Tablas
	$tablabd = "administrator";

	$conexion = new mysqli($host,$usuariodb,$clavedb,$basededatos);


	if ($conexion->connect_errno) {
	    echo "Nuestro sitio experimenta fallos....";
	    exit();
	}

?>