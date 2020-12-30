<?php

try{
    $myPDO = new PDO("pgsql:host=postgres;dbname=kiriweb","kiriuser","kiripass");
    echo "Connected to PostgreSQL";
}catch(PDOException $e)
{
    echo $e->getMessage();
}

?>