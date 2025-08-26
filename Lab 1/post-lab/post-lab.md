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

```
### Q14. Retrieve employees whose salary is greater than any salary in department 90.

```sql

```
### Q15. Retrieve departments that have at least one employee.

```sql

```
### Q16. Retrieve departments that do not have any employee.

```sql

```
### Q17. Retrieve employees whose salary is not between 5000 and 15000.
```sql

```
### Q18. Retrieve employees who are in departments 10, 20, or 30, but not 40.

```sql

```
### Q19. Display employees whose salary is less than the minimum salary of department 50.

```sql

```
### Q20. Display employees whose salary is greater than the maximum salary of department 90.

```sql

```
