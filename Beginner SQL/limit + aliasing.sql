#here in limit we are actually simply putting a limit for rows that we want 
select * from employee_demographics where age > 37 limit 2 ;
#aliasing is actually a way of changing a name for the coloumn
select gender , avg(Age) as age_avg
from employee_demographics
group by gender
having avg(age) < 41 ;
