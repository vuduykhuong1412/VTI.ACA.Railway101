DROP DATABASE IF EXISTS QuanLyGiaoHang;
CREATE DATABASE QuanLyGiaoHang;

USE QuanLyGiaoHang;

-- Bảng LOAIMATHANG
CREATE TABLE LOAIMATHANG (
    MaLoaiMatHang   VARCHAR(10)  NOT NULL,
    TenLoaiMatHang  NVARCHAR(100) NOT NULL,
    PRIMARY KEY (MaLoaiMatHang)
);

-- Bảng KHOАНGTHOIGIAN
CREATE TABLE KHOANGTHOIGIAN (
    MaKhoangThoiGian VARCHAR(10)   NOT NULL,
    MoTa             NVARCHAR(100),
    PRIMARY KEY (MaKhoangThoiGian)
);

-- Bảng KHUVUC
CREATE TABLE KHUVUC (
    MaKhuVuc   VARCHAR(10)   NOT NULL,
    TenKhuVuc  NVARCHAR(100) NOT NULL,
    PRIMARY KEY (MaKhuVuc)
);

-- Bảng DICHVU
CREATE TABLE DICHVU (
    MaDichVu   VARCHAR(10)   NOT NULL,
    TenDichVu  NVARCHAR(200) NOT NULL,
    PRIMARY KEY (MaDichVu)
);

-- Bảng KHACHHANG
CREATE TABLE KHACHHANG (
    MaKhachHang     VARCHAR(10)   NOT NULL,
    MaKhuVuc        VARCHAR(10),
    TenKhachHang    NVARCHAR(100),
    TenCuaHang      NVARCHAR(100),
    SoDTKhachHang   VARCHAR(15),
    DiaChEmail      VARCHAR(100),
    DiaChiNhanHang  NVARCHAR(200),
    PRIMARY KEY (MaKhachHang),
    FOREIGN KEY (MaKhuVuc) REFERENCES KHUVUC(MaKhuVuc)
);

-- Bảng THANHVIENGIAOHANG
CREATE TABLE THANHVIENGIAOHANG (
    MaThanhVienGiaoHang     VARCHAR(10)   NOT NULL,
    TenThanhVienGiaoHang    NVARCHAR(100) NOT NULL,
    NgaySinh                DATE,
    GioiTinh                NVARCHAR(10),
    SoDTThanhVien           VARCHAR(15),
    DiaChiThanhVien         NVARCHAR(200),
    PRIMARY KEY (MaThanhVienGiaoHang)
);

-- Bảng DANGKYGIAOHANG
CREATE TABLE DANGKYGIAOHANG (
    MaThanhVienGiaoHang      VARCHAR(10) NOT NULL,
    MaKhoangThoiGianDKGiaoHang VARCHAR(10) NOT NULL,
    PRIMARY KEY (MaThanhVienGiaoHang, MaKhoangThoiGianDKGiaoHang),
    FOREIGN KEY (MaThanhVienGiaoHang)        REFERENCES THANHVIENGIAOHANG(MaThanhVienGiaoHang),
    FOREIGN KEY (MaKhoangThoiGianDKGiaoHang) REFERENCES KHOANGTHOIGIAN(MaKhoangThoiGian)
);

-- Bảng DONHANG_GIAOHANG
CREATE TABLE DONHANG_GIAOHANG (
    MaDonHangGiaoHang        VARCHAR(10)   NOT NULL,
    MaKhachHang              VARCHAR(10),
    MaThanhVienGiaoHang      VARCHAR(10),
    MaDichVu                 VARCHAR(10),
    MaKhuVucGiaoHang         VARCHAR(10),
    TenNguoiNhan             NVARCHAR(100),
    DiaChiGiaoHang           NVARCHAR(200),
    SoDTNguoiNhan            VARCHAR(15),
    MaKhoangThoiGiaoHang     VARCHAR(10),
    NgayGiaoHang             DATE,
    PhuongThucThanhToan      NVARCHAR(100),
    TrangThaiPheDuyet        NVARCHAR(50),
    TrangThaiGiaoHang        NVARCHAR(50),
    PRIMARY KEY (MaDonHangGiaoHang),
    FOREIGN KEY (MaKhachHang)          REFERENCES KHACHHANG(MaKhachHang),
    FOREIGN KEY (MaThanhVienGiaoHang)  REFERENCES THANHVIENGIAOHANG(MaThanhVienGiaoHang),
    FOREIGN KEY (MaDichVu)             REFERENCES DICHVU(MaDichVu),
    FOREIGN KEY (MaKhuVucGiaoHang)     REFERENCES KHUVUC(MaKhuVuc),
    FOREIGN KEY (MaKhoangThoiGiaoHang) REFERENCES KHOANGTHOIGIAN(MaKhoangThoiGian)
);

