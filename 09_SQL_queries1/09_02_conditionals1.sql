-- WHERE
SELECT title, author FROM books 
    WHERE genre = "Novel";

-- WHERE with LOGICAL OPERATORS
SELECT title, author, year FROM books 
    WHERE genre = "Novel"
    AND year < 1900;

-- DISTINCT
SELECT DISTINCT genre FROM books;

-- LIMIT
SELECT DISTINCT author FROM books LIMIT 5;

