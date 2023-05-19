show databases;

USE hr ;

-- QUERY 1  

SELECT * FROM  employees 
WHERE employee_id 
IN (SELECT employee_id FROM job_history GROUP BY employee_id HAVING count(employee_id) >= 1);

-- QUERY 2  

SELECT CONCAT(first_name, ' ', last_name) AS Name, salary
FROM employees 
WHERE salary > (SELECT salary from employees WHERE last_name = 'Bull');

-- QUERY 3

SELECT CONCAT(first_name, ' ', last_name) AS Name
FROM employees 
WHERE department_id = ANY (SELECT department_id from departments WHERE department_name = 'IT');

-- QUERY 4

SELECT CONCAT(first_name, ' ', last_name) AS Name
FROM employees
WHERE manager_id IS NOT NULL AND department_id IN
  (SELECT department_id FROM departments
	WHERE location_id IN
     (SELECT location_id
      FROM locations
      WHERE country_id = 'US'));

-- QUERY 5

SELECT CONCAT(first_name, ' ', last_name) AS Name
	FROM employees
	WHERE manager_id IS NOT NULL;


-- QUERY 6

SELECT CONCAT(first_name, ' ', last_name) AS Name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
ORDER BY salary DESC;


-- QUERY 7


SELECT CONCAT(e.first_name, ' ', e.last_name) AS Name, e.salary
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
WHERE e.salary = (SELECT MIN(salary) FROM employees WHERE job_id = e.job_id)
ORDER BY e.salary;


-- QUERY 8

SELECT e.first_name, e.last_name, e.salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.salary > (SELECT AVG(salary) FROM employees) AND d.department_name LIKE 'IT%'
ORDER BY e.salary DESC;


-- QUERY 9

SELECT first_name, last_name, salary
FROM employees
WHERE salary > (SELECT salary FROM employees WHERE last_name = 'Bell')
ORDER BY salary DESC;


-- QUERY 10

SELECT e.first_name, e.last_name, e.salary
FROM employees e
WHERE e.salary = (SELECT MIN(salary) FROM employees)
ORDER BY e.salary;


-- QUERY 11

SELECT first_name, last_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
ORDER BY salary DESC;


-- QUERY 12

SELECT first_name, last_name, salary
FROM employees
WHERE salary > (SELECT MAX(salary) FROM employees WHERE job_id = 'SH_CLERK')
ORDER BY salary ASC;


-- QUERY 13

SELECT first_name, last_name
FROM employees
WHERE job_id NOT IN (SELECT job_id FROM employees WHERE manager_id IS NULL)
ORDER BY last_name, first_name;


-- QUERY 14


SELECT employee_id, first_name, last_name, 
       (SELECT department_name FROM departments WHERE department_id = employees.department_id) AS department_name
FROM employees
ORDER BY employee_id;



-- QUERY 15

SELECT e.employee_id, e.first_name, e.last_name, e.salary
FROM employees e
INNER JOIN (
    SELECT department_id, AVG(salary) as avg_salary
    FROM employees
    GROUP BY department_id
) d
ON e.department_id = d.department_id
WHERE e.salary > d.avg_salary
ORDER BY e.employee_id;


