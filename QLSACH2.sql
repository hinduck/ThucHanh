CREATE DATABASE QLSach
GO
USE QLSach
GO

CREATE TABLE TACGIA
(
    MaTG CHAR(5),
	HoTen VARCHAR(20),
	DiaChi VARCHAR(50),
	NgSinh SMALLDATETIME,
	SoDT VARCHAR(15),
	CONSTRAINT PK_MaTG PRIMARY KEY (MaTG)
)

CREATE TABLE SACH
(
    MaSach CHAR(5),
	TenSach VARCHAR(25),
	TheLoai VARCHAR(25),
	CONSTRAINT PK_MaSach PRIMARY KEY (MaSach)
)

CREATE TABLE TACGIA_SACH
(
    MaTG CHAR(5),
	MaSach CHAR(5)
	CONSTRAINT PK_TG_SACH PRIMARY KEY (MaTG, MaSach),
	CONSTRAINT FK_TG FOREIGN KEY (MaTG) REFERENCES dbo.TACGIA(MaTG),
	CONSTRAINT FK_Sach FOREIGN KEY (MaSach) REFERENCES dbo.SACH(MaSach)
)

CREATE TABLE PHATHANH
(
    MaPH CHAR(5),
	MaSach CHAR(5),
	NgayPH SMALLDATETIME,
	SoLuong INT,
	NhaXuatBan VARCHAR(20)
	CONSTRAINT PK_PH PRIMARY KEY (MaPH),
	CONSTRAINT FK_MaSach FOREIGN KEY (MaSach) REFERENCES dbo.SACH(MaSach)
)

INSERT INTO dbo.TACGIA
(
    MaTG,
    HoTen,
    DiaChi,
    NgSinh,
    SoDT
)
VALUES
(   'TG01',   -- MaTG - char(5)
    'Nguyen Nhat Anh', -- HoTen - varchar(20)
    'TPHCM', -- DiaChi - varchar(50)
    '05/11/1964', -- NgSinh - smalldatetime
    '0934855573' -- SoDT - varchar(15)
)

INSERT INTO dbo.TACGIA
(
    MaTG,
    HoTen,
    DiaChi,
    NgSinh,
    SoDT
)
VALUES
(   'TG02',   -- MaTG - char(5)
    'Tran Van B', -- HoTen - varchar(20)
    'Dong Nai', -- DiaChi - varchar(50)
    '12/3/1977', -- NgSinh - smalldatetime
    '0934812486' -- SoDT - varchar(15)
)

INSERT INTO dbo.TACGIA
(
    MaTG,
    HoTen,
    DiaChi,
    NgSinh,
    SoDT
)
VALUES
(   'TG03',   -- MaTG - char(5)
    'Dang Hong C', -- HoTen - varchar(20)
    'Binh Duong', -- DiaChi - varchar(50)
    '2/8/1987', -- NgSinh - smalldatetime
    '0975423891' -- SoDT - varchar(15)
)

INSERT INTO dbo.TACGIA
(
    MaTG,
    HoTen,
    DiaChi,
    NgSinh,
    SoDT
)
VALUES
(   'TG04',   -- MaTG - char(5)
    'Le Do Quynh', -- HoTen - varchar(20)
    'Ha Noi', -- DiaChi - varchar(50)
    '22/4/2000', -- NgSinh - smalldatetime
    '0842183794' -- SoDT - varchar(15)
)


INSERT INTO dbo.SACH
(
    MaSach,
    TenSach,
    TheLoai
)
VALUES
(   'S01',   -- MaSach - char(5)
    'Lich su', -- TenSach - varchar(25)
    'Giao khoa'  -- TheLoai - varchar(25)
)

INSERT INTO dbo.SACH
(
    MaSach,
    TenSach,
    TheLoai
)
VALUES
(   'S02',   -- MaSach - char(5)
    'So Do', -- TenSach - varchar(25)
    'Van hoc'  -- TheLoai - varchar(25)
)

INSERT INTO dbo.SACH
(
    MaSach,
    TenSach,
    TheLoai
)
VALUES
(   'S03',   -- MaSach - char(5)
    'Toan', -- TenSach - varchar(25)
    'Giao khoa'  -- TheLoai - varchar(25)
)

INSERT INTO dbo.SACH
(
    MaSach,
    TenSach,
    TheLoai
)
VALUES
(   'S04',   -- MaSach - char(5)
    'De Men phieu luu ky', -- TenSach - varchar(25)
    'Van hoc'  -- TheLoai - varchar(25)
)

INSERT INTO dbo.TACGIA_SACH
(
    MaTG,
    MaSach
)
VALUES
(   'TG01', -- MaTG - char(5)
    'S01'  -- MaSach - char(5)
)

INSERT INTO dbo.TACGIA_SACH
(
    MaTG,
    MaSach
)
VALUES
(   'TG02', -- MaTG - char(5)
    'S03'  -- MaSach - char(5)
)

INSERT INTO dbo.TACGIA_SACH
(
    MaTG,
    MaSach
)
VALUES
(   'TG03', -- MaTG - char(5)
    'S04'  -- MaSach - char(5)
)

INSERT INTO dbo.TACGIA_SACH
(
    MaTG,
    MaSach
)
VALUES
(   'TG04', -- MaTG - char(5)
    'S02'  -- MaSach - char(5)
)

