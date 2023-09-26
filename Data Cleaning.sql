/* DATA CLEANING*/

/*1*/
/*Looking into the table columns and checking the number of rows.*/
DESCRIBE tripdata_202207_202206;
SELECT COUNT(*) FROM  tripdata_202207_202206;


/*2*/
/*Checking for duplicate rows and nulls in trip id and make it a primary key*/
SELECT COUNT(*) 
FROM tripdata_202207_202306 
WHERE trip_id IS NULL;
/*No null values found*/

SELECT * FROM
(SELECT trip_id, 
		ROW_NUMBER() OVER
		(PARTITION BY trip_id 
		ORDER BY (SELECT NULL)) AS RowNumber
 FROM tripdata_202207_202206) b
 WHERE RowNumber > 1;
/*Duplicate ids found: 208 values*/

/*Deleting the rows with duplicate ids after running the select statement inside, 
to check what will get deleted.*/
DELETE FROM tripdata_202207_202306 a
WHERE a.trip_id IN
(SELECT trip_id FROM
    (SELECT
    trip_id,
    ROW_NUMBER() OVER
    (PARTITION BY trip_id
    ORDER BY (SELECT NULL)) dup
    FROM tripdata_202207_202306) b
   WHERE b.dup > 1);
/*Number of rows returned after deleting duplicates = 5779236*/
/* Checked again for duplicates. None found. Made trip_id a primary key*/


/*3*/
/*FIXING THE FORMAT*/
/*Fixed the error in year format. converting all years in the dates in 4 digits*/
/*To see what regexp is replacing:*/
SELECT start_date_time, 
REGEXP_REPLACE(start_date_time, '(\\d+\/\\d+\/)(\\d{2})\\s','$120$2 ') as replaced
FROM tripdata_202207_202306;

/*Replacing the values of the start_date_time */
UPDATE tripdata_202207_202306
SET start_date_time = REGEXP_REPLACE(start_date_time, '(\\d+\/\\d+\/)(\\d{2})\\s','$120$2 ');
/*Changed: 823309 rows .Successfully executed. */

/*Replacing the values of the end_date_time */
UPDATE tripdata_202207_202306
SET end_date_time = REGEXP_REPLACE(end_date_time, '(\\d+\/\\d+\/)(\\d{2})\\s','$120$2 ');

/*changing the data type from string to datetime.*/
/*Check the values then update the table.*/
SELECT start_date_time, end_date_time, 
str_to_date(start_date_time, '%m/%d/%Y %H:%i') as start_date,
str_to_date(end_date_time, '%m/%d/%Y %H:%i') as enddate
FROM tripdata_202207_202306;

UPDATE tripdata_202207_202306
SET start_date_time = str_to_date(start_date_time, '%m/%d/%Y %H:%i'),
end_date_time = str_to_date(end_date_time, '%m/%d/%Y %H:%i');
/*altered the table and changed the start_date_time and end_date_time to datetime format.*/

/*4*/
/*Checked distinct values of column bike_type and cutomer_type*/
SELECT DISTINCT bike_type
FROM tripdata_202207_202306;

SELECT DISTINCT customer_type
FROM tripdata_202207_202306;

/*5*/
/*Make a new column for trip_duration to calculate the duration of 
the ride by subtracting end_date_time and start_date_time.*/
SELECT start_date_time, end_date_time, timediff(end_date_time,start_date_time)
FROM tripdata_202207_202306;
UPDATE tripdata_202207_202306
SET trip_duration = timediff(end_date_time,start_date_time);

/*6*/
/*Checking the range of trip_duration*/
SELECT customer_type, MIN(trip_duration) as min
FROM tripdata_202207_202306
GROUP BY customer_type;

/* min value was negative. Deleted the values less than or equal to zero.*/
SELECT * FROM tripdata_202207_202306
WHERE trip_duration <=0;

DELETE FROM tripdata_202207_202306
WHERE trip_duration <=0;

/*The max value of the trip duration.*/
SELECT customer_type, MAX(trip_duration) as max
FROM tripdata_202207_202306
GROUP BY customer_type;

/*7*/
/*Make a new column for the day of the week that the ride took place.*/
ALTER TABLE `cyclistics_trip_data`.`tripdata_202207_202306` 
ADD COLUMN `trip_day` VARCHAR(45) NULL AFTER `trip_duration`;

SELECT dayofweek(start_date_time), start_date_time
FROM tripdata_202207_202306;
UPDATE tripdata_202207_202306
SET trip_day = dayofweek(start_date_time);

/*8*/
/*verified the columns and thier data types*/
DESCRIBE tripdata_202207_202306;

/*9*/
/* Split tripdata_202207_202306 into two tables. 
Separating the station information into a new table 'trip_station_data'*/
CREATE TABLE `cyclistics_trip_data`.`trip_station_data` (
  `trip_id` VARCHAR(50) NOT NULL,
  `start_station_name` VARCHAR(100) NULL DEFAULT NULL,
  `start_station_id` VARCHAR(50) NULL DEFAULT NULL,
  `end_station_name` VARCHAR(100) NULL DEFAULT NULL,
  `end_station_id` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`trip_id`));
/*Insert the column data into the new station table from the tripdata.*/
INSERT INTO trip_station_data
SELECT trip_id, start_station_name, start_station_id, end_station_name, end_station_id
FROM tripdata_202207_202306;
/*Delete the columns that are added in the new table from the trip data.*/
ALTER TABLE `cyclistics_trip_data`.`tripdata_202207_202306` 
DROP COLUMN `end_station_id`,
DROP COLUMN `end_station_name`,
DROP COLUMN `start_station_id`,
DROP COLUMN `start_station_name`;

/* verified the table columns and thier data types*/
DESCRIBE tripdata_202207_202306;
DESCRIBE trip_station_data;

