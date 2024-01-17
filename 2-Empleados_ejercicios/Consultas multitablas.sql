use empleados;

-- Resuelva todas las consultas utilizando la sintaxis de SQL1 y SQL2.

-- 1- Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno.

select * from empleado, departamento where empleado.id_departamento = departamento.id;

-- 2- Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno. 
-- Ordena el resultado, en primer lugar por el nombre del departamento (en orden alfabético) 
-- y en segundo lugar por los apellidos y el nombre de los empleados.

select * from empleado, departamento where empleado.id_departamento = departamento.id order by departamento.nombre asc, empleado.apellido1,empleado.apellido2, empleado.nombre;

-- 3- Devuelve un listado con el identificador y el nombre del departamento, solamente de aquellos departamentos que tienen empleados.

select*from empleado;
select departamento.id, departamento.nombre from departamento, empleado where empleado.id_departamento = departamento.id group by departamento.id;

-- 4- Devuelve un listado con el identificador, el nombre del departamento y el valor del presupuesto actual del que dispone,
--  solamente de aquellos departamentos que tienen empleados. 
-- El valor del presupuesto actual lo puede calcular restando al valor del presupuesto inicial (columna presupuesto) 
-- el valor de los gastos que ha generado (columna gastos).

select depa.id, depa.nombre, depa.presupuesto-depa.gastos as presupuesto_actual from departamento depa 
inner join empleado e on depa.id = e.id_departamento group by depa.id;

-- 5- Devuelve el nombre del departamento donde trabaja el empleado que tiene el nif 38382980M.

select departamento.nombre from departamento, empleado where empleado.id_departamento = departamento.id and empleado.nif = "38382980M";

-- 6- Devuelve el nombre del departamento donde trabaja el empleado Pepe Ruiz Santana.

select departamento.nombre from departamento, empleado where empleado.id_departamento = departamento.id and empleado.apellido2 = "Santana";

-- 7- Devuelve un listado con los datos de los empleados que trabajan en el departamento de I+D. Ordena el resultado alfabéticamente.

select empleado.id, empleado.nif, empleado.nombre, empleado.apellido1, empleado.apellido2 from empleado, departamento where departamento.id = empleado.id_departamento and departamento.nombre = "I+D";

-- 8- Devuelve un listado con los datos de los empleados que trabajan en el departamento de Sistemas, Contabilidad o I+D. Ordena el resultado alfabéticamente.

select empleado.id, empleado.nif, empleado.nombre, empleado.apellido1, empleado.apellido2, departamento.nombre 
from empleado, departamento where departamento.id = empleado.id_departamento and departamento.nombre in("Sistemas","Contabilidad","I+D") order by empleado.id asc;

-- 9- Devuelve una lista con el nombre de los empleados que tienen los departamentos que no tienen un presupuesto entre 100000 y 200000 euros.

select empleado.id, empleado.nif, empleado.nombre, empleado.apellido1, empleado.apellido2, departamento.nombre 
from empleado, departamento where empleado.id_departamento = departamento.id and departamento.presupuesto not between 100000 and 200000;

-- 10- Devuelve un listado con el nombre de los departamentos donde existe algún empleado cuyo segundo apellido sea NULL.
-- Tenga en cuenta que no debe mostrar nombres de departamentos que estén repetidos.

select departamento.nombre from empleado, departamento where empleado.id_departamento = departamento.id and empleado.apellido2 is null group by departamento.id;