CREATE TABLE PERSONA (
    _id BIGINT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255),
    apellidos VARCHAR(255),
    correo VARCHAR(255),
    telf VARCHAR(20),
    usu VARCHAR(50) UNIQUE,
    pass VARCHAR(50)
);

CREATE TABLE INTERNO (
    _id BIGINT PRIMARY KEY,
    dni VARCHAR(20),
    FOREIGN KEY (_id) REFERENCES PERSONA(_id)
);

CREATE TABLE EXTERNO (
    _id BIGINT PRIMARY KEY,
    FOREIGN KEY (_id) REFERENCES PERSONA(_id)
);

CREATE TABLE CLIENTE (
    _id BIGINT PRIMARY KEY,
    FOREIGN KEY (_id) REFERENCES EXTERNO(_id)
);

CREATE TABLE CONTABLE (
    _id BIGINT PRIMARY KEY,
    FOREIGN KEY (_id) REFERENCES EXTERNO(_id)
);

CREATE TABLE JARDINERO (
    _id BIGINT PRIMARY KEY,
    FOREIGN KEY (_id) REFERENCES INTERNO(_id)
);

CREATE TABLE COORDINADOR (
    _id BIGINT PRIMARY KEY,
    FOREIGN KEY (_id) REFERENCES INTERNO(_id)
);

CREATE TABLE ALERGIA (
    nombre VARCHAR(50) PRIMARY KEY,
    descripcion TEXT
);

CREATE TABLE HIST_MOD (
    _id BIGINT PRIMARY KEY AUTO_INCREMENT,
    fecha DATETIME,
    original VARCHAR(255),
    modificado VARCHAR(255),
    motivo TEXT
);

CREATE TABLE RUTA (
    _id BIGINT PRIMARY KEY AUTO_INCREMENT,
    fecha DATETIME
);

CREATE TABLE ESTADO (estado VARCHAR(50) PRIMARY KEY);

CREATE TABLE MATERIAL (
    _id BIGINT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    cantidad INT
);

CREATE TABLE SERVICIO (
    _id BIGINT PRIMARY KEY AUTO_INCREMENT,
    coste DECIMAL(10, 2),
    descripcion TEXT
);

CREATE TABLE TIPO_CONTRATO (tipo VARCHAR(50) PRIMARY KEY);

CREATE TABLE PRODUCTO (
    _id BIGINT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    descripcion TEXT,
    coste DECIMAL(10, 2),
    imagen VARCHAR(255)
);

CREATE TABLE LOCALIZACION (
    _id BIGINT PRIMARY KEY AUTO_INCREMENT,
    direccion VARCHAR(255)
);

CREATE TABLE DOMICILIO (
    _id BIGINT PRIMARY KEY AUTO_INCREMENT,
    numero VARCHAR(20),
    FOREIGN KEY (_id) REFERENCES LOCALIZACION(_id)
);

CREATE TABLE JARDIN (
    _id BIGINT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    descripcion TEXT,
    valoracion DECIMAL(3, 2),
    imagen VARCHAR(255),
    FOREIGN KEY (_id) REFERENCES LOCALIZACION(_id)
);

CREATE TABLE PLANTA (
    _id BIGINT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    descripcion TEXT
);

CREATE TABLE CARACTERISTICA (
    _id BIGINT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    valor VARCHAR(255)
);

CREATE TABLE TEMPORADA (
    nombre VARCHAR(100),
    fecha_inicio DATE,
    fecha_fin DATE,
    PRIMARY KEY (nombre)
);

CREATE TABLE CONTRATO (
    _id BIGINT PRIMARY KEY AUTO_INCREMENT,
    fecha_inicio DATETIME,
    fecha_fin DATETIME,
    _id_persona BIGINT,
    _id_cliente BIGINT,
    _id_contable BIGINT,
    _id_localizacion BIGINT,
    _id_tipo_contrato VARCHAR(50),
    FOREIGN KEY (_id_persona) REFERENCES PERSONA(_id),
    FOREIGN KEY (_id_cliente) REFERENCES CLIENTE(_id),
    FOREIGN KEY (_id_contable) REFERENCES CONTABLE(_id),
    FOREIGN KEY (_id_localizacion) REFERENCES LOCALIZACION(_id),
    FOREIGN KEY (_id_tipo_contrato) REFERENCES TIPO_CONTRATO(tipo)
);

CREATE TABLE TIEMPO_DEDICADO (
    _id BIGINT PRIMARY KEY AUTO_INCREMENT,
    fecha DATETIME,
    tiempo BIGINT,
    _id_jardin BIGINT,
    _id_ruta BIGINT,
    FOREIGN KEY (_id_jardin) REFERENCES JARDIN(_id),
    FOREIGN KEY (_id_ruta) REFERENCES RUTA(_id)
);

