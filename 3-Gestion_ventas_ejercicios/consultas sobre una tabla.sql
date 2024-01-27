use ventas;
### 1.3.3 Consultas sobre una tabla

-- 1- Devuelve un listado con todos los pedidos que se han realizado. Los pedidos deben estar ordenados por la fecha de realización,
-- mostrando en primer lugar los pedidos más recientes.

select * from pedido order by fecha desc;

-- 2- Devuelve todos los datos de los dos pedidos de mayor valor.

select * from pedido order by total desc limit 2;

-- 3- Devuelve un listado con los identificadores de los clientes que han realizado algún pedido. 
-- Tenga en cuenta que no debe mostrar identificadores que estén repetidos.

select id_cliente from pedido group by id_cliente;
select distinct id_cliente from pedido;

-- 4- Devuelve un listado de todos los pedidos que se realizaron durante el año 2017, cuya cantidad total sea superior a 500€.

select * from pedido where fecha like '2017-%' and total > 500;

-- 5- Devuelve un listado con el nombre y los apellidos de los comerciales que tienen una comisión entre 0.05 y 0.11.

select nombre, apellido1, apellido2 from comercial where comisión between 0.05 and 0.11;

-- 6- Devuelve el valor de la comisión de mayor valor que existe en la tabla comercial.

select comisión from comercial order by comisión desc limit 1;

-- 7- Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo segundo apellido no es NULL. 
-- El listado deberá estar ordenado alfabéticamente por apellidos y nombre.

select id, nombre, apellido1 from cliente where apellido2 is not null order by nombre asc, apellido1 asc,apellido2 asc;

-- 8- Devuelve un listado de los nombres de los clientes que empiezan por A y terminan por n y también los nombres que empiezan por P.
--  El listado deberá estar ordenado alfabéticamente.

select nombre from cliente where nombre like 'A%n' or nombre like 'P%' order by nombre asc;

-- 9- Devuelve un listado de los nombres de los clientes que no empiezan por A. El listado deberá estar ordenado alfabéticamente.

select nombre from cliente where nombre not like 'A%' order by nombre asc;

-- 10- Devuelve un listado con los nombres de los comerciales que terminan por "el" o "o". 
-- Tenga en cuenta que se deberán eliminar los nombres repetidos.

select nombre from comercial where nombre like '%el' or nombre like '%o' group by nombre;


