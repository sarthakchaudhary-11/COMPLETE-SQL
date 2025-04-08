create database learn;
use learn;

ALTER TABLE `titanic-dataset` RENAME TO titanic_dataset;
SELECT * FROM titanic_dataset;

-- How many total records are there?
select count(*)
from titanic_dataset; 

-- sort passengers by Fare in descending order and find top 5
select * from  titanic_dataset
order by FARE DESC
LIMIT 5;

-- FIND THE HIGHEST FARE 
SELECT * FROM titanic_dataset
ORDER BY FARE DESC
LIMIT 1;

-- FIND SECOND HIGHEST AND THIRD HIGHEST FARE.
SELECT * FROM titanic_dataset
ORDER BY FARE DESC
LIMIT 2 OFFSET 1;

-- GIVE 4TH ROW AFTER IGNORING 3 ROWS -- GIVE 4TH HIGHEST FARE. 
SELECT * FROM titanic_dataset
ORDER BY FARE DESC
LIMIT 1 OFFSET 3;

-- FIND THE SUM OF PASSENGERS FARE AND ADDITIONALTAX OF 5
SELECT FARE , NAME ,( FARE+5) AS FARE_TAX 
FROM titanic_dataset;

 -- GIVE A DISCOUNT OF 5 TO ALL CUSTOMER
 SELECT NAME , FARE , (FARE-5)  AS DISCOUNTED_FARE
 FROM titanic_dataset;
 
 -- DOUBLE THE FARE OF FIRST CLASS PASSENGER
 SELECT NAME , FARE , (FARE*2)  AS DOUBLED_FARE
 FROM titanic_dataset
 WHERE PassengerId=1;

-- FIND THE NUMBER OF FEMALE PASSENGERS
SELECT count(*) as NO_of_females from titanic_dataset
WHERE SEX = 'female';

-- Find the female passengers travelling in pclass 1 and pclass 3
SELECT count(*) as No_of_females 
from titanic_dataset
where Sex = 'female' and pclass in(1,3);

-- FINF THE NO. OF FEMALE PASSENGERS WHO ARENOT FROM CLASS2
SELECT COUNT(*) AS FEMALE_PASSENGERS 
FROM titanic_dataset
WHERE SEX = 'FEMALE' AND PCLASS !=2 ;

 -- FIND THE NO. OF MALE WHO ARE OLDER THAN 30
SELECT COUNT(*) AS No_OF_MALES 
FROM titanic_dataset
WHERE SEX = 'MALE' AND AGE>30; 

-- FIND THE NAMES OF MALE WHO ARE OLDER THAN 30
SELECT NAME 
FROM titanic_dataset
WHERE SEX = 'MALE' AND AGE>30; 

-- FIND THE NO. OF PASSENGERS WHO ARE BETWEEN 20 AND 40 IN AGE.
SELECT *
FROM titanic_dataset
WHERE AGE between 20 AND 40;

-- FIND PASSENGERS WHOSE FARE IS GREATER THAN  THAT OF THIRD CLASS PASSENGERS.
SELECT *
FROM titanic_dataset
WHERE FARE > (
SELECT MAX(FARE) 
FROM titanic_dataset 
WHERE PCLASS=3);           

SELECT *
FROM titanic_dataset
WHERE FARE > ALL (
SELECT FARE
FROM titanic_dataset 
WHERE PCLASS=3);  


-- FIND PASSENGERS WHO ARE NOT IN FIRST CLASS
SELECT * 
FROM titanic_dataset
WHERE PCLASS!=1;

-- FIND THE PASSENGERS WHO ARE EITHER IN FIRST CLASS OR FEMALE
SELECT*
FROM titanic_dataset
WHERE PCLASS = 1 OR SEX ='FEMALE';


-- FIND PASSENGER WHOSE AGE IS NOT RECORDED
SELECT *
FROM titanic_dataset
WHERE AGE IS NULL;

-- FIND THE PASSENGER WHOSE NAME STARTS WITH "C"
SELECT NAME
FROM titanic_dataset
WHERE NAME LIKE "C%";

-- FIND THE PASSENGER WHOSE NAME ENDS WITH "C"
SELECT NAME
FROM titanic_dataset
WHERE NAME LIKE "%A";

-- FIND THE NAMES WHO DOES NOT START WITH 'C'
SELECT NAME
FROM titanic_dataset
WHERE NAME NOT LIKE "C%";

-- FIND THE NAMES WHOSE NAME STARTS WITH A OR B
SELECT NAME
FROM titanic_dataset
WHERE NAME REGEXP "^A" OR "^B";  -- ^ MEANS START OF THE STRING

-- FIND THE NAMES OF PASSENGERS WHICH CONTAINS 'dr' IN IT
SELECT NAME
FROM titanic_dataset
WHERE NAME regexp "dr\.";

-- FIND THE NAMES WHICH ENDS WITH 'aina'
SELECT NAME
FROM titanic_dataset
WHERE NAME regexp "aina$"; -- $ MEANS END OF THE STRING

-- FIND THE NAMES WITH DOUBLE VOWELS
SELECT NAME
FROM titanic_dataset
WHERE NAME REGEXP "[a,e,i,o,u]{2}";

-- ADD THE SURVIVAL STATUS WITH THE NAME
SELECT NAME , SURVIVED  ,
CONCAT(NAME , '>> SURVIVED ' , SURVIVED) AS SUMMARY
FROM titanic_dataset;

-- convert lowercase to uppercase 
SELECT UPPER(NAME) AS CAPITAL
FROM titanic_dataset;

-- convert IN lowecase
SELECT lower(NAME) AS CAPITAL
FROM titanic_dataset;

-- REPLACE Mr. To Sir IN THE NAME
-- convert lowercase to uppercase 
SELECT NAME , REPLACE(NAME , 'Mr.' , 'Sir')
from titanic_dataset;

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





























