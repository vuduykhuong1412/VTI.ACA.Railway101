CREATE DATABASE IF NOT EXISTS Fresher_Management;
USE Fresher_Management;

create table Trainee (
TraineeID int auto_increment,
Full_Name varchar(255) not null,
Birth_Date date not null,
Gender Enum ('male','female','unknown') not null,
ET_IQ tinyint not null check (ET_IQ between 0 and 20 ),
Et_Gmath tinyint not null check (ET_Gmath between 0 and 20),
ET_English tinyint not null check (ET_English between 0 and 50),
Training_class varchar(255) not null,
Evaluation_Notes text,
primary key (TraineeID)
 );
 
 ALTER TABLE Trainee
ADD COLUMN VTI_Account VARCHAR(100) NOT NULL UNIQUE;

INSERT INTO Trainee (Full_Name,Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes, VTI_Account)
VALUES ('Nguyen Van An','2001-05-10','male', 18, 17, 45, 'Fresher_01','Good logical thinking','an.nguyen'),
       ('Tran Thi Bich','2000-11-21','female',15,16,40,'Fresher_01','Good communication skills','bich.tran'),
       ('Le Hoang Minh','1999-08-15','male',20,19,48,'Fresher_02','Excellent performance','minh.le'),
       ('Pham Gia Bao','2002-01-05','male',12,14,35,'Fresher_03','Need improvement in English','bao.pham'),
       ('Do Thu Ha','2001-09-30','female',17,18,42,'Fresher_02','Hard-working and active','ha.do');
       
select * from Trainee;
-- cau truc tren la chay bang sau khi insert dau vao

-- Bai1: Tim Trainee co IQ cao nhat
SELECT *
FROM Trainee
WHERE ET_IQ = (
    SELECT MAX(ET_IQ)
    FROM Trainee
);

-- Bai2: Tính điểm English trung bình
SELECT AVG(ET_English) AS Average_English
FROM Trainee;

-- Bai3: Đếm số trainee theo giới tính
SELECT Gender, COUNT(*) AS Total_Trainee
FROM Trainee
GROUP BY Gender;

-- Bai4: Lấy trainee có English > 40
SELECT *
FROM Trainee
WHERE ET_English > 40;

-- Bai5: Sắp xếp theo IQ giảm dần
SELECT *
FROM Trainee
ORDER BY ET_IQ DESC;

-- Bai6: Top 3 trainee điểm cao nhất
SELECT 
    TraineeID,
    Full_Name,
    ET_IQ,
    ET_Gmath,
    ET_English,
    (ET_IQ + ET_Gmath + ET_English) AS Total_Score
FROM Trainee
ORDER BY Total_Score DESC
LIMIT 3;