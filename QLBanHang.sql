CREATE DATABASE QLBanHang
GO
USE QLBanHang
GO
---------------------------------------------
-- KHACHHANG
CREATE TABLE KHACHHANG(
	MAKH	CHAR(4) NOT NULL,	
	HOTEN	VARCHAR(40),
	DCHI	VARCHAR(50),
	SODT	VARCHAR(20),
	NGSINH	SMALLDATETIME,
	NGDK	SMALLDATETIME,
	DOANHSO	MONEY,
	CONSTRAINT pk_kh PRIMARY KEY(MAKH)
)
---------------------------------------------
-- NHANVIEN
CREATE TABLE NHANVIEN(
	MANV	CHAR(4) NOT NULL,	
	HOTEN	VARCHAR(40),
	SODT	VARCHAR(20),
	NGVL	SMALLDATETIME	
	CONSTRAINT pk_nv PRIMARY KEY(MANV)
)
---------------------------------------------
-- SANPHAM
CREATE TABLE SANPHAM(
	MASP	CHAR(4) NOT NULL,
	TENSP	VARCHAR(40),
	DVT	VARCHAR(20),
	NUOCSX	VARCHAR(40),
	GIA	MONEY,
	CONSTRAINT pk_sp PRIMARY KEY(MASP)	
)
---------------------------------------------
-- HOADON
CREATE TABLE HOADON(
	SOHD	INT NOT NULL,
	NGHD 	SMALLDATETIME,
	MAKH 	CHAR(4),
	MANV 	CHAR(4),
	TRIGIA	MONEY,
	CONSTRAINT pk_hd PRIMARY KEY(SOHD)
)
---------------------------------------------
-- CTHD
CREATE TABLE CTHD(
	SOHD	INT,
	MASP	CHAR(4),
	SL	INT,
	CONSTRAINT pk_cthd PRIMARY KEY(SOHD,MASP)
)

-- Khoa ngoai cho bang HOADON
ALTER TABLE HOADON ADD CONSTRAINT fk01_HD FOREIGN KEY(MAKH) REFERENCES KHACHHANG(MAKH)
ALTER TABLE HOADON ADD CONSTRAINT fk02_HD FOREIGN KEY(MANV) REFERENCES NHANVIEN(MANV)
-- Khoa ngoai cho bang CTHD
ALTER TABLE CTHD ADD CONSTRAINT fk01_CTHD FOREIGN KEY(SOHD) REFERENCES HOADON(SOHD)
ALTER TABLE CTHD ADD CONSTRAINT fk02_CTHD FOREIGN KEY(MASP) REFERENCES SANPHAM(MASP)
-----------------------------------------------------
-----------------------------------------------------
SET DATEFORMAT DMY

-- 1. Nhập dữ liệu cho các quan hệ trên.

-------------------------------
-- KHACHHANG
INSERT INTO khachhang VALUES('KH01','Nguyen Van A','731 Tran Hung Dao, Q5, TpHCM','8823451','22/10/1960','22/07/2006',13060000)
INSERT INTO khachhang VALUES('KH02','Tran Ngoc Han','23/5 Nguyen Trai, Q5, TpHCM','908256478','03/04/1974','30/07/2006',280000)
INSERT INTO khachhang VALUES('KH03','Tran Ngoc Linh','45 Nguyen Canh Chan, Q1, TpHCM','938776266','12/06/1980','08/05/2006',3860000)
INSERT INTO khachhang VALUES('KH04','Tran Minh Long','50/34 Le Dai Hanh, Q10, TpHCM','917325476','09/03/1965','10/02/2006',250000)
INSERT INTO khachhang VALUES('KH05','Le Nhat Minh','34 Truong Dinh, Q3, TpHCM','8246108','10/03/1950','28/10/2006',21000)
INSERT INTO khachhang VALUES('KH06','Le Hoai Thuong','227 Nguyen Van Cu, Q5, TpHCM','8631738','31/12/1981','24/11/2006',915000)
INSERT INTO khachhang VALUES('KH07','Nguyen Van Tam','32/3 Tran Binh Trong, Q5, TpHCM','916783565','06/04/1971','12/01/2006',12500)
INSERT INTO khachhang VALUES('KH08','Phan Thi Thanh','45/2 An Duong Vuong, Q5, TpHCM','938435756','10/01/1971','13/12/2006',365000)
INSERT INTO khachhang VALUES('KH09','Le Ha Vinh','873 Le Hong Phong, Q5, TpHCM','8654763','03/09/1979','14/01/2007',70000)
INSERT INTO khachhang VALUES('KH10','Ha Duy Lap','34/34B Nguyen Trai, Q1, TpHCM','8768904','02/05/1983','16/01/2007',67500)

-------------------------------
-- NHANVIEN
INSERT INTO nhanvien VALUES('NV01','Nguyen Nhu Nhut','927345678','13/04/2006')
INSERT INTO nhanvien VALUES('NV02','Le Thi Phi Yen','987567390','21/04/2006')
INSERT INTO nhanvien VALUES('NV03','Nguyen Van B','997047382','27/04/2006')
INSERT INTO nhanvien VALUES('NV04','Ngo Thanh Tuan','913758498','24/06/2006')
INSERT INTO nhanvien VALUES('NV05','Nguyen Thi Truc Thanh','918590387','20/07/2006')

