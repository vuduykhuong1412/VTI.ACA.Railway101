create database employee_management;
create table Department(
    Department_Number int primary key,
    Department_Name varchar(100) not null
);
create table Employee(
    Employee_Number int primary key,
    Employee_Name varchar(100) not null,
    Department_Number int,
    foreign key (Department_Number)
        references Department(Department_Number)
);
create table Employee_Skill(
    Employee_Number int primary key,
    Skill_Code varchar(50) ,
    DateRegistered date,
    foreign key (Employee_Number)
        references Employee(Employee_Number)
);

insert into Department(Department_Number,Department_Name)
values
(1,'IT'),
(2,'HR'),
(3,'Finance'),
(4,'Marketing');

insert into Employee(Employee_Number,Employee_Name,Department_Number)
values
(101,'Trang',1),
(102,'Duc',1),
(103,'Nam',2),
(104,'Hung',3),
(105,'Tu',1),
(106,'Hoang',2),
(107,'Tuan',4),
(108,'Linh',3),
(109,'Hiep',4),
(110,'Cuong',1);

insert into employee_skill(Employee_Number,Skill_Code,DateRegistered)
values
(101,'Java','2024-01-10'),
(101,'SQL','2024-02-15'),
(102,'Java','2024-03-01'),
(103,'Python','2024-01-20'),
(104,'Excel','2024-02-05'),
(105,'Java','2024-02-10'),
(105,'Python','2024-03-12'),
(106,'SQL','2024-01-18'),
(107,'Java','2024-04-01'),
(108,'Excel','2024-02-25');

-- ai co java skill(union)
select e.Employee_Number,
       e.Employee_Name
from Employee e
join Employee_Skill es
on e.Employee_Number = es.Employee_Number
where es.Skill_Code = 'Java';

-- cac phong ban co > 3 nv
select d.Department_Number,
	d.Department_Name,
    count(e.Department_Number) as total
from department d
join employee e
on e.Department_Number= d.Department_Number
group by d.Department_Number, d.Department_Name
having count(*)> 3;

-- so nhan vien cua tung bo phan(group by)
select d.Department_Name,
       count(e.Employee_Number) as Total
from Department d
left join Employee e
on d.Department_Number = e.Department_Number
group by d.Department_Name;

-- nhan vien co > 1 skill(distinct)
select e.Employee_Number,
       e.Employee_Name
from Employee e
join Employee_Skill s
on e.Employee_Number = s.Employee_Number
group by e.Employee_Number, e.Employee_Name
having count(distinct s.Skill_Code) > 1;

