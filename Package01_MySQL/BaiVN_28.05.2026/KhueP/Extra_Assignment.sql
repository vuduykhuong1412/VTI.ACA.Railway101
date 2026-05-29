create database fresher_management;
drop database trainee_management;
use fresher_management;
create table trainee (
 TraineeID int auto_increment primary key,
 Full_Name varchar(100) not null,
 Birth_Date date,
 Gender ENUM('Male', 'Female', 'Unkown'),
 ET_IQ tinyint check(ET_IQ between 0 and 20),
 ET_Gmath tinyint check(ET_Gmath between 0 and 20),
 ET_English tinyint check(ET_English between 0 and 50),
 Training_Class varchar(20),
 Evaluation_Notes text
);
alter table trainee
add column VTI_Account varchar(50) not null unique;
select * from trainee;

-- insert data
INSERT INTO Trainee (Full_Name,Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes, VTI_Account)
VALUES ('Nguyen Van An','2001-05-10','male', 18, 17, 45, 'Fresher_01','Good logical thinking','an.nguyen'),
       ('Tran Thi Bich','2000-11-21','female',15,16,40,'Fresher_01','Good communication skills','bich.tran'),
       ('Le Hoang Minh','1999-08-15','male',20,19,48,'Fresher_02','Excellent performance','minh.le'),
       ('Pham Gia Bao','2002-01-05','male',12,14,35,'Fresher_03','Need improvement in English','bao.pham'),
       ('Do Thu Ha','2001-09-30','female',17,18,42,'Fresher_02','Hard-working and active','ha.do');
select * from trainee;

-- 1. Tìm Trainee có IQ cao nhất
select *
from trainee
where ET_IQ = (
	select max(ET_IQ)
    from trainee
);

-- 2. Tính điểm English trung bình
select avg(ET_English) as Avg_English
from trainee;

-- 3. Đếm số trainee theo giới tính
select Gender, count(*) as total_gender
from Trainee
group by Gender;

-- 4. Lấy trainee có English > 40
select *
from Trainee
where ET_English > 40;

-- 5. Sắp xếp theo IQ giảm dần
select *
from Trainee
order by ET_IQ desc;
-- 6. Top 3 trainee có điểm cao nhất
select
	TraineeID,
	Full_Name,
    ET_IQ + ET_Gmath + ET_English as TotalScore
from Trainee
order by TotalScore desc
limit 3;