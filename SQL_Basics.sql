create database ANALYSTTRAINING;
#Creating Table1
create table EmployeeDemographics(
Employee_ID int,
first_Name varchar(50),
Last_Name varchar(50),
Age int,
Gender varchar(50)
);
select * from EmployeeDemographics;

#creating table 2
create table EmployeeSalary(
EmployeeId int,
Jobtitle varchar(50),
Salary int
);
select * from employeesalary;

#Inserting Values into tables
#Table 1
insert into employeedemographics
values(1001,"Jim","Halpert",30,"Male"),
      (1002,"Pam","Beasley",30,"female"),
      (1003,"Dwight","Schrute",29,"Male"),
      (1004,"Angela","Martin",31,"female"),
      (1005,"Toby","frenderson",32,"Male"),
      (1006,"Michael","Scott",35,"Male"),
      (1007,"Mredith","Palmer",32,"female"),
      (1008,"Stanley","Hudson",38,"Male"),
      (1009,"Kevin","Malone",31,"Male"),
      (1010,"Paul","Wainaina",26,"female");
select * from employeedemographics;
#Table 2
insert into employeesalary
values(1001,"Salesman",45000),
      (1002,"Receptionist",36000),
      (1003,"Salesman",63000),
      (1004,"Accountant",47000),
      (1005,"HR",50000),
      (1006,"Regional Manager",65000),
      (1007,"Supplier Relations",41000),
      (1008,"Saleman",48000),
      (1009,"Accountant",42000),
      (1010,"SalesMan",48500);
select * from employeesalary;
set sql_safe_updates = 0;
update employeesalary
set Jobtitle = "Salesman"
where Employeeid = 1008;

#Select statement => top,distict,count,as,max,min,avg
select first_name,Age from employeedemographics;   #Select all statement
select avg(Age)  as "Average Age" from employeedemographics;  #Average function
select concat(first_name,"  ",last_name) as NAMES,Age      #Concartenate Statement
from employeedemographics;                                 #Combining first and last name
select  * from employeedemographics 
limit 3,5;                                                 #Limit/top statement

select count(Employee_Id) as "Total Entries" from employeedemographics;  #Count function  Counting employees

#	Distinct ;; Used is selecting different categories for categorical data ie Gender
select distinct(Employee_id) from employeedemographics;  
select distinct(Gender) from employeedemographics;    #Distinct function
select distinct(Jobtitle) from employeesalary;         #Selectng job tittles available

select count(distinct(Gender)) from employeedemographics;  #Combining distinct and count functions
select count(distinct(Jobtitle)) as "Levels Number"
from employeesalary;

select max(Salary) as "Maximum Salary" from employeesalary;  #Maximum function
select min(Salary) as "Minimun Salary" from employeesalary;  #minimum function
select avg(Salary) as "Average Salary" from employeesalary;  #Average function

#......Where statement:: =,  <>,  <,  >,  And,  Or,  Like,  Null,  Not Null,  in
select * from employeedemographics
where first_name = "Jim" ;               #Equal to function
select * from employeedemographics
where first_Name <> "Jim";               #Not equal to function
select * from employeedemographics
where Age > 30;                          #Greater than function
select * from employeedemographics
where Age < 30;                          #Less than statement
select * from employeedemographics
where Age > 30 and Gender = "Male";      #And function
select * from employeedemographics
where Age > 32 or Gender = "female";     #Or statement
select * from employeedemographics
where Last_Name like "S%";               #Like statement (wild card)
select * from employeedemographics
where first_Name like "M%";
select * from employeedemographics
where first_Name in("Jim","Toby","Michael","Smith");   #in statement
select * from employeesalary
where Jobtitle in("Salesman","Accountant") and Salary > 46000; #in & and statement

#.....group by,Order by............#
select Jobtitle ,sum(Salary) as "Total Department Salary" from employeesalary
group by Jobtitle with rollup;                                #group by
select gender,count(gender) from employeedemographics
where Age > 30
group by Gender with rollup;                                 #group by  with rollup
select gender,avg(Age) as "Average Age" from employeedemographics
group by Gender with rollup;

