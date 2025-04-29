# SQL-PROJECT
# 1. Practice Problem 1
Concepts: Comparison Operators
Write a query that selects all employees who earn more than $50,000 and belong to the 'Sales' department.
-- selecting all employees who earn more than $50,000 and belong to the 'Sales' department
Select * from Evening_Class.employees e 
JOIN Evening_Class.departments d
  ON e.department_id = d.department_id
WHERE e.salary > 50000 
and d.department_name = 'Sales';
![image](https://github.com/user-attachments/assets/9f0ac876-8afb-408b-8d16-1c09646d11db)

# 2.Practice Problem 2
Concepts: Wildcards, Alias
Problem: Write a query that selects the first name and last name of employees whose first name starts with 'J' and display them with aliases "Employee First Name" and "Employee Last Name"
-- selecting the first name and last name of employees whose first name starts with 'J' and display them with aliases 
-- "Employee First Name" and "Employee Last Name".
SELECT first_name AS "Employee First Name",last_name AS "Employee Last Name"
FROM Evening_Class.employees
WHERE first_name LIKE 'J%';
![image](https://github.com/user-attachments/assets/7ce08de3-a38f-49fb-a5d5-1f4398ffedd1)

# 3. Practice Problem 3
Concepts: Aggregation Functions
Problem: Write a query that calculates the average salary of employees in each department.
-- A query that calculates the average salary of employees in each department.
SELECT d.department_name,
    AVG(e.salary) AS average_salary
FROM Evening_Class.employees e
JOIN Evening_Class.departments d ON e.department_id = d.department_id
GROUP BY d.department_name;
![image](https://github.com/user-attachments/assets/e3179090-707f-48e1-b669-d23292a84261)

# 4. Practice Problem 4
Concepts: NULL Values
Problem: Write a query that selects all employees without a department assigned (i.e., whose department is NULL).
-- Query that selects all employees without a department assigned (i.e., whose department is NULL).
SELECT * FROM Evening_Class.employees
WHERE department_id IS NULL;
![image](https://github.com/user-attachments/assets/d8812708-dbd8-4a42-985b-0427561d4998)

# 5. Practice Problem 5
Concepts: JOINS
Problem: Write a query that returns a list of employees and the department name they belong to. If an employee doesn't belong to a department, their department should show as 'No Department'.
-- a query that returns a list of employees and the department name they belong to. 
-- If an employee doesn't belong to a department, their department should show as 'No Department'.
SELECT e.first_name, e.last_name,
    IFNULL(d.department_name, 'No Department') AS department_name
FROM Evening_Class.employees e
LEFT JOIN Evening_Class.departments d
    ON e.department_id = d.department_id;
![image](https://github.com/user-attachments/assets/8cbd1650-5e8a-4147-a691-bba6abc443bf)

# 6. Practice Problem 6
Concepts: Date Functions
Problem: Write a query that selects all employees who were hired in the year 2020.
-- A query that selects all employees who were hired in the year 2020
SELECT * FROM Evening_Class.employees
WHERE YEAR(hire_date) = 2020;
![image](https://github.com/user-attachments/assets/75255244-c98d-4693-980f-6d841091b59d)

# 7. Practice Problem 7
Concepts: Subqueries, CTEs
Problem: Write a query using a subquery to select the employees who earn more than the average salary.
-- A query using a subquery to select the employees who earn more than the average salary
SELECT * FROM Evening_Class.employees
WHERE salary > (SELECT AVG(salary)
    FROM Evening_Class.employees
);
![image](https://github.com/user-attachments/assets/4d411b44-b1e1-4442-9c0a-153ccf690e0d)

# 8. Practice Problem 8
Concepts: UNION Operators
Problem: Write a query that combines the first names of all employees and all contractors into one list

# 9. Practice Problem 9
Concepts: CASE Expression
Problem: A query that shows employee names and the salary status ('High' or 'Low') based on a threshold of $60,000.
-- A query that shows employee names and the salary status ('High' or 'Low') based on a threshold of $60,000.
SELECT first_name || ' ' || last_name AS employee_name,salary,
    CASE 
        WHEN salary > 60000 THEN 'High'
        ELSE 'Low'
    END AS salary_status
FROM Evening_Class.employees;
![image](https://github.com/user-attachments/assets/c0f7cc53-05d1-4195-8736-9a3c264c7d61)

# 10. Practice Problem 10
Concepts: ORDER BY and Aggregation
Problem: A query that lists all departments and their total salary, ordered by total salary in descending order.
SELECT d.department_name,
    SUM(e.salary) AS total_salary
FROM Evening_Class.departments d
LEFT JOIN Evening_Class.employees e 
ON d.department_id = e.department_id
GROUP BY d.department_name
ORDER BY total_salary DESC;
![image](https://github.com/user-attachments/assets/231f1693-b486-448d-94e3-01428dbe2bfc)













