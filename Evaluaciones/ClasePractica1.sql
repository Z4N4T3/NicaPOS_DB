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


/*
    CONSULTA MUTITABLAS. COMPOSICION INTERNA
*/

/*
    20. Devuelve una lista con el nombre del producto, precio y nombre de fabricante
    de todos los productos de la base de datos. Ordene el resultado por el nombre
    del fabricante, por orden alfabético.
    21. Devuelve una lista con el identificador del producto, nombre del producto,
    identificador del fabricante y nombre del fabricante, de todos los productos de
    la base de datos.
    22. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del
    producto más barato.
    23. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del
    producto más caro.
    24. Devuelve una lista de todos los productos del fabricante Lenovo.
    25. Devuelve una lista de todos los productos del fabricante Crucial que tengan un
    precio mayor que C$200.
*/


 select producto.nombre, producto.precio, fabricante.nombre from producto
 inner join fabricante on fabricante.id=producto.id
 order by fabricante.nombre asc


SELECT producto.id, producto.nombre, fabricante.id, fabricante.nombre 
from producto
inner join fabricante on fabricante.id=producto.id


select producto.nombre, producto.precio, fabricante.nombre from producto
 inner join fabricante on fabricante.id=producto.id
 ORDER by producto.precio ASC

 
 select producto.nombre, producto.precio, fabricante.nombre from producto
 inner join fabricante on fabricante.id=producto.id
 ORDER by producto.precio desc

SELECT producto.nombre, fabricante.nombre from producto
inner join fabricante on fabricante.id=producto.id
where fabricante.nombre like '%Lenovo%'

SELECT producto.nombre as producto, fabricante.nombre as fabricante, producto.precio from producto
inner join fabricante on fabricante.id=producto.id
where fabricante.nombre like '%Crucial%' and producto.precio >=200

/*
    26. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Sin utilizar el operador IN.

    27. Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
    28. Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a C$180. Ordene el
    resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)
    29. Devuelve un listado con el identificador y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.
*/

SELECT producto.nombre as PRODUCTO, fabricante.nombre as fabricante
from producto
inner join fabricante on fabricante.id = producto.id
where fabricante.nombre LIKE '%Asus%'or fabricante.nombre like '%Hewlett-Packard%'or fabricante.nombre like '%Seagate%'


SELECT producto.nombre as producto, producto.precio as precio, fabricante.nombre as fabricante FROM producto
inner JOIN fabricante on fabricante.id=producto.id
WHERE fabricante.nombre like '%w%'

SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto
inner JOIN fabricante on fabricante.id = producto.id
order by producto.precio DESC ,fabricante.nombre ASC


SELECT fabricante.id, fabricante.nombre from fabricante
inner join producto on producto.id = fabricante.id

-- consulta multitabla COMPOSICION EXTERNA

/*
    30. Devuelve un listado de todos los fabricantes que existen en la base de datos,
    junto con los productos que tiene cada uno de ellos. El listado deberá mostrar
    también aquellos fabricantes que no tienen productos asociados.
    31. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen
    ningún producto asociado.
    32. ¿Pueden existir productos que no estén relacionados con un fabricante?
    Justifique su respuesta.

    dado a este diseño, presentado en esta base de datos, no pueden existir productos sin un fabricante asosciado, dado que el campo
    id_fabricante dentro de la tabla producto, existe una restriccion NOT NULL, el cual obliga a relacionar dicho producto con un fabricante
*/


select fabricante.nombre as fabricante, producto.nombre as producto from fabricante
left join producto on fabricante.id = producto.id
ORDER by fabricante.nombre, producto.nombre

select fabricante.nombre as fabricante from fabricante
left join producto on fabricante.id=producto.id
where producto.id is null


-- ACTIVIDAD III

create table departamento(
    id int PRIMARY KEY identity (1,1),
    nombre varchar(100) not null,
    presupuesto decimal(8,2) not null,
    gastos decimal(8,2) not null
);

create table empleados(
    id int PRIMARY KEY identity (1,1),
    nif varchar(9) not null,
    nombre varchar(100) not null,
    apellido1 varchar(100) not null,
    apellido2 varchar(100) not null,

    id_departamento int not null

    FOREIGN KEY (id_departamento) references departamento(id)

);



