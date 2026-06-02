-- question 1
CREATE DATABASE Fresher_Training_Management;

USE Fresher_Training_Management;

CREATE TABLE Trainee (
    TraineeID INT AUTO_INCREMENT PRIMARY KEY,
    Full_Name VARCHAR(100) NOT NULL,
    Birth_Date DATE,
    Gender ENUM('male', 'female', 'unknown'),
    ET_IQ TINYINT CHECK (ET_IQ BETWEEN 0 AND 20),
    ET_Gmath TINYINT CHECK (ET_Gmath BETWEEN 0 AND 20),
    ET_English TINYINT CHECK (ET_English BETWEEN 0 AND 50),
    Training_Class VARCHAR(50),
    Evaluation_Notes TEXT
);

-- question 2
ALTER TABLE Trainee
ADD VTI_Account VARCHAR(100) NOT NULL UNIQUE;

-- insert data 
INSERT INTO Trainee (Full_Name,Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes, VTI_Account)
VALUES ('Nguyen Van An','2001-05-10','male', 18, 17, 45, 'Fresher_01','Good logical thinking','an.nguyen'),
       ('Tran Thi Bich','2000-11-21','female',15,16,40,'Fresher_01','Good communication skills','bich.tran'),
       ('Le Hoang Minh','1999-08-15','male',20,19,48,'Fresher_02','Excellent performance','minh.le'),
       ('Pham Gia Bao','2002-01-05','male',12,14,35,'Fresher_03','Need improvement in English','bao.pham'),
       ('Do Thu Ha','2001-09-30','female',17,18,42,'Fresher_02','Hard-working and active','ha.do');
       
-- bai tap
-- 1 Trainee có IQ cao nhất
SELECT *
FROM Trainee
ORDER BY ET_IQ DESC
LIMIT 1;
-- 2 Tính điểm English trung bình
SELECT AVG(ET_English) AS Avg_English
FROM Trainee;
-- 3 Đếm số trainee theo giới tính
SELECT Gender, COUNT(*) AS Tổng
FROM Trainee
GROUP BY Gender;
-- 4 Trainee có English > 40
SELECT *
FROM Trainee
WHERE ET_English > 40;
-- 5 Sắp xếp theo IQ giảm dần
SELECT *
FROM Trainee
ORDER BY ET_IQ DESC;
-- 6 Top 3 trainee cao nhất
SELECT *,
       (ET_IQ + ET_Gmath + ET_English) AS TotalScore
FROM Trainee
ORDER BY TotalScore DESC
LIMIT 3;