CREATE DATABASE Testing_System_Assignment_1;
USE Testing_System_Assignment_1;

CREATE TABLE Department (
    DepartmentID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(255) NOT NULL UNIQUE -- Thêm UNIQUE để tên phòng ban không trùng nhau (optional nhưng tốt)
);
CREATE TABLE `Position` (
    PositionID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    PositionName VARCHAR(255) NOT NULL
);
CREATE TABLE `Account` (
    AccountID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Email VARCHAR(255) NOT NULL UNIQUE,
    Username VARCHAR(255) NOT NULL UNIQUE,
    FullName VARCHAR(255) NOT NULL,	
    DepartmentID INT NOT NULL,
    PositionID INT NOT NULL,
    CreateDate DATETIME DEFAULT NOW(),
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY (PositionID) REFERENCES `Position`(PositionID)
);



