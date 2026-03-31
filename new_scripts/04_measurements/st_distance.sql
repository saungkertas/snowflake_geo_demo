-- ST_DISTANCE: Calculate distance between two geospatial objects
USE DATABASE GEO_DEMO_DB;
USE SCHEMA DEMO_SCHEMA;

-- GEOGRAPHY: Great-circle distance in meters
SELECT
    a.name AS from_place,
    b.name AS to_place,
    ROUND(ST_DISTANCE(a.geog, b.geog), 2) AS distance_meters,
    ROUND(ST_DISTANCE(a.geog, b.geog) / 1000, 2) AS distance_km
FROM spatial_sample_data a
CROSS JOIN spatial_sample_data b
WHERE a.geo_type = 'Point' AND b.geo_type = 'Point'
  AND a.id < b.id
ORDER BY distance_meters;

-- GEOMETRY: Planar / Euclidean distance
SELECT
    a.name AS from_place,
    b.name AS to_place,
    ROUND(ST_DISTANCE(a.geom, b.geom), 6) AS planar_distance
FROM spatial_sample_data a
CROSS JOIN spatial_sample_data b
WHERE a.geo_type = 'Point' AND b.geo_type = 'Point'
  AND a.id < b.id
ORDER BY planar_distance;
