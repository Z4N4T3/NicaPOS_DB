
create table orden(
	id int PRIMARY KEY,
  	numOrden int not null,
  	estado bit not null,
  	monto decimal(8,2),
  	total decimal(8,2),
  	fecha DATETIME NOT null DEFAULT GETDATE(),
  	id_cliente int not null,
  	id_factura int not null
  	
);

create TABLE cliente(
	id int PRIMARY KEY,
  	nombre varchar(250) not null,
  	email varchar(250) not null
  
    CONSTRAINT ck_email CHECK(email LIKE('__%@___%.___%'))

);

create TABLE telefono(
	id int PRIMARY KEY,
  	numero varchar(250),
  	id_cliente int not null, 
  	id_company int not null
);

CREATE TABLE company(
	id int PRIMARY KEY,
  	nombre varchar(250) not null
);


create TABLE tipo(
	id int PRIMARY key,
  	metodo varchar(50)

);

CREATE TABLE pago (
	id int PRIMARY key,
  	id_orden int not null,
  	id_tipo int not null
	
);


CREATE table factura(
	
  id int PRIMARY key,
  fecha datetime not null default getdate(),
  impuesto decimal(8,2) not null, 
  descuento decimal(8,2) not null,
  totalVenta decimal(8,2) not null, --calcular mediante procesos almacenados
  subTotal decimal(8,2) not null

);

CREATE TABLE orden_item(
	id int PRIMARY key,
  	id_orden int not null,
  	id_item int not null

);

create TABLE item(
	id int PRIMARY KEY,
  	nombre varchar(250) not null,
  	descripcion varchar(500),
  	estado bit not null, -- crear una tabla estado
  	cantidad int not null,
  	id_grupo int not null

);


CREATE table grupo(
	id int PRIMARY key,	
  	nombre varchar(250) not null,
  	descripcion varchar(500),
  	id_menu int not null

);
CREATE table menu(
	id int PRIMARY key,	
  	nombre varchar(250) not null,
  	descripcion varchar(500)
);

CREATE table orden_mesero(

	id int PRIMARY key,
  	id_mesero int not null,
  	id_orden int not null

);

create TABLE mesero(
	id int PRIMARY key,
  	nombre varchar(250) not null,
  	apellido varchar(250) not null,
  	email varchar(250) not null ,
  	PIN varchar(6) not null,
    
  	CONSTRAINT ck_email_mesero CHECK(email LIKE('__%@___%.___%'))
); 
create table mesero_rol(
	id int PRIMARY KEY,
  	id_mesero int not null,
  	id_rol int not null
);

CREATE TABLE rol(
	id int PRIMARY KEY,
  	nombreRol varchar(250) not null

);


ALTER TABLE orden
ADD CONSTRAINT FK_Orden_Cliente
    FOREIGN KEY (id_cliente) REFERENCES cliente(id),
ADD CONSTRAINT FK_Orden_Factura
    FOREIGN KEY (id_factura) REFERENCES factura(id);

ALTER TABLE pago
ADD CONSTRAINT FK_Pago_Orden
    FOREIGN KEY (id_orden) REFERENCES orden(id),
ADD CONSTRAINT FK_Pago_Tipo
    FOREIGN KEY (id_tipo) REFERENCES tipo(id);

ALTER TABLE telefono
ADD CONSTRAINT FK_Telefono_Cliente
    FOREIGN KEY (id_cliente) REFERENCES cliente(id),
ADD CONSTRAINT FK_Telefono_Company
    FOREIGN KEY (id_company) REFERENCES company(id);

ALTER TABLE orden_mesero
ADD CONSTRAINT FK_OrdenMesero_Orden
    FOREIGN KEY (id_orden) REFERENCES orden(id),
ADD CONSTRAINT FK_OrdenMesero_Mesero
    FOREIGN KEY (id_mesero) REFERENCES mesero(id);

ALTER TABLE mesero_rol
ADD CONSTRAINT FK_MeseroRol_Mesero
    FOREIGN KEY (id_mesero) REFERENCES mesero(id),
ADD CONSTRAINT FK_MeseroRol_Rol
    FOREIGN KEY (id_rol) REFERENCES rol(id);

ALTER TABLE orden_item
ADD CONSTRAINT FK_OrdenItem_Orden
    FOREIGN KEY (id_orden) REFERENCES orden(id),
ADD CONSTRAINT FK_OrdenItem_Item
    FOREIGN KEY (id_item) REFERENCES item(id);

ALTER TABLE item
ADD CONSTRAINT FK_Item_Grupo
    FOREIGN KEY (id_grupo) REFERENCES grupo(id);

ALTER TABLE grupo
ADD CONSTRAINT FK_Grupo_Menu
    FOREIGN KEY (id_menu) REFERENCES menu(id);