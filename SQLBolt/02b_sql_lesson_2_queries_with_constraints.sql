/*
SQL Lesson 3: Queries with constraints (Pt. 2)

Here's the definition of a query with a WHERE clause again, go ahead and try and write some queries with the operators above to limit the results to the information we need in the tasks below.

Select query with constraints
SELECT column, another_column, …
FROM mytable
WHERE condition
    AND/OR another_condition
    AND/OR …;

*/


-- Find all the Toy Story movies
SELECT * FROM movies WHERE Title LIKE "%Toy%";

-- Find all the movies directed by John Lasseter
SELECT * FROM movies WHERE Director LIKE "%John%";

-- Find all the movies (and director) not directed by John Lasseter
SELECT Title,Director FROM movies WHERE Director != "John Lasseter";

-- Find all the WALL-* movies
SELECT * FROM movies WHERE Title LIKE "%WALL-%"