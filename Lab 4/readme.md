```sql
-- Q1: Students per department
SELECT department_id, COUNT(*) AS student_count
FROM students GROUP BY department_id;

-- Q2: Departments with avg GPA > 3.0
SELECT department_id, AVG(gpa) AS avg_gpa
FROM students GROUP BY department_id HAVING AVG(gpa) > 3.0;

-- Q3: Avg fee per course
SELECT course_id, AVG(fee) AS avg_fee
FROM students GROUP BY course_id;

-- Q4: Faculty count per department
SELECT department_id, COUNT(*) AS faculty_count
FROM faculty GROUP BY department_id;

-- Q5: Faculty with salary > avg salary
SELECT faculty_id, name, salary
FROM faculty WHERE salary > (SELECT AVG(salary) FROM faculty);

-- Q6: Students with GPA > at least one CS student
SELECT student_id, name, gpa
FROM students
WHERE gpa > ANY (SELECT gpa FROM students WHERE department_id = 'CS');

-- Q7: Top 3 students by GPA
SELECT student_id, name, gpa
FROM students ORDER BY gpa DESC FETCH FIRST 3 ROWS ONLY; -- or LIMIT 3

-- Q8: Students enrolled in all courses Ali is enrolled in
SELECT s.student_id, s.name
FROM students s
WHERE NOT EXISTS (
    SELECT course_id FROM enrollments
    WHERE student_id = (SELECT student_id FROM students WHERE name='Ali')
    MINUS
    SELECT course_id FROM enrollments e WHERE e.student_id = s.student_id
);

-- Q9: Total fees per department
SELECT department_id, SUM(fee) AS total_fees
FROM students GROUP BY department_id;

-- Q10: Courses of students with GPA > 3.5
SELECT DISTINCT course_id, course_name
FROM courses
WHERE course_id IN (
    SELECT course_id
    FROM enrollments
    WHERE student_id IN (
        SELECT student_id
        FROM students
        WHERE gpa > 3.5
    )
);


-- Q11: Departments with total fees > 1M
SELECT department_id, SUM(fee) AS total_fees
FROM students GROUP BY department_id HAVING SUM(fee) > 1000000;

-- Q12: Departments with >5 faculty earning >100k
SELECT department_id, COUNT(*) AS rich_faculty
FROM faculty WHERE salary > 100000
GROUP BY department_id HAVING COUNT(*) > 5;

-- Q13: Delete students with GPA < avg GPA
DELETE FROM students WHERE gpa < (SELECT AVG(gpa) FROM students);

-- Q14: Delete courses with no enrollments
DELETE FROM courses
WHERE course_id NOT IN (SELECT DISTINCT course_id FROM enrollments);

-- Q15: Copy students with fee > avg into HighFee_Students
INSERT INTO HighFee_Students
SELECT * FROM students WHERE fee > (SELECT AVG(fee) FROM students);

-- Q16: Insert faculty into Retired_Faculty if joined before min date
INSERT INTO Retired_Faculty
SELECT * FROM faculty
WHERE joining_date < (SELECT MIN(joining_date) FROM faculty);

-- Q17: Department with max total fee
SELECT department_id, SUM(fee) AS total_fees
FROM students GROUP BY department_id
ORDER BY total_fees DESC FETCH FIRST 1 ROW ONLY; 

-- Q18: Top 3 courses by enrollments
SELECT course_id, COUNT(*) AS total_enrolled
FROM enrollments GROUP BY course_id
ORDER BY total_enrolled DESC FETCH FIRST 3 ROWS ONLY; 

-- Q19: Students in >3 courses and GPA > avg GPA
SELECT s.student_id, s.name, s.gpa
FROM students s JOIN enrollments e ON s.student_id=e.student_id
GROUP BY s.student_id, s.name, s.gpa
HAVING COUNT(e.course_id) > 3
   AND s.gpa > (SELECT AVG(gpa) FROM students);

-- Q20: Faculty not teaching any course → Unassigned_Faculty
INSERT INTO Unassigned_Faculty
SELECT f.* FROM faculty f
WHERE f.faculty_id NOT IN (SELECT DISTINCT faculty_id FROM courses);
```
