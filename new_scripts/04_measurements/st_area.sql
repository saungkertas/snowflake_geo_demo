-- ST_AREA: Calculate the area of a polygon
USE DATABASE GEO_DEMO_DB;
USE SCHEMA DEMO_SCHEMA;

-- GEOGRAPHY: Area in square meters
SELECT
    name,
    ROUND(ST_AREA(geog), 2) AS area_sq_meters,
    ROUND(ST_AREA(geog) / 1e6, 4) AS area_sq_km
FROM spatial_sample_data
WHERE geo_type = 'Polygon';

-- GEOMETRY: Planar area
SELECT
    name,
    ROUND(ST_AREA(geom), 8) AS planar_area
FROM spatial_sample_data
WHERE geo_type = 'Polygon';
