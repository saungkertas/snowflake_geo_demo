-- TO_GEOGRAPHY: Convert WKT or GeoJSON string to GEOGRAPHY type
USE DATABASE GEO_DEMO_DB;
USE SCHEMA DEMO_SCHEMA;

SELECT TO_GEOGRAPHY('POINT(-73.9857 40.7484)') AS empire_state_geog;

SELECT TO_GEOGRAPHY('{"type":"Point","coordinates":[-73.9857,40.7484]}') AS empire_state_geojson;
