use Testing_System_Assignment_1;

# Question 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các account thuộc phòng ban đó
drop procedure if exists get_user_by_department_name;

delimiter @@
create procedure  getUserByDepartmentName(in p_department_name varchar(100))
begin
    select a.*
    from Account a join Department d
                        on a.DepartmentID = d.DepartmentID
    where d.DepartmentName = p_department_name;
end @@
delimiter ;

call getUserByDepartmentName('Marketing');

# Question 2: Tạo store để in ra số lượng account trong mỗi group
drop procedure if exists countAccountInGroup;

delimiter @@
create procedure countAccountInGroup()
begin
    select GroupID, count(*) as TotalAccount
    from GroupAccount
    group by GroupID;
end @@
delimiter ;

call countAccountInGroup();

# Question 3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo trong tháng hiện tại
INSERT INTO `Account`
(Email, Username, FullName, DepartmentID, PositionID, CreateDate)
VALUES
    ('dev01@gmail.com', 'dev01', 'Nguyen Van Dev01', 1, 1, NOW()),
    ('dev02@gmail.com', 'dev02', 'Tran Van Dev02', 1, 1, NOW()),
    ('tester01@gmail.com', 'tester01', 'Le Thi Tester01', 2, 2, NOW()),
    ('pm01@gmail.com', 'pm01', 'Pham Van PM01', 3, 4, NOW()),
    ('waiting01@gmail.com', 'waiting01', 'Do Van Waiting01',
     (SELECT DepartmentID FROM Department WHERE DepartmentName = 'Waiting Department' LIMIT 1),
     1,
     NOW()
    );

drop procedure if exists countQuestionByTypeInCurrentMonth;

delimiter @@
create procedure countQuestionByTypeInCurrentMonth()
begin
    select q.TypeID, tq.TypeName, count(*)
    from Question q join TypeQuestion tq
                         on q.TypeID = tq.TypeID
    where month(q.CreateDate) = month(now())
      and year(q.CreateDate) = year(now())
    group by q.TypeID, tq.TypeName;
end @@
delimiter ;

call countQuestionByTypeInCurrentMonth();


# Question 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất
drop procedure if exists getTypeIDMaxQuestion;

delimiter @@
create procedure getTypeIDMaxQuestion(out p_id int)
begin
    select q.TypeID into p_id
    from Question q join TypeQuestion tq
                         on q.TypeID = tq.TypeID
    group by q.TypeID
    order by  count(*) desc
    limit 1;
end @@
delimiter ;

call getTypeIDMaxQuestion(@p_id);

# Question 5: Sử dụng store ở question 4 để tìm ra tên của type question
call getTypeIDMaxQuestion(@p_id);
select *
from TypeQuestion
where TypeID = @p_id;

# Question 6: Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên chứa chuỗi của người dùng nhập vào hoặc trả về user có username chứa chuỗi của người dùng nhập vào
drop procedure if exists getGroupOrUser;

delimiter @@
create procedure getGroupOrUser(in p_input varchar(100))
begin
        select 'GROUP' AS ResultType, GroupID as ID, GroupName as Name
        from `Group`
        where GroupName like concat('%', p_input, '%')

        union

        select 'ACCOUNT' AS ResultType, AccountID as ID, Username as Name
        from Account
        where Username like concat('%', p_input, '%');
end @@
delimiter ;

call getGroupOrUser('a');

# Question 7: Viết 1 store cho phép người dùng nhập vào thông tin fullName, email và trong store sẽ tự động gán:
#  	username sẽ giống email nhưng bỏ phần @..mail đi
#   positionID: sẽ có default là developer
# 	departmentID: sẽ được cho vào 1 phòng chờ Sau đó in ra kết quả tạo thành công
drop procedure if exists question7;

delimiter @@
create procedure question7 (in p_full_name varchar(100), in p_email varchar(100))
begin
    declare v_username varchar(100);
    declare v_positionID varchar(50) default 'developer';
    declare v_departmentID int;

    set v_username = substring_index(p_email, '@', 1);

    select PositionID
    into v_positionID
    from Position
    where PositionName like 'Dev'
    limit 1;

    select DepartmentID
    into v_departmentID
    from Department
    where DepartmentName like 'Waiting Department'
    limit 1;

    select p_full_name as FullName,
         p_email as Email,
         v_username as UserName,
         v_positionID as PositionID,
         v_departmentID as DepartmentID;
end @@
delimiter ;

call question7('Trương Ái Nga', 'ainga01012004@gmail.com');

# Question 8: Viết 1 store cho phép người dùng nhập vào Essay hoặc Multiple-Choice để thống kê câu hỏi essay hoặc multiple-choice nào có content dài nhất
drop procedure if exists question8;

delimiter @@
create procedure question8(in p_type_name varchar(100))
begin
    select *
    from Question q join  TypeQuestion tq
        on q.TypeID = tq.TypeID
        where tq.TypeName = p_type_name
    order by char_length(q.Content) desc
    limit 1;
end @@
delimiter ;

call question8('Essay');

# Question 9: Viết 1 store cho phép người dùng xóa exam dựa vào ID
drop procedure if exists question9;

delimiter @@
create procedure question9(in p_id int)
begin
    delete from ExamQuestion
    where ExamID = p_id;

    delete from Exam
    where ExamID = p_id;
end @@
delimiter ;

call question9(5);

# Question 10: Tìm ra các exam được tạo từ 3 năm trước và xóa các exam đó đi (sử dụng store ở câu 9 để xóa)
# Sau đó in số lượng record đã remove từ các table liên quan trong khi removing


# Question 11: Viết store cho phép người dùng xóa phòng ban bằng cách người dùng nhập vào tên phòng ban và
# các account thuộc phòng ban đó sẽ được chuyển về phòng ban default là phòng ban chờ việc
insert into Department(DepartmentName)
values ('Waiting Department');

drop procedure if exists deleteDepartment;

delimiter @@
create procedure deleteDepartment(in p_department_name varchar(100))
begin
    declare v_departmentID int;
    declare v_waitingDepartmentID int;

    select DepartmentID
    into v_departmentID
    from Department
    where DepartmentName = p_department_name;

    select DepartmentID
    into v_waitingDepartmentID
    from Department
    where DepartmentName = 'Waiting Department';

    update Account
    set DepartmentID = v_waitingDepartmentID
    where DepartmentID = v_departmentID;

    delete from Department
        where DepartmentID = v_departmentID;
end @@
delimiter ;

call deleteDepartment('HR');

# Question 12: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong năm nay
drop procedure if exists question12;

delimiter @@
create procedure question12()
begin
    select month(CreateDate) As MonthNumber,
           count(CreateDate) TotalQuestion
    from Question
    where year(CreateDate) = year(now())
    group by month(CreateDate);
end @@
delimiter ;

call question12();

# Question 13: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong 6 tháng gần đây nhất
drop procedure if exists question13;

delimiter @@
create procedure question13()
begin
    select year(CreateDate) as YearNumber,
           month(CreateDate) as MonthNumber,
           count(CreateDate) TotalQuestion
    from Question
    where CreateDate >= date_sub(now(), INTERVAL 6 MONTH)
    group by year(CreateDate), month(CreateDate);
end @@
delimiter ;

call question13();
