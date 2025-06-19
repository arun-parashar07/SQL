 # at this time we learned about the group by and order by
 # whatever that we are using for group by here will also be declared with Select
 # GROUP BY USES
 SELECT * FROM employee_demographics ; 
 SELECT age FROM employee_demographics GROUP BY age ;
SELECT gender , age FROM employee_demographics GROUP BY gender , age; 
SELECT  gender , AVG(age),  max(age) , min(age) , count(age) FROM employee_demographics GROUP BY gender;

select* from employee_demographics;

select gender,  count(age)  from employee_demographics where age > 40 group by gender;
# Order By uses
select * from employee_demographics order by age ; # this will show the data of age in inc. order
select * from employee_demographics order by age desc; # showing the decre. order here
select * from employee_salary order by first_name desc ;