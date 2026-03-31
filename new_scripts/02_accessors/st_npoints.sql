-- ST_NPOINTS: Returns the number of points (vertices) in a geometry
USE DATABASE GEO_DEMO_DB;
USE SCHEMA DEMO_SCHEMA;

SELECT
    name,
    geo_type,
    ST_NPOINTS(geom) AS num_points
FROM spatial_sample_data
WHERE geom IS NOT NULL;
