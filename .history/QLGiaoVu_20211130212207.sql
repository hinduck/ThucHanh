﻿CREATE DATABASE QLGiaoVu
GO	
USE QLGiaoVu
GO

-- 1. Tạo quan hệ và khai báo tất cả các ràng buộc khóa chính, khóa ngoại.

-------------------------------------------------
-------------------------------------------------

-- Tao bang + khoa chinh, khoa ngoai
CREATE TABLE KHOA(
	MAKHOA	CHAR(4),
	TENKHOA	VARCHAR(40),
	NGTLAP	SMALLDATETIME,
	TRGKHOA	CHAR(4)
	CONSTRAINT PK_KHOA PRIMARY KEY(MAKHOA)
)

CREATE TABLE MONHOC(
	MAMH	CHAR(10),
	TENMH	VARCHAR(40),
	TCLT	TINYINT,
	TCTH	TINYINT,
	MAKHOA	CHAR(4),
	CONSTRAINT PK_MH PRIMARY KEY(MAMH)
)

CREATE TABLE DIEUKIEN(
	MAMH		CHAR(10),
	MAMH_TRUOC	CHAR(10),
	CONSTRAINT PK_DK PRIMARY KEY(MAMH,MAMH_TRUOC)
)

CREATE TABLE GIAOVIEN(
	MAGV		CHAR(4),
	HOTEN		VARCHAR(40),
	HOCVI		VARCHAR(10),
	HOCHAM		VARCHAR(10),
	GIOITINH	VARCHAR(3),
	NGSINH		SMALLDATETIME,
	NGVL		SMALLDATETIME,
	HESO		NUMERIC(4,2),
	MUCLUONG	MONEY,
	MAKHOA		CHAR(4),
	CONSTRAINT PK_GV PRIMARY KEY(MAGV)
)
GO

CREATE TABLE LOP(
	MALOP	char(3),
	TENLOP	varchar(40),
	TRGLOP	char(5),
	SISO	tinyint,
	MAGVCN	char(4),
	CONSTRAINT PK_LOP PRIMARY KEY(MALOP)
)

CREATE TABLE HOCVIEN(
	MAHV		char(5),
	HO		varchar(40),
	TEN		varchar(10),
	NGSINH		smalldatetime,
	GIOITINH	varchar(3),
	NOISINH		varchar(40),
	MALOP		char(3),
	CONSTRAINT PK_HV PRIMARY KEY(MAHV)
)
GO

CREATE TABLE GIANGDAY(
	MALOP	char(3),
	MAMH	char(10),
	MAGV	char(4),
	HOCKY	tinyint,
	NAM	smallint,
	TUNGAY	smalldatetime,
	DENNGAY	smalldatetime,
	CONSTRAINT PK_GD PRIMARY KEY(MALOP,MAMH)
)

CREATE TABLE KETQUATHI(
	MAHV	char(5),
	MAMH	char(10),
	LANTHI	tinyint,
	NGTHI	smalldatetime,
	DIEM	numeric(4,2),
	KQUA	varchar(10),
	CONSTRAINT PK_KQ PRIMARY KEY(MAHV,MAMH,LANTHI)
)

-------------------------------------------
-- KHOA 	
ALTER TABLE KHOA ADD CONSTRAINT FK_KHOA FOREIGN KEY(TRGKHOA) REFERENCES GIAOVIEN(MAGV)
-------------------------------------------
-- MONHOC 		
ALTER TABLE MONHOC ADD CONSTRAINT FK_MH FOREIGN KEY(MAKHOA) REFERENCES KHOA(MAKHOA)
-------------------------------------------
-- DIEUKIEN 	
ALTER TABLE DIEUKIEN ADD CONSTRAINT FK01_DK FOREIGN KEY(MAMH) REFERENCES MONHOC(MAMH)
ALTER TABLE DIEUKIEN ADD CONSTRAINT FK02_DK FOREIGN KEY(MAMH_TRUOC) REFERENCES MONHOC(MAMH)
-------------------------------------------
-- GIAOVIEN
ALTER TABLE GIAOVIEN ADD CONSTRAINT FK_GV FOREIGN KEY(MAKHOA) REFERENCES KHOA(MAKHOA)
-------------------------------------------
-- LOP
ALTER TABLE LOP ADD CONSTRAINT FK01_LOP FOREIGN KEY(TRGLOP) REFERENCES HOCVIEN(MAHV)
ALTER TABLE LOP ADD CONSTRAINT FK02_LOP FOREIGN KEY(MAGVCN) REFERENCES GIAOVIEN(MAGV)
-------------------------------------------
-- HOCVIEN
ALTER TABLE HOCVIEN ADD CONSTRAINT FK_HV FOREIGN KEY(MALOP) REFERENCES LOP(MALOP)
-------------------------------------------
-- GIANGDAY
ALTER TABLE GIANGDAY ADD CONSTRAINT FK01_GD FOREIGN KEY(MALOP) REFERENCES LOP(MALOP)
ALTER TABLE GIANGDAY ADD CONSTRAINT FK02_GD FOREIGN KEY(MAMH) REFERENCES MONHOC(MAMH)
ALTER TABLE GIANGDAY ADD CONSTRAINT FK03_GD FOREIGN KEY(MAGV) REFERENCES GIAOVIEN(MAGV)
-------------------------------------------
-- KETQUATHI
ALTER TABLE KETQUATHI ADD CONSTRAINT FK01_KQ FOREIGN KEY(MAHV) REFERENCES HOCVIEN(MAHV)
ALTER TABLE KETQUATHI ADD CONSTRAINT FK02_KQ FOREIGN KEY(MAMH) REFERENCES MONHOC(MAMH)

-------------------------------------------------
-------------------------------------------------
-- Nhap lieu
ALTER TABLE KHOA NOCHECK CONSTRAINT ALL
ALTER TABLE LOP NOCHECK CONSTRAINT ALL
ALTER TABLE MONHOC NOCHECK CONSTRAINT ALL
ALTER TABLE DIEUKIEN NOCHECK CONSTRAINT ALL
ALTER TABLE GIAOVIEN NOCHECK CONSTRAINT ALL
ALTER TABLE HOCVIEN NOCHECK CONSTRAINT ALL
ALTER TABLE GIANGDAY NOCHECK CONSTRAINT ALL
ALTER TABLE KETQUATHI NOCHECK CONSTRAINT ALL

delete from KHOA
delete from LOP
delete from MONHOC
delete from DIEUKIEN
delete from GIAOVIEN
delete from HOCVIEN
delete from GIANGDAY
delete from KETQUATHI

set dateformat dmy
-- KHOA
INSERT INTO KHOA VALUES('KHMT','Khoa hoc may tinh','06/07/2005','GV01')
INSERT INTO KHOA VALUES('HTTT','He thong thong tin','06/07/2005','GV02')
INSERT INTO KHOA VALUES('CNPM','Cong nghe phan mem','06/07/2005','GV04')
INSERT INTO KHOA VALUES('MTT','Mang va truyen thong','20/10/2005','GV03')
INSERT INTO KHOA VALUES('KTMT','Ky thuat may tinh','20/12/2005','Null')

-- LOP
INSERT INTO LOP VALUES('K11','Lop 1 khoa 1','K1108',11,'GV07')
INSERT INTO LOP VALUES('K12','Lop 2 khoa 1','K1205',12,'GV09')
INSERT INTO LOP VALUES('K13','Lop 3 khoa 1','K1305',12,'GV14')

