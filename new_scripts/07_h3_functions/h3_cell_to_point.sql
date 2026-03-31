-- H3_CELL_TO_POINT: Get the center point of an H3 cell
USE DATABASE GEO_DEMO_DB;
USE SCHEMA DEMO_SCHEMA;

SELECT
    name,
    H3_CELL_TO_POINT(H3_LATLNG_TO_CELL(ST_Y(geom), ST_X(geom), 8)) AS h3_center
FROM spatial_sample_data
WHERE geo_type = 'Point';
