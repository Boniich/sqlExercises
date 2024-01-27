use ventas;
### 1.3.6 Consultas resumen
####Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.

-- 1- Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.

select avg(total) as media_total from pedido;

-- 2- Calcula el número total de comerciales distintos que aparecen en la tabla pedido.

select count(distinct id_comercial) from pedido; 

-- 3- Calcula el número total de clientes que aparecen en la tabla cliente.

select count(*) from cliente;

-- 4- Calcula cuál es la mayor cantidad que aparece en la tabla pedido.

select max(total) as total_mayor from pedido;

-- 5- Calcula cuál es la menor cantidad que aparece en la tabla pedido.

select min(total) as total_minimo from pedido;

-- 6- Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla cliente.

select ciudad, max(categoría) as max_por_ciudad from cliente group by ciudad;

-- 7- Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes. 
-- Es decir, el mismo cliente puede haber realizado varios pedidos de diferentes cantidades el mismo día.
--  Se pide que se calcule cuál es el pedido de máximo valor para cada uno de los 
-- días en los que un cliente ha realizado un pedido. 
-- Muestra el identificador del cliente, nombre, apellidos, la fecha y el valor de la cantidad.

-- esta consulta da un error 1055 porque mysql no sabe que filas devolver usando el id y group by
-- select cli.id as id_cliente, cli.nombre, cli.apellido1, cli.apellido2, pe.fecha, pe.total
-- from cliente cli inner join pedido pe on pe.id_cliente = cli.id group by id_cliente;

select cli.id, cli.nombre, cli.apellido1, cli.apellido2, date(pe.fecha), max(pe.total) 
from cliente cli inner join pedido pe on cli.id = pe.id_cliente group by pe.id_cliente, date(pe.fecha);



-- 8- Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes, 
-- teniendo en cuenta que sólo queremos mostrar aquellos pedidos que superen la cantidad de 2000 €.

select id_cliente, max(total), date(fecha) as fecha_pedido from pedido where total > 2000 group by id_cliente, date(fecha);

-- 9- Calcula el máximo valor de los pedidos realizados para cada uno de los comerciales durante la fecha 2016-08-17. 
-- Muestra el identificador del comercial, nombre, apellidos y total.

select com.id, concat(com.nombre, ' ' , com.apellido1, ' ', COALESCE(com.apellido2, '')) as nombre_completo_comercial, pe.fecha,max(pe.total) 
from comercial com inner join pedido pe on pe.id_comercial = com.id
where pe.fecha = '2016-08-17' group by com.id;

-- 10- Devuelve un listado con el identificador de cliente, nombre y apellidos 
-- y el número total de pedidos que ha realizado cada uno de clientes.
--  Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido. 
-- Estos clientes también deben aparecer en el listado indicando que el número de pedidos realizados es 0.

select cli.id, cli.nombre, 
CONCAT(cli.nombre, ' ', cli.apellido1, ' ' ,COALESCE(cli.apellido2, ' ')) as 'nombre completo cliente', 
COUNT(pe.id_cliente) as 'cantidad pedido realizados'
from cliente cli left join pedido pe on pe.id_cliente = cli.id group by cli.id;



-- 11- Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos 
-- que ha realizado cada uno de clientes durante el año 2017.

select cli.id, CONCAT(cli.nombre, ' ', cli.apellido1, ' ', COALESCE(cli.apellido2, ' ')), COUNT(pe.id_cliente)
from cliente cli inner join pedido pe on pe.id_cliente = cli.id where YEAR(pe.fecha) = '2017' group by cli.id;


-- 12- Devuelve un listado que muestre el identificador de cliente, nombre, primer apellido 
-- y el valor de la máxima cantidad del pedido realizado por cada uno de los clientes. 
-- El resultado debe mostrar aquellos clientes que no han realizado ningún pedido indicando que la máxima cantidad de sus pedidos 
-- realizados es 0. Puede hacer uso de la función IFNULL.

select cli.id, cli.nombre, cli.apellido1, IFNULL(MAX(pe.total),0) from cliente cli
left join pedido pe on pe.id_cliente = cli.id group by cli.id;

-- 13- Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.

select YEAR(pe.fecha) as año, max(pe.total) as 'total por año' from pedido pe group by año;

-- 14- Devuelve el número total de pedidos que se han realizado cada año.

select YEAR(fecha) as año, COUNT(*) as 'pedidos por año' from pedido group by año;