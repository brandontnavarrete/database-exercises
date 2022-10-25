use employees;

Select * from employees;

#2. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name.
#irena Rutenauer, in asc order with no limit
#vidya simmen
#709
Select first_name, last_name
	from employees 
		where first_name IN ('Irena','Vidya','Maya')
			order by first_name ;	
				
#3. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. 
#709
#Irena acton
#vidya Sweizig
Select first_name, last_name
	from employees 
		where first_name = 'Irena' 
			or first_name = 'Vidya' 
				or first_name = 'Maya' 
					order by first_name, last_name;
		
		
#4 Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name
#709
#Irena acton
#Zyda maya
Select  last_name,first_name
		from employees 
			where first_name IN ('Irena','Vidya','Maya')
				order by last_name, first_name;

#5 Write a query to to find all employees whose last name starts and ends with 'E'
#899 returned
#Ramzi	Erde	10021
#Tadahiro	Erde	499648
Select first_name,last_name,emp_no
		from employees 
			where last_name Like 'E%E'
				order by emp_no;
				
			
#6 Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their hire date, so that the newest employees are listed first
#899
#Teiji	Eldridge	1999-11-27
#Sergi	Erde	1985-02-02
Select first_name,last_name,hire_date
			from employees
				where last_name like 'E%E'
						order by hire_date desc;
						
						
		

#7 Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee who was hired last is the first result.
# 362
#Khun	Bernini	1952-12-25	1999-08-31
#Douadi	Pettis	1964-12-25	1990-05-04
Select first_name, last_name, birth_date, hire_date
		from employees
			where hire_date like '199%'
				and birth_date like '%12-25'
					order by birth_date asc,hire_date desc;
		
			

