-- ST_GEOHASH: Generate a geohash string from a geography point
USE DATABASE GEO_DEMO_DB;
USE SCHEMA DEMO_SCHEMA;

SELECT
    name,
    ST_GEOHASH(geog) AS geohash_default,
    ST_GEOHASH(geog, 5) AS geohash_precision_5,
    ST_GEOHASH(geog, 8) AS geohash_precision_8,
    ST_GEOHASH(geog, 12) AS geohash_precision_12
FROM spatial_sample_data
WHERE geo_type = 'Point';
