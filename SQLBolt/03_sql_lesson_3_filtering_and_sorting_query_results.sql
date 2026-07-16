/*
SQL Lesson 4: Filtering and sorting Query results

There are a few concepts in this lesson, but all are pretty straight-forward to apply. To spice things up, we've gone and scrambled the Movies table for you in the exercise to better mimic what kind of data you might see in real life. Try and use the necessary keywords and clauses introduced above in your queries.
*/


-- List all directors of Pixar movies (alphabetically), without duplicates 
SELECT DISTINCT Director FROM movies ORDER BY DIrector ASC

-- List the last four Pixar movies released (ordered from most recent to least)
SELECT DISTINCT Title FROM movies ORDER BY Year ASC LIMIT 4

-- List the first five Pixar movies sorted alphabetically 
SELECT DISTINCT Title FROM movies ORDER BY Title ASC LIMIT 5

-- List the next five Pixar movies sorted alphabetically 
SELECT DISTINCT Title FROM movies ORDER BY Title ASC LIMIT 5 OFFSET 5