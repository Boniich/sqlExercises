use empleados;
### 1.2.7 Subconsultas
## 1.2.7.1 Con operadores básicos de comparación
-- 1- Devuelve un listado con todos los empleados que tiene el departamento de Sistemas. (Sin utilizar INNER JOIN).

select * from empleado where id_departamento = (select id from departamento where nombre = "Sistemas");

-- 2- Devuelve el nombre del departamento con mayor presupuesto y la cantidad que tiene asignada.
 
 select nombre, presupuesto from departamento where presupuesto = (select MAX(presupuesto) from departamento );

-- 3- Devuelve el nombre del departamento con menor presupuesto y la cantidad que tiene asignada.

select nombre, presupuesto from departamento where presupuesto = (select MIN(presupuesto) from departamento);

## 1.2.7.2 Subconsultas con ALL y ANY
-- 4- Devuelve el nombre del departamento con mayor presupuesto y la cantidad que tiene asignada. Sin hacer uso de MAX, ORDER BY ni LIMIT.

select nombre, presupuesto from departamento where presupuesto = ANY (select MAX(presupuesto) from departamento);

-- 5- Devuelve el nombre del departamento con menor presupuesto y la cantidad que tiene asignada. Sin hacer uso de MIN, ORDER BY ni LIMIT.

select nombre, presupuesto from departamento where presupuesto = ANY (select MIN(presupuesto) from departamento);

-- 6- Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando ALL o ANY).

select * from empleado where id_departamento = ANY (select id from departamento);

-- 7- Devuelve los nombres de los departamentos que no tienen empleados asociados. (Utilizando ALL o ANY).

### (No es asi) select nombre from departamento where id = ANY (select id_departamento from empleado where id_departamento is null);
### select id_departamento from empleado where id_departamento is null;//nos devuelve valores nulos


select nombre from departamento where id <> ALL(select distinct id_departamento from empleado where id_departamento is not null);

## 1.2.7.3 Subconsultas con IN y NOT IN
-- 8- Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando IN o NOT IN).

select nombre from departamento where id in(select id_departamento from empleado);

-- 9- Devuelve los nombres de los departamentos que no tienen empleados asociados. (Utilizando IN o NOT IN).

select nombre from departamento where id not in(select distinct id_departamento from empleado where id_departamento is not null);

## 1.2.7.4 Subconsultas con EXISTS y NOT EXISTS
-- 10- Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando EXISTS o NOT EXISTS).

select nombre from departamento where exists (select id_departamento from empleado where departamento.id = empleado.id_departamento);


-- 11- Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando EXISTS o NOT EXISTS).

select nombre from departamento where not exists (select id_departamento from empleado where departamento.id = empleado.id_departamento);