# INNER JOIN 
select * 
from employee_demographics;
 
select * 
from employee_salary;
# so here we are learning about the join for which we will use the 'inner join' clause and then we gonna use 'on' clause the join two tables with same coloumns
# below in the output we didnt get the data for the empl.id 2 cause it was only present in the second salary data!!
select * 
from employee_demographics
inner join employee_salary
   on employee_demographics.employee_id = employee_salary.employee_id
   ;


# so now to took only specific coloumns from both the tables we will use a diff. statement for the select clause
select sal.employee_id , age , occupation 
from employee_demographics as dem
inner join  employee_salary as sal
   on dem.employee_id = sal.employee_id
;


#OUTER JOIN
# In this outer join we will see two types of outer join that are left and right outer join
# in which if we use the left than the left table will compare other one with itself and simulataneously

select *
from employee_demographics as dem
right outer join employee_salary as sal
   on dem.employee_id = sal.employee_id 
   ;
select *
from employee_demographics as dem
left outer join employee_salary as sal
   on dem.employee_id = sal.employee_id 
   ;
# self join  
# as it shows from it's own name only that to join a table to itself

select emp1.employee_id , emp1.first_name , emp1.last_name,
emp2.employee_id , emp2.first_name , emp2.last_name 
from employee_salary as emp1
join employee_salary as emp2
  on emp1.employee_id + 1 = emp2.employee_id
;

#joining multiple tables 
# in multiple table joining we dont need same coloumns in all three tables we need any same in any two consecutives to accomplish it 

select *
from employee_demographics as dem 
join employee_salary as sal 
  on dem.employee_id = sal.employee_id
join parks_departments as pd
  on sal.dept_id = pd.department_id
;
select *
from parks_departments;