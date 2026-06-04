-- SQL – Assignment 4

use Testing_System_Assignment_1;

-- Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
create view view_sale_employee as
select * 
from Account a
where DepartmentID = (
	select DepartmentID 
    from Department
    where DepartmentName = 'Sale'
);

-- Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
-- Đếm số group của từng account
select AccountID, count(*) as totalGroup
from GroupAccount
group by AccountID;

-- Tìm số group lớn nhất
select max(totalGroup) as max
from (
	select AccountID, count(*) as totalGroup
	from GroupAccount
	group by AccountID
) t;

-- Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
--  C1
create view view_account_join_max_group as
select a.*
from Account a
where AccountID in (
	select AccountID
    from GroupAccount
    group by AccountID
    having count(*) = (
		select max(totalGroup)
		from (
			select count(*) as totalGroup
			from GroupAccount
			group by AccountID
        ) t
	)	
);

-- C2
with account_group_count as (
	select AccountID, count(*) as totalGroup 
    from GroupAccount
    group by AccountID
), 

max_group_count as (
	select max(totalGroup) as maxGroup
    from account_group_count
)

select a.*
from Account a
join account_group_count agc
on a.AccountID = agc.AccountID
join max_group_count mgc
on agc.TotalGroup = mgc.MaxGroup;

-- Tạo view có chứa câu hỏi có những content quá dài (content quá 300 ký tự  được coi là quá dài) và xóa nó đi
alter table Question
modify Content text;

INSERT INTO Question
(Content, CategoryID, TypeID, CreatorID)
VALUES
(
'Java là ngôn ngữ lập trình hướng đối tượng được phát triển bởi Sun Microsystems và hiện nay thuộc Oracle. Java được sử dụng rộng rãi trong phát triển phần mềm doanh nghiệp, ứng dụng web, ứng dụng di động Android và các hệ thống phân tán. Java hỗ trợ tính đa nền tảng thông qua JVM và có hệ sinh thái thư viện vô cùng phong phú giúp lập trình viên xây dựng các hệ thống lớn một cách hiệu quả.',
1, 1, 1
),

(
'SQL là ngôn ngữ truy vấn có cấu trúc được sử dụng để thao tác với cơ sở dữ liệu quan hệ. Thông qua SQL, người dùng có thể tạo bảng, chỉnh sửa dữ liệu, truy vấn dữ liệu và quản lý quyền truy cập. Các hệ quản trị cơ sở dữ liệu phổ biến như MySQL, SQL Server, PostgreSQL và Oracle đều sử dụng SQL làm ngôn ngữ chính để tương tác với dữ liệu trong hệ thống.',
2, 2, 1
),

(
'Spring Boot là framework phổ biến trong hệ sinh thái Java giúp đơn giản hóa quá trình phát triển ứng dụng web và microservice. Framework này cung cấp khả năng cấu hình tự động, tích hợp sẵn máy chủ ứng dụng và hỗ trợ rất nhiều thư viện phổ biến. Nhờ đó lập trình viên có thể tập trung vào xử lý nghiệp vụ thay vì mất nhiều thời gian cho việc cấu hình hệ thống.',
1, 2, 1
);

create view view_long_question as 
select *
from Question
where length(Content) > 300;

delete from Question
where QuestionID in (
	select QuestionID
    from (
		select QuestionID 
        from view_long_question
    ) t
);

-- Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
create view view_department_max_employee as
select d.*
from Department d
where d.DepartmentID in (
	select DepartmentID
    from Account
    group by DepartmentID
    having count(*) = (
		select max(totalEmployee)
        from(
			select count(*) as totalEmployee
            from Account
            group by DepartmentID
        ) t
    )
);

-- Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo
create view view_question_created_by_nguyen as
select * 
from Question
where CreatorID in (
	select AccountID 
	from  Account a
	where FullName like 'Nguyen%'
);