Create database Employee;
use Employee;
create table data_science_team
(
 Emp_id varchar(5) primary	key,
 first_name varchar(30),
 last_name varchar(30),
 Gender char(1),
 Emp_Role varchar(50),
 Dept varchar(50),
 Exp tinyint,
 Country varchar(50),
 Continent varchar(50)
 );
 
create table emp_record
(
 Emp_id varchar(5) primary	key,
 first_name varchar(30),
 last_name varchar(30),
 Gender varchar(2),
 Emp_Role varchar(50),
 Dept varchar(50),
 Exp tinyint,
 Country varchar(50),
 Continent varchar(50),
 Salary int,
 Emp_rating tinyint,
 Manager_id varchar(10),
 Project_id varchar(10)
 );
 
 create table proj_table 
 (
  Project_ID varchar(10) Primary key not null,
  Proj_name varchar(100),
  domain varchar(50),
  start_date date,
  closure_date date,
  Dev_qtr char(2),
  Status varchar(15)
  );
  


 