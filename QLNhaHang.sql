CREATE DATABASE QLNhaHang
GO
USE QLBanHang
GO
-- 1. Tạo và nhập dữ liệu cho các quan hệ
-- 2. Khai báo các khoá chính và khoá ngoại của quan hệ

CREATE TABLE VITRI
(
	MAVT CHAR(4),
	QUAN VARCHAR(40),
	THANHPHO VARCHAR(40),
	CONSTRAINT PK_VITRI PRIMARY KEY (MaVT)
)

CREATE TABLE DANHGIA
(
    MADG CHAR(4),
	DANHGIA FLOAT,
	GIATB MONEY,
	SLDG INT,
	CONSTRAINT PK_DANHGIA PRIMARY KEY (MaDG)
)

CREATE TABLE NHAHANG
(
    MANH CHAR(4),
	TENNH VARCHAR(40),
	AMTHUC VARCHAR(20),
	MAVT CHAR(4),
	MADG CHAR(4)
	CONSTRAINT PK_NHAHANG PRIMARY KEY (MaNH),
	CONSTRAINT FK_NHAHANG_VITRI FOREIGN KEY (MAVT) REFERENCES VITRI(MAVT),
	CONSTRAINT FK_NHAHANG_DANHGIA FOREIGN KEY (MADG) REFERENCES dbo.DANHGIA(MADG)
)

INSERT INTO dbo.VITRI
(
    MaVT,
    QUAN,
    THANHPHO
)
VALUES
(   'VT01',   -- MaVT - char(4)
    'Thu Duc', -- QUAN - varchar(40)
    'Ho Chi Minh'  -- THANHPHO - varchar(40)
)

INSERT INTO dbo.VITRI
(
    MaVT,
    QUAN,
    THANHPHO
)
VALUES
(   'VT02',   -- MaVT - char(4)
    'Phu Nhuan', -- QUAN - varchar(40)
    'Ho Chi Minh'  -- THANHPHO - varchar(40)
)

INSERT INTO dbo.VITRI
(
    MaVT,
    QUAN,
    THANHPHO
)
VALUES
(   'VT03',   -- MaVT - char(4)
    'Ba Dinh', -- QUAN - varchar(40)
    'Ha Noi'  -- THANHPHO - varchar(40)
)

INSERT INTO dbo.DANHGIA
(
    MaDG,
    DANHGIA,
    GiaTB,
    SLDG
)
VALUES
(   'DG01',   -- MaDG - char(4)
    3.5, -- DANHGIA - float
    200000, -- GiaTB - money
    1531  -- SLDG - int
)

INSERT INTO dbo.DANHGIA
(
    MaDG,
    DANHGIA,
    GiaTB,
    SLDG
)
VALUES
(   'DG02',   -- MaDG - char(4)
    2.5, -- DANHGIA - float
    550000, -- GiaTB - money
    324  -- SLDG - int
)

INSERT INTO dbo.DANHGIA
(
    MaDG,
    DANHGIA,
    GiaTB,
    SLDG
)
VALUES
(   'DG03',   -- MaDG - char(4)
    4.5, -- DANHGIA - float
    420000, -- GiaTB - money
    83  -- SLDG - int
)

INSERT INTO dbo.DANHGIA
(
    MaDG,
    DANHGIA,
    GiaTB,
    SLDG
)
VALUES
(   'DG04',   -- MaDG - char(4)
    4.5, -- DANHGIA - float
    80000, -- GiaTB - money
    815  -- SLDG - int
)

INSERT INTO dbo.NHAHANG
(
    MaNH,
    TenNH,
    AMTHUC,
    MaVT,
    MaDG
)
VALUES
(   'NH01',   -- MaNH - char(4)
    'Sushi Ngon', -- TenNH - varchar(40)
    'Nhat Ban', -- AMTHUC - varchar(20)
    'VT01', -- MaVT - char(4)
    'DG01'  -- MaDG - char(4)
)

INSERT INTO dbo.NHAHANG
(
    MaNH,
    TenNH,
    AMTHUC,
    MaVT,
    MaDG
)
VALUES
(   'NH02',   -- MaNH - char(4)
    'Tiem banh New York', -- TenNH - varchar(40)
    'My', -- AMTHUC - varchar(20)
    'VT03', -- MaVT - char(4)
    'DG02'  -- MaDG - char(4)
)

INSERT INTO dbo.NHAHANG
(
    MaNH,
    TenNH,
    AMTHUC,
    MaVT,
    MaDG
)
VALUES
(   'NH03',   -- MaNH - char(4)
    'Tiem tra Hoang Gia', -- TenNH - varchar(40)
    'My', -- AMTHUC - varchar(20)
    'VT01', -- MaVT - char(4)
    'DG03'  -- MaDG - char(4)
)

INSERT INTO dbo.NHAHANG
(
    MaNH,
    TenNH,
    AMTHUC,
    MaVT,
    MaDG
)
VALUES
(   'NH04',   -- MaNH - char(4)
    'Bun bo Hue', -- TenNH - varchar(40)
    'Viet Nam', -- AMTHUC - varchar(20)
    'VT01', -- MaVT - char(4)
    'DG04'  -- MaDG - char(4)
)


