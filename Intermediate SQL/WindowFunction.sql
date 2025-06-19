-- Window Functions
-- 1.  rownumber 2. rank 3. dense rank (for more classification over rank ) 4. partition by   
-- work of dense rank num -> gives out the output in row numerically not positionally 
-- we use sum , avg and count too but with the over()


select first_name , last_name , salary 
from employee_demographics dem 
join employee_salary sal 
   on dem.employee_id = sal.employee_id ; 
