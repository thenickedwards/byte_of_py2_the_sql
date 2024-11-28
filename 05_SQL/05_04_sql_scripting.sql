-- week1_script.sql
CREATE TABLE categories (
    id SERIAL,
    name TEXT NOT NULL UNIQUE,
    description TEXT,
    picture TEXT,
    PRIMARY KEY (id)
);

CREATE TABLE products (
    id SERIAL,
    name TEXT NOT NULL,
    discontinued BOOLEAN NOT NULL,
    category_id INT,
    PRIMARY KEY (id)
);

ALTER TABLE products
ADD CONSTRAINT fk_products_categories FOREIGN KEY (category_id) REFERENCES categories;

-- cat 05_04_sql_scripting.sql | docker exec -i pg_container psql -d week1
-- cat 05_SQL/05_04_sql_scripting.sql | docker exec -i pg_container psql -d week1