-- MONHOC
INSERT INTO MONHOC VALUES('THDC','Tin hoc dai cuong',4,1,'KHMT')
INSERT INTO MONHOC VALUES('CTRR','Cau truc roi rac',5,0,'KHMT')
INSERT INTO MONHOC VALUES('CSDL','Co so du lieu',3,1,'HTTT')
INSERT INTO MONHOC VALUES('CTDLGT','Cau truc du lieu va giai thuat',3,1,'KHMT')
INSERT INTO MONHOC VALUES('PTTKTT','Phan tich thiet ke thuat toan',3,0,'KHMT')
INSERT INTO MONHOC VALUES('DHMT','Do hoa may tinh',3,1,'KHMT')
INSERT INTO MONHOC VALUES('KTMT','Kien truc may tinh',3,0,'KTMT')
INSERT INTO MONHOC VALUES('TKCSDL','Thiet ke co so du lieu',3,1,'HTTT')
INSERT INTO MONHOC VALUES('PTTKHTTT','Phan tich thiet ke he thong thong tin',4,1,'HTTT')
INSERT INTO MONHOC VALUES('HDH','He dieu hanh',4,0,'KTMT')
INSERT INTO MONHOC VALUES('NMCNPM','Nhap mon cong nghe phan mem',3,0,'CNPM')
INSERT INTO MONHOC VALUES('LTCFW','Lap trinh C for win',3,1,'CNPM')
INSERT INTO MONHOC VALUES('LTHDT','Lap trinh huong doi tuong',3,1,'CNPM')

-- DIEUKIEN
INSERT INTO DIEUKIEN VALUES('CSDL','CTRR')
INSERT INTO DIEUKIEN VALUES('CSDL','CTDLGT')
INSERT INTO DIEUKIEN VALUES('CTDLGT','THDC')
INSERT INTO DIEUKIEN VALUES('PTTKTT','THDC')
INSERT INTO DIEUKIEN VALUES('PTTKTT','CTDLGT')
INSERT INTO DIEUKIEN VALUES('DHMT','THDC')
INSERT INTO DIEUKIEN VALUES('LTHDT','THDC')
INSERT INTO DIEUKIEN VALUES('PTTKHTTT','CSDL')

-- GIANGDAY
INSERT INTO GIANGDAY VALUES('K11','THDC','GV07',1,2006,'01/02/2006','05/12/2006')
INSERT INTO GIANGDAY VALUES('K12','THDC','GV06',1,2006,'01/02/2006','05/12/2006')
INSERT INTO GIANGDAY VALUES('K13','THDC','GV15',1,2006,'01/02/2006','05/12/2006')
INSERT INTO GIANGDAY VALUES('K11','CTRR','GV02',1,2006,'01/09/2006','17/5/2006')
INSERT INTO GIANGDAY VALUES('K12','CTRR','GV02',1,2006,'01/09/2006','17/5/2006')
INSERT INTO GIANGDAY VALUES('K13','CTRR','GV08',1,2006,'01/09/2006','17/5/2006')
INSERT INTO GIANGDAY VALUES('K11','CSDL','GV05',2,2006,'06/01/2006','15/7/2006')
INSERT INTO GIANGDAY VALUES('K12','CSDL','GV09',2,2006,'06/01/2006','15/7/2006')
INSERT INTO GIANGDAY VALUES('K13','CTDLGT','GV15',2,2006,'06/01/2006','15/7/2006')
INSERT INTO GIANGDAY VALUES('K13','CSDL','GV05',3,2006,'08/01/2006','15/12/2006')
INSERT INTO GIANGDAY VALUES('K13','DHMT','GV07',3,2006,'08/01/2006','15/12/2006')
INSERT INTO GIANGDAY VALUES('K11','CTDLGT','GV15',3,2006,'08/01/2006','15/12/2006')
INSERT INTO GIANGDAY VALUES('K12','CTDLGT','GV15',3,2006,'08/01/2006','15/12/2006')
INSERT INTO GIANGDAY VALUES('K11','HDH','GV04',1,2007,'01/02/2007','18/2/2007')
INSERT INTO GIANGDAY VALUES('K12','HDH','GV04',1,2007,'01/02/2007','20/3/2007')
INSERT INTO GIANGDAY VALUES('K11','DHMT','GV07',1,2007,'18/2/2007','20/3/2007')

-- GIAOVIEN
INSERT INTO GIAOVIEN VALUES('GV01','Ho Thanh Son','PTS','GS','Nam','05/02/1950','01/11/2004',5,2250000,'KHMT')
INSERT INTO GIAOVIEN VALUES('GV02','Tran Tam Thanh','TS','PGS','Nam','17/12/1965','20/4/2004',4.5,2025000,'HTTT')
INSERT INTO GIAOVIEN VALUES('GV03','Do Nghiem Phung','TS','GS','Nu','08/01/1950','23/9/2004',4,1800000,'CNPM')
INSERT INTO GIAOVIEN VALUES('GV04','Tran Nam Son','TS','PGS','Nam','22/2/1961','01/12/2005',4.5,2025000,'KTMT')
INSERT INTO GIAOVIEN VALUES('GV05','Mai Thanh Danh','ThS','GV','Nam','03/12/1958','01/12/2005',3,1350000,'HTTT')
INSERT INTO GIAOVIEN VALUES('GV06','Tran Doan Hung','TS','GV','Nam','03/11/1953','01/12/2005',4.5,2025000,'KHMT')
INSERT INTO GIAOVIEN VALUES('GV07','Nguyen Minh Tien','ThS','GV','Nam','23/11/1971','03/01/2005',4,1800000,'KHMT')
INSERT INTO GIAOVIEN VALUES('GV08','Le Thi Tran','KS','Null','Nu','26/3/1974','03/01/2005',1.69,760500,'KHMT')
INSERT INTO GIAOVIEN VALUES('GV09','Nguyen To Lan','ThS','GV','Nu','31/12/1966','03/01/2005',4,1800000,'HTTT')
INSERT INTO GIAOVIEN VALUES('GV10','Le Tran Anh Loan','KS','Null','Nu','17/7/1972','03/01/2005',1.86,837000,'CNPM')
INSERT INTO GIAOVIEN VALUES('GV11','Ho Thanh Tung','CN','GV','Nam','01/12/1980','15/5/2005',2.67,1201500,'MTT')
INSERT INTO GIAOVIEN VALUES('GV12','Tran Van Anh','CN','Null','Nu','29/3/1981','15/5/2005',1.69,760500,'CNPM')
INSERT INTO GIAOVIEN VALUES('GV13','Nguyen Linh Dan','CN','Null','Nu','23/5/1980','15/5/2005',1.69,760500,'KTMT')
INSERT INTO GIAOVIEN VALUES('GV14','Truong Minh Chau','ThS','GV','Nu','30/11/1976','15/5/2005',3,1350000,'MTT')
INSERT INTO GIAOVIEN VALUES('GV15','Le Ha Thanh','ThS','GV','Nam','05/04/1978','15/5/2005',3,1350000,'KHMT')

