use Testing_System_Assignment_1;

# Question 1: Tạo trigger không cho phép người dùng nhập vào Group có ngày tạo trước 1 năm trước
drop trigger if exists t6_question1;

delimiter @@
create trigger t6_question1
BEFORE insert
    ON `Group`
    FOR EACH ROW

    begin
        if new.CreateDate < date_sub(now(), interval 1 YEAR)
        then
            signal SQLSTATE '45000'
            set MESSAGE_TEXT = 'CreateDate cannot be older than 1 year';
        end if ;
    end @@
delimiter ;

insert into `Group`(GroupName, CreatorID, CreateDate)
values ('SQL Group', 1, now());

insert into `Group`(GroupName, CreatorID, CreateDate)
values ('Old Group', 1, '2023-01-01');

# Question 2: Tạo trigger Không cho phép người dùng thêm bất kỳ user nào vào department "Sale" nữa, khi thêm thì hiện ra
# thông báo "Department "Sale" cannot add more user"
drop trigger if exists t6_question2;

delimiter @@
create trigger t6_question2
before insert
    on Account
    FOR EACH ROW
    begin
        declare v_departmentID int;

        select DepartmentID
        into v_departmentID
        from Department
        where DepartmentName = 'Sale';

        if NEW.DepartmentID = v_departmentID
        then
            signal SQLSTATE '45000'
            set MESSAGE_TEXT = 'Department "Sale" cannot add more user';
        end if ;
    end @@
delimiter ;

insert into Account(Email, Username, FullName, DepartmentID, PositionID, CreateDate)
values ('ainga0101200511@gmail.com', 'ainga0101200511', 'Trương Ái Nga', 1, 1, now());

# Question 3: Cấu hình 1 group có nhiều nhất là 5 user
drop trigger if exists t6_question3;

delimiter @@
create trigger t6_question3
before insert
    on GroupAccount
    for each row
    begin
        declare v_max_user int;

        select count(*) into v_max_user
        from GroupAccount
        where GroupID = NEW.GroupID;

        if v_max_user >= 5
        then
            signal SQLSTATE '45000'
            set MESSAGE_TEXT = 'A group can have maximum 5 users';
        end if ;
    end @@
delimiter ;

# Question 4: Cấu hình 1 bài thi có nhiều nhất là 10 Question
drop trigger if exists t6_question4;

delimiter @@
create trigger t6_question4
    before insert
    on ExamQuestion
    for each row
    begin
        declare v_total_q int;

        select count(QuestionID) into v_total_q
        from ExamQuestion
        where ExamID = NEW.ExamID;

        if v_total_q >= 10
        then
            signal SQLSTATE '45000'
            set MESSAGE_TEXT = '';
        end if ;
    end @@
delimiter ;

# Question 5: Tạo trigger không cho phép người dùng xóa tài khoản có email là
#          admin@gmail.com (đây là tài khoản admin, không cho phép user xóa),
#          còn lại các tài khoản khác thì sẽ cho phép xóa và sẽ xóa tất cả các thông tin liên quan tới user đó
insert into Account(Email, Username, FullName, DepartmentID, PositionID, CreateDate)
values ('admin@gmail.com', 'admin', 'Admin', 7, 2, now());

drop trigger if exists t6_question5;

delimiter @@
create trigger t6_question5
    before delete
    on Account
    for each row
    begin
        if(OLD.Email = 'admin@gmail.com')
            then
            signal SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Cannot delete admin account';
        end if ;
    end @@
delimiter ;

delete from Account
where Email = 'admin@gmail.com';

# Question 6: Không sử dụng cấu hình default cho field DepartmentID của table Account, hãy tạo trigger cho phép người
# dùng khi tạo account không điền vào departmentID thì sẽ được phân vào phòng ban "waiting Department"
drop trigger if exists t6_question6;

delimiter @@
create trigger t6_question6
    before insert
    on Account
    for each row
    begin
        declare v_DepartmentID int;

        select DepartmentID
        into v_DepartmentID
        from Department
        where DepartmentName = 'waiting Department'
        limit 1;

        if NEW.DepartmentID is null
        then
            set NEW.DepartmentID = v_DepartmentID;
        end if ;
    end @@
delimiter ;

insert into Account(Email, Username, FullName, PositionID, CreateDate)
values ('test_waiting@gmail.com', 'test_waiting', 'Test Waiting', 1, NOW());

# Question 7: Cấu hình 1 bài thi chỉ cho phép user tạo tối đa 4 answers cho mỗi question, trong đó có tối đa 2 đáp án đúng.


# Question 8: Viết trigger sửa lại dữ liệu cho đúng: Nếu người dùng nhập vào gender của account là nam, nữ, chưa xác định
# thì sẽ đổi lại thành M, F, U cho giống với cấu hình ở database

# Question 9: Viết trigger không cho phép người dùng xóa bài thi mới tạo được 2 ngày

# Question 10: Viết trigger chỉ cho phép người dùng chỉ được update, delete các question khi question đó chưa nằm trong exam nào

# Question 12: Lấy ra thông tin exam trong đó:
#         Duration <= 30 thì sẽ đổi thành giá trị "Short time"
#         30 < Duration <= 60 thì sẽ đổi thành giá trị "Medium time" Duration > 60 thì sẽ đổi thành giá trị "Long time"

# Question 13: Thống kê số account trong mỗi group và in ra thêm 1 column nữa có tên là the_number_user_amount và mang giá trị được quy định như sau:
#         Nếu số lượng user trong group =< 5 thì sẽ có giá trị là few
#         Nếu số lượng user trong group <= 20 và > 5  thì sẽ có giá trị là normal
#         Nếu số lượng user trong group > 20 thì sẽ có giá trị là higher
#         Question 14: Thống kê số mỗi phòng ban có bao nhiêu user, nếu phòng ban nào không có user thì sẽ thay đổi giá trị 0 thành "Không có User"
