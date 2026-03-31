-- ST_ASWKB: Convert geometry to Well-Known Binary (WKB) hex-encoded format
USE DATABASE GEO_DEMO_DB;
USE SCHEMA DEMO_SCHEMA;

SELECT
    name,
    ST_ASWKB(geom) AS geometry_wkb
FROM spatial_sample_data
WHERE geo_type = 'Point'
LIMIT 3;
