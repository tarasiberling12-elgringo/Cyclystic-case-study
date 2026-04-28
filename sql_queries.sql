-- Cyclistic Case Study SQL Queries
-- Author: Muhammed Trawalley

--------------------------------------------------
-- 1. Combine Data
--------------------------------------------------
SELECT * 
FROM `your_project.cyclistic_data.*`;

--------------------------------------------------
-- 2. Create Ride Length + Day of Week
--------------------------------------------------
SELECT *,
  TIMESTAMP_DIFF(ended_at, started_at, SECOND) AS ride_length_seconds,
  FORMAT_TIMESTAMP('%A', started_at) AS day_of_week
FROM `your_project.cyclistic_data.all_trips`;

--------------------------------------------------
-- 3. Remove Invalid Data
--------------------------------------------------
SELECT *
FROM `your_project.cyclistic_data.all_trips`
WHERE ride_length_seconds > 0
  AND ride_length_seconds < 86400;

--------------------------------------------------
-- 4. Analysis: Total Rides
--------------------------------------------------
SELECT member_casual, COUNT(*) AS total_rides
FROM `your_project.cyclistic_data.cleaned_trips`
GROUP BY member_casual;

--------------------------------------------------
-- 5. Analysis: Avg Ride Length
--------------------------------------------------
SELECT member_casual,
       AVG(ride_length_seconds)/60 AS avg_minutes
FROM `your_project.cyclistic_data.cleaned_trips`
GROUP BY member_casual;
