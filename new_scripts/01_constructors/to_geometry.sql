-- TO_GEOMETRY: Convert WKT or GeoJSON string to GEOMETRY type
USE DATABASE GEO_DEMO_DB;
USE SCHEMA DEMO_SCHEMA;

SELECT TO_GEOMETRY('POINT(-73.9857 40.7484)') AS empire_state_geom;

SELECT TO_GEOMETRY('{"type":"Point","coordinates":[-73.9857,40.7484]}') AS empire_state_geojson_geom;

SELECT TO_GEOMETRY('POINT(-73.9857 40.7484)', 4326) AS empire_state_geom_srid;
