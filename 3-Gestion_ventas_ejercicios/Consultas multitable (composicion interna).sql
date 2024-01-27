use ventas;
### 1.3.4 Consultas multitabla (Composición interna)
#### Resuelva todas las consultas utilizando la sintaxis de SQL1 y SQL2.

-- 1- Devuelve un listado con el identificador, nombre y los apellidos de todos los clientes que han realizado algún pedido. 
-- El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.

select c.id, c.nombre, c.apellido1,c.apellido2 from cliente c inner join pedido p on c.id = p.id_cliente group by c.id order by c.id;

-- 2- Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. 
-- El resultado debe mostrar todos los datos de los pedidos y del cliente. 
-- El listado debe mostrar los datos de los clientes ordenados alfabéticamente.

select * from cliente c inner join pedido p on c.id = p.id_cliente order by c.id asc;

-- 3- Devuelve un listado que muestre todos los pedidos en los que ha participado un comercial. 
-- El resultado debe mostrar todos los datos de los pedidos y de los comerciales. 
-- El listado debe mostrar los datos de los comerciales ordenados alfabéticamente.

select * from comercial c inner join pedido p on c.id = p.id_comercial order by c.id asc;

-- 4- Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado
--  y con los datos de los comerciales asociados a cada pedido.

select * from cliente cli inner join pedido pe on cli.id = pe.id_cliente inner join comercial com on pe.id_comercial = com.id;

-- 5- Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2017, cuya cantidad esté entre 300 € y 1000 €.

select * from cliente cli inner join pedido pe on cli.id = pe.id_cliente where pe.fecha like '2017-%' and total between 300 and 1000;

-- 6- Devuelve el nombre y los apellidos de todos los comerciales que ha participado en algún pedido realizado por María Santana Moreno.


select concat(com.nombre, ' ', com.apellido1, ' ', com.apellido2) as nombre_completo from comercial com inner join pedido pe on pe.id_comercial = com.id
inner join cliente cli on cli.id = pe.id_cliente where cli.nombre = 'María' and cli.apellido1 = 'Santana' and cli.apellido2 = 'Moreno';

-- 7- Devuelve el nombre de todos los clientes que han realizado algún pedido con el comercial Daniel Sáez Vega.

select distinct concat(cli.nombre, ' ', cli.apellido1, ' ', COALESCE(cli.apellido2, ' ')) as nombre_completo from cliente cli inner join pedido pe on cli.id = pe.id_cliente
inner join comercial com on com.id = pe.id_comercial where concat(com.nombre, ' ', com.apellido1, ' ', com.apellido2) = 'Daniel Sáez Vega';