-- SETUP for WEEK4 DB
CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    salary INTEGER NOT NULL,
    name TEXT NOT NULL
);

CREATE TABLE employees_log (
    id SERIAL PRIMARY KEY,
    description TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT now(),
    employee_id INT NOT NULL,
    CONSTRAINT fk_emp_log_to_emp
    FOREIGN KEY(employee_id) REFERENCES employees(id)
    ON DELETE CASCADE
);

-- Log new employees
CREATE FUNCTION log_new_employee() RETURNS trigger AS $$
    BEGIN
        INSERT INTO employees_log (description, employee_id) VALUES (
            'Employee created.',
            NEW.id
        );
        RETURN NEW;
    END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER log_new_employee AFTER INSERT ON employees
    FOR EACH ROW EXECUTE FUNCTION log_new_employee();

INSERT INTO employees (salary, name) values (55000, 'Alice');
INSERT INTO employees (salary, name) values (66000, 'Bob');

SELECT e.*, el.description, el.created_at
FROM employees_log el
JOIN employees e ON el.employee_id = e.id;

-- Log salary updates
CREATE FUNCTION log_salary_update() RETURNS trigger AS $$
    BEGIN
        INSERT INTO employees_log (description, employee_id) VALUES (
            'Salary updated from '||OLD.salary||' to '||NEW.salary,
            NEW.id
        );
        RETURN NEW;
    END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER log_salary_update AFTER UPDATE OF salary ON employees
    FOR EACH ROW EXECUTE FUNCTION log_salary_update();

UPDATE employees SET salary = 80000 WHERE name = 'Alice';

SELECT e.*, el.description, el.created_at
FROM employees_log el
JOIN employees e ON el.employee_id = e.id;

--
UPDATE employees SET name = 'Alice B. Cool' WHERE name = 'Alice';
--
SELECT e.*, el.description, el.created_at
FROM employees_log el
JOIN employees e ON el.employee_id = e.id;

-- CLEAN UP
DROP TABLE employees CASCADE;
DROP TABLE employees_log;
DROP FUNCTION log_new_employee;
DROP FUNCTION log_salary_update;