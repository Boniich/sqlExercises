use jardineria;
## 1.4.5 Consultas multitabla (Composición interna)
## Resuelva todas las consultas utilizando la sintaxis de SQL1 y SQL2. Las consultas con sintaxis de SQL2 se deben resolver con INNER JOIN y NATURAL JOIN.

-- 1- Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.

select cli.nombre_cliente, emple.nombre, emple.apellido1 from cliente cli 
inner join empleado emple on emple.codigo_empleado = cli.codigo_empleado_rep_ventas;

-- 2- Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.

select cli.codigo_cliente, cli.nombre_cliente, emple.nombre from cliente cli inner join empleado emple on emple.codigo_empleado = cli.codigo_empleado_rep_ventas
inner join pago p on p.codigo_cliente = cli.codigo_cliente;

-- 3- Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de sus representantes de ventas.

-- select cli.codigo_cliente, cli.nombre_cliente, emple.nombre from cliente cli 
-- inner join empleado emple on emple.codigo_empleado = cli.codigo_empleado_rep_ventas
-- inner join pago p on p.codigo_cliente = cli.codigo_cliente where p.codigo_cliente <> cli.codigo_cliente;

-- 4- Devuelve el nombre de los clientes que han hecho pagos
--  y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

select cli.nombre_cliente, empl.nombre as nombre_empleado, ofi.ciudad from cliente cli inner join empleado empl
on cli.codigo_empleado_rep_ventas = empl.codigo_empleado inner join oficina ofi on ofi.codigo_oficina = empl.codigo_oficina;

-- 5- Devuelve el nombre de los clientes que no hayan hecho pagos 
-- y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.



-- 6- Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.

select ofi.codigo_postal from oficina ofi inner join empleado emple on ofi.codigo_oficina = emple.codigo_oficina
inner join cliente cli on cli.codigo_empleado_rep_ventas = emple.codigo_empleado where cli.ciudad = "Fuenlabrada"; 


-- 7- Devuelve el nombre de los clientes y el nombre de sus representantes 
-- junto con la ciudad de la oficina a la que pertenece el representante.

select cli.nombre_cliente, empl.nombre, ofi.ciudad 
from cliente cli 
inner join empleado empl on cli.codigo_empleado_rep_ventas = empl.codigo_empleado 
inner join oficina ofi on empl.codigo_oficina = ofi.codigo_oficina;

-- 8- Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.

select empl.nombre as nombre_empleado, jefe.nombre as nombre_jefe 
from empleado empl inner join empleado jefe where jefe.codigo_empleado = empl.codigo_jefe;

-- 9- Devuelve un listado que muestre el nombre de cada empleados, el nombre de su jefe y el nombre del jefe de sus jefe.

select empl.nombre as nombre_empleado, jefe.nombre as nombre_jefe, superjefe.nombre as super_jefe 
from empleado empl 
inner join empleado jefe on jefe.codigo_empleado = empl.codigo_jefe 
inner join empleado superjefe where superjefe.codigo_empleado = jefe.codigo_jefe;


-- 10- Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.
select * from pedido where codigo_cliente = 1;

select cli.nombre_cliente, pe.fecha_esperada, pe.fecha_entrega from cliente cli inner join pedido pe on cli.codigo_cliente = pe.codigo_cliente where
date(pe.fecha_entrega) > date(pe.fecha_esperada);

-- 11- Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.

select * from gama_producto;

-- Con inner join 
select pe.codigo_pedido, g.gama, cli.codigo_cliente, cli.nombre_cliente from cliente cli 
inner join pedido pe on cli.codigo_cliente = pe.codigo_cliente
inner join detalle_pedido detalle on detalle.codigo_pedido = pe.codigo_pedido
inner join producto pro on pro.codigo_producto = detalle.codigo_producto
inner join gama_producto g on pro.gama = g.gama 
where pe.estado = 'Entregado';

-- Con natural join
select pe.codigo_pedido, g.gama, cli.codigo_cliente, cli.nombre_cliente 
from cliente cli
natural join pedido pe
natural join detalle_pedido detalle
natural join producto pro
natural join gama_producto g 
where pe.estado = 'Entregado';