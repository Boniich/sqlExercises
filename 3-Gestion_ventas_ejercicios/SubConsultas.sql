use ventas;
## 1.3.7 Subconsultas
### 1.3.7.1 Con operadores básicos de comparación
-- 1- Devuelve un listado con todos los pedidos que ha realizado Adela Salas Díaz. (Sin utilizar INNER JOIN).

select * from pedido where id_cliente = (select id from cliente where nombre = "Adela" and apellido1 = "Salas" and apellido2 = "Díaz");

-- 2- Devuelve el número de pedidos en los que ha participado el comercial Daniel Sáez Vega. (Sin utilizar INNER JOIN)

select count(*) from pedido where id_comercial = (select id from comercial where CONCAT(nombre, " ", apellido1, " ", apellido2) = "Daniel Sáez Vega");

-- 3- Devuelve los datos del cliente que realizó el pedido más caro en el año 2019. (Sin utilizar INNER JOIN)

select * from cliente where id = (select id_cliente from pedido where year(fecha) = '2019' order by total desc limit 1);

-- 4- Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente Pepe Ruiz Santana.

select fecha, total from pedido where id_cliente = (select id from cliente where concat(nombre, " ", apellido1, " ", apellido2) = "Pepe Ruiz Santana")
 order by total asc limit 1;

-- 5- Devuelve un listado con los datos de los clientes y los pedidos, 
-- de todos los clientes que han realizado un pedido durante el año 2017 con un valor mayor o igual al valor medio 
-- de los pedidos realizados durante ese mismo año.

select * from cliente cli inner join pedido pe on pe.id_cliente = cli.id where fecha like '2017-%' 
and total >= (select avg(total) from pedido where fecha like '2017-%');

## 1.3.7.2 Subconsultas con ALL y ANY
-- 6- Devuelve el pedido más caro que existe en la tabla pedido si hacer uso de MAX, ORDER BY ni LIMIT.

## nota: si pones any o all es lo mismo, porque la subconsulta solo devuelve un registro
select * from pedido where total = any (select max(total) from pedido);

-- 7- Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando ANY o ALL).

## Nota: el ALL nos devuelve todos los registros de la tabla pedido, pero al ser negada la comparacion
## solo se muestran aquellos id que son diferentes de los que trae la subconsulta
select * from cliente where id <> all (select id_cliente from pedido);

-- 8- Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando ANY o ALL).

select * from comercial where id <> all (select id_comercial from pedido);

## 1.3.7.3 Subconsultas con IN y NOT IN
-- 9- Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT IN).

select * from cliente where id not in(select id_cliente from pedido);

-- 10- Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando IN o NOT IN).

select * from comercial where id not in (select id_comercial from pedido);

## 1.3.7.4 Subconsultas con EXISTS y NOT EXISTS
-- 11- Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).

select * from cliente where not exists (select id_cliente from pedido where cliente.id = pedido.id_cliente);

-- 12- Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).

select * from comercial where not exists (select id_comercial from pedido where comercial.id = pedido.id_comercial);