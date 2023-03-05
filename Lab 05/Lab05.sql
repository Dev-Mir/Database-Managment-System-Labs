CREATE DATABASE my_employee_db;
USE my_employee_db;
CREATE TABLE employee (
   employee_id INT(11) NOT NULL AUTO_INCREMENT,
   first_name VARCHAR(20) NOT NULL,
   last_name VARCHAR(25) NOT NULL,
   email VARCHAR(25),
   phone_number VARCHAR(20),
   hire_date DATE NOT NULL,
   job_id VARCHAR(10) NOT NULL,
   salary DECIMAL(8,2),
   commission_pct DECIMAL(2,2),
   manager_id INT(11),
   department_id INT(11),
   PRIMARY KEY (employee_id)
);

INSERT INTO employee (first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
VALUES 
('John', 'Doe', 'jdoe@example.com', '123-456-7890', '2020-01-01', 'SA_REP', 5000.00, 0.05, 100, 50),
('Jane', 'Doe', 'jane@example.com', '123-456-7891', '2020-02-01', 'IT_PROG', 6000.00, 0.00, 101, 60),
('Bob', 'Smith', 'bsmith@example.com', '123-456-7892', '2020-03-01', 'SA_MAN', 10000.00, 0.10, 102, 50),
('Mary', 'Johnson', 'mjohnson@example.com', '123-456-7893', '2020-04-01', 'AC_MGR', 8000.00, 0.00, 103, 110),
('Tom', 'Wilson', 'twilson@example.com', '123-456-7894', '2020-05-01', 'AC_ACCOUNT', 4000.00, 0.00, 104, 110),
('Alice', 'Lee', 'alee@example.com', '123-456-7895', '2020-06-01', 'IT_PROG', 5500.00, 0.00, 101, 60),
('Chris', 'Brown', 'cbrown@example.com', '123-456-7896', '2020-07-01', 'ST_CLERK', 3000.00, 0.00, 105, 20),
('Eva', 'Green', 'egreen@example.com', '123-456-7897', '2020-08-01', 'SA_REP', 6000.00, 0.07, 106, 50),
('Michael', 'Davis', 'mdavis@example.com', '123-456-7898', '2020-09-01', 'ST_CLERK', 2500.00, 0.00, 107, 20),
('Sarah', 'Jones', 'sjones@example.com', '123-456-7899', '2020-10-01', 'IT_PROG', 7000.00, 0.00, 108, 60);

ALTER TABLE employee ADD address VARCHAR(50);
ALTER TABLE employee DROP COLUMN address;
ALTER TABLE employee
ADD house_no CHAR(10),
ADD street_no INT,
ADD area VARCHAR(50),
ADD city VARCHAR(50);

ALTER TABLE employee MODIFY house_no INT;
CREATE TABLE faculty (
   FacultyID INT(11) NOT NULL PRIMARY KEY,
   FacultyName VARCHAR(25)
);

CREATE TABLE course (
   CourseID VARCHAR(8) NOT NULL PRIMARY KEY,
   CourseName VARCHAR(15)
);

CREATE TABLE class (
   ClassID VARCHAR(8),
   CourseID VARCHAR(8),
   SectionNo INT,
   Semester VARCHAR(10),
   PRIMARY KEY (ClassID),
   FOREIGN KEY (CourseID) REFERENCES course(CourseID)
);

CREATE TABLE student (
   StudentID INT(11) NOT NULL PRIMARY KEY,
   StudentName VARCHAR(25),
   FacultyID INT(11),
   FOREIGN KEY (FacultyID) REFERENCES faculty(FacultyID)
);
ALTER TABLE student ADD CLASS VARCHAR(10);

-- Using RENAME TABLE statement
RENAME TABLE department TO dept;

-- Using ALTER TABLE statement
ALTER TABLE department RENAME TO dept;
ALTER TABLE locations ADD regionId INT;
ALTER TABLE locations CHANGE state_province state VARCHAR(50);
