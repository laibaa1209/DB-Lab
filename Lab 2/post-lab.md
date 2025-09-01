```sql
--pad employees name with aestriks on left
select first_name, lpad(first_name, 15, '*') as padded_name from employees;

--remove leading spaces from oracle
select ltrim('     oracle') from dual;

--first letter capitalized
select first_name, initcap(first_name) as capitalized_name from employees;

--next monday after 20th August 2022
select next_day('20-AUG-2022', 'MONDAY') from dual;

--Convert '25-DEC-2023'(string) to a date and display it in MM-YYYY format.
select to_char(to_date('25-DEC-2023', 'DD-MM-YYYY'), 'MM-YYYY') from dual;

--distinct salary in ascending order
select distinct salary from employees order by(salary) asc;

--rounded salary to 100 decimal places of employees
select salary, round(salary, -2) as rounded_salary from employees;

--Q18. Find the department that has the maximum number of employees.
select department_id, num_employees
from (
    select department_id,
           count(*) as num_employees
    from employees
    group by department_id
    order by num_employees desc
)
where rownum = 1;

--Find the department that has the minimum number of employees.
select department_id, num_employees
from (
    select department_id,
           count(*) as num_employees
    from employees
    group by department_id
    order by num_employees asc
)
where rownum = 1;

--Q19. Find the top 3 highest-paid departments by total salary expense.
select *
from(
    select department_id, sum(salary) as total_salary from employees group by department_id order by total_salary desc
) where rownum <= 3;
```
