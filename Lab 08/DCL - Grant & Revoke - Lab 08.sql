CREATE USER 'corey'@'localhost' IDENTIFIED BY 'Linux4you!';
CREATE USER 'will'@'localhost' IDENTIFIED BY 'Linux4you!';
CREATE USER 'mike'@'localhost' IDENTIFIED BY 'Linux4you!';
CREATE USER 'myles'@'localhost' IDENTIFIED BY 'Linux4you!';

CREATE USER 'Admin'@'localhost' IDENTIFIED BY 'SukkurIBA';
CREATE USER 'Student'@'localhost' IDENTIFIED BY 'SukkurIBA';
CREATE USER 'Faculty'@'localhost' IDENTIFIED BY 'SukkurIBA';
CREATE USER 'Guest'@'localhost' IDENTIFIED BY 'SukkurIBA';

CREATE DATABASE attendance;

GRANT ALL PRIVILEGES ON *.* TO 'Admin'@'localhost' WITH GRANT OPTION;

use attendance; 

CREATE TABLE attendance (
    teacher_id INT NOT NULL,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    date DATE NOT NULL,
    attendance ENUM('P', 'A') NOT NULL
);

CREATE TABLE faculty (
    id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE student (
    id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE course (
    id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO faculty (id, name) VALUES (1, 'John Doe');
INSERT INTO faculty (id, name) VALUES (2, 'Jane Smith');

GRANT SELECT ON attendance.* TO 'Student'@'localhost';
GRANT INSERT, UPDATE ON attendance.* TO 'Faculty'@'localhost';



