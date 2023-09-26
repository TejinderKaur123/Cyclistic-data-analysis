/* UPLOADING DATA*/

/*Created a Schema*/
CREATE SCHEMA `cyclistic_trip_data` ;


/*Creating a table for each dataset from July 2022 to June 2023 then 
importing the data from the csv file to the consequent table*/
/*Used the naming convention 'tripdata_YYYYMM' for naming the tables.*/

/*Creating table 'tripdata_202207'*/
CREATE TABLE `tripdata_202207` (
  `trip_id` varchar(45) DEFAULT NULL,
  `bike_type` char(20) DEFAULT NULL,
  `start_date_time` varchar(100) DEFAULT NULL,
  `end_date_time` varchar(100) DEFAULT NULL,
  `start_station_name` varchar(100) DEFAULT NULL,
  `start_station_id` varchar(50) DEFAULT NULL,
  `end_station_name` varchar(100) DEFAULT NULL,
  `end_station_id` varchar(50) DEFAULT NULL,
  `customer_type` char(20) DEFAULT NULL
);

/*Uploading data from July 2022 in table 'tripdata_202207*/
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Cyclistic Trip Data 2022-23/original/202207-divvy- 
tripdata.csv'
INTO TABLE tripdata_202207
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

/*Checked the table and number of rows of the data imported matched the original data*/
SELECT * FROM tripdata_202207;
SELECT count(*) FROM tripdata_202207;

/*** Repeating above steps to upload the data for every month.***/

/*Creating table 'tripdata_202208'*/
CREATE TABLE `tripdata_202208` (
  `trip_id` varchar(50) DEFAULT NULL,
  `bike_type` char(20) DEFAULT NULL,
  `start_date_time` varchar(100) DEFAULT NULL,
  `end_date_time` varchar(100) DEFAULT NULL,
  `start_station_name` varchar(100) DEFAULT NULL,
  `start_station_id` varchar(50) DEFAULT NULL,
  `end_station_name` varchar(100) DEFAULT NULL,
  `end_station_id` varchar(45) DEFAULT NULL,
  `customer_type` char(20) DEFAULT NULL
);

/*Uploading data from Aug 2022 in table 'tripdata_202208*/
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Cyclistic Trip Data 2022-23/original/202207-divvy- 
tripdata.csv'
INTO TABLE tripdata_202208
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

/*Checked the table and number of rows of the data imported matched the original data*/
SELECT * FROM tripdata_202208;
SELECT count(*) FROM tripdata_202208;

/*Creating table 'tripdata_202209'*/
CREATE TABLE `tripdata_202209` (
  `trip_id` varchar(45) DEFAULT NULL,
  `bike_type` char(20) DEFAULT NULL,
  `start_date_time` varchar(100) DEFAULT NULL,
  `end_date_time` varchar(100) DEFAULT NULL,
  `start_station_name` varchar(100) DEFAULT NULL,
  `start_station_id` varchar(50) DEFAULT NULL,
  `end_station_name` varchar(100) DEFAULT NULL,
  `end_station_id` varchar(45) DEFAULT NULL,
  `customer_type` char(20) DEFAULT NULL
);

/*Uploading data from Sept 2022 in table 'tripdata_202209*/
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Cyclistic Trip Data 2022-23/original/202207-divvy- 
tripdata.csv'
INTO TABLE tripdata_202209
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

/*Checked the table and number of rows of the data imported matched the original data*/
SELECT * FROM tripdata_202209;
SELECT count(*) FROM tripdata_202209;

/*Creating table 'tripdata_202210'*/
CREATE TABLE `tripdata_202210` (
  `trip_id` varchar(45) DEFAULT NULL,
  `bike_type` char(20) DEFAULT NULL,
  `start_date_time` varchar(100) DEFAULT NULL,
  `end_date_time` varchar(100) DEFAULT NULL,
  `start_station_name` varchar(100) DEFAULT NULL,
  `start_station_id` varchar(50) DEFAULT NULL,
  `end_station_name` varchar(100) DEFAULT NULL,
  `end_station_id` varchar(50) DEFAULT NULL,
  `customer_type` char(20) DEFAULT NULL
);

