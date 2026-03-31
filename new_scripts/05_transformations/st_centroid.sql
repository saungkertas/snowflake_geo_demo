-- ST_CENTROID: Find the geometric center of a shape
USE DATABASE GEO_DEMO_DB;
USE SCHEMA DEMO_SCHEMA;

SELECT
    name,
    geo_type,
    ST_CENTROID(geom) AS centroid_geom,
    ST_X(ST_CENTROID(geom)) AS centroid_x,
    ST_Y(ST_CENTROID(geom)) AS centroid_y
FROM spatial_sample_data
WHERE geo_type IN ('Polygon', 'LineString');
