Select * from titles;

#2. 7 unique titles
select distinct title from titles;

#3.Write a query to to find a list of all unique last names of all employees that start and end with 'E' using GROUP BY.
# 5 people
/*(Erde
Eldridge
Etalle
Erie
Erbe*/
Select * from employees;
Select last_name from employees
WHERE last_name LIKE 'e%e'
GROUP BY last_name;
#4 Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'.

Select first_name,last_name from employees
				
					where last_name LIKE 'e%e'		
						GROUP BY first_name,last_name;
#5. Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code.
#3
/*Chleq
Lindqvist
Qiwen
*/
Select last_name from employees
	WHERE last_name LIKE '%q%'
		AND last_name NOT LIKE '%qu%'
			GROUP BY last_name;
			
#6. Add a COUNT() to your results (the query above) to find the number of employees with the same last name.
#
/*Chleq	189
Lindqvist	190
Qiwen	168
*/
Select last_name, count(*) AS shared_name from employees
	WHERE last_name LIKE '%q%'
		AND last_name NOT LIKE '%qu%'
			GROUP BY last_name;
#7.
/*
Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names.
Vidya	M	151
Vidya	F	81
Maya	M	146
Maya	F	90
Irena	M	144
Irena	F	97
*/

select first_name, gender,count(first_name) as shared_name from employees
	WHERE first_name LIKE '%Irena%' OR first_name LIKE '%Vidya%' 	or first_name LIKE '%Maya%'
		GROUP BY first_name , gender
			ORDER BY first_name desc;
			
#8. Using your query that generates a username for all of the employees, generate a count employees for each unique username. Are there any duplicate usernames? BONUS: How many duplicate usernames are there?
 
#no unique filter rows = 300024
#distinct rows = 300018
select LOWER(CONCAT(SUBSTRING(first_name,1,1),SUBSTRING(last_name,1,4),'_',SUBSTRING(birth_date,6,2),SUBSTRING(birth_date,3,2)))AS
username,
	first_name,
		last_name,
			birth_date,
				count(*)as share_acct
				FROM employees
						group by username,first_name,last_name,birth_date
							order by share_acct desc;
*/
select LOWER(CONCAT(SUBSTRING(first_name,1,1),SUBSTRING(last_name,1,4),'_',SUBSTRING(birth_date,6,2),SUBSTRING(birth_date,3,2)))AS
	username,
		count(*)as share_acct
			FROM employees
					group by username
							order by share_acct desc;
						
					

*/
					







