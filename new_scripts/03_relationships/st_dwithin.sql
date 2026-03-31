-- ST_DWITHIN: Are two geographies within a given distance (meters)?
-- Check which landmarks are within 1,000 km of the Eiffel Tower
USE DATABASE GEO_DEMO_DB;
USE SCHEMA DEMO_SCHEMA;

SELECT
    b.name AS landmark,
    ST_DWITHIN(a.geog, b.geog, 1000000) AS within_1000km
FROM spatial_sample_data a
CROSS JOIN spatial_sample_data b
WHERE a.name = 'Eiffel Tower'
  AND b.geo_type = 'Point'
  AND a.id != b.id;
