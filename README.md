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

# PROJECT 1 (SALES DATA ANALYSIS)
## 1. Database and Table Creation
Database Creation: A database Sql_Project is created to hold the project data.
Table Creation: A Sales table is set up with various columns such as Customer, Products, Sales_Person, Region, Order_Date, Sales_Usd, Year, Month, Quarter, and Channel_Partners.
Primary Key: ID_Number is the primary key with auto_increment, uniquely identifying each sale entry.
## 2. Data Exploration and Category Counting
Customer Analysis:
The script lists distinct customers and counts the total number of unique customers.
The number of sales made to each customer is aggregated.
Product Analysis:
Similar operations are done for products, counting distinct products and sales for each.
Sales Person Analysis:
The script identifies the distinct salespersons and computes sales made by each.
Region Analysis:
The script checks the distinct regions and calculates the number of sales made in each region.
## 3. Maximum and Minimum Sales Analysis
The maximum and minimum sales values over the entire period are identified.
For each product, salesperson, region, and customer, maximum and minimum sales values are calculated along with the corresponding order date.
## 4. Sales Performance Over Time
Overall Sales:
The script computes the overall average and total sales for the entire period.
Customer-Specific Sales:
Average and total sales for each customer are computed.
Product-Specific Sales:
Similar metrics are computed for products (average and total sales per product).
Sales Person-Specific Sales:
The script calculates the average and total sales by each sales person.
Region-Specific Sales:
Sales data is aggregated by regions for average and total sales.
## 5. Monthly Sales Trends
The script calculates total monthly sales for the years 2012, 2013, and 2014, arranging months in order (January to December).
It also identifies the month with the maximum and minimum sales for each year (2012, 2013, 2014).
## 6. Quarterly Sales Trends
Quarterly sales trends are analyzed for 2012, 2013, and 2014.
The total sales per quarter for the entire period is also calculated.
## 7. Channel Partners Analysis
Total Contribution: The total sales contribution and number of transactions made by each Channel_Partners are calculated.
Top 5 and Bottom 5 Partners: The top and bottom 5 partners, based on total sales and transactions, are identified.
## 8. Impact of Multiple Orders on Sales
The script analyzes the impact of multiple orders on the same date by grouping the data by Order_Date, calculating the number of orders made and the total sales on that date.
## 9. Procedure for Product Data Extraction
A stored procedure Producttable is created to extract all sales data for a specific product. For example, the procedure is called for products like "Soft drinks", "Bottles", "Ice Cubes", and "Tonic".
## Key Insights Derived
Customer and Product Performance: Sales made by each customer and product category can be monitored.
Salesperson and Regional Performance: The script provides insights into the performance of individual salespersons and regions in terms of maximum, minimum, average, and total sales.
Sales Trends Over Time: Monthly and quarterly trends allow identifying peak and slow sales periods.
Channel Partners' Contribution: The analysis shows the most and least contributing partners to sales and transactions, helping in partner performance evaluation.
Order Frequency Impact: The impact of multiple orders on a single day on sales is analyzed to understand sales surges.
This SQL code essentially offers a complete view of sales data across various dimensions like customers, products, salespersons, regions, time (monthly/quarterly), and channel partners. The detailed analysis aids in decision-making regarding sales strategies, product focus, and partner collaboration.
