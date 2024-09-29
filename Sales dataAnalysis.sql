create database Sql_Project ;   #Creating databse for the project
create table Sales (                               #Creating Sales data table collumns
ID_Number int primary key auto_increment,          #Customer id number
Customer varchar(100),                             #Customer name
Products varchar(100),                             #Products column
Sales_Person varchar(100),                         #Sales Person 
Region varchar(100),                               #Region
Order_Date date,                                   #Order Date
Sales_Usd decimal(10,0),                                     #Sales in USD 
Year year,                                         #Year
Month varchar(100),                                #Month
Quarter varchar(10),                               #Quarter
Channel_Partners varchar(100));                    #Channel Partners
select * from Sales;                                #Viewing table datasales

#..................................................................................................................................................................................................................................................................
#Count of each categories for for rows with categorical data ;Customer,Products,Sales_Person,Region
#Customers
select distinct(Customer) from Sales;                                  #Checking  different customers 
select count(distinct(Customer)) as "Customer Count" from Sales;        #Count  of Customers categories
select Customer ,count(sales_Usd) as Sales_Made
 from Sales                                          #Checking number sales to each customer
group by Customer with rollup;

#Products
select distinct(Products) from sales;                #Cheking different products sold
select count(distinct(Products)) as "Products Count"  #Count of different catgories of Products
from Sales;
select Products ,count(Sales_Usd) as Sales_Made           #Cheking number of Sales of each product
from Sales 
group by Products with rollup;

#Sales Person
select distinct(Sales_Person) from sales;                            #Viewing different sales persons names
select count(distinct(Sales_Person)) as Number                       #Counting Sales Persons
from Sales;
select 	Sales_Person , count(Sales_Usd) as Sales_Made                   #Sales made by each Sales Person
from Sales 
group by Sales_Person with rollup;

#Region 
select distinct(Region) from Sales ;                       #Checking different Regions names 
select count(distinct(Region)) as "Regions Count"          #Count of regions categories
from Sales;
select Region, count(Sales_Usd) as Sales_Made                    #Counting total number of sales made in each region
from Sales 
group by Region with rollup;

#Maximum and minimun sales over the period
select max(Sales_Usd) as "Maximum Sale",min(Sales_Usd) as "Minimun Sale"
from sales;
 
#Maximum and Minimun sales of each product over the period  with date of order
select max(Sales_Usd)as "Maximum Sale", min(Sales_Usd) as "Minimum Sale"
from Sales;
select Products, max(Sales_Usd) as "Maximum Sale"   #Maximum sale of each product
,Order_Date from sales
group by Products;
select Products ,min(Sales_Usd) as "Minimum Sale",   #Minimun sale of each product
order_Date from sales
group by Products;

#Maximum and Minimun sales of each Sales_Person over the period  with date of order...............................................................................................................................
select Sales_Person ,max(sales_Usd) as "Maximum Sale",   #Maximum sale of each person
order_date from Sales 
group by Sales_Person;
select Sales_Person , min(Sales_Usd) as "Minimum Sale",    #Minimun sale of each sales person
order_date from Sales 
group by Sales_Person;

#Maximum and Minimun sales of each Region over the period  with date of order..........................................................................
select Region, max(Sales_Usd), Order_Date            #Maxmum Sale of each Region
from Sales
group by Region;
select Region, min(Sales_Usd),Order_Date           #Minimun Sale of each Region
from sales
group by Region;

#Maximum and Minimun sales to each Customer over the period  with date of order.......................................................................
select Customer, max(Sales_Usd),Order_Date      #Maximun Sale to eaxh customer
from Sales 
group by Customer;
select Customer, min(Sales_Usd),Order_Date      #Minimum Sale to each Customer
from Sales
group by Customer;

#Overall Average Sales,Total Sales made to each customer over the period...................................................................................................................................................................
select avg(Sales_Usd) as "Average Sales" ,   #Average  and Total Sales over the period
sum(Sales_Usd) as "Total Sales" from Sales;
    
