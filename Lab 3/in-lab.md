```sql
--creating dept table
create table departments(
    dept_id int primary key,
    dept_name varchar(5)unique
);

--inserting into dept table
insert into departments values(1, 'HR');
insert into departments values(2, 'PR');
insert into departments values(3, 'AI');

--creating tbale employees
create table employees(
    emp_id int primary key, 
    emp_name varchar(10), 
    salary int check(salary>20000), 
    dept_id int, 
    foreign key(dept_id) references departments(dept_id)
);

--renaming column 
alter table employees 
rename column emp_name to full_name;

--finding constraint anme to drop it.
select constraint_name from user_constraints where table_name = 'EMPLOYEES' and constraint_type = 'C';

--dropping it
alter table employees drop constraint sys_c007036;

--insert values into employee table
insert into employees(emp_id, full_name, salary, dept_id) values (1, 'laiba', 5000, NULL);

--Adding Foreign Key
alter table employees add constraint fk_emp_dept foreign key(dept_id) references departments(dept_id);

--Q6. Add a new column bonus NUMBER(6,2) in employees with a default value of 1000.
alter table employees add bonus number(6) default 1000;

--Q7. Forgot to add city have default value Karachi and age column(should be greater than 18).
alter table employees add city varchar(10) default 'Karachi';
alter table employees add age number check(age>18);

select * from employees;

--Q8. Delete records have id 1 and id 3.
Delete from employees where emp_id IN(1,3);

--Q9. Change the length of full_name and city column length must be 20 characters.
alter table employees modify city varchar(20);
alter table employees modify full_name varchar(20);

--Q10.Add email column and set unique constraint.
alter table employees add email varchar(30;
alter table employees add constraint email_unique unique(email);
```
