-- 30.05

DROP DATABASE testing_system;
create database testing_system;
create table department(
    department_id int auto_increment primary key,
    name_department varchar(255) not null
);
create table `position`(
    position_id int auto_increment primary key,
    position_name varchar(255) not null
);
create table `account`(
    account_id int auto_increment primary key,
    email varchar(50) not null unique,
    username varchar(50) not null unique,
    fullname varchar(50) not null,
    department_id int not null,
    position_id int not null,
    createdate datetime default now(),

    foreign key(department_id)
        references department(department_id),

    foreign key(position_id)
        references `position`(position_id)
);
create table `group`(
    group_id int auto_increment primary key,
    group_name varchar(50) not null unique,
    creator_id int,
    createdate datetime default now(),

    foreign key(creator_id)
        references `account`(account_id)
);
create table groupaccount(
    group_id int,
    account_id int,
    joindate datetime default now(),

    primary key(group_id, account_id),

    foreign key(group_id)
        references `group`(group_id),

    foreign key(account_id)
        references `account`(account_id)
);
create table typequestion(
    typeid int auto_increment primary key,
    typename varchar(50) not null unique
);
create table categoryquestion(
    categoryid int auto_increment primary key,
    categoryname varchar(50) not null unique
);
create table question(
    questionid int auto_increment primary key,
    content varchar(100) not null,
    categoryid int not null,
    typeid int not null,
    creator_id int not null,
    createdate datetime default now(),

    foreign key(categoryid)
        references categoryquestion(categoryid),

    foreign key(typeid)
        references typequestion(typeid),

    foreign key(creator_id)
        references `account`(account_id)
);
create table answer(
    answerid int auto_increment primary key,
    content varchar(100) not null,
    questionid int not null,
    iscorrect bit default 1,

    foreign key(questionid)
        references question(questionid)
);
create table exam(
    examid int auto_increment primary key,
    `code` char(10) not null,
    title varchar(50) not null,
    categoryid int not null,
    duration int not null,
    creator_id int not null,
    createdate datetime default now(),

    foreign key(categoryid)
        references categoryquestion(categoryid),

    foreign key(creator_id)
        references `account`(account_id)
);
create table examquestion(
    examid int,
    questionid int,

    primary key(examid, questionid),

    foreign key(examid)
        references exam(examid),

    foreign key(questionid)
        references question(questionid)
);
insert into department(name_department)
values
('marketing'),
('sale'),
('bao ve'),
('nhan su'),
('ky thuat'),
('tai chinh'),
('pho giam doc'),
('giam doc'),
('thu ki'),
('no person'),
('ban hang');

insert into `position`(position_name)
values
('dev'),
('test'),
('scrum master'),
('pm');

insert into `account`
(email, username, fullname, department_id, position_id, createdate)
values
('trang@gmail.com', 'trang', 'bui thi thu trang', 5, 1, '2020-03-05'),
('thao@gmail.com', 'thao', 'bui thi thu thao', 1, 2, '2020-03-05'),
('linh@gmail.com', 'linh', 'bui thi thu linh', 2, 2, '2020-03-07'),
('huong@gmail.com', 'huong', 'bui thi thu huong', 3, 4, '2020-03-08'),
('tu@gmail.com', 'tu', 'nguyen van tu', 4, 4, '2020-03-10'),
('hoang@gmail.com', 'hoang', 'pham gia minh hoang', 6, 3, '2020-03-12');
insert into `account`
(email, username, fullname, department_id, position_id, createdate)
values
('an@gmail.com', 'an', 'nguyen van an', 1, 1, '2020-03-15'),
('binh@gmail.com', 'binh', 'tran van binh', 2, 2, '2020-03-16'),
('cuong@gmail.com', 'cuong', 'le van cuong', 3, 3, '2020-03-17'),
('dung@gmail.com', 'dung', 'pham van dung', 4, 4, '2020-03-18');

