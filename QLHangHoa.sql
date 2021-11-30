Create table Nhacungcap 
(
maNCC		varchar(5),
tenNCC	varchar(20), 
trangthai 	numeric(2),
thanhpho	varchar(30),
Constraint PKNcc primary key (maNCC)
)


create table Phutung 
(
 maPT		varchar(5),
 tenPT	varchar(10),
 mausac	varchar(10),
 khoiluong	float,
 thanhpho	 varchar(30),
 Constraint PKPt Primary Key (maPT) 
)


Create table Vanchuyen 
(
maNCC		varchar(5) ,
maPT		varchar(5),
soluong	numeric(5), 
Constraint PKVc primary key (maNCC,maPT),
Constraint FKShip1 foreign key (maNCC) references Nhacungcap (maNCC),
Constraint FKShip2 foreign key (maPT) references Phutung (maPT)
)


insert into Nhacungcap values ('S1','Smith','20','London')
insert into Nhacungcap values ('S2','Jones','10','Paris')
insert into Nhacungcap values ('S3','Blake','30','Paris')
insert into Nhacungcap values ('S4','Clark','20','London')
insert into Nhacungcap values ('S5','Adams','30','Athens')


Insert  into Phutung values  ( 'P1' , 'Nut' , 'Red' , 12.0 , 'London')
Insert  into Phutung values  ( 'P2' , 'Bolt' , 'Green', 17.0 , 'Paris')
Insert  into Phutung values  ( 'P3' , 'Screw' , 'Blue', 17.0 , 'Oslo')
Insert  into Phutung values  ( 'P4' , 'Screw' , 'Red' , 14.0 , 'London')
Insert  into Phutung values  ( 'P5' , 'Cam' , 'Blue' , 12.0 , 'Paris')
Insert  into Phutung values  ( 'P6' , 'Cog' , 'Red' , 19.0 , 'London')



Insert into Vanchuyen values ('S1','P1',300)
Insert into Vanchuyen values ('S1','P2',200)
Insert into Vanchuyen values ('S1','P3',400)
Insert into Vanchuyen values ('S1','P4',200)
Insert into Vanchuyen values ('S1','P5',100)
Insert into Vanchuyen values ('S1','P6',100)
Insert into Vanchuyen values ('S2','P1',300)
Insert into Vanchuyen values ('S2','P2',400)
Insert into Vanchuyen values ('S3','P2',200)
Insert into Vanchuyen values ('S4','P2',200)
Insert into Vanchuyen values ('S4','P4',300)
Insert into Vanchuyen values ('S4','P5',400)

-- 1. Hiển thị thông tin (maNCC, tenNCC, thanhpho) của tất cả nhà cung cấp.

SELECT maNCC, tenNCC, thanhpho FROM Nhacungcap;

-- 2. Hiển thị thông tin của tất cả các phụ tùng.

SELECT * FROM Phutung;

-- 3. Hiển thị thông tin các nhà cung cấp ở thành phố London.

SELECT * FROM Nhacungcap
WHERE thanhpho = 'London';

-- 4. Hiển thị mã phụ tùng, tên và màu sắc của tất cả các phụ tùng ở thành phố Paris.

SELECT maPT, tenPT, mausac FROM Phutung
WHERE thanhpho = 'Paris';

-- 5. Hiển thị mã phụ tùng, tên, khối lượng của những phụ tùng có khối lượng lớn hơn 15.

SELECT maPT, tenPT, khoiluong FROM Phutung
WHERE khoiluong > 15;

-- 6. Tìm những phụ tùng (maPT, tenPt, mausac) có khối lượng lớn hơn 15, không phải màu đỏ (red). 

SELECT maPT, tenPT, mausac FROM Phutung
WHERE khoiluong > 15 AND NOT(mausac = 'Red');

SELECT maPT, tenPT, mausac FROM Phutung
WHERE khoiluong > 15
INTERSECT
SELECT maPT, tenPT, mausac FROM Phutung
WHERE NOT(mausac = 'Red');

-- 7. Tìm những phụ tùng (maPT, tenPt, mausac) có khối lượng lớn hơn 15, màu sắc khác màu đỏ (red) và xanh (green).

SELECT maPT, tenPT, mausac FROM Phutung
WHERE khoiluong > 15 AND mausac NOT in ('Red', 'Green');


