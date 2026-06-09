
delimiter $$
create procedure get_account_by_department(in p_departmentID int)
begin
	select * from `account`
    where department_id= p_departmentID;
end$$
delimiter ;
call get_account_by_department(1);

-- 2.tao store in ra so luong account trong moi group
drop procedure if exists account_by_group;
delimiter $$
create procedure account_by_group(in p_group_id int, out total_account int)
begin
	select count(*)
    into total_account
    from groupaccount
    where group_id= p_group_id; 
end $$
delimiter ;
call account_by_group(11, @total_account);
select @total_account;

-- 3. moi type question co bao nhieu question dc tao trong thang hien tai
delimiter $$
create procedure question(in p_createdate datetime, in p_typeid int, out total_question int)
begin
	select count(*)
    into total_question
    from question
    where createdate=p_createdate
    and typeid=p_typeid;
end $$
delimiter ;
call question('2020-04-04',1,@total_question);
select @total_question;

-- 4. id type qustion co nhieu cau hoi nhat
drop procedure if exists max_question_by_type;
delimiter $$
create procedure max_question_by_type(out o_typeid varchar(50), out total_question int)
begin
	select count(*),typeid
    into total_question,
		 o_typeid
    from question
    group by typeid
    order by count(*) desc
    limit 1;
end $$
delimiter ;
call max_question_by_type(@o_typeid,@total_question);
select @o_typeid,@total_question;

-- 5.dung store cau 4 tim ra typename
select typename
from typequestion
where typeid=@o_typeid;

-- 6.cho phép người dùng hập vào 1 chuỗi và trả về group
-- có tên chưa chuỗi của người dùng nhập vào hoặc trả về 
-- user có username chứa chuôix của người dùng nhập vào
drop procedure if exists group_username;
delimiter $$
create procedure group_username(in p_fullname varchar(50))
begin
	select a.username,g.group_name
    from `account` a
    join groupaccount ga
    on a.account_id= ga.account_id
     join `group` g
    on ga.group_id=g.group_id
    where a.fullname = p_fullname;
end $$
delimiter ;
call group_username('bui thi thu trang');

-- 7. nhập fullname, email và store sẽ tự động gán: 
-- useraname, positionID có default là developer,departmentID cho vào phòng chờ 1




