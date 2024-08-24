create database pesto;

use pesto;
-- Crear tabla restaurante
CREATE TABLE restaurante (
    id INT PRIMARY KEY,
    nombre VARCHAR(250) NOT NULL,
    descripcion VARCHAR(500)
);

-- Crear tabla direcciones
CREATE TABLE direcciones (
    id INT PRIMARY KEY
    -- Agregar más columnas si es necesario
);

-- Crear tabla mesero
CREATE TABLE mesero (
    id INT PRIMARY KEY,
    nombre1 VARCHAR(250) NOT NULL,
    nombre2 VARCHAR(250),
    apellido1 VARCHAR(250) NOT NULL,
    apellido2 VARCHAR(250),
    telefono VARCHAR(250),
    email VARCHAR(250),
    id_restaurante INT NOT NULL,
    FOREIGN KEY (id_restaurante) REFERENCES restaurante(id)
);

-- Crear tabla orden
CREATE TABLE orden (
    id INT PRIMARY KEY,
    fecha_orden DATETIME NOT NULL DEFAULT GETDATE(),
    total DECIMAL(8,2),
    id_mesero INT NOT NULL,
    FOREIGN KEY (id_mesero) REFERENCES mesero(id) -- Corregido para referirse a la tabla mesero
);

-- Crear tabla menu
CREATE TABLE menu (
    id INT PRIMARY KEY,
    nombre VARCHAR(250) NOT NULL,
    descripcion VARCHAR(500) NOT NULL
);

-- Crear tabla grupo
CREATE TABLE grupo (
    id INT PRIMARY KEY,
    nombre VARCHAR(250) NOT NULL,
    id_menu INT NOT NULL,
    FOREIGN KEY (id_menu) REFERENCES menu(id)
);

-- Crear tabla items
CREATE TABLE items (
    id INT PRIMARY KEY,
    nombre VARCHAR(250) NOT NULL,
    descripcion VARCHAR(500) NOT NULL,
    precio DECIMAL(8,2) NOT NULL,
    cantidad INT NOT NULL,
    id_grupo INT NOT NULL,
    FOREIGN KEY (id_grupo) REFERENCES grupo(id)
);


create table orden_item(
	id_orden INT NOT NULL,
    id_item INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(8,2) NOT NULL,
    PRIMARY KEY (id_orden, id_item),
    FOREIGN KEY (id_orden) REFERENCES orden(id),
    FOREIGN KEY (id_item) REFERENCES items(id)
  

)

-- Crear tabla cliente
CREATE TABLE cliente (
    id INT PRIMARY KEY,
    nombre_cliente VARCHAR(250) NOT NULL,
    tel VARCHAR(250),
    email VARCHAR(250)
    -- Agregar constraint si es necesario, como UNIQUE para el email
);

-- Crear tabla factura
CREATE TABLE factura (
    id INT PRIMARY KEY,
    id_orden INT NOT NULL,
    fecha_orden DATETIME NOT NULL DEFAULT GETDATE(),
    FOREIGN KEY (id_orden) REFERENCES orden(id)
);
