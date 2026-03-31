-- ST_DIMENSION: Returns the topological dimension of a geometry
-- 0 = point, 1 = line, 2 = polygon
USE DATABASE GEO_DEMO_DB;
USE SCHEMA DEMO_SCHEMA;

SELECT
    name,
    geo_type,
    ST_DIMENSION(geom) AS dimension
FROM spatial_sample_data
WHERE geom IS NOT NULL;
