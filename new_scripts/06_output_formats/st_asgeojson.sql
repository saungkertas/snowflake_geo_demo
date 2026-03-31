-- ST_ASGEOJSON: Convert geography/geometry to GeoJSON format
USE DATABASE GEO_DEMO_DB;
USE SCHEMA DEMO_SCHEMA;

SELECT
    name,
    ST_ASGEOJSON(geog) AS geography_geojson
FROM spatial_sample_data
WHERE geo_type = 'Point';

SELECT
    name,
    ST_ASGEOJSON(geog) AS polygon_geojson
FROM spatial_sample_data
WHERE geo_type = 'Polygon';
