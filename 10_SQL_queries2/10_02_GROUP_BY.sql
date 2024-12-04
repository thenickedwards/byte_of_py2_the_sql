-- GROUP BY
-- SELECT column_1, column_2, AGGREGATE_FUNCTION(column_3) FROM table_name GROUP BY column_1, column_2;
-- must come after FROM and WHERE
-- ever non-aggregate column must come be in GROUP BY
-- returns one line per result set (unique combination of column_1 and column_2, i.e. non-aggregated columns)

-- GROUP BY
SELECT genre, COUNT(*) books_in_genre FROM books GROUP BY genre;

-- HAVING
-- SELECT column_1, column_2, AGGREGATE_FUNCTION(column_3) FROM table_name 
    -- GROUP BY column_1, column_2 
    -- HAVING conditional_expression; -- works on aggregated rows
SELECT genre, COUNT(*) FROM books GROUP BY genre HAVING(COUNT(*)) > 3;
SELECT genre, COUNT(*) books_in_genre FROM books GROUP BY genre HAVING books_in_genre > 3;