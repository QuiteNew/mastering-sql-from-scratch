\# Automated Car Rental Management System



\## Project Overview

This project presents a comprehensive relational database design and implementation for an Automated Car Rental Management System, developed for the Databases course at the University American College Skopje. The system was designed and implemented by Konstantin Pandilovski (6227) and Ivo Sardzovski-Teovski (6228) under the instruction of Dr. Venera Gudachi. It aims to streamline logistics, eliminate common operational issues like manual data entry errors or double bookings, and handle the entire car rental lifecycle from initial customer profile creation to final payment processing.



\## System Architecture and Database Design

The database has been designed on a well-formed relational structure with normalization being achieved up to the third normal form. Designed on Microsoft SQL Server platform and managed with the help of SQL Server Management Studio, the database has been designed using six interrelated tables. CarCategories table contains information related to various tiers of vehicles and global prices. Locations table helps in management of multi branch information and also keeps track of distribution of fleets. Customers table keeps record of all individual customers using indexes for avoiding duplication of accounts. Cars table acts as the central fleet register having references to different categories and different branches. The most important part of this entire design is the Rentals table which is the transaction table between customers, vehicles and their respective pickup or drop off locations. Lastly, the Payments table keeps track of payments and works as a weak entity having an existence dependency.



\## Database Queries and Capabilities

The implementation includes ten specific SQL queries designed to provide crucial operational insights for administrators and front-desk personnel. These include basic selection filters to verify real-time vehicle availability and inner joins to help staff match car details with their exact category rates. Left joins are utilized to extract customer records regardless of their rental history, which provides valuable data for tracking inactive users. The database also leverages aggregations, subqueries, and grouping mechanisms to calculate the physical distribution of cars across branches, identify luxury category renters, and isolate high-traffic locations using having clauses. Advanced reporting is handled through multiple table joins that generate unified transaction summaries, date functions that compute precise rental durations for billing accuracy, and complex analytical sorting to rank car categories by total revenue generated.

## Prerequisites and Documentation

To execute and test this relational database system, Microsoft SQL Server and SQL Server Management Studio is required to properly run the schema configuration and transaction scripts. Full project documentation, which includes entity-relationship analysis and explanation of how the queries work, can be found in the repository documents to help you understand the structure and logic behind the system.

