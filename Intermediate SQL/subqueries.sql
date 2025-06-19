-- subqueries  , operand should contain only one coloumn
-- if we have one 1 output then we will use operators like "=" , "<" or any other then we have multiple outputs then we'll use brackets
 

select * 
from employee_demographics;
select * 
from employee_salary;

select * 
from employee_demographics
where employee_id in 
					(select employee_id
                    from employee_salary
                    where dept_id = 1
                    )
;