-------------------------------
-- SANPHAM
INSERT INTO sanpham VALUES('BC01','But chi','cay','Singapore',3000)
INSERT INTO sanpham VALUES('BC02','But chi','cay','Singapore',5000)
INSERT INTO sanpham VALUES('BC03','But chi','cay','Viet Nam',3500)
INSERT INTO sanpham VALUES('BC04','But chi','hop','Viet Nam',30000)
INSERT INTO sanpham VALUES('BB01','But bi','cay','Viet Nam',5000)
INSERT INTO sanpham VALUES('BB02','But bi','cay','Trung Quoc',7000)
INSERT INTO sanpham VALUES('BB03','But bi','hop','Thai Lan',100000)
INSERT INTO sanpham VALUES('TV01','Tap 100 giay mong','quyen','Trung Quoc',2500)
INSERT INTO sanpham VALUES('TV02','Tap 200 giay mong','quyen','Trung Quoc',4500)
INSERT INTO sanpham VALUES('TV03','Tap 100 giay tot','quyen','Viet Nam',3000)
INSERT INTO sanpham VALUES('TV04','Tap 200 giay tot','quyen','Viet Nam',5500)
INSERT INTO sanpham VALUES('TV05','Tap 100 trang','chuc','Viet Nam',23000)
INSERT INTO sanpham VALUES('TV06','Tap 200 trang','chuc','Viet Nam',53000)
INSERT INTO sanpham VALUES('TV07','Tap 100 trang','chuc','Trung Quoc',34000)
INSERT INTO sanpham VALUES('ST01','So tay 500 trang','quyen','Trung Quoc',40000)
INSERT INTO sanpham VALUES('ST02','So tay loai 1','quyen','Viet Nam',55000)
INSERT INTO sanpham VALUES('ST03','So tay loai 2','quyen','Viet Nam',51000)
INSERT INTO sanpham VALUES('ST04','So tay','quyen','Thai Lan',55000)
INSERT INTO sanpham VALUES('ST05','So tay mong','quyen','Thai Lan',20000)
INSERT INTO sanpham VALUES('ST06','Phan viet bang','hop','Viet Nam',5000)
INSERT INTO sanpham VALUES('ST07','Phan khong bui','hop','Viet Nam',7000)
INSERT INTO sanpham VALUES('ST08','Bong bang','cai','Viet Nam',1000)
INSERT INTO sanpham VALUES('ST09','But long','cay','Viet Nam',5000)
INSERT INTO sanpham VALUES('ST10','But long','cay','Trung Quoc',7000)

-------------------------------
-- HOADON
INSERT INTO hoadon VALUES(1001,'23/07/2006','KH01','NV01',320000)
INSERT INTO hoadon VALUES(1002,'12/08/2006','KH01','NV02',840000)
INSERT INTO hoadon VALUES(1003,'23/08/2006','KH02','NV01',100000)
INSERT INTO hoadon VALUES(1004,'01/09/2006','KH02','NV01',180000)
INSERT INTO hoadon VALUES(1005,'20/10/2006','KH01','NV02',3800000)
INSERT INTO hoadon VALUES(1006,'16/10/2006','KH01','NV03',2430000)
INSERT INTO hoadon VALUES(1007,'28/10/2006','KH03','NV03',510000)
INSERT INTO hoadon VALUES(1008,'28/10/2006','KH01','NV03',440000)
INSERT INTO hoadon VALUES(1009,'28/10/2006','KH03','NV04',200000)
INSERT INTO hoadon VALUES(1010,'01/11/2006','KH01','NV01',5200000)
INSERT INTO hoadon VALUES(1011,'04/11/2006','KH04','NV03',250000)
INSERT INTO hoadon VALUES(1012,'30/11/2006','KH05','NV03',21000)
INSERT INTO hoadon VALUES(1013,'12/12/2006','KH06','NV01',5000)
INSERT INTO hoadon VALUES(1014,'31/12/2006','KH03','NV02',3150000)
INSERT INTO hoadon VALUES(1015,'01/01/2007','KH06','NV01',910000)
INSERT INTO hoadon VALUES(1016,'01/01/2007','KH07','NV02',12500)
INSERT INTO hoadon VALUES(1017,'02/01/2007','KH08','NV03',35000)
INSERT INTO hoadon VALUES(1018,'13/01/2007','KH08','NV03',330000)
INSERT INTO hoadon VALUES(1019,'13/01/2007','KH01','NV03',30000)
INSERT INTO hoadon VALUES(1020,'14/01/2007','KH09','NV04',70000)
INSERT INTO hoadon VALUES(1021,'16/01/2007','KH10','NV03',67500)
INSERT INTO hoadon VALUES(1022,'16/01/2007',NULL,'NV03',7000)
INSERT INTO hoadon VALUES(1023,'17/01/2007',NULL,'NV01',330000)

