<?php
    $servidor = "0.0.0.0";
    $usuario = "vaictor";
    $db = "c9";

    $conexion = mysql_connect($servidor, $usuario);
        mysql_set_charset('utf8');
    if (!$conexion) {
        die("No pudo conectarse:" . mysql_error());
    }
    else{
       //echo 'Conectado  satisfactoriamente al servidor <br>';
    }
    mysql_select_db($db, $conexion) or die(mysql_error($conexion));
?>