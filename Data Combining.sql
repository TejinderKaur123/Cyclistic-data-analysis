/*Combining all the data from each month to get 1 year of trip data using UNION All*/
CREATE TABLE tripdata_202207_202306
SELECT * FROM tripdata_202207
UNION ALL
SELECT * FROM tripdata_202208
UNION ALL
SELECT * FROM tripdata_202209
UNION ALL
SELECT * FROM tripdata_202210
UNION ALL
SELECT * FROM tripdata_202211
UNION ALL
SELECT * FROM tripdata_202212
UNION ALL
SELECT * FROM tripdata_202301
UNION ALL
SELECT * FROM tripdata_202302
UNION ALL
SELECT * FROM tripdata_202303
UNION ALL
SELECT * FROM tripdata_202304
UNION ALL
SELECT * FROM tripdata_202305
UNION ALL
SELECT * FROM tripdata_202306;

/*Made a copy of above table. Created a new table and inserted all the values in the table*/
CREATE TABLE tripdata_202207_202206_copy LIKE tripdata_202207_202306;

INSERT INTO tripdata_202207_202206_copy 
SELECT * FROM tripdata_202207_202306;

