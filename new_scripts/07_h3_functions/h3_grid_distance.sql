-- H3_GRID_DISTANCE: Calculate the grid distance between two H3 cells
-- (number of hexagonal steps between cells at the same resolution)
USE DATABASE GEO_DEMO_DB;
USE SCHEMA DEMO_SCHEMA;

SELECT
    a.name AS place_a,
    b.name AS place_b,
    H3_GRID_DISTANCE(
        H3_LATLNG_TO_CELL(ST_Y(a.geom), ST_X(a.geom), 5),
        H3_LATLNG_TO_CELL(ST_Y(b.geom), ST_X(b.geom), 5)
    ) AS grid_distance_res5
FROM spatial_sample_data a
CROSS JOIN spatial_sample_data b
WHERE a.geo_type = 'Point' AND b.geo_type = 'Point'
  AND a.id < b.id
ORDER BY a.name, b.name;
