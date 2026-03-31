-- ST_INTERSECTION: Find the shared area between two overlapping geometries
USE DATABASE GEO_DEMO_DB;
USE SCHEMA DEMO_SCHEMA;

SELECT ST_INTERSECTION(
    TO_GEOMETRY('POLYGON((0 0, 10 0, 10 10, 0 10, 0 0))'),
    TO_GEOMETRY('POLYGON((5 5, 15 5, 15 15, 5 15, 5 5))')
) AS intersection_result;
