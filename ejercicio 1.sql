-- 16
select nombre, comision_emp, sal_emp from personal.empleados where comision_emp > sal_emp;
-- 17
select nombre, sal_emp, comision_emp, sal_emp*0.3 as salario_30 from personal.empleados where comision_emp <= sal_emp*0.3;
-- 18
select nombre from personal.empleados where nombre not like '%ma%';
-- 19
select id_depto, nombre_depto from personal.departamentos where nombre_depto in ('ventas', 'investigacion', 'mantenimiento');
-- 21
select nombre, sal_emp
from personal.empleados
where sal_emp = (SELECT MAX(sal_emp) FROM personal.empleados);
-- 22 
select nombre from personal.empleados order by nombre desc limit 1;
-- 23 
select max(sal_emp), min(sal_emp), (max(sal_emp) - min(sal_emp)) as Diferencia  from personal.empleados;
-- 24
select personal.departamentos.nombre_depto, avg(sal_emp) from personal.empleados , personal.departamentos  
	where personal.empleados.id_depto = personal.departamentos.id_depto group by nombre_depto;
-- 24 2   
-- Consulta Multitabla (Uso de la sentencia JOIN/LEFT JOIN/RIGHT JOIN)
-- 27. Mostrar la lista de empleados, con su respectivo departamento y el jefe de cada
-- departamento. 
SELECT d.nombre_jefe_depto, d.nombre_depto, e.nombre
FROM empleados e
INNER JOIN departamentos d 
ON d.id_depto = e.id_depto
order by d.nombre_jefe_depto;

select d.nombre_depto, avg(sal_emp) from empleados e, departamentos d where e.id_depto = d.id_depto group by d.nombre_depto;
-- 28
SELECT e.sal_emp, d.nombre_depto
FROM empleados e
inner join departamentos d ON e.departamento_id = d.departamento_id
WHERE e.sal_emp >= (
    SELECT AVG(sal_emp)
    FROM empleados
)
ORDER BY d.nombre_depto;

