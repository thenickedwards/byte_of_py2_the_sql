SELECT * FROM departments;
SELECT * FROM professors;
SELECT * FROM students;

SELECT s.last_name FROM students s
UNION
SELECT p.last_name FROM professors p; -- 19 records

SELECT s.last_name FROM students s
UNION ALL
SELECT p.last_name FROM professors p; -- 22 records

SELECT s.last_name FROM students s
UNION ALL
SELECT p.last_name FROM professors p
ORDER BY last_name;

SELECT s.first_name, s.last_name, d.name
FROM departments d
INNER JOIN students s
ON d.id = s.major_department_id;

SELECT s.first_name, s.last_name, d.name
FROM departments d
RIGHT JOIN students s
ON d.id = s.major_department_id;

SELECT s.first_name, s.last_name, d.name
FROM departments d
FULL JOIN students s
ON d.id = s.major_department_id;