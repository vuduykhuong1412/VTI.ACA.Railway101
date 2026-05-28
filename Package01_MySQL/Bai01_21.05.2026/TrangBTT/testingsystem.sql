create database testingsystem;
use testingsystem;
create table department(
department_id int not null auto_increment,
name_department varchar(255) not null,
primary key(department_id)
);
drop table department;
create table `Position`(
position_id int not null auto_increment,
position_name varchar(255) not null,
primary key(position_id)
);
create table `account`(
account_id int not null auto_increment,
email varchar(50) not null unique key,
username varchar(50) not null unique key,
fullname nvarchar(50) not null,
department_id int not null,
position_id int not null,
createdate datetime default now(),
foreign key(department_id) references department(department_id),
foreign key(position_id) references `position`(position_id),
primary key(account_id)
);
create table `group`(
group_id int not null auto_increment,
group_namme varchar(50) not null unique key,
creator_id int,
createdate   datetime default now(),
foreign key(creator_id) references account(account_id),
primary key(group_id)
);
create table groupaccount(
group_id int not null,
account_id int not null,
joindate datetime default now(),
primary key(group_id, account_id),
foreign key(group_id) references `group`(group_id),
foreign key(account_id) references`account`(account_id)
);
create table typequestion(
typeid int not null auto_increment,
primary key(typeid),
typename nvarchar(50) not null unique key
);
 create table categoryquestion(
 categoryid int not null auto_increment,
 primary key(categoryid),
 categoryname varchar(50) not null unique key
 );
 create table question(
 questionid int not null auto_increment,
 primary key(questionid),
 content nvarchar(100) not null,
 categoryid int not null,
 typeid int not null,
 creator_id int not null,
 createdate datetime default now(),
 foreign key(categoryid) references categoryquestion(categoryid),
 foreign key(typeid)references typequestion(typeid),
 foreign key(creator_id) references `account`(account_id)
 );
 create table answer(
 answerid int auto_increment,
 primary key(answerid),
 content nvarchar(100) not null,
 questionid int not null,
 iscorrect bit default 1,
 foreign key(questionid) references question(questionid)
 );
create table exam(
examid int not null auto_increment,
primary key(examid),
`code` char(10) not null,
title nvarchar(50) not null,
categoryid int not null,
duration int not null,
creator_id int not null,
createdate datetime default now(),
foreign key(categoryid) references categoryquestion(categoryid),
foreign key(creator_id) references account(account_id)
);
create table examquestion(
examid int not null,
questionid int not null,
foreign key(examid) references exam(examid),
foreign key(questionid) references question(questionid),
primary key(questionid, examid)
);
insert into department(name_department) 
values("marketing"),("sale"),("bao ve"),("nhan su"),("ky thuat"), ("tai chinh"),
      ("pho giam doc"), ("giam doc"),("thu ki"), ("no person"),("ban hang");
      
      select * from department;
      
   insert into `position`(position_name)
   values("dev"), ("test"),("scrum master"),("pm");
   
   select * from `position`;
   
insert into `account`(email,username,fullname,department_id,position_id,createdate)
values("trang@gmail.com", 'trang' ,'buii thi thu trang',"5", "1","2020-03-05");
insert into `account`(email,username,fullname,department_id,position_id,createdate)
values("thao@gmail.com", 'thao' ,'buii thi thu thao',"1", "2","2020-03-05");
insert into `account`(email,username,fullname,department_id,position_id,createdate)
values("linh@gmail.com", 'linh' ,'buii thi thu linh',"2", "2","2020-03-07");
insert into `account`(email,username,fullname,department_id,position_id,createdate)
values("huong@gmail.com", 'huong' ,'buii thi thu huong',"3", "4","2020-03-08");
insert into `account`(email,username,fullname,department_id,position_id,createdate)
values("tu@gmail.com", 'tu' ,'nguyen van tu',"4", "4","2020-03-10");
insert into `account`(email,username,fullname,department_id,position_id,createdate)
values("hoang@gmail.com", 'hoang' ,'pham gia minh hoang',"6", "3","2020-03-12");


SELECT * FROM `account`;

insert into `group`(group_namme,creator_id,createdate)
values("Testing System",5,"2019-03-05"),
      ("Development",1,"2020-03-07"),
      ("sale",6,"2020-03-07"),
      ("marketing",7,"2020-03-09"),
	  ("management",8,"2020-03-10");
      

select* from `group`;

delete from `group` where group_namme = "management";
truncate table `group`;
truncate table groupaccount;
insert into groupaccount(group_id,account_id,joindate)
values(32,5,"2020-03-05"),
	  (33,1,"2020-03-07"),
      (34,6,"2020-03-09"),
      (35,7,"2020-03-10"),
      (36,8,"2020-03-07");

select * from groupaccount;      
truncate table groupaccount;
select * from groupaccount;

insert into typequestion(typename)
values("essay"),("multiple-choice");

select* from typequestion;

insert into categoryquestion(categoryname)
values("java"),("asp.net"),("ado.net"),("sql"),("postman"),("ruby"),("python"),("c++");

select *from categoryquestion;


insert into question(content,categoryid,typeid,creator_id,createdate)
values	  ("hoi ve java",1,1,1,"2020-04-04"),
		  ("hoi ve asp.net",2,2,5,"2020-04-05"),
           ("hoi ve ado.net",3,1,6,"2020-04-09"),
            ("hoi ve sql",4,1,7,"2020-04-10"),
             ("hoi ve postman",5,2,8,"2020-04-12");
             
select * from question;

insert into answer(content,questionid,iscorrect)
values      ("khong bic",6,0),
			("khum bic nnua",7,0),
			("khong bic gi het",8,1),
			("chiu",9,0),
		    ("keee",10,1);
            select * from answer;

insert into exam(`code`,title,categoryid,duration,creator_id,createdate)
values ("abcd","de 1",1,60,1,"2019-04-10"),
		("nnsdab","de 2",2,60,5,"2019-04-11"),
        ("hhihihi","de 3",3,60,6,"2019-04-15"),
        ("hahahha","de 4",4,60,7,"2019-04-17"),
        ("kkk","de 5",5,60,8,"2019-04-20");
		select * from exam;


insert into examquestion(examid,questionid)
values(6,8),(7,9),(8,8),(9,6),(10,10);

select * from examquestion;
select * from department;

-- cau hoi--
select department_id from department where name_department='sale';
select * from `account` where length(fullname)=(select max(length(fullname)) from `account`);
select* from `account` where department_id=3
and length(fullname)=(select max(length(fullname)) 
from `account` where department_id=3);
select group_namme from `group` where createdate<'2019-12-20';
select questionid from answer
group by questionid having count(answerid)>=4;
select examid from exam 
where duration>=60 and createdate<'2019-12-20';
select * from `group` order by createdate desc limit 5;
select count(department_id) from `account`  where department_id=2;
select * from `account` where fullname like 'D%O';
