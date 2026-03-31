-- ST_DISJOINT: Are two geometries completely separate (no shared space)?
USE DATABASE GEO_DEMO_DB;
USE SCHEMA DEMO_SCHEMA;

SELECT
    a.name AS geom_a,
    b.name AS geom_b,
    ST_DISJOINT(a.geom, b.geom) AS are_disjoint
FROM spatial_sample_data a
CROSS JOIN spatial_sample_data b
WHERE a.geo_type = 'Polygon' AND b.geo_type = 'Point'
  AND a.id != b.id;
