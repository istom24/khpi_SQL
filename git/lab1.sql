-- 1.
SELECT id, name, population
FROM cities
ORDER BY population DESC
LIMIT 10 OFFSET 10;
-- 2.
SELECT id, name
FROM cities
ORDER BY name DESC
LIMIT 30;
-- 3.
SELECT id, name, region, population
FROM cities
ORDER BY region, population ASC;
-- 4.
SELECT DISTINCT region
FROM cities;
-- 5.
SELECT region, name 
FROM cities
ORDER BY region DESC, name DESC;