```sql
--total salary of employees
select sum(salary) as total_salary from employees;

--avg salary of employees
select avg(salary) as avg_salary from employees;

--number of employees reporting to each manager
select count(*) as total_employees, manager_id from employees group by(manager_id);

--employees with lowest salary
select * from employees where salary = (select min(salary)from employees);

--system date display
select to_char(sysdate, 'DD-MM-YY') from dual;

--system date full display
select to_char(sysdate, 'DAY MONTH YYYY') from dual;

--all employees hired on wednesday
select first_name, hire_date from employees where 'WEDNESDAY' = to_char(hire_date, 'DAY');

--months between 01-JAN-2025 and 01-OCT-2024.
select months_between('01-JAN-2025','01-OCT-2024') from dual;

--how many months has each employee worked in a company
select employee_id,first_name || last_name, round(months_between(sysdate,hire_date)) as months_worked from employees;

--first 5 characters from each employees last name
select last_name, substr(last_name, 1, 5) as extracted_name from employees;
```
