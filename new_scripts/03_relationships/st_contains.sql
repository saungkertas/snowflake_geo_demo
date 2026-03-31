-- ST_CONTAINS: Does the polygon contain the point?
USE DATABASE GEO_DEMO_DB;
USE SCHEMA DEMO_SCHEMA;

SELECT
    p.name AS polygon_name,
    pt.name AS point_name,
    ST_CONTAINS(p.geog, pt.geog) AS contains_point
FROM spatial_sample_data p
CROSS JOIN spatial_sample_data pt
WHERE p.geo_type = 'Polygon' AND pt.geo_type = 'Point';
