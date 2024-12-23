SELECT * FROM moma_artists LIMIT 1;
-- "{""ulan"": null, ""gender"": ""Male"", ""end_date"": 1992, ""wiki_qid"": null, ""artist_bio"": ""American, 1930–1992"", ""begin_date"": 1930, ""nationality"": ""American"", ""display_name"": ""Robert Arneson"", ""constituent_id"": 1}"
SELECT * FROM moma_artists LIMIT 50;

-- jsonb_pretty
SELECT jsonb_pretty(info) AS formatted_info
FROM moma_artists LIMIT 50;

-- Parse display_name and nationality
SELECT
info -> 'display_name' AS name,
info -> 'nationality' as nationality
FROM moma_artists
ORDER BY id
LIMIT 50;

-- American artists only
SELECT
info -> 'display_name' AS name,
info -> 'nationality' AS nationality
FROM moma_artists
WHERE info ->> 'nationality' = 'American'
ORDER BY id
LIMIT 50;

-- INSERTION 1
INSERT INTO moma_artists (info) VALUES (
    json_object('{display_name, Ablade Glover, nationality, Ghanaian}')
);
-- INSERTION 2 * * * 
INSERT INTO moma_artists (info) VALUES (
    json_object('{{display_name, Ablade Glover}, {nationality, Ghanaian}}')
);
-- INSERTION 3
INSERT INTO moma_artists (info) VALUES (
    json_object('{display_name, nationality}', '{Ablade Glover, Ghanaian}')
);
-- SELECT INSERTED RECORD
SELECT info FROM moma_artists ORDER BY id DESC LIMIT 1;
-- id auto generated, we're pull last id

