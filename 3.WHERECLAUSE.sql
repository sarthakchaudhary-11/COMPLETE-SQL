use temp1;
create database sakila;
use sakila;

-- In operator >> Multiple condition but on the same column
select * from country
where continent in  ("Asia","Europe","Africa");

-- Between operator >> 
select Name , Continent ,SurfaceArea, Population from country
where Population between 10000 and 50000
order by Population desc;

select Name,Continent from country
where Name between  "China" and "India"
order by Name;

use sakila;
select * from film
where title like "A%"; -- All movies starting from A 

select * from film
where title like "B%";

select * from film
where title like "Z%";

select * from film
where title like "%A%"; -- Films having "A" somewhere in the movie name.

select * from film
where title like "AC%";

select * from film
where special_features like  "Behind the Scenes";

select * from film
where description like  "%Drama%";

