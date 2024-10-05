-- 1.
SELECT  UPPER(name) AS name_1
FROM cities
ORDER BY name
LIMIT 10 OFFSET 5;
-- 2.
SELECT name, char_LENGTH(name) AS long_name
FROM cities
WHERE char_LENGTH(name) < 8 || char_LENGTH(name) > 10
ORDER BY name;
-- 3.
SELECT  SUM(population) AS size_population 
FROM cities
WHERE region='C' or region='S'
ORDER BY region;
-- 4.
SELECT  AVG(population) AS agv_population 
FROM cities
WHERE region='W'
ORDER BY region;
-- 5.
SELECT COUNT(name) AS size_name
FROM cities
WHERE region='E'
ORDER BY region;