-- 8. Hiển thị những phụ tùng (maPT, tenPT, khối lượng) có khối lượng lớn hơn 15 và nhỏ hơn 20, sắp xếp theo tên phụ tùng.

SELECT maPT, tenPT, mausac FROM Phutung
WHERE (khoiluong > 15 and khoiluong < 20) ORDER BY tenPT


-- 9. Hiển thị những phụ tùng (maPT, tenPT) được vận chuyển bởi nhà cung cấp có mã số S1. Không hiển thị kết quả trùng. (sử dụng phép kết).

SELECT DISTINCT PT.maPT, tenPT FROM Phutung PT JOIN Vanchuyen VC ON PT.maPT = VC.maPT
WHERE maNCC = 'S1'


-- 10. Hiển thị những nhà cung cấp vận chuyển phụ tùng có mã là P1 (sử dụng phép kết).
SELECT NCC.maNCC, tenNCC FROM Nhacungcap NCC INNER JOIN Vanchuyen VC ON NCC.maNCC = VC.maNCC
WHERE maPT = 'P1';

SELECT * FROM Nhacungcap
SELECT * FROM Vanchuyen

-- 11. Hiển thị thông tin nhà cung cấp ở thành phố London và có vận chuyển phụ tùng của thành phố London. Không hiển thị kết quả trùng. (Sử dụng phép kết)
SELECT DISTINCT NCC.MANCC, TENNCC 
FROM (NHACUNGCAP NCC INNER JOIN VANCHUYEN VC ON NCC.MANCC = VC.MANCC)
	INNER JOIN PHUTUNG PT ON PT.MAPT = VC.MAPT
WHERE NCC.THANHPHO = 'LONDON' AND PT.THANHPHO = 'LONDON';

-- 12. Lặp lại câu 9 nhưng sử dụng toán tử IN.
-- 9. Hiển thị những phụ tùng (maPT, tenPT) được vận chuyển bởi nhà cung cấp có mã số S1. Không hiển thị kết quả trùng. (sử dụng phép kết).

SELECT DISTINCT MAPT, TENPT FROM PHUTUNG
WHERE MAPT IN (SELECT MAPT FROM VANCHUYEN WHERE MANCC = 'S1')

-- 13. Lặp lại câu 10 nhưng sử dụng toán tử IN
-- 10. Hiển thị những nhà cung cấp vận chuyển phụ tùng có mã là P1 (sử dụng phép kết).
SELECT DISTINCT MANCC, TENNCC FROM NHACUNGCAP WHERE MANCC IN (SELECT MANCC FROM VANCHUYEN WHERE MAPT = 'P1');

-- 14. Lặp lại câu 9 nhưng sử dụng toán tử EXISTS
-- 9. Hiển thị những phụ tùng (maPT, tenPT) được vận chuyển bởi nhà cung cấp có mã số S1. Không hiển thị kết quả trùng. (sử dụng phép kết).
SELECT DISTINCT MAPT, TENPT FROM PHUTUNG 
WHERE EXISTS (SELECT * FROM VANCHUYEN WHERE	PHUTUNG.MAPT = VANCHUYEN.MAPT AND MANCC = 'S1')

-- 15. Lặp lại câu 10 nhưng sử dụng toán tử EXISTS
-- 10. Hiển thị những nhà cung cấp vận chuyển phụ tùng có mã là P1 (sử dụng phép kết).
SELECT MANCC, TENNCC FROM NHACUNGCAP
WHERE EXISTS (SELECT * FROM VANCHUYEN WHERE NHACUNGCAP.MANCC = VANCHUYEN.MANCC AND MAPT = 'P1')

-- 16. Lặp lại câu 11 nhưng sử dụng truy vấn con. Sử dụng toán tử IN.
-- 11. Hiển thị thông tin nhà cung cấp ở thành phố London và có vận chuyển phụ tùng của thành phố London. Không hiển thị kết quả trùng. (Sử dụng phép kết)

SELECT DISTINCT NCC.MANCC, NCC.TENNCC FROM NHACUNGCAP NCC
WHERE MANCC IN (SELECT VC.MANCC FROM VANCHUYEN VC, PHUTUNG PT WHERE VC.MAPT = PT.MAPT AND NCC.MANCC = VC.MANCC AND PT.THANHPHO = 'LONDON' AND NCC.THANHPHO = 'LONDON');

SELECT DISTINCT MANCC, TENNCC FROM NHACUNGCAP
WHERE thanhpho = 'London' and thanhpho IN (SELECT thanhpho from vanchuyen, phutung where THANHPHO = 'LONDON' and vanchuyen.maPT = Phutung.maPT);

