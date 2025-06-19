-- CTE's  stands for common table expression 
-- so , this thing is like methods in java 
-- with the help of a CTE's we can define a query at once then can define it in the main query 
-- for just once  
-- if this below is our subsquery to whch we can just give a name then can call it in the main query  
select gender , avg(salary) , max(salary) , min(salary) , count(salary)
from employee_demographics dem
join employee_salary sal
  on dem.employee_id = sal.employee_id
  group by gender ;
  
  with cte_example as (
  select gender , avg(salary) , max(salary) , min(salary) , count(salary)
from employee_demographics dem
join employee_salary sal
  on dem.employee_id = sal.employee_id
  group by gender 
  ) 
  -- we can use this subquery just after the immediate code that is initialised but not after just a line space
  
  
  select *
  from cte_example ;
  -- we can also perform alias in the brackets of main subquery which can be seen in the output

with cte_example as
(
select employee_id , gender , birth_date 
from employee_demographics 
where birth_date > '1970-01-01' 
  ) , 
cte_example2 as(
select employee_id , salary 
from employee_salary
where salary > 50000
)
select * 
from cte_example
join cte_example2 
    on cte_example.employee_id = cte_example2.employee_id
    ;




select *  
from employee_demographics;