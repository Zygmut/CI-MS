<?php
use PHPUnit\Framework\TestCase;

class RegistroTest extends TestCase {
    public function testRegistroExitoso() {
        // Datos de prueba válidos
        $_SERVER["REQUEST_METHOD"] = "POST";
        $_POST['nombre'] = "Juan";
        $_POST['apellidos'] = "Pérez";
        $_POST['telefono'] = "123456789";
        $_POST['email'] = "juan@example.com";
        $_POST['usu'] = "juanito";
        $_POST['pass'] = "123456";

        // Esperamos que se redirija a login.html
        $this->expectOutputString("");
        $this->expectOutputRegex('/Location: \/login\.html/');

        // Incluir el código del registro
        require 'registro.php';
    }

    public function testRegistroFallido() {
        // Datos de prueba con un usuario existente
        $_SERVER["REQUEST_METHOD"] = "POST";
        $_POST['nombre'] = "Juan";
        $_POST['apellidos'] = "Pérez";
        $_POST['telefono'] = "123456789";
        $_POST['email'] = "juan@example.com";
        $_POST['usu'] = "usuario_existente"; // Usuario que ya existe en la base de datos
        $_POST['pass'] = "123456";

        // Esperamos un mensaje de error
        $this->expectOutputRegex('/Error al realizar la operación/');

        // Incluir el código del registro
        require 'registro.php';
    }
}
?>