/*Uploading data from Oct 2022 in table 'tripdata_202210*/
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Cyclistic Trip Data 2022-23/original/202207-divvy- 
tripdata.csv'
INTO TABLE tripdata_202210
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

/*Checked the table and number of rows of the data imported matched the original data*/
SELECT * FROM tripdata_202210;
SELECT count(*) FROM tripdata_202210;

/*Creating table 'tripdata_202211'*/
CREATE TABLE `tripdata_202211` (
  `trip_id` varchar(45) DEFAULT NULL,
  `bike_type` char(20) DEFAULT NULL,
  `start_date_time` varchar(100) DEFAULT NULL,
  `end_date_time` varchar(100) DEFAULT NULL,
  `start_station_name` varchar(100) DEFAULT NULL,
  `start_station_id` varchar(50) DEFAULT NULL,
  `end_station_name` varchar(100) DEFAULT NULL,
  `end_station_id` varchar(50) DEFAULT NULL,
  `customer_type` char(20) DEFAULT NULL
);

/*Uploading data from Nov 2022 in table 'tripdata_202211*/
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Cyclistic Trip Data 2022-23/original/202207-divvy- 
tripdata.csv'
INTO TABLE tripdata_202211
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

/*Checked the table and number of rows of the data imported matched the original data*/
SELECT * FROM tripdata_202211;
SELECT count(*) FROM tripdata_202211;

/*Creating table 'tripdata_202212'*/
CREATE TABLE `tripdata_202212` (
  `trip_id` varchar(45) DEFAULT NULL,
  `bike_type` char(20) DEFAULT NULL,
  `start_date_time` varchar(100) DEFAULT NULL,
  `end_date_time` varchar(100) DEFAULT NULL,
  `start_station_name` varchar(100) DEFAULT NULL,
  `start_station_id` varchar(50) DEFAULT NULL,
  `end_station_name` varchar(100) DEFAULT NULL,
  `end_station_id` varchar(50) DEFAULT NULL,
  `customer_type` char(20) DEFAULT NULL
);

/*Uploading data from Dec 2022 in table 'tripdata_202212*/
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Cyclistic Trip Data 2022-23/original/202207-divvy- 
tripdata.csv'
INTO TABLE tripdata_202212
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

/*Checked the table and number of rows of the data imported matched the original data*/
SELECT * FROM tripdata_202212;
SELECT count(*) FROM tripdata_202212;

/*Creating table 'tripdata_202301'*/
CREATE TABLE `tripdata_202301` (
  `trip_id` varchar(45) DEFAULT NULL,
  `bike_type` char(20) DEFAULT NULL,
  `start_date_time` varchar(100) DEFAULT NULL,
  `end_date_time` varchar(100) DEFAULT NULL,
  `start_station_name` varchar(100) DEFAULT NULL,
  `start_station_id` varchar(50) DEFAULT NULL,
  `end_station_name` varchar(100) DEFAULT NULL,
  `end_station_id` varchar(50) DEFAULT NULL,
  `customer_type` char(20) DEFAULT NULL
);

/*Uploading data from Jan 2023 in table 'tripdata_202301*/
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Cyclistic Trip Data 2022-23/original/202207-divvy- 
tripdata.csv'
INTO TABLE tripdata_202301
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

/*Checked the table and number of rows of the data imported matched the original data*/
SELECT * FROM tripdata_202301;
SELECT count(*) FROM tripdata_202301;

/*Creating table 'tripdata_202302'*/
CREATE TABLE `tripdata_202302` (
  `trip_id` varchar(45) DEFAULT NULL,
  `bike_type` char(20) DEFAULT NULL,
  `start_date_time` varchar(100) DEFAULT NULL,
  `end_date_time` varchar(100) DEFAULT NULL,
  `start_station_name` varchar(100) DEFAULT NULL,
  `start_station_id` varchar(50) DEFAULT NULL,
  `end_station_name` varchar(100) DEFAULT NULL,
  `end_station_id` varchar(50) DEFAULT NULL,
  `customer_type` char(20) DEFAULT NULL
);

/*Uploading data from Feb 2023 in table 'tripdata_202302*/
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Cyclistic Trip Data 2022-23/original/202207-divvy- 
tripdata.csv'
INTO TABLE tripdata_202302
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

