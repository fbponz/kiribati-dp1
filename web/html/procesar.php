<?php

include('conexion.php');

$name = $_POST['name'];
$surname = $_POST['surname'];
$age = $_POST['age'];
$gender = $_POST['gender'];
$email = $_POST['email'];
$city = $_POST['city'];
$jobName = $_POST['jobName'];
$salary = $_POST['salary'];
$rentPayment = $_POST['rentPayment'];
$likeBeach = $_POST['likeBeach'];
$likeMontain = $_POST['likeMontain'];
$likeCold = $_POST['likeCold'];
$likeHot = $_POST['likeHot'];
$lifeCost = $_POST['lifeCost'];
$healthInsurance = $_POST['healthInsurance'];
$outdoorsActivities = $_POST['outdoorsActivities'];
$citizenSecurity = $_POST['citizenSecurity'];

$dbobj = new Conexion();
$conexion = $dbobj->Conectar();
//Insertar Cliente.
$consulta = "insert into client(names,surname,age,gender,email,job,city)values(?,?,?,?,?,?,?)";
$resultado = $conexion->prepare($consulta);
$resultado->execute([$name, $surname, $age, $gender, $email, $jobName, $city]);
$datos = $resultado->fetchAll(PDO::FETCH_OBJ);

//Obtener ID Cliente
$consulta = "SELECT * FROM client ORDER BY id_client DESC LIMIT 1";
$resultado = $conexion->prepare($consulta);
$resultado->execute();
$datos = $resultado->fetchAll();
$id_cliente = $datos[0]['id_client'];

//Insertar Query.
$consulta = "insert into query(id_client,salary,qty_rent,like_beach,like_montain,like_hot,like_cold,cost_of_living,health_insurance,outdoor_activities,criminality_preference)values(?,?,?,?,?,?,?,?,?,?,?)";
$resultado = $conexion->prepare($consulta);
$resultado->execute([$id_cliente, $salary, $rentPayment, $likeBeach, $likeMontain, $likeHot, $likeCold,$lifeCost,$healthInsurance,$outdoorsActivities,$citizenSecurity]);
$datos = $resultado->fetchAll(PDO::FETCH_OBJ);

//Obtener ID Query
$consulta = "SELECT * FROM query ORDER BY id_query DESC LIMIT 1";
$resultado = $conexion->prepare($consulta);
$resultado->execute();
$datos = $resultado->fetchAll();
$id_query = $datos[0]['id_query'];

//Algoritmo
//TBD
$resultado_city ='Valencia';


//Insertar Resultado.
$consulta = "insert into results(id_query,result)values(?,?)";
$resultado = $conexion->prepare($consulta);
$resultado->execute([$id_query, $resultado_city]);
$datos = $resultado->fetchAll(PDO::FETCH_OBJ);

// Obtener ID Resultado.
$consulta = "SELECT * FROM results ORDER BY id_result DESC LIMIT 1";
$resultado = $conexion->prepare($consulta);
$resultado->execute();
$datos = $resultado->fetchAll();
$id_result = $datos[0]['id_result'];


header('Location: resultado.html?IDResult='.$id_result.'&CityResult='.$resultado_city);
exit();
?>