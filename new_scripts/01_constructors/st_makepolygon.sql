-- ST_MAKEPOLYGON: Create a polygon from a closed linestring ring
USE DATABASE GEO_DEMO_DB;
USE SCHEMA DEMO_SCHEMA;

SELECT ST_MAKEPOLYGON(
    TO_GEOMETRY('LINESTRING(0 0, 4 0, 4 4, 0 4, 0 0)')
) AS simple_square;
