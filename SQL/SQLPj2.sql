CREATE DATABASE K22CNT3_LEVANHOANG_PROJECT2;
GO
USE K22CNT3_LEVANHOANG_PROJECT2;
GO

CREATE TABLE QUAN_TRI (
    ID INT PRIMARY KEY IDENTITY,
    TaiKhoan VARCHAR(25) UNIQUE,
    MatKhau VARCHAR(255),
    TrangThai TINYINT
);

CREATE TABLE LOAI_SAN_PHAM (
    ID INT PRIMARY KEY IDENTITY,
    MaLoai VARCHAR(255) UNIQUE,
    TenLoai NVARCHAR(255),
    TrangThai TINYINT
);

CREATE TABLE SAN_PHAM (
    ID INT PRIMARY KEY IDENTITY,
    MaSanPham VARCHAR(255) UNIQUE,
    TenSanPham NVARCHAR(255),
    HinhAnh NVARCHAR(255),
    SoLuong INT,
    DonGia FLOAT,
    MaLoai INT REFERENCES LOAI_SAN_PHAM(ID),
    TrangThai TINYINT
);

CREATE TABLE KHACH_HANG (
    ID INT PRIMARY KEY IDENTITY,
    MaKhachHang VARCHAR(255) UNIQUE,
    HoTenKhachHang NVARCHAR(255),
    Email VARCHAR(255) UNIQUE,
    MatKhau VARCHAR(255),
    DienThoai VARCHAR(10) UNIQUE,
    DiaChi NVARCHAR(255),
    NgayDangKy DATETIME,
    TrangThai TINYINT
)


CREATE TABLE HOA_DON (
    ID INT PRIMARY KEY IDENTITY,
    MaHoaDon VARCHAR(255) UNIQUE,
    MaKhachHang INT REFERENCES KHACH_HANG(ID),
    NgayHoaDon DATETIME,
    NgayNhan DATETIME,
    HoTenKhachHang NVARCHAR(255),
    Email VARCHAR(255) ,
    DienThoai VARCHAR(255),
    DiaChi NVARCHAR(255),
    TongTriGia FLOAT,
    TrangThai TINYINT
);

CREATE TABLE CT_HOA_DON (
    ID INT PRIMARY KEY IDENTITY,
    HoaDonID INT REFERENCES HOA_DON(ID),
    SanPhamID INT REFERENCES SAN_PHAM(ID),
    SoLuongMua INT,
    DonGiaMua FLOAT,
    ThanhTien FLOAT,
    TrangThai TINYINT
);




INSERT INTO QUAN_TRI (TaiKhoan, MatKhau, TrangThai) VALUES 
('admin1', 'password123', 1),
('admin2', 'password123', 1),
('admin3', 'password123', 1),
('admin4', 'password123', 1),
('admin5', 'password123', 1);

INSERT INTO LOAI_SAN_PHAM (MaLoai, TenLoai, TrangThai) VALUES 
('LSP01', N'Electronics', 1),
('LSP02', N'Furniture', 1),
('LSP03', N'Clothing', 1),
('LSP04', N'Books', 1),
('LSP05', N'Toys', 1);

INSERT INTO SAN_PHAM (MaSanPham, TenSanPham, HinhAnh, SoLuong, DonGia, MaLoai, TrangThai) VALUES 
('SP01', N'Giày Snacker', N'giaysnek.webp', 10, 299.99, 1, 1),
('SP02', N'Qu?n short', N'quanshort.webp', 5, 399.99, 2, 1),
('SP03', N'T-Shirt', N'tshirt.jpg', 20, 19.99, 3, 1),
('SP04', N'S? mi tr?ng', N'somi.jpg', 15, 9.99, 4, 1),
('SP05', N'Action Figure', N'image5.jpg', 8, 14.99, 5, 1);

INSERT INTO KHACH_HANG (MaKhachHang, HoTenKhachHang, Email, MatKhau, DienThoai, DiaChi, NgayDangKy, TrangThai) VALUES 
('KH01', N'Nguyen Van A', 'a@example.com', 'password123', '0123456789', N'Hanoi', GETDATE(), 1),
('KH02', N'Le Thi B', 'b@example.com', 'password123', '0123456790', N'Hanoi', GETDATE(), 1),
('KH03', N'Tran Van C', 'c@example.com', 'password123', '0123456791', N'Hanoi', GETDATE(), 1),
('KH04', N'Pham Thi D', 'd@example.com', 'password123', '0123456792', N'Hanoi', GETDATE(), 1),
('KH05', N'Dang Van E', 'e@example.com', 'password123', '0123456793', N'Hanoi', GETDATE(), 1);

INSERT INTO HOA_DON (MaHoaDon, MaKhachHang, NgayHoaDon, NgayNhan, HoTenKhachHang, Email, DienThoai, DiaChi, TongTriGia, TrangThai) VALUES 
('HD01', 1, GETDATE(), DATEADD(DAY, 3, GETDATE()), N'Nguyen Van A', 'a@example.com', '0123456789', N'Hanoi', 299.99, 1),
('HD02', 2, GETDATE(), DATEADD(DAY, 4, GETDATE()), N'Le Thi B', 'b@example.com', '0123456790', N'Hanoi', 399.99, 1),
('HD03', 3, GETDATE(), DATEADD(DAY, 5, GETDATE()), N'Tran Van C', 'c@example.com', '0123456791', N'Hanoi', 19.99, 1),
('HD04', 4, GETDATE(), DATEADD(DAY, 6, GETDATE()), N'Pham Thi D', 'd@example.com', '0123456792', N'Hanoi', 9.99, 1),
('HD05', 5, GETDATE(), DATEADD(DAY, 7, GETDATE()), N'Dang Van E', 'e@example.com', '0123456793', N'Hanoi', 14.99, 1);

INSERT INTO CT_HOA_DON (HoaDonID, SanPhamID, SoLuongMua, DonGiaMua, ThanhTien, TrangThai) VALUES 
(1, 1, 1, 299.99, 299.99, 1),
(2, 2, 1, 399.99, 399.99, 1),
(3, 3, 2, 19.99, 39.98, 1),
(4, 4, 1, 9.99, 9.99, 1),
(5, 5, 3, 14.99, 44.97, 1);


SELECT * FROM QUAN_TRI;
SELECT * FROM  LOAI_SAN_PHAM;
SELECT * FROM SAN_PHAM;
SELECT * FROM KHACH_HANG;
SELECT * FROM HOA_DON;
SELECT * FROM CT_HOA_DON;


DROP TABLE QUAN_TRI;
DROP TABLE LOAI_SAN_PHAM;
DROP TABLE SAN_PHAM;
DROP TABLE KHACH_HANG;
DROP TABLE HOA_DON;
DROP TABLE CT_HOA_DON;

DELETE FROM QUAN_TRI;
DELETE FROM LOAI_SAN_PHAM;
DELETE FROM SAN_PHAM;
DELETE FROM KHACH_HANG;
DELETE FROM HOA_DON;
DELETE FROM CT_HOA_DON;

update SAN_PHAM set HinhAnh = 'Content/IMAGE/'+ HinhAnh ;