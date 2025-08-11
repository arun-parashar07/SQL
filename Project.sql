-- DATA CLEANING--

select * from layoffs;

-- 1.REMOVING DUPLICATES (BY ASSIGNING ROW NUMBERS TO TABLE)
-- 2.STANDARDIZE THE DATA 
-- 3.DEAL WITH NULL OR BLANK VALUES
-- 4.REMOVING COLUMNS

-- HERE WE ARE CREATING DUPLICATE OF ORIGINAL RAW DATASET(layoffs) TO NEW DATSET(layoffs_staging)-- 

-- creating duplicate table-- 
CREATE TABLE layoffs_staging
like layoffs;

insert into layoffs_staging
select * from layoffs;

select*from layoffs_staging;

-- 1-REMOVING DUPLICATES-- 
-- assigning row numbers to the dataset to check whether duplicates are present or not,if present it will be greater than 1-- 
-- we'll assign row number to every possible columns to check the duplicates-- 
-- we are doing this because we do not have any column having primary key-- 
select*,row_number() over(partition by company,location,industry,total_laid_off,percentage_laid_off,'date',stage,country,funds_raised_millions) as row_num from layoffs_staging; 
-- OR-- 
with duplicate_cte as(
select*,row_number() over(partition by company,location,industry,total_laid_off,percentage_laid_off,date,stage,country,funds_raised_millions) as row_num from layoffs_staging
)
select * from duplicate_cte
where row_num>1;



CREATE TABLE layoffs_staging2 (
  company text,
  location text,
  industry text,
  total_laid_off int DEFAULT NULL,
  percentage_laid_off text,
  date text,
  stage text,
  country text,
  funds_raised_millions int DEFAULT NULL,
  row_num INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- drop table layoffs_staging2;-- 

select*from layoffs_staging2;

insert into layoffs_staging2
select*,row_number() over(partition by company,location,industry,total_laid_off,percentage_laid_off,date,stage,country,funds_raised_millions) 
as row_num from layoffs_staging;

delete from layoffs_staging2
where row_num>1;

select*from layoffs_staging2;

-- 2-Data standardization 
-- is a fundamental step in data management to ensure data quality and consistency making it suitable for analysis, reporting, and decision-making.-- 
select distinct(company) from layoffs_staging2;
-- TRIMMING THE WHITESPACES IN COMPANY COLUMN-- 
update layoffs_staging2
set company=trim(company);

-- --updating the similar name in industry columns (Crypto,Crypto Currency,CryptoCurrency) to only Crypto-- 
update layoffs_staging2
set industry='Crypto'
where industry like 'Crypto%';

select distinct(industry) from layoffs_staging2 order by 1;
-- --updating the column country(United States. to United States)  -- 
-- select distinct(country) from layoffs_staging2
-- where country like 'United%' ;-- 

update layoffs_staging2
set country = trim(trailing '.' From country)
where country like 'United States%';


-- updating the format of date and changing its datatype from text to date.-- 
select date from layoffs_staging2;

update layoffs_staging2
set date=str_to_date(date,'%m/%d/%Y');

alter table layoffs_staging2
modify column date date;

-- 3.DEALING WITH NULL OR BLANK VALUES
select * from layoffs_staging2
where industry IS NULL;

select * from layoffs_staging2
where company='Airbnb';


update layoffs_staging2 
set industry=NULL
where industry='';

update layoffs_staging2 t1
join layoffs_staging2 t2 on 
t1.company=t2.company
set t1.industry=t2.industry
where t1.industry is null and t2.industry is not null;

update layoffs_staging2 t1
join layoffs_staging2 t2 on 
t1.company=t2.company
set t1.industry=t2.industry
where t1.industry is null and t2.industry is not null;


select t1.industry,t2.industry from layoffs_staging2 as t1
JOIN layoffs_staging2 as t2 ON
t1.company=t2.company
where t1.industry is null and t2.industry is not null;


-- 4.REMOVING COLUMNS


select * from layoffs_staging2
where total_laid_off is null and percentage_laid_off is null;

delete from layoffs_staging2
where total_laid_off is null and percentage_laid_off is null;

-- checking how many rows will be affected by performing above query by executing below query which shows 
-- how many rows have null values in column total_laid_off and percentage_laid_off

--                      QUERY                        -- 
select count(total_laid_off is null)as laid_off_count,count(percentage_laid_off is null)as percentage_count  from layoffs_staging2
where total_laid_off is null and percentage_laid_off is null
group by total_laid_off,percentage_laid_off
;


-- NOW ALTERING THE TABLE TO REMOVE THE row_num COLUMN AS NOW IT IS OF NO USE-- 

alter table layoffs_staging2 
drop column row_num;


select*from layoffs_staging2;