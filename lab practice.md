```sql
--total count of rows 
select count(*)
as total_employees
from employees;

--When you  want the quantity in a certain dept/area
select count(*)
as total_employess, manager_id
from employees
group by(manager_id);

--give unqiue values
select distinct manager_id
from employees;

--unique value using groupby
select manager_id
from employees
group by(manager_id);

--total salary of all the employees
select sum(salary)
as total_salary
from employees;

select min(salary)
as min_salary
from employees;

select max(salary)
as max_salary
from employees;

select avg(salary)
as avg_salary
from employees;

--concatenate opeartor joins two columns and show them as 1.
select first_name || last_name 
as full_name 
from employees;

--gets all the values
select ALL salary
from employees;

select salary
from employees;

--get ascending and  descending values
select salary
from employees
order by(salary) asc; --asecnding order

select first_name, hire_date 
from employees
order by(first_name) desc; --descending order

--using them together means it gives prioriy to the 1st one, if there are conflicts in the first one then it sorts by the 2nd parameter
select salary, department_id
from employees
order by salary asc, department_id desc;

--like operator used for searching purpose
--the % sign means that there can be a value after that letter
select first_name
from employees
where first_name like 'A__n%';

select first_name 
from employees
where first_name like '%k%';

-- --MATHEMATICTS OPERATIONS--
--a dummy table provided by sql to perform math operations rather then performing them in expert system
select * 
from dual;

--return a +ve value, the dual created a atble and now all these math opeartions will give answer in this dual dummy table
select abs(-90.5) 
from dual;

--returns 1 value higher
select ceil(90.3) --ans 91
from dual;

select ceil(-90.3) --ans -90 
from dual;

--returns 1 value lower
select floor(90.3) --ans 90
from dual;

select floor(-90.3) --ans -91
from dual;

--truncate returns all decimals or your speicied decimal places
select trunc(80.7236814) --ans 80
from dual;

select trunc(80.7236814, 4) --ans 80.7236
from dual;

--rounds off
select round(86.9372)
from dual;

--selects least and greatst functions
select least(80, 60, 70, 1)
from dual;

select greatest(80, 60, 70, 1)
from dual;

-- --STRING FUNCTIONS--
--lowers the value
select lower('Laiba')
from dual;

--lowers and returns whole columns first name
select first_name 
,lower(first_name)
from employees;

select first_name 
,greatest(first_name)
from employees;

--Captilize the first letter of ever word 
select INITCAP('the soap')
from dual;

--returns length of word
select length('laiba') 
from dual;

select first_name
,length(first_name)
from employees;

--ltrim and rtrim removes spaces from left and right
select ltrim('    laiba')
from dual;

--substr(value, position, total no of char)
select substr('laiba binte zia', 7, 8)
from dual;

--lpad and rpad gives you the word you want to form and fills the rest of spaces with what you specify
--lpad(value, num of char total, rest of the char spaces)
--lpad fills aestrik at left and rpad will fill asterik at right
select lpad('good', 7, '*')
from dual;

select rpad('good', 7, '*')
from dual;

--DATE FUNCTIONS--
--add months gives the date (the date you want from, month). 
select add_months('12-nov-2003', 1) --12th dec 2003
from dual;

--MONTH_BETWEEN Function differences between the given month
--first valueshould be big and last value small or else neg result
select months_between('12-dec-2024', '9-sep-2024')
from dual;

--next day tells you the date after this day, it means after 12 dec which date will friday fall on.
select next_day('12-dec-2025', 'friday')
from dual;

--last day
--It is used to determine the number of days remaining in a month from the date ‘x’ specified
select last_day('12-dec-2025')
from dual;

--New time(WHAT IS THIS STUPID SHIT) 
--Returns the date and time in zone2 if date ‘x’ represents the time in zone1.
select new_time('12-dec-2024', 'PST', 'EST')
from dual;

-- --CONVERSIONS--
--to char converts numeric and date values to string values.
select to_char(sysdate, 'DD-MM-YY')
from dual;
```

# Lab 3:

```sql
--table->schema
--rows->tuple
--columns->attributes
--contraints->2 types: table level and column level
create table students(
id int primary key ,
std_name varchar(3),
email varchar(20),
age int ,
check(age>=18) --constraint on age column.
);

select * from students;

--forgot to add 2 or 3 columns. then how to add 2 columns or more than 2 cols together? means you are performing alteration in the table which is complex.
alter table students add salary int;

alter table students add (city varchar(20) default 'Karachi', dept_id int);
select * from students;

--forgot to keep email unique and not null
alter table students add CONSTRAINT unique_email unique(email);
alter table students modify(std_name varchar(20) not null, email varchar(300) not null);

--to add multiple constraints
alter table students add ( Constraint 
check_age check(age between 18 and 30),
constraint unqiue_email unique(email)
);

create table departments(
id int primary key,
dept_name varchar(20) not null
);

select * from departments;
insert into DEPARTMENTS(id, dept_name) values(3, 'AI');
select * from departments;
truncate table departments;

SELECT * FROM STUDENTS;
alter table students drop column dept_id;

alter table students add(dept_id int, foreign key(dept_id), refrences departments(id));
insert into students(id, std_name, std_email, age, city, salary, dept_id)
values
(4, 'Bilal', 'bt1209@gmail.com',21, 'Lahore', 300000, 2);
--alter table students rename column email to std_email;
SELECT * FROM STUDENTS; ```
select to_char(sysdate, 'month')
from dual;

select first_name, hire_date
from employees
where 'Wednesday' = to_char(hire_date, 'Day');
```
