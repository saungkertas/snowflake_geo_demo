-- ST_ISVALID: Test whether a geometry is valid
USE DATABASE GEO_DEMO_DB;
USE SCHEMA DEMO_SCHEMA;

SELECT
    name,
    geo_type,
    ST_ISVALID(geom) AS is_valid
FROM spatial_sample_data
WHERE geom IS NOT NULL;
