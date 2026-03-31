-- H3_GRID_DISK: Get all H3 cells within k steps of a given cell
USE DATABASE GEO_DEMO_DB;
USE SCHEMA DEMO_SCHEMA;

SELECT
    name,
    H3_GRID_DISK(H3_LATLNG_TO_CELL(ST_Y(geom), ST_X(geom), 8), 1) AS neighbors_k1
FROM spatial_sample_data
WHERE name = 'Eiffel Tower';
