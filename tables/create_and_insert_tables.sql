CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50),
    head_name VARCHAR(50),
    budget INT,
    created_on DATE
);

INSERT INTO departments (department_id, dept_name, location, head_name, budget, created_on) VALUES
(101, 'HR', 'Mumbai', 'Anjali', 1500000, '2015-04-10'),
(102, 'Engineering', 'Bangalore', 'Vikram', 3000000, '2012-11-25'),
(103, 'Marketing', 'Delhi', NULL, 1800000, '2016-08-30'),
(104, 'Sales', 'Hyderabad', 'Renu', 1700000, '2018-01-12'),
(105, 'Finance', 'Chennai', 'Suresh', NULL, '2017-07-19'),
(106, 'Legal', NULL, 'Leena', 1600000, '2020-06-01');


CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    department_id INT,
    salary INT,
    join_date DATE,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

INSERT INTO employees (emp_id, name, age, department_id, salary, join_date) VALUES
(1, 'Ravi', 30, 101, 50000, '2021-01-10'),
(2, 'Meena', 27, 101, 52000, '2022-03-15'),
(3, 'Akash', 45, 102, 70000, '2018-07-22'),
(4, 'Divya', 35, NULL, 65000, '2019-10-30'),
(5, 'Nitin', 29, 103, 58000, '2020-02-01'),
(6, 'Surbhi', 32, 102, NULL, '2023-05-12'),
(7, 'Rakesh', 41, 101, 72000, '2017-06-11'),
(8, 'Neha', 26, 103, 51000, '2022-09-09'),
(9, 'Gaurav', 38, NULL, 60000, '2021-11-20'),
(10, 'Shruti', 31, 102, 64000, '2020-12-05');
