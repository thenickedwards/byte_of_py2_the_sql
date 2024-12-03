-- SELECT column_name1, column_name2, column_name3 FROM table_name;

SELECT title, author FROM books;

-- ALIASES
SELECT author as book_author, title as book_title FROM books;
SELECT b.author, b.title FROM books b;

