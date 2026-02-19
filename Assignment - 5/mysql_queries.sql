/* PART 1 – EMPLOYEE MANAGEMENT SYSTEM */

CREATE DATABASE EmployeeDB;
USE EmployeeDB;


-- Departments
CREATE TABLE Departments(
 dept_id INT PRIMARY KEY AUTO_INCREMENT,
 dept_name VARCHAR(100)
);

-- Employees
CREATE TABLE Employees(
 emp_id INT PRIMARY KEY AUTO_INCREMENT,
 emp_name VARCHAR(100),
 dept_id INT,
 manager_id INT,
 FOREIGN KEY (dept_id) REFERENCES Departments(dept_id),
 FOREIGN KEY (manager_id) REFERENCES Employees(emp_id)
);

-- Projects
CREATE TABLE Projects(
 proj_id INT PRIMARY KEY AUTO_INCREMENT,
 proj_name VARCHAR(100)
);

-- Employee-Project Mapping
CREATE TABLE Employee_Project(
 emp_id INT,
 proj_id INT,
 PRIMARY KEY(emp_id, proj_id),
 FOREIGN KEY(emp_id) REFERENCES Employees(emp_id),
 FOREIGN KEY(proj_id) REFERENCES Projects(proj_id)
);

-- Salaries
CREATE TABLE Salaries(
 emp_id INT,
 salary DECIMAL(10,2),
 FOREIGN KEY(emp_id) REFERENCES Employees(emp_id)
);


INSERT INTO Departments VALUES
(1,'IT'),
(2,'HR');

INSERT INTO Employees VALUES
(1,'Pooja',1,NULL),
(2,'Riya',1,1),
(3,'Amit',2,NULL);

INSERT INTO Projects VALUES
(1,'AI Project'),
(2,'Web Project');

INSERT INTO Employee_Project VALUES
(1,1),(1,2),(2,1);

INSERT INTO Salaries VALUES
(1,60000),(2,45000),(3,35000);


SELECT * FROM Employees;
SELECT * FROM Departments;
SELECT * FROM Projects;
SELECT * FROM Employee_Project;
SELECT * FROM Salaries;


-- Employees working on multiple projects
SELECT emp_id, COUNT(proj_id) AS total_projects
FROM Employee_Project
GROUP BY emp_id
HAVING COUNT(proj_id) > 1;

-- Total salary per department
SELECT d.dept_name, SUM(s.salary) AS total_salary
FROM Employees e
JOIN Departments d ON e.dept_id = d.dept_id
JOIN Salaries s ON e.emp_id = s.emp_id
GROUP BY d.dept_name;

-- Manager -> Subordinates hierarchy
SELECT m.emp_name AS Manager,
       e.emp_name AS Employee
FROM Employees e
JOIN Employees m ON e.manager_id = m.emp_id;



/* PART 2 – E-COMMERCE ANALYTICS */

CREATE DATABASE EcommerceDB;
USE EcommerceDB;


CREATE TABLE Products(
 product_id INT PRIMARY KEY AUTO_INCREMENT,
 name VARCHAR(100),
 price INT,
 category VARCHAR(50)
);

CREATE TABLE Customers(
 customer_id INT PRIMARY KEY AUTO_INCREMENT,
 name VARCHAR(100)
);

CREATE TABLE Orders(
 order_id INT PRIMARY KEY AUTO_INCREMENT,
 customer_id INT,
 order_date DATE,
 FOREIGN KEY(customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Order_Items(
 order_id INT,
 product_id INT,
 quantity INT,
 FOREIGN KEY(order_id) REFERENCES Orders(order_id),
 FOREIGN KEY(product_id) REFERENCES Products(product_id)
);

CREATE TABLE Reviews(
 review_id INT PRIMARY KEY AUTO_INCREMENT,
 product_id INT,
 rating INT,
 FOREIGN KEY(product_id) REFERENCES Products(product_id)
);


INSERT INTO Products VALUES
(1,'Phone',20000,'Electronics'),
(2,'Laptop',60000,'Electronics'),
(3,'Shoes',3000,'Fashion');

INSERT INTO Customers VALUES
(1,'Pooja'),
(2,'Riya');

INSERT INTO Orders VALUES
(1,1,'2025-01-10'),
(2,2,'2025-02-15');

INSERT INTO Order_Items VALUES
(1,1,2),
(1,3,1),
(2,2,1);

INSERT INTO Reviews VALUES
(1,1,5),
(2,2,4);


SELECT * FROM Products;
SELECT * FROM Customers;
SELECT * FROM Orders;
SELECT * FROM Order_Items;
SELECT * FROM Reviews;


-- Top-selling products
SELECT p.name, SUM(oi.quantity) AS total_sold
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.name
ORDER BY total_sold DESC;

-- Top-selling products per category
SELECT p.category, p.name, SUM(oi.quantity) AS total_sold
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.category, p.name
ORDER BY total_sold DESC;

-- Monthly sales trend
SELECT MONTH(order_date) AS month,
       COUNT(order_id) AS total_orders
FROM Orders
GROUP BY MONTH(order_date);

-- Customer purchase patterns
SELECT customer_id, COUNT(order_id) AS total_orders
FROM Orders
GROUP BY customer_id
ORDER BY total_orders DESC;

-- Product rating analysis
SELECT p.name, AVG(r.rating) AS avg_rating
FROM Reviews r
JOIN Products p ON r.product_id = p.product_id
GROUP BY p.name;
