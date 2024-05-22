/* Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, and DEPARTMENT from the employee record table,
 and make a list of employees and details of their department.
*/
select emp_id, first_name, last_name, Gender, Dept from emp_record;

-- Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPARTMENT, and EMP_RATING if the EMP_RATING is: 

-- 1) less than two
select  emp_id, first_name, last_name, Gender, Dept,emp_rating
from emp_record where Emp_id <  2;

-- greater than four 
select  emp_id, first_name, last_name, Gender, Dept,emp_rating
from emp_record where Emp_id >  4 ;

-- between two and four
select  emp_id, first_name, last_name, Gender, Dept,emp_rating
from emp_record where Emp_id > 2 and Emp_id < 4;

/* Write a query to concatenate the FIRST_NAME and the LAST_NAME of employees in the Finance department
from the employee table and then give the resultant column alias as NAME.*/

SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) AS NAME
FROM emp_record
WHERE Dept = 'Finance';

/*Write a query to list only those employees who have someone reporting to them. 
Also, show the number of reporters (including the President).*/
SELECT e.EMP_ID, e.FIRST_NAME, e.LAST_NAME, COUNT(r.EMP_ID) AS NUMBER_OF_REPORTERS
FROM emp_record e
JOIN emp_record r ON e.EMP_ID = r.MANAGER_ID
GROUP BY e.EMP_ID, e.FIRST_NAME, e.LAST_NAME;

/*Write a query to list down all the employees from the healthcare and finance departments using union. 
Take data from the employee record table.
*/
SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING
FROM employee.emp_record
WHERE DEPT = 'Healthcare'
UNION
SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING
FROM employee.emp_record
WHERE DEPT = 'Finance';

/*Write a query to list down employee details such as EMP_ID, FIRST_NAME, LAST_NAME, ROLE, DEPARTMENT, and EMP_RATING grouped by dept.
 Also include the respective employee rating along with the max emp rating for the department.
*/
SELECT e.EMP_ID,
       e.FIRST_NAME,
       e.LAST_NAME,
       e.EMP_ROLE,
       e.DEPT,
       e.EMP_RATING,
       d.MAX_EMP_RATING
FROM employee.emp_record e
JOIN (
    SELECT DEPT, MAX(EMP_RATING) AS MAX_EMP_RATING
    FROM employee.emp_record
    GROUP BY DEPT
) d ON e.DEPT = d.DEPT
ORDER BY e.DEPT, e.EMP_RATING DESC;

/*Write a query to calculate the minimum and the maximum salary of the employees in each role. Take data from the employee record table.
*/
SELECT EMP_ROLE, 
       MIN(SALARY) AS MIN_SALARY, 
       MAX(SALARY) AS MAX_SALARY
FROM employee.emp_record
GROUP BY EMP_ROLE;


/*Write a query to assign ranks to each employee based on their experience. Take data from the employee record table.
*/
SELECT EMP_ID,
       FIRST_NAME,
       LAST_NAME,
       EMP_ROLE,
       DEPT,
       EXP,
       RANK() OVER (ORDER BY EXP DESC) AS Ranks
FROM employee.emp_record
ORDER BY Ranks;

/*
Write a query to create a view that displays employees in various countries whose salary is more than six thousand. Take data from the employee record table.
*/
CREATE VIEW high_salary_employees AS
SELECT EMP_ID,
       FIRST_NAME,
       LAST_NAME,
       EMP_ROLE,
       DEPT,
       COUNTRY,
       SALARY
FROM employee.emp_record
WHERE SALARY > 6000;

/*Write a nested query to find employees with experience of more than ten years. Take data from the employee record table.
*/
SELECT EMP_ID, FIRST_NAME, LAST_NAME, EMP_ROLE, DEPT, COUNTRY, SALARY, EXP
FROM employee.emp_record
WHERE EXP > 10;

/*Write a query to create a stored procedure to retrieve the details of the employees whose experience is more than three years. 
Take data from the employee record table.
*/
-- Store Procedure created in schema.
call employee.GetEmployeesWithExperienceMoreThanThreeYears();

/*Write a query using stored functions in the project table to check whether the job profile assigned to each employee in the data science team matches the organization’s set standard.
The standard being:
For an employee with experience less than or equal to 2 years assign 'JUNIOR DATA SCIENTIST',
For an employee with the experience of 2 to 5 years assign 'ASSOCIATE DATA SCIENTIST',
For an employee with the experience of 5 to 10 years assign 'SENIOR DATA SCIENTIST',
For an employee with the experience of 10 to 12 years assign 'LEAD DATA SCIENTIST',
For an employee with the experience of 12 to 16 years assign 'MANAGER'.
*/
-- stored function is created in schema
SELECT emp_id, first_name , emp_role , GetJobProfile(exp) AS job_profile
FROM data_science_team;

/*
Create an index to improve the cost and performance of the query to find the employee whose FIRST_NAME is ‘Eric’ in the employee table after checking the execution plan.
*/

EXPLAIN SELECT * FROM emp_record WHERE FIRST_NAME = 'Eric';

/*Write a query to calculate the bonus for all the employees, based on their ratings and salaries (Use the formula: 5% of salary * employee rating).
*/
SELECT EMP_ID, 
       FIRST_NAME, 
       LAST_NAME, 
       SALARY, 
       EMP_RATING, 
       (0.05 * SALARY * EMP_RATING) AS BONUS
FROM employee.emp_record;

/*Write a query to calculate the average salary distribution based on the continent and country. Take data from the employee record table.
*/
SELECT 
    COUNTRY,
    CONTINENT,
    AVG(SALARY) AS AVERAGE_SALARY
FROM 
    employee.emp_record
GROUP BY 
    COUNTRY, CONTINENT;







