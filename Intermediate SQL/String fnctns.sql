# String functions 
# these are in built funtions in mysql 
#in length we use it for counting the number of alphabets of ny word 
select length('Arun Parashar');

select first_name , length(first_name) len
from employee_demographics
order by len; 

select first_name ,upper(first_name),lower(first_name)
from employee_demographics;

select rtrim('           sky ');
# to check any position value in a word
select first_name , left(first_name , 3) first3letters
from employee_demographics;

select first_name , substring(first_name , 3,1)
from employee_demographics;

select birth_date 
from employee_demographics;
# to get any specific part of a string
select first_name ,substring(birth_date, 6,2 ) birth_month
from employee_demographics;
# simply replacing the values or alphabets
select first_name , replace (first_name , 'y' , 'd')
from employee_demographics;
#checking the position of a alphabet in a string
select locate('s' , 'arun parashar');
select first_name , locate( 'an' , first_name)
from employee_demographics;
# to add two values 
select first_name , last_name , concat(first_name , ' ' , last_name) NAME
from employee_demographics;
