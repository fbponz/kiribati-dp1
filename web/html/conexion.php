<?php

class Conexion {
    function Conectar(){
        try{
            $conexion = new PDO("pgsql:host=postgres;dbname=kiriweb", "kiriuser", "kiripass");
            return $conexion;
        }catch(Exception $error){
            die("Error:".$error->getMessage());
        }
    }
}

