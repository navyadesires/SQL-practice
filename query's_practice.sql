create database examples;
Show databases;
use examples;
--- create employee card details table -----
 create table employee_card_details(employee_id varchar(6), loan_Id varchar(32),
card_issue_date Date);
desc employee_card_details;
--- insert employee card details table -----
insert into employee_card_details values(1,'456','2021-2-23');
insert into employee_card_details values(2,'457','2020-2-23'),
										(3,'486','2020-12-23'),
                                        (4,'856','2021-06-23'),
                                        (5,'256','2021-03-23'),
                                        (6,'956','2021-9-23'),
                                        (7,'456','2020-2-13'),
                                        (8,'756','2021-12-13');
----- select employee card details table ---
select * from employee_card_details ;
--- drop employee card details table ---
drop table employee_card_details;


--- create employee master table-----
 create table employee_master(employee_id varchar(6),employee_name varchar(20),department varchar(2),
 designation varchar(25), gender char(1),
date_of_birth Date, date_of_joining Date);
desc employee_master;
--- insert employee master table-----
insert into employee_master values(1,'ms','HR','456','f','1998-2-23','2020-1-20');
insert into employee_master values(2,'ms','IT','456','f','1998-2-23','2020-1-20');
insert into employee_master values(3,'sds','HR','457','f','1998-2-23','2020-1-20');
--- select employee master table-----
select * from employee_master ;
--- drop employee master table-----
drop table employee_master;


--- create employee issue details table-----
 create table employee_issue_details(issue_ID varchar(6),employee_id varchar(20),
 item_id varchar(25), issue_date Date,
return_date Date);
desc employee_issue_details;
--- insert employee issue details table-----
insert into employee_issue_details values(1,'456','459','2020-2-23','2020-1-20');
insert into employee_issue_details values(2,'345','457','2020-2-23','2020-8-22'),
										(3,'678','486','2020-12-23','2021-1-2'),
                                        (4,'434','856','2021-06-23','2020-7-22'),
                                        (5,'678','256','2021-03-23','2020-3-2');
 --- select employee issue details table-----                                      
select * from employee_issue_details ;
--- drop employee issue details table-----
drop table employee_issue_details;


--- create Loan card master table-----
 create table loan_card_master(loan_ID varchar(6),loan_type varchar(20),
 duration_in_years INT(2));
desc loan_card_master;
--- insert Loan card master table-----
insert into loan_card_master values(1,'em','1998');
insert into loan_card_master values(2,'ff','1999'),
										(3,'fdfd','2010'),
                                        (4,'fdfd','2012'),
                                        (5,'tere','2014');
--- select Loan card master table-----                                     
select * from loan_card_master;
--- drop Loan card master table-----
drop table loan_card_master;



--- create Item master table-----
 create table item_master(item_ID varchar(6),item_description varchar(20),
 issue_status char(1),item_mode varchar(25),item_category varchar(20),iteam_valuation INT(6));
desc item_master;
--- insert Item master table-----
insert into item_master values(1,'em','y','dsd','sssd','19');
insert into item_master values(2,'ff','n','sasa','sasa','14'),
										(3,'ff','n','sasa','sasa','14'),
                                        (4,'ff','n','sasa','sasa','11'),
                                        (5,'ff','n','sasa','sasa','12');
--- select Item master table-----                                    
select * from item_master;

--- 1 query---
SELECT  item_category , count(item_Id) Count_category
FROM item_master
GROUP BY item_category order by count_category DESC;
---- 2 query -----
SELECT count(employee_id) AS No_of_Employees
FROM employee_master
WHERE department= 'HR';
---- 3 query ----
SELECT employee_id, employee_name, designation, department
FROM employee_master WHERE employee_id
NOT IN ( SELECT employee_id FROM employee_issue_details)
order by employee_id;
---- 4 query -----
SELECT eid.employee_id, employee_name
FROM employee_master em INNER JOIN employee_issue_details eid
ON em.employee_id=eid.employee_id
INNER JOIN item_master im
ON eid.item_Id=im.item_Id
WHERE item_valuation=(SELECT max(item_valuation)
FROM employee_issue_details eid INNER JOIN item_master im
ON eid.item_Id=im.item_Id) order by eid.employee_id;

----- 5 query------
SELECT issue_Id, eid.employee_id, employee_name
FROM employee_master em INNER JOIN  employee_issue_details eid
ON em.employee_id=eid.employee_id order by issue_Id;

----- 6 query ----
SELECT employee_id, employee_name
FROM employee_master
WHERE employee_id NOT IN ( SELECT employee_id FROM employee_card_details )
order by employee_id;

---- 7 query---
SELECT count(loan_id)  AS No_of_Cards
FROM  employee_card_details c
JOIN  employee_master e
ON    c.employee_id = e.employee_id
WHERE e.employee_name= 'ms'
GROUP BY c.employee_id;

---- 8 query---

SELECT count(employee_id)  Count_stationary
FROM  employee_card_details ecd INNER JOIN  loan_card_master lcd
ON ecd.loan_id=lcd.loan_id
WHERE  loan_type='stationary'

--- 9 query ------

SELECT eid.employee_id, employee_name, count(item_Id) Count
FROM  employee_master em INNER JOIN employee_issue_details eid
ON em.employee_id=eid.employee_id
GROUP BY employee_id order by count DESC, eid.employee_id;

