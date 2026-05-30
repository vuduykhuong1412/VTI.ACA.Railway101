-- SQL – Assignment 3 Option 2
-- Tạo table với các ràng buộc và kiểu dữ liệu
create database employee_management;

use employee_management;

create table department (
department_number int unsigned primary key,
department_name varchar(100) not null unique
);

create table employee_table (
employee_number int unsigned primary key,
employee_name varchar(50) not null,
department_number int unsigned not null,

foreign key (department_number) references department(department_number)
);

create table employee_skill_table (
employee_number int unsigned not null,
skill_code varchar(50) not null,
registered_date date not null,

primary key (employee_number, skill_code),

foreign key (employee_number) references employee_table(employee_number)
);

-- Thêm ít nhất 10 bản ghi vào table
-- Department
insert into department (department_number, department_name)
values
(1, 'Software Development'),
(2, 'IT Support'),
(3, 'Human Resources'),
(4, 'Finance'),
(5, 'Marketing'),
(6, 'Quality Assurance'),
(7, 'Business Analysis'),
(8, 'Security'),
(9, 'Operations'),
(10, 'Training');

-- Employee_Table
insert into employee_table (employee_number, employee_name, department_number)
values
(101, 'John Doe', 1),
(102, 'Alice Smith', 1),
(103, 'Bob Johnson', 1),
(104, 'Emma Brown', 1),
(105, 'David Wilson', 2),
(106, 'Sophia Taylor', 2),
(107, 'Michael Lee', 3),
(108, 'Olivia Martin', 4),
(109, 'Daniel Clark', 5),
(110, 'Liam Walker', 6);

-- Employee_Skill_Table
insert into employee_skill_table (employee_number, skill_code, registered_date)
values
(101, 'JAVA', '2024-01-10'),
(101, 'SQL', '2024-01-15'),
(102, 'JAVA', '2024-02-01'),
(103, 'PYTHON', '2024-02-10'),
(104, 'JAVA', '2024-03-05'),
(105, 'JAVA', '2024-03-15'),
(105, 'EXCEL', '2024-03-20'),
(106, 'NETWORK', '2024-04-01'),
(107, 'SQL', '2024-04-12'),
(108, 'TESTING', '2024-05-01'),
(109, 'JAVA', '2024-05-10'),
(110, 'SECURITY', '2024-06-01');

-- Công ty đang tái cấu trúc và muốn đổi tên phòng ban "Software Development" thành "Software Engineering" trong bảng Department.
-- Viết câu lệnh SQL để cập nhật tên phòng ban.
update department
set department_name = 'Software Engineering'
where department_name = 'Software Development';

-- Một nhân viên có Employee_Number = 105 đã đăng ký nhầm kỹ năng với Skill_Code = 'JAVA'.
-- Viết câu lệnh SQL để xóa bản ghi kỹ năng sai trong bảng Employee_Skill_Table.
delete from employee_skill_table
where skill_code = 'JAVA';


-- Nhân viên có tên "John Doe" được chuyển sang phòng ban "IT Support".
-- Viết câu lệnh SQL để cập nhật Department_Number của nhân viên này dựa vào tên phòng ban mới
update employee_table
set department_number = (
	select department_number 
	from department
	where employee_name = 'IT Support'
)
where employee_name = 'John Doe' ;

-- Viết lệnh để lấy ra danh sách nhân viên (name) có skill Java
-- Hướng dẫn: sử dụng UNION
select employee_name
from employee_table et
join employee_skill_table est
    on et.employee_number = est.employee_number
where est.skill_code = 'JAVA'

union

select employee_name
from employee_table et
join employee_skill_table est
    on et.employee_number = est.employee_number
where est.skill_code = 'JAVA';

## Em hông hiểu tại sao phải dùng UNION trong khi chỉ cần JOIN là được rồi
select et.employee_name
from employee_table et join employee_skill_table est
on et.employee_number = est.employee_number
where est.skill_code = 'JAVA';

-- Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
select department_number, count(*) as TotalEmployee
from employee_table
group by department_number
having count(*) > 3;

## nếu muốn lấy thêm tên
select et.department_number, d.department_name, count(*) as TotalEmployee
from employee_table et join department d 
on et.department_number = d.department_number
group by department_number
having count(*) > 3;

-- Viết lệnh để lấy ra danh sách nhân viên của mỗi văn phòng ban.
-- Hướng dẫn: sử dụng GROUP BY
select d.department_name, group_concat(et.employee_name) as EmployeeList
from employee_table et join department d
on et.department_number = d.department_number
group by d.department_name;

## Không cần GROUP BY
select d.department_name, et.employee_name
from employee_table et join department d
on et.department_number = d.department_number
order by d.department_name;


-- Viết lệnh để lấy ra danh sách nhân viên có > 1 skills.
-- Hướng dẫn: sử dụng DISTINCT
select distinct et.employee_name
from employee_table et join employee_skill_table est
on et.employee_number = est.employee_number
where et.employee_number in (
    select employee_number
    from employee_skill_table
    group by employee_number
    having count(skill_code) > 1
);

## Không dùng DISTINCT
select distinct et.employee_name, count(skill_code) as Skills
from employee_table et join employee_skill_table est
on et.employee_number = est.employee_number
group by et.employee_number, et.employee_name
having count(est.skill_code) > 1;



