-- AGGREGATE FUNCTIONS
-- e.g. COUNT, MAX, MIN, SUM, AVG

-- COUNT
SELECT COUNT(*) FROM books;
SELECT COUNT(DISTINCT genre) FROM books;

-- MIN & MAX
SELECT MIN(b.year) as year_of_oldest_book, MAX(b.year) as year_of_newest_book FROM books b;

-- SUM & AVG
SELECT SUM(b.price) as all_books_gross_price, AVG(b.price) as avg_price FROM books b;