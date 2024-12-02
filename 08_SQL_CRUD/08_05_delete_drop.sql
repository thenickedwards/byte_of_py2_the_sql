-- DELETE A ROW
-- DELETE FROM table_name
-- WHERE some_column = some_value;

-- handling foreign keys and associated records,
-- established at TABLE creation
--  ON DELETE CASCADE = delete records
--  ON DELETE SET NULL = set FK to NULL
--  ON DELETE SET DEFAULT = revert to default value of column

-- TRUNCATE
-- deletes rows but does not drop the table;

-- DELETE A TABLE
-- DROP TABLE table_name;
-- deletes the table and all rows;

-- DELETE A DATABASE
-- DROP DATABASE database_name;
-- deletes entire database;