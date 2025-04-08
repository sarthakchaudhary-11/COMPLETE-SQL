CREATE DATABASE LEARN2;
USE LEARN2;

SELECT * FROM titanic_dataset;

-- BUILT IN FUNCTION
-- 1.STRING FUNCTION:-
-- Function	Description
-- LEN() / LENGTH()	Length of a string
-- UPPER()	Converts string to uppercase
-- LOWER()	Converts string to lowercase
-- SUBSTRING()	Extracts part of a string
-- REPLACE()	Replaces part of a string
-- TRIM()	Removes leading/trailing spaces
-- CONCAT()	Concatenates two or more strings

-- EXTRACT THE FIRST LETTER OF PASSENGER NAMES

SELECT NAME , LEFT(NAME,1) AS FIRST_LETTER
FROM titanic_dataset;

-- CONVERT THE PASSENGERS NAME CASE
SELECT UPPER(NAME) AS CAPITAL
FROM titanic_dataset;

SELECT lower(NAME) AS small
FROM titanic_dataset;

-- REPLACE Mr. WITH Sir
SELECT NAME , REPLACE(NAME , 'Mr.' ,'Sir') 
FROM titanic_dataset;

-- FIRST NAME
SELECT SUBSTRING_INDEX(NAME ,' ',-1) AS LAST_NAME
FROM titanic_dataset;

-- LAST NAME
SELECT substring_index(NAME,' ',1) AS FIRST_NAME
FROM titanic_dataset; 

-- LENGTH: Length of name
SELECT Name, LENGTH(Name) AS Name_Length FROM titanic_dataset;

-- UPPER: Convert to uppercase
SELECT UPPER(Name) AS Name_Upper FROM titanic_dataset;

-- LOWER: Convert to lowercase
SELECT LOWER(Name) AS Name_Lower FROM titanic_dataset;

-- SUBSTRING: Extract first 10 characters
SELECT SUBSTRING(Name, 1, 10) AS First_10_Chars FROM titanic_dataset;

-- SUBSTRING: Extract first characters
SELECT SUBSTRING(Name, 1, 1) AS First_10_Chars FROM titanic_dataset;

-- REPLACE: Replace "Mr." with "Mister"
SELECT REPLACE(Name, 'Mr.', 'Mister') AS Replaced_Name FROM titanic_dataset;

-- TRIM: Remove spaces from start/end
SELECT TRIM(Name) AS Trimmed_Name FROM titanic_dataset;

-- 2. AGGREGATE FUNCTION:-

-- Function	 Description
-- COUNT()	Counts number of rows
-- SUM()	Total sum of values
-- AVG()	Average of values
-- MAX()	Highest value
-- MIN()	Lowest value

-- COUNT: Total passengers
SELECT COUNT(*) AS Total_Passengers FROM titanic_dataset;

-- SUM: Total fare collected
SELECT SUM(Fare) AS Total_Fare FROM titanic_dataset;

-- AVG: Average fare
SELECT AVG(Fare) AS Average_Fare FROM titanic_dataset;

-- MAX and MIN fare
SELECT MAX(Fare) AS Max_Fare, MIN(Fare) AS Min_Fare FROM titanic_dataset;

-- 3. Numeric Functions in MySQL
-- ABS: Absolute value
SELECT Fare, ABS(Fare - 50) AS Absolute_Diff FROM titanic_dataset;

-- ROUND: Round fare to 2 decimal places
SELECT Fare, ROUND(Fare, 2) AS Rounded_Fare FROM titanic_dataset;

-- CEIL: Round fare up
SELECT Fare, CEIL(Fare) AS Fare_Ceil FROM titanic_dataset;

-- FLOOR: Round fare down
SELECT Fare, FLOOR(Fare) AS Fare_Floor FROM titanic_dataset;

-- MOD: Get remainder when dividing Fare by 10
SELECT Fare, MOD(Fare, 10) AS Fare_Mod_10 FROM titanic_dataset;

-- 4. Date Functions in MySQL
-- Current date and time
SELECT NOW() AS CurrentDateTime;

-- Extract year/month/day
SELECT YEAR(NOW()) AS Year, MONTH(NOW()) AS Month, DAY(NOW()) AS Day;

-- Date difference (example)
SELECT DATEDIFF('2025-04-05', '1912-04-15') AS Days_Between;


-- 5. Other Useful Functions
-- IFNULL: Handle NULL values in Cabin
SELECT Name, IFNULL(Cabin, 'Unknown') AS Cabin_Info FROM titanic_dataset;

-- COALESCE: Similar to IFNULL, but can check multiple fields
SELECT Name, COALESCE(Cabin, 'No Cabin') AS Final_Cabin FROM titanic_dataset;

-- CAST: Convert Fare to integer
SELECT Fare, CAST(Fare AS UNSIGNED) AS Fare_As_Int FROM titanic_dataset;

select substring_index(name,' ',-1) as first_name 
from titanic_dataset
limit 1;

-- group by
-- how many passengers survived in each class
SELECT Pclass, SUM(Survived) AS survived_passengers
FROM titanic_dataset
GROUP BY Pclass;

-- 1: Count passengers by gender
select sex , count(*) as Total_passengers
from titanic_dataset
group by sex;

--  2: Average fare paid by passenger class
select pclass , avg(fare) as avg_pair
from titanic_dataset
group by pclass;

-- 3: Number of survivors in each class
select pclass , sum(Survived) as Total_survivors
from titanic_dataset
group by pclass;

-- 4: Survival count by gender
select sex , sum(survived) as survived
from titanic_dataset
group by sex;

-- 5: Survival rate (%) by class
select pclass ,
round(sum(survived)*100.0 / count(*), 2) as Survival_Rate_Percentage
from titanic_dataset
group by pclass;

-- 6: Survival count by Sex and Pclass
select pclass , sex , 
count(*) as total_passengers,
sum(survived) as survived 
from titanic_dataset
group by pclass , sex;

-- replace missing age value with average
-- in pandas :- df.age.fillna(df.age.mean())
SELECT 
    Name,
    Pclass,
    COALESCE(Age, (SELECT AVG(Age) FROM titanic_dataset)) AS Age_Filled,
    Sex,
    Survived
FROM titanic_dataset;

-- length of names 
select name ,length(name) as length_of_names
from titanic_dataset;

-- classify passenger based on fare
-- if fare < 10 : low , if fare is b/w 10 & 50: Medium , if fare > 50: High
select PassengerId ,Ticket , fare ,
case 
when fare < 10 then 'LOW '
when fare > 10 and fare < 50 then 'MEDIUM '
when fare > 50 then 'HIGH'
end as FARE_CATEGORY
from titanic_dataset;

-- FIND THE TOTAL FARE COLLECTED BY EACH CLASS
SELECT PCLASS, SUM(FARE) AS TOTAL_FARE
FROM titanic_dataset
GROUP BY pclass;

-- find the survival rate for each gender
SELECT SEX , 
ROUND(SUM(SURVIVED * 100.0)/ COUNT(*)) AS SURVIVAL_RATE
FROM titanic_dataset
GROUP BY SEX;

-- FIND THE AVERAGE AGE OF SURVIVORS VS NON-SURVIVORS
SELECT  Survived ,
round(AVG(AGE)) AS AVG_AGE
FROM titanic_dataset
GROUP BY Survived;

-- FIND THE AVG FARE PAID BY EACH PCLASS
SELECT PCLASS , ROUND(AVG(FARE)) AS AVERAGE_FARE
FROM titanic_dataset
GROUP BY PCLASS;




