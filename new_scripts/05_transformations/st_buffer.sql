-- ST_BUFFER (GEOMETRY only): Create a buffer zone around a geometry
USE DATABASE GEO_DEMO_DB;
USE SCHEMA DEMO_SCHEMA;

-- Buffer of 0.01 degree units around point geometries
SELECT
    name,
    ST_BUFFER(geom, 0.01) AS buffered_geom
FROM spatial_sample_data
WHERE geo_type = 'Point'
  AND geom IS NOT NULL
LIMIT 3;

-- Buffer around a linestring
SELECT
    name,
    ST_BUFFER(geom, 0.005) AS buffered_line
FROM spatial_sample_data
WHERE geo_type = 'LineString'
LIMIT 1;
