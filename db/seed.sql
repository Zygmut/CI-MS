INSERT INTO PERSONA (nombre, apellidos, correo, telf, usu, pass) VALUES
('Juan', 'Pérez González', 'juan@example.com', '123456789', 'juanito', 'password123'),
('María', 'López García', 'maria@example.com', '987654321', 'marialo', 'securepass'),
('Pedro', 'Martínez Rodríguez', 'pedro@example.com', '456123789', 'pedrito', 'p3dr0pass'),
('Ana', 'González Martínez', 'ana@example.com', '789456123', 'anita', 'anapass'),
('Carlos', 'Sánchez Pérez', 'carlos@example.com', '654987321', 'carlitos', 'carlpass'),
('Laura', 'Díaz López', 'laura@example.com', '321654987', 'laurita', 'laurapass');

INSERT INTO PRODUCTO (nombre, descripcion, coste, imagen) VALUES
('Camisa', 'Camisa de algodón de manga larga', 29.99, 'camisa.jpg'),
('Pantalón', 'Pantalón vaquero de corte recto', 39.99, 'pantalon.jpg'),
('Zapatos', 'Zapatos de cuero negro', 59.99, 'zapatos.jpg');

INSERT INTO PLANTA (nombre, descripcion) VALUES
('Orquídea', 'Planta ornamental de interior'),
('Rosa', 'Planta ornamental de jardín'),
('Cactus', 'Planta suculenta adaptada a climas áridos');

INSERT INTO CARACTERISTICA (nombre, valor) VALUES
('Color', 'Azul'),
('Talla', 'M'),
('Material', 'Algodón');

INSERT INTO TEMPORADA (nombre, fecha_inicio, fecha_fin) VALUES
('Verano', '2024-06-01', '2024-08-31'),
('Otoño', '2024-09-01', '2024-11-30'),
('Invierno', '2024-12-01', '2025-02-28');
