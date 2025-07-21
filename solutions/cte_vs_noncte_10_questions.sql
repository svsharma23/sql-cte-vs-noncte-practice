-- Q:1 Using a CTE, retrieve the names and salaries of employees whose salary is not null.
--using CTE
WITH salary_not_null AS (
SELECT name, salary FROM employees
WHERE salary IS NOT NULL
)
SELECT * FROM salary_not_null;
-- using non CTE
SELECT name, salary FROM employees
WHERE salary IS NOT NULL;

-- Q:2 Using a CTE, list the names and salaries of employees whose salary is above the average salary
-- using CTE
WITH high_salary AS (SELECT name, salary FROM employees
WHERE salary > (SELECT AVG(salary) AS avg_salary FROM employees))
SELECT * FROM high_salary;
-- using non CTE
SELECT name, salary FROM employees
WHERE salary > (SELECT AVG(salary) AS avg_salary FROM employees);

-- Q:3 Show employee names with their department names, only for those who have a department assigned.
-- using CTE
WITH new_dept AS (
  SELECT e.name, d.dept_name
  FROM employees e
  INNER JOIN departments d
    ON e.department_id = d.department_id
)
SELECT name, dept_name FROM new_dept;
-- using non CTE
SELECT e.name, d.dept_name
  FROM employees e
  INNER JOIN departments d
    ON e.department_id = d.department_id

-- Q:4 Using a CTE, display each department’s name along with the total number of employees working in that department.
-- using CTE
WITH emp_qty AS (
SELECT d.dept_name, COUNT(e.name) AS no_of_emp
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.dept_name)
SELECT * FROM emp_qty;
-- using non CTE
SELECT d.dept_name, COUNT(e.name) AS no_of_emp
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.dept_name;

-- Q:5 Find departments where the average salary of employees is more than ₹60,000, using a CTE.
-- using CTE
WITH avg_sal AS (SELECT d.dept_name, ROUND(AVG(e.salary),2) AS average_salary
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.dept_name
HAVING AVG(e.salary) > 60000)
SELECT * FROM avg_sal;
-- using non CTE
SELECT d.dept_name, ROUND(AVG(e.salary),2) AS average_salary
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.dept_name
HAVING AVG(e.salary) > 60000;

-- Q:6 Using a CTE, list the top 3 highest paid employees, showing their name and salary.
-- using CTE
WITH top_3_emp AS (SELECT name, salary FROM employees
WHERE salary IS NOT NULL
ORDER BY salary DESC
LIMIT 3)
SELECT * FROM top_3_emp;
-- using non CTE
SELECT name, salary FROM employees
WHERE salary IS NOT NULL
ORDER BY salary DESC
LIMIT 3;

-- Q:7 Jaise department-wise top paid employee
-- using CTE
WITH max_salary AS (SELECT d.dept_name, MAX(e.salary) AS max_salry
FROM departments d
INNER JOIN employees e
ON e.department_id = d.department_id
GROUP BY d.dept_name)
SELECT * FROM max_salary;
-- using non CTE
SELECT d.dept_name, MAX(e.salary) AS max_salry
FROM departments d
INNER JOIN employees e
ON e.department_id = d.department_id
GROUP BY d.dept_name;

-- Q:8 Show department names where maximum salary > ₹65,000
--using CTE
WITH salbig65k AS (SELECT d.dept_name, MAX(e.salary) AS max_salary
FROM departments d
INNER JOIN employees e
ON e.department_id = d.department_id
GROUP BY d.dept_name
HAVING MAX(e.salary) > 65000)
SELECT * FROM salbig65k;
-- using non CTE
SELECT d.dept_name, MAX(e.salary) AS max_salary
FROM departments d
INNER JOIN employees e
ON e.department_id = d.department_id
GROUP BY d.dept_name
HAVING MAX(e.salary) > 65000;

-- Q:9 Using a CTE, list department names where: Average salary > ₹55,000 And number of employees is at least 2
-- using CTE
WITH new_table AS
(SELECT d.dept_name, ROUND(AVG(e.salary),2) AS avg_salary, COUNT(e.department_id) AS dept_count
FROM departments d
INNER JOIN employees e
ON e.department_id = d.department_id
GROUP BY d.dept_name
HAVING ROUND(AVG(e.salary),2) > 55000 AND COUNT(e.department_id) >= 2)
SELECT * FROM new_table;
-- using non CTE
SELECT d.dept_name, ROUND(AVG(e.salary),2) AS avg_salary, COUNT(e.department_id) AS dept_count
FROM departments d
INNER JOIN employees e
ON e.department_id = d.department_id
GROUP BY d.dept_name
HAVING ROUND(AVG(e.salary),2) > 55000 AND COUNT(e.department_id) >= 2;

-- Q:10 list the most recently joined employee from each department including employee name, dept_name, join_date
-- using CTE
WITH recent_join AS (SELECT department_id, MAX(join_date) AS recent_date
					 FROM employees
					 WHERE department_id IS NOT NULL
					 GROUP BY department_id)
SELECT e.name, d.dept_name, e.join_date 
FROM employees e
INNER JOIN recent_join r
ON e.department_id = r.department_id AND e.join_date = r.recent_date
INNER JOIN departments d
ON e.department_id = d.department_id;
-- using non CTE
SELECT e.name, d.dept_name, e.join_date
FROM employees e
INNER JOIN departments d 
ON e.department_id = d.department_id
INNER JOIN (
SELECT department_id, MAX(join_date) AS recent_date
					 FROM employees
					 WHERE department_id IS NOT NULL
					 GROUP BY department_id
) AS rj
ON rj.department_id = e.department_id AND e.join_date = rj.recent_date
