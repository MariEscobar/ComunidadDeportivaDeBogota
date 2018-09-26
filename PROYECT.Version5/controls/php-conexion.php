<?php

	$host = "localhost";
	$basededatos = "mydb";
	$usuariodb = "root";
	$clavedb = "";

	//Lista de Tablas
	$tablabdu = "users";
	$tablabda = "admin";

	$conexion = new mysqli($host,$usuariodb,$clavedb,$basededatos);


	if ($conexion->connect_errno) {
	    echo "Nuestro sitio experimenta fallos....";
	    exit();
	}

?>