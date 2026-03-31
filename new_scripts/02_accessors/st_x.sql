-- ST_X: Extract the longitude (X coordinate) from a point
USE DATABASE GEO_DEMO_DB;
USE SCHEMA DEMO_SCHEMA;

SELECT
    name,
    ST_X(geom) AS longitude
FROM spatial_sample_data
WHERE geo_type = 'Point';
