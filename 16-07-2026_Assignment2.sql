Assignments on All types of joins

Table 1: Departments

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50),
    Location VARCHAR(50)
);

INSERT INTO Departments VALUES
(1,'HR','New York'),
(2,'Finance','Chicago'),
(3,'IT','Dallas'),
(4,'Marketing','Boston'),
(5,'Sales','Seattle'),
(6,'Operations','Atlanta');

Table 2: Employees

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10,2),
    ManagerID INT,
    JoiningDate DATE
);

INSERT INTO Employees VALUES
(101,'John',1,50000,NULL,'2020-01-15'),
(102,'Emma',2,65000,101,'2021-03-10'),
(103,'David',3,70000,101,'2019-07-22'),
(104,'Sophia',3,72000,103,'2022-05-01'),
(105,'Michael',5,55000,102,'2021-09-18'),
(106,'Olivia',NULL,48000,102,'2023-01-12'),
(107,'James',4,60000,103,'2022-10-20'),
(108,'William',7,75000,101,'2020-08-11'),
(109,'Ava',NULL,52000,NULL,'2024-02-15'),
(110,'Isabella',5,68000,105,'2021-06-05');

Table 3: Projects

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(50),
    DepartmentID INT,
    Budget DECIMAL(12,2)
);

INSERT INTO Projects VALUES
(201,'Payroll System',1,150000),
(202,'Audit System',2,200000),
(203,'Website Redesign',4,100000),
(204,'ERP Upgrade',3,500000),
(205,'Sales Dashboard',5,175000),
(206,'Automation',6,250000),
(207,'AI Chatbot',8,300000);

Table 4: EmployeeProjects

CREATE TABLE EmployeeProjects (
    EmployeeID INT,
    ProjectID INT
);

INSERT INTO EmployeeProjects VALUES
(101,201),
(102,202),
(103,204),
(104,204),
(105,205),
(107,203),
(110,205),
(103,207),
(108,207),
(109,202);

Table Relationships
Departments
--------------
DepartmentID (PK)

Employees
--------------
DepartmentID -> Departments

Projects
--------------
DepartmentID -> Departments

EmployeeProjects
--------------
EmployeeID -> Employees
ProjectID -> Projects


Below are the SQL queries based on the reference tables you provided.

---

# BASIC ASSIGNMENTS

## UNION

### 1. Display all employee names from current and former employees without duplicates.


SELECT EmployeeName
FROM CurrentEmployees
UNION
SELECT EmployeeName
FROM FormerEmployees;


### 2. Display all departments from both employee tables.

SELECT Department
FROM CurrentEmployees
UNION
SELECT Department
FROM FormerEmployees;


### 3. Display all customer names from domestic and international customers.

SELECT CustomerName
FROM DomesticCustomers
UNION
SELECT CustomerName
FROM InternationalCustomers;


### 4. Display all customer cities without duplicates.

SELECT City
FROM DomesticCustomers
UNION
SELECT City
FROM InternationalCustomers;


### 5. Display all order amounts from both order tables without duplicates.

SELECT Amount
FROM OnlineOrders
UNION
SELECT Amount
FROM StoreOrders;


---

## UNION ALL

### 1. Display all employee names including duplicates.

SELECT EmployeeName
FROM CurrentEmployees
UNION ALL
SELECT EmployeeName
FROM FormerEmployees;


### 2. Display all departments including duplicate values.

SELECT Department
FROM CurrentEmployees
UNION ALL
SELECT Department
FROM FormerEmployees;


### 3. Display all customer names including duplicates.

SELECT CustomerName
FROM DomesticCustomers
UNION ALL
SELECT CustomerName
FROM InternationalCustomers;


### 4. Display all customer cities including duplicates.

SELECT City
FROM DomesticCustomers
UNION ALL
SELECT City
FROM InternationalCustomers;


### 5. Display all order amounts including duplicate values.

SELECT Amount
FROM OnlineOrders
UNION ALL
SELECT Amount
FROM StoreOrders;


---

## EXCEPT

### 1. Find current employees who are not former employees.

SELECT *
FROM CurrentEmployees
EXCEPT
SELECT *
FROM FormerEmployees;


### 2. Find former employees who are not current employees.

SELECT *
FROM FormerEmployees
EXCEPT
SELECT *
FROM CurrentEmployees;


