show databases;
use hr;
show tables;

-- 1

SELECT e.first_name, e.last_name, d.department_id, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id;

-- 2

SELECT  CONCAT(e.first_name, ' ', e.last_name) AS Name, e.job_id, d.department_id, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id
INNER JOIN locations l ON d.location_id = l.location_id
WHERE l.city = 'London';


-- 3

SELECT  CONCAT(e.first_name, ' ', e.last_name) AS Name, d.department_id, l.city, l.state
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id
INNER JOIN locations l ON d.location_id = l.location_id;


-- 4.	

SELECT e.employee_id, e.last_name, e.manager_id, m.last_name AS manager_last_name
FROM employees e
INNER JOIN employees m ON e.manager_id = m.employee_id;

-- 5

SELECT e.first_name, e.last_name, e.hire_date
FROM employees e
INNER JOIN employees j ON j.last_name = 'Jones'
WHERE e.hire_date > j.hire_date;

-- 6

SELECT 
  d.department_name, 
  COUNT(e.employee_id) AS num_of_employees
FROM 
  employees e  
  INNER JOIN departments d ON e.department_id = d.department_id
GROUP BY 
  d.department_name;
  
-- 7

SELECT 
  d.department_id, 
  d.department_name, 
  e.first_name AS manager_first_name
FROM 
  departments d 
  INNER JOIN employees e ON d.manager_id = e.employee_id;


-- 8

SELECT 
  d.department_name, 
  CONCAT(e.first_name, ' ', e.last_name) AS manager_name, 
  l.city
FROM 
  departments d 
  INNER JOIN employees e ON d.manager_id = e.employee_id 
  INNER JOIN locations l ON d.location_id = l.location_id;
  
-- 9

SELECT job_history.* FROM job_history
INNER JOIN employees ON job_history.employee_id = employees.employee_id
WHERE employees.salary > 1000;

-- 10

SELECT 
  e.first_name, 
  e.last_name, 
  e.hire_date, 
  e.salary
FROM 
  employees e 
  INNER JOIN departments d ON e.employee_id = d.manager_id 
WHERE 
  DATEDIFF(CURRENT_DATE(), d.start_date) > 15*365;


-- 11

SELECT 
  d.department_name, 
  AVG(e.salary) AS avg_salary, 
  COUNT(CASE WHEN e.commission_pct IS NOT NULL THEN e.employee_id END) AS num_commissioned
FROM 
  employees e 
  JOIN departments d ON e.department_id = d.department_id
GROUP BY 
  d.department_name;
  
 -- 12

SELECT 
  c.country_name, 
  l.city, 
  d.department_name
FROM 
  departments d 
  JOIN locations l ON d.location_id = l.location_id 
  JOIN countries c ON l.country_id = c.country_id;
  
  -- 13
  
  SELECT 
  d.department_name, 
  CONCAT(e.first_name, ' ', e.last_name) AS manager_name
FROM 
  employees e 
  JOIN departments d 
    ON e.department_id = d.department_id 
    AND e.job_id LIKE '%MANAGER%';

-- 14

SELECT DISTINCT
  jh.job_id,
  jh.start_date,
  jh.end_date,
  e.first_name,
  e.last_name,
  e.salary
FROM 
  job_history jh
  JOIN employees e 
    ON jh.employee_id = e.employee_id 
WHERE 
  e.salary >= 12000;
  
-- 15

SELECT CONCAT(first_name, ' ', last_name) AS full_name, salary
FROM employees
INNER JOIN departments ON employees.department_id = departments.department_id
INNER JOIN locations ON departments.location_id = locations.location_id
WHERE locations.city = 'London';

-- 16


SELECT jobs.job_title, CONCAT(first_name, ' ', last_name) AS employee_name, (employees.salary - jobs.min_salary) AS salary_diff
FROM employees
INNER JOIN jobs ON employees.job_id = jobs.job_id;

-- 17

SELECT jobs.job_title, AVG(salary) AS avg_salary
FROM employees
INNER JOIN jobs ON employees.job_id = jobs.job_id
GROUP BY jobs.job_title;

-- 18

SELECT job_history.employee_id, jobs.job_title, DATEDIFF(job_history.end_date, job_history.start_date) AS days_diff
FROM job_history
INNER JOIN jobs ON job_history.job_id = jobs.job_id
WHERE jobs.job_id IN (
    SELECT job_id
    FROM job_history
    WHERE department_id = 90
)
ORDER BY job_history.employee_id;
