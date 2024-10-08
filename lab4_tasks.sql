--1
CREATE DATABASE lab4;

--2
CREATE TABLE WAREHOUSES(
    code SERIAL PRIMARY KEY,
    location VARCHAR(255),
    capacity INTEGER
);

CREATE TABLE BOXES(
    code VARCHAR(4),
    contents VARCHAR(255),
    value INTEGER,
    warehouse INTEGER
);

--3
INSERT INTO WAREHOUSES(location, capacity) VALUES ('Chicago', 3),
                                                  ('Chicago', 4),
                                                  ('New York', 7),
                                                  ('Los Angeles', 2),
                                                  ('San Francisco', 8);
INSERT INTO BOXES(code, contents, value, warehouse) VALUES ('0MN7', 'Rocks', 180, 3),
                                                           ('4H8P', 'Rocks', 250, 1),
                                                           ('4RT3', 'Scissors', 190, 4),
                                                           ('7G3H', 'Rocks', 200, 1),
                                                           ('8JN6','Papers', 75, 1),
                                                           ('8Y6U', 'Papers', 50 ,3),
                                                           ('9J6F', 'Papers', 175, 2),
                                                           ('LL08', 'Rocks', 140, 4),
                                                           ('P0H6', 'Scissors', 125, 1),
                                                           ('P2T6', 'Scissors', 150, 2),
                                                           ('TU55', 'Papers', 90, 5);

--4
SELECT * FROM WAREHOUSES;

--5
SELECT * FROM BOXES
WHERE value > 150;

--6
SELECT DISTINCT contents FROM BOXES;

--7
SELECT warehouse, COUNT(*) as number_of_boxes FROM BOXES GROUP BY warehouse ORDER BY number_of_boxes desc, warehouse asc;


--8
SELECT warehouse, COUNT(*) as number_of_boxes FROM BOXES GROUP BY warehouse HAVING COUNT(*) > 2;

--9
INSERT INTO WAREHOUSES(location, capacity) VALUES('New York', 3);

--10
INSERT INTO BOXES(code, contents, value, warehouse) VALUES('H5RT', 'Papers', 200, 2);

--11
UPDATE BOXES
SET value = value * 0.85
WHERE value = (
    SELECT value FROM BOXES
    ORDER BY value DESC
    OFFSET 2 LIMIT 1
    )
returning *;

--12
DELETE FROM BOXES
WHERE value < 150
RETURNING *;

--13
DELETE FROM BOXES
WHERE warehouse = (
    SELECT
        code
    FROM
        WAREHOUSES
    WHERE
        location = 'New York'
)
RETURNING *;

SELECT * FROM WAREHOUSES;