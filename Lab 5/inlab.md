-- Q1. All possible pairs of employees and departments
SELECT e.emp_name, d.dept_name
FROM Employees e
CROSS JOIN Departments d;

-- Q2. Show all departments and employees (even if none assigned)
SELECT d.dept_name, e.emp_name
FROM Departments d
LEFT JOIN Employees e ON d.dept_id = e.dept_id;

-- Q3. Employee names with their manager names
SELECT e.emp_name AS Employee, m.emp_name AS Manager
FROM Employees e
LEFT JOIN Employees m ON e.manager_id = m.emp_id;

-- Q4. Employees not assigned any project
SELECT e.emp_name
FROM Employees e
LEFT JOIN Projects p ON e.emp_id = p.emp_id
WHERE p.project_id IS NULL;

-- Q5. Student names with their enrolled course names
SELECT s.student_name, c.course_name
FROM Students s
JOIN Courses c ON s.course_id = c.course_id;

-- Q6. Customers with their orders (include customers with none)
SELECT c.customer_name, o.order_id
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id;

-- Q7. Departments and employees (include departments without employees)
SELECT d.dept_name, e.emp_name
FROM Departments d
LEFT JOIN Employees e ON d.dept_id = e.dept_id;

-- Q8. All pairs of teachers and subjects (whether taught or not)
SELECT t.teacher_name, s.subject_name
FROM Teachers t
CROSS JOIN Subjects s;

-- Q9. Departments with total employees
SELECT d.dept_name, COUNT(e.emp_id) AS total_employees
FROM Departments d
LEFT JOIN Employees e ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

-- Q10. Each student, their course, and teacher
SELECT s.student_name, c.course_name, t.teacher_name
FROM Students s
JOIN Courses c ON s.course_id = c.course_id
JOIN Teachers t ON c.teacher_id = t.teacher_id;

-- Q11. Students and teachers from the same city
SELECT s.student_name, t.teacher_name, s.city
FROM Students s
JOIN Teachers t ON s.city = t.city;

-- Q12. Employees and their manager names (include employees without managers)
SELECT e.emp_name AS Employee, m.emp_name AS Manager
FROM Employees e
LEFT JOIN Employees m ON e.manager_id = m.emp_id;

-- Q13. Employees without a department
SELECT emp_name
FROM Employees
WHERE dept_id IS NULL;

-- Q14. Average salary in each department (avg > 50,000)
SELECT d.dept_name, AVG(e.salary) AS avg_salary
FROM Departments d
JOIN Employees e ON d.dept_id = e.dept_id
GROUP BY d.dept_name
HAVING AVG(e.salary) > 50000;

-- Q15. Employees earning more than dept average salary
SELECT e.emp_name, e.salary, d.dept_name
FROM Employees e
JOIN Departments d ON e.dept_id = d.dept_id
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM Employees e2
    WHERE e2.dept_id = e.dept_id
);

-- Q16. Departments where no employee earns less than 30,000
SELECT d.dept_name
FROM Departments d
JOIN Employees e ON d.dept_id = e.dept_id
GROUP BY d.dept_name
HAVING MIN(e.salary) >= 30000;

-- Q17. Students and courses where student city = 'Lahore'
SELECT s.student_name, c.course_name
FROM Students s
JOIN Courses c ON s.course_id = c.course_id
WHERE s.city = 'Lahore';

-- Q18. Employees with their manager & department (hire_date range)
SELECT e.emp_name, m.emp_name AS Manager, d.dept_name, e.hire_date
FROM Employees e
LEFT JOIN Employees m ON e.manager_id = m.emp_id
JOIN Departments d ON e.dept_id = d.dept_id
WHERE e.hire_date BETWEEN '2020-01-01' AND '2023-01-01';

-- Q19. Students enrolled in courses taught by 'Sir Ali'
SELECT s.student_name, c.course_name
FROM Students s
JOIN Courses c ON s.course_id = c.course_id
JOIN Teachers t ON c.teacher_id = t.teacher_id
WHERE t.teacher_name = 'Sir Ali';

-- Q20. Employees whose manager is from the same department
SELECT e.emp_name, m.emp_name AS Manager, d.dept_name
FROM Employees e
JOIN Employees m ON e.manager_id = m.emp_id
JOIN Departments d ON e.dept_id = d.dept_id
WHERE e.dept_id = m.dept_id;

