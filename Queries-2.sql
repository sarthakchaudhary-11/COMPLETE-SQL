create database learn2;
use learn2;

select * from titanic;

-- How many total records there
select count(*)
from titanic;

-- find the count of distinct names in the dataset
select count(distinct(name))
from titanic;
 -- Sort passengers by Fare in descending order and find top 5
 select * 
 from titanic
 order by Fare desc
 Limit 5;
 
 -- Find the second highest fare
 select * from titanic 
 order by fare desc 
 limit 1 offset 1;
 
 select * from titanic 
 order by fare desc 
 limit 1, 1;
 
 select * from titanic 
 order by fare desc 
 limit 1 offset 3; -- Give me one row after leaving 3 rows
 
 -- Operators
 SELECT 5+5;
 
 SELECT 10-5;
 
 SELECT 10*2;
 
 SELECT 12/6;
 
 SELECT 11%2;
 
 SELECT 5&3;
 
 SELECT 5|2;
 
 SELECT 5^3;
 
 SELECT 5=5;
 
 SELECT 5!=5;
 
 SELECT 5<>5;
 
 SELECT 10<3;
 
 SELECT 5 AND 6;
 
 -- Find the sum of passenger fare  and an additional tax of 5?
 select Name, Fare, (Fare+5) as fare_with_tax
 from titanic;
 -- GIve a discount of 5 to all the passenger?
 select Name, Fare, (Fare-5) as fare_with_disc
 from titanic;
 
 -- Double the fare of first class passenger?
 select Name, Fare, Fare*2
 from titanic
 where Pclass = 1; -- df[df.Pclass == 1]
 
 -- Find the number of female passengers.
 
select count(distinct(name))
from titanic
where Sex = 'female';

-- Find the no of female passengers who are from pclass 1 
 select count(distinct(name))
from titanic
where Sex = 'female' and Pclass = 1;

-- Find the number of female passengers who are not from pclass 2
 select count(distinct(name))
from titanic
where Sex = 'female' and Pclass != 2;

-- FIND THE PASSENGERS WHO ARE MALE AND OLDER THAN 30
select name
from titanic
where Sex = 'male' and age > 30;

-- Find the number of passegngers who are between age 20 and 40
SELECT *
FROM TITANIC
where age BETWEEN 20 AND 40;
-- ALL
-- Find passengers whose fare is greater than all recorded fares for third class passengers
SELECT *
FROM titanic
where fare > (select max(fare)
from titanic 
where pclass = 3);

SELECT *
FROM titanic
where fare > ALL(select fare
from titanic 
where pclass = 3);

select fare
from titanic 
where pclass = 3;

-- find passengers who are not in first class
select *
from titanic
where not pclass = 1;
-- find passengers who are either female or first class
select * from titanic
where sex = 'female' or Pclass=1;
-- find passengers whose age is not recorded
select * 
from titanic
where age is null;

-- find passengers who are on titanic and have a non null age

select * from titanic
where exists (select age
from titanic
where age is not null);


-- Find the passengers whose name starts with "C"
Select *
from titanic
where name like 'C%';

-- you want to see exact result
Select *
from titanic
where name like 'Cann, Mr. Ernest Charles';

-- Find the passengers whose name doesnt start with C
Select *
from titanic
where name NOT like 'C%';
-- Find the passengers whose name starts with A or B
Select *
from titanic
where name REGEXP '^[AB]'; -- ^ start of string


-- Find the name of passgengers which contains 'dr' in it
Select *
from titanic
where name REGEXP 'dr\.';

-- Find the name that ends with 'aina'
Select *
from titanic
where name REGEXP 'aina$'; -- $ matches the end of string

-- Find the names with double vowels
Select *
from titanic
where name REGEXP '[aeiou]{2}';

-- Find passengers who are in first or second class
select * from titanic
where pclass in (1, 2);

-- Add the survival status with the name
select name, survived, concat(name, '>> survived ', survived) as summary
from titanic;
-- Convert the name to uppercase
select upper(name)
from titanic;
-- Convert the name to lowercase
select lower(name)
from titanic;
-- Replace Mr. with Sir in the name
Select Name, REPLACE(Name, 'Mr.', 'Sir')
from titanic;














 

 

 