-------------------------------
-- CTHD
INSERT INTO cthd VALUES(1001,'TV02',10)
INSERT INTO cthd VALUES(1001,'ST01',5)
INSERT INTO cthd VALUES(1001,'BC01',5)
INSERT INTO cthd VALUES(1001,'BC02',10)
INSERT INTO cthd VALUES(1001,'ST08',10)
INSERT INTO cthd VALUES(1002,'BC04',20)
INSERT INTO cthd VALUES(1002,'BB01',20)
INSERT INTO cthd VALUES(1002,'BB02',20)
INSERT INTO cthd VALUES(1003,'BB03',10)
INSERT INTO cthd VALUES(1004,'TV01',20)
INSERT INTO cthd VALUES(1004,'TV02',10)
INSERT INTO cthd VALUES(1004,'TV03',10)
INSERT INTO cthd VALUES(1004,'TV04',10)
INSERT INTO cthd VALUES(1005,'TV05',50)
INSERT INTO cthd VALUES(1005,'TV06',50)
INSERT INTO cthd VALUES(1006,'TV07',20)
INSERT INTO cthd VALUES(1006,'ST01',30)
INSERT INTO cthd VALUES(1006,'ST02',10)
INSERT INTO cthd VALUES(1007,'ST03',10)
INSERT INTO cthd VALUES(1008,'ST04',8)
INSERT INTO cthd VALUES(1009,'ST05',10)
INSERT INTO cthd VALUES(1010,'TV07',50)
INSERT INTO cthd VALUES(1010,'ST07',50)
INSERT INTO cthd VALUES(1010,'ST08',100)
INSERT INTO cthd VALUES(1010,'ST04',50)
INSERT INTO cthd VALUES(1010,'TV03',100)
INSERT INTO cthd VALUES(1011,'ST06',50)
INSERT INTO cthd VALUES(1012,'ST07',3)
INSERT INTO cthd VALUES(1013,'ST08',5)
INSERT INTO cthd VALUES(1014,'BC02',80)
INSERT INTO cthd VALUES(1014,'BB02',100)
INSERT INTO cthd VALUES(1014,'BC04',60)
INSERT INTO cthd VALUES(1014,'BB01',50)
INSERT INTO cthd VALUES(1015,'BB02',30)
INSERT INTO cthd VALUES(1015,'BB03',7)
INSERT INTO cthd VALUES(1016,'TV01',5)
INSERT INTO cthd VALUES(1017,'TV02',1)
INSERT INTO cthd VALUES(1017,'TV03',1)
INSERT INTO cthd VALUES(1017,'TV04',5)
INSERT INTO cthd VALUES(1018,'ST04',6)
INSERT INTO cthd VALUES(1019,'ST05',1)
INSERT INTO cthd VALUES(1019,'ST06',2)
INSERT INTO cthd VALUES(1020,'ST07',10)
INSERT INTO cthd VALUES(1021,'ST08',5)
INSERT INTO cthd VALUES(1021,'TV01',7)
INSERT INTO cthd VALUES(1021,'TV02',10)
INSERT INTO cthd VALUES(1022,'ST07',1)
INSERT INTO cthd VALUES(1023,'ST04',6)
----------------------------------------------------------------
----------------------------------------------------------------
-- THÊM CÁC KHÓA NGOẠI
ALTER TABLE HOADON ADD  CONSTRAINT FK_MAKH FOREIGN KEY (MAKH) REFERENCES KHACHHANG(MAKH)
ALTER TABLE HOADON ADD CONSTRAINT FK_MANV FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV)
ALTER TABLE CTHD ADD CONSTRAINT FK_SOHD FOREIGN KEY (SOHD) REFERENCES HOADON(SOHD)
ALTER TABLE CTHD ADD CONSTRAINT FK_MASP FOREIGN KEY (MASP) REFERENCES SANPHAM(MASP)

-- I.2 Thêm vào thuộc tính GHICHU có kiểu dữ liệu varchar(20) cho quan hệ SANPHAM
ALTER TABLE SANPHAM ADD GHICHU VARCHAR(20)

-- I.3 Thêm vào thuộc tính LOAIKH có kiểu dữ liệu là tinyint cho quan hệ KHACHHANG
ALTER TABLE KHACHHANG ADD LOAIKH TINYINT

-- I.4 Sửa kiểu dữ liệu của thuộc tính GHICHU trong quan hệ SANPHAM thành varchar(100)
ALTER TABLE SANPHAM ALTER COLUMN GHICHU VARCHAR(100)

-- I.5 Xóa thuộc tính GHICHU trong quan hệ SANPHAM
ALTER TABLE SANPHAM DROP COLUMN GHICHU

-- I.6 Làm thế nào để thuộc tính LOAIKH trong quan hệ KHACHHANG có thể lưu các giá trị là: “Vang lai”, “Thuong xuyen”, “Vip”, … 
ALTER TABLE KHACHHANG ALTER COLUMN LOAIKH VARCHAR(12)
ALTER TABLE KHACHHANG ADD CONSTRAINT CHK_LOAIKH CHECK (LOAIKH IN ('Vang lai', 'Thuong xuyen', 'Vip'))

-- I.7 Đơn vị tính của sản phẩm chỉ có thể là (“cay”,”hop”,”cai”,”quyen”,”chuc”)
ALTER TABLE SANPHAM ADD CONSTRAINT CHK_DVT CHECK (DVT IN ('cay', 'hop', 'cai', 'quyen', 'chuc'))

-- I.8 Giá bán của sản phẩm từ 500 đồng trở lên
ALTER TABLE SANPHAM ADD CONSTRAINT CHK_GIA CHECK (GIA >= 500)

-- I.9 Mỗi lần mua hàng, khách hàng phải mua ít nhất 1 sản phẩm
ALTER TABLE HOADON ADD CONSTRAINT CHK_MUAHANG CHECK (TRIGIA > 0)

-- I.10 Ngày khách hàng đăng ký là khách hàng thành viên phải lớn hơn ngày sinh của người đó
ALTER TABLE KHACHHANG ADD CONSTRAINT CHK_NGDK CHECK (NGDK > NGSINH)

-- I.11. Ngày mua hàng (NGHD) của một khách hàng thành viên sẽ lớn hơn hoặc bằng ngày
-- khách hàng đó đăng ký thành viên (NGDK).

-- Trigger: thêm và sửa NGHD của HOADON
CREATE TRIGGER ins_upd_NGHD
ON HOADON
FOR INSERT, UPDATE
AS
BEGIN
	IF 
	(
		EXISTS 
		(
			SELECT * 
			FROM dbo.KHACHHANG, inserted
			WHERE
				dbo.KHACHHANG.MAKH = inserted.MAKH
				AND dbo.KHACHHANG.NGDK > inserted.NGHD
		)
	)
	BEGIN
		PRINT 'Error: NGHD không được nhỏ hơn NGDK'
		ROLLBACK TRANSACTION
	END
END

-- Trigger: sửa NGDK của KHACHHANG
CREATE TRIGGER upd_NGDK
ON KHACHHANG
FOR UPDATE
AS 
BEGIN
	IF
	(
		EXISTS
		(
			SELECT * 
			FROM dbo.HOADON, inserted
			WHERE
				dbo.HOADON.NGHD = inserted.MAKH
				AND dbo.HOADON.NGHD < inserted.NGDK
		)
	)
	BEGIN
		PRINT 'Error: NGHD không được nhỏ hơn NGDK'
		ROLLBACK TRANSACTION
	END
