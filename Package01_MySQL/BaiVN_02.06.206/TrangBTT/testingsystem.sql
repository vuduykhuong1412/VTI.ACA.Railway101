INSERT INTO groupaccount(group_id, account_id, joindate)
VALUES (15, 1, '2026-06-03');
INSERT INTO groupaccount(group_id, account_id, joindate)
VALUES (11, 1, '2026-06-03');
-- 1. Tao view chua nhan vien thuoc phong ban sale
drop view sale_account;
create view sale_account as
select * from `account`
where department_id=(
select department_id from department
where name_department='sale'
);

-- 2.tao view chua thong tin account tham gia nhieu group nhat
drop view max_group;
create view max_group as
select a.*
from `account` a
join groupaccount ga
on a.account_id=ga.account_id
group by a.account_id
having count(ga.group_id) = (
    select max(total_group)
    from (
        select count(group_id) as total
        from groupaccount
        group by account_id
    ) t
);




-- 3. tao view chua nhung cau hoi co content qua dai va xoa no di
insert into question(content, categoryid, typeid, creator_id, createdate)
values
('hoi ve java hoi ve java hoi ve java hoi ve java hoi ve java', 1, 1, 7, '2020-04-04');
drop view long_question;
create view long_question as
select * from question
where length(content)>30;
delete from question
where length(content)>30;

-- 4.view chua snah sach phong ban nhieu nhan vieen nhat
drop view max_department;
create view max_department as
select d.department_id,
	   d.name_department,
       count(a.account_id) as total
from department d
join `account` a
on a.department_id= d.department_id
group by d.department_id
order by total desc
limit 1;

-- 5.view chua tat  ca cau hoi do ho Nguyen tao
insert into `account`
(email, username, fullname, department_id, position_id, createdate)
values
('duc@gmail.com', 'duc', 'nguyen kim duc', 5, 1, '2020-03-05');
insert into question(content, categoryid, typeid, creator_id, createdate)
values
('hoi ve sql', 1, 1, 15, '2020-04-04');
drop view Nguyen;
create view Nguyen as
select q.*,
	   a.fullname
from question q
join `account` a
on a.account_id= q.creator_id
where fullname like 'Nguyen%'