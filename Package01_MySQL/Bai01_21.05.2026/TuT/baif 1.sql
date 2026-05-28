create database fresher
use fresher

create table trainee (
TraineeID int auto_increment,
Full_Name varchar(255) not null,
Birth_Day date not null,
Gender Enum ('male','female','unknow') not null,
ET_IQ tinyint not null ( between 0 and 20 ),
Et_gmath tinyint not null ( between 0 and 20),
ET_english tinyint not null (between 0 and 50),
Training_class varchar(255) not null,
Evaluation_notes text,
primary key (TraineeID)
 );
 
 ALTER TABLE Trainee
ADD COLUMN VTI_Account VARCHAR(100) NOT NULL UNIQUE;

insert into trainee (Full_Name, Birth_Day, Gender, ET_IQ, ET_Gmath, ET_english, Training_class.Evaluation_notes )
Values ( 'Le Trong Tu', 04/05/1995, 'Female', 20, 20, 50, 'Railway001', 'Hoc fullstack')