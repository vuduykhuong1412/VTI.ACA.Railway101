-- 26.05

DROP DATABASE testingsystem;
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
('testing system', 7, '2019-03-05'),
('development', 8, '2020-03-07'),
('sale', 9, '2020-03-07'),
('marketing', 10, '2020-03-09'),
('management', 11, '2020-03-10');
insert into `group`
(group_name, creator_id, createdate)
values
('creator', 12, '2020-04-01'),
('chatwithlove', 11, '2020-04-02'),
('tester', 10, '2020-04-03'),
('backend', 9, '2020-04-04'),
('frontend', 8, '2020-04-05');

insert into groupaccount(group_id, account_id, joindate)
values
(11, 7, '2020-03-05'),
(12, 8, '2020-03-07'),
(13, 9, '2020-03-09'),
(14, 10, '2020-03-10'),
(15, 11, '2020-03-07');

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
('hoi ve postman', 5, 2, 11, '2020-04-12');

insert into answer(content, questionid, iscorrect)
values
('abcd', 1, 0),
('databaseee', 2, 0),
('sqll', 3, 1),
('netbeen', 4, 0),
('xampp', 5, 1);

insert into exam(`code`, title, categoryid, duration, creator_id, createdate)
values
('abcd', 'de 1', 1, 60, 7, '2019-04-10'),
('nnsdab', 'de 2', 2, 60, 8, '2019-04-11'),
('hhihihi', 'de 3', 3, 60, 9, '2019-04-15'),
('hahahha', 'de 4', 4, 60, 10, '2019-04-17'),
('kkk', 'de 5', 5, 60, 11, '2019-04-20');

insert into examquestion(examid, questionid)
values
(1,1),
(2,2),
(3,3),
(4,4),
(5,5);

select * from department;
-- id phong sale
select department_id
from department
where name_department = 'sale';

-- account full name dai nhat
select *from `account`
where length(fullname) = (
    select max(length(fullname))
    from `account`
);

-- account fullname dai nhat thuoc phong ban id=3
select *from `account`
where department_id = 3
and length(fullname) = (
    select max(length(fullname))
    from `account`
    where department_id = 3
);

-- ten group tham gia truoc 20/12/2019
select *from `group`
where createdate < '2019-12-20';

-- id question cos>=4 cau tra loi
select questionid from answer
group by questionid
having count(answerid) >= 4;

-- cac ma de thi cos thoi gian >=60p va tao trc 20/12/2019
select *from exam
where duration >= 60
and createdate < '2019-12-20';

-- 5 group tao gan nhat
select *from `group`
order by createdate desc
limit 5;

-- so nhan vien thuoc department id=2
select count(account_id) from `account`
where department_id = 2;

-- nhan vien co ten bat dau bang D va ket thuc bang o
select * from `account`
where fullname like 'D%O';

-- xoa all exam trc ngay 20/12/19
delete from exam
where createdate < '2019-12-20';
delete from examquestion
where examid in (
    select examid
    from exam
    where createdate < '2019-12-20'
);

-- xoa tat ca question bat dau tu 'cau hoi'
delete from answer
where questionid in (
    select questionid
    from question
    where content like 'cau hoi%'
);
delete from examquestion
where questionid in (
    select questionid
    from question
    where content like 'cau hoi%'
);
delete from question
where content like 'cau hoi%';

-- update thong tin account id=5 thanh 'nguyen ba loc' va email 'locnguyen@vti.com.vn
update `account` set fullname = 'nguyen ba loc',
email = 'loc@gmail.com'
where account_id = 5;

-- update account id=5 thuoc group cos id=4
update groupaccount set group_id = 4
where account_id = 5;