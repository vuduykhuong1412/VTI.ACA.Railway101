CREATE DATABASE Fresher_Management;
USE Fresher_Management;

CREATE TABLE Trainee(
    TraineeID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Full_Name VARCHAR(255) NOT NULL,
    Birth_Date DATE NOT NULL,
    Gender ENUM('Male', 'Female', 'Unknown') NOT NULL,
    ET_IQ TINYINT NOT NULL CHECK (ET_IQ BETWEEN 0 AND 20),
    Et_Gmath TINYINT NOT NULL CHECK (Et_gmath BETWEEN 0 AND 20),
    ET_English TINYINT NOT NULL CHECK (ET_english BETWEEN 0 AND 50),
    Training_Class VARCHAR(255) NOT NULL,
    Evaluation_Notes TEXT
);
ALTER TABLE Trainee
ADD COLUMN VTI_Account VARCHAR(50) NOT NULL UNIQUE;

INSERT INTO Trainee (Full_Name,Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes, VTI_Account)
VALUES ('Nguyen Van An','2001-05-10','male', 18, 17, 45, 'Fresher_01','Good logical thinking','an.nguyen'),
       ('Tran Thi Bich','2000-11-21','female',15,16,40,'Fresher_01','Good communication skills','bich.tran'),
       ('Le Hoang Minh','1999-08-15','male',20,19,48,'Fresher_02','Excellent performance','minh.le'),
       ('Pham Gia Bao','2002-01-05','male',12,14,35,'Fresher_03','Need improvement in English','bao.pham'),
       ('Do Thu Ha','2001-09-30','female',17,18,42,'Fresher_02','Hard-working and active','ha.do');
       
-- Question 1
SELECT * FROM Trainee WHERE ET_IQ = (SELECT MAX(ET_IQ) FROM Trainee);

-- Question 2
SELECT AVG(ET_English) AS Average_English_Score FROM Trainee;

-- Question 3
SELECT Gender, COUNT(*) AS Total_Trainees FROM Trainee GROUP BY Gender;

-- Question 4
SELECT * FROM Trainee WHERE ET_English > 40;

-- Question 5
SELECT * FROM Trainee ORDER BY ET_IQ DESC;

-- Question 6
SELECT *, (ET_IQ + ET_Gmath + ET_English) AS Total_Score FROM Trainee 
ORDER BY Total_Score DESC LIMIT 3;