use world;
select Name,District,Population from city;
select * from country;
Alter table city change column Name City_Name char(35);
Alter table country change column Name Country_Name char(52);

Alter table city change column Population City_Pop int;
Alter table country change column Population Country_Pop int;

select Code,Country_name from country;

select 
Country_name,Region,SurfaceArea,Country_pop,LifeExpectancy,GNP,
Country_Pop/1000000 as Cou_Pop_in_mn, GNP/1000 as GNP_in_bn 
from country;

select 
Country_name,Region,SurfaceArea,Country_pop,LifeExpectancy,GNP,
Country_Pop/1000000 as Cou_Pop_in_mn, GNP/1000 as GNP_in_bn, round(GNP*1000000/Country_Pop,0) as Per_cap_GNP  
from country;

select * from country
where LifeExpectancy = 77.4;

select 
Country_name,Region,SurfaceArea,Country_pop,LifeExpectancy,GNP,
Country_Pop/1000000 as Cou_Pop_in_mn, 
round(GNP/1000,0) as GNP_in_bn, 
round(GNP*1000000/Country_Pop,0) as Per_cap_GNP  
from country
order by Per_cap_GNP desc;

select 
Country_name,Region,SurfaceArea,Country_pop,LifeExpectancy,GNP,
Country_Pop/1000000 as Cou_Pop_in_mn, 
round(GNP/1000,0) as GNP_in_bn, 
round(GNP*1000000/Country_Pop,0) as Per_cap_GNP  
from country
order by Region, Country_name desc;

select 
Country_name,Region,SurfaceArea,Country_pop,LifeExpectancy,GNP,
Country_Pop/1000000 as Cou_Pop_in_mn, 
round(GNP/1000,0) as GNP_in_bn, 
round(GNP*1000000/Country_Pop,0) as Per_cap_GNP  
from country
order by Per_Cap_GNP desc
limit 7;

## Offset

select 
Country_name,Region,SurfaceArea,Country_pop,LifeExpectancy,GNP,
Country_Pop/1000000 as Cou_Pop_in_mn, 
round(GNP/1000,0) as GNP_in_bn, 
round(GNP*1000000/Country_Pop,0) as Per_cap_GNP  
from country
order by Per_Cap_GNP desc
limit 50
offset 94;