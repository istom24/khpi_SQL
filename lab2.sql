-- 1.
SELECT id, name, population
FROM cities
WHERE population >= 1000000;

-- 2.
SELECT region, name, population
FROM cities
WHERE region='E' or region='W'
ORDER BY population ASC;
-- or
SELECT region, name, population
FROM cities
WHERE region IN ('E', 'W')
ORDER BY population ASC;
-- 3.
select region, name, population
from cities
WHERE region IN ('S', 'C', 'N') AND population>=50000;
-- 3.1
select region, name, population
from cities
where population>50000 AND region IN ('S', 'C', 'N')
ORDER BY region ASC, population ASC;
-- 4.
select name, population, region
from cities
where (population>150000 AND population<350000) AND region IN ('E', 'W', 'N')
LIMIT 20;
-- 5. 
select name, population, region
from cities
where region NOT IN ('E','W')
ORDER BY population ASC
LIMIT 10 OFFSET 20;