### 3. Find domestic customers not present internationally.

SELECT *
FROM DomesticCustomers
EXCEPT
SELECT *
FROM InternationalCustomers;


### 4. Find online orders not present in store orders.

SELECT *
FROM OnlineOrders
EXCEPT
SELECT *
FROM StoreOrders;


### 5. Find departments that exist only in current employees.

SELECT Department
FROM CurrentEmployees
EXCEPT
SELECT Department
FROM FormerEmployees;


---

## INTERSECT

### 1. Find employees present in both tables.

SELECT *
FROM CurrentEmployees
INTERSECT
SELECT *
FROM FormerEmployees;


### 2. Find common departments.

SELECT Department
FROM CurrentEmployees
INTERSECT
SELECT Department
FROM FormerEmployees;


### 3. Find customers present in both customer tables.

SELECT *
FROM DomesticCustomers
INTERSECT
SELECT *
FROM InternationalCustomers;


### 4. Find common cities.

SELECT City
FROM DomesticCustomers
INTERSECT
SELECT City
FROM InternationalCustomers;


### 5. Find common orders.

SELECT *
FROM OnlineOrders
INTERSECT
SELECT *
FROM StoreOrders;


---

# INTERMEDIATE ASSIGNMENTS

## UNION

### 1. Display all employee IDs and names.

SELECT EmployeeID, EmployeeName
FROM CurrentEmployees
UNION
SELECT EmployeeID, EmployeeName
FROM FormerEmployees;


### 2. Display all customer IDs and names.

SELECT CustomerID, CustomerName
FROM DomesticCustomers
UNION
SELECT CustomerID, CustomerName
FROM InternationalCustomers;


### 3. Display all salaries without duplicates.

SELECT Salary
FROM CurrentEmployees
UNION
SELECT Salary
FROM FormerEmployees;


### 4. Display all order IDs.

SELECT OrderID
FROM OnlineOrders
UNION
SELECT OrderID
FROM StoreOrders;


### 5. Combine employee and former employee department lists.

SELECT Department
FROM CurrentEmployees
UNION
SELECT Department
FROM FormerEmployees;


---

## UNION ALL

### 1. Count total rows returned using UNION ALL.

SELECT COUNT(*)
FROM
(
SELECT *
FROM CurrentEmployees
UNION ALL
SELECT *
FROM FormerEmployees
) AS TotalRows;


### 2. Display all customer records including duplicates.

SELECT *
FROM DomesticCustomers
UNION ALL
SELECT *
FROM InternationalCustomers;


### 3. Display all salaries including duplicates.

SELECT Salary
FROM CurrentEmployees
UNION ALL
SELECT Salary
FROM FormerEmployees;


### 4. Display all customer cities.

SELECT City
FROM DomesticCustomers
UNION ALL
SELECT City
FROM InternationalCustomers;


### 5. Display all order amounts.

SELECT Amount
FROM OnlineOrders
UNION ALL
SELECT Amount
FROM StoreOrders;


---

## EXCEPT

### 1. Find employee IDs existing only in CurrentEmployees.

SELECT EmployeeID
FROM CurrentEmployees
EXCEPT
SELECT EmployeeID
FROM FormerEmployees;


### 2. Find employee IDs existing only in FormerEmployees.

SELECT EmployeeID
FROM FormerEmployees
EXCEPT
SELECT EmployeeID
FROM CurrentEmployees;


### 3. Find customer IDs existing only in DomesticCustomers.

SELECT CustomerID
FROM DomesticCustomers
EXCEPT
SELECT CustomerID
FROM InternationalCustomers;


### 4. Find customer IDs existing only in InternationalCustomers.

SELECT CustomerID
FROM InternationalCustomers
EXCEPT
SELECT CustomerID
FROM DomesticCustomers;


### 5. Find online order IDs not found in StoreOrders.

SELECT OrderID
FROM OnlineOrders
EXCEPT
SELECT OrderID
FROM StoreOrders;


---

## INTERSECT

### 1. Find employee IDs common to both tables.

SELECT EmployeeID
FROM CurrentEmployees
INTERSECT
SELECT EmployeeID
FROM FormerEmployees;


### 2. Find common customer IDs.

