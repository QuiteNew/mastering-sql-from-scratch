CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    DriverLicenseNumber NVARCHAR(20) UNIQUE NOT NULL,
    Email NVARCHAR(100) UNIQUE,
    Phone NVARCHAR(15)
);

INSERT INTO Customers (FirstName, LastName, DriverLicenseNumber, Email, Phone) VALUES 
('James', 'Smith', 'DL12345', 'james.s@email.com', '555-0101'),
('Maria', 'Garcia', 'DL23456', 'm.garcia@email.com', '555-0102'),
('Robert', 'Johnson', 'DL34567', 'r.johnson@email.com', '555-0103'),
('Linda', 'Williams', 'DL45678', 'linda.w@email.com', '555-0104'),
('Michael', 'Brown', 'DL56789', 'm.brown@email.com', '555-0105'),
('Elizabeth', 'Jones', 'DL67890', 'e.jones@email.com', '555-0106'),
('David', 'Miller', 'DL78901', 'd.miller@email.com', '555-0107'),
('Barbara', 'Davis', 'DL89012', 'b.davis@email.com', '555-0108'),
('William', 'Garcia', 'DL90123', 'w.garcia2@email.com', '555-0109'),
('Susan', 'Rodriguez', 'DL01234', 'susan.r@email.com', '555-0110'),
('Joseph', 'Martinez', 'DL11223', 'j.martinez@email.com', '555-0111'),
('Jessica', 'Hernandez', 'DL22334', 'jess.h@email.com', '555-0112'),
('Thomas', 'Lopez', 'DL33445', 't.lopez@email.com', '555-0113'),
('Sarah', 'Gonzalez', 'DL44556', 's.gonzalez@email.com', '555-0114'),
('Charles', 'Wilson', 'DL55667', 'c.wilson@email.com', '555-0115'),
('Karen', 'Anderson', 'DL66778', 'k.anderson@email.com', '555-0116'),
('Christopher', 'Thomas', 'DL77889', 'chris.t@email.com', '555-0117'),
('Nancy', 'Taylor', 'DL88990', 'n.taylor@email.com', '555-0118'),
('Daniel', 'Moore', 'DL99001', 'd.moore@email.com', '555-0119'),
('Lisa', 'Jackson', 'DL00112', 'l.jackson@email.com', '555-0120'),
('Matthew', 'Martin', 'DL11122', 'm.martin@email.com', '555-0121'),
('Margaret', 'Lee', 'DL22233', 'm.lee@email.com', '555-0122'),
('Anthony', 'Perez', 'DL33344', 'a.perez@email.com', '555-0123'),
('Betty', 'Thompson', 'DL44455', 'b.thompson@email.com', '555-0124'),
('Mark', 'White', 'DL55566', 'm.white@email.com', '555-0125');

CREATE TABLE Locations (
    LocationID INT IDENTITY(1,1) PRIMARY KEY,
    BranchName NVARCHAR(100) NOT NULL,
    City NVARCHAR(50) NOT NULL,
    AddressLine NVARCHAR(200) NOT NULL
);

INSERT INTO Locations (BranchName, City, AddressLine) VALUES 
('Downtown Hub', 'New York', '123 Broadway'),
('JFK Airport', 'Queens', 'Terminal 4'),
('Westside Branch', 'New York', '456 10th Ave'),
('North Station', 'Boston', '1 Causey St'),
('South Beach', 'Miami', '789 Ocean Dr');

CREATE TABLE CarCategories (
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    CategoryName NVARCHAR(50) NOT NULL,
    DailyRate DECIMAL(10,2) NOT NULL CHECK (DailyRate > 0)
);

INSERT INTO CarCategories (CategoryName, DailyRate) VALUES 
('Economy', 35.00), ('Sedan', 55.00), ('SUV', 85.00), ('Luxury', 150.00), ('Van', 100.00);

CREATE TABLE Cars (
    CarID INT IDENTITY(1,1) PRIMARY KEY,
    Make NVARCHAR(50) NOT NULL,
    Model NVARCHAR(50) NOT NULL,
    Year INT NOT NULL CHECK (Year > 2000),
    LicensePlate NVARCHAR(15) UNIQUE NOT NULL,
    CategoryID INT NOT NULL REFERENCES CarCategories(CategoryID),
    LocationID INT NOT NULL REFERENCES Locations(LocationID),
    Status NVARCHAR(20) DEFAULT 'Available' CHECK (Status IN ('Available', 'Rented', 'Maintenance'))
);

CREATE TABLE Rentals (
    RentalID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL REFERENCES Customers(CustomerID),
    CarID INT NOT NULL REFERENCES Cars(CarID),
    PickupLocationID INT NOT NULL REFERENCES Locations(LocationID),
    DropoffLocationID INT NOT NULL REFERENCES Locations(LocationID),
    RentalDate DATE NOT NULL,
    ReturnDate DATE,
    TotalAmount DECIMAL(10,2),
    CONSTRAINT CHK_Dates CHECK (ReturnDate >= RentalDate)
);

