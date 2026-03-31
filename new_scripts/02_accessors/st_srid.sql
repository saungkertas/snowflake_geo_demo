-- ST_SRID: Returns the Spatial Reference System Identifier
USE DATABASE GEO_DEMO_DB;
USE SCHEMA DEMO_SCHEMA;

SELECT
    name,
    ST_SRID(geom) AS geometry_srid,
    ST_SRID(geog) AS geography_srid
FROM spatial_sample_data
WHERE geom IS NOT NULL AND geog IS NOT NULL;