insert into `group`(group_name, creator_id, createdate)
values
('testing system', 1, '2019-03-05'),
('development', 2, '2020-03-07'),
('sale', 3, '2020-03-07'),
('marketing', 4, '2020-03-09'),
('management', 5, '2020-03-10');
insert into `group`
(group_name, creator_id, createdate)
values
('creator', 6, '2020-04-01'),
('chatwithlove', 7, '2020-04-02'),
('tester', 8, '2020-04-03'),
('backend', 9, '2020-04-04'),
('frontend', 10, '2020-04-05');

insert into groupaccount(group_id, account_id, joindate)
values
(11,5, '2020-03-05'),
(12, 7, '2020-03-07'),
(13, 2, '2020-03-09'),
(14, 6, '2020-03-10'),
(15, 9, '2020-03-07');
insert into groupaccount(group_id, account_id, joindate)
values
(11,10, '2020-03-05');

insert into typequestion(typename)
values
('essay'),
('multiple-choice');

insert into categoryquestion(categoryname)
values
('java'),
('asp.net'),
('ado.net'),
('sql'),
('postman'),
('ruby'),
('python'),
('c++');

insert into question(content, categoryid, typeid, creator_id, createdate)
values
('hoi ve java', 1, 1, 7, '2020-04-04'),
('hoi ve asp.net', 2, 2, 8, '2020-04-05'),
('hoi ve ado.net', 3, 1, 9, '2020-04-09'),
('hoi ve sql', 4, 1, 10, '2020-04-10'),
('hoi ve postman', 5, 2, 2, '2020-04-12');

insert into answer(content, questionid, iscorrect)
values
('abcd', 1, 0),
('databaseee', 2, 0),
('sqll', 3, 1),
('netbeen', 4, 0),
('xampp', 5, 1);
insert into answer(content, questionid, iscorrect)
values
('xyztk', 1, 0);

insert into exam(`code`, title, categoryid, duration, creator_id, createdate)
values
('abcd', 'de 1', 1, 60, 7, '2019-04-10'),
('nnsdab', 'de 2', 2, 60, 8, '2019-04-11'),
('hhihihi', 'de 3', 3, 60, 9, '2019-04-15'),
('hahahha', 'de 4', 4, 60, 10, '2019-04-17'),
('kkk', 'de 5', 5, 60, 2, '2019-04-20');
insert into exam(`code`, title, categoryid, duration, creator_id, createdate)
values ('XYZ', 'de 6', 5, 90, 2, '2019-04-20');

insert into examquestion(examid, questionid)
values
(1,1),
(2,2),
(3,3),
(4,4),
(5,5);
insert into examquestion(examid, questionid)
values(6,5);

select * from department;

-- 1.DANH SACH NHAN VIEN VA PHOGN BAN CUA HO
select a.*, d.name_department from `account` a
join department d
on a.department_id= d.department_id;

-- 2.ACCOUNT TAO SAU NGAY 20/12/2010
select * from `account`
where createdate > 2010-12-20;

-- 3.LAY TAT CA CAC DEV
select p.position_name, a.fullname from `account` a
join `position` p
on a.position_id= p.position_id
where position_name='dev';

-- 4.DANH SACH CAC PHONG BAN TREN 3 NHAN VIEN
update `account`
set department_id= 1
where account_id=1;

update `account`
set department_id= 1
where account_id=3;

select a.department_id,
       d.name_department,
       count(a.account_id) AS total_employee
from department d
join `account` a
on d.department_id = a.department_id
group by d.department_id,d.name_department
having count(a.account_id) > 3;

-- 5.DANH SACH CAU HOI SU DUNG TRONG DE THI NHIEU NHAT
select q.questionid,
       q.content,
       COUNT(eq.examid) total
from question q
join examquestion eq
on q.questionid = eq.questionid
group by q.questionid,q.content
order by total desc
limit 1;

-- 6.MOI CATEGORY QUESTION DUOC SU DUNG TRONG BAO NHIEU QUESTION
select c.categoryid,
       c.categoryname,
       count(q.questionid) as total_question
from categoryquestion c
left join question q
on c.categoryid = q.categoryid
group by c.categoryid, c.categoryname;
-- 7. MOI QUESTION SU DUNG TRONG BAO NHIEU EXAM
select q.questionid,
	q.content,
    count(eq.examid) as total
