-- cau lenh tao CSDL
create database Student_Management;

-- cau lenh xoa Database
drop database Student_Management;

-- chon CSDL
use Student_Management;

-- hien thi danh sach database
show databases;

-- tao bang student trong Student_Management
-- Tao bang student trong CSDL Student_Management
create table students(
	id_student int NOT NULL auto_increment primary key,
    full_name varchar(255) NOT NULL,
    course_th int not null,
    major varchar(255) not null,
    address varchar(255) not null

);
create table classes(
	id_class int NOT NULL auto_increment primary key,
    id_student int not null,
    foreign key(id_student) references students(id_student),
    class_name varchar(50)
);

-- insert gia tri vao bang
insert into students(full_name, course_th, major, address) 
values('Hoang Dao Thuy', 43, 'CNTT', 'Ha Noi');

insert into students(full_name, course_th, major, address) 
values('Le Trong Tan', 41, 'KHMT', 'Ha Tay');

insert into students(full_name, course_th, major, address) 
values('Vuong Thua Vu', 42, 'HTTT', 'Ha Nam');

insert into students(full_name, course_th, major, address) 
values('Nguyen Luong Bang', 42, 'QTKD', 'Ha Dong');

insert into students(full_name, course_th, major, address) 
values('Dao Tan', 42, 'QTKD', 'Ha Dong');

insert into classes(id_student, class_name) 
value(1, 'Python'),
(2, 'Java'),
(3,'SQL');

insert into classes(id_student, class_name)  value (3,'NodeJS'),(4,'JavaScript');
-- insert gia tri vao bang
insert into students(full_name, id_student, course_th, major, address)
values('Nguyen Sinh Hung','PD09959','43','CNTT','Da Nang');

insert into students(full_name, id_student, course_th, major, address)
values('Luong Nguyen Thuong','PD09999','43','Dien Oto','Da Nang');

insert into students(full_name, id_student, course_th, major, address)
values('Tran Van Du','PD09988','44','Ky thuat dien','Da Nang');

insert into students(full_name, id_student, course_th, major, address)
values('Hien Trang','PD052007','45','Y Si Da Khoa','Tam Ky');

-- truy van thong tin bang students
select * from student_management.students;
select * from students;

-- tao bang class(id_class int, course_name varchar, amount int, id_major varchar, major
create table class(
id_class int not null auto_increment,
course_name varchar(255) not null,
amount int not null,
id_major varchar (255) not null,
major varchar(255) not null,
primary key(id_class)
);

insert into class (course_name, amount, id_major, major) 
VALUES ('Lập trình Java Cơ Bản', 45, 'IT-01', 'Công nghệ thông tin');

select * from class;

-- limtit
select * from students
order by course_th desc
limit 3;
-- limit voi offset: bo qua bao nhieu dong
select * from students
order by course_th desc

limit 3, 3;

-- limit ket hojp voi distinct
select distinct major
from students
limit 3;

-- alias: chi ton tai trong luc chay query, k doi ten that trong db
select full_name as 'Họ và tên'
from students;

select count(id) as 'Tổng số sinh viên' from students;

select * from students as std
where std.course_th = 43;

select * from Students;

UPDATE Students
SET major = 'QTKD'
WHERE ID = 2;

INSERT INTO students(full_name, id_student, course_th, major, address)
VALUES('Nguyen Tuan Tan', 'PD01111', 48, 'CNTT', 'Da Nang');
INSERT INTO students(full_name, id_student, course_th, major, address)
VALUES('Le Tuan Tan', 'PD02222', 47, 'QTKD', 'Quang Nam');
INSERT INTO students(full_name, id_student, course_th, major, address)
VALUES('ALang Tan', 'PD03333', 46, 'Dien Oto', 'Hue');

	

SET SQL_SAFE_UPDATES = 0;
SET SQL_SAFE_UPDATES = 1;

UPDATE students
SET full_name = REPLACE(full_name, 'Tan', 'Hoang')
WHERE full_name LIKE '%Tan';

UPDATE students
SET full_name = concat(LEFT(full_name, length(full_name))-3,'Hoang')
WHERE full_name LIKE '%Tan';

DELETE From Students
where major = 'QTKD';

delete from students
where major = 'QTKD' 
  and full_name like '%Hoang';

SELECT * FROM students;

-- Muon lay ten sinh vien hoc lop nao
select S.full_name, C.class_name
from students S
Join classes C
ON S.id_student = C.id_student;

-- join dùng để kết hợp dữ liệu từ nhiều bảng dựa trên cột liên kết chung
-- inner join = join
select * from students S inner join classes C
on s.id_student = c.id_student;
-- left join
select * from students S left join classes C
on s.id_student = c.id_student;
-- right join 
select * from students S right join classes C
on s.id_student = c.id_student;
-- cross join : mỗi 1 dòng bản a ghép với mọi dòng của bảng b
select * from students cross join classes;
-- full outer join : lay tat ca du lieu cua ca hai bang
-- full outer join MySQL khong ho tro --> UNION
-- left excluding join: chi nhung dong co o bang A nhung khong co o bang B 
select s.* from students s left join classes c on s.id_student = c,id_student where c.id_student is null;
-- right excluding join: chi nhung dong co o bang B nhung khong co o bang A  
select s.* from students s right join classes c on s.id_student = c,id_student where c.id_student is null;
-- union :gộp kết quả của hai hoặc nhiều câu lệnh SELECT lại với nhau thành một danh sách duy nhất theo chiều dọc.
select s.id_student from students s 
union
select c.id_student from classes c;
-- union all : lay toan bo du lieu, ke ca du lieu trung
select s.id_student from students s 
union all 
select c.id_student from classes c;
-- intersect : lay phan giao nhau giua 2 bang (khong ho tro)
-- except: lay du lieu co trong bang thu nhat nhung khong co trong bang thu hai (khong ho tro)
select s.id_student from students s 

select c.id_student from classes c;