create database fresh_training_management;
create table trainee(
traineeID int auto_increment primary key,
fullname varchar(100) not null,
birthdate date not null,
gender enum('male','female','unknown') default'unknown',
ET_IQ int check(ET_IQ between 0 and 20),
ET_Gmath int check(ET_Gmath between 0 and 20),
ET_English int check(ET_English between 0 and 50),
trainingclass varchar(50) not null,
evaluationnote text
);
alter table trainee add column vti_account varchar(100) not null;
INSERT INTO trainee (fullname,birthdate,gender,ET_IQ,ET_Gmath,ET_English,trainingclass,evaluationnote,vti_account)
VALUES ('Nguyen Van An','2001-05-10','male', 18, 17, 45, 'Fresher_01','Good logical thinking','an.nguyen'),
       ('Tran Thi Bich','2000-11-21','female',15,16,40,'Fresher_01','Good communication skills','bich.tran'),
       ('Le Hoang Minh','1999-08-15','male',20,19,48,'Fresher_02','Excellent performance','minh.le'),
       ('Pham Gia Bao','2002-01-05','male',12,14,35,'Fresher_03','Need improvement in English','bao.pham'),
       ('Do Thu Ha','2001-09-30','female',17,18,42,'Fresher_02','Hard-working and active','ha.do');