select Customer,avg(Sales_Usd) as "Customer Average Sale"   #Average Sale to each customer
from Sales 
group by Customer with rollup;
select Customer,sum(Sales_Usd) as "Customer Total Sale"     #Total Sales to each Customer
from sales
group by Customer with rollup;
    
    select Products ,avg(Sales_Usd)  as "Products Average Sale"   #Products Average Sales
    from Sales 
    group by Products with rollup;
    select Products , sum(Sales_Usd) as "Products Total Sale"      #Products Total Sales
    from Sales 
    group by Products with rollup;
    
    select Sales_Person ,avg(Sales_Usd)  as "Sales Person Average Sale"   #Sales Persons Average Sales
    from Sales 
    group by Sales_Person with rollup;
    select Sales_Person , sum(Sales_Usd) as "Sales Person Total Sale"   #Sales Person total Sales
    from Sales 
    group by Sales_Person with rollup;
    
    select Region , avg(Sales_Usd) as "Region Average Sale"        #Average sales in each region
    from Sales 
    group by Region with rollup;
    select Region , sum(Sales_Usd) as "Region Total Sale"          #Total sales in each region
    from Sales
    group by Region with rollup;
    
    #Monthly Sales trend over the period each year, Maximum and minimum Sales Month.....................................................................................................................
    #Total monthly sales in 2012 and Maximun and minimum Sales Month 
    select Month , sum(Sales_Usd) as "Total Monthly Sales"         #Total monthly sales in 2012
    from Sales
    where Year = 2012
    group by month
    order by
    case when month = "January" then 1                      #Case used for months to appear in order January to December
          when month = "February" then 2
          when month = "March" then 3
          when month = "April" then 4
          when month = "May" then 5
          when month = "June" then 6
          when month = "July" then 7
          when month = "August" then 8
          when month = "September" then 9
          when month = "October" then 10
          when month = "November" then 11
          when month = "December" then 12
          end;
          select Month , sum(Sales_Usd) as Total_Sales from Sales     #Month with minimum Sales
          where Year = 2012
          group by Month
          order by Total_Sales
          limit 1;
          select Month , sum(Sales_Usd) as Total_Sales from Sales     #Month with maximum Sales
          where Year = 2012
          group by Month
          order by Total_Sales desc
          limit 1;
    
    #Total monthly sales in 2013 and Maximun and minimum Sales Month 
	select Month , sum(Sales_Usd) as "Total Monthly Sales"          
    from Sales
    where Year = 2013
    group by month
    order by
    case when month = "January" then 1              #Case used for months to appear in order January to December
          when month = "February" then 2
          when month = "March" then 3
          when month = "April" then 4
          when month = "May" then 5
          when month = "June" then 6
          when month = "July" then 7
          when month = "August" then 8
          when month = "September" then 9
          when month = "October" then 10
          when month = "November" then 11
          when month = "December" then 12
          end;
          select Month , sum(Sales_Usd) as Total_Sales from Sales     #Month with minimum Sales
          where Year = 2013
          group by Month
          order by Total_Sales
          limit 1;
          select Month , sum(Sales_Usd) as Total_Sales from Sales     #Month with maximum Sales
          where Year = 2013
          group by Month
          order by Total_Sales desc
          limit 1;
          
	#Total monthly sales in 2014 and Maximun and minimum Sales Month 
	select Month , sum(Sales_Usd) as "Total Monthly Sales"            
    from Sales
    where Year = 2014
    group by month
    order by
    case when month = "January" then 1                        #Case used for months to appear in order January to December
          when month = "February" then 2
          when month = "March" then 3
          when month = "April" then 4
          when month = "May" then 5
          when month = "June" then 6
          when month = "July" then 7
          when month = "August" then 8
          when month = "September" then 9
          when month = "October" then 10
          when month = "November" then 11
          when month = "December" then 12
          end;
          #Top and Bottom Sales month
          select Month , sum(Sales_Usd) as Total_Sales from Sales     #Month with minimum Sales
          where Year = 2014
          group by Month
          order by Total_Sales
          limit 1;
          select Month , sum(Sales_Usd) as Total_Sales from Sales     #Month with maximum Sales
          where Year = 2014
          group by Month
          order by Total_Sales desc
          limit 1;
          
          #Extracting table for each product with all columns 
          create procedure Producttable(in product varchar(100))   #Creating procedure functions for calling 
          select * from Sales 
          where Products = product;
          call Producttable("Soft drinks");                           #Soft drinks table
          call Producttable("Bottles") ;                              #Bottles table
          call Producttable("Ice Cubes") ;                            #Ice cubes table
          call Producttable("Tonic") ;                                #Tonic table
		
#Quarterly Sales trend ..........................................................................................................................
#2012 quarterly Sales trend
select Quarter,sum(Sales_Usd) 
as Total_Sales from Sales
where Year = 2012
group by Quarter ;

#2013 quarterly Sales trend
select Quarter,sum(Sales_Usd) 
as Total_Sales from Sales
where Year = 2013
group by Quarter ;

#2014 quarterly Sales trend
select Quarter,sum(Sales_Usd) 
as Total_Sales from Sales
where Year = 2014
group by Quarter ;

#Total Sales  per Quarter during the whole period
select Quarter , sum(Sales_Usd) as "Total Quarterly Sales" from Sales
group by Quarter;

#Channel Partner Contributions on Sales Vs Transactions made.........................................................................................................................................
#Total Sales Contribution made by each partner and Transactions made 
select Channel_Partners ,sum(Sales_Usd) as Total_Sales,
count(Order_Date) as Transactions from Sales
group by 	Channel_Partners
order by Total_Sales desc;

#Top 5 Partner that contributes most in  Sales and Transactions made
select Channel_Partners ,sum(Sales_Usd) as Total_Sales,
count(Order_Date) as Transactions from Sales
group by 	Channel_Partners
order by Total_Sales desc
limit 0,5; 

#Top 5 Partner that contributes Least in  Sales and Transactions made
select Channel_Partners ,sum(Sales_Usd) as Total_Sales,
count(Order_Date) as Transactions from Sales
group by 	Channel_Partners
order by Total_Sales 
limit 0,5;


#Impact of Multiple Orders on Same Date on 	Sales....................................................................................................................................................................................................
select Order_Date, count(Order_Date) as Orders_Made,sum(Sales_Usd) as Total_Sales_Made
from Sales 
group by Order_Date
order by Orders_Made desc;

#Top and bottom Sales Month each year.....................................................................................................................................................