/*Checked the table and number of rows of the data imported matched the original data*/
SELECT * FROM tripdata_202302;
SELECT count(*) FROM tripdata_202302;

/*Creating table 'tripdata_202303'*/
CREATE TABLE `tripdata_202303` (
  `trip_id` varchar(45) DEFAULT NULL,
  `bike_type` char(20) DEFAULT NULL,
  `start_date_time` varchar(100) DEFAULT NULL,
  `end_date_time` varchar(100) DEFAULT NULL,
  `start_station_name` varchar(100) DEFAULT NULL,
  `start_station_id` varchar(50) DEFAULT NULL,
  `end_station_name` varchar(100) DEFAULT NULL,
  `end_station_id` varchar(50) DEFAULT NULL,
  `customer_type` char(20) DEFAULT NULL
);

/*Creating table 'tripdata_202303'*/
/*Uploading data from Mar 2023 in table 'tripdata_202303*/
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Cyclistic Trip Data 2022-23/original/202207-divvy- 
tripdata.csv'
INTO TABLE tripdata_202303
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

/*Checked the table and number of rows of the data imported matched the original data*/
SELECT * FROM tripdata_202303;
SELECT count(*) FROM tripdata_202303;

/*Creating table 'tripdata_202304'*/
CREATE TABLE `tripdata_202304` (
  `trip_id` varchar(45) DEFAULT NULL,
  `bike_type` char(20) DEFAULT NULL,
  `start_date_time` varchar(100) DEFAULT NULL,
  `end_date_time` varchar(100) DEFAULT NULL,
  `start_station_name` varchar(100) DEFAULT NULL,
  `start_station_id` varchar(50) DEFAULT NULL,
  `end_station_name` varchar(100) DEFAULT NULL,
  `end_station_id` varchar(50) DEFAULT NULL,
  `customer_type` char(20) DEFAULT NULL
);

/*Uploading data from Apr 2023 in table 'tripdata_202304*/
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Cyclistic Trip Data 2022-23/original/202207-divvy- 
tripdata.csv'
INTO TABLE tripdata_202304
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

/*Checked the table and number of rows of the data imported matched the original data*/
SELECT * FROM tripdata_202304;
SELECT count(*) FROM tripdata_202304;

/*Creating table 'tripdata_202305'*/
CREATE TABLE `tripdata_202305` (
  `trip_id` varchar(45) DEFAULT NULL,
  `bike_type` char(20) DEFAULT NULL,
  `start_date_time` varchar(100) DEFAULT NULL,
  `end_date_time` varchar(100) DEFAULT NULL,
  `start_station_name` varchar(100) DEFAULT NULL,
  `start_station_id` varchar(50) DEFAULT NULL,
  `end_station_name` varchar(100) DEFAULT NULL,
  `end_station_id` varchar(50) DEFAULT NULL,
  `customer_type` char(20) DEFAULT NULL
);

/*Uploading data from May 2023 in table 'tripdata_202305*/
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Cyclistic Trip Data 2022-23/original/202207-divvy- 
tripdata.csv'
INTO TABLE tripdata_202305
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

/*Checked the table and number of rows of the data imported matched the original data*/
SELECT * FROM tripdata_202305;
SELECT count(*) FROM tripdata_202305;

/*Creating table 'tripdata_202306'*/
CREATE TABLE `tripdata_202306` (
  `trip_id` varchar(45) DEFAULT NULL,
  `bike_type` char(20) DEFAULT NULL,
  `start_date_time` varchar(100) DEFAULT NULL,
  `end_date_time` varchar(100) DEFAULT NULL,
  `start_station_name` varchar(100) DEFAULT NULL,
  `start_station_id` varchar(50) DEFAULT NULL,
  `end_station_name` varchar(100) DEFAULT NULL,
  `end_station_id` varchar(50) DEFAULT NULL,
  `customer_type` char(20) DEFAULT NULL
);

/*Uploading data from Jun 2023 in table 'tripdata_202306*/
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Cyclistic Trip Data 2022-23/original/202207-divvy- 
tripdata.csv'
INTO TABLE tripdata_202306
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

/*Checked the table and number of rows of the data imported matched the original data*/
SELECT * FROM tripdata_202306;
SELECT count(*) FROM tripdata_202306;

