CREATE TABLE COMENTARIO (
    _id BIGINT PRIMARY KEY AUTO_INCREMENT,
    descripcion TEXT,
    _id_tarea BIGINT,
    _id_interno BIGINT,
    FOREIGN KEY (_id_tarea) REFERENCES TAREA(_id),
    FOREIGN KEY (_id_interno) REFERENCES INTERNO(_id)
);

CREATE TABLE TAREA (
    _id BIGINT PRIMARY KEY AUTO_INCREMENT,
    fecha_creacion DATETIME,
    nombre VARCHAR(100),
    descripcion TEXT,
    _id_ruta BIGINT,
    _id_subtarea BIGINT,
    FOREIGN KEY (_id_ruta) REFERENCES RUTA(_id),
    FOREIGN KEY (_id_subtarea) REFERENCES TAREA(_id)
);

CREATE TABLE TIPO_JARDIN (tipo VARCHAR(100) PRIMARY KEY);

CREATE TABLE HIST_ESTADO (
    _id BIGINT PRIMARY KEY AUTO_INCREMENT,
    fecha_creacion DATETIME,
    original VARCHAR(255),
    modificado VARCHAR(255),
    motivo TEXT,
    _id_tarea BIGINT,
    _id_estado VARCHAR(50),
    FOREIGN KEY (_id_tarea) REFERENCES TAREA(_id),
    FOREIGN KEY (_id_estado) REFERENCES ESTADO(estado)
);

CREATE TABLE R_ALE_JAR (
    _id_jardin BIGINT,
    nombre_alergia VARCHAR(50),
    PRIMARY KEY (_id_jardin, nombre_alergia),
    FOREIGN KEY (_id_jardin) REFERENCES JARDIN(_id),
    FOREIGN KEY (nombre_alergia) REFERENCES ALERGIA(nombre)
);

CREATE TABLE R_JAR_RUT (
    _id_jardin BIGINT,
    _id_ruta BIGINT,
    PRIMARY KEY (_id_jardin, _id_ruta),
    FOREIGN KEY (_id_jardin) REFERENCES JARDIN(_id),
    FOREIGN KEY (_id_ruta) REFERENCES RUTA(_id)
);

CREATE TABLE R_RUT_TAR (
    _id_ruta BIGINT,
    _id_tarea BIGINT,
    PRIMARY KEY (_id_ruta, _id_tarea),
    FOREIGN KEY (_id_ruta) REFERENCES RUTA(_id),
    FOREIGN KEY (_id_tarea) REFERENCES TAREA(_id)
);

CREATE TABLE R_MAT_CON (
    _id_material BIGINT,
    _id_contrato BIGINT,
    PRIMARY KEY (_id_material, _id_contrato),
    FOREIGN KEY (_id_material) REFERENCES MATERIAL(_id),
    FOREIGN KEY (_id_contrato) REFERENCES CONTRATO(_id)
);

CREATE TABLE R_SER_CON (
    _id_servicio BIGINT,
    _id_contrato BIGINT,
    PRIMARY KEY (_id_servicio, _id_contrato),
    FOREIGN KEY (_id_servicio) REFERENCES SERVICIO(_id),
    FOREIGN KEY (_id_contrato) REFERENCES CONTRATO(_id)
);

CREATE TABLE R_PRO_CON (
    _id_producto BIGINT,
    _id_contrato BIGINT,
    PRIMARY KEY (_id_producto, _id_contrato),
    FOREIGN KEY (_id_producto) REFERENCES PRODUCTO(_id),
    FOREIGN KEY (_id_contrato) REFERENCES CONTRATO(_id)
);

CREATE TABLE R_PLA_CAR (
    _id_planta BIGINT,
    _id_caracteristica BIGINT,
    PRIMARY KEY (_id_planta, _id_caracteristica),
    FOREIGN KEY (_id_planta) REFERENCES PLANTA(_id),
    FOREIGN KEY (_id_caracteristica) REFERENCES CARACTERISTICA(_id)
);

CREATE TABLE R_PLA_TEM (
    _id_planta BIGINT,
    nombre_temporada VARCHAR(100),
    PRIMARY KEY (_id_planta, nombre_temporada),
    FOREIGN KEY (_id_planta) REFERENCES PLANTA(_id),
    FOREIGN KEY (nombre_temporada) REFERENCES TEMPORADA(nombre)
);

CREATE TABLE R_PLA_JAR (
    _id_planta BIGINT,
    _id_jardin BIGINT,
    PRIMARY KEY (_id_planta, _id_jardin),
    FOREIGN KEY (_id_planta) REFERENCES PLANTA(_id),
    FOREIGN KEY (_id_jardin) REFERENCES JARDIN(_id)
);