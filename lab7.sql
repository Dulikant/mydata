CREATE DATABASE lab7;

CREATE TABLE countries (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    surname VARCHAR(255),
    salary INTEGER,
    department_id INTEGER
);

CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    budget INTEGER
);

INSERT INTO countries (name) VALUES
('United States'),
('Canada'),
('Mexico'),
('Brazil'),
('Argentina'),
('United Kingdom'),
('France'),
('Germany'),
('Italy'),
('Japan');

INSERT INTO employees (name, surname, salary, department_id) VALUES
('John', 'Doe', 50000, 1),
('Jane', 'Smith', 55000, 2),
('Mike', 'Johnson', 60000, 3),
('Emily', 'Davis', 75000, 1),
('William', 'Garcia', 80000, 2),
('David', 'Martinez', 65000, 3),
('Sophia', 'Wilson', 70000, 1),
('James', 'Anderson', 90000, 2),
('Linda', 'Thomas', 85000, 3),
('Michael', 'Moore', 95000, 1);

INSERT INTO departments (budget) VALUES
(100000),
(150000),
(200000),
(250000),
(300000);

--1
CREATE INDEX idx_countries_name ON countries(name);

--2
CREATE INDEX idx_employees_name_surname ON employees(name, surname);

--3
CREATE UNIQUE INDEX idx_employees_salary ON employees(salary);

--4
CREATE INDEX idx_employees_name_substring ON employees(name);

--5
CREATE INDEX idx_employees_department_id ON employees(department_id, salary);
CREATE INDEX idx_departments_budget ON departments(budget);


--1
EXPLAIN ANALYZE
SELECT * FROM countries WHERE name = 'Canada';

--2
EXPLAIN ANALYZE
SELECT * FROM employees WHERE name = 'John' AND surname = 'Doe';

--3
EXPLAIN ANALYZE
SELECT * FROM employees WHERE salary < 80000 AND salary > 50000;

--4
EXPLAIN ANALYZE
SELECT * FROM employees WHERE substring(name from 1 for 4) = 'John';

--5
EXPLAIN ANALYZE
SELECT *
FROM employees e
JOIN departments d ON d.department_id = e.department_id
WHERE d.budget > 150000 AND e.salary < 80000;