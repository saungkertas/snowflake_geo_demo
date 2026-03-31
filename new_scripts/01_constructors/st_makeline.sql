-- ST_MAKELINE: Create a line geometry from two points
USE DATABASE GEO_DEMO_DB;
USE SCHEMA DEMO_SCHEMA;

SELECT ST_MAKELINE(
    ST_MAKEPOINT(2.2945, 48.8584),
    ST_MAKEPOINT(-0.1246, 51.5007)
) AS paris_to_london_line;

SELECT ST_MAKELINE(a.geom, b.geom) AS line_between_landmarks
FROM spatial_sample_data a, spatial_sample_data b
WHERE a.name = 'Eiffel Tower' AND b.name = 'Colosseum';
