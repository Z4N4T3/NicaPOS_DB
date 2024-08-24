create database Tienda;
use Tienda;

CREATE table fabricante (
	id INT PRIMARY KEY,
  	nombre varchar(100) NOT NULL

);

CREATE TABLE producto (
	
  id INT PRIMARY KEY,
  nombre varchar (100) not null,
  precio decimal(8,2) check	(precio >0),
  id_fabricante int NOT null,
  FOREIGN KEy (id_fabricante) references fabricante(id)
	
);

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');
INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180,3);

/*
	Lista el nombre de los productos, el precio en Cordobas y el precio en dólares
estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre
de producto, Cordobas, dólares. Puede cambiar donde dice Cordoba y
poner Córdoba, para luego poder realizar el resto de ejercicios. 
*/


select nombre, precio as USD, precio as Cordoba = (producto.precio / 36.5)
    from producto

/*
    Lista los nombres y los precios de todos los productos de la tabla producto,
convirtiendo los nombres a mayúscula
*/

select upper(nombre) as Nombre, precio
    from producto

-- Lista los nombres y los precios de todos los productos de la tabla producto,
-- convirtiendo los nombres a minúscula

select lower(nombre) as Nombre, precio
    from producto

/*
Lista el nombre de todos los fabricantes en una columna, y en otra columna
obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
*/

select upper(left(nombre,2))+ substring(nombre, 3, LEN(nombre) - 2)
    from fabricante

/*
    Lista los nombres y los precios de todos los productos de la tabla producto,
redondeando el valor del precio.
*/

select nombre, round(precio,-0.5) as Precio_Redondeado, precio as precio_original
    from producto

/*
    Lista los nombres y los precios de todos los productos de la tabla producto,
truncando el valor del precio para mostrarlo sin ninguna cifra decimal
*/

select nombre, cast(precio as int) as precio_truncado
    from producto

/*
    Lista el nombre y el precio del producto más barato. (Utilice solamente las
cláusulas ORDER BY y LIMIT)


*/

select nombre, precio
    from producto
    order by precio asc

/*
    Lista el nombre y el precio del producto más caro. (Utilice solamente las
cláusulas ORDER BY y LIMIT)

*/

select nombre, precio
    from producto
    order by precio desc

/*
    Lista el nombre de todos los productos del fabricante cuyo identificador de
fabricante es igual a 2.

*/

select * from fabricante
    where id = 2

/*
    Lista el nombre de los productos que 
    tienen un precio menor o igual a C$120
*/

select * from producto
    where precio between 0 and 120

/*
Lista el nombre de los productos que tienen un precio mayor o igual a C$400.

*/

select * from producto
    where price >= 400

/*
12. Lista el nombre de los productos que no tienen un precio mayor o igual C$400.

*/
select * from producto
    where not price < 400

/*
Lista todos los productos que tengan un precio entre C$80 y C$300. Sin utilizar
el operador BETWEEN.
14. Lista todos los productos que tengan un precio entre C$60 y C$200. Utilizando
el operador BETWEEN.
15. Lista todos los productos que tengan un precio mayor que C$200 y que el
identificador de fabricante sea igual a 6.
16. Lista los nombres de los fabricantes cuyo nombre termine por la vocal e
*/

select * from producto
    where precio >=80 and precio <=300

select * from producto
where precio between 60 and 200

select * from producto
    where precio >200 and id_fabricante =6

select nombre from fabricante
    where nombre like '%e'


/*
17. Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
18. Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
19. Devuelve una lista con el nombre de todos los productos que contienen la
cadena Portátil en el nombre.
*/

select nombre from fabricante
    where nombre like '%w%'

select nombre from fabricante
    where len(nombre)=4

select nombre from producto
    where nombre like '%Portátil%'


