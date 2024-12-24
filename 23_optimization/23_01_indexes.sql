-- CREATE INDEX index_name on table_name (column_name);

CREATE INDEX people_birhtdate_index on people (birthdate);

-- connecting to MOMA db
SELECT * FROM pg_indexes;   -- 119 indexes

SELECT tablename, indexname, indexdef FROM pg_indexes WHERE tablename NOT LIKE 'pg_%';

-- Index vs Non-Indexed comparison
-- Without index
SELECT title FROM moma_works WHERE artist = 'Frank Lloyd Wright';
-- Successfully run. Total query runtime: 436 msec. 874 rows affected.

-- CREATE btree INDEX
CREATE INDEX moma_works_btree_index ON moma_works(artist);
SELECT tablename, indexname, indexdef FROM pg_indexes WHERE tablename NOT LIKE 'pg_%';
-- See index present
SELECT title FROM moma_works WHERE artist = 'Frank Lloyd Wright';
-- Successfully run. Total query runtime: 73 msec. 874 rows affected.
DROP INDEX moma_works_btree_index;

-- CREATE hash INDEX
CREATE INDEX moma_works_hash_index ON moma_works USING HASH (artist);
SELECT title FROM moma_works WHERE artist = 'Frank Lloyd Wright';
-- Successfully run. Total query runtime: 87 msec. 874 rows affected.
DROP INDEX moma_works_hash_index;