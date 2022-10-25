use employees;

select * From employees;


#2.Write a query to to find all employees whose last name starts and ends with 'E'. Use concat() to combine their first and last name together as a single column named full_name.
select concat(first_name,'_',last_name)AS full_name, last_name 
	from employees
		where last_name like 'E%E';
		
#3.Convert the names produced in your last query to all uppercase.
#899
select Upper(last_name)
	from employees
		where last_name like 'E%E';
		
#4.Find all employees hired in the 90s and born on Christmas. Use datediff() function to find how many days they have been working at the company (Hint: You will also need to use NOW() or CURDATE()),

#Select hire_date, datediff(now(),hire_date) AS refrence from employees;
#362 employees
Select first_name, birth_date , hire_date ,
	datediff(now(),hire_date) AS time_worked from employees 
		WHERE hire_date like '199%' 	
			AND birth_date LIKE '%12-25%';

#5. min = 38623
	#max = 158220
explain salaries;

select min(salary) from salaries;

select max(salary) from salaries;

select count(salary) from salaries;

#6.
select LOWER(CONCAT(SUBSTRING(first_name,1,1),SUBSTRING(last_name,1,4),'_',SUBSTRING(birth_date,6,2),SUBSTRING(birth_date,3,2)))AS 
username,
	first_name,
		last_name,
			birth_date
			FROM employees;


