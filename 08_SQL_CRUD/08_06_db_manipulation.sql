CREATE TABLE cars (
    id SERIAL PRIMARY KEY,
    year INT,
    make TEXT NOT NULL,
    model TEXT NOT NULL
);

INSERT INTO
    cars (year, make, model)
VALUES (2020, 'Toyota', 'Prius');

INSERT INTO cars (year, make, model) VALUES (2012, 'Ford', 'Focus');

ALTER TABLE cars ADD wheel_count INT NOT NULL DEFAULT 4;

INSERT INTO
    cars (year, make, model)
VALUES (2020, 'Nissan', 'Altima');

INSERT INTO cars (make, model, wheel_count) VALUES ('Elio', 'P5', 3);

DELETE FROM cars WHERE year IS NULL;

-- TO RESET
-- DROP TABLE cars;