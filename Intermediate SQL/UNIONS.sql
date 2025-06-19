# UNIONS 
# by default it uses the 'UNION DISTINCT' which means it is gonna take all values atleast once from both table's coloumn
select first_name ,  last_name
from employee_demographics
union distinct
select  first_name ,  last_name
from employee_salary
;
# at here below we have used the 'union all' which is gonna take all the values from choosed coloumns
select first_name ,  last_name
from employee_demographics
union ALL
select  first_name ,  last_name
from employee_salary
;

#so now the work is to make a diff. table for the employees who are more than 40 as age and earns more than 70000 and categories with their gender too as they need to be fired for using companies more resources
select first_name , last_name , 'old man' as label
from employee_demographics
where age > 40 AND gender = 'male'
union
select first_name , last_name , 'old Women' as label 
from employee_demographics
where age > 40 AND gender = 'female'
union 
select first_name , last_name , 'Highly Paid' as label
from employee_salary
where salary > 70000 
order by first_name  
 

