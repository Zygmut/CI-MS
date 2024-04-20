<?php
// Datos de conexión a la base de datos
$servername = "bbdd.musapientum.com";
$username = "ddb222084";
$password = "ptkcu]7cwrSps(";
$database = "ddb222084";

// Variable para almacenar la respuesta
$response = array();

// Intentar establecer la conexión a la base de datos
$conn = mysqli_connect($servername, $username, $password, $database);

// Verificar la conexión
if (!$conn) {
    $response['error'] = "Conexión fallida: " . mysqli_connect_error();
} else {
    // Preparar la consulta SQL con la variable
    $sql = "SELECT
            p._id,
            pr.nombre,
            pr.descripcion,
            pr.coste,
            pr.imagen
        FROM
            PLANTA p
        JOIN PRODUCTO pr ON
            pr._id = p._id
        LIMIT 20";

    // Ejecutar la consulta
    $resultado = $conn->query($sql);

    if ($resultado->num_rows > 0) {
        $plantas = array();

        // Iterar sobre cada fila de resultados
        while ($row = $resultado->fetch_assoc()) {
            // Agregar características al array de características
            $plantas[] = array(
                'id' => utf8_encode($row['_id']),
                'nombre' => utf8_encode($row['nombre']),
                'descripcion' => utf8_encode($row['descripcion']),
                'coste' => utf8_encode($row['coste']),
                'imagen' => utf8_encode($row['imagen'])
            );
        }

        // Agregar arrays de características y temporadas al response
        $response['plantas'] = $plantas;
    } else {
        $response['error'] = "No se encontraron resultados.";
    }
}

// Cerrar la conexión si está abierta
if ($conn) {
    $conn->close();
}

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
