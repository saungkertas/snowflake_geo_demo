-- H3_CELL_TO_BOUNDARY: Convert an H3 cell index back to its boundary polygon
USE DATABASE GEO_DEMO_DB;
USE SCHEMA DEMO_SCHEMA;

SELECT
    name,
    H3_LATLNG_TO_CELL(ST_Y(geom), ST_X(geom), 8) AS h3_index,
    H3_CELL_TO_BOUNDARY(H3_LATLNG_TO_CELL(ST_Y(geom), ST_X(geom), 8)) AS h3_boundary
FROM spatial_sample_data
WHERE geo_type = 'Point';
