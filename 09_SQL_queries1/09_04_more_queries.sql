-- ORDER BY
SELECT b.author, b.title FROM books b ORDER BY b.author, b.year DESC;

-- ORDER BY (must come after WHERE)
SELECT b.author, b.title FROM books b 
    WHERE b.year > 2000
    ORDER BY b.author ASC, b.year DESC; -- ASC by default

-- -- -- -- -- 
-- "PROFILING" BOOKS TABLE

SELECT * FROM books;

SELECT title, year FROM books;

SELECT title AS book_title, year AS book_year FROM books;

SELECT title AS book_title, year AS book_year FROM books
ORDER BY book_year DESC;

SELECT title AS book_title, year AS book_year FROM books
WHERE title LIKE 'B%'
ORDER BY book_year DESC;