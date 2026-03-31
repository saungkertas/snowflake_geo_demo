-- H3_LATLNG_TO_CELL: Convert a lat/lng to an H3 cell index at a given resolution
USE DATABASE GEO_DEMO_DB;
USE SCHEMA DEMO_SCHEMA;

SELECT
    name,
    ST_Y(geom) AS latitude,
    ST_X(geom) AS longitude,
    H3_LATLNG_TO_CELL(ST_Y(geom), ST_X(geom), 5)  AS h3_res5,
    H3_LATLNG_TO_CELL(ST_Y(geom), ST_X(geom), 8)  AS h3_res8,
    H3_LATLNG_TO_CELL(ST_Y(geom), ST_X(geom), 10) AS h3_res10
FROM spatial_sample_data
WHERE geo_type = 'Point';
