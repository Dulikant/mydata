
-- 1
CREATE DATABASE lab2;

-- 2
CREATE TABLE countries (
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR(255),
    region_id INTEGER,
    population INTEGER
);
select *
from countries;

-- 3
INSERT INTO countries (country_name,region_id, population) VALUES ('USA', 1, 331002651);

-- 4
INSERT INTO countries (country_id, country_name) VALUES (2, 'Canada');

-- 5
INSERT INTO countries (country_name, region_id, population) VALUES ('Australia', NULL, 25499884);

-- 6
INSERT INTO countries (country_name, region_id, population) VALUES 
('India', 2, 1380004385),
('Germany', 3, 83783942),
('France', 3, 65273511);

-- 7
ALTER TABLE countries
ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';

-- 8
INSERT INTO countries(country_name) VALUES(DEFAULT);

-- 9
INSERT INTO countries DEFAULT VALUES;

-- 10
CREATE TABLE countries_new (LIKE countries INCLUDING ALL);

-- 11
INSERT INTO countries_new SELECT * FROM countries;

-- 12
UPDATE countries
SET region_id = 1
WHERE region_id IS NULL;

-- 13
SELECT country_name, population * 1.1 AS "New Population" FROM countries;

-- 14
DELETE FROM countries WHERE population < 100000;

-- 15
DELETE FROM countries_new WHERE country_id IN (SELECT country_id FROM countries) RETURNING *;

-- 16
DELETE FROM countries RETURNING *;;
