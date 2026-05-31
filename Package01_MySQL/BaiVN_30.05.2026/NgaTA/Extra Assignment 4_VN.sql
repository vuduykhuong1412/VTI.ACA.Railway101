-- SQL – Assignment 4

-- Chuẩn bị database và dữ liệu
DROP DATABASE IF EXISTS AdventureWorks_Mini;
CREATE DATABASE AdventureWorks_Mini;
USE AdventureWorks_Mini;

-- TABLE 1: ProductSubcategory
CREATE TABLE ProductSubcategory (
    ProductSubcategoryID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL
);

-- TABLE 2: Product
CREATE TABLE Product (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    ProductSubcategoryID INT,
    ListPrice DECIMAL(10,2),
    FOREIGN KEY (ProductSubcategoryID) 
        REFERENCES ProductSubcategory(ProductSubcategoryID)
);

-- TABLE 3: CountryRegion
CREATE TABLE CountryRegion (
    CountryRegionCode VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL
);

-- TABLE 4: StateProvince
CREATE TABLE StateProvince (
    StateProvinceID INT PRIMARY KEY AUTO_INCREMENT,
    StateProvinceCode VARCHAR(10),
    CountryRegionCode VARCHAR(10),
    Name VARCHAR(100) NOT NULL,
    FOREIGN KEY (CountryRegionCode)
        REFERENCES CountryRegion(CountryRegionCode)
);

-- TABLE 5: SalesPerson
CREATE TABLE SalesPerson (
    BusinessEntityID INT PRIMARY KEY,
    Bonus DECIMAL(10,2) NOT NULL,
    SalesYTD DECIMAL(15,4) NOT NULL
);

-- TABLE 6: SalesOrderHeader
CREATE TABLE SalesOrderHeader (
    SalesOrderID INT PRIMARY KEY,
    OrderDate DATE NOT NULL,
    SalesPersonID INT NULL,
    OnlineOrderFlag BIT NOT NULL,
    FOREIGN KEY (SalesPersonID)
        REFERENCES SalesPerson(BusinessEntityID)
);

-- TABLE 7: Employee
CREATE TABLE Employee (
    BusinessEntityID INT PRIMARY KEY,
    JobTitle VARCHAR(100) NOT NULL,
    FOREIGN KEY (BusinessEntityID)
        REFERENCES SalesPerson(BusinessEntityID)
);

-- Insert dữ liệu
-- ProductSubcategory
INSERT INTO ProductSubcategory (ProductSubcategoryID, Name) VALUES
(1, 'Saddles'),
(2, 'Bottles and Cages'),
(3, 'Touring Bikes'),
(4, 'Bottom Brackets'),
(5, 'Mountain Bikes');

-- Product
INSERT INTO Product (Name, ProductSubcategoryID, ListPrice) VALUES
-- Saddles
('Mountain Seat/Saddle ML', 1, 39.99),
('Mountain Seat/Saddle HL', 1, 52.99),
('Mountain Seat/Saddle LL', 1, 29.99),
('Road Seat/Saddle ML', 1, 39.99),
('Road Seat/Saddle HL', 1, 52.99),
('Road Seat/Saddle LL', 1, 29.99),
('Touring Seat/Saddle ML', 1, 39.99),
('Touring Seat/Saddle HL', 1, 52.99),
('Touring Seat/Saddle LL', 1, 29.99),

-- Bottles and Cages
('Water Bottle - 30 oz.', 2, 4.99),
('Mountain Bottle Cage', 2, 9.99),
('Road Bottle Cage', 2, 8.99),

-- Bottom Brackets
('Bottom Bracket ML', 4, 44.99),
('Bottom Bracket HL', 4, 59.99),
('Bottom Bracket LL', 4, 39.99),

-- Touring Bikes, lowest price = 742.35
('Touring-3000 Blue, 54', 3, 742.35),
('Touring-3000 Blue, 58', 3, 742.35),
('Touring-3000 Blue, 62', 3, 742.35),
('Touring-3000 Yellow, 44', 3, 742.35),
('Touring-3000 Yellow, 50', 3, 742.35),
('Touring-3000 Yellow, 54', 3, 742.35),
('Touring-3000 Yellow, 58', 3, 742.35),
('Touring-3000 Yellow, 62', 3, 742.35),
('Touring-3000 Blue, 44', 3, 742.35),
('Touring-3000 Blue, 50', 3, 742.35),

-- Touring Bikes expensive
('Touring-1000 Blue, 54', 3, 2384.07),
('Touring-2000 Blue, 54', 3, 1214.85),

-- Other category
('Mountain-100 Black, 42', 5, 3374.99);

-- CountryRegion
INSERT INTO CountryRegion (CountryRegionCode, Name) VALUES
('CA', 'Canada'),
('US', 'United States'),
('DE', 'Germany'),
('FR', 'France');

-- StateProvince
INSERT INTO StateProvince 
(StateProvinceCode, CountryRegionCode, Name) VALUES
-- Canada
('AB', 'CA', 'Alberta'),
('BC', 'CA', 'British Columbia'),
('NB', 'CA', 'Brunswick'),
('LB', 'CA', 'Labrador'),
('MB', 'CA', 'Manitoba'),
('NF', 'CA', 'Newfoundland'),

