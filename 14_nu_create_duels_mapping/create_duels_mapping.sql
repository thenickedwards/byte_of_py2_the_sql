-- CREATE DATABASE duels_mapping;

CREATE TABLE raw_fbref_mls_players_all_stats_misc (
load_datetime           TIMESTAMP,       -- Load timestamp with time zone
player_name             TEXT,            -- Player's name
player_nationality      TEXT,            -- Player's nationality
position	            TEXT,            -- Player's position
squad	                TEXT,            -- Player's team
player_age  	        TEXT,            -- Player's age (start of season)
player_yob	            TEXT,            -- Player's year of birth
nineties                TEXT,            -- Minutes played ÷ 90
yellow_cards1	        TEXT,            -- Yellow cards
red_cards   	        TEXT,            -- Red cards
yellow_cards2   	    TEXT,            -- Second yellow cards
fouls_committed	        TEXT,            -- Fouls committed
fouls_drawn	            TEXT,            -- Fouls drawn
offside	                TEXT,            -- Offside
crosses	                TEXT,            -- Crosses
interceptions   	    TEXT,            -- Interceptions
tackles_won 	        TEXT,            -- Number of tackles won
pks_won	                TEXT,            -- Number of PKs won
pks_con	                TEXT,            -- Number of PKs conceded
own_goals	            TEXT,            -- Number of own goals scored
recoveries	            TEXT,            -- Number of recoveries
aerial_duels_won	    TEXT,            -- Number of aerial duels won
aerial_duels_lost	    TEXT,            -- Number of aerial duels lost
aerial_duels_won_pct    TEXT,            -- Percent of aerial duels won    
);

CREATE TABLE stg_fbref_mls_players_all_stats_misc (
load_datetime           TIMESTAMP,       -- Load timestamp with time zone
player_name             VARCHAR(255),    -- Player's name
player_nationality      VARCHAR(255),    -- Player's nationality
position	            VARCHAR(255),    -- Player's position
squad	                VARCHAR(255),    -- Player's team
player_age  	        INT,             -- Player's age (start of season)
player_yob	            INT,             --	Player's year of birth
nineties                FLOAT,           --	Minutes played ÷ 90
yellow_cards1	        INT,             --	Yellow cards
red_cards   	        INT,             --	Red cards
yellow_cards2   	    INT,             --	Second yellow cards
fouls_committed	        INT,             -- Fouls committed
fouls_drawn	            INT,             -- Fouls drawn
offside	                INT,             --	Offside
crosses	                INT,             --	Crosses
interceptions   	    INT,             --	Interceptions
tackles_won 	        INT,             --	Number of tackles won
pks_won	                INT,             --	Number of PKs won
pks_con	                INT,             --	Number of PKs conceded
own_goals	            INT,             --	Number of own goals scored
recoveries	            INT,             --	Number of recoveries
aerial_duels_won	    INT,             --	Number of aerial duels won
aerial_duels_lost	    INT,             --	Number of aerial duels lost
aerial_duels_won_pct    FLOAT,           --	Percent of aerial duels won    
);



