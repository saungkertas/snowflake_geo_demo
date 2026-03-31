-- ST_Y: Extract the latitude (Y coordinate) from a point
USE DATABASE GEO_DEMO_DB;
USE SCHEMA DEMO_SCHEMA;

SELECT
    name,
    ST_Y(geom) AS latitude
FROM spatial_sample_data
WHERE geo_type = 'Point';
