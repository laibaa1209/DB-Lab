# SQL queries and output
### Q1. Write a SQL query to retrieve employees who are not in department 100.
```sql
select *
from Employees
where department_id <> 100
```
<img width="1000" height="382" alt="image" src="https://github.com/user-attachments/assets/f11bf340-d240-4bc6-9553-408c3a5d9554" />

### Q2. Write a SQL query to retrieve whose salary is either 10000 , 12000 or 15000.
```sql
select * 
from Employees 
where salary IN(10000, 12000, 15000)
```
<img width="1021" height="184" alt="image" src="https://github.com/user-attachments/assets/2cecea00-9e49-49bb-86e0-681dd75d0939" />

### Q3. Write a SQL query to display the first name and salary of employees whose salary is less than OR equal to 25000.
```sql
select first_name, salary
from Employees 
where salary <= 25000
```
<img width="262" height="390" alt="image" src="https://github.com/user-attachments/assets/4f294641-e0cc-492c-83a2-31e1ec8d339f" />

### Q4. Write a SQL query to retrieve employees who are not in department 60.
```sql
select *
from Employees
where department_id <> 60
```
<img width="1016" height="414" alt="image" src="https://github.com/user-attachments/assets/0b936404-6fee-4d94-94cc-2f0f863ebb9d" />

### Q5. Write a SQL query retrieve employees who are in between department 60 to 80.
```sql
select *
from Employees
where department_id BETWEEN 80 AND 80
```
<img width="994" height="397" alt="image" src="https://github.com/user-attachments/assets/ac11e94b-b42b-42b5-90b1-519cd4b93bbe" />

### Q6. Display all details of departments.
```sql
select *
from departments
```
<img width="613" height="441" alt="image" src="https://github.com/user-attachments/assets/613e2399-f4ba-450c-9086-a022a643f232" />

### Q7. Retrieve employees whose first name is "Steven".
```sql
select *
from employees
where first_name = 'Steven'
```
<img width="966" height="114" alt="image" src="https://github.com/user-attachments/assets/2ff28f02-7e88-475c-88c8-616911612d42" />

### Q8. Display employees who earn between 15000 and 25000 and work in department 80.
```sql
select *
from Employees
where salary BETWEEN 15000 AND 25000
AND department_id = 80
```
<img width="875" height="95" alt="image" src="https://github.com/user-attachments/assets/bc49ecf0-42ee-4b23-bee3-7a84ac063347" />

### Q9. Display employees who earn less than the salary of any employee in department 100.
```sql
select *
from Employees
where salary < ANY(
    select salary 
    from employees 
    where department_id = 100
)
```
<img width="966" height="418" alt="image" src="https://github.com/user-attachments/assets/46e6ea96-3ead-49ed-95c0-5b2c755b177c" />

### Q10. Display employees whose department ID is unique in the employees table.
```sql
select DISTINCT department_id
from employees
```
<img width="432" height="367" alt="image" src="https://github.com/user-attachments/assets/18a213a9-789b-49a9-88a9-2b0f049f4d81" />


