use jardineria;

### 1.4.7 Consultas resumen
-- 1- ¿Cuántos empleados hay en la compañía?

select count(*) from empleado;

-- 2- ¿Cuántos clientes tiene cada país?

select pais, count(*) as cantidad_x_pais from cliente group by pais;

-- 3- ¿Cuál fue el pago medio en 2009?

select avg(total) from pago where year(fecha_pago) = '2009' group by year(fecha_pago);

-- 4- ¿Cuántos pedidos hay en cada estado? 
-- Ordena el resultado de forma descendente por el número de pedidos.

select  estado, count(*) as cantidad from pedido group by estado order by cantidad;

-- 5- Calcula el precio de venta del producto más caro y más barato en una misma consulta.
select * from producto;
select max(precio_venta) as precio from producto
union
select min(precio_venta) as precio from producto;

-- 6- Calcula el número de clientes que tiene la empresa.

select count(*) from cliente;


-- 7- ¿Cuántos clientes existen con domicilio en la ciudad de Madrid?

select count(*) from cliente where ciudad = 'Madrid';

-- 8- ¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan por M?

select count(*) from cliente where ciudad like 'M%';

-- 9- Devuelve el nombre de los representantes de ventas y el número de clientes al que atiende cada uno.

select empl.codigo_empleado,empl.nombre, count(*) from empleado empl 
inner join cliente cli on empl.codigo_empleado = cli.codigo_empleado_rep_ventas
group by cli.codigo_empleado_rep_ventas;

-- 10- Calcula el número de clientes que no tiene asignado representante de ventas.

## no se puede realizar porque no hay ningun cliente que no tenga un representante asignado

-- 11- Calcula la fecha del primer y último pago realizado por cada uno de los clientes.
--  El listado deberá mostrar el nombre y los apellidos de cada cliente.


-- 12- Calcula el número de productos diferentes que hay en cada uno de los pedidos.

select * from producto;
select * from pedido;
select * from detalle_pedido;
select * from pago;

select detal.codigo_pedido, count(*) from producto p 
inner join detalle_pedido detal 
on detal.codigo_producto = p.codigo_producto
inner join pedido
on detal.codigo_pedido = pedido.codigo_pedido
group by detal.codigo_pedido;

-- 13- Calcula la suma de la cantidad total de todos los productos que aparecen en cada uno de los pedidos.

select detalle.codigo_pedido, sum(detalle.cantidad * detalle.precio_unidad) from detalle_pedido detalle group by detalle.codigo_pedido 
order by detalle.codigo_pedido;


-- 14- Devuelve un listado de los 20 productos más vendidos y el número total de unidades que se han vendido de cada uno. 
-- El listado deberá estar ordenado por el número total de unidades vendidas.

## Consulta auxiliar
-- select * from detalle_pedido inner join pedido on 
-- pedido.codigo_pedido = detalle_pedido.codigo_pedido where codigo_producto = "OR-243" and estado = "Entregado";

## consulta auxiliar select * from pedido where estado = "Rechazado";


select detalle_pedido.codigo_producto, sum(cantidad) 
from detalle_pedido 
inner join pedido on detalle_pedido.codigo_pedido = pedido.codigo_pedido
where pedido.estado = "Entregado"
group by codigo_producto 
order by codigo_producto desc;

-- 15- La facturación que ha tenido la empresa en toda la historia, indicando la base imponible, el IVA y el total facturado. 
-- La base imponible se calcula sumando el coste del producto por el número de unidades vendidas de la tabla detalle_pedido.
--  El IVA es el 21 % de la base imponible, y el total la suma de los dos campos anteriores.
 
select codigo_producto, sum(precio_unidad * cantidad) as base_imponible, sum(precio_unidad*cantidad)/100 as iva,
sum((precio_unidad * cantidad)+((precio_unidad*cantidad)/100)) as total
from detalle_pedido group by codigo_producto;



-- 16- La misma información que en la pregunta anterior, pero agrupada por código de producto.

-- 17- La misma información que en la pregunta anterior, pero agrupada por código de producto filtrada por los códigos que empiecen por OR.

-- 18- Lista las ventas totales de los productos que hayan facturado más de 3000 euros. 
-- Se mostrará el nombre, unidades vendidas, total facturado y total facturado con impuestos (21% IVA).

-- 19- Muestre la suma total de todos los pagos que se realizaron para cada uno de los años que aparecen en la tabla pagos.