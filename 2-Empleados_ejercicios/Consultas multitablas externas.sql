use empleados;
-- Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.

-- 1- Devuelve un listado con todos los empleados junto con los datos de los departamentos donde trabajan.
--  Este listado también debe incluir los empleados que no tienen ningún departamento asociado.

select * from empleado e left join departamento depa on e.id_departamento = depa.id; 

-- 2- Devuelve un listado donde sólo aparezcan aquellos empleados que no tienen ningún departamento asociado.

select * from empleado e left join departamento depa on e.id_departamento = depa.id where e.id_departamento is null;

-- 3- Devuelve un listado donde sólo aparezcan aquellos departamentos que no tienen ningún empleado asociado.

select depa.id, depa.nombre, depa.presupuesto, depa.gastos from empleado e right join departamento depa on depa.id = e.id_departamento where e.id_departamento is null;

-- 4- Devuelve un listado con todos los empleados junto con los datos de los departamentos donde trabajan. 
-- El listado debe incluir los empleados que no tienen ningún departamento asociado y los departamentos que no tienen ningún empleado asociado. 
-- Ordene el listado alfabéticamente por el nombre del departamento.

select * from empleado e left join departamento depa on e.id_departamento = depa.id order by depa.nombre asc;

-- 5- Devuelve un listado con los empleados que no tienen ningún departamento asociado 
-- y los departamentos que no tienen ningún empleado asociado. Ordene el listado alfabéticamente por el nombre del departamento.

select e.id as id_empleado, e.nombre as nombre_empleado, e.apellido1, e.apellido2, depa.id as id_departamento, depa.nombre as nombre_departamento from empleado e 
left join departamento depa on e.id_departamento = depa.id
 where e.id_departamento is null 
 union 
 select e.id as id_empleado, e.nombre as nombre_empleado, e.apellido1, e.apellido2, depa.id as id_departamento, depa.nombre as nombre_departamento from empleado e 
 right join departamento depa on e.id_departamento = depa.id 
 where e.id_departamento is null order by nombre_departamento asc;