CREATE TABLE Payments (
    PaymentID INT IDENTITY(1,1) PRIMARY KEY,
    RentalID INT NOT NULL REFERENCES Rentals(RentalID),
    PaymentDate DATE NOT NULL DEFAULT GETDATE(),
    Amount DECIMAL(10,2) NOT NULL CHECK (Amount > 0),
    PaymentMethod NVARCHAR(20) CHECK (PaymentMethod IN ('Credit Card', 'Cash', 'Debit Card'))
);

------------------------------------------------------------------------------------------------------------

-- 2 Indexes
CREATE INDEX IX_Customers_Email ON Customers(Email);
CREATE INDEX IX_Rentals_RentalDate ON Rentals(RentalDate);

-- 2 Views
GO
CREATE VIEW vw_AvailableCars AS
SELECT c.CarID, c.Make, c.Model, cat.CategoryName, cat.DailyRate, l.BranchName
FROM Cars c
JOIN CarCategories cat ON c.CategoryID = cat.CategoryID
JOIN Locations l ON c.LocationID = l.LocationID
WHERE c.Status = 'Available';
GO

CREATE VIEW vw_CustomerRentalSummary AS
SELECT cu.FirstName, cu.LastName, COUNT(r.RentalID) AS TotalRentals, SUM(p.Amount) AS TotalSpent
FROM Customers cu
LEFT JOIN Rentals r ON cu.CustomerID = r.CustomerID
LEFT JOIN Payments p ON r.RentalID = p.RentalID
GROUP BY cu.FirstName, cu.LastName;
GO

--------------------------------------------------------------------------------------------------------------

-- 2 Triggers 
GO
CREATE TRIGGER trg_UpdateCarStatus_Rented
ON Rentals
AFTER INSERT
AS
BEGIN
    UPDATE Cars
    SET Status = 'Rented'
    FROM Cars c
    INNER JOIN inserted i ON c.CarID = i.CarID;
END;
GO

CREATE TRIGGER trg_UpdateCarStatus_Returned
ON Rentals
AFTER UPDATE
AS
BEGIN
    IF UPDATE(ReturnDate)
    BEGIN
        UPDATE Cars
        SET Status = 'Available'
        FROM Cars c
        INNER JOIN inserted i ON c.CarID = i.CarID
        WHERE i.ReturnDate IS NOT NULL;
    END
END;
GO

-------------------------------------------------------------------------------------

-- 10 queries koi morame da gi imame

-- 1. Basic SELECT with WHERE
SELECT Make, Model, Year FROM Cars WHERE Status = 'Available';

-- 2. INNER JOIN (Cars and their Categories)
SELECT c.LicensePlate, c.Make, c.Model, cat.CategoryName, cat.DailyRate
FROM Cars c
JOIN CarCategories cat ON c.CategoryID = cat.CategoryID;

-- 3. LEFT JOIN (Customers and their rentals, showing all customers)
SELECT cu.FirstName, cu.LastName, r.RentalDate
FROM Customers cu
LEFT JOIN Rentals r ON cu.CustomerID = r.CustomerID;

-- 4. GROUP BY with aggregate (Count total cars parked at each location)
SELECT l.BranchName, COUNT(c.CarID) AS TotalCars
FROM Locations l
JOIN Cars c ON l.LocationID = c.LocationID
GROUP BY l.BranchName;

-- 5. Subquery in WHERE (Find customers who rented a specific car category)
SELECT FirstName, LastName 
FROM Customers 
WHERE CustomerID IN (
    SELECT r.CustomerID 
    FROM Rentals r
    JOIN Cars c ON r.CarID = c.CarID
    JOIN CarCategories cat ON c.CategoryID = cat.CategoryID
    WHERE cat.CategoryName = 'Luxury'
);

-- 6. Aggregate with HAVING (Identify locations with more than 5 rentals)
SELECT PickupLocationID, COUNT(*) AS TotalRentals
FROM Rentals
GROUP BY PickupLocationID
HAVING COUNT(*) > 5;

-- 7. Multiple JOINs (Retrieve full rental receipt details)
SELECT r.RentalID, cu.FirstName, cu.LastName, c.Make, c.Model, p.Amount
FROM Rentals r
JOIN Customers cu ON r.CustomerID = cu.CustomerID
JOIN Cars c ON r.CarID = c.CarID
JOIN Payments p ON r.RentalID = p.RentalID;

-- 8. Subquery in SELECT (Calculate percentage of total revenue for each payment)
SELECT PaymentID, Amount, 
       (Amount / (SELECT SUM(Amount) FROM Payments)) * 100 AS RevenuePercentage
FROM Payments;

-- 9. Date function query (Find rentals that lasted longer than 7 days)
SELECT RentalID, CustomerID, DATEDIFF(day, RentalDate, ReturnDate) AS DaysRented
FROM Rentals
WHERE DATEDIFF(day, RentalDate, ReturnDate) > 7;

-- 10. Complex query combining GROUP BY, JOINs, and ORDER BY (Total revenue per category)
SELECT cat.CategoryName, SUM(p.Amount) AS TotalRevenue
FROM CarCategories cat
JOIN Cars c ON cat.CategoryID = c.CategoryID
JOIN Rentals r ON c.CarID = r.CarID
JOIN Payments p ON r.RentalID = p.RentalID
GROUP BY cat.CategoryName
ORDER BY TotalRevenue DESC;