# Cyclistic-Data-Analysis
## Scenario
I am a junior data analyst working in the marketing analyst team of Cyclistic - a fictional bike share company in Chicago. The Cyclistic customers who purchase single ride or full-day passes are 'casual riders' whereas the customers who purchase annual memberships are 'members'. The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, My team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, My team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve my recommendations, so they must be backed up with compelling data insights and professional data visualizations. I am sharing detailed documentation of the analysis below.

## Ask
Three questions will guide the future marketing program:
1. How do annual members and casual riders use Cyclistic bikes differently?
2. Why would casual riders buy Cyclistic annual memberships?
3. How can Cyclistic use digital media to influence casual riders to become members?
Moreno(The director of the marketing team and my manager) has assigned me the first question to answer: How do annual members and casual riders use Cyclistic bikes differently.
### Business Task
Find out how the annual members and casual riders use the Cyclistic Bikes differently. The answer to this question is crucial to find a marketing stretegy for casual riders to join the annual membership which is the goal for company's success. The stakeholders for this task is Cyclistic Executive Team and Moreno who is The director of the marketing team and my manager.

## Prepare
I have Cyclistic historical trip data monthly as well as quarterly and station data from past years. I chose the previous 12 months of data to analyse. The datasets cover ride information of every single ride- the ride's start and end time; start and end station id, name and geolocation; type of bike used; customer type. This information will help find the usage differences between casual riders and members.

### Data Organization
I have downloaded the monthly from July 2022 to June 2023. The data is in csv format. All the files are downloaded in the 'Original' folder under the main project folder. I kept the same naming convention that is 'YYYMM-file-name.csv' to save them.

### Data Credibility
The dataset is public and is made available by Motivate International Inc. This is a first party data as directed. The datasets are appropriate, reliable and comprehensive as directed. The data is up to date.The data is current and cited. Hence, data is credible.

### Data Privacy and Bias Issues
The data-privacy issues prohibit from using rider's personally identifiable information. This means that
I won’t be able to connect pass purchases to credit card numbers to determine if casual riders live in the Cyclistic service area or if they have purchased multiple single passes. There are no bias issues. (The sample of one year of data was used without any criteria)
### Data Integrity
......


## Process
Since, the data is available in monthly format. I am combining it as a single dataset with one year of data. I am prefering MySQL over Excel to do so because of the size of the datasets is large. Every single data set has more than 200000 rows. MySQL is faster to process large amount of data as compared to Excel.
Tool used for cleaning and manipulation: MySQL.

### Uploading the Data
Uploaded the data to MySQL WorkBench using the following steps:
1. Created a Schema 'cyclistic_trip_data'.
2. Created a table for each dataset from July 2022 to June 2023. Used the 
   naming convention 'tripdata_YYYYMM' for naming the tables.
3. Imported the data from the csv file to the consequent table.
4. Checked the table and number of rows of the data imported matched the original data.
5. Repeated above steps to import the data of all the months from July 2022 to June 2023.
### Data Combining
The steps for combining the monthly data to a single dataset with 12 months of data are given below:
1. Created the table 'tripdata_202207_202306' and combined all the datasets using 
   'UNION ALL' and data is saved in the table 'tripdata_202207_202306'.
2. Made a copy of the above table. Created a new table and inserted all the values in 
   the table 'tripdata_202207_202306_copy'.
### Data Cleaning
1. Looking into the table columns and checking the number of rows.
   Datset has the following column:
   trip_id (varchar)- id of the trip.
   bike_type (char)- has the type of bike used for the ride.	
   start_date_time (varchar)- has the start date and time of the ride.
   end_date_time	(varchar)- has the end date and time of the ride.	
   start_station_name	(varchar)- has the start station name.
   start_station_id	(varchar)- has the start station id.
   end_station_name	(varchar)- has the end station name.
   end_station_id	(varchar)- has the end station id.
   customer_type	(char)- has the type of customer using the bike.
   Total number of rows found: 5779444
2. Checking for duplicate rows and nulls in trip_id and made it a primary key.
   No null values found.
   Duplicate ids found: 208 values
   Deleted the rows with duplicate ids after running the select statement inside, to 
   check what will get deleted. 
    Number of rows returned after deleting duplicates = 5779236
3. Fixing the column format. Changed the columns start_date_time and end_date_time 
   from varchar to datetime.
   Error found in the year format of  the date. Some of the years are in 2 digits and 
   some are in 4 digits. To convert into datetime format the 'Y' takes year 
   in 4 digits. Therefore, set the year format to 4 digits by using regex replace 
   function.
4. Checked distinct values of column bike_type and customer_type.
   bike_type has values:\
   1. electric_bike.\
   2. docked_bike.\
   3. classic_bike.
   customer_type has values:\
   1. casual.\
   2. member.
6. Made a new column for trip_duration to calculate the duration of the ride by 
   subtracting end_date_time and start_date_time.
7. Checking the range of the trip_duration column.
   Min value of trip duration was negative. Therefore checked the values of 
   trip_duration less than or equal to 0. 88652 records found. 
   Deleted those from the table.
   The max value of the trip duration is 689 hours 47 mins, which is approximately 
   29 days and the customer type is casual. ((why I am not deleting the >24 values))
8. Made a new column for the day of the week that the ride took place. It gives 
   the value from 1 to 7. 1 is Sunday and 7 is Friday.
9. Checked if all the columns have correct data type.
   Datset has the following column and thier data types:\
   trip_id-              varchar(50)\
   bike_type-            char(20)\
   start_date_time-      datetime(6)\
   end_date_time-	datetime(6)\
   start_station_id-	varchar(50)\
   start_station_name-	varchar(100)\
   end_station_id-	varchar(50)\
   end_station_name-	varchar(100)\
   customer_type-	char(45)\
   trip_duration-        time\
   trip_day-             varchar(45)

