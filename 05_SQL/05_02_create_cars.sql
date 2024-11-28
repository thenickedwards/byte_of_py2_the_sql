CREATE TABLE cars (
    id SERIAL,
    year INTEGER,
    make TEXT NOT NULL,
    model TEXT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE drivers (
    id SERIAL,
    car_id INT NOT NULL,
    name TEXT NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE drivers
ADD CONSTRAINT fk_drivers_cars FOREIGN KEY (car_id) REFERENCES cars;