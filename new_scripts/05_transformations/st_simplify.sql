-- ST_SIMPLIFY (GEOMETRY): Simplify a geometry using a distance tolerance
USE DATABASE GEO_DEMO_DB;
USE SCHEMA DEMO_SCHEMA;

SELECT
    name,
    ST_NPOINTS(geom) AS original_points,
    ST_NPOINTS(ST_SIMPLIFY(geom, 0.001)) AS simplified_points,
    ST_SIMPLIFY(geom, 0.001) AS simplified_geom
FROM spatial_sample_data
WHERE geo_type = 'Polygon';
