<?php
// Datos de conexión a la base de datos
$servername = "bbdd.musapientum.com"; // Cambia esto si tu servidor MySQL está en un host diferente
$username = "ddb222084"; // Nombre de usuario de MySQL
$password = "ptkcu]7cwrSps("; // Contraseña de MySQL
$database = "ddb222084"; // Nombre de la base de datos a la que te quieres conectar

// Obtener los datos enviados desde el formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $user = $_POST['username'];
    $pass = $_POST['password'];

    // Crear una conexión
    $conn = new mysqli($servername, $username, $password, $database);

    // Verificar la conexión
    if ($conn->connect_error) {
        die("Conexión fallida: " . $conn->connect_error);
    }

    // Consulta SQL para verificar si el usuario y la contraseña existen
    $sql = "SELECT * FROM PERSONA WHERE usu = '$user' AND pass = '$pass'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // Usuario y contraseña válidos
        // Redirigir al usuario a register.html
        header("Location: catalogo.html?username=" . urlencode($user));
        exit(); // Es importante terminar la ejecución del script después de la redirección
    } else {
        // Usuario y/o contraseña incorrectos
        header("Location: register.html?error=true");
    }

    // Cerrar la conexión
    $conn->close();
}
?>
