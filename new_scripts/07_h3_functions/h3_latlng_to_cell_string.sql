-- H3_LATLNG_TO_CELL_STRING: Get the H3 index as a hex string
USE DATABASE GEO_DEMO_DB;
USE SCHEMA DEMO_SCHEMA;

SELECT
    name,
    H3_LATLNG_TO_CELL_STRING(ST_Y(geom), ST_X(geom), 8) AS h3_hex_string
FROM spatial_sample_data
WHERE geo_type = 'Point';
