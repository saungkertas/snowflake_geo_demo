-- H3_INT_TO_STRING: Convert H3 integer index to hex string representation
USE DATABASE GEO_DEMO_DB;
USE SCHEMA DEMO_SCHEMA;

SELECT
    name,
    H3_LATLNG_TO_CELL(ST_Y(geom), ST_X(geom), 8) AS h3_int,
    H3_INT_TO_STRING(H3_LATLNG_TO_CELL(ST_Y(geom), ST_X(geom), 8)) AS h3_string
FROM spatial_sample_data
WHERE geo_type = 'Point'
LIMIT 3;
