-- ST_INTERSECTS: Do two geometries share any portion of space?
USE DATABASE GEO_DEMO_DB;
USE SCHEMA DEMO_SCHEMA;

SELECT
    a.name AS geom_a,
    b.name AS geom_b,
    ST_INTERSECTS(a.geog, b.geog) AS do_they_intersect
FROM spatial_sample_data a
CROSS JOIN spatial_sample_data b
WHERE a.id < b.id
  AND a.geo_type IN ('Polygon', 'LineString')
  AND b.geo_type IN ('Polygon', 'LineString');