-- United States
('AK', 'US', 'Alaska'),
('AL', 'US', 'Alabama'),
('AR', 'US', 'Arkansas'),

-- Germany
('BB', 'DE', 'Brandenburg'),
('HH', 'DE', 'Hamburg'),
('HE', 'DE', 'Hessen'),
('NW', 'DE', 'Nordrhein-Westfalen'),
('SL', 'DE', 'Saarland'),
('SN', 'DE', 'Saxony'),

-- France
('90', 'FR', 'Belford'),
('91', 'FR', 'Essonne'),
('92', 'FR', 'Hauts de Seine'),
('93', 'FR', 'Seine Saint Denis'),
('94', 'FR', 'Val de Marne'),
('95', 'FR', 'Val d''Oise');

-- SalesPerson
INSERT INTO SalesPerson (BusinessEntityID, Bonus, SalesYTD) VALUES
(275, 4100.00, 4557045.0459),
(276, 2000.00, 5200475.2313),
(277, 2500.00, 3857163.6332),
(279, 6700.00, 2811012.7151),
(280, 5000.00, 0.0000),
(282, 5000.00, 3189356.2465);

-- Employee
INSERT INTO Employee (BusinessEntityID, JobTitle) VALUES
(275, 'Sales Representative'),
(276, 'Sales Representative'),
(277, 'Sales Representative'),
(279, 'Sales Representative'),
(280, 'Sales Representative'),
(282, 'Sales Representative');

-- SalesOrderHeader
INSERT INTO SalesOrderHeader
(SalesOrderID, OrderDate, SalesPersonID, OnlineOrderFlag)
VALUES
-- Non-Internet orders
(43659, '2001-07-01', 279, 0),
(43660, '2001-07-01', 279, 0),
(43661, '2001-07-01', 282, 0),
(43662, '2001-07-01', 282, 0),
(43663, '2001-07-01', 276, 0),
(43664, '2001-07-01', 280, 0),

(71947, '2004-06-01', 277, 0),
(71948, '2004-06-01', 279, 0),
(71949, '2004-06-01', 277, 0),
(71950, '2004-06-01', 279, 0),
(71951, '2004-06-01', 279, 0),
(71952, '2004-06-01', 275, 0),

-- Internet orders: không lấy trong bài
(80001, '2004-06-02', NULL, 1),
(80002, '2004-06-02', NULL, 1);

-- ============================================================================================================ --
-- Exercise 1: Subquery
-- Viết 1 query lấy thông tin "Name" từ bảng Production.Product có name của ProductSubcategory là 'Saddles'.
select p.Name
from Product p
where ProductSubcategoryID in (
	select ProductSubcategoryID
    from ProductSubcategory ps
    where ps.Name = 'Saddles'
); 

-- Thay đổi câu Query 1 để lấy được kết quả sau.
select p.Name
from Product p
where ProductSubcategoryID in (
	select ProductSubcategoryID
    from ProductSubcategory ps
    where ps.Name like 'Bo%'
); 

-- Viết câu query trả về tất cả các sản phẩm có giá rẻ nhất (lowest ListPrice) và Touring Bike (nghĩa là ProductSubcategoryID = 3)
select p.*
from Product p
where ProductSubcategoryID = 3 
and  p.ListPrice = (
	select min(ListPrice)
    from Product ps 
    where ps.ProductSubcategoryID = 3
);

-- Exercise 2: JOIN nhiều bảng
-- Viết query lấy danh sách tên country và province được lưu trong AdventureWorks2008sample database.
select c.Name as Country, p.Name as Province
from CountryRegion c join StateProvince p
on c.CountryRegionCode = p.CountryRegionCode;

-- Tiếp tục với câu query trước và thêm điều kiện là chỉ lấy country Germany và Canada
select c.Name as Country, p.Name as Province
from CountryRegion c join StateProvince p
on c.CountryRegionCode = p.CountryRegionCode
where c.Name = 'Germany' or c.Name = 'Canada'
order by c.Name, p.Name;

-- Từ bảng SalesPerson, chúng ta lấy cột BusinessEntityID (là định danh của người sales), Bonus and the SalesYTD (là đã sale được bao nhiêu người trong năm nay)
-- Từ bảng SalesOrderHeader, chúng ta lấy cột SalesOrderID OrderDate
select soh.SalesOrderID, 
	soh.OrderDate, 
    soh.SalesPersonID, 
	sp.BusinessEntityID, 
    sp.Bonus, 
    sp.SalesYTD
from SalesPerson sp
join SalesOrderHeader soh
on sp.BusinessEntityID = soh.SalesPersonID
where soh.OnlineOrderFlag = 0;

-- Sử dụng câu query ở question 3, thêm cột JobTitle and xóa cột SalesPersonID và BusinessEntityID.
select soh.SalesOrderID, 
	soh.OrderDate, 
    e.JobTitle, 
    sp.Bonus, 
    sp.SalesYTD
from SalesPerson sp
join SalesOrderHeader soh
on sp.BusinessEntityID = soh.SalesPersonID
join Employee e
on e.BusinessEntityID = sp.BusinessEntityID
where soh.OnlineOrderFlag = 0;