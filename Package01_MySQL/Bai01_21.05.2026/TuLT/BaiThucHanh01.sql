-- cau lenh tao CSDL Student_management
create database Student_Management;

-- Cau lenh xoa Database
drop database Student_Management;

-- Chon CSDL 
Use Student_Management;

-- Hien thi danh sach Database
show databases;

-- Tao bang student trong CSDL Student_Management
create table students(
	id_student int NOT NULL auto_increment primary key,
    full_name varchar(255) NOT NULL,
    id_student varchar(255) not null,
    course_th int not null,
    major varchar(255) not null,
    address varchar(255) not null

);

create table course(
	id int NOT NULL auto_increment primary key,
    course_name varchar(255) NOT NULL,
    id_student varchar(255) not null,
    
    foreign key(id_student)
    references students(id_student)
);

create table users(
	user_id int primary key,
    email varchar(100) unique
);

# unique key khac primary key la :
# 1. Co the co nhieu unique trong 1 bang
# 2. Co the chua NULL ( Tuy he Quan tri CSDL )



-- insert gia tri vao bang
insert into students(full_name, id_student, course_th, major, address) 
values('Hoang Dao Thuy', '20210708', 43, 'CNTT', 'Ha Noi');

insert into students(full_name, id_student, course_th, major, address) 
values('Le Trong Tan', '20220709', 41, 'KHMT', 'Ha Tay');

insert into students(full_name, id_student, course_th, major, address) 
values('Vuong Thua Vu', '20230509', 42, 'HTTT', 'Ha Nam');

insert into students(full_name, id_student, course_th, major, address) 
values('Nguyen Luong Bang', '20240510', 42, 'QTKD', 'Ha Dong');

-- truy van thong tin bang students
-- select * from Student_Management.students;
select * from students;

-- tu thuc hanh
-- Tao bang class(id_class int, course_name varchar(255), amount int, id_major varchar, major)


