use employees;

Select * from employees;

#2. 709
Select first_name 
	from employees 
		where first_name IN ('Irena','Vidya','Maya');
		
#3. 241
Select first_name 
	from employees 
		where first_name = 'Irena' or first_name = 'Vidya' or first_name = 'Maya';
		
#4 441
Select first_name, gender
		from employees 
			where first_name IN ('Irena','Vidya','Maya')
				AND gender LIKE 'm';

#5 7330
Select last_name, gender
		from employees 
			where last_name Like 'E%';
			
#6 # 30723
Select last_name
		from employees
			where last_name Like '%E' or last_name Like 'E%';
		
Select last_name
		from employees
			where last_name Like '%E'  and last_name not like 'E%';
#23393 end in the letter e but not start with 

#7 #899
Select last_name
		from employees
			where last_name LIKE '%E' and last_name Like 'E%';
			
Select last_name
		from employees
			where last_name LIKE '%E';
# 24292 end in the letter e

#8. 135214
select * from employees; 

Select hire_date
	from employees
		where hire_date Between '1990-01-01' and '1999-12-31';
		
#9. I think 842 people were born on christmas

select birth_date 
	from employees 
		where birth_date like '%12-25';
		
#10. 362 born on christmas and hired in 90s
select birth_date, hire_date 
	from employees 
		where birth_date like '%12-25'
				and	 hire_date 	 
					Between '1990-01-01' and '1999-12-31' ;

#11. # 1873
select last_name
		from employees
			where last_name like '%q%';
			
select last_name
		from employees
			where last_name like '%q%' and last_name not like '%qu%';
#547 names have a "q" and not "qu"

/*
*/