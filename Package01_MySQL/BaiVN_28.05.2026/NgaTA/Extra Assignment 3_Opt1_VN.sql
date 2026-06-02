-- Exercise 1: Tiếp tục với Database quản lý Fresher
use Fresher_Management;

-- Thêm ít nhất 10 bản ghi vào table
insert into Trainee 
(Full_Name, Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes, VTI_Account)
values
('Nguyen Quang Huy','2000-03-12','male',16,15,38,'Fresher_03','Quick learner','huy.nguyen'),
('Le Thi Mai','2001-07-25','female',19,18,46,'Fresher_01','Excellent teamwork','mai.le'),
('Tran Minh Duc','1999-12-08','male',14,15,37,'Fresher_02','Need more practice in coding','duc.tran'),
('Vo Ngoc Anh','2002-04-17','female',18,17,44,'Fresher_03','Strong analytical skills','anh.vo'),
('Pham Tuan Kiet','2000-09-21','male',13,12,34,'Fresher_01','Average performance','kiet.pham'),
('Dang Thu Trang','2001-01-30','female',20,20,49,'Fresher_02','Outstanding trainee','trang.dang'),
('Bui Hoang Long','1999-06-05','male',17,16,41,'Fresher_03','Responsible and active','long.bui'),
('Ngo Thi Lan','2002-10-14','female',15,14,39,'Fresher_01','Good communication','lan.ngo'),
('Huynh Gia Han','2001-08-09','female',18,19,47,'Fresher_02','High potential','han.huynh'),
('Tran Quoc Dat','2000-02-28','male',16,17,40,'Fresher_03','Works well under pressure','dat.tran');

-- Viết lệnh để lấy ra tất cả các thực tập sinh đã vượt qua bài test đầu vào, nhóm chúng thành các tháng sinh khác nhau
select month(Birth_Date) as BirthMonth,
       count(*) as TotalTrainee
from Trainee
where (ET_IQ + ET_Gmath) >= 20
  and ET_IQ >= 8
  and ET_Gmath >= 8
  and ET_English >= 18
group by month(Birth_Date);

-- Viết lệnh để lấy ra thực tập sinh có tên dài nhất, lấy ra các thông tin sau: tên, tuổi, các thông tin cơ bản (như đã được định nghĩa trong table)
#lấy được nhiều thực tập tên cùng max 
select Full_Name, (timestampdiff(year, Birth_Date, curdate())) as Age,
Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes, VTI_Account
from Trainee
where length(Full_Name) = all(
select max(length(Full_Name))
from Trainee
);

#lấy duy nhất 1 người
select Full_Name, (year(current_date()) - year(Birth_Date) + 1) as Age,
Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes, VTI_Account
from Trainee
order by char_length(Full_Name) desc
limit 1;


-- Viết lệnh để lấy ra tất cả các thực tập sinh là ET, 1 ET thực tập sinh là những người đã vượt qua bài test đầu vào và thỏa mãn số điểm như sau:
-- ET_IQ + ET_Gmath>=20 
-- ET_IQ>=8
-- ET_Gmath>=8 
-- ET_English>=18

select *
from Trainee
where ET_IQ + ET_Gmath >= 20
and ET_IQ>=8
and ET_Gmath>=8
and ET_English>=18