END

--12. Ngày bán hàng (NGHD) của một nhân viên phải lớn hơn hoặc bằng ngày nhân viên đó
--vào làm.

-- Trigger: thêm, sửa NGHD của HOADON
CREATE TRIGGER ins_update_NGHD
ON HOADON
FOR INSERT, UPDATE
AS 
BEGIN
	IF
	(
		EXISTS
		(
			SELECT * 
			FROM dbo.NHANVIEN, inserted
			WHERE 
				dbo.NHANVIEN.MANV = inserted.MANV
				AND dbo.NHANVIEN.NGVL > inserted.NGHD
		)
	)		
	BEGIN
		ROLLBACK TRANSACTION
		PRINT 'Error: NGHD phải lớn hơn NGVL'
	END
END

-- Trigger: sửa NGVL của NHANVIEN
CREATE TRIGGER upd_NGVL
ON NHANVIEN
FOR UPDATE
AS 
BEGIN
	IF
	(
		EXISTS
		(
			SELECT * 
			FROM dbo.HOADON, inserted
			WHERE
				dbo.HOADON.MANV = inserted.MANV
				AND dbo.HOADON.NGHD < inserted.NGVL
		)
	)
	BEGIN
		ROLLBACK TRANSACTION
		PRINT 'Error: NGHD phải lớn hơn NGVL'
	END
END

--13. Mỗi một hóa đơn phải có ít nhất một chi tiết hóa đơn.
-- Trigger: Xoá 1 CTHD 
CREATE TRIGGER del_CTHD
ON CTHD
FOR DELETE
AS 
BEGIN
	IF
	(
		SELECT COUNT(*)
		FROM deleted
		WHERE SOHD = deleted.SOHD
	)
	= 
	(
		SELECT COUNT(*)
		FROM dbo.HOADON, deleted
		WHERE deleted.SOHD = dbo.HOADON.SOHD
	)
	BEGIN
		ROLLBACK TRANSACTION
		PRINT 'Error: Mỗi hoá đơn phải có ít nhất 1 CTHD'
	END
END

--14. Trị giá của một hóa đơn là tổng thành tiền (số lượng*đơn giá) của các chi tiết thuộc hóa
--đơn đó.

-- Trigger:	thêm 1 hoá đơn
CREATE TRIGGER ins_TRIGIA
ON HOADON
FOR INSERT
AS 
	UPDATE dbo.HOADON
	SET TRIGIA = 0
	WHERE SOHD =
	(
		SELECT SOHD
		FROM inserted
	)
	PRINT 'Inserted HOADON successful with TRIGIA = 0 VND'

-- Trigger: cập nhật 1 hoá đơn
CREATE TRIGGER upd_TRIGIA
ON HOADON
FOR UPDATE, INSERT 
AS 
	UPDATE dbo.HOADON
	SET TRIGIA = 
	(
		SELECT TRIGIA
		FROM deleted
	)
		WHERE SOHD = 
		(
			SELECT SOHD
			FROM inserted
		)
	PRINT 'Updated HOADON successful with TRIGIA unchanged'

-- Trigger: thêm 1 CTHD
CREATE TRIGGER ins_CTHD_C14
ON CTHD
FOR INSERT
AS
	DECLARE @SL INT,
			@GIA MONEY,
			@SOHD INT
	SELECT @GIA = GIA, @SL = SL, @SOHD = SOHD
	FROM inserted i, dbo.SANPHAM sp
	WHERE i.masp = sp.MASP

	UPDATE dbo.HOADON
	SET TRIGIA = TRIGIA + @SL * @GIA
	PRINT 'Inserted CTHD and updated TRIGIA successfully'

-- Trigger: Xoá 1 CTHD
CREATE TRIGGER del_CTHD_C14
ON CTHD
FOR DELETE
AS
	DECLARE @SL INT,
			@GIA MONEY,
			@SOHD INT
	SELECT @GIA = gia, @SL = sl, @SOHD = sohd 
	FROM deleted d, dbo.SANPHAM sp
	WHERE d.masp = sp.MASP

	UPDATE dbo.HOADON
	SET TRIGIA = TRIGIA - @SL * @GIA
	PRINT 'Deleted CTHD and updated TRIGIA successfully'

-- Trigger: cập nhật 1 CTHD
CREATE TRIGGER upd_CTHD_C14
ON CTHD
FOR UPDATE
AS 
	DECLARE @SL_old INT,
			@SL_new INT,
			@gia_old MONEY,
			@gia_new MONEY,
			@sohd_old INT,
			@sohd_new INT
	SELECT 
		@gia_old = gia, @SL_old = SL, @sohd_old = SOHD
	FROM deleted d, dbo.SANPHAM sp
	WHERE 
		d.masp = sp.MASP

	SELECT 
		@gia_new = gia, @SL_new = SL, @sohd_new = SOHD
	FROM inserted i, dbo.SANPHAM sp
	WHERE 
		i.masp = sp.MASP

	IF(@sohd_old = @sohd_new)
	BEGIN
	    UPDATE dbo.HOADON
		SET TRIGIA = TRIGIA + @SL_new * @gia_new - @SL_old * @gia_old
		WHERE SOHD = @sohd_old
	END
	ELSE
	BEGIN
	    UPDATE dbo.HOADON
		SET TRIGIA = TRIGIA - @SL_old * @gia_old
		WHERE SOHD = @sohd_old

		UPDATE dbo.HOADON
		SET TRIGIA = TRIGIA + @SL_new * @gia_new
		WHERE SOHD = @sohd_new
	END
	PRINT 'Updated CTHD and TRIGIA successfully'
	
