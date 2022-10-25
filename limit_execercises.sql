USE employees;

Select * from employees;	

#2.List the first 10 distinct last name sorted in descending order.
/*
Zykh
Zyda
Zwicker
Zweizig
Zumaque
Zultner
Zucker
Zuberek
Zschoche
Zongker
*/
Select distinct last_name from employees
	order by last_name desc limit 10;
	
#3.Find all previous or current employees hired in the 90s and born on Christmas. Find the first 5 employees hired in the 90's by sorting by hire date and limiting your results to the first 5 records. Write a comment in your code that lists the five names of the employees returned.
/*
Alselm	 Cappello	1962-12-25	1990-01-01
Utz	     Mandell	1960-12-25	1990-01-03
Bouchung Schreiter	1963-12-25	1990-01-04
Baocai	 Kushner	1959-12-25	1990-01-05
Petter	 Stroustrup	1959-12-25	1990-01-10
*/

SELECT first_name,last_name,birth_date,hire_date
	FROM employees
		WHERE hire_date LIKE '199%'
			and birth_date LIKE '%12-25'
				ORDER BY hire_date asc limit 5;


#4Try to think of your results as batches, sets, or pages. The first five results are your first page. The five after that would be your second page, etc. Update the query to find the tenth page of results.
#LIMIT and OFFSET can be used to create multiple pages of data. What is the relationship between OFFSET (number of results to skip), LIMIT (number of results per page), and the page number?
#LIMIT AND OFFSET ARE A COMPLEMENTARY SET OF TOOLS TO HELP WITH PRECISION AND RESOURCE MANAGMENT!
