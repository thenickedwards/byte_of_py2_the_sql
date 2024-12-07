
-- UNION
-- UNION operator combines the results from two SELECT queries
-- Removes duplicates returns, combined set
-- SELECT statements must have 
    -- same number of columns, 
    -- same order of columns, and 
    -- compatible data types for corresponding columns
SELECT column1 FROM table1 
    UNION 
SELECT column2 FROM table2;

-- UNION ALL
-- Similar to UNION, but allows duplicates
SELECT title, president AS author FROM president_books
    UNION ALL
SELECT title, author FROM nyt_best_sellers;

-- INTERSECT
-- Returns the intersection of two sets
-- i.e. only returns duplicates (removes unique rows)
SELECT select_list_1 FROM table1
    INTERSECT
SELECT select_list_1 FROM table2;

-- EXCEPT
-- Returns the set difference
-- i.e. only returns first result set after eliminaging any rows matching those of second result set
SELECT select_list_1 FROM table1
    EXCEPT
SELECT select_list_1 FROM table2;