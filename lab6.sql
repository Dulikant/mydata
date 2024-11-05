-- 1.
CREATE DATABASE lab6;

-- 2.

CREATE TABLE locations (
    location_id SERIAL PRIMARY KEY,
    street_address VARCHAR(255),
    postal_code VARCHAR(12),
    city VARCHAR(30),
    state_province VARCHAR(12)
);

CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50) UNIQUE,
    budget INTEGER,
    location_id INTEGER REFERENCES locations
);

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    phone_number VARCHAR(20),
    salary INTEGER,
    department_id INTEGER REFERENCES departments
);

INSERT INTO locations (street_address, postal_code, city, state_province) VALUES
    ('123 Main St', '10001', 'New York', 'NY'),
    ('456 Oak Ave', '60601', 'Chicago', 'IL'),
    ('789 Pine Rd', '94101', 'San Francisco', 'CA'),
    ('101 Maple St', '98101', 'Seattle', 'WA'),
    ('202 Cedar Blvd', '33101', 'Miami', 'FL'),
    ('303 Walnut Ln', '75201', 'Dallas', 'TX'),
    ('404 Birch Dr', '30301', 'Atlanta', 'GA');

INSERT INTO departments (department_name, budget, location_id) VALUES
    ('Engineering', 500000, 1),
    ('Human Resources', 200000, 2),
    ('Sales', 300000, 3),
    ('Marketing', 250000, 4),
    ('Finance', 400000, 5),
    ('IT', 350000, 6),
    ('Customer Support', 150000, 7);

INSERT INTO employees (first_name, last_name, email, phone_number, salary, department_id) VALUES
    ('John', 'Doe', 'johndoe@example.com', '555-1234', 75000, 1),
    ('Jane', 'Smith', 'janesmith@example.com', '555-5678', 65000, 2),
    ('Mike', 'Brown', 'mikebrown@example.com', '555-8765', 80000, 3),
    ('Anna', 'Johnson', 'annajohnson@example.com', '555-4321', 72000, 4),
    ('Chris', 'Davis', 'chrisdavis@example.com', '555-8765', 70000, 5),
    ('Emma', 'Wilson', 'emmawilson@example.com', '555-1122', 90000, 1),
    ('Olivia', 'Martinez', 'oliviamartinez@example.com', '555-3344', 60000, 6),
    ('Liam', 'Anderson', 'liamanderson@example.com', '555-4455', 85000, NULL),
    ('Sophia', 'Taylor', 'sophiataylor@example.com', '555-5566', 64000, NULL),
    ('Noah', 'Thomas', 'noahthomas@example.com', '555-6677', 75000, 2),
    ('Ava', 'Jackson', 'avajackson@example.com', '555-7788', 73000, 3),
    ('Isabella', 'White', 'isabellawhite@example.com', '555-8899', 62000, 7),
    ('Mason', 'Harris', 'masonharris@example.com', '555-9900', 82000, 4),
    ('Mia', 'Clark', 'miaclark@example.com', '555-1010', 78000, 5),
    ('James', 'Lewis', 'jameslewis@example.com', '555-1111', 81000, 6),
    ('Benjamin', 'Robinson', 'benjaminrobinson@example.com', '555-1212', 95000, 1),
    ('Ella', 'Walker', 'ellawalker@example.com', '555-1313', 70000, 7),
    ('Lucas', 'Perez', 'lucasperez@example.com', '555-1414', 77000, 2),
    ('Harper', 'Hall', 'harperhall@example.com', '555-1515', 79000, 3),
    ('Elijah', 'Young', 'elijayoung@example.com', '555-1616', 80000, 4),
    ('Amelia', 'King', 'ameliaking@example.com', '555-1717', 85000, 5),
    ('Alexander', 'Scott', 'alexanderscott@example.com', '555-1818', 72000, 6),
    ('Sofia', 'Green', 'sofiagreen@example.com', '555-1919', 69000, 7),
    ('William', 'Adams', 'williamadams@example.com', '555-2020', 80000, NULL),
    ('Evelyn', 'Baker', 'evelynbaker@example.com', '555-2121', 81000, 1),
    ('Daniel', 'Gonzalez', 'danielgonzalez@example.com', '555-2222', 75000, 2),
    ('Avery', 'Nelson', 'averynelson@example.com', '555-2323', 74000, 3),
    ('Matthew', 'Carter', 'matthewcarter@example.com', '555-2424', 76000, 4),
    ('Scarlett', 'Mitchell', 'scarlettmitchell@example.com', '555-2525', 79000, 5),
    ('Jack', 'Perez', 'jackperez@example.com', '555-2626', 85000, 6),
    ('Zoe', 'Roberts', 'zoeroberts@example.com', '555-2727', 70000, 7),
    ('Henry', 'Turner', 'henryturner@example.com', '555-2828', 75000, NULL),
    ('Luna', 'Phillips', 'lunaphillips@example.com', '555-2929', 78000, 1),
    ('Leo', 'Campbell', 'leocampbell@example.com', '555-3030', 82000, 2),
    ('Mila', 'Parker', 'milaparker@example.com', '555-3131', 72000, 3),
    ('Jacob', 'Evans', 'jacobevans@example.com', '555-3232', 74000, 4),
    ('Riley', 'Edwards', 'rileyedwards@example.com', '555-3333', 68000, 5),
    ('David', 'Collins', 'davidcollins@example.com', '555-3434', 80000, 6),
    ('Layla', 'Stewart', 'laylastewart@example.com', '555-3535', 69000, 7),
    ('Isaac', 'Morris', 'isaacmorris@example.com', '555-3636', 76000, NULL);

--3.
SELECT
    e.first_name,
    e.last_name,
    e.department_id,
    d.department_name
FROM
    employees e
JOIN
    departments d ON e.department_id = d.department_id;

--4.
SELECT
    e.first_name,
    e.last_name,
    e.department_id,
    d.department_name
FROM
    employees e
JOIN
    departments d ON e.department_id = d.department_id
WHERE
    e.department_id IN (80, 40);

--5.
SELECT
    e.first_name,
    e.last_name,
    d.department_name AS department,
    l.city,
    l.state_province
FROM
    employees e
JOIN
    departments d ON e.department_id = d.department_id
JOIN
    locations l ON d.location_id = l.location_id;

--6.
SELECT
    d.department_name,
    d.department_id,
    e.first_name,
    e.last_name
FROM
    departments d
LEFT JOIN
    employees e ON d.department_id = e.department_id;

--7.
SELECT
    e.first_name,
    e.last_name,
    e.department_id,
    d.department_name
FROM
    employees e
LEFT JOIN
    departments d ON e.department_id = d.department_id;