select gender,count(gender) as GenderCount from employeedemographics       #order by
where Age > 30
group by Gender 
order by GenderCount asc; 
select * from employeedemographics
order by age desc;
select * from employeesalary
order by Salary desc;
select concat(first_name,"  ",last_name) as Names,age from employeedemographics
order by age;
select * from employeedemographics
order by 3;                                       #Order by using column position

#..........JOINS ;;inner,full/left/Right/Outer join......#
insert into employeedemographics
values(1011,"John","Okelo",39,"Male");
insert into employeesalary
values (1012,"HR",54000);
select * from employeedemographics A               #Inner join
inner join employeesalary B
on A.Employee_ID = B.EmployeeId;  

select * from employeedemographics                #Left join/left outer join
left outer join employeesalary
on employeedemographics.Employee_ID = employeesalary.EmployeeId;

select * from employeedemographics                 #Right join/right outer join
right join employeesalary
on employeedemographics.Employee_ID = employeesalary.EmployeeId;

#Case study of joins 
#Geting employee with highest pay
select concat(A.first_Name,"  ",A.last_name) as Names,B.Salary
from employeedemographics A
inner join employeesalary B
on A.Employee_ID = B.EmployeeId
order by Salary desc
limit 1;
#Getting average salary of each departent
select B.Jobtitle,avg(Salary) as "Average Salary"
from employeedemographics A
inner join employeesalary B 
on A.Employee_ID = B.EmployeeId
group by Jobtitle;

#...............Union,Union 
select * from employeesalary;
create table EmployeeEarnings(
EmployeeId int primary key auto_increment,
Jobtitle varchar(50),
Salary int
);
alter table employeeearnings
auto_increment  = 1009;               #Seeting autoincremen to start from 1009 
insert into  employeeearnings(jobtitle,Salary)
values("Accountant",42000),
      ("Salesman",48500),
      ("Cook",20000),
      ("HR",54000),
      ("Sweeper",15000);
select * from employeeearnings;
select * from employeesalary                         #Union ;Removes duplicates
union 
select * from employeeearnings;

select * from employeesalary
union all                                            #Union all
select * from employeeearnings                       #Do not remove duplicates
order by EmployeeId;
select Employee_ID,first_Name,Age from employeedemographics
union
select EmployeeId,Jobtitle,Salary from employeesalary;

#........Case statement................#
select first_Name,Last_Name,Age,         #Assigning unique identifier of some range
case
    when Age > 31 then "OLD"
    when Age between 28 and 31 then "MIDDLE AGE"
    else "YOUNG"
end as "Age Group"
from employeedemographics
order by age;

select * ,
case 
  when Salary > 55000 then "TOP EARNER"
  when Salary between 45000 and 55000 then "MIDDLE EARNER"
  else "LOW EARNER"
end as "SALARY CATEGORY"
from employeesalary
order by Salary;
#Combining case and join...............................................................
select concat(A.first_Name,"  ",A.Last_name) as NAME,B.Salary,
case 
   when Salary > 55000 then "TOP EARNER"
   when Salary between 45000 and 55000 then "MIDDLE EARNER"
   else "LOW EARNER"
end as "SALARY CATEGORY"
from employeedemographics as A
inner join employeesalary as B
on A.Employee_ID = B.EmployeeId
order by Salary desc;
select distinct(Jobtitle) from employeesalary;
#.......Real scenario application of case function............................
#Salesman    Adding 5% Salary
#Receptinist   #Addug 3% Salary
#Accountant    #Adding 8% salary
#HR   #Adding 10% Salary
#Regional Manager  #Adding 12% salary
#Supplier Realtions  #Addng  3% salary
select  A.first_Name,A.Last_Name,B.Jobtitle,B.Salary,
case 
   when Jobtitle = "Salesman" then Salary + (Salary * .05)
   when Jobtitle = "Receptinist" then Salary + (Salary * 0.03)
   when Jobtitle = "Accountant" then Salary + (Salary * 0.08)
   when Jobtitle = "HR" then Salary + (Salary * .1)
   when Jobtitle = "Regional Manager"  then Salary + (Salary * .12)
   else Salary + (Salary * .03)
