use jardineria;

## 1.4.6 Consultas multitabla (Composición externa)
### Resuelva todas las consultas utilizando las cláusulas LEFT JOIN, RIGHT JOIN, NATURAL LEFT JOIN y NATURAL RIGHT JOIN.

-- 1- Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.

select * from cliente left join pago on cliente.codigo_cliente = pago.codigo_cliente where pago.codigo_cliente is null;

-- 2- Devuelve un listado que muestre solamente los clientes que no han realizado ningún pedido.

select * from cliente left join pedido on cliente.codigo_cliente = pedido.codigo_cliente where  pedido.codigo_cliente is null;

-- 3- Devuelve un listado que muestre los clientes que no han realizado ningún pago y los que no han realizado ningún pedido.
select * from cliente 
left join pedido on cliente.codigo_cliente = pedido.codigo_cliente  
left join pago on cliente.codigo_cliente = pago.codigo_cliente 
where pedido.codigo_cliente is null and pago.codigo_cliente is null;

-- 4- Devuelve un listado que muestre solamente los empleados que no tienen una oficina asociada.

# No se puede realizar porque todos los empleados tienen una oficina asociada


-- 5- Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado.

select * from empleado left join cliente on empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas where cliente.codigo_empleado_rep_ventas is null; 

-- 6- Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado junto con los datos de la oficina donde trabajan.

select *  from empleado left join cliente on cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado 
left join oficina on empleado.codigo_oficina = oficina.codigo_oficina where cliente.codigo_empleado_rep_ventas is null;

-- 7- Devuelve un listado que muestre los empleados que no tienen una oficina asociada y los que no tienen un cliente asociado.

# No se puede realizar porque todos los empleados tienen una oficina asociada

-- 8- Devuelve un listado de los productos que nunca han aparecido en un pedido.

select * from producto 
left join detalle_pedido on producto.codigo_producto = detalle_pedido.codigo_producto
left join pedido on pedido.codigo_pedido = detalle_pedido.codigo_pedido
where detalle_pedido.codigo_producto is null;

-- 9- Devuelve un listado de los productos que nunca han aparecido en un pedido. 
-- El resultado debe mostrar el nombre, la descripción y la imagen del producto.

select distinct producto.nombre, producto.descripcion from producto 
left join detalle_pedido on producto.codigo_producto = detalle_pedido.codigo_producto
left join pedido on pedido.codigo_pedido = detalle_pedido.codigo_pedido
where detalle_pedido.codigo_producto is null;

-- 10- Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan 
-- sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.

-- 11- Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.

select * from cliente 
left join pedido on cliente.codigo_cliente = pedido.codigo_cliente  
left join pago on cliente.codigo_cliente = pago.codigo_cliente where pedido.codigo_cliente is not null and pago.codigo_cliente is null;

-- 12- Devuelve un listado con los datos de los empleados que no tienen clientes asociados y el nombre de su jefe asociado.

select empleado.nombre as nombre_empleado, jefe.nombre as nombre_jefe from empleado
left join cliente on cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
left join empleado jefe on empleado.codigo_jefe = jefe.codigo_empleado 
where cliente.codigo_empleado_rep_ventas is null;