-- Trigger: cập nhật HOADON 
CREATE TRIGGER UPDATE_HOADON_C14
ON  HOADON
FOR  INSERT
AS
	DECLARE @GIA_CU MONEY,
			@GIA_MOI MONEY,
			@SOHD INT,
			@SL  INT
		SELECT @GIA_CU=gia
		FROM  DELETED
		SELECT @GIA_MOI=gia
		FROM  INSERTED
		
		SELECT @SOHD=SOHD,@SL=SL
		FROM  INSERTED A, CTHD B
		WHERE A.MASP=B.MASP

		UPDATE HOADON
		SET  TRIGIA=TRIGIA+@SL*(@GIA_MOI-@GIA_CU) 
		WHERE SOHD=@SOHD
	PRINT'DA UPDATE 1 HOADON VOI TRIGIA KHONG THAY DOI'
--15. Doanh số của một khách hàng là tổng trị giá các hóa đơn mà khách hàng thành viên đó
--đã mua.

-- Trigger: Thêm 1 KHACHHANG
CREATE TRIGGER ins_KHACHHANG_C15
ON KHACHHANG
FOR INSERT
AS 
BEGIN
    DECLARE @MAKH CHAR(4)
	SELECT @MAKH = dbo.KHACHHANG.MAKH
	FROM inserted, dbo.KHACHHANG
	WHERE inserted.makh = dbo.KHACHHANG.MAKH
	
	UPDATE dbo.KHACHHANG
	SET DOANHSO = 0
	WHERE MAKH = @MAKH

	PRINT 'Inserted KHACHHANG successfully'

END

-- Trigger: Update 1 KHACHHANG
CREATE TRIGGER upd_KHACHHANG_C15
ON khachhang
FOR UPDATE
AS 
BEGIN
    DECLARE @TongTriGia MONEY,
			@DOANHSO MONEY

	SELECT @TongTriGia = SUM(TRIGIA)
	FROM dbo.HOADON, inserted
	WHERE dbo.HOADON.MAKH = inserted.MAKH

	SELECT @DOANHSO = DOANHSO
	FROM inserted

	IF (@DOANHSO != @TongTriGia)
	BEGIN
	    ROLLBACK TRANSACTION
		PRINT 'Doanh số của một khách hàng là tổng trị giá các hoá đơn khách hàng thành viên đó đã mua'
	END
END

-- II. Ngôn ngữ thao tác dữ liệu (Data Manipulation Language):

-- 2. Tạo quan hệ SANPHAM1 chứa toàn bộ dữ liệu của quan hệ SANPHAM. Tạo quan hệ 
-- KHACHHANG1 chứa toàn bộ dữ liệu của quan hệ KHACHHANG.

CREATE TABLE KHACHHANG1(
	MAKH	CHAR(4) NOT NULL,	
	HOTEN	VARCHAR(40),
	DCHI	VARCHAR(50),
	SODT	VARCHAR(20),
	NGSINH	SMALLDATETIME,
	NGDK	SMALLDATETIME,
	DOANHSO	MONEY,
	LOAIKH  VARCHAR(10),
	CONSTRAINT pk_kh1 PRIMARY KEY(MAKH)
)

INSERT INTO KHACHHANG1 SELECT * FROM KHACHHANG;
SELECT * FROM KHACHHANG1;


CREATE TABLE SANPHAM1(
	MASP	char(4) not null,
	TENSP	varchar(40),
	DVT	varchar(20),
	NUOCSX	varchar(40),
	GIA	money,
	constraint pk_sp1 primary key(MASP)	
)

INSERT INTO SANPHAM1 SELECT * FROM SANPHAM;
SELECT * FROM SANPHAM1;

-- 3. Cập nhật giá tăng 5% đối với những sản phẩm do “Thai Lan” sản xuất (cho quan hệ SANPHAM1)

UPDATE SANPHAM SET GIA = GIA + GIA * 0.05 WHERE NUOCSX = 'Thai Lan';
SELECT * FROM SANPHAM;

-- 3.1 Cập nhật giá trở lại như ban đầu

UPDATE SANPHAM SET GIA = GIA / 1.05 WHERE NUOCSX = 'Thai Lan';

-- 4. Cập nhật giá giảm 5% đối với những sản phẩm do “Trung Quoc” sản xuất có giá từ 10.000 trở xuống (cho quan hệ SANPHAM1).

UPDATE SANPHAM SET GIA = GIA * 0.95 WHERE NUOCSX = 'Trung Quoc' AND GIA < 10000;

-- 5. Cập nhật giá trị LOAIKH là “Vip” đối với những khách hàng đăng ký thành viên trước ngày 1/1/2007 có doanh số từ 10.000.000 trở lên hoặc khách hàng đăng ký thành viên từ 
-- 1/1/2007 trở về sau có doanh số từ 2.000.000 trở lên (cho quan hệ KHACHHANG1).

SET dateformat dmy;
ALTER TABLE KHACHHANG ADD LOAIKH varchar(10);
UPDATE KHACHHANG SET LOAIKH = 'Vip'
WHERE ((YEAR(NGDK) < 2007 AND DOANHSO >= 10000000)
OR (YEAR(NGDK) > 2007 AND DOANHSO >= 2000000))
SELECT * FROM KHACHHANG;

-- 5.1 Các khách hàng còn lại cập nhật giá trị "Vang lai"

UPDATE KHACHHANG SET LOAIKH = 'Thuong'
WHERE ((YEAR(NGDK) < 2007 AND DOANHSO < 10000000)
OR (YEAR(NGDK) >= 2007 AND DOANHSO < 2000000))
SELECT * FROM KHACHHANG;

-- III. Ngôn ngữ truy vấn dữ liệu:
-- 1. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất.

SELECT MASP + ' ' + TENSP AS 'TEN SP' FROM SANPHAM WHERE NUOCSX = 'Trung Quoc';

-- 2. In ra danh sách các sản phẩm (MASP, TENSP) có đơn vị tính là “cay”, ”quyen”.

