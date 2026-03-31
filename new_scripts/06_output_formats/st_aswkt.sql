-- ST_ASWKT: Convert geography/geometry to Well-Known Text (WKT)
USE DATABASE GEO_DEMO_DB;
USE SCHEMA DEMO_SCHEMA;

SELECT
    name,
    ST_ASWKT(geog) AS geography_wkt,
    ST_ASWKT(geom) AS geometry_wkt
FROM spatial_sample_data
WHERE geo_type = 'Point';

SELECT
    name,
    geo_type,
    ST_ASWKT(geog) AS wkt_representation
FROM spatial_sample_data
WHERE geo_type IN ('LineString', 'Polygon', 'MultiPoint');
