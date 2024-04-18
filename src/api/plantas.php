<?php
$servername = "bbdd.musapientum.com";
$username = "ddb222084";
$password = "ptkcu]7cwrSps(";
$database = "ddb222084";

$response = array();

try {
    $conn = mysqli_connect($servername, $username, $password, $database);
} catch (Exception $e) {
    die("Conexión fallida: " . mysqli_connect_error());
    $response['error'] = $e->getMessage();
}

if (!$conn) {
    $response['error'] = "Conexión fallida: " . mysqli_connect_error();
} else {
    $id = $_GET['id'];

    $sql = "SELECT
            p._id,
            pr.nombre,
            pr.descripcion,
            pr.coste,
            pr.imagen,
            c._id as _id_caract,
            c.nombre as nombre_caract,
            c.valor as valor_caract,
            t.nombre as nombre_temp,
            t.fecha_inicio,
            t.fecha_fin
        FROM
            PLANTA p
        JOIN PRODUCTO pr ON
            pr._id = p._id
        JOIN R_PLA_TEM pt ON
            pt._id_planta = p._id
        JOIN TEMPORADA t ON
            t.nombre = pt.nombre_temporada
        JOIN R_PLA_CAR pc ON
            pc._id_planta = p._id
        JOIN CARACTERISTICA c ON
            c._id = pc._id_caracteristica
        WHERE
            p._id = $id;";

    $resultado = $conn->query($sql);

    if ($resultado->num_rows > 0) {
        $caracteristicas = array();
        $temporadas = array();

        while ($row = $resultado->fetch_assoc()) {
            if (!isset($response['_id_planta'])) {
                $response['_id_planta'] = utf8_encode($row['_id']);
                $response['_nom_prod'] = utf8_encode($row['nombre']);
                $response['_desc_prod'] = utf8_encode($row['descripcion']);
                $response['coste'] = utf8_encode($row['coste']);
                $response['imagen'] = utf8_encode($row['imagen']);
            }

            $caracteristicas[] = array(
                '_id' => utf8_encode($row['_id_caract']),
                'nombre' => utf8_encode($row['nombre_caract']),
                'valor' => utf8_encode($row['valor_caract'])
            );

            $temporadas[] = array(
                'nombre' => utf8_encode($row['nombre_temp']),
                'fecha_inicio' => utf8_encode($row['fecha_inicio']),
                'fecha_fin' => utf8_encode($row['fecha_fin'])
            );
        }

        $response['caracteristicas'] = $caracteristicas;
        $response['temporadas'] = $temporadas;
    } else {
        $response['error'] = "No se encontraron resultados.";
    }
}
$conn->close();

$json_response = json_encode($response, JSON_UNESCAPED_UNICODE);

if ($json_response === false) {
    $response['error'] = 'Error al codificar JSON: ' . json_last_error_msg();
    echo json_encode($response);
} else {
    header('Content-Type: application/json; charset=utf-8');
    echo $json_response;
}
?>
