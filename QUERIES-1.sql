DROP DATABASE student;

CREATE DATABASE student;
USE student;

CREATE TABLE students(
id INT,
name VARCHAR(255),
age INT,
grade VARCHAR(10));


SELECT * FROM students;

INSERT INTO students (id, name, age, grade) VALUES (1, 'Ajay', 28, 'A');

INSERT INTO students (id, name, age, grade) VALUES (2, 'BIJAY', 30, 'B');

SELECT * FROM students;


-- This is a comment
/* This is sql class
I am enjoying it
monjolika will kill me if i dont teach good */

-- update the age to 21 where id is 2
-- SET SQL_SAFE_UPDATES = 0;

-- UPDATE students SET age = 21 where id = 2;
-- SELECT * FROM students;

-- DELETE FROM students WHERE id = 2;
SELECT * FROM students;

-- DROP DATABASE student;

ALTER TABLE students ADD email VARCHAR(100);
SELECT * FROM students;

ALTER TABLE students CHANGE email emailid VARCHAR(100);
SELECT * FROM students;

ALTER TABLE students DROP COLUMN emailid;
SELECT * FROM students;

/*
TRUNCATE TABLE students;
SELECT * FROM students;

DROP TABLE students;
SELECT * FROM students; */

-- create a new column email id and insert any value inplace of null

ALTER TABLE STUDENTS ADD EMAIL VARCHAR(100);
SELECT * FROM students;

UPDATE students
SET email = 'not@gmail.com'
WHERE email is null;
SELECT * FROM students;

UPDATE students  
SET email = 'ajay@gmail.com' 
WHERE name = 'Ajay';

SELECT * FROM students;

-- update email id based on name column

update students
SET email = CONCAT(name, '@gmail.com');

SELECT * FROM students;

-- update age=80 and email=dghsdg@gmail.com where name is Ajay

UPDATE students 
SET 
    age = 80,
    email = 'random@gmail.com'
WHERE
    name = 'Ajay';
SELECT * FROM students;

-- COALESCE >> DOESNT MODIFY THE ORIGINAL DATABASE
SELECT name, COALESCE(email, 'not_provided@example.com') AS email 
FROM students;

SELECT * FROM students;


create database learn;
use learn;

CREATE TABLE students(
rollno INT PRIMARY KEY,
name VARCHAR(255) NOT NULL
);

INSERT INTO students (rollno, name) VALUES (1, 'Ajay');
INSERT INTO students (rollno, name) VALUES (2, 'Bijay');


CREATE TABLE enrollments(
id INT PRIMARY KEY auto_increment,
rollno int,
course VARCHAR(100) NOT NULL,
foreign key(rollno) REFERENCES students(rollno));
-- by default restriction is on update and delete

INSERT INTO enrollments (id, rollno, course) VALUES (100, 1,'DS');
INSERT INTO enrollments (id, rollno, course) VALUES (101, 2,'ML');

select * from students;
select * from enrollments;

DELETE FROM students 
WHERE
    rollno = 1; -- This will throw an error as enrollments table is dependent on students table via foreign key rollno
    
use office ;
select * from students;

select * from students limit 15;

-- get the next 5 rows after skipping the first 5
select * from students limit 5 offset 15;

select * from students order by age DESC;


CREATE DATABASE IF NOT EXISTS student;
drop database student;

use student;

CREATE TABLE studentinfo(rollno INTEGER PRIMARY KEY,
name VARCHAR(255) NOT NULL,
email VARCHAR(255) UNIQUE,
age INT CHECK(age>=18),
salary int default 0);

select * from studentinfo;

INSERT INTO studentinfo (rollno, name, email, age, salary) values (1, 'Ajay', 'aj@gmail.com', 20, 10000);
INSERT INTO studentinfo (rollno, name, email, age, salary) values (2, 'Bjay', 'bj@gmail.com', 51, 2000);
INSERT INTO studentinfo (rollno, name, email, age) values (3, 'Ajiay', 'aij@gmail.com', 18);
select * from studentinfo;

/*
Create a table employees with columns (id, name, department, salary).
Insert three records into the employees table.
Write a query to retrieve all employees. */

DROP DATABASE Office;
create database Office;

use Office;

create table employee(id int, name varchar(10) PRIMARY KEY, department varchar(10), salary float);


Insert into employee (id, name, department, salary) values (1, 'Bijay', 'IT', 50000);
Insert into employee (id, name, department, salary) values (2, 'Ajay', 'HR', 60000);
Insert into employee (id, name, department, salary) values (3, 'TEST', 'IT', 60000);



UPDATE employee SET salary = 0 where id = 2;

select * from employee;