create table departamento(
    id int PRIMARY KEY identity (1,1),
    nombre varchar(100) not null,
    presupuesto decimal(8,2) not null,
    gastos decimal(8,2) not null
);

create table empleado(
    id int PRIMARY KEY identity (1,1),
    nif varchar(9) not null,
    nombre varchar(100) not null,
    apellido1 varchar(100) not null,
    apellido2 varchar(100) not null,

    id_departamento int not null

    FOREIGN KEY (id_departamento) references departamento(id)

);


INSERT INTO departamento VALUES('Desarrollo', 120000, 6000);
INSERT INTO departamento VALUES('Sistemas', 150000, 21000);
INSERT INTO departamento VALUES('Recursos Humanos', 280000,
25000);
INSERT INTO departamento VALUES('Contabilidad', 110000, 3000);
INSERT INTO departamento VALUES('I+D', 375000, 380000);
INSERT INTO departamento VALUES('Proyectos', 0, 0);
INSERT INTO departamento VALUES('Publicidad', 0, 1000);

INSERT INTO empleado VALUES('32481596F', 'Aarón', 'Rivero', 'Gómez',
1);
INSERT INTO empleado VALUES('Y5575632D', 'Adela', 'Salas', 'Díaz', 2);

INSERT INTO empleado VALUES('R6970642B', 'Adolfo', 'Rubio', 'Flores',
3);
INSERT INTO empleado VALUES('77705545E', 'Adrián', 'Suárez', NULL,
4);
INSERT INTO empleado VALUES('17087203C', 'Marcos', 'Loyola',
'Méndez', 5);
INSERT INTO empleado VALUES('38382980M', 'María', 'Santana',
'Moreno', 1);
INSERT INTO empleado VALUES('80576669X', 'Pilar', 'Ruiz', NULL, 2);
INSERT INTO empleado VALUES('71651431Z', 'Pepe', 'Ruiz', 'Santana',
3);
INSERT INTO empleado VALUES('56399183D', 'Juan', 'Gómez', 'López',
2);
INSERT INTO empleado VALUES('46384486H', 'Diego','Flores', 'Salas',
5);
INSERT INTO empleado VALUES('67389283A', 'Marta','Herrera', 'Gil', 1);
INSERT INTO empleado VALUES('41234836R', 'Irene','Salas', 'Flores',
NULL);
INSERT INTO empleado VALUES('82635162B', 'Juan Antonio','Sáez',
'Guerrero', NULL);

/*
    1. Devuelve una lista con el nombre y el presupuesto, de los 3
departamentos que tienen mayor presupuesto.
2. Devuelve una lista con el nombre y el presupuesto, de los 3
departamentos que tienen menor presupuesto.
3. Devuelve una lista con el nombre y el gasto, de los 2 departamentos que
tienen mayor gasto.
4. Devuelve una lista con el nombre y el gasto, de los 2 departamentos que
tienen menor gasto.
5. Devuelve una lista con 5 filas a partir de la tercera fila de la
tabla empleado. La tercera fila se debe incluir en la respuesta. La
respuesta debe incluir todas las columnas de la tabla empleado. 
6. Devuelve una lista con el nombre de los departamentos y el presupuesto,
de aquellos que tienen un presupuesto mayor o igual a 150000 cordobas.

7. Devuelve una lista con el nombre de los departamentos y el presupuesto, de
aquellos que tienen un presupuesto entre 100000 y 200000 Córdobas. Sin
utilizar el operador BETWEEN.
8. Devuelve una lista con el nombre de los departamentos que no tienen un
presupuesto entre 100000 y 200000 Córdobas. Sin utilizar el operador BETWEEN.
9. Devuelve una lista con el nombre de los departamentos que tienen un
presupuesto entre 100000 y 200000 Córdobas. Utilizando el operador BETWEEN.
10. Devuelve una lista con el nombre de los departamentos que no tienen un
presupuesto entre 100000 y 200000 Córdobas. Utilizando el operador BETWEEN.

*/

select DISTINCT top(3) nombre, presupuesto from departamento
ORDER by presupuesto DESC