end as "New Salary"
from employeedemographics as A inner join 
employeesalary as B
on A.Employee_ID = B.EmployeeId
order by  "New Salary";


#..........Having Clause.......................................................................
select B.Jobtitle,count(B.Jobtitle)               #Count of employees in each department 
from employeedemographics as A                    #Then selectind departments wiith more 
inner join employeesalary as B                    #than one employee
on A.Employee_ID  = B.EmployeeId
group by Jobtitle
having count(B.jobtitle) > 1;

select B.Jobtitle,avg(B.Salary) as "Average Salary"   #Average salary of each department 
from employeedemographics as A                        #Then selecting average salary greater than 45000
inner join employeesalary as B
on A.Employee_ID  = B.EmployeeId
group by Jobtitle
having avg(B.Salary) > 45000
order by 2;

select concat(A.first_Name,"  ",A.Last_Name) as Name,B.Salary  #Selecting first,last name and Salary of each employee
from employeedemographics as A                                 # Ordering in ascendng order 
inner join employeesalary as B                                 #Then selecting emloyees with salary greater than 
on A.Employee_ID  = B.EmployeeId                               #average salary
having B.Salary > (select avg(Salary) from employeesalary )
order by 2 desc;


#Updating/Deleting data in table........................................................................
insert into employeedemographics(first_Name,Last_name)  #Inserting values into table
values("Carl","Max"),                                   #and leaving some blank
	  ("Washie","Ruthie");

set sql_safe_updates = 0;
update employeedemographics                #Updating missing values in Table
set employee_Id = 1011,                    #Refering to first name
    age = 40,
    gender = "Male"
where first_Name = "Carl";
select * from employeedemographics;
update employeedemographics         #Updating missing values
set employee_Id  = 1012,             #reffering to second name
Age = 26,
Gender = "female"
where Last_Name = "Ruthie";

update employeedemographics        #Changing age of first employee to 25
set Age = 25
where employee_Id = 1001;

delete from employeedemographics         #Deleting raws added to table employeedemographics
where employee_Id = 1011;                #Reffering to raws by employee_id
delete from employeedemographics
where Employee_ID = 1012;
select * from employeedemographics;


#.Aliasing.....................................................................................
#Involves giving new name to column selected or function used
#Aliasng column names
select first_Name as fName             #Using as selecting first name
from employeedemographics;
select concat(first_Name,"  ",Last_Name) Names    #Using space without as
from employeedemographics;                        #Selecting first and last names combined
select avg(Age) as Average_Age           #Average age 
from employeedemographics;
select avg(Salary) Average_Salary              #finding Average Salary
from employeesalary;

#Aliasing table names  => Applied in joins mostly
select Demo.first_Name,Demo.Age                #Aliasing employeedemographics table Demo
from employeedemographics as Demo;             #Thrn selecting first_Name and Age columns

select * from employeedemographics as A
left outer join employeesalary as B
on A.Employee_ID = B.EmployeeId
left outer join employeeearnings as C
on A.Employee_ID = C.EmployeeId;

#.Partition by..................................................................................................
select first_Name,Last_Name,Gender,Salary,
count(Gender) over (partition by Gender) as TotalGender
from employeedemographics as A
inner join employeesalary as B
on A.Employee_ID = B.EmployeeId;
               #Checking group by then comparing with partition by
select first_Name,Last_Name,Gender,Salary,
count(Gender)
from employeedemographics as A
inner join employeesalary as B
on A.Employee_ID = B.EmployeeId
group by Gender;

select concat(first_Name,"  ",Last_Name) as Name,Age ,Jobtitle,Salary,
count(Jobtitle) over (partition by Jobtitle) as "Total per Tittle"
from employeedemographics as A
inner join employeesalary as B
on A.Employee_ID = B.EmployeeId;


