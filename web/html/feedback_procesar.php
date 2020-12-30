<?php

include('conexion.php');

$mudarte = $_POST['Mudarte'];
$IDres = $_POST['IDResults'];


$dbobj = new Conexion();
$conexion = $dbobj->Conectar();
//Insertar Cliente.
$consulta = "insert into feedback_results(id_result,feedback)values(?,?)";
$resultado = $conexion->prepare($consulta);
$resultado->execute([$IDres, $mudarte]);
$datos = $resultado->fetchAll(PDO::FETCH_OBJ);

header('Location: feedback_resultado.html');
exit();
?>