CREATE DATABASE Lab6;
USE Lab6;

CREATE TABLE DEPARTMENT   (

  DEPTNO  INT PRIMARY KEY,
  DNAME  VARCHAR(10),
  LOC  VARCHAR(10)

 );
 
CREATE TABLE EMPLOYEE (

EMPNO INT,
ENAME varchar(10),
SAL INT, 
DEPTNO INT,
PRIMARY KEY (EMPNO, DEPTNO ),
FOREIGN KEY (DEPTNO) REFERENCES DEPARTMENT(DEPTNO)

);

  
ALTER TABLE EMPLOYEE ADD CHECK (EMPNO = UPPER(EMPNO));

ALTER TABLE DEPARTMENT MODIFY DNAME varchar(10) NOT NULL ; 

ALTER TABLE EMPLOYEE MODIFY SAL INT UNIQUE;


ALTER TABLE EMPLOYEE
ADD CONSTRAINT DEPTNO
FOREIGN KEY (DEPTNO)
REFERENCES DEPARTMENT(DEPTNO)
ON UPDATE CASCADE
ON DELETE SET NULL;

