# SQL BASICS 
# SQL Project: Employee Management Database
This project demonstrates the creation and manipulation of an employee management database using SQL, covering a wide range of SQL functionalities. It is structured around two key tables:

Employee Demographics: Stores personal information such as employee IDs, first names, last names, age, and gender.
Employee Salary: Stores job titles and salary details.
Key Features:
## Database and Table Creation:

Created multiple tables including EmployeeDemographics, EmployeeSalary, and EmployeeEarnings.
Established primary keys, and implemented auto-incrementing fields.

## Data Insertion:
Inserted values into the tables with sample employee data to reflect different job roles and demographic details.

## CRUD Operations:
Demonstrated insertion (INSERT), updating (UPDATE), and deletion (DELETE) of employee data in various tables.
Used SQL_SAFE_UPDATES to enable flexibility in updates.

## Advanced Querying Techniques:
Select, Aggregate Functions: Utilized functions such as AVG, COUNT, SUM, MIN, and MAX to extract insights like the average salary per department and employee counts per role.
Joins: Showcased INNER JOIN, LEFT JOIN, RIGHT JOIN to combine data from multiple tables.
Group By and Order By: Organized data by departments, salary levels, and employee age, with added functionality of ROLLUP.
Subqueries: Implemented subqueries within SELECT and FROM clauses to calculate average salaries and other aggregate metrics.

## Conditional Queries:
Applied various conditional clauses such as WHERE, IN, LIKE, CASE, and HAVING to filter data, group employees by age categories, salary bands, and apply conditional logic on employee salaries based on their roles.

## Temporary Tables:
Created and used temporary tables to store intermediate data during analysis and computations.

## Stored Procedures:
Defined and called stored procedures to automate frequently used queries. This included procedures for generating employee salary reports and creating temporary tables dynamically.
 ## String Functions:
Demonstrated use of string manipulation functions like TRIM, REPLACE, SUBSTRING, and UPPER/LOWER to clean and transform employee data.

## CTEs (Common Table Expressions):
Used CTEs for more readable and recursive query operations, helping to group, count, and aggregate data efficiently.
## Partitioning:
Applied PARTITION BY to analyze salary distribution and gender demographics without traditional grouping.
## In conclusion these codes has got all basics required by one to queery database in SQL feel free to check it out.
## By learning all these one now able to querry any database and make sense and meaning out of its data.
This SQL project showcases the creation and management of an employee database, demonstrating table creation, CRUD operations, advanced querying (joins, group by, subqueries), conditional logic, stored procedures, CTEs, and string functions to efficiently analyze employee demographics, salary trends, and data categorization
