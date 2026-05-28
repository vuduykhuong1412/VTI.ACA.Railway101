create table trainee(
traineeID int auto_increment primary key,
fullname varchar(100) not null,
birthdate date not null,
gender enum('male','female','unkown') default'unkown',
ET_IQ int check(ET_IQ between 0 and 20),
ET_Gmath int check(ET_Gmath between 0 and 20),
ET_English int check(ET_English between 0 and 50),
trainingclass varchar(50) not null,
evaluationnote text
);
alter table trainee add column vti_account varchar(100) not null unique
