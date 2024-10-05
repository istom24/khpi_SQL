-- 1.
SELECT region, SUM(population) AS peoples
FROM cities
GROUP BY region;
-- 2.
SELECT region, SUM(population) AS people
FROM cities
GROUP BY region
HAVING COUNT(*)>10;
-- 3.
SELECT name, population 
FROM cities
WHERE region IN (SELECT uuid 
                  FROM regions
                  WHERE area_quantity>=5)
ORDER BY population DESC
LIMIT 5 OFFSET 10;
-- 4.
SELECT r.name, SUM(c.population) AS sum_people
FROM regions r, cities c
WHERE (c.population>300000) && (c.region=r.uuid)
group by r.name;
-- 5.
SELECT name, population, region
FROM cities
WHERE (population<150000 || population> 500000) && (region IN (SELECT uuid 
                  FROM regions
                  WHERE area_quantity<=5));