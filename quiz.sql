CREATE SCHEMA employees_tracking;

CREATE TABLE employees_tracking.employees_table(
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(200),
    last_name VARCHAR(200),
    gender VARCHAR(20),
    department VARCHAR(200),
    date_of_hire DATE,
    salary DECIMAL(10,2)
   
);

-- DROP TABLE employees_tracking.employees_table

INSERT INTO employees_tracking.employees_table (employee_id, first_name, last_name, gender, department,date_of_hire, salary)
VALUES
(1,'john','doe','male','IT','2018-05-01',60000.00),
(2,'jane','smith','female','marketing','2019-06-15',50000.00),
(3,'michael','johnson','female','finance','2017-03-10',75000.00),
(4,'emily','davis','female','IT','2020-11-20',70000.00),
(5,'sarah','brown','female','marketing','2016-07-30',45000.00),
(6,'david','wilson','male','sales','2019-01-05',55000.00),
(7,'chris','taylor','male','IT','2022-02-25',65000.00);

SELECT *
FROM employees_table

CREATE TABLE employees_tracking.products_table (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL
);
INSERT INTO employees_tracking.products_table (product_id, product_name, category, price, stock) VALUES
(1, 'Laptop', 'Electronics', 1200.00, 30),
(2, 'Desk', 'Furniture', 300.00, 50),
(3, 'Chair', 'Furniture', 150.00, 200),
(4, 'Smartphone', 'Electronics', 800.00, 75),
(5, 'Monitor', 'Electronics', 250.00, 40),
(6, 'Bookshelf', 'Furniture', 100.00, 60),
(7, 'Printer', 'Electronics', 200.00, 25)


CREATE TABLE employees_tracking.sales_table (
    sale_id INT PRIMARY KEY,
    product_id INT NOT NULL,
    employee_id INT NOT NULL,
    sale_date DATE NOT NULL,
    quantity INT NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_product
        FOREIGN KEY (product_id) REFERENCES employees_tracking.products_table(product_id),
    CONSTRAINT fk_employee
        FOREIGN KEY (employee_id) REFERENCES employees_tracking.employees_table(employee_id)
);
INSERT INTO employees_tracking.sales_table (sale_id, product_id, employee_id, sale_date, quantity, total)
VALUES
(1, 1, 1, '2021-01-15', 2, 2400.00),
(2, 2, 2, '2021-03-22', 1, 300.00),
(3, 3, 3, '2021-05-10', 4, 600.00),
(4, 4, 4, '2021-07-18', 3, 2400.00),
(5, 5, 5, '2021-09-25', 2, 500.00),
(6, 6, 6, '2021-11-30', 1, 100.00),
(7, 7, 1, '2022-02-15', 1, 200.00),
(8, 1, 2, '2022-04-10', 1, 1200.00),
(9, 2, 3, '2022-06-20', 2, 600.00),
(10, 3, 4, '2022-08-05', 3, 450.00),
(11, 4, 5, '2022-10-11', 1, 800.00),
(12, 5, 6, '2022-12-29', 4, 1000.00);

--1
SELECT *
FROM employees_tracking.employees_table;


--2
SELECT first_name AS name
FROM employees_tracking.employees_table;

--3
SELECT DISTINCT department 
FROM employees_tracking.employees_table;


--4
SELECT COUNT(employee_id) 
FROM employees_tracking.employees_table;


--5
SELECT SUM(salary) as total_salary
FROM employees_tracking.employees_table;


--6
SELECT AVG(salary) as average_salary
FROM employees_tracking.employees_table;


--7
SELECT MAX(salary) as highest_salary
FROM employees_tracking.employees_table;


--8
SELECT MIN(salary) as lowest_salary
FROM employees_tracking.employees_table;


--9
select COUNT(employee_id) as male_employees
FROM employees_tracking.employees_table
where gender = 'male';


--10
select COUNT(employee_id) as female_employees
FROM employees_tracking.employees_table
where gender = 'female';


--11
SELECT COUNT(employee_id) ,
EXTRACT (YEAR FROM date_of_hire ) as hire_date
FROM employees_tracking.employees_table
WHERE EXTRACT (YEAR FROM date_of_hire) = 2020
GROUP BY(date_of_hire);


--12
SELECT AVG(salary) as average_salary_in_IT
FROM employees_tracking.employees_table
where department = 'IT';


--13
select department, COUNT(employee_id) as total_employees
FROM employees_tracking.employees_table
group by department;


--14
select department , SUM(salary) as total_salary
FROM employees_tracking.employees_table
group by department;


--15
SELECT department , MAX(salary) AS total_salary
FROM employees_tracking.employees_table
GROUP BY department;


--16
SELECT department , MIN(salary) AS total_salary
FROM employees_tracking.employees_table
GROUP BY department;


--18
SELECT gender, COUNT(employee_id) AS count_of_employees_gender_based
FROM employees_tracking.employees_table
GROUP BY gender;


--19
SELECT first_name AS name, department, salary  
FROM employees_tracking.employees_table
ORDER BY salary DESC
LIMIT 5;


--20
SELECT COUNT(DISTINCT first_name)
FROM employees_tracking.employees_table;




--21
SELECT *
FROM employees_tracking.employees_table
WHERE employee_id NOT IN(SELECT employee_id FROM employees_tracking.sales_table);


--22
SELECT * FROM  employees_tracking.employees_table
ORDER BY date_of_hire ASC
LIMIT 10;


--23
SELECT first_name, COUNT(sales_id) AS total_sales
FROM employees_table 
JOIN sales_table ON employee_id = employee_id
GROUP BY employee_id ,first_name;

--24
SELECT employee_id,COUNT(sale_id) AS total_sales
FROM employees_tracking.sales_table
GROUP BY employee_id;


--25
SELECT e_table.employee_id, e_table.first_name, e_table.last_name, SUM(s_table.total) AS total_sales
FROM employees_tracking.sales_table s_table
JOIN employees_tracking.employees_table e_table ON s_table.employee_id = e_table.employee_id
GROUP BY e_table.employee_id, e_table.first_name, e_table.last_name
ORDER BY total_sales DESC
LIMIT 1;


--26

--27

--28

--29

--30