10. Split the tripdata_202207_202306 table into two. Separated the station 
   information into a new table 'trip_station_data'. The tables and thier 
   datatypes are the following:\
   **tripdata_202207_202306**\
    trip_id-              varchar(50)\
    bike_type-            char(20)\
    start_date_time-      datetime(6)\
    end_date_time-	     datetime(6)\
    start_station_id-	  varchar(50)\
    start_station_name-	  varchar(100)\
    end_station_id-	     varchar(50)\
    end_station_name-	  varchar(100)\
    customer_type-	     char(45)\
    trip_duration-        time\
    trip_day-             varchar(45)\
   **trip_station_data**
    trip_id-              varchar(50)\
    start_station_id-	    varchar(50)\
    start_station_name-	 varchar(100)\
    end_station_id-	    varchar(50)\
    end_station_name-	    varchar(100)
   
## Data Analysis and Visualization
Tools used:
Analysis - MySQL
Visualization - Tableau
Connected MySQL Server to Tableau.

### Summary Statistics of Trip Duration
**Summary statistics of trip duration by customer type:** The average trip duration of casual rider and member was found to be 28.1 mins and 12.6 mins, respectively. *The average trip duration of the casual customer is almost double that of members.* The range of trip duration for casual rider and member is 1min to 689.8 hours and 1 min to 26 hours, respectively. The extremely high value for the casual riders will be discussed later in the analysis.

**Proportion of bike usage:** It is interesting to note that the total number of trips made by the members is higher than the casual riders but the total sum duration of the trips of casual riders is greater than the members, as shown in the pie chart. *This implies that even with the less number of trips casual riders spend more time on the rides than members.*

![intro](https://github.com/TejinderKaur123/Cyclistic-data-analysis/assets/50061662/43892ad2-a9a0-45b5-a905-fb2e28a6a92d)

### Number of Trips by Trip Duration 
The following dashboard shows the number of trips by duration of the ride for casual and members. 

**Duration 1 to 60 mins:**
The max number of trips for members are of 5 mins, whereas casual riders are of 6 mins. What’s striking is that for trips with a duration shorter than 30 mins, member riders outnumber casual riders whereas for the trips with a duration longer than 30 mins, casual riders outnumber members.

**Duration 1 hour to 24 hours:** 
Most of the riders are casual. The number of member riders is extremely low compared to the casual riders. The duration range for member riders is mostly 0 to 4 hours, with some riding between 7 to 8 hours. Casual riders, on the other hand, are spread across the full 24-hour range. This means that some casual riders use the bike for extended periods.

![trip-duration](https://github.com/TejinderKaur123/Cyclistic-data-analysis/assets/50061662/f7286328-8013-451c-ad4c-ee8b66f9e2d7)

### Number of Trips by Month, Day of the Week and Hour of the Day
The following dashboard shows the variation of the trip number by month, day of the week and hour of the day.

**Month:** The maximum number of trips for members occurs in the month of August, and for casual riders in July whereas the minimum number of trips for members occurs in the month of December and for casual riders, in January.
High volume months:
Casual: July, August
Member: June, July, August, September
Low volume months: 
Casual: December, January, February, and March.
Member: December, January, February
*The trend in the number of trips by casual riders and members is mostly similar. The peak in the member riders in August can mean the students using the bike for commuting because school starts in Chicago in August*. 

**Day of the Week:** It is interesting to note that the trends of number of times members and casual riders use the bike are completely opposite. Casual riders use the bike more on the weekends starting Friday and peaks on Saturday. Members, on the other hand, use the bike more during the weekdays and peaks on Wednesday. The average trip count for members and casual riders is almost the same on Saturday with 8,783 and 8,721 trips respectively. This means *people are using the membership to commute to work and tourists are using the bike casually on the weekends as casual riders*. 

**Hour of the Day:** The average number of trips by casual riders and members peak at 5 pm. *There is a low peak at 8 am for members, showing the usage for going to work*. The number of trips by members is more than casual riders from 4 am to 10 pm and casual rider’s is       more than member’s from 11 pm to 3 pm. *There is a low peak in the number of trip by casual riders at 8 am as well which shows there is a usage of bike by working class as casual riders*.

![trip count analysis](https://github.com/TejinderKaur123/Cyclistic-data-analysis/assets/50061662/3a22d733-5240-4388-b0db-edcfa4a2925a)

### Trip Duration Analysis
The following dashboard shows the trip duration of casual rider and member by month, day of the week and hour of the day.\
**Month:** The average trip duration for casual riders and members peaks in June and July respectively, while the casual trip duration is double the member trip duration throughout the year. The minimum average duration for casual riders and members is in November and January respectively.\
**Day of the week:** Average trip duration for both casual and member is longer on the weekends and shorter on the weekdays. The average duration for the casual rider remains double that of the member’s.\
**Hour of the day:** The longest average rides during the day are taken by casual riders from 12 am to 4 am late-night peaks at 3 am, which is 41.89 mins. The range remains 17.38 to 41.89 mins. The average trip duration for members doesn’t fluctuate much throughout the day with the range between 10.29 mins to 13.1 mins.

![duration analysis](https://github.com/TejinderKaur123/Cyclistic-data-analysis/assets/50061662/af4ae40b-ec23-40d4-b5e7-bbcdf2917d05)

### Bike type
The usage of bike types used by casual riders and members is shown in the pie chart below. The only difference I see is that the casual riders use docked bikes whereas members do not use it at all.
![bike type com](https://github.com/TejinderKaur123/Cyclistic-data-analysis/assets/50061662/65f17b30-e9e0-4631-9702-002b6454e34e)


