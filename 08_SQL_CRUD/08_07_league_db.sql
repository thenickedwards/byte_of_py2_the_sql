\c week2;

CREATE TABLE divisions (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    city TEXT NOT NULL,
    name TEXT NOT NULL UNIQUE,
    home_color TEXT NOT NULL,
    away_color TEXT,
    division_id INT
);

ALTER TABLE teams 
    ADD CONSTRAINT fk_teams_divisions FOREIGN KEY (division_id) REFERENCES divisions (id) 
    ON DELETE SET NULL;

INSERT INTO divisions (name) VALUES 
    ('Atlantic'), ('Metropolitan'), ('Pacific'), ('Central');

INSERT INTO teams (city, name, home_color, away_color, division_id) VALUES 
    ('New York', 'Islanders', 'Royal blue', 'White', 2),
    ('Seattle', 'Kraken', 'Deep sea blue', 'White', 3);

UPDATE divisions set name = 'Cosmopolitan' 
    WHERE name = 'Metropolitan';

DELETE FROM divisions WHERE name = 'Cosmopolitan';