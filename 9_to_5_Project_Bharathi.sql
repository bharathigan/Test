1. . Use this space to make note of each table in the database, the columns within each table, each column’s data type, and how the tables are connected. You can write this down or draw a diagram. Whatever method helps you get an understanding of what is going on with `LaborStatisticsDB`.

Table Name			Column Name			Data Type	
annual_2016			id					smallint	Primary key 
					series_id			nvarchar	
					year				smallint	
					period				nvarchar	
					value				float	
					footnote_codes		nvarchar	
					original_file		nvarchar	
datatype			data_type_code		tinyint		Primary key
					data_type_text		nvarchar	
footnote			footnote_code		nvarchar	 
					footnote_text		nvarchar	
industry			id					smallint	Primary key
					industry_code		bigint	
					naics_code			nvarchar	
					publishing_status	nvarchar	
					industry_name		nvarchar	
					display_level		float	
					selectable			nvarchar	
					sort_sequence		float	
january_2017		id					bigint		Primary key 
					series_id			nvarchar	
					year				smallint	
					period				nvarchar	
					value				float	
					footnote_codes		nvarchar	
					original_file		nvarchar	
period				period_code			nvarchar	
					month_abbr			nvarchar	
					month				nvarchar	
seasonal			industry_code		nvarchar	
					seasonal_text		nvarchar	
series				series_id			nvarchar	
					supersector_code	bigint	
					industry_code		nvarchar	
					data_type_code		bigint	
					seasonal			nvarchar	
					series_title		nvarchar	
supersector			supersector_code	tinyint		
					supersector_name	nvarchar	


Key Relationships Summary
From Table		Column			To Table		Referenced Column
annual_2016		series_id		series			series_id
annual_2016		period			period			period_code
annual_2016		footnote_codes	footnote		footnote_code
january_2017	series_id		series			series_id
january_2017	period			period			period_code
january_2017	footnote_codes	footnote		footnote_code
series			data_type_code	datatype		data_type_code
series		supersector_code	supersector		supersector_code
series			industry_code	industry		industry_code
series			seasonal		seasonal		seasonal_text
seasonal		industry_code	industry		industry_code




## Database Exploration

2. What is the datatype for women employees?
  Answer: nvarchar
   
3. What is the series id for  women employees in the commercial banking industry in the financial activities supersector?  
  
  Answer:: CES5552211010, CEU5552211010

    select  S.series_id, s.series_title, i.industry_name, ss.supersector_name
    from  LaborStatisticsDB.dbo.series AS S 
    INNER JOIN LaborStatisticsDB.dbo.industry AS I ON I.industry_code = S.industry_code
    INNER JOIN LaborStatisticsDB.dbo.supersector SS ON SS.supersector_code =S.supersector_code
    where s.series_title ='WOMEN EMPLOYEES'
    AND I.industry_name ='Commercial banking'
    AND ss.supersector_name='Financial activities'

## Aggregate Your Friends and Code some SQL

Put together the following:

1. How many employees were reported in 2016 in all industries? Round to the nearest whole number.
	Answer: 2340612
	SELECT round(sum(value),0) employee_count
	from  LaborStatisticsDB.dbo.annual_2016 A2016
	INNER JOIN LaborStatisticsDB.dbo.series AS S ON S.series_id =A2016.series_id
	where s.series_title ='ALL EMPLOYEES'

2. How many women employees were reported in 2016 in all industries? Round to the nearest whole number. 

	Answer: 1125490
	SELECT round(sum(value),0) women_employee_count
	from  LaborStatisticsDB.dbo.annual_2016 A2016
	INNER JOIN LaborStatisticsDB.dbo.series AS S ON S.series_id =A2016.series_id
	where s.series_title ='WOMEN EMPLOYEES'
	
	
3. How many production/nonsupervisory employees were reported in 2016? Round to the nearest whole number. 	
	
	Answer: 1263650
	SELECT round(sum(value),0) employee_count
	from  LaborStatisticsDB.dbo.annual_2016 A2016
	INNER JOIN LaborStatisticsDB.dbo.series AS S ON S.series_id =A2016.series_id
	where s.series_title ='PRODUCTION AND NONSUPERVISORY EMPLOYEES'


4. In January 2017, what is the average weekly hours worked by production and nonsupervisory employees across all industries?

 Answer:79473
 
 SELECT round(sum(j2017.value),0) avg_hours
	from  LaborStatisticsDB.dbo.january_2017 j2017
	INNER JOIN LaborStatisticsDB.dbo.series AS S ON S.series_id =j2017.series_id
	where s.series_title ='Average weekly hours of production and nonsupervisory employees'

5. What is the total weekly payroll for production and nonsupervisory employees across all industries in January 2017? Round to the nearest penny.

Answer:1838753220

SELECT round(sum(j2017.value),0) employee_count
	from  LaborStatisticsDB.dbo.january_2017 j2017
	INNER JOIN LaborStatisticsDB.dbo.series AS S ON S.series_id =j2017.series_id
    INNER JOIN LaborStatisticsDB.dbo.industry AS I ON i.industry_code =s.industry_code
	where s.series_title ='AGGREGATE WEEKLY PAYROLLS OF PRODUCTION AND NONSUPERVISORY EMPLOYEES'
        order by employee_count 


6. In January 2017, for which industry was the average weekly hours worked by production and nonsupervisory employees the highest? Which industry was the lowest?

Answer: industry_name  				avg_hours
        NULL						5160
		General freight trucking	832

SELECT  i.industry_name,round(sum(j2017.value),0) avg_hours
	from  LaborStatisticsDB.dbo.january_2017 j2017
	INNER JOIN LaborStatisticsDB.dbo.series AS S ON S.series_id =j2017.series_id
    INNER JOIN LaborStatisticsDB.dbo.industry AS I ON i.industry_code =s.industry_code
	where s.series_title ='Average weekly hours of production and nonsupervisory employees'
    GROUP BY i.industry_name
    order by avg_hours desc

7. In January 2017, for which industry was the total weekly payroll for production and nonsupervisory employees the highest? Which industry was the lowest?    

Answer:
				industry_name								employee_count
	Highest		Total private								295944946
	Lowest		Coin-operated laundries and drycleaners		40448



SELECT i.industry_name, round(sum(j2017.value),0) employee_count
	from  LaborStatisticsDB.dbo.january_2017 j2017
	INNER JOIN LaborStatisticsDB.dbo.series AS S ON S.series_id =j2017.series_id
    INNER JOIN LaborStatisticsDB.dbo.industry AS I ON i.industry_code =s.industry_code
	where s.series_title ='AGGREGATE WEEKLY PAYROLLS OF PRODUCTION AND NONSUPERVISORY EMPLOYEES'
    GROUP BY i.industry_name
    order by employee_count desc
