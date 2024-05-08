<?php
use PHPUnit\Framework\TestCase;

class LoginTest extends TestCase {
    public function testLoginSuccess() {
        // Mock para la clase mysqli
        $conn = $this->getMockBuilder(mysqli::class)
                     ->disableOriginalConstructor()
                     ->getMock();

        // Stub para el método connect_error
        $conn->expects($this->any())
             ->method('connect_error')
             ->willReturn(false);

        // Stub para el método query
        $conn->expects($this->any())
             ->method('query')
             ->willReturn($this->returnValue(true));

        // Mock para la función header
        $this->expects($this->once())
             ->method('header')
             ->with($this->equalTo("Location: /catalogo.html?username=user"));

        // Definir los datos de entrada para el POST
        $_SERVER["REQUEST_METHOD"] = "POST";
        $_POST['username'] = "user";
        $_POST['password'] = "pass";

        // Crear instancia del objeto a testear
        $login = new Login();

        // Ejecutar el método a testear
        $login->login();

        // Verificar la salida esperada
        $this->expectOutputString("");
    }

    public function testLoginFailure() {
        // Mock para la clase mysqli
        $conn = $this->getMockBuilder(mysqli::class)
                     ->disableOriginalConstructor()
                     ->getMock();

        // Stub para el método connect_error
        $conn->expects($this->any())
             ->method('connect_error')
             ->willReturn(false);

        // Stub para el método query
        $conn->expects($this->any())
             ->method('query')
             ->willReturn($this->returnValue(false));

        // Mock para la función header
        $this->expects($this->once())
             ->method('header')
             ->with($this->equalTo("Location: /register.html?error=true"));

        // Definir los datos de entrada para el POST
        $_SERVER["REQUEST_METHOD"] = "POST";
        $_POST['username'] = "user";
        $_POST['password'] = "wrongpass";

        // Crear instancia del objeto a testear
        $login = new Login();

        // Ejecutar el método a testear
        $login->login();

        // Verificar la salida esperada
        $this->expectOutputString("");
    }
}
?>
