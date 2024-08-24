
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

CREATE TABLE orden-item(
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

CREATE table orden-mesero(

	id int PRIMARY key,
  	id_mesero int not null,
  	id_orden int not null

);

create TABLE mesero(
	id int PRIMARY key,
  	nombre varchar(250) not null,
  	apellido varchar(250) not null,
  	email varchar(250) not null,
  	PIN varchar(6) not null
    CONSTRAINT ck_email CHECK(email LIKE('__%@___%.___%'))
  	
); 

create table mesero-rol(
	id int PRIMARY KEY,
  	id_mesero int not null,
  	id_rol int not null
);

CREATE TABLE rol(
	id int PRIMARY KEY,
  	nombreRol varchar(250) not null

);


ALTER table orden
ADD CONSTRAINT FK_id_cliente
	FOREIGN key id_cliente refenreces cliente(id),
    CONSTRAINT fk_id_factura
  	FOREIGN key id_factura references factura(id)
    
 alter TABLE pago
 	ADD CONSTRAINT fk_orden
    	FOREIGN key id_orden references orden(id),
        CONSTRAINT fk_tipo
        FOREIGN KEY id_tipo references tipo(id)
  alter table telefono
  	add CONSTRAINT fk_cliente
    	FOREIGN KEY id_cliente references cliente(id),
        CONSTRAINT fk_company
        FOREIGN KEY id_company references company(id)

alter TABLE orden-mesero
	add CONSTRAINT fk_orden
    	FOREIGN KEY id_orden references orden(id),
        CONSTRAINT fk_mesero
        FOREIGN KEY id_mesero references mesero(id)
       
alter TABLE mesero-rol
	add CONSTRAINT fk_mesero
    	FOREIGN KEY id_mesero references mesero(id),
        CONSTRAINT fk_rol
        FOREIGN KEY id_rol references rol(id)
        
        
alter TABLE orden-item
	add CONSTRAINT fk_orden
  	FOREIGN KEY id_orden references orden(id),
    CONSTRAINT fk_item
    FOREIGN KEY id_item references item(id)
    
    
    
 alter table item
 	add CONSTRAINT fk_grupo
    	FOREIGN key id_grupo references grupo(id)    
 alter table grupo
 	add CONSTRAINT fk_menu
    	FOREIGN key id_menu references menu(id)