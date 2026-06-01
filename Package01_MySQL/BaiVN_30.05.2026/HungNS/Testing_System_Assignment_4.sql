USE Testing_System_Assignment_2;
-- Question 1: Lấy ra danh sách nhân viên và thông tin phòng ban của họ
select a.accountid, a.email, a.username, a.fullname, d.departmentname
from `account` a
join department d on a.departmentid = d.departmentid;

-- Question 2: Lấy ra thông tin các account được tạo sau ngày 20/12/2010
select a.accountid, a.email, a.username, a.fullname, a.createdate, d.departmentname, p.positionname
from `account` a
join department d on a.departmentid = d.departmentid
join `position` p on a.positionid = p.positionid
where a.createdate > '2010-12-20';

-- Question 3: Lấy ra tất cả các developer
select a.accountid, a.fullname, a.username, p.positionname
from `account` a
join `position` p on a.positionid = p.positionid
where p.positionname = 'dev';
 
 -- Question 4: Lấy ra danh sách các phòng ban có >3 nhân viên
select d.departmentid, d.departmentname, count(a.accountid) as total_accounts
from department d
join `account` a on d.departmentid = a.departmentid
group by d.departmentid, d.departmentname
having count(a.accountid) > 3;

-- Question 5: Lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất
select q.questionid, q.content, count(eq.examid) as total_exams
from question q
join examquestion eq on q.questionid = eq.questionid
group by q.questionid, q.content
having count(eq.examid) = (
    select max(exam_count) 
    from (select count(examid) as exam_count from examquestion group by questionid) as temp
);

-- Question 6: thống kê mỗi category question được sử dụng trong bao nhiêu question
select cq.categoryid, cq.categoryname, count(q.questionid) as total_questions
from categoryquestion cq
left join question q on cq.categoryid = q.categoryid
group by cq.categoryid, cq.categoryname;

-- Question 7: thống kê mỗi question được sử dụng trong bao nhiêu exam
select q.questionid, q.content, count(eq.examid) as total_exams
from question q
left join examquestion eq on q.questionid = eq.questionid
group by q.questionid, q.content;

-- Question 8: lấy ra question có nhiều câu trả lời nhất
select q.questionid, q.content, count(an.answerid) as total_answers
from question q
join answer an on q.questionid = an.questionid
group by q.questionid, q.content
having count(an.answerid) = (
    select max(answer_count) 
    from (select count(answerid) as answer_count from answer group by questionid) as temp
);

-- Question 9: thống kê số lượng account trong mỗi group
select g.groupid, g.groupname, count(ga.accountid) as total_accounts
from `group` g
left join groupaccount ga on g.groupid = ga.groupid
group by g.groupid, g.groupname;

-- Question 10: tìm chức vụ có ít người nhất
select p.positionid, p.positionname, count(a.accountid) as total_accounts
from `position` p
left join `account` a on p.positionid = a.positionid
group by p.positionid, p.positionname
having count(a.accountid) = (
    select min(account_count) 
    from (select count(accountid) as account_count from `account` group by positionid) as temp
);

-- Question 11: thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, pm, ba
select d.departmentname, p.positionname, count(a.accountid) as total_employees
from department d
cross join `position` p
left join `account` a on d.departmentid = a.departmentid and p.positionid = a.positionid
group by d.departmentname, p.positionname
order by d.departmentname;

-- Question 12: lấy thông tin chi tiết của câu hỏi
select q.questionid, q.content as question_content, tq.typename, acc.fullname as creator_name, an.content as answer_content, an.iscorrect
from question q
join typequestion tq on q.typeid = tq.typeid
join `account` acc on q.creatorid = acc.accountid
left join answer an on q.questionid = an.questionid;

-- Question 13: lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
select tq.typename, count(q.questionid) as total_questions
from typequestion tq
left join question q on tq.typeid = q.typeid
group by tq.typeid, tq.typename;

-- Question 14: lấy ra group không có account nào
select g.groupid, g.groupname
from `group` g
left join groupaccount ga on g.groupid = ga.groupid
where ga.accountid is null;

-- Question 15: lấy ra question không có answer nào
select q.questionid, q.content
from question q
left join answer an on q.questionid = an.questionid
where an.answerid is null;

