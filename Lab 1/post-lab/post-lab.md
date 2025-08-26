### Q11. Retrieve employees hired between 01-JAN-05 and 31-DEC-06.
```sql
select *
from employees
where hire_date BETWEEN '01-JAN-05' AND '31-DEC-06'
```
<img width="998" height="371" alt="image" src="https://github.com/user-attachments/assets/84e4a345-a6c1-4c8f-ad61-b6542cf5c99b" />

### Q12. Retrieve employees who do not have a manager.
```sql
select *
from employees
where manager_id IS NULL
```
<img width="1001" height="150" alt="image" src="https://github.com/user-attachments/assets/dd139c90-37b0-4086-9dd2-ef393612bda8" />

### Q13. Retrieve employees whose salary is less than all employees earning more than 8000.
```sql
select *
from employees
where salary < ANY(
    select salary
    from employees
    where salary > 8000
)
```
<img width="986" height="357" alt="image" src="https://github.com/user-attachments/assets/a6533d67-cd6b-4d4e-be1d-3051e65b3d93" />

### Q14. Retrieve employees whose salary is greater than any salary in department 90.
```sql
select *
from employees
where salary > ANY(
    select salary
    from employees
    where department_id = 90
)
```
<img width="946" height="79" alt="image" src="https://github.com/user-attachments/assets/6d6f7a0d-8110-4114-9f1e-3221223beece" />

### Q15. Retrieve departments that have at least one employee.
```sql
select *
from departments
where department_id IN(
    select distinct department_id
    from employees
    where department_id IS NOT NULL
)

```
<img width="503" height="323" alt="image" src="https://github.com/user-attachments/assets/cd2445c1-e934-4321-8f5f-22f9204ae09f" />


### Q16. Retrieve departments that do not have any employee.
```sql
select *
from departments d
where NOT EXISTS(
    select 1
    from employees e
    where e.department_id = d.department_id
)
```
<img width="538" height="360" alt="image" src="https://github.com/user-attachments/assets/8193a7aa-e438-4ac7-ac74-2abe0a6239f2" />

### Q17. Retrieve employees whose salary is not between 5000 and 15000.
```sql
select *
from employees
where salary NOT BETWEEN 5000 AND 15000
```
<img width="967" height="404" alt="image" src="https://github.com/user-attachments/assets/8b88bdcc-3e55-4b71-9874-78f10e324422" />

### Q18. Retrieve employees who are in departments 10, 20, or 30, but not 40.
```sql
select *
from employees
where department_id IN(10, 20, 30)
And department_id != 40
```
<img width="968" height="276" alt="image" src="https://github.com/user-attachments/assets/e5946887-4b0e-4e65-964f-e5d134bc40c0" />

### Q19. Display employees whose salary is less than the minimum salary of department 50.
```sql
select *
from employees
where salary < (  
    select MIN(salary)
    from employees
    where department_id = 50
)
```

### Q20. Display employees whose salary is greater than the maximum salary of department 90.
```sql
select *
from employees
where salary > (  
    select MAX(salary)
    from employees
    where department_id = 90
)
```
