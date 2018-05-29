create or replace package pk_mantenedor_employees as 

  procedure sp_aumenta_sueldo(id_employee in number);
  procedure sp_reduce_sueldo(id_employee in number, porcentaje in number);
  function fn_promedio_sueldos(id_menor number, id_mayor number) return number;

end pk_mantenedor_employees;
/

create or replace package body pk_mantenedor_employees as

  procedure sp_aumenta_sueldo(id_employee in number) as
  
  begin
  
    update employees
    set salary = salary * 1.1
    where employee_id = id_employee;
  
  end sp_aumenta_sueldo;

  procedure sp_reduce_sueldo(id_employee in number, porcentaje in number) as
  
  begin
  
    update employees
    set salary = salary * (1-(100-porcentaje))
    where employee_id = id_employee;
  
  end sp_reduce_sueldo;
  
  function fn_promedio_sueldos(id_menor number, id_mayor number) return number as
    resultado number;
  begin
  
    select avg(salary) into resultado
    from employees
    where employee_id between id_menor and id_mayor;
  
    return resultado;  
  end fn_promedio_sueldos;

end pk_mantenedor_employees;
/


**************************  se ejecuta *********************************

select pk_mantenedor_employees.fn_promedio_sueldos(1,100)     //donde (1,100) corresponde de al minimo y maximo)
from dual;

exec pk_mantenedor_employees.sp_reduce_sueldo(100,10);        //donde (100,10) corresponde al id del empleado y el 10% de sueldo

select * from employees;
