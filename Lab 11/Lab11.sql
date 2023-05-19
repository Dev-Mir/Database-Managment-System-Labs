show databases;
use hr;

------------------------------- PROCEDURE 1  --------------------------------

DELIMITER //

CREATE PROCEDURE DISPLAY()
BEGIN
  SELECT employee_id, concat(first_name, " ", last_name ) as employee_name, salary FROM employees WHERE department_id = 10;
END //

DELIMITER ;

CALL DISPLAY();

------------------------------- PROCEDURE 2  --------------------------------

DELIMITER //

CREATE PROCEDURE DISPLAY2(IN deptno_in INT)
BEGIN
  SELECT d.department_name, SUM(e.salary) as total_salary
  FROM employees e
  INNER JOIN departments d
  ON e.department_id = d.department_id
  WHERE e.department_id = d.department_id
  GROUP BY d.department_name;
END //

DELIMITER ;


CALL DISPLAY2(10);

