/*
SQL Lesson 6: Multi-table queries with JOINs

We've added a new table to the Pixar database so that you can try practicing some joins. The BoxOffice table stores information about the ratings and sales of each particular Pixar movie, and the Movie_id column in that table corresponds with the Id column in the Movies table 1-to-1. Try and solve the tasks below using the INNER JOIN introduced above.

In this exercise use the Movies table along with a new Boxoffice table
*/

-- Find the domestic and international sales for each movie 
SELECT * FROM movies
INNER JOIN boxoffice
ON movies.Id = boxoffice.Movie_id


-- Show the sales numbers for each movie that did better internationally rather than domestically
SELECT * FROM movies
INNER JOIN boxoffice
ON movies.Id = boxoffice.Movie_id
WHERE international_sales > domestic_sales


-- List all the movies by their ratings in descending order
SELECT * FROM movies
INNER JOIN boxoffice
ON movies.Id = boxoffice.Movie_id
ORDER BY Rating DESC


