# Cyclistic-Data-Analysis
## Scenario
I am a junior data analyst working in the marketing analyst team of Cyclistic - a fictional bike share company in Chicago. The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, My team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, My team will design a new marketing strategy to convert casual riders into annual members. I sharing a detailed documentation of the analysis.
## Ask
Three questions will guide the future marketing program:
1. How do annual members and casual riders use Cyclistic bikes differently?
2. Why would casual riders buy Cyclistic annual memberships?
3. How can Cyclistic use digital media to influence casual riders to become members?
Moreno(The director of the marketing team and my manager) has assigned me the first question to answer: How do annual members and casual riders use Cyclistic bikes differently.
### Business Task
Find out how the annual members and casual riders use the Cyclistic Bikes differently. The answer to this question is crucial to find a marketing stretegy for casual riders to join the annual membership hence increasing the number of members which is the goal for company's success. The stakeholders for this task is Moreno who is The director of the marketing team and my manager.

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
   that table.
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
   bike_type has values:
   1. electric_bike.
   2. docked_bike.
   3. classic_bike.
   customer_type has values:
   1. casual.
   2. member.
6. Made a new column for trip_duration to calculate the duration of the ride by 
   subtracting end_date_time and start_date_time.
7. Checking the range of the trip_duration column.
   Min value of trip duration was negative. Therefore checked the values of 
   trip_duration less than or equal to 0. 88652 records found. 
   Deleted those from the table.
   The max value of the trip duration is 689 hours 47 mins, which is approximately 
   29 days and the customer type is casual. 
8. Made a new column for the day of the week that the ride took place. It gives 
   the value from 1 to 7. 1 is Sunday and 7 is Friday.
9. Checked if all the columns have correct data type.
   Datset has the following column and thier data types:
   trip_id              varchar(50)
   bike_type            char(20)
   start_date_time      datetime(6)
   end_date_time	datetime(6)
   start_station_id	varchar(50)
   start_station_name	varchar(100)
   end_station_id	varchar(50)
   end_station_name	varchar(100)
   customer_type	char(45)
   trip_duration        time
   trip_day             varchar(45)

10. Split the tripdata_202207_202306 table into two. Separated the station 
   information into a new table 'trip_station_data'. The tables and thier 
   datatypes are the following:
   tripdata_202207_202306
   -trip_id              varchar(50)
   -bike_type            char(20)
   -start_date_time      datetime(6)
   -end_date_time	datetime(6)
   -start_station_id	varchar(50)
   -start_station_name	varchar(100)
   -end_station_id	varchar(50)
   -end_station_name	varchar(100)
   -customer_type	char(45)
   -trip_duration        time
   -trip_day             varchar(45)
   trip_station_data
   -trip_id              varchar(50)
   -start_station_id	varchar(50)
   -start_station_name	varchar(100)
   -end_station_id	varchar(50)
   -end_station_name	varchar(100)
   
## Data Analysis and Visualization
Tools used:
Analysis - MySQL
Visualization - Tableau
Connected MySQL Server to Tableau.
![casualmemberproportion](https://github.com/TejinderKaur123/Cyclistic-data-analysis/assets/50061662/75b3e343-df4a-4861-aa1d-2c5515bfffd7)

