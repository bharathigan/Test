/*Q1 Write a query that returns the last 3 characters of the base name in other_FHV_services_jan_aug_2015.
 Do you see anything that is a common abbreviation at the end of business names?*/
 
 select Distinct Right (Base_Name,3)
from RideshareDB.dbo.other_FHV_services_jan_aug_2015
Order BY  Right (Base_Name,3)

ANSWER:Last three characters suggests these are company names .

/*Q2 The number of trips and the number of pickups are both stored as strings in other_FHV_services_jan_aug_2015.
 This is because the data provided included spaces in some of the numbers. 
 Write a query that returns the location of spaces in both of these columns.*/

 select DIstinct CHARINDEX(' ',Number_of_Trips) as "Location_of_TRIPS",
 CHARINDEX(' ',Number_of_Vehicles) as "Location_of_VEHICLES"
from RideshareDB.dbo.other_FHV_services_jan_aug_2015
ORDER BY Location_of_TRIPS,Location_of_VEHICLES

 Answer: above query displays position of space
 
 
 /*Q3For other_FHV_services_jan_aug_2015,  display the name of month of the pickup date and order in descending order. 
 Is the result of this query what you expected?*/
 
 SELECT  DISTINCT DATENAME(month,Pick_Up_Date) Month_name
FROM RideshareDB.dbo.other_FHV_services_jan_aug_2015
ORDER BY DATENAME(month,Pick_Up_Date) DESC
 
 Answer: Month_name
         May
         March
         June
         July
         January
         February
         August
         April
 
/*Q4 Using other_FHV_services_jan_aug_2015, 
 write a query that returns the day number of the pickup date and month name and orders it in ascending order by day number.*/
 
 SELECT  DISTINCT DATENAME(day,Pick_Up_Date) as "day_number",
Datename(month,Pick_Up_Date) as "month_name"
FROM RideshareDB.dbo.other_FHV_services_jan_aug_2015
ORDER BY DATENAME(day,Pick_Up_Date) 

  Answer: above query displays day and month name sort by day
 
 ## Aggregate Functions

Write a query that returns the most easterly Lyft pickup.

select start_lng,
COUNT(start_lng) as "count_start_lng"
from RideshareDB.dbo.lyft
GROUP BY start_lng
ORDER BY count_start_lng DESC

Answer:-73.98746

Write a query the returns the most northerly Lyft pickup.

select start_lat,
COUNT(start_lat) as "count_start_lat"
from RideshareDB.dbo.lyft
GROUP BY start_lat
ORDER BY count_start_lat DESC

ANSWER : 40.71406


Using other_FHV_services_jan_aug_2015, 
write a query that connects the the base number and the base name in a string that uses the following format: base_number: base_name.

select CONCAT_WS(':',  base_number, base_name)
from RideshareDB.dbo.other_FHV_services_jan_aug_2015





