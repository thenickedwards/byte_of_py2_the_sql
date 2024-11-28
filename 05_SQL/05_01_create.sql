-- CREATE TABLE table_name (
--     column1 datatype column_constraints,
--     column2 datatype column_constraints,
--     column3 datatype column_constraints
-- );

'''
Python Types    | Postgres Types
int             | INTEGER, INT
[sequential] int| SERIAL
float           | NUMERIC, DECIMAL
str             | TEXT
str [len() = x] | CHARACTER(X)
bool            | BOOLEAN, BOOL
datetime        | TIMESTAMP
'''
-- CREATE TABLE users (
--     id SERIAL,
--     username TEXT NOT NULL,
--     password TEXT NOT NULL,
--     PRIMARY KEY (id)
-- );