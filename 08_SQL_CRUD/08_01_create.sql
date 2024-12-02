-- CREATE TABLE new_table_name (
--     column1 datatype column_constraints,
--     column2 datatype column_constraints,
--     column3 datatype column_constraints
-- );

CREATE TABLE cars (
    id SERIAL PRIMARY KEY, -- implicitly UNIQUE and NOT NULL
    year INT,
    make TEXT NOT NULL,
    model TEXT NOT NULL
);