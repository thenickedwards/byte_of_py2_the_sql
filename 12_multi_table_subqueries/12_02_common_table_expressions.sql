-- Common Table Expressions
    -- WITH used to form temp result sets
        -- Called common table expressions (CTEs)
    -- Breaks down complex queries into simpler parts
    -- Base query can leverage data in temp table
    -- Does not create new table
        -- Table cleared from memory after query completed

WITH cte_temp_table AS ( 
    nested_query 
)
base_query;

-- -- -- -- -- 

SELECT  last_name FROM professors
    UNION ALL
SELECT last_name FROM students;

WITH all_names AS (
    SELECT  last_name FROM professors
        UNION ALL
    SELECT last_name FROM students
)
SELECT last_name, COUNT(*)
FROM all_names
    GROUP BY last_name;

WITH all_names AS (
    SELECT  last_name FROM professors
        UNION ALL
    SELECT last_name FROM students
)
SELECT last_name, COUNT(*)
FROM all_names
    GROUP BY last_name
    HAVING COUNT(*) > 1; -- LOCATE DUPES

-- -- -- -- -- 

SELECT first_name, last_name, department_id FROM professors;
    UNION ALL
SELECT first_name, last_name, major_department_id FROM students;

SELECT 'professor' AS occupation, first_name, last_name, department_id 
    FROM professors
    UNION ALL
SELECT 'student' AS occupation, first_name, last_name, major_department_id
    FROM students;

WITH people AS (
    SELECT 'professor' AS occupation, first_name, last_name, department_id    
        FROM professors
        UNION ALL
    SELECT 'student' AS occupation, first_name, last_name, major_department_id
        FROM students;
)
SELECT occupation, first_name, last_name, d.code
    FROM people
    JOIN departments d
        ON department_id = d.id;

WITH PEOPLE AS (
    SELECT 'professor' AS occupation, first_name, last_name, department_id
        FROM professors
            UNION ALL
    SELECT 'student' AS occupation, first_name, last_name, major_department_id
        FROM students;
)
SELECT occupation, first_name, last_name, d.code
    FROM people
    LEFT JOIN departments d
        ON department_id = d.id;