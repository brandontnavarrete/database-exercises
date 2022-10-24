
USE employees;

DESCRIBE employees;



/* 
3.) "USE employees:"

4.) "DESCRIBE  employees;"
departments,dept_emp,dept_mangager,employees,salaries,titles

5.) int,dates,varchar,enum

6.) Which table(s) do you think contain a numeric type column? (Write this question and your answer in a comment) most likely salaries, employees,departments

7.) Which table(s) do you think contain a string type column? (Write this question and your answer in a comment)

dept_emp and dept_managers due to names. departments maybe for naming conventions.

8.) Which table(s) do you think contain a date type column? (Write this question and your answer in a comment)

titles for date hired. employes for DOB, 

9.) What is the relationship between the employees and the departments tables? (Write this question and your answer in a comment)

I don't believe there is any relation between employees
and departments
 
10.) Show the SQL that created the dept_manager table. Write the SQL it takes to show this as your exercise solution.

"CREATE TABLE `dept_manager` (
  `emp_no` int NOT NULL,
  `dept_no` char(4) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`,`dept_no`),
  KEY `dept_no` (`dept_no`),
  CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1"
*/

SHOW CREATE TABLE dept_manager;