-- 3. Giá trung bình của các nhà hàng ở Ba Đình phải trên 50000 đồng
-- Trigger: Thêm, sửa 1 GIATB
CREATE TRIGGER ins_updt_DANHGIA_C3
ON DANHGIA
FOR INSERT, update
AS 
BEGIN
    DECLARE @GIATB MONEY,
			@QUAN VARCHAR(40)

	SELECT @GIATB = GIATB
	FROM inserted

	IF EXISTS
	(
		SELECT *
		FROM dbo.VITRI, inserted, dbo.NHAHANG
		WHERE
			@GIATB < 50000 
			AND dbo.NHAHANG.MADG = inserted.MADG
	)
	BEGIN
		ROLLBACK TRANSACTION
		PRINT 'GIATB của NHAHANG ở Ba Đình phải trên 50000 đồng'
	END
	ELSE
		PRINT 'Thêm thành công'
END

-- Trigger: Thêm, sửa QUAN
CREATE TRIGGER ins_upd_QUAN_C3
ON VITRI
FOR INSERT, UPDATE
AS 
BEGIN
    DECLARE @GIATB MONEY,
			@QUAN VARCHAR(40)

	SELECT @QUAN = QUAN
	FROM inserted

	IF EXISTS
	(
		SELECT *
		FROM dbo.VITRI, inserted, dbo.NHAHANG
		WHERE
			@QUAN != 'Ba Dinh' 
			AND dbo.VITRI.MAVT = dbo.NHAHANG.MAVT
	)
	BEGIN
		ROLLBACK TRANSACTION
		PRINT 'GIATB của NHAHANG ở Ba Đình phải trên 50000 đồng'
	END
	ELSE
		PRINT 'Thêm thành công'
END



-- 4. Thêm vào thuộc tính GHICHU có kiểu dữ liệu varchar(40) cho quan hệ DANHGIA
ALTER TABLE dbo.DANHGIA ADD GHICHU VARCHAR(40)

-- 5. In ra các nhà hàng (MANH, TENNH) phục vụ các món ăn của nền ẩm thực Mỹ
SELECT MANH, TENNH
FROM dbo.NHAHANG
WHERE AMTHUC = 'My'

-- 6. In ra các nhà hàng (MANH, TENNH, DANHGIA, GIATB, SLDG) ở TPHCM theo thứ tự tăng dần về đánh giá và giảm dần về giá trung bình
SELECT MANH, TENNH, DANHGIA, GIATB, SLDG
FROM dbo.NHAHANG, dbo.DANHGIA, dbo.VITRI
WHERE
(
	THANHPHO = 'Ho Chi Minh'
	AND NHAHANG.MaDG = DANHGIA.MaDG
	AND dbo.VITRI.MaVT = dbo.NHAHANG.MaVT
)
ORDER BY DANHGIA ASC, GIATB DESC

-- 7. In ra các vị trí (MAVT, QUAN, THANHPHO) không có nhà hàng nào được đánh giá
SELECT MAVT, QUAN, THANHPHO
FROM dbo.VITRI
WHERE NOT EXISTS
(
	SELECT * 
	FROM dbo.NHAHANG, dbo.DANHGIA
	WHERE 
		dbo.DANHGIA.MaDG = dbo.NHAHANG.MaDG
		AND dbo.VITRI.MaVT = dbo.NHAHANG.MaVT
)

SELECT VT.MAVT, QUAN, THANHPHO
FROM VITRI VT LEFT JOIN NHAHANG NH
ON VT.MAVT = NH.MAVT
WHERE NOT EXISTS (SELECT *
FROM DANHGIA DG
WHERE NH.MADG = DG.MADG);

SELECT MAVT, QUAN, THANHPHO
FROM VITRI
WHERE MAVT NOT IN(SELECT MAVT FROM NHAHANG);


SELECT VT.MAVT, QUAN, THANHPHO
FROM VITRI VT LEFT JOIN NHAHANG NH ON VT.MAVT = NH.MAVT
WHERE MADG IS NULL

-- 8. In ra số lượng nhà hàng có giá trung bình trên 500000 đồng và số lượng nhà hàng có giá trung bình dưới 500000 đồng (SL_TREN, SL_DUOI
SELECT COUNT(*) AS 'SL_TREN',
(
	SELECT COUNT(*) 
	FROM dbo.DANHGIA, dbo.NHAHANG
	WHERE 
		dbo.DANHGIA.MaDG = dbo.NHAHANG.MaDG
		AND GiaTB < 500000
) AS 'SL_DUOI'

FROM dbo.DANHGIA, dbo.NHAHANG
WHERE
	dbo.DANHGIA.MaDG = dbo.NHAHANG.MaDG
	AND GiaTB > 500000	

SELECT * FROM dbo.NHAHANG
SELECT * FROM dbo.VITRI
SELECT * FROM dbo.DANHGIA