from question q
left join examquestion eq 
on q.questionid= eq.questionid
group by q.questionid,q.content;

-- 8.QUESTION NHIEU CAU TRA LOI NHAT
select q.questionid,
	q.content,
	count(an.answerid) as total
from question q
join answer an
on q.questionid = an.questionid
group by q.questionid,an.questionid
order by total desc
limit 1;

-- 9.SO LUONG ACCOUNT TRONG MOOI GROUP
select g.group_id,
	g.group_name,
    count(ga.account_id) as total
from `group` g
join groupaccount ga
on g.group_id=ga.group_id
group by g.group_id,ga.group_id;

-- 10. CHUC VU IT NGUOI NHAT
select p.position_id,
	p.position_name,
    count(a.position_id) as total
from `position` p 
join `account` a 
on p.position_id= a.position_id
group by p.position_id,a.position_id
order by total asc
limit 1;

-- 11. MOI PHONG BAN CO BAO NHIU DEV,TEST,SCRUM MASTER,PM
select p.position_name,
	d.name_department,
    count(a.account_id) as total
from department d 
join `account` a 
on d.department_id = a.department_id
join `position` p
on a.position_id = p.position_id
group by d.name_department, p.position_name
order by d.name_department;

-- 12. LAY THONG TIN CHI TIET CUA CAU HOII:typequestion, creator(account), answer
select q.questionid,
	q.content,
    tq.typename,
    a.fullname,
    an.content
from question q
join typequestion tq
on tq.typeid= q.typeid
join `account` a
on q.creator_id= a.account_id
join answer an 
on an.questionid=q.questionid;

-- 13.LAY SO LUONG CAU HOI MOI LOAI TU LUAN HAY TTRAC NGHIEM
select tq.typename,
       count(q.questionid) as total_question
from typequestion tq
left join question q
on tq.typeid = q.typeid
group by tq.typename;

-- 14+15.GROUP KHONG CO ACCOUNT NAO
select g.group_id,
       g.group_name
from `group` g
left join groupaccount ga
on g.group_id = ga.group_id
where ga.account_id is null;

-- 16.QUESTION KHONG CO ANSWER NAO
select q.*
from question q
left join answer an
on q.questionid = an.questionid
where an.answerid is null;

-- EX2

-- 17.a. ACCOUNT THUOC NHOM THU NHAT
select a.*
from account a
join groupaccount ga
on a.account_id = ga.account_id
where ga.group_id = 1;

-- 17.b.ACCOUNT THUOC  NHOM THU 2
select a.*
from account a
join groupaccount ga
on a.account_id = ga.account_id
where ga.group_id = 2;

-- 17.c.GHEP KQ A,B SAO CHO KHONG TRUNG
select a.*
from account a
join groupaccount ga
on a.account_id = ga.account_id
where ga.group_id = 1

union

select a.*
from account a
join groupaccount ga
on a.account_id = ga.account_id
where ga.group_id = 2;

-- 18.a. CAC GROUOP CO >5 THANH VIEN
select g.group_id,
       g.group_name,
       count(ga.account_id) as total_member
from `group` g
join groupaccount ga
on g.group_id = ga.group_id
group by g.group_id, g.group_name
having count(ga.account_id) > 5;

-- 18.b. GROUP CO < 7 THANH VIEN
select g.group_id,
       g.group_name,
       count(ga.account_id) as total_member
from `group` g
join groupaccount ga
on g.group_id = ga.group_id
group by g.group_id, g.group_name
having count(ga.account_id) < 7;

-- 18.c. GHEP A,B
select g.group_id,
       g.group_name,
       count(ga.account_id) as total_member
from `group` g
join groupaccount ga
on g.group_id = ga.group_id
group by g.group_id, g.group_name
having count(ga.account_id) > 5

union

select g.group_id,
       g.group_name,
       count(ga.account_id) as total_member
from `group` g
join groupaccount ga
on g.group_id = ga.group_id
group by g.group_id, g.group_name
having count(ga.account_id) < 7;
    

    


