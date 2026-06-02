CREATE DATABASE Fresher;

USE Fresher;

CREATE TABLE Trainee (
    TraineeID     INT             NOT NULL AUTO_INCREMENT,
    Full_Name     NVARCHAR(100)   NOT NULL,
    Birth_Date    DATE            NOT NULL,
    Gender        ENUM('male', 'female', 'unknown')  NOT NULL,
    ET_IQ         TINYINT UNSIGNED NOT NULL DEFAULT 0,
    ET_Gmath      TINYINT UNSIGNED NOT NULL DEFAULT 0,
    ET_English    TINYINT UNSIGNED NOT NULL DEFAULT 0,
    Training_Class VARCHAR(20)    NOT NULL,
    Evaluation_Notes TEXT         NULL,

    CONSTRAINT PK_Trainee         PRIMARY KEY (TraineeID),
    CONSTRAINT CHK_ET_IQ          CHECK (ET_IQ     BETWEEN 0 AND 20),
    CONSTRAINT CHK_ET_Gmath       CHECK (ET_Gmath  BETWEEN 0 AND 20),
    CONSTRAINT CHK_ET_English     CHECK (ET_English BETWEEN 0 AND 50)
);

ALTER TABLE Trainee
    ADD COLUMN VTI_Account VARCHAR(50) NOT NULL UNIQUE;

INSERT INTO Trainee (Full_Name,Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes, VTI_Account)
VALUES ('Nguyen Van An','2001-05-10','male', 18, 17, 45, 'Fresher_01','Good logical thinking','an.nguyen'),
       ('Tran Thi Bich','2000-11-21','female',15,16,40,'Fresher_01','Good communication skills','bich.tran'),
       ('Le Hoang Minh','1999-08-15','male',20,19,48,'Fresher_02','Excellent performance','minh.le'),
       ('Pham Gia Bao','2002-01-05','male',12,14,35,'Fresher_03','Need improvement in English','bao.pham'),
       ('Do Thu Ha','2001-09-30','female',17,18,42,'Fresher_02','Hard-working and active','ha.do');


SELECT * FROM Trainee;

-- Tìm Trainee có IQ cao nhất
SELECT * FROM Trainee
Where ET_IQ = (
      SELECT MAX(ET_IQ)
      FROM Trainee
);

-- Tính điểm English trung bình
SELECT AVG(ET_ENGLISH) AS TB_ENGLISH
FROM Trainee;

-- Đếm số trainee theo giới tính
SELECT Gender, COUNT(*) AS Total
FROM Trainee
GROUP BY Gender;

-- Lấy Trainee có English > 40
SELECT *
FROM Trainee
WHERE ET_English > 40;

-- Sắp xếp theo IQ giảm dần
SELECT *
FROM Trainee
ORDER BY ET_IQ DESC;

-- Top 3 Trainee điểm cap nhất
SELECT *, (ET_IQ + ET_Gmath + ET_English) AS Total_Score
FROM Trainee
ORDER BY Total_Score DESC
LIMIT 3;