#..CTEs.....................................................................................................................................................
with cte_Employee as(                                                   #Creating cte with join of tables employeeDemographics
select Last_Name,Age,Gender,Salary,
count(Gender) over (partition by Gender) as GenderNumber,                # employeesalary then selecting some columns 
avg(Salary) over (partition by Gender) as "Gender Average Salary",
avg(Age) over (partition by Gender) as "Gender Average Age"
from  employeedemographics as A
inner join employeesalary as B
on A.Employee_ID = B.EmployeeId
where Salary >= 45000
)
select * from cte_Employee;
              
with cte as(                                                                 #Creating cte with join of tables employeeDemographics
select first_Name,Age,Gender,Jobtitle,Salary,                                # employeesalary then selecting some columns 
sum(Salary) over (partition by Jobtitle) as "Total Salary per Tittle",
count(Jobtitle) over (partition by Jobtitle) as "Employees per Department"
from employeedemographics as A
inner join employeesalary as B
on A.Employee_ID = B.EmployeeId
order by Jobtitle
)
select * from cte;


#..Temp Tables............................................................................................................................................................................................................
create temporary table TempEmployee(               #Creating temporary Table
EmployeeId int,
JobTitle varchar(50),
Salary int
);
insert into TempEmployee 
values(1001,"HR",54000);
insert into TempEmployee                       #Inserting values from employeesalary table
select * from employeesalary ;                 #into the temporary table
select * from TempEmployee;
#Use case
create temporary table TempEmployee2(                 #Creating temp table
Jobtitle varchar(50),
EmployeesPerJob int,
AverageAge int,
AverageSalary int
);
insert into  TempEmployee2                     #Inserting values into temp table
select Jobtitle,
count(Jobtitle) over (partition by Jobtitle),
avg(Age) over (partition by Jobtitle),
avg(Salary) over (partition by Jobtitle)
from employeedemographics as A
inner join employeesalary as B
on A.Employee_ID = B.EmployeeId;
select * from TempEmployee2;

create temporary table TempEmployee3(                #Creating temp table
JobTitle varchar(50),
PersonsPerJob int,
AvgSalary int,
AvgAge int
);
insert into TempEmployee3                              #Inserting values into temp table
select Jobtitle,count(Jobtitle),avg(Salary),avg(Age)
from employeedemographics as A
inner join employeesalary as B
on A.Employee_ID = B.EmployeeId
group by Jobtitle; 
select * from TempEmployee3;     

create temporary table TempEmployee4(                      #Creating temporary table
Name varchar(50),
Gender varchar(50),
Department varchar(50),
Persons_Per_Department int,
Age int,
AverageAge_PerDepartment int,
Salary int,
AverageSalary_PerDepartment int
);       
insert into TempEmployee4                                       #Inserting values into Temporary table
select concat(first_Name,"  ",Last_Name) ,Gender,Jobtitle,
count(Jobtitle) over (partition by Jobtitle),
Age,
avg(Age) over (partition by Jobtitle),
Salary,
avg(Salary) over (partition by Jobtitle)
from employeedemographics as A
inner join employeesalary as B
on A.Employee_ID = B.EmployeeId;
select * from TempEmployee4;
select *                                           #Selecting specific people with department from temp table TempEmployee4
from TempEmployee4                                 #Salesman department used
where Department = "Salesman";


#..String functions..........................................................................................................................................................
# Trim,Ltrim,Rtrim,Replace,Substring,upper and lower
create table EmployeeError(
EmployeeId varchar(50),
fIrstName varchar(50),
LastName varchar(50)
);
insert into employeeerror
select Employee_ID,first_Name,Last_Name 
from employeedemographics;
select * from employeeerror;
insert into employeeerror
values("1011 ","Ruthie","Washie"),    #Inserting values with Id that has spaces
	  (" 1012","Carl","Max"),         #To apply trim function on
      ("1013  ","Mark","Drump");
