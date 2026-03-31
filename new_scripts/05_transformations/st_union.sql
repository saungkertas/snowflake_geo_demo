-- ST_UNION: Merge two geometries into one
USE DATABASE GEO_DEMO_DB;
USE SCHEMA DEMO_SCHEMA;

-- GEOMETRY union
SELECT ST_UNION(a.geom, b.geom) AS merged_polygons
FROM spatial_sample_data a, spatial_sample_data b
WHERE a.name = 'Central Park NYC' AND b.name = 'Hyde Park London';

-- GEOGRAPHY union
SELECT ST_UNION(a.geog, b.geog) AS merged_geog
FROM spatial_sample_data a, spatial_sample_data b
WHERE a.name = 'Central Park NYC' AND b.name = 'Hyde Park London';
