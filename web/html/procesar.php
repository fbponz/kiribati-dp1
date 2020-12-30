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
$datos_query = $resultado->fetchAll();
$id_query = $datos_query[0]['id_query'];

//Algoritmo
$consulta = "SELECT * FROM kiribati_dataset";
$resultado = $conexion->prepare($consulta);
$resultado->execute();
$dataset = $resultado->fetchAll();

$puntuacion_city_prev = 0;
$puntuacion_city = 0;
$result_city = 'Sin ciudad';
for ($handler = 0; $handler < 6; $handler++) {

    $punt_beach = 0.0;
    if((30.0 > $dataset[$handler]['km_to_beach']))
    {
        $punt_beach = ($datos_query[0]['like_beach'] * (1-$dataset[$handler]['km_beach_rank']));
    }
    
    $punt_montain =0.0;
    if(100.0 < $dataset[$handler]['altitude'])
    {
        $punt_montain = ($datos_query[0]['like_montain'] * 0.5);
    }

    $punt_temp_hot = 0.0;
    if(15.0 < $dataset[$handler]['temp'])
    {
        $punt_temp_hot = ($datos_query[0]['like_hot']* $dataset[$handler]['temp_rank']);
    }

    $punt_temp_cold = 0.0;
    if(15.0 > $dataset[$handler]['temp'])
    {
        $punt_temp_cold = ($datos_query[0]['like_cold'] * ($dataset[$handler]['temp_rank']));
    }
    
    if($datos_query[0]['health_insurance']==0)
    {
        $punt_health_insura = $dataset[$handler]['prof_ap_rank'];
    }
    else
    {
        $punt_health_insura = (1.0 - $dataset[$handler]['prof_ap_rank']);
    }
    $punt_cost_living = ($datos_query[0]['cost_of_living']*(1.0-$dataset[$handler]['ipc_rank']));
    $punt_outdoo_act = ($datos_query[0]['outdoor_activities']* $dataset[$handler]['green_zone_rank']);
    $punt_criminality = ($datos_query[0]['criminality_preference'] * (1- $dataset[$handler]['criminality_rank']));

    $puntuacion_city = ($punt_beach+$punt_montain+$punt_temp_hot+$punt_temp_cold+$punt_cost_living+$punt_health_insura+ $punt_outdoo_act+$punt_criminality);
    if($puntuacion_city>$puntuacion_city_prev)
    {
        $puntuacion_city_prev = $puntuacion_city;
        $result_city = $dataset[$handler]['city'];
    }
}



//Insertar Resultado.
$consulta = "insert into results(id_query,result)values(?,?)";
$resultado = $conexion->prepare($consulta);
$resultado->execute([$id_query, $result_city]);
$datos = $resultado->fetchAll(PDO::FETCH_OBJ);

// Obtener ID Resultado.
$consulta = "SELECT * FROM results ORDER BY id_result DESC LIMIT 1";
$resultado = $conexion->prepare($consulta);
$resultado->execute();
$datos = $resultado->fetchAll();
$id_result = $datos[0]['id_result'];


header('Location: resultado.html?IDResult='.$id_result.'&CityResult='.$result_city);
exit();
?>