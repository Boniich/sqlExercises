use ventas;
### 1.3.5 Consultas multitabla (Composición externa)
#### Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.

-- 1- Devuelve un listado con todos los clientes junto con los datos de los pedidos que han realizado. 
-- Este listado también debe incluir los clientes que no han realizado ningún pedido.
 -- El listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido y nombre de los clientes.
 
 select * from cliente cli left join pedido pe on cli.id = pe.id_cliente order by cli.apellido1, cli.apellido2, cli.nombre;

-- 2- Devuelve un listado con todos los comerciales junto con los datos de los pedidos que han realizado. 
-- Este listado también debe incluir los comerciales que no han realizado ningún pedido. 
-- El listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido y nombre de los comerciales.

select * from comercial com left join pedido pe on com.id = pe.id_comercial order by com.apellido1, com.apellido2, com.nombre;

-- 3- Devuelve un listado que solamente muestre los clientes que no han realizado ningún pedido.

select * from cliente cli left join pedido pe on cli.id = pe.id_cliente where pe.id_cliente is null;

-- 4- Devuelve un listado que solamente muestre los comerciales que no han realizado ningún pedido.

select * from comercial com left join pedido pe on com.id = pe.id_comercial where pe.id_comercial is null;

-- 5- Devuelve un listado con los clientes que no han realizado ningún pedido 
-- y de los comerciales que no han participado en ningún pedido. 
-- Ordene el listado alfabéticamente por los apellidos y el nombre. 
-- En en listado deberá diferenciar de algún modo los clientes y los comerciales.

SELECT 
    'Cliente' AS tipo,
    c.nombre AS nombre_cliente,
    c.apellido1 AS apellidos_cliente
FROM 
    cliente c
LEFT JOIN 
    pedido p ON c.id = p.id_cliente
WHERE 
    p.id_cliente IS NULL

UNION

SELECT 
    'Comercial' AS tipo,
    co.nombre AS nombre_comercial,
    co.apellido1 AS apellidos_comercial
FROM 
    comercial co
left JOIN 
    pedido p ON co.id = p.id_comercial
WHERE 
    p.id_comercial IS NULL;
    
    

-- 6- ¿Se podrían realizar las consultas anteriores con NATURAL LEFT JOIN o NATURAL RIGHT JOIN? Justifique su respuesta.