select DISTINCT top(3) nombre, presupuesto from departamento
ORDER by presupuesto asc

select DISTINCT top(2) nombre, gasto from departamento
ORDER by gasto desc

select DISTINCT top(2) nombre, gasto from departamento
ORDER by gasto asc

/*
    5. Devuelve una lista con 5 filas a partir de la tercera fila de la
    tabla empleado. La tercera fila se debe incluir en la respuesta. La
    respuesta debe incluir todas las columnas de la tabla empleado. 
    R=/ Que?!?!?!
*/
select nombre, presupuesto from departamento
WHERE presupuesto >=150000

select nombre, presupuesto from departamento
WHERE presupuesto >=100000 and presupuesto<=200000

select nombre, presupuesto from departamento
WHERE  presupuesto <100000 and presupuesto>200000

select nombre, presupuesto from departamento
WHERE presupuesto BETWEEN 100000 and 200000

select nombre, presupuesto from departamento
WHERE presupuesto NOT BETWEEN 100000 and 200000

/*
        11. Devuelve una lista con el nombre de los departamentos, gastos y presupuesto,
        de aquellos departamentos donde los gastos sean mayores que el presupuesto
        del que disponen.
        12. Devuelve una lista con el nombre de los departamentos, gastos y presupuesto,
        de aquellos departamentos donde los gastos sean menores que el presupuesto
        del que disponen.
        13. Devuelve una lista con el nombre de los departamentos, gastos y presupuesto,
        de aquellos departamentos donde los gastos sean iguales al presupuesto del
        que disponen.
        14. Lista todos los datos de los empleados cuyo segundo apellido sea NULL.
        15. Lista todos los datos de los empleados cuyo segundo apellido no sea NULL.
        16. Lista todos los datos de los empleados cuyo segundo apellido sea López.

*/

select nombre, gastos, presupuesto from departamento
where gastos>presupuesto

select nombre, gastos, presupuesto from departamento
where gastos<presupuesto

select gastos, presupuesto from departamento
where gastos=presupuesto

-- no va a devolver ningun valor dado a que todos tienen el constraint not null 

select nombre from empleado
where apellido1 is null

select nombre from empleado
where apellido1 is not null

select nombre from empleado
where apellido1 like '%López%'


/*Consultas multitabla (Composición interna)
    1. Devuelve un listado con los empleados y los datos de los departamentos
    donde trabaja cada uno.
    2. Devuelve un listado con los empleados y los datos de los departamentos
    donde trabaja cada uno. Ordena el resultado, en primer lugar por el
    nombre del departamento (en orden alfabético) y en segundo lugar por
    los apellidos y el nombre de los empleados.
    3. Devuelve un listado con el identificador y el nombre del departamento,
    solamente de aquellos departamentos que tienen empleados.
    
    4. Devuelve un listado con el identificador, el nombre del departamento y el
    valor del presupuesto actual del que dispone, solamente de aquellos
    departamentos que tienen empleados. El valor del presupuesto actual lo
    puede calcular restando al valor del presupuesto inicial

    (columna presupuesto) el valor de los gastos que ha generado
    (columna gastos).
    5. Devuelve el nombre del departamento donde trabaja el empleado que
    tiene el nif 38382980M.
*/
 
 select empleado.nombre, departamento.nombre as departamento from empleado
 inner join departamento on departamento.id= empleado.id

 select empleado.apellido1 as APELLIDO, empleado.nombre, departamento.nombre as departamento from empleado
 inner join departamento on departamento.id= empleado.id
order by departamento.nombre asc, empleado.apellido1

 select departamento.id as ID, departamento.nombre as departamento from empleado
 inner join departamento on departamento.id= empleado.id

select departamento.id as ID, 
    departamento.nombre as departamento, 
    departamento.presupuesto as presupuesto,
    departamento.gasto as Gasto
    add presupuesto_actual as (dep)   
from empleado
inner join departamento on departamento.id= empleado.id


select departamento.nombre as departamento, empleado.nombre as Empleado from departamento
inner join empleado on empleado.id=departamento.id
where empleado.nif like '38382980M'


