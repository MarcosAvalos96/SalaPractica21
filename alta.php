<?php session_start(); 
//datos para establecer la conexion con la base de mysql.
require "cfg/conexion.php";

// verificamos si se han enviado ya las variables necesarias.
if (isset($_GET["nom"])) {
    $name = $_GET["nom"];
    $responsable = $_GET["res"];
    $telefono = $_GET["tel"];
    $email = $_GET["mail"];
    $ip = $_GET["ip"];
    $isdn = $_GET["isdn"];
    
    
    
    // Hay campos en blanco
    if($name==NULL|$responsable==NULL|$telefono==NULL|$email==NULL|$ip==NULL|$isdn==NULL) {
        echo "un campo est&aacute; vacio.";
        formRegistro();
    }else{

                $query = 'INSERT INTO SALA_REMOTA (nombre, telefono, email_responsable, ip, issdn) VALUES ("'.$name.'","'.$responsable.'","'.$telefono.'","'.$email.'","'.$ip.'","'.$isdn.'")';
                mysql_query($query) or die(mysql_error());
                echo 'La sala '.$name.' ha sido registrada de manera satisfactoria.<br/>';
   header('Location: index.php');
            }
        }

?>