SELECT CustomerID
FROM DomesticCustomers
INTERSECT
SELECT CustomerID
FROM InternationalCustomers;


### 3. Find common order IDs.

SELECT OrderID
FROM OnlineOrders
INTERSECT
SELECT OrderID
FROM StoreOrders;


### 4. Find common salaries.

SELECT Salary
FROM CurrentEmployees
INTERSECT
SELECT Salary
FROM FormerEmployees;


### 5. Find common departments.

SELECT Department
FROM CurrentEmployees
INTERSECT
SELECT Department
FROM FormerEmployees;


---

# ADVANCED ASSIGNMENTS

## UNION

### 1. Combine employee names with customer names into one list.

SELECT EmployeeName AS Name
FROM CurrentEmployees
UNION
SELECT CustomerName
FROM DomesticCustomers;


### 2. Create a unique list of all people and organizations.

SELECT EmployeeName AS Name
FROM CurrentEmployees
UNION
SELECT EmployeeName
FROM FormerEmployees
UNION
SELECT CustomerName
FROM DomesticCustomers
UNION
SELECT CustomerName
FROM InternationalCustomers;


### 3. Display all departments from both tables in alphabetical order.

SELECT Department
FROM CurrentEmployees
UNION
SELECT Department
FROM FormerEmployees
ORDER BY Department;


### 4. Combine customer cities and employee departments into one result set.

SELECT City AS Place
FROM DomesticCustomers
UNION
SELECT Department
FROM CurrentEmployees;


### 5. Display all IDs from employees and customers.

SELECT EmployeeID AS ID
FROM CurrentEmployees
UNION
SELECT CustomerID
FROM DomesticCustomers;


---

## UNION ALL

### 1. Combine all employee and former employee records with duplicates.

SELECT *
FROM CurrentEmployees
UNION ALL
SELECT *
FROM FormerEmployees;


### 2. Display all order records.

SELECT *
FROM OnlineOrders
UNION ALL
SELECT *
FROM StoreOrders;


### 3. Display all customer records.

SELECT *
FROM DomesticCustomers
UNION ALL
SELECT *
FROM InternationalCustomers;


### 4. Display employee names with a new column indicating the source table.

SELECT EmployeeName,'Current' AS Source
FROM CurrentEmployees
UNION ALL
SELECT EmployeeName,'Former'
FROM FormerEmployees;


### 5. Combine online and store orders with a source column.

SELECT OrderID,CustomerID,Amount,'Online' AS Source
FROM OnlineOrders
UNION ALL
SELECT OrderID,CustomerID,Amount,'Store'
FROM StoreOrders;


---

## EXCEPT

### 1. Find customers who ordered online but never ordered in-store.

SELECT CustomerID
FROM OnlineOrders
EXCEPT
SELECT CustomerID
FROM StoreOrders;


### 2. Find customers who ordered in-store but never ordered online.

SELECT CustomerID
FROM StoreOrders
EXCEPT
SELECT CustomerID
FROM OnlineOrders;


### 3. Find employee names existing only in current employees.

SELECT EmployeeName
FROM CurrentEmployees
EXCEPT
SELECT EmployeeName
FROM FormerEmployees;


### 4. Find departments unique to former employees.

SELECT Department
FROM FormerEmployees
EXCEPT
SELECT Department
FROM CurrentEmployees;


### 5. Find customer cities unique to domestic customers.

SELECT City
FROM DomesticCustomers
EXCEPT
SELECT City
FROM InternationalCustomers;


---

## INTERSECT

### 1. Find customers who ordered both online and in-store.

SELECT CustomerID
FROM OnlineOrders
INTERSECT
SELECT CustomerID
FROM StoreOrders;


### 2. Find employees existing in both tables.

SELECT *
FROM CurrentEmployees
INTERSECT
SELECT *
FROM FormerEmployees;


### 3. Find departments appearing in both employee tables.

SELECT Department
FROM CurrentEmployees
INTERSECT
SELECT Department
FROM FormerEmployees;


### 4. Find customer names appearing in both customer tables.

SELECT CustomerName
FROM DomesticCustomers
INTERSECT
SELECT CustomerName
FROM InternationalCustomers;


### 5. Find common salaries between current and former employees.

SELECT Salary
FROM CurrentEmployees
INTERSECT
SELECT Salary
FROM FormerEmployees;

