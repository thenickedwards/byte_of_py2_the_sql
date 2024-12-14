-- FORWARD MIGRATION
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT
);
-- ROLLBACK MIGRATION
DROP TABLE customers;

-- -- -- -- -- 

-- FORWARD MIGRATION
ALTER TABLE customers
    ADD COLUMN date_of_birth DATE;
-- ROLLBACK MIGRATION
ALTER TABLE customers
    DROP COLUMN date_of_birth;

-- -- -- -- -- 

-- FORWARD MIGRATION
ALTER TABLE customers
    ALTER COLUMN email SET NOT NULL;
-- ROLLBACK MIGRATION
ALTER TABLE customers
    ALTER COLUMN email DROP NOT NULL;

-- -- -- -- -- 

-- FORWARD MIGRATION
ALTER TABLE customers
    ALTER COLUMN email SET NOT NULL;
-- ROLLBACK MIGRATION
ALTER TABLE customers
    ALTER COLUMN email DROP NOT NULL;
-- -- -- -- -- 

ALTER TABLE customers
    ALTER COLUMN date_of_brith SET DEFAULT now();
-- ROLLBACK MIGRATION
ALTER TABLE customers
    ALTER COLUMN date_of_brith DROP DEFAULT;

-- -- -- -- -- 

-- FORWARD MIGRATION
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    total_spent NUMERIC,
    customer_id INT NOT NULL,
    CONSTRAINT fk_orders_customers FOREIGN KEY (customer_id) REFERENCES customers(id)
        ON DELETE CASCADE
);
-- ROLLBACK MIGRATION
DROP TABLE orders;

-- -- -- -- -- 

-- FORWARD MIGRATION
ALTER TABLE orders
    DROP CONSTRAINT fk_orders_customers;
-- ROLLBACK MIGRATION
ALTER TABLE orders
    ADD CONSTRAINT fk_orders_customers FOREIGN KEY (customer_id) REFERENCES customers(id)
        ON DELETE CASCADE;