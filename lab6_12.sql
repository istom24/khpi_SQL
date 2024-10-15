-- 1.
SELECT c.name, r.name, population
FROM cities c
INNER JOIN regions r ON c.region = r.uuid
Where c.population >=350000 ;
-- 2.
SELECT c.name, r.name 
FROM cities c
INNER JOIN regions r ON c.region = r.uuid
WHERE c.region = 'N';
