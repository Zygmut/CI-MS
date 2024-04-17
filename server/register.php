<?php
// Datos de conexión a la base de datos
$servername = "bbdd.musapientum.com"; // Cambia esto si tu servidor MySQL está en un host diferente
$username = "ddb222084"; // Nombre de usuario de MySQL
$password = "ptkcu]7cwrSps("; // Contraseña de MySQL
$database = "ddb222084"; // Nombre de la base de datos a la que te quieres conectar

// Inicializar la variable de mensaje
$message = "";

// Obtener los datos enviados desde el formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nombre = $_POST['nombre'];
    $apellidos = $_POST['apellidos'];
    $telefono = $_POST['telefono'];
    $email = $_POST['email'];
    $usu = $_POST['usu'];
    $pass = $_POST['pass'];

    // Crear una conexión
    $conn = new mysqli($servername, $username, $password, $database);

    // Verificar la conexión
    if ($conn->connect_error) {
        die("Conexión fallida: " . $conn->connect_error);
    }

    // Consulta SQL para insertar los datos en la tabla
    $sql = "INSERT INTO PERSONA (nombre, apellidos, correo, telf, usu, pass) VALUES ('$nombre', '$apellidos', '$email', '$telefono', '$usu', '$pass')";
    if ($conn->query($sql) === TRUE) {
        // Redireccionar a login.html
        header("Location: login.html");
        exit();
    } else {
        $message = "Error al realizar la operación: " . $conn->error;
    }

    // Cerrar la conexión
    $conn->close();
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Usuario</title>
</head>
<body>
    <?php if (!empty($message)): ?>
        <p><?php echo $message; ?></p>
    <?php endif; ?>
</body>
</html>
