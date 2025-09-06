```sql
--testing unqiue contraint on bonus
alter table employees 
add constraint unique_bonus UNIQUE(bonus);

insert into employees(emp_id, bonus) values (2, 2000);
insert into employees(emp_id, bonus) values (3, 2000);
<img width="683" height="153" alt="image" src="https://github.com/user-attachments/assets/fdccf8f3-a0a3-4cb6-8a95-f4ae1f4aea4f" />

--creating dept table
create table departments(
    dept_id int primary key,
    dept_name varchar(5)unique
);

--testing unqiue contraint on bonus
alter table employees 
add constraint unique_bonus UNIQUE(bonus);

insert into employees(emp_id, bonus) values (2, 2000);
insert into employees(emp_id, bonus) values (3, 2000);

--date of birth column in employees and age constraint.
alter table employees add dob date;

create or replace trigger trg_check_age
before insert or update on employees
for each row
begin
   if MONTHS_BETWEEN(sysdate, :NEW.dob) < 12*18 then
      RAISE_APPLICATION_ERROR(-20001, 'Employee must be at least 18 years old.');
   end if;
end;

insert into employees (emp_id, full_name, salary, dept_id, dob)
--testing the value
values (10, 'Underage Test', 25000, 1, add_months(sysdate, -12*15));

--dropping foreign key
-- Drop foreign key
alter table employees
drop constraint emp_dept_fk;

-- Insert with non-existing dept_id (e.g., 999)
insert into employees (emp_id, full_name, salary, dept_id, bonus, dob)
values (104, 'Bilal', 27000, 999, 4000, DATE '1995-06-10');

-- Re-add foreign key
alter table employees
add constraint emp_dept_fk foreign key(dept_id)
references departments(dept_id);

--dropping city and age columns 
alter table employees drop column city;
alter table employees drop column age;

--selecting employees from depratment
select dept_id, dept_name
from departments d
where exists (
    select 1 
    from employees e 
    where e.dept_id = d.dept_id
);

--renaming column
alter table employees rename column salary to monthly_salary;

select dept_id, dept_name
from departments d
where not exists (
    select 1 from employees e where e.dept_id = d.dept_id
);

truncate table students;

select dept_id
from employees
group by dept_id
having count(*) = (
    select max(count(*))
    from employees
    group by dept_id
);

```
