INSERT INTO PERSONA (nombre, apellidos, correo, telf, usu, pass) VALUES
('Juan', 'Pérez González', 'juan@example.com', '123456789', 'juanito', 'password123'),
('María', 'López García', 'maria@example.com', '987654321', 'marialo', 'securepass'),
('Pedro', 'Martínez Rodríguez', 'pedro@example.com', '456123789', 'pedrito', 'p3dr0pass'),
('Ana', 'González Martínez', 'ana@example.com', '789456123', 'anita', 'anapass'),
('Carlos', 'Sánchez Pérez', 'carlos@example.com', '654987321', 'carlitos', 'carlpass'),
('Laura', 'Díaz López', 'laura@example.com', '321654987', 'laurita', 'laurapass');

INSERT INTO PRODUCTO (nombre, descripcion, coste, imagen) VALUES
('Rosa', 'La rosa es una flor ornamental conocida por su belleza y fragancia.', 10.99, 'https://i.imgur.com/T37aebE.jpeg'),
('Lirio', 'El lirio es una planta bulbosa conocida por sus flores grandes y vistosas.', 12.5, 'https://www.floristeriamorris.com/wp-content/uploads/el-significado-del-lirio-te-sorprendera-descubrelo.jpg'),
('Girasol', 'El girasol es una planta con flores grandes y brillantes que sigue la trayectoria del sol durante el día.', 8.75, 'https://eos.com/wp-content/uploads/2023/09/how-to-grow-sunflower.png.webp'),
('Tulipán', 'El tulipán es una planta bulbosa conocida por sus flores en forma de copa y una amplia variedad de colores.', 9.99, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmASu5MKtQU1RSCCLD4oRnJrJuGEcrsiS5ptN16A6V8w&s'),
('Orquídea', 'La orquídea es una planta conocida por sus flores exóticas y elegantes.', 15.25, 'https://la-botanika.com/cdn/shop/articles/PORTADA_-_ORQUIDEAS.jpg'),
('Cactus', 'El cactus es una planta suculenta adaptada a climas áridos y desérticos, conocida por su capacidad de almacenar agua.', 7.99, 'https://www.suculentopedia.com/wp-content/themes/yootheme/cache/71/Carnegiea-gigantea-Saguaro-Giant-Cactus-702x527-1-e1602371330861-71e20dc9.jpeg');

INSERT INTO PLANTA (nombre, descripcion) VALUES
('Rosa', 'Planta ornamental de jardín'),
('Lirio', 'Planta ornamental de jardín'),
('Girasol', 'Planta ornamental de jardín'),
('Tulipán', 'Planta ornamental de jardín'),
('Orquídea', 'Planta ornamental de interior'),
('Cactus', 'Planta suculenta adaptada a climas áridos');

INSERT INTO CARACTERISTICA (nombre, valor) VALUES
('Color', 'Rojo'),
('Color', 'Blanco'),
('Color', 'Amarillo'),
('Color', 'Varios colores: rojo, amarillo, rosa, blanco, etc.'),
('Color', 'Varía según la especie: blanco, rosa, morado, amarillo, etc.'),
('Color', 'Verde, con algunas especies que tienen flores de colores brillantes'),
('Altura', 'Varía entre 20 cm y 2 metros'),
('Altura', 'Varía entre 30 cm y 1 metro'),
('Altura', 'Varía entre 1 metro y 3 metros'),
('Altura', 'Varía entre 20 cm y 60 cm'),
('Altura', 'Varía entre 20 cm y 1 metro'),
('Altura', 'Varía ampliamente según la especie, desde unos pocos centímetros hasta varios metros'),
('Florecimiento', 'Primavera y verano'),
('Florecimiento', 'Primavera'),
('Florecimiento', 'Verano'),
('Florecimiento', 'Primavera'),
('Florecimiento', 'Depende de la especie'),
('Florecimiento', 'Depende de la especie, algunas florecen en primavera y verano, otras en invierno');

INSERT INTO TEMPORADA (nombre, fecha_inicio, fecha_fin) VALUES
('Verano', '2024-06-01', '2024-08-31'),
('Otoño', '2024-09-01', '2024-11-30'),
('Invierno', '2024-12-01', '2025-02-28');

INSERT INTO R_PLA_CAR (_id_planta, _id_caracteristica) VALUES
(2004, 204),
(2004, 210),
(2004, 215),
(2005, 210),
(2005, 213),
(2007, 214),
(2007, 210),
(2008, 216),
(2009, 219);

INSERT INTO R_PLA_TEM (_id_planta, nombre_temporada) VALUES
(2004, 'Verano'),
(2004, 'Otoño'),
(2004, 'Invierno'),
(2005, 'Verano'),
(2005, 'Invierno'),
(2007, 'Invierno'),
(2007, 'Otoño'),
(2008, 'Invierno'),
(2009, 'Verano');
