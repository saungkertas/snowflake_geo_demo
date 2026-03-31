-- HAVERSINE: Great-circle distance between two lat/lng pairs (returns km)
USE DATABASE GEO_DEMO_DB;
USE SCHEMA DEMO_SCHEMA;

SELECT
    a.name AS from_place,
    b.name AS to_place,
    ROUND(HAVERSINE(
        ST_Y(a.geom), ST_X(a.geom),
        ST_Y(b.geom), ST_X(b.geom)
    ), 2) AS haversine_km
FROM spatial_sample_data a
CROSS JOIN spatial_sample_data b
WHERE a.geo_type = 'Point' AND b.geo_type = 'Point'
  AND a.id < b.id
ORDER BY haversine_km;