-- 17. Lặp lại câu 11 nhưng dùng truy vấn con. Sử dụng toán tử EXISTS.
-- 11. Hiển thị thông tin nhà cung cấp ở thành phố London và có vận chuyển phụ tùng của thành phố London. Không hiển thị kết quả trùng. (Sử dụng phép kết)

SELECT DISTINCT NCC.MANCC, NCC.TENNCC FROM NHACUNGCAP NCC
WHERE THANHPHO = 'LONDON' AND EXISTS (SELECT * FROM VANCHUYEN VC, PHUTUNG PT WHERE VC.MAPT = PT.MAPT AND NCC.maNCC = vc.maNCC and PT.THANHPHO = 'LONDON')

-- 18. Tìm nhà cung cấp chưa vận chuyển bất kỳ phụ tùng nào. Sử dụng NOT IN.
SELECT DISTINCT maNCC, tenNCC FROM Nhacungcap 
WHERE maNCC NOT IN (SELECT maNCC FROM Vanchuyen);

-- 19. Tìm nhà cung cấp chưa vận chuyển bất kỳ phụ tùng nào. Sử dụng NOT EXISTS.
SELECT DISTINCT maNCC, tenNCC FROM Nhacungcap
WHERE NOT EXISTS (SELECT * FROM Vanchuyen WHERE Nhacungcap.maNCC = Vanchuyen.maNCC);

-- 20. Tìm nhà cung cấp chưa vận chuyển bất kỳ phụ tùng nào. Sử dụng outer JOIN (Phép kết ngoài)
SELECT DISTINCT Nhacungcap.maNCC, tenNCC FROM Nhacungcap LEFT JOIN Vanchuyen ON Nhacungcap.maNCC = Vanchuyen.maNCC
WHERE Vanchuyen.maPT is null;

SELECT * FROM dbo.Vanchuyen
--21. Có tất cả bao nhiêu nhà cung cấp?
SELECT COUNT(MANCC) 'SL_NCC' FROM dbo.Nhacungcap;

--22. Có tất cả bao nhiêu nhà cung cấp ở London?
SELECT COUNT(MANCC)
FROM dbo.Nhacungcap
GROUP BY thanhpho
HAVING thanhpho = 'London';

SELECT * FROM dbo.Nhacungcap

SELECT COUNT(maNCC)
FROM dbo.Nhacungcap
WHERE thanhpho = 'London';

--23. Hiển thị trị giá cao nhất, thấp nhất của trangthai của các nhà cung cấp.
SELECT MAX(trangthai) 'MAX_TT', MIN(trangthai) 'MIN_TT'
FROM dbo.Nhacungcap

--24. Hiển thị giá trị cao nhất, thấp nhất của trangthai trong table
--nhacungcap ở thành phố London.
SELECT MAX(trangthai) 'max_TT_LONDON', MIN(trangthai) 'min_TT_LONDON'
FROM dbo.Nhacungcap
WHERE thanhpho = 'london';

SELECT MAX(trangthai) maxTT, MIN(trangthai) minTT
FROM dbo.Nhacungcap
GROUP BY thanhpho
HAVING thanhpho = 'London';

--25. Mỗi nhà cung cấp vận chuyển bao nhiêu phụ tùng? Chỉ hiển thị mã nhà
--cung cấp, tổng số phụ tùng đã vận chuyển.
SELECT dbo.Nhacungcap.mancc, SUM(soluong) SL
FROM dbo.Nhacungcap LEFT JOIN dbo.Vanchuyen
ON dbo.Vanchuyen.maNCC = dbo.Nhacungcap.maNCC
GROUP BY dbo.Nhacungcap.maNCC

SELECT * FROM dbo.Nhacungcap
SELECT * FROM dbo.Vanchuyen

--26. Mỗi nhà cung cấp vận chuyển bao nhiêu phụ tùng? Hiển thị mã nhà cung
--cấp, tên, thành phố của nhà cung cấp và tổng số phụ tùng đã vận chuyển
SELECT dbo.Nhacungcap.mancc, tenncc, thanhpho, SUM(soluong) SL_PT
FROM dbo.Nhacungcap LEFT JOIN dbo.Vanchuyen
ON Vanchuyen.maNCC = Nhacungcap.maNCC
GROUP BY dbo.Nhacungcap.maNCC, tenNCC, thanhpho

