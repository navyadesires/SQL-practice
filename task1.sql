excercise#1:

Based on the employees table below, select all fields from the employees table whose salary is
less than or equal to $52,500(no sorting is required):

use testdb1;

create table employees(employee_number int NOT NULL,
last_name char(50) NOT NULL,
first_name char(50) NOT NULL,
salary int,
dept_id int,
CONSTRAINT employees_pk PRIMARY KEY (employee_number)
);


INSERT INTO employees(employee_number, last_name, first_name, salary, dept_id)
VALUES(1001,'Smith','john',62000,500);
INSERT INTO employees(employee_number, last_name, first_name, salary, dept_id)
VALUES(1002,'Anderson','jone',62000,500);
INSERT INTO employees(employee_number, last_name, first_name, salary, dept_id)
VALUES(1003,'Everest','brad',71000,501);
INSERT INTO employees(employee_number, last_name, first_name, salary, dept_id)
VALUES(1004,'Horvath','jack',42000,501);


select * from employees where salary <= 52500;


				
				