-- HOCVIEN
INSERT INTO HOCVIEN VALUES('K1101','Nguyen Van','A','27/1/1986','Nam','TpHCM','K11')
INSERT INTO HOCVIEN VALUES('K1102','Tran Ngoc','Han','14/3/1986','Nu','Kien Giang','K11')
INSERT INTO HOCVIEN VALUES('K1103','Ha Duy','Lap','18/4/1986','Nam','Nghe An','K11')
INSERT INTO HOCVIEN VALUES('K1104','Tran Ngoc','Linh','30/3/1986','Nu','Tay Ninh','K11')
INSERT INTO HOCVIEN VALUES('K1105','Tran Minh','Long','27/2/1986','Nam','TpHCM','K11')
INSERT INTO HOCVIEN VALUES('K1106','Le Nhat','Minh','24/1/1986','Nam','TpHCM','K11')
INSERT INTO HOCVIEN VALUES('K1107','Nguyen Nhu','Nhut','27/1/1986','Nam','Ha Noi','K11')
INSERT INTO HOCVIEN VALUES('K1108','Nguyen Manh','Tam','27/2/1986','Nam','Kien Giang','K11')
INSERT INTO HOCVIEN VALUES('K1109','Phan Thi Thanh','Tam','27/1/1986','Nu','Vinh Long','K11')
INSERT INTO HOCVIEN VALUES('K1110','Le Hoai','Thuong','02/05/1986','Nu','Can Tho','K11')
INSERT INTO HOCVIEN VALUES('K1111','Le Ha','Vinh','25/12/1986','Nam','Vinh Long','K11')
INSERT INTO HOCVIEN VALUES('K1201','Nguyen Van','B','02/11/1986','Nam','TpHCM','K12')
INSERT INTO HOCVIEN VALUES('K1202','Nguyen Thi Kim','Duyen','18/1/1986','Nu','TpHCM','K12')
INSERT INTO HOCVIEN VALUES('K1203','Tran Thi Kim','Duyen','17/9/1986','Nu','TpHCM','K12')
INSERT INTO HOCVIEN VALUES('K1204','Truong My','Hanh','19/5/1986','Nu','Dong Nai','K12')
INSERT INTO HOCVIEN VALUES('K1205','Nguyen Thanh','Nam','17/4/1986','Nam','TpHCM','K12')
INSERT INTO HOCVIEN VALUES('K1206','Nguyen Thi Truc','Thanh','03/04/1986','Nu','Kien Giang','K12')
INSERT INTO HOCVIEN VALUES('K1207','Tran Thi Bich','Thuy','02/08/1986','Nu','Nghe An','K12')
INSERT INTO HOCVIEN VALUES('K1208','Huynh Thi Kim','Trieu','04/08/1986','Nu','Tay Ninh','K12')
INSERT INTO HOCVIEN VALUES('K1209','Pham Thanh','Trieu','23/2/1986','Nam','TpHCM','K12')
INSERT INTO HOCVIEN VALUES('K1210','Ngo Thanh','Tuan','14/2/1986','Nam','TpHCM','K12')
INSERT INTO HOCVIEN VALUES('K1211','Do Thi','Xuan','03/09/1986','Nu','Ha Noi','K12')
INSERT INTO HOCVIEN VALUES('K1212','Le Thi Phi','Yen','03/12/1986','Nu','TpHCM','K12')
INSERT INTO HOCVIEN VALUES('K1301','Nguyen Thi Kim','Cuc','06/09/1986','Nu','Kien Giang','K13')
INSERT INTO HOCVIEN VALUES('K1302','Truong Thi My','Hien','18/3/1986','Nu','Nghe An','K13')
INSERT INTO HOCVIEN VALUES('K1303','Le Duc','Hien','21/3/1986','Nam','Tay Ninh','K13')
INSERT INTO HOCVIEN VALUES('K1304','Le Quang','Hien','18/4/1986','Nam','TpHCM','K13')
INSERT INTO HOCVIEN VALUES('K1305','Le Thi','Huong','27/3/1986','Nu','TpHCM','K13')
INSERT INTO HOCVIEN VALUES('K1306','Nguyen Thai','Huu','30/3/1986','Nam','Ha Noi','K13')
INSERT INTO HOCVIEN VALUES('K1307','Tran Minh','Man','28/5/1986','Nam','TpHCM','K13')
INSERT INTO HOCVIEN VALUES('K1308','Nguyen Hieu','Nghia','04/08/1986','Nam','Kien Giang','K13')
INSERT INTO HOCVIEN VALUES('K1309','Nguyen Trung','Nghia','18/1/1987','Nam','Nghe An','K13')
INSERT INTO HOCVIEN VALUES('K1310','Tran Thi Hong','Tham','22/4/1986','Nu','Tay Ninh','K13')
INSERT INTO HOCVIEN VALUES('K1311','Tran Minh','Thuc','04/04/1986','Nam','TpHCM','K13')
INSERT INTO HOCVIEN VALUES('K1312','Nguyen Thi Kim','Yen','09/07/1986','Nu','TpHCM','K13')

