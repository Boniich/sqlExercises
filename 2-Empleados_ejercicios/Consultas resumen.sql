use empleados;
-- 1- Calcula la suma del presupuesto de todos los departamentos.

select SUM(presupuesto) from departamento;

-- 2- Calcula la media del presupuesto de todos los departamentos.

select AVG(presupuesto) from departamento;

-- 3- Calcula el valor mínimo del presupuesto de todos los departamentos.

select MIN(presupuesto) from departamento;

-- 4- Calcula el nombre del departamento y el presupuesto que tiene asignado, del departamento con menor presupuesto.

select nombre, presupuesto, presupuesto from departamento order by presupuesto limit 1;

-- 5- Calcula el valor máximo del presupuesto de todos los departamentos.

select MAX(presupuesto) from departamento;

-- 6- Calcula el nombre del departamento y el presupuesto que tiene asignado, del departamento con mayor presupuesto.

select nombre, presupuesto from departamento order by presupuesto desc limit 1;

-- 7- Calcula el número total de empleados que hay en la tabla empleado.

select COUNT(*) from empleado;

-- 8- Calcula el número de empleados que no tienen NULL en su segundo apellido.

select COUNT(apellido2) from empleado;

-- 9- Calcula el número de empleados que hay en cada departamento. 
-- Tienes que devolver dos columnas, una con el nombre del departamento y otra con el número de empleados que tiene asignados.

select depa.nombre, COUNT(e.id_departamento) from departamento depa inner join empleado e on depa.id = e.id_departamento group by depa.nombre; 

-- 10- Calcula el nombre de los departamentos que tienen más de 2 empleados. 
-- El resultado debe tener dos columnas, una con el nombre del departamento y otra con el número de empleados que tiene asignados.

select depa.nombre, COUNT(e.id_departamento) from departamento depa 
inner join empleado e on depa.id = e.id_departamento group by depa.nombre having COUNT(e.id_departamento) > 2;

-- 11- Calcula el número de empleados que trabajan en cada uno de los departamentos. 
-- El resultado de esta consulta también tiene que incluir aquellos departamentos que no tienen ningún empleado asociado.

select depa.nombre, COUNT(e.id_departamento) from empleado e right join departamento depa on depa.id = e.id_departamento group by depa.nombre;

-- 12- Calcula el número de empleados que trabajan en cada unos de los departamentos que tienen un presupuesto mayor a 200000 euros.

select depa.nombre, COUNT(e.id_departamento) from empleado e inner join departamento depa on e.id_departamento = depa.id where depa.presupuesto > 200000 group by depa.nombre;