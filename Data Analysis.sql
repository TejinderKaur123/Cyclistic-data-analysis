/*ANALYSIS PHASE*/

/* Calculating average, min, max and trip count duration value for casual riders and members:*/
SELECT customer_type, count(trip_id) as trip_count, 
MIN(trip_duration) as min_trip_duration_mins, 
MAX(trip_duration) as max_trip_duration_hours, 
(AVG(TIME_TO_SEC(trip_duration)))/60 as average_in_mins
FROM tripdata_202207_202306
GROUP BY customer_type;


/* Finding the number of customers with trip duration more than 24 hours*/
SELECT customer_type, count(trip_id) as trip_count
FROM tripdata_202207_202306
WHERE trip_duration> '24:00:00'
GROUP BY customer_type;

/*Average trip duration by casual and member customer each day of the week.*/
SELECT trip_day,
AVG(TIME_TO_SEC(CASE
					WHEN customer_type = 'casual'
                    THEN trip_duration
                    ELSE 0
				END))/60 as Casual,
AVG(TIME_TO_SEC(CASE
					WHEN customer_type = 'member'
                    THEN trip_duration
                    ELSE 0
				END))/60 as member
FROM tripdata_202207_202306
GROUP BY trip_day
ORDER BY trip_day;

/*Average number of rides each day of the week.*/
SELECT trip_day,
COUNT(CASE
		WHEN customer_type = 'casual'
		THEN trip_id
		END)/52 as Casual,  
COUNT(CASE
		 WHEN customer_type = 'member'
		 THEN trip_id
	   END)/52 as member
FROM tripdata_202207_202306
GROUP BY trip_day
ORDER BY trip_day;


/*The most bike type driven by casual vs member*/
SELECT bike_type,
COUNT(CASE
		WHEN customer_type = 'casual'
		THEN bike_type
		END) as Casual,
COUNT(CASE
		 WHEN customer_type = 'member'
		 THEN bike_type
	   END) as member
FROM tripdata_202207_202306
GROUP BY bike_type
ORDER BY bike_type;

/*Seasonal difference between casual and member trip count*/
SELECT MONTH(start_date_time) as month,
COUNT(CASE
		WHEN customer_type = 'casual'
		THEN trip_id
		END) as Casual,
COUNT(CASE
		 WHEN customer_type = 'member' 
		 THEN trip_id
	   END) as member
FROM tripdata_202207_202306
GROUP BY MONTH(start_date_time)
ORDER BY MONTH(start_date_time);

