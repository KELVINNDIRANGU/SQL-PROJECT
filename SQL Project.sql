CREATE Database Evening_Class;
Create schema sql_lesson;


-- Create the departments table
CREATE TABLE Evening_Class.departments (
    department_id INT PRIMARY KEY,           -- Unique ID for the department
    department_name VARCHAR(100) NOT NULL    -- Name of the department
);

-- Create the employees table
CREATE TABLE Evening_Class.employees (
    employee_id INT PRIMARY KEY,               -- Unique ID for the employee
    first_name VARCHAR(50) NOT NULL,            -- Employee's first name
    last_name VARCHAR(50) NOT NULL,             -- Employee's last name
    department_id INT,                         -- Department ID from the departments table
    salary DECIMAL(10, 2) NOT NULL,             -- Employee's salary
    hire_date DATE NOT NULL,                   -- Employee's hire date
    email VARCHAR(100),                        -- Employee's email address
    phone_number VARCHAR(15),                  -- Employee's phone number
    FOREIGN KEY (department_id) REFERENCES departments(department_id)  -- Foreign key to link employees to departments
);

-- Example insert statements for departments
INSERT INTO Evening_Class.departments (department_id, department_name) 
VALUES 
(1, 'Sales'),
(2, 'Marketing'),
(3, 'HR'),
(4, 'Engineering'),
(5, 'Finance');

-- Select all from departments
SELECT * FROM Evening_Class.departments d ;

-- Example insert statements for employees
INSERT INTO Evening_Class.employees (employee_id, first_name, last_name, department_id, salary, hire_date, email, phone_number) 
VALUES 
(1, 'John', 'Doe', 1, 60000, '2020-01-15', 'johndoe@example.com', '123-456-7890'),
(2, 'Jane', 'Smith', 2, 75000, '2019-06-10', 'janesmith@example.com', '987-654-3210'),
(3, 'Emily', 'Johnson', 3, 55000, '2021-03-23', 'emilyjohnson@example.com', '456-123-7890'),
(4, 'Michael', 'Brown', 4, 90000, '2018-11-02', 'michaelbrown@example.com', '321-654-9870'),
(5, 'Sarah', 'Davis', 5, 70000, '2022-05-17', 'sarahdavis@example.com', '654-987-1230');

-- Selecting all from employees table
Select * from Evening_Class.employees e;


-- selecting all employees who earn more than $50,000 and belong to the 'Sales' department
Select * from Evening_Class.employees e 
JOIN Evening_Class.departments d
  ON e.department_id = d.department_id
WHERE e.salary > 50000 
and d.department_name = 'Sales';

-- selecting the first name and last name of employees whose first name starts with 'J' and display them with aliases 
-- "Employee First Name" and "Employee Last Name".
SELECT first_name AS "Employee First Name",last_name AS "Employee Last Name"
FROM Evening_Class.employees
WHERE first_name LIKE 'J%';

-- A query that calculates the average salary of employees in each department.
SELECT d.department_name,
    AVG(e.salary) AS average_salary
FROM Evening_Class.employees e
JOIN Evening_Class.departments d ON e.department_id = d.department_id
GROUP BY d.department_name;

-- Query that selects all employees without a department assigned (i.e., whose department is NULL).
SELECT * FROM Evening_Class.employees
WHERE department_id IS NULL;

-- a query that returns a list of employees and the department name they belong to. 
-- If an employee doesn't belong to a department, their department should show as 'No Department'.
SELECT e.first_name, e.last_name,
    IFNULL(d.department_name, 'No Department') AS department_name
FROM Evening_Class.employees e
LEFT JOIN Evening_Class.departments d
    ON e.department_id = d.department_id;

-- Write a query that selects all employees who were hired in the year 2020
SELECT * FROM Evening_Class.employees
WHERE YEAR(hire_date) = 2020;

-- Write a query using a subquery to select the employees who earn more than the average salary
SELECT * FROM Evening_Class.employees
WHERE salary > (SELECT AVG(salary)
    FROM Evening_Class.employees
);

-- Write a query that combines the first names of all employees and all contractors into one list
SELECT first_name FROM Evening_Class.employees

UNION

SELECT first_name FROM contractors;

-- A query that shows employee names and the salary status ('High' or 'Low') based on a threshold of $60,000.
SELECT first_name || ' ' || last_name AS employee_name,salary,
    CASE 
        WHEN salary > 60000 THEN 'High'
        ELSE 'Low'
    END AS salary_status
FROM Evening_Class.employees;

-- A query that lists all departments and their total salary, ordered by total salary in descending order.
SELECT d.department_name,
    SUM(e.salary) AS total_salary
FROM Evening_Class.departments d
LEFT JOIN Evening_Class.employees e 
ON d.department_id = e.department_id
GROUP BY d.department_name
ORDER BY total_salary DESC;

