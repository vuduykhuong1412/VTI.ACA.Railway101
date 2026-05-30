DROP DATABASE IF EXISTS ThucTap;
CREATE DATABASE ThucTap

USE ThucTap;

CREATE TABLE Khoa (
    makhoa      CHAR(10)    NOT NULL,
    tenkhoa     CHAR(30)    NOT NULL,
    dienthoai   CHAR(10),
    PRIMARY KEY (makhoa)
);

CREATE TABLE GiangVien (
    magv        INT         NOT NULL AUTO_INCREMENT,
    hotengv     CHAR(30)    NOT NULL,
    luong       DECIMAL(5,2),
    makhoa      CHAR(10),
    PRIMARY KEY (magv),
    FOREIGN KEY (makhoa) REFERENCES Khoa(makhoa)
        ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE SinhVien (
    masv        INT         NOT NULL AUTO_INCREMENT,
    hotensv     CHAR(30)    NOT NULL,
    makhoa      CHAR(10),
    namsinh     INT,
    quequan     CHAR(30),
    PRIMARY KEY (masv),
    FOREIGN KEY (makhoa) REFERENCES Khoa(makhoa)
        ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE DeTai (
    madt        CHAR(10)    NOT NULL,
    tendt       CHAR(30)    NOT NULL,
    kinhphi     INT,
    NoiThucTap  CHAR(30),
    PRIMARY KEY (madt)
);

CREATE TABLE HuongDan (
    masv        INT         NOT NULL,
    madt        CHAR(10)    NOT NULL,
    magv        INT         NOT NULL,
    ketqua      DECIMAL(5,2),
    PRIMARY KEY (masv, madt),
    FOREIGN KEY (masv) REFERENCES SinhVien(masv)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (madt) REFERENCES DeTai(madt)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (magv) REFERENCES GiangVien(magv)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- Khoa
INSERT INTO Khoa VALUES
('TOAN',    'Toan',                 '0511111111'),
('TIN',     'Tin hoc',              '0511111112'),
('DIALY',   'Dia ly',               '0511111113'),
('QLTN',    'Quan ly tai nguyen',   '0511111114'),
('CNSH',    'Cong nghe sinh hoc',   '0511111115');

-- GiangVien
INSERT INTO GiangVien (hotengv, luong, makhoa) VALUES
('Nguyen Van A',    8.50,  'TOAN'),
('Tran Son',        9.00,  'TIN'),
('Le Thi B',        7.50,  'DIALY'),
('Pham Van C',      8.00,  'QLTN'),
('Hoang Thi D',     6.50,  'CNSH'),
('Nguyen Thi E',    7.00,  'TOAN'),
('Tran Van F',      9.50,  'TIN');

-- SinhVien
INSERT INTO SinhVien (hotensv, makhoa, namsinh, quequan) VALUES
('Le van son',      'TOAN',  2001, 'Ha Noi'),
('Nguyen Thi G',    'TOAN',  2002, 'Da Nang'),
('Tran Van H',      'CNSH',  2001, 'Ha Noi'),
('Pham Thi I',      'CNSH',  2002, 'Ho Chi Minh'),
('Le Van J',        'DIALY', 2001, 'Ha Noi'),
('Hoang Van K',     'QLTN',  2002, 'Hue'),
('Nguyen Van L',    'QLTN',  2001, 'Ha Noi'),
('Tran Thi M',      'TIN',   2002, 'Da Nang'),
('Pham Van N',      'TOAN',  2001, 'Can Tho');

-- DeTai
INSERT INTO DeTai VALUES
('DT001', 'De tai Java',       15000000, 'Ha Noi'),
('DT002', 'De tai Python',     20000000, 'Ho Chi Minh'),
('DT003', 'De tai GIS',        12000000, 'Ha Noi'),
('DT004', 'De tai Sinh hoc',   18000000, 'Da Nang'),
('DT005', 'De tai AI',         25000000, 'Ha Noi'),
('DT006', 'De tai Moi truong', 10000000, 'Hue');

-- HuongDan
INSERT INTO HuongDan VALUES
(1, 'DT001', 2, 8.5),
(2, 'DT001', 1, 7.0),
(3, 'DT004', 5, 9.0),
(4, 'DT004', 5, 6.5),
(5, 'DT003', 3, 7.5),
(6, 'DT006', 4, 8.0),
(7, 'DT006', 4, 0),   
(8, 'DT005', 2, 9.5),
(9, 'DT002', 1, NULL);  

-- Câu 2: Mã số, họ tên và tên khoa của tất cả giảng viên
SELECT gv.magv, gv.hotengv, k.tenkhoa
FROM GiangVien gv
LEFT JOIN Khoa k ON gv.makhoa = k.makhoa;

-- Câu 3: Mã số, họ tên và tên khoa của giảng viên khoa 'DIA LY' và 'QLTN'
SELECT gv.magv, gv.hotengv, k.tenkhoa
FROM GiangVien gv
JOIN Khoa k ON gv.makhoa = k.makhoa
WHERE k.makhoa IN ('DIALY', 'QLTN');

-- Câu 4: Số sinh viên của khoa 'CONG NGHE SINH HOC'
SELECT COUNT(*) AS SoSinhVien
FROM SinhVien sv
JOIN Khoa k ON sv.makhoa = k.makhoa
WHERE k.makhoa = 'CNSH';

-- Câu 5: Danh sách mã số, họ tên và tuổi của sinh viên khoa 'TOAN'
SELECT sv.masv, sv.hotensv, (YEAR(CURDATE()) - sv.namsinh) AS tuoi
FROM SinhVien sv
JOIN Khoa k ON sv.makhoa = k.makhoa
WHERE k.makhoa = 'TOAN';

-- Câu 6: Số giảng viên của khoa 'CONG NGHE SINH HOC'
SELECT COUNT(*) AS SoGiangVien
FROM GiangVien gv
JOIN Khoa k ON gv.makhoa = k.makhoa
WHERE k.makhoa = 'CNSH';

-- Câu 7: Thông tin sinh viên KHÔNG tham gia thực tập
SELECT sv.*
FROM SinhVien sv
WHERE sv.masv NOT IN (
    SELECT DISTINCT masv FROM HuongDan
);

-- Câu 8: Mã khoa, tên khoa và số giảng viên của mỗi khoa
SELECT k.makhoa, k.tenkhoa, COUNT(gv.magv) AS SoGiangVien
FROM Khoa k
LEFT JOIN GiangVien gv ON k.makhoa = gv.makhoa
GROUP BY k.makhoa, k.tenkhoa;

-- Câu 9: Số điện thoại của khoa mà sinh viên tên 'Le van son' đang theo học
SELECT k.dienthoai
FROM SinhVien sv
JOIN Khoa k ON sv.makhoa = k.makhoa
WHERE sv.hotensv = 'Le van son';

-- Câu 10: Mã số và tên các đề tài do giảng viên 'Tran son' hướng dẫn
SELECT DISTINCT dt.madt, dt.tendt
FROM DeTai dt
JOIN HuongDan hd ON dt.madt = hd.madt
JOIN GiangVien gv ON hd.magv = gv.magv
WHERE gv.hotengv = 'Tran Son';

-- Câu 11: Đề tài không có sinh viên nào thực tập
SELECT dt.*
FROM DeTai dt
WHERE dt.madt NOT IN (
    SELECT DISTINCT madt FROM HuongDan
);

-- Câu 12: Mã số, họ tên, tên khoa của giảng viên hướng dẫn từ 3 sinh viên trở lên
SELECT gv.magv, gv.hotengv, k.tenkhoa
FROM GiangVien gv
JOIN Khoa k ON gv.makhoa = k.makhoa
JOIN HuongDan hd ON gv.magv = hd.magv
GROUP BY gv.magv, gv.hotengv, k.tenkhoa
HAVING COUNT(DISTINCT hd.masv) >= 3;

-- Câu 13: Mã số và tên đề tài có kinh phí cao nhất
SELECT madt, tendt
FROM DeTai
WHERE kinhphi = (SELECT MAX(kinhphi) FROM DeTai);

-- Câu 14: Mã số và tên các đề tài có nhiều hơn 2 sinh viên tham gia thực tập
SELECT dt.madt, dt.tendt
FROM DeTai dt
JOIN HuongDan hd ON dt.madt = hd.madt
GROUP BY dt.madt, dt.tendt
HAVING COUNT(DISTINCT hd.masv) > 2;

-- Câu 15: Mã số, họ tên và điểm của sinh viên khoa 'DIALY' và 'QLTN'
SELECT sv.masv, sv.hotensv, hd.ketqua
FROM SinhVien sv
JOIN HuongDan hd ON sv.masv = hd.masv
JOIN Khoa k ON sv.makhoa = k.makhoa
WHERE k.makhoa IN ('DIALY', 'QLTN');

-- Câu 16: Tên khoa và số lượng sinh viên của mỗi khoa
SELECT k.tenkhoa, COUNT(sv.masv) AS SoSinhVien
FROM Khoa k
LEFT JOIN SinhVien sv ON k.makhoa = sv.makhoa
GROUP BY k.makhoa, k.tenkhoa;

-- Câu 17: Thông tin các sinh viên thực tập tại quê nhà
-- (nơi thực tập trùng với quê quán)
SELECT sv.masv, sv.hotensv, sv.quequan, dt.NoiThucTap
FROM SinhVien sv
JOIN HuongDan hd ON sv.masv = hd.masv
JOIN DeTai dt ON hd.madt = dt.madt
WHERE sv.quequan = dt.NoiThucTap;

-- Câu 18: Thông tin sinh viên CHƯA có điểm thực tập (ketqua IS NULL)
SELECT sv.*
FROM SinhVien sv
JOIN HuongDan hd ON sv.masv = hd.masv
WHERE hd.ketqua IS NULL;

-- Câu 19: Danh sách mã số, họ tên sinh viên có điểm thực tập bằng 0
SELECT sv.masv, sv.hotensv
FROM SinhVien sv
JOIN HuongDan hd ON sv.masv = hd.masv
WHERE hd.ketqua = 0;
