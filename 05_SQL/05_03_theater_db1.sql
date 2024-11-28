CREATE TABLE events (
    id SERIAL,
    show_time TIMESTAMP,
    PRIMARY KEY (id),
    auditorium_id INT,
    film_id INT NOT NULL
);

CREATE TABLE auditoria (
    id SERIAL,
    capacity INTEGER NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE films (
    id SERIAL,
    title TEXT NOT NULL,
    runtime INTEGER,
    PRIMARY KEY (id)
);

-- -- -- -- --

CREATE TABLE accounts (
    id SERIAL,
    username TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE customers (
    id SERIAL,
    name TEXT NOT NULL,
    PRIMARY KEY (id)
);

-- -- -- -- --
ALTER TABLE customers_events RENAME event_purchases

CREATE TABLE customers_events ( -- descriptive alt: CREATE TABLE event_purchases (
    customer_id INTEGER NOT NULL,
    event_id INTEGER NOT NULL,
    PRIMARY KEY (customer_id, event_id),
    price NUMERIC NOT NULL
);