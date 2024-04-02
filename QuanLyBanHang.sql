CREATE DATABASE QuanLyBanHang
GO

USE QuanLyBanHang
GO

CREATE TABLE HoaDon(
    MaHoaDon INT IDENTITY(1,1) PRIMARY KEY,
    MaKhachHang nchar(10) NULL,
    TinhTrang nchar(1) NULL
);

CREATE TABLE ChiTietHoaDon(
	MaHoaDon INT NOT NULL,
	MaSanPham nchar(10) NOT NULL,
	SoLuongDat int NULL,
	ThanhTien decimal(18, 0) NULL,
 CONSTRAINT PK_ChiTietHoaDon PRIMARY KEY CLUSTERED 
(
	MaHoaDon ASC,
	MaSanPham ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE DonViTinh(
	MaDVT nvarchar(2) NOT NULL,
	TenDVT nvarchar(50) NULL,
 CONSTRAINT PK_DonViTinh PRIMARY KEY CLUSTERED 
(
	MaDVT ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE KhachHang(
	MaKhachHang nchar(10) NOT NULL,
	TenKhachHang nvarchar(50) NULL,
	TrangThai nvarchar(50) NULL,
 CONSTRAINT PK_KhachHang PRIMARY KEY CLUSTERED 
(
	MaKhachHang ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE QuyenDangNhap(
	MaQuyen nchar(1) NOT NULL,
	TenQuyen nvarchar(100) NULL,
 CONSTRAINT PK_QuyenDangNhap PRIMARY KEY CLUSTERED 
(
	MaQuyen ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE DanhMucSanPham(
	MaDanhMuc nchar(10) NOT NULL,
	TenDanhMuc nvarchar(50) NULL,
	TrangThai nvarchar(50) NULL,
 CONSTRAINT PK_DanhMucSanPham PRIMARY KEY CLUSTERED 
(
	MaDanhMuc ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE SanPham(
	MaSanPham nchar(10) NOT NULL,
	TenSanPham nvarchar(50) NULL,
	MaDVT nvarchar(2) NULL,
	MaDanhMuc nchar(10) NULL,
	DonGia decimal(18, 0) NULL, 
	TrangThai nvarchar(50) NULL,
 CONSTRAINT PK_SanPham PRIMARY KEY CLUSTERED 
(
	MaSanPham ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE TaiKhoan(
	TenDangNhap nvarchar(50) NOT NULL,
	MatKhau nvarchar(50) NULL,
	TenDayDu nvarchar(100) NULL,
	MaQuyen nchar(1) NULL,
	TrangThai nvarchar(50) NULL,
 CONSTRAINT PK_TaiKhoan PRIMARY KEY CLUSTERED 
(
	TenDangNhap ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE ChiTietHoaDon
ADD CONSTRAINT FK_ChiTietHoaDon_HoaDon
FOREIGN KEY (MaHoaDon)
REFERENCES HoaDon(MaHoaDon);
GO 

ALTER TABLE SanPham
ADD CONSTRAINT FK_SanPham_DanhMucSanPham
FOREIGN KEY (MaDanhMuc)
REFERENCES DanhMucSanPham(MaDanhMuc)
GO 

ALTER TABLE ChiTietHoaDon
ADD CONSTRAINT FK_ChiTietHoaDon_SanPham
FOREIGN KEY (MaSanPham)
REFERENCES SanPham(MaSanPham);
GO

ALTER TABLE SanPham
ADD CONSTRAINT FK_SanPham_DonViTinh
FOREIGN KEY (MaDVT)
REFERENCES DonViTinh(MaDVT);
GO

ALTER TABLE TaiKhoan
ADD CONSTRAINT FK_TaiKhoan_QuyenDangNhap
FOREIGN KEY (MaQuyen)
REFERENCES QuyenDangNhap(MaQuyen);

ALTER TABLE HoaDon
ADD CONSTRAINT FK_HoaDon_KhachHang
FOREIGN KEY (MaKhachHang)
REFERENCES KhachHang(MaKhachHang);
GO

INSERT QuyenDangNhap (MaQuyen, TenQuyen) 
VALUES 
(N'A', N'Admin'),
(N'U', N'User')

INSERT INTO TaiKhoan (TenDangNhap, MatKhau, TenDayDu, MaQuyen, TrangThai) 
VALUES 
(N'levantuan', HASHBYTES('SHA2_256', N'1'), N'Lê Văn Tuấn', N'A' , N'Còn sử dụng'),
(N'nguyenthiennhan', HASHBYTES('SHA2_256', N'1'), N'Nguyễn Thiện Nhân', N'U', N'Còn sử dụng'),
(N'letanphat', HASHBYTES('SHA2_256', N'1'), N'Lê Tấn Phát', N'U', N'Còn sử dụng');
GO

INSERT INTO KhachHang (MaKhachHang, TenKhachHang, TrangThai)
VALUES 
('KH001', N'Nguyễn Văn An',  N'Còn sử dụng'),
('KH002', N'Trần Thị Bình',  N'Còn sử dụng'),
('KH003', N'Lê Văn Cảnh',  N'Còn sử dụng'),
('KH004', N'Phạm Thị Duyên',  N'Còn sử dụng');
GO

INSERT INTO DonViTinh (MaDVT, TenDVT)
VALUES 
('C', N'Cái'),
('CH', N'Chai'),
('KG', N'Kilogram')
GO

INSERT INTO DanhMucSanPham (MaDanhMuc, TenDanhMuc, TrangThai)
VALUES 
('DMP001', N'Đồ gia dụng', N'Còn sử dụng'),
('DMP002', N'Tiêu dùng', N'Còn sử dụng'),
('DMP003', N'Đồ ăn', N'Còn sử dụng'),
('DMP004', N'Đồ uống', N'Còn sử dụng');
GO

INSERT INTO SanPham (MaSanPham, TenSanPham, MaDVT, MaDanhMuc, DonGia, TrangThai)
VALUES
('SP001', N'Bình nước thủy tinh 500ml', 'CH', 'DMP001', 15000, N'Còn sử dụng'),
('SP002', N'Chảo chống dính', 'C', 'DMP001', 250000, N'Còn sử dụng'),
('SP003', N'Bát đĩa sứ', 'C', 'DMP001', 20000, N'Còn sử dụng'),
('SP004', N'Ti vi 32 inch', 'C', 'DMP002', 6000000, N'Còn sử dụng'),
('SP005', N'Bàn là ướt', 'C', 'DMP002', 1200000, N'Còn sử dụng'),
('SP006', N'Nước giặt Omo 1kg', 'KG', 'DMP003', 50000, N'Còn sử dụng'),
('SP007', N'Mì gói Omachi', 'C', 'DMP003', 5000, N'Còn sử dụng'),
('SP008', N'Bia Heineken lon 330ml', 'CH', 'DMP004', 17000, N'Còn sử dụng'),
('SP009', N'Sữa tươi Vinamilk 1L', 'CH', 'DMP004', 25000, N'Còn sử dụng')
GO

SELECT * FROM TaiKhoan
SELECT * FROM QuyenDangNhap
SELECT * FROM KhachHang
SELECT * FROM DanhMucSanPham
SELECT * FROM SanPham
SELECT * FROM DonViTinh
SELECT * FROM HoaDon
SELECT * FROM ChiTietHoaDon