SELECT MASP, TENSP FROM SANPHAM WHERE DVT in ('cay', 'quyen');

-- 3. In ra danh sách các sản phẩm (MASP,TENSP) có mã sản phẩm bắt đầu là “B” và kết thúc là “01”.

SELECT MASP, TENSP FROM SANPHAM WHERE MASP LIKE 'B_01';
-- %: bao nhiêu ký tự cũng dc;
-- _: 1 ký tự duy nhất

-- 4. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất có giá từ 30.000 đến 40.000.

SELECT MASP, TENSP FROM SANPHAM WHERE (NUOCSX = 'Trung Quoc') AND (GIA BETWEEN 30000 AND 40000);

SELECT MASP, TENSP FROM SANPHAM WHERE NUOCSX = 'Trung Quoc'
INTERSECT 
SELECT MASP, TENSP FROM SANPHAM WHERE GIA BETWEEN 30000 AND 40000;

-- 5. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” hoặc “Thai Lan” sản xuất, có giá từ 30.000 đến 40.000.

SELECT MaSP, TenSP FROM SanPham WHERE NUOCSX IN ('Trung Quoc', 'Thai Lan') AND Gia BETWEEN 30000 AND 40000;

SELECT MASP, TENSP FROM SANPHAM WHERE (NUOCSX = 'THAI LAN') AND GIA BETWEEN 30000 AND 40000
UNION
SELECT MASP, TENSP FROM SANPHAM WHERE (NUOCSX = 'TRUNG QUOC') AND GIA BETWEEN 30000 AND 40000

-- 6. In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 1/1/2007 và ngày 2/1/2007.

SELECT SOHD, TRIGIA FROM HOADON WHERE NGHD IN ('1/1/2007', '2/1/2007');
SELECT * FROM HOADON;

-- 7. In ra các số hóa đơn, trị giá hóa đơn trong tháng 1/2007, sắp xếp theo ngày (tăng dần) và trị giá của hóa đơn (giảm dần).

SELECT SOHD, TRIGIA FROM HOADON WHERE MONTH(NGHD) = 1 AND YEAR(NGHD) = 2007 ORDER BY NGHD ASC, TRIGIA DESC;

-- 8. In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 1/1/2007.

SELECT DISTINCT KHACHHANG.MAKH, HOTEN FROM KHACHHANG, HOADON
WHERE HOADON.MAKH = KHACHHANG.MAKH
	AND	NGHD = '1/1/2007';

-- 9. In ra số hóa đơn, trị giá các hóa đơn do nhân viên có tên “Nguyen Van B” lập trong ngày 28/10/2006.

SELECT SOHD, TRIGIA FROM HOADON, NHANVIEN
WHERE HOADON.MANV = NHANVIEN.MANV
	AND HOTEN = 'Nguyen Van B'
	AND NGHD = '28/10/2006';

-- 10. In ra danh sách các sản phẩm (MASP,TENSP) được khách hàng có tên “Nguyen Van A” mua trong tháng 10/2006.

SELECT DISTINCT SANPHAM.MASP, TENSP FROM SANPHAM, HOADON, KHACHHANG, CTHD
WHERE CTHD.MASP = SANPHAM.MASP
	AND CTHD.SOHD = HOADON.SOHD
	AND HOTEN = 'Nguyen Van A'
	AND MONTH(NGHD) = 10
	AND YEAR(NGHD) = 2006;
		
-- 11. Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”.

SELECT DISTINCT SOHD FROM CTHD 
WHERE MASP IN ('BB01', 'BB02')

-- 12. Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”, mỗi sản phẩm mua với số lượng từ 10 đến 20.

SELECT DISTINCT SOHD FROM CTHD 
WHERE MASP IN ('BB01', 'BB02') AND SL BETWEEN 10 AND 20;

-- 13. Tìm các số hóa đơn mua cùng lúc 2 sản phẩm có mã số “BB01” và “BB02”, mỗi sản phẩm mua với số lượng từ 10 đến 20.

SELECT DISTINCT SOHD FROM CTHD 
WHERE MASP = 'BB01' AND SL BETWEEN 10 AND 20
INTERSECT
SELECT DISTINCT SOHD FROM CTHD
WHERE MASP = 'BB02' AND SL BETWEEN 10 AND 20;

-- 14. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất hoặc các sản phẩm được bán ra trong ngày 1/1/2007.

SELECT MASP, TENSP FROM SANPHAM
WHERE NUOCSX = 'Trung Quoc'
UNION
SELECT SANPHAM.MASP, TENSP FROM CTHD, HOADON, SANPHAM
WHERE NGHD = '1/1/2007' AND CTHD.SOHD = HOADON.SOHD AND CTHD.MASP = SANPHAM.MASP;

-- 14.1 Sử dụng phép kết

SELECT DISTINCT SANPHAM.MASP, TENSP FROM SANPHAM LEFT JOIN CTHD ON SANPHAM.MASP = CTHD.MASP LEFT JOIN HOADON ON HOADON.SOHD = CTHD.SOHD
WHERE NUOCSX = 'TRUNG QUOC' OR NGHD = '1/1/2007';

-- 15. In ra danh sách các sản phẩm (MASP,TENSP) không bán được.
SELECT DISTINCT SANPHAM.MASP, TENSP FROM SANPHAM LEFT JOIN CTHD ON SANPHAM.MASP = CTHD.MASP
WHERE SOHD is null;

SELECT MASP, TENSP
FROM SANPHAM
WHERE MASP NOT IN (SELECT MASP FROM CTHD);

-- 16. In ra danh sách các sản phẩm (MASP,TENSP) không bán được trong năm 2006.
SELECT DISTINCT MASP, TENSP 
FROM SANPHAM 
WHERE MASP NOT IN
(
	SELECT MASP 
	FROM CTHD, HOADON
	WHERE 
		CTHD.SOHD = HOADON.SOHD
		AND YEAR(NGHD) = 2006
);

