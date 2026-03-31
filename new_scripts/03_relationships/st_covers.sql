-- ST_COVERS: Does geometry A fully cover geometry B?
USE DATABASE GEO_DEMO_DB;
USE SCHEMA DEMO_SCHEMA;

SELECT
    p.name AS polygon_name,
    pt.name AS point_name,
    ST_COVERS(p.geog, pt.geog) AS covers_point
FROM spatial_sample_data p
CROSS JOIN spatial_sample_data pt
WHERE p.geo_type = 'Polygon' AND pt.geo_type = 'Point';
