-- stored procedure is a precompiled set of SQL statements which can be use further for work and can we  saved in the database
-- delimeter shows that sql waits for this "//"  to end the procedure not for this ';'
create procedure large_salaries()
	select *  
	from employee_salary
	where salary >= 50000;
call large_salaries();

delimiter //
create procedure large_salaries2()
begin
	select *
	from employee_salary
	where salary >= 50000;
	select * 
	from employee_salary
	where salary >= 10000;
end //
delimiter ;
call large_salaries2();


DROP PROCEDURE IF EXISTS large_salaries4;
delimiter // 
create procedure large_salaries4(param INT)
begin 
	select salary 
	from employee_salary
	where employee_id = param;
end //
delimiter ;
call large_salaries4(1)
;




