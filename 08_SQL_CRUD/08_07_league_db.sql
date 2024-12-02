\c week2;

CREATE
OR
REPLACE
TABLE divisions (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);

CREATE
OR
REPLACE
TABLE teams (
    id SERIAL PRIMARY KEY,
    city TEXT NOT NULL,
    name TEXT UNIQUE NOT NULL,
    home_color TEXT NOT NULL,
    away_color TEXT,
    division_id INT
    -- , FOREIGN KEY (division_id) REFERENCES divisions (id)
);

ALTER TABLE teams
ADD CONSTRAINT fk_teams_divisions FOREIGN KEY (division_id) REFERENCES divisions (id);

INSERT INTO
    divisions (name)
VALUES ('Atlantic'),
    ('Metropolitan'),
    ('Pacific'),
    ('Central');

INSERT INTO
    teams (
        city,
        name,
        home_color,
        away_color,
        division_id
    )
VALUES (
        'New York',
        'Islanders',
        'Royal blue',
        'White',
        2
    ),
    (
        'Seattle',
        'Kraken',
        'Deep sea blue',
        'White',
        3
    );

UPDATE divisions
set
    name = 'Cosmopolitan'
WHERE
    name = 'Metropolitan';