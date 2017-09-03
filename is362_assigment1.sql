#How many airplanes have listed speeds?  23
SELECT count(*) FROM `planes` WHERE speed IS NOT NULL;

#What is the minimum listed speed and the maximum listed speed? 90, 432
SELECT MIN(speed) FROM `planes` WHERE speed IS NOT NULL;
SELECT MAX(speed) FROM `planes` WHERE speed IS NOT NULL;

#What is the total distance flown by all of the planes in January 2013? What is the total distance flown by all of the planes in January 2013 where the tailnum is missing? 27188805, 81763
SELECT SUM(distance)AS total_distance FROM `flights` WHERE year = 2013 AND month = 1;
SELECT SUM(distance)AS total_distance FROM `flights` WHERE year = 2013 AND month = 1 AND tailnum IS NULL;

#What is the total distance flown for all planes on July 5, 2013 grouped by aircraft manufacturer? Write this statement first using an INNER JOIN, then using a LEFT OUTER JOIN. How do your results compare?
#INNER JOIN: returns rows when there is a match in both tables. LEFT JOIN: returns all rows from the left table, even if there are no matches in the right table.
SELECT planes.manufacturer, SUM(flights.distance)AS total FROM `flights` INNER JOIN planes ON flights.tailnum = planes.tailnum WHERE flights.year = 2013 AND flights.month = 7 AND flights.day=5 GROUP BY planes.manufacturer;
SELECT P.manufacturer, SUM(F.distance)AS total FROM `flights` F LEFT JOIN planes P ON P.tailnum = F.tailnum WHERE F.year = 2013 AND F.month = 7 AND F.day=5 GROUP BY P.manufacturer;


#Write and answer at least one question of your own choosing that joins information from at least three of the tables in the flights database.
#SHOW list of airline name and planes name that flown on  January, 1 2013 to January, 3 2013
SELECT * FROM flights
left join airlines on flights.carrier = airlines.carrier
left join planes on flights.tailnum = planes.tailnum
WHERE flights.year = 2013 AND flights.month = 1 AND flights.DAY IN(1,2,3) AND planes.tailnum IS NOT NULL
ORDER BY flights.day, airlines.name;