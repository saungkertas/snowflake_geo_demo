-- =============================================================================
-- setup.sql — Environment & Dummy Data for Snowflake Geospatial Demo
-- =============================================================================

CREATE OR REPLACE DATABASE GEO_DEMO_DB;
CREATE OR REPLACE SCHEMA GEO_DEMO_DB.DEMO_SCHEMA;

USE DATABASE GEO_DEMO_DB;
USE SCHEMA DEMO_SCHEMA;

CREATE OR REPLACE TABLE spatial_sample_data (
    id          INT,
    name        STRING,
    geo_type    STRING,
    geog        GEOGRAPHY,
    geom        GEOMETRY
);

-- ── Points ──────────────────────────────────────────────────────────────────
INSERT INTO spatial_sample_data
SELECT 1, 'Eiffel Tower', 'Point',
       TO_GEOGRAPHY('POINT(2.2945 48.8584)'),
       TO_GEOMETRY('POINT(2.2945 48.8584)')
UNION ALL
SELECT 2, 'Statue of Liberty', 'Point',
       TO_GEOGRAPHY('POINT(-74.0445 40.6892)'),
       TO_GEOMETRY('POINT(-74.0445 40.6892)')
UNION ALL
SELECT 3, 'Sydney Opera House', 'Point',
       TO_GEOGRAPHY('POINT(151.2153 -33.8568)'),
       TO_GEOMETRY('POINT(151.2153 -33.8568)')
UNION ALL
SELECT 4, 'Tokyo Tower', 'Point',
       TO_GEOGRAPHY('POINT(139.7454 35.6586)'),
       TO_GEOMETRY('POINT(139.7454 35.6586)')
UNION ALL
SELECT 5, 'Colosseum', 'Point',
       TO_GEOGRAPHY('POINT(12.4924 41.8902)'),
       TO_GEOMETRY('POINT(12.4924 41.8902)');

-- ── LineStrings ─────────────────────────────────────────────────────────────
INSERT INTO spatial_sample_data
SELECT 6, 'Paris to London Route', 'LineString',
       TO_GEOGRAPHY('LINESTRING(2.3522 48.8566, 0.0 49.5, -0.1278 51.5074)'),
       TO_GEOMETRY('LINESTRING(2.3522 48.8566, 0.0 49.5, -0.1278 51.5074)')
UNION ALL
SELECT 7, 'Tokyo to Osaka Route', 'LineString',
       TO_GEOGRAPHY('LINESTRING(139.6917 35.6895, 136.9066 35.1815, 135.5023 34.6937)'),
       TO_GEOMETRY('LINESTRING(139.6917 35.6895, 136.9066 35.1815, 135.5023 34.6937)')
UNION ALL
SELECT 8, 'NYC to Washington DC Route', 'LineString',
       TO_GEOGRAPHY('LINESTRING(-74.006 40.7128, -75.1652 39.9526, -77.0369 38.9072)'),
       TO_GEOMETRY('LINESTRING(-74.006 40.7128, -75.1652 39.9526, -77.0369 38.9072)');

-- ── Polygons (counter-clockwise / right-hand rule for GEOGRAPHY) ────────────
INSERT INTO spatial_sample_data
SELECT 9, 'Central Park NYC', 'Polygon',
       TO_GEOGRAPHY('POLYGON((-73.9813 40.7681, -73.9580 40.8006, -73.9493 40.7968, -73.9732 40.7644, -73.9813 40.7681))'),
       TO_GEOMETRY('POLYGON((-73.9813 40.7681, -73.9580 40.8006, -73.9493 40.7968, -73.9732 40.7644, -73.9813 40.7681))')
UNION ALL
SELECT 10, 'Hyde Park London', 'Polygon',
       TO_GEOGRAPHY('POLYGON((-0.1870 51.5074, -0.1530 51.5120, -0.1500 51.5050, -0.1840 51.5020, -0.1870 51.5074))'),
       TO_GEOMETRY('POLYGON((-0.1870 51.5074, -0.1530 51.5120, -0.1500 51.5050, -0.1840 51.5020, -0.1870 51.5074))')
UNION ALL
SELECT 11, 'Ueno Park Tokyo', 'Polygon',
       TO_GEOGRAPHY('POLYGON((139.7690 35.7146, 139.7780 35.7180, 139.7810 35.7120, 139.7720 35.7090, 139.7690 35.7146))'),
       TO_GEOMETRY('POLYGON((139.7690 35.7146, 139.7780 35.7180, 139.7810 35.7120, 139.7720 35.7090, 139.7690 35.7146))');

-- ── MultiPoint ──────────────────────────────────────────────────────────────
INSERT INTO spatial_sample_data
SELECT 12, 'European Landmarks Multi', 'MultiPoint',
       TO_GEOGRAPHY('MULTIPOINT((2.2945 48.8584),(12.4924 41.8902),(-3.7038 40.4168))'),
       TO_GEOMETRY('MULTIPOINT((2.2945 48.8584),(12.4924 41.8902),(-3.7038 40.4168))');

-- ── MultiPolygon ────────────────────────────────────────────────────────────
INSERT INTO spatial_sample_data
SELECT 13, 'Two Parks Multi', 'MultiPolygon',
       TO_GEOGRAPHY('MULTIPOLYGON(((-73.9813 40.7681,-73.9580 40.8006,-73.9493 40.7968,-73.9732 40.7644,-73.9813 40.7681)),((-0.1870 51.5074,-0.1530 51.5120,-0.1500 51.5050,-0.1840 51.5020,-0.1870 51.5074)))'),
       TO_GEOMETRY('MULTIPOLYGON(((-73.9813 40.7681,-73.9580 40.8006,-73.9493 40.7968,-73.9732 40.7644,-73.9813 40.7681)),((-0.1870 51.5074,-0.1530 51.5120,-0.1500 51.5050,-0.1840 51.5020,-0.1870 51.5074)))');

-- ── GeometryCollection ──────────────────────────────────────────────────────
INSERT INTO spatial_sample_data
SELECT 14, 'Mixed Collection', 'GeometryCollection',
       TO_GEOGRAPHY('GEOMETRYCOLLECTION(POINT(2.2945 48.8584),LINESTRING(2.3522 48.8566,-0.1278 51.5074))'),
       TO_GEOMETRY('GEOMETRYCOLLECTION(POINT(2.2945 48.8584),LINESTRING(2.3522 48.8566,-0.1278 51.5074))');

-- ── Invalid Shape (for ST_ISVALID testing) ──────────────────────────────────
-- Snowflake VALUES clause does not support geospatial expressions, so we use
-- a two-step approach: insert NULL, then update with the invalid geometry.
INSERT INTO spatial_sample_data(id, name, geo_type, geog, geom)
VALUES (15, 'Invalid Bowtie Polygon', 'Invalid Polygon', NULL, NULL);

UPDATE spatial_sample_data
SET geom = TO_GEOMETRY('POLYGON((0 0, 2 2, 2 0, 0 2, 0 0))', TRUE)
WHERE id = 15;

-- ── Additional Point for distance / relationship demos ──────────────────────
INSERT INTO spatial_sample_data
SELECT 16, 'Big Ben London', 'Point',
       TO_GEOGRAPHY('POINT(-0.1246 51.5007)'),
       TO_GEOMETRY('POINT(-0.1246 51.5007)');

SELECT id, name, geo_type FROM spatial_sample_data ORDER BY id;
