-- ST_MAKEPOINT: Create a GEOGRAPHY point from longitude and latitude
USE DATABASE GEO_DEMO_DB;
USE SCHEMA DEMO_SCHEMA;

SELECT ST_MAKEPOINT(-122.4194, 37.7749) AS san_francisco_point;

SELECT
    name,
    ST_MAKEPOINT(ST_X(geom), ST_Y(geom)) AS reconstructed_point
FROM spatial_sample_data
WHERE geo_type = 'Point';
