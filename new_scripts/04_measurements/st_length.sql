-- ST_LENGTH: Calculate the length of a linestring
USE DATABASE GEO_DEMO_DB;
USE SCHEMA DEMO_SCHEMA;

-- GEOGRAPHY: Length in meters
SELECT
    name,
    ROUND(ST_LENGTH(geog), 2) AS length_meters,
    ROUND(ST_LENGTH(geog) / 1000, 2) AS length_km
FROM spatial_sample_data
WHERE geo_type = 'LineString';

-- GEOMETRY: Planar length
SELECT
    name,
    ROUND(ST_LENGTH(geom), 6) AS planar_length
FROM spatial_sample_data
WHERE geo_type = 'LineString';
