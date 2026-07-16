/*
SQL Review: Simple SELECT Queries

Try and write some queries to find the information requested in the tasks below. You may have to use a different combination of clauses in your query for each task. Once you're done, continue onto the next lesson to learn about queries that span multiple tables.

This exercise uses a different table
*/


-- List all the Canadian cities and their populations 
SELECT * FROM north_american_cities Where Country = "Canada"

-- Order all the cities in the United States by their latitude from north to south
SELECT * FROM north_american_cities Where Country = "United States" ORDER BY Latitude DESC

-- List all the cities west of Chicago, ordered from west to east 
SELECT city, longitude FROM north_american_cities
WHERE longitude < -87.629798
ORDER BY longitude ASC;

-- List the two largest cities in Mexico (by population)
SELECT * FROM North_american_cities WHERE Country = "Mexico" ORDER BY Population DESC LIMIT 2

-- List the third and fourth largest cities (by population) in the United States and their population
SELECT * FROM North_american_cities WHERE Country = "United States" Order by Population DESC LIMIT 2 OFFSET 2

