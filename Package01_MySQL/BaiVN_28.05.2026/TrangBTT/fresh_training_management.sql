-- 28.05

create database fresh_training_management;
use fresh_training_management;
create table trainee(
    TraineeID int auto_increment primary key,
    Full_Name varchar(100) not null,
    Birth_Date date not null,
    Gender enum('male','female','unknown') default 'unknown',
    ET_IQ int check(ET_IQ between 0 and 20),
    ET_Gmath int check(ET_Gmath between 0 and 20),
    ET_English int check(ET_English between 0 and 50),
    Training_Class varchar(50) not null,
    Evaluation_Notes text
);

alter table trainee
add column VTI_Account varchar(100) not null;

insert into trainee
(Full_Name,Birth_Date,Gender,ET_IQ,ET_Gmath,ET_English,Training_Class,Evaluation_Notes,VTI_Account)
values
('Nguyen Van An','2001-05-10','male',18,17,45,'Fresher_01','Good logical thinking','an.nguyen'),

('Tran Thi Bich','2000-11-21','female',15,16,40,'Fresher_01','Good communication skills','bich.tran'),

('Le Hoang Minh','1999-08-15','male',20,19,48,'Fresher_02','Excellent performance','minh.le'),

('Pham Gia Bao','2002-01-05','male',12,14,35,'Fresher_03','Need improvement in English','bao.pham'),

('Do Thu Ha','2001-09-30','female',17,18,42,'Fresher_02','Hard-working and active','ha.do');

select * from trainee;
-- trainee cos iq max
select * from trainee
where ET_IQ = (
    select max(ET_IQ)
    from trainee
);

-- diem E trung binh 
select avg(ET_English) as TB from trainee;

-- dem so trainee theo gioi tinh
select Gender, count(*) as total from trainee
group by Gender;

-- trainee co E>40
select * from trainee
where ET_English > 40;

-- sap xep IQ giam dan
select * from trainee
order by ET_IQ desc;

-- 3 trainee diem cao nhat(tong diem)
select *,
(ET_IQ + ET_Gmath + ET_English) as total_score
from trainee
order by total_score desc
limit 3;


