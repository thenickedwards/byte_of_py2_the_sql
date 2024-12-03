--  BETWEEN
SELECT b.title AS 20th_C_books FROM books b WHERE b.year BETWEEN 1900 AND 1999;

-- LIKE
SELECT b.title FROM books b WHERE b.title LIKE '%World According%';
-- * wildcard = 0 or more characters
-- _ wildcard = 1 character

-- ILIKE, pattern matching case insensitive
SELECT b.title FROM books b WHERE b.title ILIKE '%The%';

-- IN
SELECT b.title, b.year FROM books b WHERE b.year IN (1982, 1986, 2022);

