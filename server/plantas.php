<?php
// Datos de conexión a la base de datos
$servername = "bbdd.musapientum.com"; // Cambia esto si tu servidor MySQL está en un host diferente
$username = "ddb222084"; // Nombre de usuario de MySQL
$password = "ptkcu]7cwrSps("; // Contraseña de MySQL
$database = "ddb222084"; // Nombre de la base de datos a la que te quieres conectar

// Variable para almacenar la respuesta
$response = array();

// Intentar establecer la conexión a la base de datos
try {
    // Conexión a la base de datos
    $conn = mysqli_connect($servername, $username, $password, $database);
} catch (Exception $e) {
    $response['error'] = $e->getMessage();
}

// Verificar la conexión
if (!$conn) {
    $response['error'] = "Conexión fallida: " . mysqli_connect_error();
} else {
    // Obtener el valor de la variable pasada
    $id = $_GET['id']; // Cambia 'nombre' al nombre real de la variable que estás pasando

    // Preparar la consulta SQL con la variable
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

    // Ejecutar la consulta
    $resultado = $conn->query($sql);

    if ($resultado->num_rows > 0) {
        // Inicializar arrays para características y temporadas
        $caracteristicas = array();
        $temporadas = array();
        
        // Iterar sobre cada fila de resultados
        while ($row = $resultado->fetch_assoc()) {
            // Si no se ha agregado aún la información básica de la planta al response, hacerlo
            if (!isset($response['_id_planta'])) {
                $response['_id_planta'] = $row['_id'];
                $response['_nom_prod'] = $row['nombre'];
                $response['_desc_prod'] = $row['descripcion'];
                $response['coste'] = $row['coste'];
                $response['imagen'] = $row['imagen'];
            }

            // Agregar características al array de características
            $caracteristicas[] = array(
                '_id' => $row['_id_caract'],
                'nombre' => $row['nombre_caract'],
                'valor' => $row['valor_caract']
            );
            
            // Agregar temporadas al array de temporadas
            $temporadas[] = array(
                'nombre' => $row['nombre_temp'],
                'fecha_inicio' => $row['fecha_inicio'],
                'fecha_fin' => $row['fecha_fin']
            );
        }
        
        // Agregar arrays de características y temporadas al response
        $response['caracteristicas'] = $caracteristicas;
        $response['temporadas'] = $temporadas;
    } else {
        $response['error'] = "No se encontraron resultados.";
    }
}
// Cerrar la conexión
$conn->close();

$json_response = json_encode($response, JSON_UNESCAPED_UNICODE);

// Verificar si hubo algún error durante la codificación JSON
if ($json_response === false) {
    // Manejar el error en la codificación JSON
    $response['error'] = 'Error al codificar JSON: ' . json_last_error_msg();
    echo json_encode($response);
} else {
    // Devolver la respuesta JSON
    header('Content-Type: application/json; charset=utf-8'); // Asegúrate de incluir la codificación en el encabezado
    echo $json_response;
}
?>


