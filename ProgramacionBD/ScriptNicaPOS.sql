create table telefono_restaurante(
	id int PRIMARY key,
  	numero varchar (20) not null
);

create TABLE restaurante(
	id int PRIMARY KEY,
  	nombre varchar(100) not null,
  	RUC varchar(20) not null,
  	direccion varchar(500) not null,
  	id_telefono int not null
  
  	FOREIGN KEY (id_telefono) references telefono_restaurante(id)
);

create table cuenta(
	id int PRIMARY key,
  	impuesto decimal(8,2) not null,
    descuento decimal(8,2) not null default 0,
  	subtotal decimal(8,2) not null,
  	total decimal(8,2) not null,
    cancelaCon decimal(8,2) not null,
  	fecha DATETIME NOT null DEFAULT GETDATE()
);

CREATE table tipoPago(
	id int PRIMARY key,
  	Metodo varchar(100)
);

create TABLE empleado(
	id int PRIMARY key,
  	nombre varchar(250) not null,
  	apellido varchar(250) not null,
  	email varchar(250) not null ,
  	PIN varchar(6) not null,
    
  	CONSTRAINT ck_email_mesero CHECK(email LIKE('__%@___%.___%'))
); 


CREATE TABLE rol(
	id int PRIMARY KEY,
  	nombreRol varchar(250) not null

);

create table empleado_rol(
	id int PRIMARY KEY,
  	id_empleado int not null,
  	id_rol int not null
  
  	FOREIGN key (id_empleado) references empleado(id),  	
  FOREIGN key (id_rol) references rol(id)
);

create table estado (
  id int PRIMARY key,
  estado varchar(100)
);

create table orden(
	id int PRIMARY KEY,
  	numOrden int not null,
  	id_estado int not null,
  	id_empleado int not null,
  	id_pago int not null,
  	total decimal(8,2) not null,
  	fecha DATETIME NOT null DEFAULT GETDATE()
  	FOREIGN key (id_mesero) references empleado(id),  	
  	FOREIGN key (id_estado) references estado(id)

);
CREATE TABLE company(
	id int PRIMARY KEY,
  	nombre varchar(250) not null
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
  	FOREIGN KEY (id_cliente) REFERENCES cliente(id),
  	FOREIGN KEY (id_company) REFERENCES company(id);
);