-- Bảng CHITIET_DONHANG
CREATE TABLE CHITIET_DONHANG (
    MaDonHangGiaoHang  VARCHAR(10)   NOT NULL,
    TenSanPhamDuocGiao NVARCHAR(200) NOT NULL,
    SoLuong            INT,
    TrongLuong         DECIMAL(10,2),
    MaLoaiMatHang      VARCHAR(10),
    TienThuHo          DECIMAL(15,2),
    PRIMARY KEY (MaDonHangGiaoHang, TenSanPhamDuocGiao),
    FOREIGN KEY (MaDonHangGiaoHang) REFERENCES DONHANG_GIAOHANG(MaDonHangGiaoHang),
    FOREIGN KEY (MaLoaiMatHang)     REFERENCES LOAIMATHANG(MaLoaiMatHang)
);

-- LOAIMATHANG
INSERT INTO LOAIMATHANG VALUES
('MH001', 'Quan ao'),
('MH002', 'My pham'),
('MH003', 'Do gia dung'),
('MH004', 'Do dien tu');

-- KHOANGTHOIGIAN
INSERT INTO KHOANGTHOIGIAN VALUES
('TG001', '7h - 9h AM'),
('TG002', '9h - 11h AM'),
('TG003', '1h - 3h PM'),
('TG004', '3h - 5h PM'),
('TG005', '7h - 9h30 PM');

-- KHUVUC
INSERT INTO KHUVUC VALUES
('KV001', 'Son Tra'),
('KV002', 'Lien Chieu'),
('KV003', 'Ngu Hanh Son'),
('KV004', 'Hai Chau'),
('KV005', 'Thanh Khe');

-- DICHVU
INSERT INTO DICHVU VALUES
('DV001', 'Giao hang nguoi nhan tra phi'),
('DV002', 'Giao hang nguoi gui tra tien phi'),
('DV003', 'Giao hang cong ich (khong tinh phi)');

-- THANHVIENGIAOHANG
INSERT INTO THANHVIENGIAOHANG VALUES
('TV001', 'Nguyen Van A', '1995-11-20', 'Nam', '0905111111', '23 Ong Ich Khiem'),
('TV002', 'Nguyen Van B', '1992-12-26', 'Nu',  '0905111112', '34 Ton Duc Thang'),
('TV003', 'Nguyen Van C', '1990-11-30', 'Nu',  '0905111113', '45 Hoang Dieu'),
('TV004', 'Nguyen Van D', '1995-07-08', 'Nam', '0905111114', '23/33 Ngu Hanh Son'),
('TV005', 'Nguyen Van E', '1991-02-04', 'Nam', '0905111115', '56 Dinh Thi Dieu');

-- DANGKYGIAOHANG
INSERT INTO DANGKYGIAOHANG VALUES
('TV001', 'TG004'),
('TV002', 'TG005'),
('TV003', 'TG001'),
('TV003', 'TG002'),
('TV003', 'TG003');

-- KHACHHANG
INSERT INTO KHACHHANG VALUES
('KH001', 'KV001', 'Le Thi A',    'Cua hang 1', '0905111111', 'alethi@gmail.com',    '80 Pham Phu Thai'),
('KH002', 'KV001', 'Nguyen Van B','Cua hang 2', '0905111112', 'bnguyenvan@gmail.com','100 Phan Tu'),
('KH003', 'KV002', 'Le Thi B',    'Cua hang 3', '0905111113', 'blethi@gmail.com',    '23 An Thuong 18'),
('KH004', 'KV002', 'Nguyen Van C','Cua hang 4', '0905111114', 'cnguyenvan@gmail.com','67 Ngo The Thai'),
('KH005', 'KV001', 'Le Thi D',    'Cua hang 5', '0905111115', 'dlethi@gmail.com',    '100 Chau Thi Vinh Te');

-- DONHANG_GIAOHANG
INSERT INTO DONHANG_GIAOHANG VALUES
('DH0001','KH001','TV001','DV001','KV001','Pham Van A','30 Hoang Van Thu', '0905111111','TG004','2016-10-10','Tien mat','Da phe duyet','Da giao hang'),
('DH0002','KH001','TV002','DV001','KV005','Pham Van B','15 Le Dinh Ly',   '0905111112','TG005','2016-12-23','Tien mat','Da phe duyet','Chua giao hang'),
('DH0003','KH002','TV003','DV001','KV005','Pham Van C','23 Le Dinh Duong', '0905111113','TG001','2017-04-08', 'Tien mat','Da phe duyet','Da giao hang'),
('DH0004','KH003','TV001','DV003','KV002','Pham Van D','45 Pham Phu Thai', '0905111114','TG002','2015-11-10','Chuyen khoan','Da phe duyet','Da giao hang'),
('DH0005','KH003','TV005','DV003','KV003','Pham Van E','78 Hoang Dieu',    '0905111115','TG003','2017-04-04', 'Chua phe duyet','Chua phe duyet',NULL);

-- CHITIET_DONHANG
INSERT INTO CHITIET_DONHANG VALUES
('DH0001','Ao len',          2, 0.5,  'MH001', 200000),
('DH0001','Quan au',         1, 0.25, 'MH001', 350000),
('DH0002','Ao thun',         1, 0.25, 'MH001', 1000000),
('DH0002','Ao Khoac',        3, 0.25, 'MH001', 2000000),
('DH0003','Sua duong the',   2, 0.25, 'MH002', 780000),
('DH0003','Kem tay da chet', 3, 0.5,  'MH002', 150000),
('DH0003','Kem duong ban dem',4,0.25, 'MH002', 900000);