-- KETQUATHI
INSERT INTO KETQUATHI VALUES('K1101','CSDL',1,'20/7/2006',10,'Dat')
INSERT INTO KETQUATHI VALUES('K1101','CTDLGT',1,'28/12/2006',9,'Dat')
INSERT INTO KETQUATHI VALUES('K1101','THDC',1,'20/5/2006',9,'Dat')
INSERT INTO KETQUATHI VALUES('K1101','CTRR',1,'13/5/2006',9.5,'Dat')
INSERT INTO KETQUATHI VALUES('K1102','CSDL',1,'20/7/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1102','CSDL',2,'27/7/2006',4.25,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1102','CSDL',3,'08/10/2006',4.5,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1102','CTDLGT',1,'28/12/2006',4.5,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1102','CTDLGT',2,'01/05/2007',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1102','CTDLGT',3,'15/1/2007',6,'Dat')
INSERT INTO KETQUATHI VALUES('K1102','THDC',1,'20/5/2006',5,'Dat')
INSERT INTO KETQUATHI VALUES('K1102','CTRR',1,'13/5/2006',7,'Dat')
INSERT INTO KETQUATHI VALUES('K1103','CSDL',1,'20/7/2006',3.5,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1103','CSDL',2,'27/7/2006',8.25,'Dat')
INSERT INTO KETQUATHI VALUES('K1103','CTDLGT',1,'28/12/2006',7,'Dat')
INSERT INTO KETQUATHI VALUES('K1103','THDC',1,'20/5/2006',8,'Dat')
INSERT INTO KETQUATHI VALUES('K1103','CTRR',1,'13/5/2006',6.5,'Dat')
INSERT INTO KETQUATHI VALUES('K1104','CSDL',1,'20/7/2006',3.75,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1104','CTDLGT',1,'28/12/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1104','THDC',1,'20/5/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1104','CTRR',1,'13/5/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1104','CTRR',2,'20/5/2006',3.5,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1104','CTRR',3,'30/6/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1201','CSDL',1,'20/7/2006',6,'Dat')
INSERT INTO KETQUATHI VALUES('K1201','CTDLGT',1,'28/12/2006',5,'Dat')
INSERT INTO KETQUATHI VALUES('K1201','THDC',1,'20/5/2006',8.5,'Dat')
INSERT INTO KETQUATHI VALUES('K1201','CTRR',1,'13/5/2006',9,'Dat')
INSERT INTO KETQUATHI VALUES('K1202','CSDL',1,'20/7/2006',8,'Dat')
INSERT INTO KETQUATHI VALUES('K1202','CTDLGT',1,'28/12/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1202','CTDLGT',2,'01/05/2007',5,'Dat')
INSERT INTO KETQUATHI VALUES('K1202','THDC',1,'20/5/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1202','THDC',2,'27/5/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1202','CTRR',1,'13/5/2006',3,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1202','CTRR',2,'20/5/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1202','CTRR',3,'30/6/2006',6.25,'Dat')
INSERT INTO KETQUATHI VALUES('K1203','CSDL',1,'20/7/2006',9.25,'Dat')
INSERT INTO KETQUATHI VALUES('K1203','CTDLGT',1,'28/12/2006',9.5,'Dat')
INSERT INTO KETQUATHI VALUES('K1203','THDC',1,'20/5/2006',10,'Dat')
INSERT INTO KETQUATHI VALUES('K1203','CTRR',1,'13/5/2006',10,'Dat')
INSERT INTO KETQUATHI VALUES('K1204','CSDL',1,'20/7/2006',8.5,'Dat')
INSERT INTO KETQUATHI VALUES('K1204','CTDLGT',1,'28/12/2006',6.75,'Dat')
INSERT INTO KETQUATHI VALUES('K1204','THDC',1,'20/5/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1204','CTRR',1,'13/5/2006',6,'Dat')
INSERT INTO KETQUATHI VALUES('K1301','CSDL',1,'20/12/2006',4.25,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1301','CTDLGT',1,'25/7/2006',8,'Dat')
INSERT INTO KETQUATHI VALUES('K1301','THDC',1,'20/5/2006',7.75,'Dat')
INSERT INTO KETQUATHI VALUES('K1301','CTRR',1,'13/5/2006',8,'Dat')
INSERT INTO KETQUATHI VALUES('K1302','CSDL',1,'20/12/2006',6.75,'Dat')
INSERT INTO KETQUATHI VALUES('K1302','CTDLGT',1,'25/7/2006',5,'Dat')
INSERT INTO KETQUATHI VALUES('K1302','THDC',1,'20/5/2006',8,'Dat')
INSERT INTO KETQUATHI VALUES('K1302','CTRR',1,'13/5/2006',8.5,'Dat')
INSERT INTO KETQUATHI VALUES('K1303','CSDL',1,'20/12/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1303','CTDLGT',1,'25/7/2006',4.5,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1303','CTDLGT',2,'08/07/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1303','CTDLGT',3,'15/8/2006',4.25,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1303','THDC',1,'20/5/2006',4.5,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1303','CTRR',1,'13/5/2006',3.25,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1303','CTRR',2,'20/5/2006',5,'Dat')
INSERT INTO KETQUATHI VALUES('K1304','CSDL',1,'20/12/2006',7.75,'Dat')
INSERT INTO KETQUATHI VALUES('K1304','CTDLGT',1,'25/7/2006',9.75,'Dat')
INSERT INTO KETQUATHI VALUES('K1304','THDC',1,'20/5/2006',5.5,'Dat')
INSERT INTO KETQUATHI VALUES('K1304','CTRR',1,'13/5/2006',5,'Dat')
INSERT INTO KETQUATHI VALUES('K1305','CSDL',1,'20/12/2006',9.25,'Dat')
INSERT INTO KETQUATHI VALUES('K1305','CTDLGT',1,'25/7/2006',10,'Dat')
INSERT INTO KETQUATHI VALUES('K1305','THDC',1,'20/5/2006',8,'Dat')
INSERT INTO KETQUATHI VALUES('K1305','CTRR',1,'13/5/2006',10,'Dat')

-----------------

-- 1.1. Thêm vào 3 thuộc tính GHICHU, DIEMTB, XEPLOAI cho quan hệ HOCVIEN.

ALTER TABLE dbo.HOCVIEN ADD GHICHU VARCHAR(50), DIEMTB NUMERIC(4,2), XEPLOAI VARCHAR(10);

-- 2. Mã học viên là một chuỗi 5 ký tự, 3 ký tự đầu là mã lớp, 2 ký tự cuối cùng là số thứ tự học viên trong lớp. VD: “K1101”

ALTER TABLE dbo.HOCVIEN ADD CONSTRAINT CHK_MAHV CHECK (SUBSTRING(MAHV,1,3) = MALOP AND SUBSTRING(MAHV,4,2) BETWEEN 1 AND 100);

-- 3. Thuộc tính GIOITINH chỉ có giá trị là “Nam” hoặc “Nu”.

ALTER TABLE dbo.HOCVIEN ADD CONSTRAINT CHK_GTHV CHECK (GIOITINH IN ('Nam', 'Nu'));
ALTER TABLE dbo.GIAOVIEN ADD CONSTRAINT CHK_GTGV CHECK (GIOITINH IN ('Nam', 'Nu'));

-- 4. Điểm số của một lần thi có giá trị từ 0 đến 10 và cần lưu đến 2 số lẽ (VD: 6.22)

ALTER TABLE dbo.KETQUATHI ADD CONSTRAINT CHK_DIEMTHI CHECK (DIEM BETWEEN 0 AND 10 AND RIGHT(CAST(DIEM AS VARCHAR), 3) LIKE '.__');

-- 5. Kết quả thi là “Dat” nếu điểm từ 5 đến 10 và “Khong dat” nếu điểm nhỏ hơn 5.

ALTER TABLE dbo.KETQUATHI ADD CONSTRAINT CHK_LOAI CHECK ((KQUA = 'Dat' AND DIEM BETWEEN 5 AND 10) OR (KQUA = 'Khong dat' AND DIEM < 5));

-- 6. Học viên thi một môn tối đa 3 lần.

ALTER TABLE dbo.KETQUATHI ADD CONSTRAINT CHK_LANTHI CHECK (LANTHI <= 3)

-- 7. Học kỳ chỉ có giá trị từ 1 đến 3.

ALTER TABLE dbo.GIANGDAY ADD CONSTRAINT CHK_HOCKY CHECK (HOCKY BETWEEN 1 AND 3);

-- 8. Học vị của giáo viên chỉ có thể là “CN”, “KS”, “Ths”, ”TS”, ”PTS”

ALTER TABLE dbo.GIAOVIEN ADD CONSTRAINT CHK_HOCVI CHECK (HOCVI IN ('CN', 'KS', 'ThS', 'TS', 'PTS'));

-- 9. Lớp trưởng của một lớp phải là học viên của lớp đó.
GO
-- Trigger: Thêm và sửa TRGLOP
CREATE OR ALTER TRIGGER ins_del_LOPTRUONG_C9
ON LOP
FOR INSERT, UPDATE
AS 
BEGIN
    IF NOT EXISTS
	(
		SELECT *
		FROM inserted, dbo.HOCVIEN
		WHERE 
			inserted.trglop = dbo.HOCVIEN.MAHV
			AND inserted.MALOP = dbo.HOCVIEN.MALOP
	)
	BEGIN
		ROLLBACK TRANSACTION
		PRINT 'Lớp trưởng của một lớp phải là học viên của lớp đó'
	END
END
GO

-- Trigger: xoá 1 HOCVIEN (có thể là lớp trưởng)
CREATE OR ALTER TRIGGER del_HOCVIEN_C9
ON hocvien
FOR DELETE
AS 
BEGIN
    IF EXISTS
	(
		SELECT *
		FROM deleted, dbo.LOP
		WHERE
			deleted.mahv = dbo.LOP.TRGLOP
			AND deleted.malop = dbo.LOP.MALOP
	)
	BEGIN
		ROLLBACK TRANSACTION
		PRINT 'Học viên hiện tại đang là lớp trưởng'
	END
END
GO

-- 10. Trưởng khoa phải là giáo viên thuộc khoa và có học vị “TS” hoặc “PTS”.

-- Trigger: thêm và sửa TRGKHOA
CREATE OR ALTER TRIGGER ins_upd_TRGKHOA_C10
ON khoa
FOR INSERT, UPDATE
AS 
BEGIN
    IF NOT EXISTS
	(
		SELECT * 
		FROM inserted, dbo.GIAOVIEN
		WHERE
			inserted.TRGKHOA = dbo.GIAOVIEN.MAGV
			AND inserted.MAKHOA = dbo.GIAOVIEN.MAKHOA
	)
	BEGIN
	    ROLLBACK TRANSACTION
		PRINT 'Trưởng khoa phải là giáo viên thuộc khoa'
	END
END

-- Trigger: học vị
CREATE OR ALTER TRIGGER upd_hocvi_TRGKHOA_C10
ON KHOA
FOR INSERT, UPDATE
AS 
BEGIN
    IF NOT EXISTS
	(
		SELECT * 
		FROM inserted, dbo.GIAOVIEN
		WHERE
			inserted.TRGKHOA = dbo.GIAOVIEN.MAGV
			AND HOCVI IN ('TS', 'PTS')
	)
	BEGIN
	    ROLLBACK TRANSACTION
		PRINT 'Trưởng khoa phải có học vị là PTS hoặc TS'
	END
END

GO

-- Trigger: Xoá 1 GIAOVIEN (có thể là trưởng khoa)
CREATE OR ALTER TRIGGER del_GIAOVIEN_C10
ON GIAOVIEN
FOR DELETE
AS
BEGIN
    IF EXISTS
	(
		SELECT *
		FROM deleted, inserted, dbo.KHOA
		WHERE
			deleted.magv = dbo.KHOA.TRGKHOA
			AND deleted.makhoa = dbo.KHOA.MAKHOA
	)
	BEGIN
	    ROLLBACK TRANSACTION
		PRINT 'Giáo viên hiện tại đang là trưởng khoa'
	END
END

GO

-- I.11 Học viên ít nhất là 18 tuổi
ALTER TABLE HOCVIEN ADD CONSTRAINT CHECK_TUOI CHECK (YEAR(GETDATE()) - YEAR(NGSINH) >= 18)

-- I.12 Giảng dạy một môn học ngày bắt đầu (TUNGAY) phải nhỏ hơn ngày kết thúc (DENNGAY)
ALTER TABLE GIANGDAY ADD CONSTRAINT CHECK_GIANGDAY CHECK (TUNGAY < DENNGAY)

-- I.13 Giáo viên khi vào làm ít nhất là 22 tuổi
ALTER TABLE GIAOVIEN ADD CONSTRAINT CHECK_TUOILAM CHECK (YEAR(NGVL) - YEAR(NGSINH) >= 22)

-- I.14 Tất cả các môn học đều có số tín chỉ lý thuyết và tín chỉ thực hành chênh lệch nhau không quá 3
ALTER TABLE MONHOC ADD CONSTRAINT CHECK_TINCHI CHECK (ABS(TCLT - TCTH) <= 3)

-------------------------------------------------------------------------------------
-- II. Ngôn ngữ thao tác dữ liệu

-- II.1 Tăng hệ số lương thêm 0.2 cho những giáo viên là trưởng khoa
UPDATE GIAOVIEN
SET HESO = 0.2 + HESO
WHERE MAGV IN (SELECT TRGKHOA FROM KHOA)

-- II.2 Cập nhật giá trị điểm trung bình tất cả các môn học (DIEMTB) của mỗi học viên (tất cả các môn học đều có hệ số 1 và nếu học viên thi một môn nhiều lần, chỉ lấy điểm của lần thi sau cùng)
UPDATE HocVien
SET DiemTB =
(
	SELECT AVG(Diem)
	FROM KetQuaThi
	WHERE LanThi = (SELECT MAX(LanThi) FROM KetQuaThi KQ WHERE MaHV = KetQuaThi.MaHV GROUP BY MaHV)
	GROUP BY MaHV
	HAVING MaHV = HocVien.MaHV
)

-- II.3 Cập nhật giá trị cho cột GHICHU là “Cam thi” đối với trường hợp: học viên có một môn bất kỳ thi lần thứ 3 dưới 5 điểm
UPDATE HOCVIEN
SET GHICHU = 'Cam thi'
WHERE MAHV IN 
(
	SELECT MAHV
	FROM KETQUATHI
	WHERE LANTHI = 3 AND DIEM < 5
)

-- II.4 Cập nhật giá trị cho cột XEPLOAI trong quan hệ HOCVIEN như sau: 
-- Nếu DIEMTB >= 9 thì XEPLOAI = ”XS”
-- Nếu 8 <= DIEMTB < 9 thì XEPLOAI = “G”
-- Nếu 6.5 <= DIEMTB < 8 thì XEPLOAI = “K”
-- Nếu 5 <= DIEMTB < 6.5 thì XEPLOAI = “TB” 
-- Nếu DIEMTB < 5 thì XEPLOAI = ”Y” 

UPDATE HOCVIEN
SET XEPLOAI =
(
	CASE 
		WHEN DIEMTB >= 9 THEN 'XS'
		WHEN DIEMTB >= 8 AND DIEMTB < 9 THEN 'G'
		WHEN DIEMTB >= 6.5 AND DIEMTB < 8 THEN 'K'
		WHEN DIEMTB >= 5 AND DIEMTB < 6.5 THEN 'TB'
		WHEN DIEMTB < 5 THEN 'Y'
	END
)

-------------------------------------------------------------------------------------

--III. Ngôn ngữ truy vấn dữ liệu:
--1. In ra danh sách (mã học viên, họ tên, ngày sinh, mã lớp) lớp trưởng của các lớp.
SELECT MAHV, (HO + ' ' + TEN) HOTEN, HOCVIEN.MALOP
FROM dbo.HOCVIEN, dbo.LOP
WHERE
	dbo.HOCVIEN.MAHV = dbo.LOP.TRGLOP;

--2. In ra bảng điểm khi thi (mã học viên, họ tên , lần thi, điểm số) môn CTRR của lớp “K12”, sắp xếp
--theo tên, họ học viên.
SELECT HOCVIEN.MAHV, (HO + ' ' + TEN) HOTEN, LANTHI, DIEM
FROM dbo.HOCVIEN, dbo.KETQUATHI
WHERE
	dbo.HOCVIEN.MAHV = dbo.KETQUATHI.MAHV
	AND MAMH = 'CTRR'
	AND MALOP = 'K12'
ORDER BY TEN, HO

--3. In ra danh sách những học viên (mã học viên, họ tên) và những môn học mà học viên đó thi lần thứ
--nhất đã đạt.
SELECT HOCVIEN.MAHV, (HO + ' ' + TEN) HOTEN, TENMH
FROM HOCVIEN, dbo.MONHOC, dbo.KETQUATHI
WHERE
	dbo.KETQUATHI.MAMH = dbo.MONHOC.MAMH
	AND dbo.KETQUATHI.MAHV = dbo.HOCVIEN.MAHV
	AND LANTHI = 1 AND KQUA = 'Dat';

--4. In ra danh sách học viên (mã học viên, họ tên) của lớp “K11” thi môn CTRR không đạt (ở lần thi 1).
SELECT HOCVIEN.MAHV, (HO + ' ' + TEN) HOTEN
FROM dbo.HOCVIEN, dbo.KETQUATHI
WHERE
	dbo.KETQUATHI.MAHV = dbo.HOCVIEN.MAHV
	AND MALOP = 'K11' AND MAMH = 'CTRR'
	AND KQUA = 'Khong dat' AND LANTHI = 1;

--5. * Danh sách học viên (mã học viên, họ tên) của lớp “K” thi môn CTRR không đạt (ở tất cả các lần
--thi).
SELECT DISTINCT HOCVIEN.MAHV, (HO + ' ' + TEN) HOTEN
FROM dbo.HOCVIEN, dbo.KETQUATHI
WHERE 
	dbo.HOCVIEN.MAHV = dbo.KETQUATHI.MAHV
	AND MALOP = 'K%'
	AND MAMH = 'CTRR'
	AND NOT EXISTS
	(
		SELECT *
		FROM dbo.KETQUATHI
		WHERE 
			KQUA = 'Dat'
			AND MAMH = 'CTRR'
			AND dbo.KETQUATHI.MAHV = dbo.HOCVIEN.MAHV
	);

--6. Tìm tên những môn học mà giáo viên có tên “Tran Tam Thanh” dạy trong học kỳ 1 năm 2006.
SELECT DISTINCT MONHOC.MAMH, TENMH
FROM dbo.MONHOC, dbo.GIANGDAY, dbo.GIAOVIEN
WHERE
	dbo.MONHOC.MAMH = dbo.GIANGDAY.MAMH
	AND dbo.GIANGDAY.MAGV = dbo.GIAOVIEN.MAGV
	AND HOCKY = 1 AND NAM = 2006;

--7. Tìm những môn học (mã môn học, tên môn học) mà giáo viên chủ nhiệm lớp “K11” dạy trong học
--kỳ 1 năm 2006.
SELECT DISTINCT dbo.MONHOC.MAMH, TENMH
FROM dbo.MONHOC, dbo.LOP, dbo.GIANGDAY
WHERE
	dbo.MONHOC.MAMH = dbo.GIANGDAY.MAMH
	AND dbo.LOP.MAGVCN = dbo.GIANGDAY.MAGV
	AND GIANGDAY.MALOP = 'K11'
	AND HOCKY = 1 AND NAM = 2006;

--8. Tìm họ tên lớp trưởng của các lớp mà giáo viên có tên “Nguyen To Lan” dạy môn “Co So Du Lieu”.
SELECT DISTINCT HO + ' ' + TEN HOTEN_LOPTRUONG 
FROM dbo.LOP, dbo.HOCVIEN, dbo.GIAOVIEN, dbo.GIANGDAY, dbo.MONHOC
WHERE
	dbo.HOCVIEN.MAHV = dbo.LOP.TRGLOP
	AND dbo.GIAOVIEN.MAGV = dbo.GIANGDAY.MAGV
	AND dbo.MONHOC.MAMH = dbo.GIANGDAY.MAMH
	AND dbo.GIANGDAY.MALOP = dbo.LOP.MALOP
	AND HOTEN = 'Nguyen To Lan' AND TENMH = 'Co So Du Lieu';

--9. In ra danh sách những môn học (mã môn học, tên môn học) phải học liền trước môn “Co So Du
--Lieu”.
SELECT MONHOCTRUOC.MAMH, MONHOCTRUOC.TENMH
FROM dbo.DIEUKIEN, dbo.MONHOC AS MONHOCTRUOC, dbo.MONHOC
WHERE 
	DIEUKIEN.MAMH = MONHOC.MAMH
	AND MONHOCTRUOC.MAMH = dbo.DIEUKIEN.MAMH_TRUOC
	AND MONHOC.TENMH = 'Co So Du Lieu'

--10. Môn “Cau Truc Roi Rac” là môn bắt buộc phải học liền trước những môn học (mã môn học, tên
--môn học) nào.
SELECT dbo.MONHOC.MAMH, dbo.MONHOC.TENMH
FROM dbo.MONHOC, dbo.MONHOC AS MONHOCTRUOC, dbo.DIEUKIEN
WHERE
	dbo.DIEUKIEN.MAMH = dbo.MONHOC.MAMH
	AND MONHOCTRUOC.MAMH = dbo.DIEUKIEN.MAMH_TRUOC
	AND MONHOCTRUOC.TENMH = 'Cau Truc Roi Rac'

--11. Tìm họ tên giáo viên dạy môn CTRR cho cả hai lớp “K11” và “K12” trong cùng học kỳ 1 năm 2006.
SELECT HOTEN
FROM dbo.GIAOVIEN, dbo.GIANGDAY
WHERE
	dbo.GIANGDAY.MAGV = dbo.GIAOVIEN.MAGV
	AND MALOP = 'K11'
	AND HOCKY = 1 AND NAM = 2006
INTERSECT
(
	SELECT HOTEN
	FROM dbo.GIAOVIEN, dbo.GIANGDAY
	WHERE 
		dbo.GIANGDAY.MAGV = dbo.GIAOVIEN.MAGV
		AND MALOP = 'K12'
		AND HOCKY = 1 AND NAM = 2006
)

--12. Tìm những học viên (mã học viên, họ tên) thi không đạt môn CSDL ở lần thi thứ 1 nhưng chưa thi
--lại môn này.
SELECT dbo.HOCVIEN.MAHV, (HO + ' ' + TEN) HOTEN
FROM dbo.HOCVIEN, dbo.KETQUATHI
WHERE
	dbo.HOCVIEN.MAHV = dbo.KETQUATHI.MAHV
	AND MAMH = 'CSDL' AND LANTHI = 1 AND KQUA = 'Khong Dat'
	AND NOT EXISTS
	(
		SELECT * 
		FROM dbo.KETQUATHI
		WHERE 
			dbo.KETQUATHI.MAHV = dbo.HOCVIEN.MAHV
			AND LANTHI > 1
	)

--13. Tìm giáo viên (mã giáo viên, họ tên) không được phân công giảng dạy bất kỳ môn học nào.
SELECT MAGV, HOTEN
FROM dbo.GIAOVIEN
WHERE NOT EXISTS
(
	SELECT *
	FROM dbo.GIANGDAY
	WHERE
		dbo.GIANGDAY.MAGV = dbo.GIAOVIEN.MAGV
)

SELECT MaGV, HoTen
FROM GiaoVien
WHERE MaGV NOT IN (SELECT MaGV FROM GiangDay)

--14. Tìm giáo viên (mã giáo viên, họ tên) không được phân công giảng dạy bất kỳ môn học nào thuộc
--khoa giáo viên đó phụ trách.
SELECT MAGV, HOTEN
FROM dbo.GIAOVIEN
WHERE NOT EXISTS
(
	SELECT * 
	FROM dbo.MONHOC
	WHERE 
		dbo.MONHOC.MAKHOA = dbo.GIAOVIEN.MAKHOA
		AND NOT EXISTS
		(
			SELECT * 
			FROM dbo.GIANGDAY
			WHERE 
				dbo.GIANGDAY.MAMH = dbo.MONHOC.MAMH
				AND dbo.GIANGDAY.MAGV = dbo.GIAOVIEN.MAGV
		)
);

--15. Tìm họ tên các học viên thuộc lớp “K11” thi một môn bất kỳ quá 3 lần vẫn “Khong dat” hoặc thi lần
--thứ 2 môn CTRR được 5 điểm.
SELECT DISTINCT (HO + ' ' + TEN) HOTEN
FROM dbo.HOCVIEN, dbo.KETQUATHI
WHERE
	dbo.HOCVIEN.MAHV = dbo.KETQUATHI.MAHV
	AND MaLop = 'K11'
	AND 
	(
		(LanThi = 2 AND Diem = 5)
		OR HocVien.MaHV IN
		(
			SELECT DISTINCT MaHV
			FROM dbo.KETQUATHI
			WHERE KQua = 'Khong Dat'
			GROUP BY MaHV, MaMH
			HAVING COUNT(*) > 3	
		)
	)

--16. Tìm họ tên giáo viên dạy môn CTRR cho ít nhất hai lớp trong cùng một học kỳ của một năm học.
SELECT DISTINCT HOTEN
FROM dbo.GIAOVIEN, dbo.GIANGDAY
WHERE
	dbo.GIAOVIEN.MAGV = dbo.GIANGDAY.MAGV
	AND MAMH = 'CTRR'
GROUP BY dbo.GIAOVIEN.MAGV, HOTEN, HOCKY
HAVING COUNT(*) >= 2

--17. Danh sách học viên và điểm thi môn CSDL (chỉ lấy điểm của lần thi sau cùng).
SELECT dbo.HOCVIEN.MAHV, (HO + ' ' + TEN) HOTEN, DIEM 'Điểm thi môn CSDL sau cùng'
FROM dbo.HOCVIEN, dbo.KETQUATHI
WHERE
	dbo.HOCVIEN.MAHV = dbo.KETQUATHI.MAHV
	AND MAMH = 'CSDL'
	AND LANTHI IN 
	(
		SELECT MAX(LANTHI)
		FROM dbo.KETQUATHI
		WHERE 
			MAMH = 'CSDL'
			AND dbo.KETQUATHI.MAHV = dbo.HOCVIEN.MAHV
			GROUP BY MAHV
	)

--18. Danh sách học viên và điểm thi môn “Co So Du Lieu” (chỉ lấy điểm cao nhất của các lần thi).
SELECT dbo.HOCVIEN.MAHV, (HO + ' ' + TEN) HOTEN, DIEM 'Điểm thi môn Cơ sở dữ liệu cao nhất'
FROM dbo.HOCVIEN, dbo.KETQUATHI, dbo.MONHOC
WHERE
	dbo.HOCVIEN.MAHV = dbo.KETQUATHI.MAHV
	AND	dbo.MONHOC.MAMH = dbo.KETQUATHI.MAMH
	AND TENMH = 'Co So Du Lieu'
	AND DIEM IN
	(
		SELECT MAX(DIEM)
		FROM dbo.KETQUATHI, dbo.MONHOC
		WHERE 
			TENMH = 'Co So Du Lieu'
			AND dbo.HOCVIEN.MAHV = dbo.KETQUATHI.MAHV
			AND dbo.MONHOC.MAMH = dbo.KETQUATHI.MAMH
		GROUP BY MAHV
	)

--19. Khoa nào (mã khoa, tên khoa) được thành lập sớm nhất.
SELECT TOP 1 WITH TIES MAKHOA, TENKHOA
FROM dbo.KHOA
ORDER BY NGTLAP ASC 

SELECT MAKHOA, TENKHOA
FROM dbo.KHOA
WHERE NGTLAP IN (SELECT MIN(NGTLAP) FROM dbo.KHOA)
	
--20. Có bao nhiêu giáo viên có học hàm là “GS” hoặc “PGS”.
SELECT COUNT(MAGV) 'Số giáo viên có học hàm GS hoặc PGS'
FROM dbo.GIAOVIEN 
WHERE HOCHAM IN ('GS', 'PGS')

--21. Thống kê có bao nhiêu giáo viên có học vị là “CN”, “KS”, “Ths”, “TS”, “PTS” trong mỗi khoa.
SELECT MAKHOA, HOCVI, COUNT(*) 'Số lượng giáo viên'
FROM dbo.GIAOVIEN
GROUP BY MAKHOA, HOCVI
ORDER BY MAKHOA ASC

--22. Mỗi môn học thống kê số lượng học viên theo kết quả (đạt và không đạt).
SELECT MAMH, KQUA, COUNT(*) 'Số lượng học viên'
FROM dbo.KETQUATHI
GROUP BY MAMH, KQUA
ORDER BY MAMH ASC

--23. Tìm giáo viên (mã giáo viên, họ tên) là giáo viên chủ nhiệm của một lớp, đồng thời dạy cho lớp đó ít
--nhất một môn học.
SELECT DISTINCT dbo.GIAOVIEN.MAGV, HOTEN
FROM dbo.GIAOVIEN, dbo.GIANGDAY, dbo.LOP
WHERE
	dbo.GIAOVIEN.MAGV = dbo.GIANGDAY.MAGV
	AND dbo.LOP.MALOP = dbo.GIANGDAY.MALOP
	AND dbo.LOP.MAGVCN = dbo.GIAOVIEN.MAGV

--24. Tìm họ tên lớp trưởng của lớp có sỉ số cao nhất.
SELECT HO + ' ' + TEN 'Họ tên lớp trưởng của lớp có sỉ số cao nhất'
FROM dbo.HOCVIEN, dbo.LOP
WHERE
	dbo.LOP.TRGLOP = dbo.HOCVIEN.MAHV
	AND dbo.LOP.SISO IN (SELECT MAX(SISO) FROM dbo.LOP)

--25. * Tìm họ tên những LOPTRG thi không đạt quá 3 môn (mỗi môn đều thi không đạt ở tất cả các lần
--thi).
SELECT HO + ' ' + TEN 'Họ tên lớp trưởng thi không đạt quá 3 môn'
FROM dbo.HOCVIEN, dbo.LOP, dbo.KETQUATHI
WHERE
	dbo.LOP.TRGLOP = dbo.HOCVIEN.MAHV
	AND	dbo.HOCVIEN.MAHV = dbo.KETQUATHI.MAHV
	AND KQUA = 'Khong dat'
GROUP BY TRGLOP, HO, TEN
HAVING COUNT(*) > 3

--26. Tìm học viên (mã học viên, họ tên) có số môn đạt điểm 9, 10 nhiều nhất.
SELECT TOP 1 WITH TIES dbo.HOCVIEN.MAHV, HO + ' ' + TEN HOTEN
FROM dbo.HOCVIEN, dbo.KETQUATHI
WHERE
	dbo.HOCVIEN.MAHV = dbo.KETQUATHI.MAHV
	AND DIEM >= 9
GROUP BY HOCVIEN.MAHV, HO, TEN
ORDER BY COUNT(*) DESC

SELECT DISTINCT dbo.HOCVIEN.MAHV, HO + ' ' + TEN HOTEN
FROM dbo.HOCVIEN, dbo.KETQUATHI
WHERE
	dbo.HOCVIEN.MAHV = dbo.KETQUATHI.MAHV
	AND DIEM >= 9
GROUP BY HOCVIEN.MAHV, HO, TEN
HAVING COUNT(*) >= ALL 
(
	SELECT COUNT(*) 
	FROM dbo.KETQUATHI 
	WHERE DIEM >= 9 
	GROUP BY MAHV
)
	
--27. Trong từng lớp, tìm học viên (mã học viên, họ tên) có số môn đạt điểm 9,10 nhiều nhất.
SELECT MALOP, MAHV, HOTEN
FROM
(
	SELECT MALOP, dbo.HOCVIEN.MAHV, Ho + ' ' + Ten HoTen, COUNT(*) SOLUONGDIEM, 
	RANK() OVER (PARTITION BY MALOP ORDER BY COUNT(*) DESC) AS XEPHANG
	FROM dbo.HOCVIEN, dbo.KETQUATHI
	WHERE
		dbo.HOCVIEN.MAHV = dbo.KETQUATHI.MAHV
		AND Diem >= 9
	GROUP BY
		MALOP, dbo.HOCVIEN.MAHV, HO, TEN
) AS A
WHERE
	A.XEPHANG = 1


--28. Trong từng học kỳ của từng năm, mỗi giáo viên phân công dạy bao nhiêu môn học, bao nhiêu lớp.
SELECT MAGV, COUNT(DISTINCT MAMH) 'Số môn học', COUNT(DISTINCT MALOP) 'Số lớp'
FROM dbo.GIANGDAY
GROUP BY MAGV

--29. Trong từng học kỳ của từng năm, tìm giáo viên (mã giáo viên, họ tên) giảng dạy nhiều nhất.
SELECT A.MAGV, HOTEN, HOCKY, NAM
FROM dbo.GIAOVIEN,
(
	SELECT HOCKY, NAM, MAGV, 
	RANK() OVER
	(
		PARTITION BY HOCKY, NAM
		ORDER BY COUNT(*) DESC
	) AS XEPHANG
	FROM dbo.GIANGDAY
	GROUP BY HOCKY, NAM, MAGV
) AS A
WHERE
	A.MAGV = dbo.GIAOVIEN.MAGV
	AND A.XEPHANG = 1
ORDER BY A.NAM, A.HOCKY

--30. Tìm môn học (mã môn học, tên môn học) có nhiều học viên thi không đạt (ở lần thi thứ 1) nhất.
SELECT TOP 1 WITH TIES dbo.MONHOC.MAMH, TENMH
FROM dbo.MONHOC, dbo.KETQUATHI
WHERE 
	dbo.MONHOC.MAMH = dbo.KETQUATHI.MAMH
	AND LANTHI = 1
	AND KQUA = 'Khong dat'
GROUP BY MONHOC.MAMH, TENMH
ORDER BY COUNT(*) DESC

--31. Tìm học viên (mã học viên, họ tên) thi môn nào cũng đạt (chỉ xét lần thi thứ 1).
SELECT DISTINCT HOCVIEN.MAHV, HO + ' ' + TEN HOTEN
FROM HOCVIEN, dbo.KETQUATHI
WHERE
	dbo.HOCVIEN.MAHV = dbo.KETQUATHI.MAHV
	AND NOT EXISTS
	(
		SELECT * 
		FROM dbo.KETQUATHI
		WHERE
			LANTHI = 1
			AND KQUA = 'Khong dat'
			AND dbo.KETQUATHI.MAHV = dbo.HOCVIEN.MAHV
	)

--32. * Tìm học viên (mã học viên, họ tên) thi môn nào cũng đạt (chỉ xét lần thi sau cùng).
SELECT DISTINCT dbo.HOCVIEN.mahv, ho + ' ' + ten HOTEN
FROM dbo.HOCVIEN, dbo.KETQUATHI
WHERE
	dbo.HOCVIEN.MAHV = dbo.KETQUATHI.MAHV
	AND NOT EXISTS
	(
		SELECT *
		FROM dbo.KETQUATHI
		WHERE 
			LANTHI IN 
			(
				SELECT MAX(LANTHI)
				FROM dbo.KETQUATHI
				WHERE dbo.KETQUATHI.MAHV = dbo.HOCVIEN.MAHV
				GROUP BY MAHV
			)
		AND KQUA = 'Khong dat'
		AND dbo.HOCVIEN.MAHV = dbo.KETQUATHI.mahv
	)

--33. * Tìm học viên (mã học viên, họ tên) đã thi tất cả các môn đều đạt (chỉ xét lần thi thứ 1).
SELECT dbo.HOCVIEN.MAHV, HO + ' ' + TEN HOTEN
FROM dbo.HOCVIEN
WHERE NOT EXISTS
(
	SELECT *
	FROM dbo.KETQUATHI
	WHERE 
		LANTHI = 1
		AND KQUA = 'Dat'
		AND NOT EXISTS
		(
			SELECT * 
			FROM dbo.MONHOC
			WHERE
				dbo.KETQUATHI.MAHV = dbo.HOCVIEN.MAHV
				AND dbo.MONHOC.MAMH = dbo.KETQUATHI.MAMH
		)
)

--34. * Tìm học viên (mã học viên, họ tên) đã thi tất cả các môn đều đạt (chỉ xét lần thi sau cùng).
SELECT dbo.HOCVIEN.MAHV, ho + ' ' + ten HOTEN
FROM dbo.HOCVIEN
WHERE NOT EXISTS
(
	SELECT * 
	FROM dbo.MONHOC
	WHERE NOT EXISTS
	(
		SELECT *
		FROM dbo.KETQUATHI
		WHERE
			LANTHI IN
			(
				SELECT MAX(LANTHI)
				FROM dbo.KETQUATHI
				WHERE dbo.HOCVIEN.maHV = dbo.KETQUATHI.MAHV
				GROUP BY MAHV
			)
			AND LANTHI = 1
			AND KQUA = 'Dat'
			AND dbo.KETQUATHI.MAHV = dbo.HOCVIEN.MAHV
			AND dbo.MONHOC.MAMH = dbo.KETQUATHI.MAMH
	)
)

--35. ** Tìm học viên (mã học viên, họ tên) có điểm thi cao nhất trong từng môn (lấy điểm ở lần thi sau
--cùng).
SELECT MAMH, MAHV, HOTEN
FROM
(
	SELECT MAMH, dbo.HOCVIEN.MAHV, Ho + ' ' + Ten HoTen, 
	RANK() OVER (PARTITION BY MAMH ORDER BY MAX(DIEM) DESC) AS XEPHANG
	FROM dbo.HOCVIEN, dbo.KETQUATHI
	WHERE	
		dbo.HOCVIEN.MAHV = dbo.KETQUATHI.MAHV
		AND LANTHI IN
		(
			SELECT MAX(LANTHI)
			FROM dbo.KETQUATHI
			WHERE dbo.KETQUATHI.MAHV = dbo.HOCVIEN.MAHV
			GROUP BY MAHV
		)
	GROUP BY
		MAMH, HocVien.MaHV, HO, TEN
) AS A
WHERE
	A.XEPHANG = 1