--- 10 query----
SELECT eid.employee_id, employee_name
FROM employee_master em INNER JOIN employee_issue_details eid
ON em.employee_id=eid.employee_id
INNER JOIN item_master im
ON eid.item_id=im.item_ID
WHERE iteam_valuation=(SELECT min(iteam_valuation)
FROM employee_issue_details eid INNER JOIN item_master im
ON eid.item_id=im.item_ID)
order by eid.employee_id;

--- 11 query----
SELECT em.employee_id, employee_name, sum(iteam_valuation) TOTAL_VALUATION
FROM employee_master em INNER  JOIN employee_issue_details eid
ON em.employee_id=eid.employee_id
INNER JOIN item_master im
ON eid.item_id=im.item_ID
GROUP BY eid.employee_id
ORDER BY eid.employee_id;

--- 12 query----
SELECT DISTINCT eid.employee_id,employee_name
FROM  employee_issue_details eid JOIN employee_master em
ON eid.employee_id=em.employee_id
WHERE datediff(return_date,issue_date) >  365
order by eid.employee_id;

---- 13 query ---
SELECT eid.employee_id, employee_name, count(eid.item_ID) COUNT_ITEMS
FROM employee_issue_details eid JOIN item_master im
ON eid.item_id=im.item_ID
JOIN employee_master em
ON eid.employee_id=em.employee_id
WHERE item_category='sasa'
GROUP BY employee_id
HAVING COUNT_ITEMS>1
order by eid.employee_id;

----14 query ----
SELECT gender , count(gender) No_of_Employees
FROM employee_master
GROUP BY gender ORDER BY gender

--- 15 query---
SELECT employee_id, employee_name
FROM employee_master
WHERE extract(year from date_of_joining)>2010
order by employee_id;

----16 query ----
SELECT  issue_status, count(item_ID) No_of_Furnitures
FROM item_master
WHERE  item_category='sasa'
GROUP BY issue_status
ORDER BY issue_status

---- 17 query----
SELECT item_category, item_mode,item_description, count(item_description) No_of_Items 
FROM item_master
GROUP BY item_category, item_mode, item_description 
ORDER BY item_category, item_mode,item_description;
---- 18 query----
SELECT  eid.employee_id, employee_name, eid.item_ID, item_description
FROM employee_issue_details eid JOIN employee_master em
ON eid.employee_id=em.employee_id
JOIN item_master im
ON eid.item_id=im.item_ID
WHERE extract(month from issue_date)=1 and extract(year from issue_date)=2013
ORDER BY eid.employee_id, eid.item_id;

----- 19 query----
SELECT em.employee_id,employee_name, count(distinct item_category) COUNT_CATEGORY
 FROM employee_issue_details eid JOIN item_master im
ON eid.item_id=im.item_id
JOIN employee_master em
ON eid.employee_id=em.employee_id
GROUP BY employee_id
HAVING COUNT_CATEGORY>=2
ORDER BY employee_id;

---- 20 query--------------
SELECT item_ID, item_description
FROM item_master
WHERE item_id
NOT IN ( SELECT item_id from employee_issue_details)
ORDER BY item_id;

------ 21 query ----
select employee_issue_details.employee_id,
employee_master.employee_name,
sum(item_master.iteam_valuation) as TOTAL_VALUATION from
employee_issue_details inner join item_master 
onitem_master.item_ID = employee_issue_details.item_id
inner join employee_master 
onemployee_master.employee_id=employee_issue_details.employee_id
group by employee_issue_details.employee_id
order by TOTAL_VALUATION asc limit 1;

------ 22 query---
SELECT ecd.employee_id,employee_name,
card_issue_date, CASE duration_in_years
WHEN 0 THEN 'No Validity Date'
ELSE DATE_ADD(card_issue_date, INTERVAL duration_in_years YEAR)
END CARD_VALID_DATE
FROM employee_master em INNER JOIN
employee_card_details ecd
ON em.employee_id=ecd.employee_id
INNER JOIN loan_card_master lcd
ON ecd.loan_id=lcd.loan_id
order by employee_name,  CARD_VALID_DATE;

-----------23 query-----
SELECT DISTINCT a.employee_id,b.employee_name 
FROM employee_issue_details a JOIN
employee_master b ON a.employee_id=b.employee_id 
WHERE a.employee_id NOT IN(SELECT employee_id
FROM employee_issue_details WHERE (EXTRACT(YEAR FROM issue_date)=2020))
ORDER BY a.employee_id;

------------24 query-----
SELECT issue_ID, eid.employee_id, employee_name, im.item_ID, item_description,
issue_date
FROM employee_issue_details eid INNER JOIN employee_master em
ON eid.employee_id=em.employee_id
INNER JOIN item_master im
ON eid.item_id=im.item_ID
ORDER BY issue_date desc, issue_ID asc;

---------------25 query ---------------
select employee_issue_details.employee_id,
employee_master.employee_name,
sum(item_master.iteam_valuation)as TOTAL_VALUATION from
employee_issue_details inner join item_master
onitem_master.item_ID = employee_issue_details.item_id
inner join employee_master
onemployee_master.employee_id=employee_issue_details.employee_id
group by employee_issue_details.employee_id
order by TOTAL_VALUATION desc limit 2;
