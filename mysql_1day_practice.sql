list of constraints on a table:
========================================
select COLUMN_NAME, CONSTRAINT_NAME, REFERENCED_COLUMN_NAME, REFERENCED_TABLE_NAME
 from information_schema.KEY_COLUMN_USAGE
 where TABLE_NAME = 'course';

Alter.sql:
=======================
use moritech;

alter table student add studentpercentage float after studentmarks;

-- Modify a column type

alter table student modify  studentpercentage double;

-- describe table

desc student;

-- rename the column name
alter table student rename column stud_per to studentpercentage;

alter table student change column studentpercentage studper float;

-- drop a column
# drop a column
alter table student drop studentnationality;

-- alter the table name
alter table student rename to student_data;


constaint.sql
=======================

-- adding constraints while creating table
create table course(courseid int,coursename varchar(20) not null);

-- drop the table
drop table course;

-- adding multiple  constraints on single column while creating table
create table course(courseid int not null unique,
						coursename varchar(20) not null );

-- describe command
===========================
desc course;

Field           Type    NULL    Key  default    Extra
courseid	int	NO	PRI  NULL		
coursename	varchar(20)	NO   NULL		


-- adding constraint while altering table
======================================
alter table course add column coursefees float not null;

-- adding new constraint 
=======================================

alter table course modify coursename varchar(20) not null;

-- adding two constraints using alter
alter table course modify coursename varchar(20) not null unique;

-- alter table drop constraint
alter table course drop constraint coursen; 

-- ALTER TABLE table_name ADD CONSTRAINT constraint_name not null
-- alter the table to add a new column
alter table course add column courseduration int;
alter table course add CONSTRAINT  course_nt_nl unique (courseduration);

-- drop the constraint using constraint name
alter table course drop constraint  course_nt_nl;

-- create table the constraint and constraint name
create table instructor(instructorid int,
						instructorname varchar(50) ,
                        constraint cns_name unique(instructorname));

-- describe
desc instructor;
===================


create database
==================
-- create a database
create database demo1;

-- create a table in above database

use demo1;

create table sample(sampleid int,samplename varchar(32));

# drop a database

drop database demo1;



table with dbengines.sql:
==============================
use moritech;

drop table instructordetails;

-- creating table using specific engine type

create table instructordetails
(instr_details_id int,instr_id int,specialization varchar(20))
engine=MyISAM;

truncate 
===========
-- truncate is to delete all rows
-- truncate will drop the table to delete all rows and recreates the empty table
-- to fastly delete all rows instead of deleting row by row

-- syntax for truncating the table
truncate table instructordetails;

-- or [table] keyword is optional
truncate course;

-- drop table to see the difference between truncate and drop
drop table instructordetails;
