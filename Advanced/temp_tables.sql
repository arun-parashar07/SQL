-- Temporary tables 
-- temp tables and cte's used for same work temp tables are for somekind advance work
-- by declaring a temp table at once you can just recall it at anywhere in any other code too but it lasts only for the same session\


 create temporary table temp_table 
 (first_name varchar(50),
 last_name varchar(50),
 favourite_movie varchar(100)
 );
 
 select * 
 from temp_table;
 
 insert into temp_table
 values('Arun' , 'Parashar' , 'American Assessin')
 ;
 
 select * 
 from temp_table;
 
 
 create temporary table salary_over_50k
 select  * 
 from employee_salary
 where salary > 50000 
 ;
 
 select *
 from salary_over_50k;
 

 
 
 
 
 