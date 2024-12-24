EXPLAIN SELECT date_acquired FROM moma_works 
WHERE date_acquired BETWEEN '1950-01-01' AND '1959-12-31';
-- 1 | Seq Scan on moma_works  (cost=0.00..9887.26 rows=6096 width=4)
-- 2 | Filter: ((date_acquired >= '1950-01-01'::date) AND (date_acquired <= '1959-12-31'::date))

EXPLAIN ANALYZE SELECT date_acquired FROM moma_works 
WHERE date_acquired BETWEEN '1950-01-01' AND '1959-12-31';
-- 1 | Seq Scan on moma_works  (cost=0.00..9887.26 rows=6096 width=4) (actual time=0.143..40.188 rows=6387 loops=1)
-- 2 | Rows Removed by Filter: 131764
-- 3 | Planning Time: 0.119 ms
-- 4 | Execution Time: 40.436 ms

-- INDEXING
CREATE INDEX date_acq_idx ON moma_works(date_acquired);
EXPLAIN ANALYZE SELECT date_acquired FROM moma_works 
WHERE date_acquired BETWEEN '1950-01-01' AND '1959-12-31';
-- 1 | Index Only Scan using date_acq_idx on moma_works  (cost=0.29..146.22 rows=6096 width=4) (actual time=0.035..0.441 rows=6387 loops=1)
-- 2 | Heap Fetches: 0
-- 3 | Planning Time: 0.489 ms
-- 4 | Execution Time: 0.643 ms