INSERT INTO dbo.PHATHANH
(
    MaPH,
    MaSach,
    NgayPH,
    SoLuong,
    NhaXuatBan
)
VALUES
(   'PH01',   -- MaPH - char(5)
    'S01', -- MaSach - char(5)
    '2/2/1998', -- NgayPH - smalldatetime
    500, -- SoLuong - int
    'NXB Tre'  -- NhaXuatBan - varchar(20)
)

INSERT INTO dbo.PHATHANH
(
    MaPH,
    MaSach,
    NgayPH,
    SoLuong,
    NhaXuatBan
)
VALUES
(   'PH02',   -- MaPH - char(5)
    'S02', -- MaSach - char(5)
    '1/5/1997', -- NgayPH - smalldatetime
    750, -- SoLuong - int
    'Giao duc'  -- NhaXuatBan - varchar(20)
)

INSERT INTO dbo.PHATHANH
(
    MaPH,
    MaSach,
    NgayPH,
    SoLuong,
    NhaXuatBan
)
VALUES
(   'PH03',   -- MaPH - char(5)
    'S03', -- MaSach - char(5)
    '1/6/1998', -- NgayPH - smalldatetime
    60, -- SoLuong - int
    'Giao duc'  -- NhaXuatBan - varchar(20)
)

INSERT INTO dbo.PHATHANH
(
    MaPH,
    MaSach,
    NgayPH,
    SoLuong,
    NhaXuatBan
)
VALUES
(   'PH04',   -- MaPH - char(5)
    'S04', -- MaSach - char(5)
    '5/7/2010', -- NgayPH - smalldatetime
    2000, -- SoLuong - int
    'Thanh nien'  -- NhaXuatBan - varchar(20)
)

--2. Hiện thực các ràng buộc toàn vẹn sau:
--2.1. Ngày phát hành sách phải lớn hơn ngày sinh của tác giả. (1.5 đ)
CREATE TRIGGER ins_C21
ON PHATHANH
FOR INSERT
AS 
BEGIN
    DECLARE @ng_sinh SMALLDATETIME,
			@ng_ph SMALLDATETIME
	SELECT @ng_ph = NgayPH, @ng_sinh = NgSinh
	FROM dbo.TACGIA, inserted
	IF @ng_sinh > @ng_ph
	BEGIN
	    ROLLBACK TRANSACTION
		PRINT 'Ng phát hành sách phải lớn hơn ngày sinh tác giả'
	END
END

CREATE TRIGGER upd_C21
ON PHATHANH
FOR UPDATE
AS 
IF (UPDATE(MaTG) OR UPDATE(NgayPH))
BEGIN
    DECLARE @ng_sinh SMALLDATETIME,
			@ng_ph SMALLDATETIME
	SELECT @ng_ph = NgayPH, @ng_sinh = NgSinh
	FROM dbo.TACGIA, inserted
	IF @ng_sinh > @ng_ph
	BEGIN
	    ROLLBACK TRANSACTION
		PRINT 'Ng phát hành sách phải lớn hơn ngày sinh tác giả'
	END
END


--2.2. Sách thuộc thể loại “Giáo khoa” chỉ do nhà xuất bản “Giáo dục” phát hành. (1.5 đ)
--3. Viết các câu lệnh SQL thực hiện các câu truy vấn sau:
--3.1. Tìm tác giả (MaTG,HoTen,SoDT) của những quyển sách thuộc thể loại “Văn học” 
--do nhà xuất bản Trẻ phát hành. (1.5 đ)
SELECT TACGIA.MaTG, HoTen, SoDT
FROM dbo.TACGIA, dbo.SACH, dbo.TACGIA_SACH, dbo.PHATHANH
WHERE
	dbo.TACGIA.MaTG = dbo.TACGIA_SACH.MaTG
	AND dbo.SACH.MaSach = dbo.TACGIA_SACH.MaSach
	AND dbo.PHATHANH.MaSach = dbo.SACH.MaSach
	AND dbo.TACGIA_SACH.MaSach = dbo.PHATHANH.MaSach
	AND TheLoai = 'Van hoc'
	AND NhaXuatBan = 'NXB Tre'
--3.2. Tìm nhà xuất bản phát hành nhiều thể loại sách nhất.(1.5 đ)
SELECT TOP 1 WITH TIES NhaXuatBan, COUNT(TheLoai) 'Số lượng sách'
FROM dbo.PHATHANH, dbo.SACH
GROUP BY NhaXuatBan
ORDER BY COUNT(TheLoai) DESC

--3.3. Trong mỗi nhà xuất bản, tìm tác giả (MaTG,HoTen) có số lần phát hành nhiều sách nhất. (1 đ)
SELECT NhaXuatBan, dbo.TACGIA.MaTG, HoTen
FROM dbo.PHATHANH PH1, dbo.TACGIA, dbo.TACGIA_SACH
WHERE EXISTS
(
	SELECT *
	FROM dbo.PHATHANH PH2
	GROUP BY NhaXuatBan
	HAVING PH2.NhaXuatBan = PH1.NhaXuatBan
	AND PH1.MaSach = MAX(MaSach)
)
AND PH1.MaSach = dbo.TACGIA_SACH.MaSach
AND dbo.TACGIA_SACH.MaTG = dbo.TACGIA.MaTG
