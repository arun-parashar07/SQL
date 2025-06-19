-- TRIGGERS
-- trigger is a SQL code that automatically runs when any specific operation runs on a table
-- like ('updation' , 'insertion' , 'deletion')
 
select * 
from employee_demographics;

select * 
from employee_salary;

delimiter //
create trigger insert_mem
	after insert on employee_salary
    for each row 
begin
	insert into employee_demographics(employee_id,first_name,last_name)
    values (new.employee_id, new.first_name,new.last_name);
end //
delimiter ;

insert into employee_salary (employee_id,first_name,last_name,occupation,salary,dept_id)
values(13,'Arun','Parashar','Student',41000,2);

-- EVENTS
-- events happens when it is scheduled , it is super helpfull for automatition in general

delimiter //
create event example_retirees
on schedule every 1 minute
do
begin 
	delete 
    from employee_demographics
    where age > 60; 
end //
delimiter ;

-- In the above code we have seen that the row of age > 60  has been deleted nd which wilol be deleted at every 1 minute  

show variables like 'event%' ;



