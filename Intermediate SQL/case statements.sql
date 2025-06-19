# case statement 
# these are actually some ideal conditions tht we apllies in our program like if and else
select first_name,last_name,
CASE
    when age <= 30 then 'young'
    when age between 30 and 50 then 'old'
    when age > 50 then 'too old'
end as timecomplexity
from employee_demographics ;
 
# to take out the peoples which are applicable for the bonus of the company conditions are 
-- peoples having salary < 30000 gets bonus 5 % 
-- peoples having salary < 50000 ,  >30000 gets bonus 7 % 
-- peoples in finance gets bonus 10 % 

select first_name , last_name , salary, 
case
    when salary < 30000 then ( salary * .05)
    when salary > 30000 then ( salary * .07)
end as bonus,
case 
    when dept_id = '6' then (salary * .10)
end as bonus
from employee_salary 
;
select * 
from parks_departments;