SELECT DISTINCT MASP, TENSP 
FROM SANPHAM 
WHERE NOT EXISTS
(
	SELECT *
	FROM CTHD, HOADON
	WHERE 
		CTHD.SOHD = HOADON.SOHD
		AND dbo.SANPHAM.MASP = dbo.CTHD.MASP
		AND YEAR(NGHD) = 2006
);

-- 17. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất không bán được trong năm 2006.
SELECT DISTINCT MASP, TENSP
FROM SANPHAM
WHERE 
	NUOCSX = 'Trung Quoc' 
	AND MASP NOT IN 
	(
		SELECT MASP
		FROM CTHD, HOADON
		WHERE 
			CTHD.SOHD = HOADON.SOHD
			AND YEAR(NGHD) = 2006
	);

-- 18. Tìm số hóa đơn đã mua tất cả các sản phẩm do Singapore sản xuất.
-- = Hiển thị số hoá đơn thoả điều kiện: KHÔNG TỒN TẠI sản phẩm nào của Singapore sản xuất mà hoá đơn này KHÔNG MUA.
SELECT SOHD FROM HOADON
WHERE NOT EXISTS 
(
	SELECT * FROM SANPHAM 
	WHERE NUOCSX= 'Singapore' 
		AND NOT EXISTS
		(
			SELECT * 
			FROM CTHD 
			WHERE CTHD.SOHD = HOADON.SOHD 
			AND CTHD.MASP = SANPHAM.MASP
		)
);

-- 19. Tìm số hóa đơn trong năm 2006 đã mua ít nhất tất cả các sản phẩm do Singapore sản xuất.
SELECT SOHD
FROM dbo.HOADON
WHERE YEAR(NGHD) = 2006
AND	NOT EXISTS 
(
	SELECT * 
	FROM dbo.SANPHAM
	WHERE NUOCSX = 'Singapore'
		AND NOT EXISTS 
		(
			SELECT * 
			FROM dbo.CTHD
			WHERE dbo.CTHD.SOHD = dbo.HOADON.SOHD
			AND dbo.SANPHAM.MASP = dbo.CTHD.MASP
		)
)
--20. Có bao nhiêu hóa đơn không phải của khách hàng đăng ký thành viên mua?
SELECT COUNT(*) 'SL_KH'
FROM dbo.HOADON
WHERE MAKH IS NULL

--21. Có bao nhiêu sản phẩm khác nhau được bán ra trong năm 2006.
SELECT COUNT(DISTINCT MASP) SO_SP
FROM dbo.CTHD, dbo.HOADON
WHERE	
	dbo.CTHD.SOHD = dbo.HOADON.SOHD
	AND YEAR(NGHD) = 2006

--22. Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu ?
SELECT MAX(trigia) TRIGIA_max, MIN(trigia) TRIGIA_min
FROM dbo.HOADON

--23. Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu?
SELECT AVG(trigia) TRIGIA2006_TB
FROM dbo.HOADON
WHERE YEAR(NGHD) = 2006

--24. Tính doanh thu bán hàng trong năm 2006.
SELECT SUM(trigia) TRIGIA2006_DOANHTHU
FROM dbo.HOADON
WHERE YEAR(NGHD) = 2006;

--25. Tìm số hóa đơn có trị giá cao nhất trong năm 2006.
SELECT SOHD
FROM dbo.HOADON
WHERE 
	YEAR(NGHD) = 2006
	AND TRIGIA IN 
	(
		SELECT MAX(trigia)
		FROM dbo.HOADON
		WHERE YEAR(NGHD) = 2006
	)

--26. Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2006.
SELECT DISTINCT HOTEN
FROM dbo.KHACHHANG, dbo.HOADON
WHERE 
	dbo.KHACHHANG.MAKH = dbo.HOADON.MAKH
	AND YEAR(NGHD) = 2006
	AND TRIGIA IN
	(
		SELECT MAX(trigia)
		FROM dbo.HOADON
		WHERE YEAR(NGHD) = 2006
	)

--27. In ra danh sách 3 khách hàng đầu tiên (MAKH, HOTEN) sắp xếp theo doanh số giảm
--dần.
SELECT TOP 3 WITH TIES MAKH, HOTEN
FROM dbo.KHACHHANG
ORDER BY DOANHSO DESC

--28. In ra danh sách các sản phẩm (MASP, TENSP) có giá bán bằng 1 trong 3 mức giá cao
--nhất.
SELECT MASP, TENSP
FROM dbo.SANPHAM
WHERE GIA IN 
(
	SELECT DISTINCT TOP 3 GIA
	FROM dbo.SANPHAM
	ORDER BY GIA DESC
)

--29. In ra danh sách các sản phẩm (MASP, TENSP) do “Thai Lan” sản xuất có giá bằng 1
--trong 3 mức giá cao nhất (của tất cả các sản phẩm).
SELECT masp, tensp
FROM dbo.SANPHAM
WHERE 
	NUOCSX = 'Thai Lan'
	AND GIA IN 
	(
		SELECT DISTINCT TOP 3 GIA
		FROM dbo.SANPHAM
		ORDER BY GIA DESC
	)


--30. In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quoc” sản xuất có giá bằng 1
--trong 3 mức giá cao nhất (của sản phẩm do “Trung Quoc” sản xuất).
SELECT masp, tensp
FROM dbo.SANPHAM
WHERE GIA IN 
(
	SELECT DISTINCT TOP 3 GIA
	FROM dbo.SANPHAM
	WHERE NuocSX = 'Trung Quoc'
	ORDER BY GIA DESC
)

--31. * In ra danh sách khách hàng nằm trong 3 hạng cao nhất (xếp hạng theo doanh số).
SELECT DISTINCT TOP 3 WITH TIES *
FROM dbo.KHACHHANG
ORDER BY DOANHSO DESC