select EmployeeId,trim(EmployeeId) as IdTrim          #Ltrim function
 from employeeerror;
 select EmployeeId,ltrim(EmployeeId) as IdTrim          #Ltrim function
 from employeeerror;
 select EmployeeId,rtrim(EmployeeId) as IdTrim          #Rtrim function
 from employeeerror;
 select fIrstName,replace(firstName,"Mark","Donald") as NewfirstName     #Replace function
 from employeeerror;
 select fIrstName,substring(firstName,1,3) as firstThreeLetters,         #Substring function
 LastName ,substring(LastName,2,4) as fourLettersfromSecondPos
 from employeeerror;                                                #Used in fuzzy marching
 select fIrstName,upper(firstName) as "Capitalized first Name"      #Upper 
 from employeeerror;
 select LastName , lower(LastName) as "Lower Case LastName"          #Lower
 from employeeerror;
 
 
 #Stored procedures..............................................................................................................................................................................
 #Using delimiter and call
 delimiter $$
 create procedure Procedure1()                         #Creating stored procedure using join of tables
 begin                                                  #employeeDemo and EmployeeSalary
 select concat(first_Name,"  ",Last_Name) as fullName,  #Table has 2 coluns fullName,Jobtitle & Salary
 Jobtitle,Salary
 from employeedemographics as A
 inner join employeesalary as B
 on A.Employee_ID = B.EmployeeId; 
 end $$
 delimiter ;
 call Procedure1();                               #Getting the stored procedure

delimiter $$
create procedure Table1()                   #CReating stored procedure to store table
begin                                       #Employeedemographics
select * from employeedemographics;
end $$
delimiter ;
call Table1();

delimiter $$                                      #Stored Procedure while creating table
create procedure Temp_Employee3()                 #Temporary table
begin
create temporary table TempEmployee3(                #Creating temp table
JobTitle varchar(50),
PersonsPerJob int,
AvgSalary int,
AvgAge int
);
insert into TempEmployee3                              #Inserting values into temp table
select Jobtitle,count(Jobtitle),avg(Salary),avg(Age)
from employeedemographics as A
inner join employeesalary as B
on A.Employee_ID = B.EmployeeId
group by Jobtitle; 
end $$
delimiter ;
call Temp_Employee3()

#Altertng the stored procedure
delimiter $$                                      #Stored Procedure while creating table
alter procedure Temp_Employee3()                 #Temporary table
begin
create temporary table TempEmployee3(                #Creating temp table
@Jobtitle nvachar(100)
JobTitle varchar(50),
PersonsPerJob int,
AvgSalary int,
AvgAge int
);
insert into TempEmployee3                              #Inserting values into temp table
select Jobtitle,count(Jobtitle),avg(Salary),avg(Age)
from employeedemographics as A
inner join employeesalary as B
on A.Employee_ID = B.EmployeeId
where jobtitle = @jobtitle
group by Jobtitle; 
end $$
delimiter ; 

create procedure Table4(in title varchar(50))        #Creating procedure to get Employees by 
select first_Name,Last_Name,Jobtitle,Salary             #their jobtittle 
from employeedemographics as A                          #Join of tables employeeDemo & employeeSalary has been used
inner join employeesalary as B
on A.Employee_ID = B.EmployeeId
having Jobtitle = title
order by Salary;
call Table3("Salesman");
call Table3("HR");


#..Subquery..............................................................................................................................................................................................
#select,from,where statements
select *
from employeesalary;
select EmployeeId,Salary,                               #Subquery in select
(select avg(Salary) from employeesalary) as AvgSalary
from employeesalary;    
select EmployeeId,Salary,                               #Subquery with partition by
avg(Salary) over () as AverageSalary
from employeesalary; 

select EmployeeId,Salary,avg(Salary) as AvgSalary       #Group by do not work as illustared here
from employeesalary
group by EmployeeId
order by 1,2;   

#Subquery in from 
select A.EmployeeId,A.AverageSalary  from(           #Here Alias must be used  
select EmployeeId,Salary,                               
avg(Salary) over () as AverageSalary
from employeesalary
) as A; 
#Subquery in where
select * from                  #Selecting employees with salary above average
employeesalary
where Salary >= (select avg(Salary) from employeesalary);
select Employee_ID,Age,Jobtitle,Salary from
employeesalary as A inner join 
employeedemographics as B
on A.EmployeeId = B.Employee_ID
where Age > 30;
select * from employeesalary                      #Selecting employees wi age greater than 30 
where EmployeeId in(                              #Using subquery
select Employee_ID from employeedemographics
where Age > 30);


 