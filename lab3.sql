-- 1.
SELECT name
FROM cities
WHERE name LIKE '%ськ';

-- 2.
SELECT name
FROM cities
WHERE name LIKE '%донец%';


--3.
SELECT Concat (name, ' (',region, ')'),population
FROM cities
WHERE population > 100000
ORDER BY name ASC;