--27. Nhà cung cấp nào đã vận chuyển tổng cộng nhiều hơn 500 phụ tùng? Chỉ
--hiển thị mã nhà cung cấp
SELECT maNCC
FROM dbo.Vanchuyen
GROUP BY maNCC
HAVING SUM(soluong) > 500

--28. Nhà cung cấp nào đã vận chuyển nhiều hơn 300 phụ tùng màu đỏ (red).
--Chỉ hiển thị mã nhà cung cấp.
SELECT maNCC
FROM dbo.Vanchuyen INNER JOIN dbo.Phutung
ON dbo.Vanchuyen.maPT = dbo.Phutung.maPT AND mausac = 'red'
GROUP BY maNCC
HAVING SUM(soluong) > 300

--29. Nhà cung cấp nào đã vận chuyển nhiều hơn 300 phụ tùng màu đỏ (red).
--Hiển thị mã nhà cung cấp, tên, thành phố và số lượng phụ tùng màu đỏ đã vận chuyển.
SELECT NCC.maNCC, tenNCC, NCC.thanhpho, sum(soluong) SLPT
FROM Nhacungcap NCC,Vanchuyen VC, Phutung PT
WHERE VC.maPT = PT.maPT AND NCC.maNCC=VC.maNCC
AND mausac = 'red'
GROUP BY NCC.maNCC, tenNCC, NCC.thanhpho
HAVING sum(soluong) > 300

SELECT NCC.MANCC, tenNCC, NCC.thanhpho, SUM(SOLUONG) 'SL_RED'
FROM (Vanchuyen VC JOIN Phutung PT ON VC.maPT = PT.maPT AND mausac = 'RED') JOIN NHACUNGCAP NCC ON NCC.MANCC = VC.MANCC
GROUP BY NCC.MANCC, TENNCC, NCC.thanhpho
HAVING SUM(SOLUONG) > 300

--30. Có bao nhiêu nhà cung cấp ở mỗi thành phố.
SELECT thanhpho, COUNT(maNCC) SL_NCC
FROM dbo.Nhacungcap
GROUP BY thanhpho

SELECT * FROM dbo.Nhacungcap

--31. Nhà cung cấp nào đã vận chuyển nhiều phụ tùng nhất. Hiển thị tên nhà
--cung cấp và số lượng phụ tùng đã vận chuyển.
SELECT TOP 1 tenNCC, SUM(soluong) SL_PT
FROM dbo.Nhacungcap, dbo.Vanchuyen
WHERE dbo.Nhacungcap.maNCC = dbo.Vanchuyen.maNCC
GROUP BY dbo.Nhacungcap.maNCC, tenNCC

SELECT * FROM dbo.Nhacungcap
SELECT * FROM dbo.Vanchuyen

--32. Thành phố nào có cả nhà cung cấp và phụ tùng..
SELECT DISTINCT dbo.Nhacungcap.thanhpho
FROM dbo.Nhacungcap, dbo.Vanchuyen, dbo.Phutung
WHERE dbo.Nhacungcap.maNCC = dbo.Vanchuyen.maNCC
AND dbo.Phutung.maPT = dbo.Vanchuyen.maPT
AND Nhacungcap.thanhpho = dbo.Phutung.thanhpho

--33. Viết câu lệnh SQL để insert nhà cung cấp mới: S6, Duncan, 30, Paris.
INSERT INTO dbo.Nhacungcap
(
    maNCC,
    tenNCC,
    trangthai,
    thanhpho
)
VALUES
(   'S6',   -- maNCC - varchar(5)
    'Duncan', -- tenNCC - varchar(20)
    30, -- trangthai - numeric(2, 0)
    'Paris'  -- thanhpho - varchar(30)
)

--34. Viết câu lệnh SQL để thay đổi thanh phố S6 (ở câu 33) thành Sydney.
UPDATE dbo.Nhacungcap
SET	thanhpho = 'Sydney'
WHERE maNCC = 'S6'

--35. Viết câu lệnh SQL tăng trangthai của nhà cung cấp ở London lên thêm 10.
UPDATE dbo.Nhacungcap
SET	trangthai = trangthai + 10
WHERE thanhpho = 'London'

--36. Viết câu lệnh SQL xoá nhà cung cấp S6
DELETE FROM dbo.Nhacungcap
WHERE maNCC = 'S6'
