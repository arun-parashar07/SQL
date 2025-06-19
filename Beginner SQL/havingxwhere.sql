# using the HAVING and WHERE  together!!!! we use 'having' after the use of 'group by' clause.
select occupation , avg(salary) 
from employee_salary
where occupation like '%manager%'
group by occupation
having avg(salary) > 75000
;
select * from employee_salary;