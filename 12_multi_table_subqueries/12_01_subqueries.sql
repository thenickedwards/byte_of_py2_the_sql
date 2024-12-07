-- SUBQUERIES
-- Nested query for filtering
-- EXISTS, ANY, ALL, IN, NOT IN

-- EXISTS
-- used between WHERE and subquery
SELECT select_list FROM table_name
WHERE EXISTS (
    nested_subquery
);

SELECT bs.author FROM best_sellers bs
WHERE EXISTS (
    SELECT DISTINCT pb.author FROM president_books pb
    WHERE pb.author = bs.author
)

-- ANY, ALL, IN, NOT IN
-- compare some value to a subquery result set
SELECT select_list FROM table_name
WHERE some_value 
    [IN | NOT IN | conditional ALL | condtiional ANY] (
    nested_subquery
);

-- IN
-- NOT IN returns opposite result
SELECT b.author FROM best_sellers b
WHERE b.author IN (
    SELECT DISTINCTpresident FROM president_books
);

-- ANY, ALL
-- Preceded by comparison operator <, <=, =, !=, >, >=
-- Checks against each value in subquery result set and
-- returns true if any comparison evaluates to true, otherwise false
SELECT b.author, b.year FROM best_sellers b
WHERE b.year < ANY (
    SELECT pb.year FROM president_books pb
);

SELECT b.author FROM best_sellers b
WHERE b.author > ALL (
    SELECT pb.president FROM president_books pb);