-- Câu 1: Xóa những khách hàng có tên là "Le Thi A"
SET FOREIGN_KEY_CHECKS = 0;
DELETE FROM KHACHHANG
WHERE TenKhachHang = 'Le Thi A';
SET FOREIGN_KEY_CHECKS = 1;

-- Câu 2: Cập nhật khách hàng ở khu vực "Son Tra" → "Ngu Hanh Son"
UPDATE KHACHHANG
SET MaKhuVuc = (
    SELECT MaKhuVuc FROM KHUVUC WHERE TenKhuVuc = 'Ngu Hanh Son'
)
WHERE MaKhuVuc = (
    SELECT MaKhuVuc FROM KHUVUC WHERE TenKhuVuc = 'Son Tra'
);

-- Câu 3: Thành viên có họ tên bắt đầu bằng 'Tr' và dài ít nhất 25 ký tự
SELECT *
FROM THANHVIENGIAOHANG
WHERE TenThanhVienGiaoHang LIKE 'Tr%'
  AND LENGTH(TenThanhVienGiaoHang) >= 25;


-- Câu 4: Đơn hàng có NgayGiaoHang trong năm 2017 và khu vực giao là "Hai Chau"
SELECT dg.*
FROM DONHANG_GIAOHANG dg
JOIN KHUVUC kv ON dg.MaKhuVucGiaoHang = kv.MaKhuVuc
WHERE YEAR(dg.NgayGiaoHang) = 2017
  AND kv.TenKhuVuc = 'Hai Chau';


-- Câu 5: Đơn hàng "Da giao hang", sắp xếp tăng NgayGiaoHang, giảm PhuongThucThanhToan
SELECT
    dg.MaDonHangGiaoHang,
    dg.MaThanhVienGiaoHang,
    tv.TenThanhVienGiaoHang,
    dg.NgayGiaoHang,
    dg.PhuongThucThanhToan
FROM DONHANG_GIAOHANG dg
JOIN THANHVIENGIAOHANG tv ON dg.MaThanhVienGiaoHang = tv.MaThanhVienGiaoHang
WHERE dg.TrangThaiGiaoHang = 'Da giao hang'
ORDER BY dg.NgayGiaoHang ASC, dg.PhuongThucThanhToan DESC;


-- Câu 6: Thành viên giới tính "Nam" chưa từng được giao hàng lần nào
SELECT *
FROM THANHVIENGIAOHANG
WHERE GioiTinh = 'Nam'
  AND MaThanhVienGiaoHang NOT IN (
      SELECT DISTINCT MaThanhVienGiaoHang
      FROM DONHANG_GIAOHANG
      WHERE MaThanhVienGiaoHang IS NOT NULL
  );


-- Câu 7: Họ tên khách hàng không trùng
SELECT DISTINCT TenKhachHang
FROM KHACHHANG;

-- Câu 8: Tất cả khách hàng kèm thông tin đơn hàng
SELECT
    kh.MaKhachHang,
    kh.TenKhachHang,
    kh.DiaChiNhanHang,
    dg.MaDonHangGiaoHang,
    dg.PhuongThucThanhToan,
    dg.TrangThaiGiaoHang
FROM KHACHHANG kh
LEFT JOIN DONHANG_GIAOHANG dg ON kh.MaKhachHang = dg.MaKhachHang;


-- Câu 9: Thành viên "Nu" đã giao cho ít nhất 10 khách hàng khác nhau ở "Hai Chau"
SELECT tv.*
FROM THANHVIENGIAOHANG tv
JOIN DONHANG_GIAOHANG dg ON tv.MaThanhVienGiaoHang = dg.MaThanhVienGiaoHang
JOIN KHUVUC kv ON dg.MaKhuVucGiaoHang = kv.MaKhuVuc
WHERE tv.GioiTinh = 'Nu'
  AND kv.TenKhuVuc = 'Hai Chau'
GROUP BY tv.MaThanhVienGiaoHang
HAVING COUNT(DISTINCT dg.MaKhachHang) >= 10;


-- Câu 10: KH từng giao ở "Lien Chieu" nhưng chưa từng có thành viên "Nam" nhận giao
SELECT DISTINCT kh.*
FROM KHACHHANG kh
JOIN DONHANG_GIAOHANG dg ON kh.MaKhachHang = dg.MaKhachHang
JOIN KHUVUC kv ON dg.MaKhuVucGiaoHang = kv.MaKhuVuc
WHERE kv.TenKhuVuc = 'Lien Chieu'
  AND kh.MaKhachHang NOT IN (
      SELECT DISTINCT dg2.MaKhachHang
      FROM DONHANG_GIAOHANG dg2
      JOIN THANHVIENGIAOHANG tv ON dg2.MaThanhVienGiaoHang = tv.MaThanhVienGiaoHang
      WHERE tv.GioiTinh = 'Nam'
        AND dg2.MaKhachHang IS NOT NULL
  );
