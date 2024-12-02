-- ALTER TABLE table_name
-- ADD new_column_name datatype;
-- DROP COLUMN column_to_delete_name;
-- RENAME COLUMN old_column_name to new_column_name;

ALTER TABLE cars ADD COLUMN wheel_count INT NOT NULL DEFAULT 4;
-- note: bc NOT NULL constraint, must define values for existing rows