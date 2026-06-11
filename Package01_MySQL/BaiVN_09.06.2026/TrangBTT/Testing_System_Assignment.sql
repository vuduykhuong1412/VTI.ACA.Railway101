-- 1. tao trigger k cho phep nhap vao group co ngay tao trc 1 nam truoc
 delimiter //
 create trigger before_insert
 before insert on `group`
 for each row 
 begin
	if  new.createdate < date_sub(now(), interval 1 year)then 
    
    signal sqlstate '45000'
    set message_text='tham that bai';
    end if;
 end //
 delimiter ;
 insert into `group`(group_name,creator_id,createdate)
 value('abc', 2, '2022-12-12');
 
 -- 2.k cho phep them nguoi vao 'sale'
 drop trigger if exists before_insert_into_sale;
 delimiter //
create trigger before_insert_into_sale
before insert on `account`
for each row
begin
	
	if new.department_id=(
    select department_id
    from department
    where name_department='sale') then
    signal sqlstate '45000'
    set message_text= 'khong them vao phong sale';
    end if;
end //
delimiter ;
insert into `account`(email,username,fullname,department_id,position_id,createdate)
value('kduc@gmail.com', 'ngkdwcs', 'nguyn kim duck', 2, 1,' 2026-02-02')
 
 -- 3.cau hinh  1group co max 5 ng
 delimiter //
 create trigger max_5
 before insert on groupaccount
 for each row
 begin
	declare _count int;
    select count(account_id)  into _count
    from groupaccount
    where group_id = new.group_id;
    
    if _count>= 5 then
    signal sqlstate '45000'
    set message_text =' vuot qua 5 nguoi roi';
    end if;
 end //
 delimiter ;
 insert into `account`(email,username,fullname,department_id,position_id,createdate)
 value('kduc@gmail.com', 'ngkdwcs', 'nguyn kim duck', 1, 1,' 2026-02-02')
 
 -- 4. cau hinh 1 bai thi co nhieu nhat 10question
 delimiter //
 create trigger max_10
 before insert on examquestion
 for each row
 begin
	declare _count int;
    select count(questionid)  into _count
    from examquestion
	where examid= new.examid;
    
    if _count>= 10 then
    signal sqlstate '45000'
    set message_text =' vuot qua 10 cau hoi';
    end if;
 end //
 delimiter ;