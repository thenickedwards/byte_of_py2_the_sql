-- Northwind Traders is a company that imports and exports specialty foods from around the world.
-- They need a way to keep records of their business and have enlisted your help in creating a technical solution for them.
-- Requirements are provided in the form of an Entity-Relationship Diagram.

-- kill other connections
SELECT pg_terminate_backend (pg_stat_activity.pid)
FROM pg_stat_activity
WHERE
    pg_stat_activity.datname = 'week1_workshop'
    AND pid <> pg_backend_pid ();
-- (re)create the database
DROP DATABASE IF EXISTS week1_workshop;

CREATE DATABASE week1_workshop;
-- connect via psql
\c week1_workshop 
-- database configuration
SET statement_timeout = 0;

SET lock_timeout = 0;

SET client_encoding = 'UTF8';

SET standard_conforming_strings = on;

SET check_function_bodies = false;

SET client_min_messages = warning;

SET default_tablespace = '';

SET default_with_oids = false;

---
--- CREATE tables
---

CREATE TABLE categories (
    id SERIAL,
    name TEXT UNIQUE NOT NULL,
    description TEXT,
    picture TEXT,
    PRIMARY KEY (id)
);

CREATE TABLE products (
    id SERIAL,
    name TEXT NOT NULL,
    discontinued BOOLEAN NOT NULL,
    supplier_id INT,
    category_id INT,
    PRIMARY KEY (id)
);

CREATE TABLE suppliers (
    id SERIAL,
    name TEXT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE customers (
    id SERIAL,
    company_name TEXT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE orders (
    id SERIAL,
    date DATE,
    customer_id INT NOT NULL,
    employee_id INT,
    PRIMARY KEY (id)
);

CREATE TABLE employees (
    id SERIAL,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    reports_to INT,
    PRIMARY KEY (id)
);

CREATE TABLE territories (
    id SERIAL,
    description TEXT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE offices (
    id SERIAL,
    address_line TEXT NOT NULL,
    territory_id INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE us_states (
    id SERIAL,
    name TEXT NOT NULL,
    abbreviation CHARACTER(2) NOT NULL,
    PRIMARY KEY (id)
);

--- CREATE bridge tables

CREATE TABLE orders_products (
    product_id INT,
    order_id INT,
    quantity INT,
    unit_discount NUMERIC NOT NULL,
    PRIMARY KEY (product_id, order_id)
);

CREATE TABLE employees_territories (
    employee_id INT,
    territory_id INT,
    PRIMARY KEY (employee_id, territory_id)
);

---
-- ALTER TABLE, ADD FOREGIN KEYS
---

ALTER TABLE products
ADD CONSTRAINT fk_products_categories FOREIGN KEY (category_id) REFERENCES categories (id),
ADD CONSTRAINT fk_products_suppliers FOREIGN KEY (supplier_id) REFERENCES suppliers (id);

ALTER TABLE orders
ADD CONSTRAINT fk_orders_customers FOREIGN KEY (customer_id) REFERENCES customers (id),
ADD CONSTRAINT fk_orders_employees FOREIGN KEY (employee_id) REFERENCES employees (id);

ALTER TABLE employees
ADD CONSTRAINT fk_employees_employees FOREIGN KEY (reports_to) REFERENCES employees (id);

ALTER TABLE orders_products
ADD CONSTRAINT fk_orders_products_orders FOREIGN KEY (order_id) REFERENCES orders (id),
ADD CONSTRAINT fk_orders_products_products FOREIGN KEY (product_id) REFERENCES products (id);

ALTER TABLE offices
ADD CONSTRAINT fk_offices_territories FOREIGN KEY (territory_id) REFERENCES territories (id);

ALTER TABLE employees_territories
ADD CONSTRAINT fk_employees_territories_employees FOREIGN KEY (employee_id) REFERENCES employees (id),
ADD CONSTRAINT fk_employees_territories_territories FOREIGN KEY (territory_id) REFERENCES territories (id);