--32. Tính tổng số sản phẩm do “Trung Quoc” sản xuất.
SELECT COUNT(*)
FROM dbo.SANPHAM
WHERE NUOCSX = 'Trung Quoc'

--33. Tính tổng số sản phẩm của từng nước sản xuất.
SELECT NUOCSX, COUNT(*) 'SL_SanPham'
FROM dbo.SANPHAM
GROUP BY NUOCSX

--34. Với từng nước sản xuất, tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm.
SELECT NUOCSX, MAX(GIA) 'GIA_max', MIN(GIA) 'GIA_min', AVG(GIA) 'Gia_TB'
FROM dbo.SANPHAM
GROUP BY NUOCSX

--35. Tính doanh thu bán hàng mỗi ngày.
SELECT NGHD, SUM(TRIGIA) 'DOANHTHU_MOINGAY'
FROM dbo.HOADON
GROUP BY NGHD

--36. Tính tổng số lượng của từng sản phẩm bán ra trong tháng 10/2006.
SELECT dbo.SANPHAM.MASP, TENSP, SUM(SL) 'SL_SanPhamBan'
FROM dbo.SANPHAM, dbo.HOADON, dbo.CTHD
WHERE 
	dbo.SANPHAM.MASP = dbo.CTHD.MASP
	AND dbo.CTHD.SOHD = dbo.HOADON.SOHD
	AND MONTH(NGHD) = 10 AND YEAR(NGHD) = 2006
GROUP BY dbo.SANPHAM.MASP, TENSP

--37. Tính doanh thu bán hàng của từng tháng trong năm 2006.
SELECT MONTH(NGHD) THANG, SUM(TRIGIA) 'DOANHTHU_THANG'
FROM dbo.HOADON
WHERE YEAR(NGHD) = 2006
GROUP BY MONTH(NGHD)

--38. Tìm hóa đơn có mua ít nhất 4 sản phẩm khác nhau.
SELECT SOHD
FROM dbo.CTHD
GROUP BY SOHD
HAVING COUNT(DISTINCT MASP) >= 4

--39. Tìm hóa đơn có mua 3 sản phẩm do “Viet Nam” sản xuất (3 sản phẩm khác nhau).
SELECT SOHD
FROM dbo.CTHD, dbo.SANPHAM
WHERE 
	dbo.CTHD.MASP = dbo.SANPHAM.MASP
	AND NUOCSX = 'Viet Nam'
GROUP BY SOHD
HAVING COUNT(DISTINCT dbo.CTHD.MASP) >= 3

--40. Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất.
SELECT DISTINCT TOP 1 WITH TIES dbo.KHACHHANG.MAKH, HOTEN, COUNT(*) 'So Lan Mua Hang'
FROM dbo.KHACHHANG, dbo.HOADON
WHERE dbo.KHACHHANG.MAKH = dbo.HOADON.MAKH
GROUP BY KHACHHANG.MAKH, HOTEN
ORDER BY COUNT(*) DESC

SELECT dbo.KHACHHANG.MAKH, HOTEN, COUNT(*) 'SoLanMuaHang'
FROM dbo.KHACHHANG, dbo.HOADON
WHERE dbo.KHACHHANG.MAKH = dbo.HOADON.MAKH
GROUP BY dbo.KHACHHANG.MAKH, HOTEN
HAVING COUNT(*) >= ALL 
(
	SELECT COUNT(*)
	FROM dbo.HOADON
	GROUP BY MAKH
)

--41. Tháng mấy trong năm 2006, doanh số bán hàng cao nhất ?
SELECT MONTH(NGHD) 'Thang doanh so cao nhat'
FROM dbo.HOADON
WHERE YEAR(NGHD) = 2006
GROUP BY MONTH(NGHD)
HAVING SUM(TRIGIA) >= ALL 
(
	SELECT SUM(TRIGIA)
	FROM dbo.HOADON
	WHERE YEAR(NGHD) = 2006
	GROUP BY MONTH(NGHD)
)

--42. Tìm sản phẩm (MASP, TENSP) có tổng số lượng bán ra thấp nhất trong năm 2006.
SELECT TOP 1 WITH TIES SANPHAM.MASP, TENSP
FROM SANPHAM, CTHD, HOADON
WHERE 
	SANPHAM.MASP = CTHD.MASP
	AND HOADON.SOHD = CTHD.SOHD
	AND YEAR(NGHD) = 2006
GROUP BY SANPHAM.MASP, TENSP
ORDER BY SUM(SL)

--43. *Mỗi nước sản xuất, tìm sản phẩm (MASP,TENSP) có giá bán cao nhất.
SELECT NUOCSX, MASP, TENSP
FROM SANPHAM SP1
WHERE EXISTS
(
	SELECT *
	FROM SANPHAM SP2
	GROUP BY NUOCSX
	HAVING SP1.NUOCSX = SP2.NUOCSX
	AND SP1.GIA = MAX(GIA)
)

--44. Tìm nước sản xuất sản xuất ít nhất 3 sản phẩm có giá bán khác nhau.
SELECT NUOCSX 
FROM SANPHAM
GROUP BY NUOCSX
HAVING COUNT(DISTINCT GIA) >= 3

--45. *Trong 10 khách hàng có doanh số cao nhất, tìm khách hàng có số lần mua hàng nhiều
--nhất.
SELECT MAKH, HOTEN
FROM KHACHHANG
WHERE MAKH IN 
(
	SELECT TOP 1 WITH TIES HOADON.MAKH
	FROM
		(
			SELECT TOP 10 MAKH
			FROM KHACHHANG
			ORDER BY DOANHSO DESC
		) AS A, HOADON
	WHERE A.MAKH = HOADON.MAKH
	GROUP BY HOADON.MAKH
	ORDER BY COUNT(*) DESC
)