-- JOIN
SELECT select_list
    FROM left_table
    [INNER | LEFT | RIGHT | FULL] JOIN right_table
        ON left_column = right_column;

SELECT a.name AS author, 
        b.name AS book
FROM authors a
INNER JOIN books_authors ba     -- with bridge table
    ON a.id = ba.author_id
INNER JOIN books b
    ON b.id = ba.book_id

-- FULL JOIN SAME AS UNION ALL