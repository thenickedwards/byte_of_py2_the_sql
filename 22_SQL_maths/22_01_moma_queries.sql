SELECT * FROM moma_works WHERE classification = 'Photograph';   -- 33025

SELECT * FROM moma_works WHERE classification = 'Photograph';

SELECT height, width FROM moma_works
    WHERE classification = 'Photograph' 
    AND height > 0 
    AND width > 0;

-- ADD DIMENSIONS OF PICTURE FRAME (2cm top/bottom x 1cm left/right)
SELECT
CEIL(width) + 2 AS frame_width,
CEIL(height) + 4 AS frame_height
FROM moma_works
    WHERE classification = 'Photograph' 
    AND width > 0 
    AND height > 0;

-- Set recommended frame area
WITH frames AS (
    SELECT
    CEIL(width) + 2 AS frame_width,
    CEIL(height) + 4 AS frame_height
    FROM moma_works
    WHERE classification = 'Photograph' AND width > 0 AND height > 0
)
SELECT
frame_width,
frame_height,
frame_width * frame_height AS frame_area
FROM frames;

-- Count number of frames required per size
WITH frames AS (
    SELECT
    CEIL(width) + 2 AS frame_width,
    CEIL(height) + 4 AS frame_height
    FROM moma_works
    WHERE classification = 'Photograph' AND width > 0 AND height > 0
)
SELECT
    COUNT(*),
    frame_width,
    frame_height,
    frame_width * frame_height AS frame_area
FROM frames
    GROUP BY frame_width, frame_height, frame_area;