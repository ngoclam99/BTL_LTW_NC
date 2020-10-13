CREATE DATABASE Web_Tin_Tuc
on(
	name = web_tin_tuc_data,
	filename = "D:\TAI LIEU HOC TAP\LAP TRINH WEB NANG CAO\BTL NHOM 8\web_tin_tuc.mdf" 
);
USE Web_Tin_Tuc;

CREATE TABLE tbl_taikhoan
(
	PK_sMaTK	NVARCHAR(100) NOT NULL,
	FK_sMaUser	NVARCHAR(100) NOT NULL,
	sTenTK		NVARCHAR(100) NOT NULL,
	sMatKhau	NVARCHAR(100) NOT NULL,
	FK_iMaQuyen	int NOT NULL,
	CONSTRAINT PK_sMaTK PRIMARY KEY(PK_sMaTK)
)

CREATE TABLE tbl_quyen
(
	PK_iMaQuyen	int identity NOT NULL,
	sTenQuen	NVARCHAR(100) NOT NULL,
	CONSTRAINT PK_iMaQuyen PRIMARY KEY(PK_iMaQuyen)
)

CREATE TABLE tbl_User
(
	PK_sUser	NVARCHAR(100) NOT NULL,
	sTenUser	NVARCHAR(50) NOT NULL,
	sEmail		NVARCHAR(100) NULL,
	sSDT		NVARCHAR(20) NULL,
	CONSTRAINT PK_sUser PRIMARY KEY(PK_sUser)
)

CREATE TABLE tbl_Trangthai
(
	PK_iMaTT		int identity NOT NULL,
	sTenTrangThai	NVARCHAR(50) NOT NULL,
	CONSTRAINT PK_iMaTT PRIMARY KEY(PK_iMaTT)
)

CREATE TABLE tbl_danhmuc
(
	PK_iMaDM	int identity NOT NULL,
	sTenDM		NVARCHAR(100) NOT NULL,
	sDoUuTien	NVARCHAR(50) NULL,
	CONSTRAINT PK_iMaDM PRIMARY KEY(PK_iMaDM),
	sRouter varchar(255)
)

CREATE TABLE tbl_loaitin
(
	PK_iMaLT	int identity NOT NULL,
	sTenLT		NVARCHAR(100) NOT NULL,
	FK_iMaDM	int NULL,
	CONSTRAINT PK_iMaLT PRIMARY KEY(PK_iMaLT)
)

CREATE TABLE tbl_baiviet
(
	PK_sMabaiviet	NVARCHAR(255) NOT NULL,
	FK_MaLT			int NOT NULL,
	sTenbaiviet		NVARCHAR(255) NOT NULL,
	sTieude			NVARCHAR(255) NULL,
	sTomtatnoidung	NVARCHAR(255) NULL,
	sNoidung		NTEXT NULL,
	FK_User_dang	NVARCHAR(100) NOT NULL,
	sNgaydang		NVARCHAR(50) NULL,
	sAnhdaidien		text NULL,
	FK_TrangThai	int NULL,
	sNgayduyet		NVARCHAR(50) NULL,
	FK_User_duyet   NVARCHAR(50) NULL,
	CONSTRAINT PK_sMabaiviet PRIMARY KEY(PK_sMabaiviet)
)

CREATE TABLE tbl_hinhanh
(
	PK_ID_Anh		int identity NOT NULL,
	sTenAnh			NVARCHAR(255) NOT NULL,
	sCaption		NVARCHAR(255)  NULL,
	sGhichu			NVARCHAR(255)  NULL,
	FK_sMabaiviet	NVARCHAR(255) NOT NULL,
	CONSTRAINT PK_ID_Anh PRIMARY KEY(PK_ID_Anh)
)

ALTER TABLE tbl_taikhoan ADD CONSTRAINT FK_iMaQuyen FOREIGN KEY(FK_iMaQuyen) REFERENCES tbl_quyen(PK_iMaQuyen);

ALTER TABLE tbl_taikhoan ADD CONSTRAINT FK_FK_sMaUser FOREIGN KEY(FK_sMaUser) REFERENCES tbl_User(PK_sUser);

ALTER TABLE tbl_loaitin ADD CONSTRAINT FK_iMaDM FOREIGN KEY(FK_iMaDM) REFERENCES tbl_danhmuc(PK_iMaDM);

ALTER TABLE tbl_baiviet ADD CONSTRAINT FK_MaLT FOREIGN KEY(FK_MaLT) REFERENCES tbl_loaitin(PK_iMaLT);

ALTER TABLE tbl_baiviet ADD CONSTRAINT FK_TrangThai FOREIGN KEY(FK_TrangThai) REFERENCES tbl_Trangthai(PK_iMaTT);

ALTER TABLE tbl_baiviet ADD CONSTRAINT FK_User_dang FOREIGN KEY(FK_User_dang) REFERENCES tbl_User(PK_sUser);

ALTER TABLE tbl_hinhanh ADD CONSTRAINT FK_sMabaiviet FOREIGN KEY(FK_sMabaiviet) REFERENCES tbl_baiviet(PK_sMabaiviet);
INSERT INTO tbl_quyen values
(N'Admin'),
(N'Người đăng');

INSERT INTO tbl_Trangthai values
(N'Chưa duyệt'),
(N'Đã duyệt');

INSERT INTO tbl_User values
('USER-001', N'Nguyễn Văn Lâm',null, null),
('USER-002', N'Nguyễn Văn Hoàng',null, null),
('USER-003', N'Trần Mạnh Hùng',null, null),
('USER-004', N'Nguyễn Bích Ngọc', null, null),
('USER-005', N'Nguyễn Thị Hằng', null, null);

INSERT INTO tbl_taikhoan values
('TK-0001', 'USER-001', 'USER-001', 1,2)

INSERT INTO tbl_danhmuc values
(N'Trang chủ', 1,null),
(N'Chính trị', 2,null),
(N'Thời sự', 3,null),
(N'Giải trí', 4,null),
(N'Giáo dục', 5,null),
(N'Đời sống', 6,null),
(N'Pháp luật', 7,null),
(N'Thể thao', 8, null),
(N'Công nghệ', 9, null),
(N'Sức khỏe', 10, null);

INSERT INTO tbl_loaitin values
(N'Sự kiện nóng', 1),
(N'Tin mới nhất', 1),
(N'Tin văn hóa', 1),
(N'Thị trường tiêu dùng', 1);

INSERT INTO tbl_baiviet values
(N'BV-001', 1,
 N'Sự kiện nóng Nền tảng trợ lý ảo tiếng Việt giúp
tối ưu 40% nguồn lực chăm sóc khách hàng Nền tảng trợ lý ảo
tiếng Việt giúp tối ưu 40% nguồn lực chăm sóc khách hàng',
N'Sự kiện nóng Nền tảng trợ lý ảo tiếng Việt giúp tối ưu 40% 
nguồn lực chăm sóc khách hàng Nền tảng trợ lý ảo tiếng Việt 
giúp tối ưu 40% nguồn lực chăm sóc khách hàng', 
N'Nền tảng trợ lý ảo tiếng Việt Viettel Cyberbot vừa được Bộ TT&TT ra mắt. Giải pháp “Make in Vietnam” 
này giúp các doanh nghiệp tối ưu tới 40% nguồn lực chăm sóc khách hàng, đồng thời nâng cao', null,
<<<<<<< HEAD
'USER-001', '27/09/2020',N'17.jpg', 2, '27/09/2020','hung');
=======
'USER-001', '27/09/2020',N'17.jpg', 2, '27/09/2020','USER-001');
>>>>>>> master

INSERT INTO tbl_baiviet values
(N'BV-002', 1,
 N'Doanh nghiệp Việt vươn mình, tiến thẳng lên 4.0 nhờ chuyển đổi số', 
N'Nhiều doanh nghiệp khẳng định chuyển đổi số giờ đây không 
còn là một khái niệm mơ hồ mà đã trở thành điều bắt buộc phải thực hiện.
 Tuy vậy, vẫn còn nhiều việc phải làm để thúc đẩy hơn nữa quá trình chuyển đổi số tại Việt Nam.',
N'Nhiều doanh nghiệp khẳng định chuyển đổi số giờ đây không 
còn là một khái niệm mơ hồ mà đã trở thành điều bắt buộc phải thực hiện.
 Tuy vậy, vẫn còn nhiều việc phải làm để thúc đẩy hơn nữa quá trình chuyển đổi số tại Việt Nam.', null,
'USER-001', '28/09/2020',N'18.jpg', 2, '28/09/2020','USER-001');

INSERT INTO tbl_baiviet values
(N'BV-003', 1,
 N'Công nghệ AI được sử dụng trong phòng chống lao phổi tại Việt Nam', 
N'Việc đưa công nghệ AI vào lĩnh vực y tế sẽ giúp tăng khả năng sống sót của bệnh nhân lao. Điều này cũng đúng với cả các bệnh lý khác như ung thư, tim mạch,...',
N'Trí tuệ nhân tạo hay AI là một khái niệm phức tạp dùng để chỉ khả năng nhận thức và suy nghĩ của máy móc. Việc phát triển công nghệ AI xuất phát từ nhu cầu tăng năng lực tính toán trong bối cảnh lượng dữ liệu cần xử lý ngày một lớn. ', null,
'USER-001', '28/09/2020',N'19.jpg', 2, '28/09/2020','USER-001');

INSERT INTO tbl_baiviet values
(N'BV-004', 1,
 N'Giải pháp chuyển đổi số Make in Vietnam sẽ giúp ích cho người dân Đồng Tháp', 
N'Không chỉ Đồng Tháp, nhiều địa phương khác trên cả nước đang tích cực tìm biện pháp để tiến hành chuyển đổi số. Tuy nhiên, rất nhiều nơi trong số đó hiện không biết phải bắt đầu từ đâu.',
N'Chuyển đổi số là câu chuyện của người đứng đầu...', null,
'USER-001', '28/09/2020',N'20.jpg', 2, '28/09/2020','USER-001');

INSERT INTO tbl_baiviet values
(N'BV-005', 1,
 N'Hơn 100.000 người học trực tuyến bằng nền tảng Make in Vietnam', 
N'Sự ra đời của các nền tảng học trực tuyến Make in Vietnam mang tới một công cụ đắc lực giúp mọi người có thể học ở bất cứ nơi đâu, nhờ vậy rút ngắn khoảng cách giữa nông thôn và thành thị.',
N'Cùng với sự phát triển của công nghệ và Internet, học trực tuyến hay E-learning đã ra đời và trở thành một xu hướng tất yếu trên thế giới cũng như ở Việt Nam...', null,
'USER-001', '28/09/2020',N'21.jpg', 2, '28/09/2020','USER-001');

INSERT INTO tbl_baiviet values
(N'BV-007', 1,
 N'Công cụ “Make in Vietnam” giúp nhận diện mã độc mã hóa dữ liệu tống tiền', 
N'Công cụ “Make in Vietnam” giúp nhận diện mã độc mã hóa dữ liệu tống tiền',
N'Giải mã, nhận diện mã độc mã hóa tống tiền (ransomware) và Kiểm tra tập tin độc hại là 2 công cụ “Make in Vietnam” mới được Trung tâm Giám sát an toàn không gian mạng quốc gia cung cấp miễn phí cho cộng đồng trên trang Khonggianmang.vn. ', null,
'USER-001', '13/09/2020',N'22.jpg', 2, '14/09/2020','USER-001');

INSERT INTO tbl_baiviet values
(N'BV-008', 1,
 N'Một góc nhìn về Việt Nam số', 
N'Một góc nhìn về Việt Nam số',
N'Cuộc sống của mỗi người dân Việt Nam đang thay đổi từng ngày bởi sự xuất hiện của những sản phẩm công nghệ mới. Đó là những sản phẩm công nghệ Make in Vietnam.  ', null,
'USER-001', '07/09/2020',N'24.jpg', 2, '14/09/2020','USER-001');

INSERT INTO tbl_baiviet values
(N'BV-009', 1,
 N'Bộ TT&TT ra mắt nền tảng công nghệ trí tuệ nhân tạo dành cho người Việt', 
N'Bộ TT&TT ra mắt nền tảng công nghệ trí tuệ nhân tạo dành cho người Việt',
N'Nền tảng công nghệ trí tuệ nhân tạo của Viettel - Viettel AI Open Platform vừa được Bộ TT&TT giới thiệu, công bố bảo trợ truyền thông. Đây là một trong những nền tảng “Make in Vietnam” nhằm thúc đẩy nhanh chuyển đổi số tại Việt Nam.', null,
'USER-001', '07/09/2020',N'25.jpg', 2, '14/09/2020','USER-001');

INSERT INTO tbl_baiviet values
(N'BV-010', 1,
 N'Việt Nam được đánh giá cao về phát triển Chính phủ điện tử', 
N'Việt Nam được đánh giá cao về phát triển Chính phủ điện tử',
N'Chính phủ điện tử Việt Nam đã có những bước tiến đáng khích lệ. Một số nội dung về Chính phủ số như Trung tâm điều hành đô thị thông minh, Hệ thống báo cáo, phân tích số liệu đã triển khai thí điểm và bước đầu có kết quả.', null,
'USER-001', '07/09/2020',N'26.jpg', 2, '14/09/2020','USER-001');

INSERT INTO tbl_baiviet values
(N'BV-011', 1,
 N'Định danh điện tử hàng triệu người nhờ giải pháp Make in VietNam', 
N'Định danh điện tử hàng triệu người nhờ giải pháp Make in VietNam',
N'Phân biệt thật giả, nhận dạng thông tin tự động qua CMTND, không cần phải nhập liệu khi đăng ký dịch vụ, đó là những tiện ích của phần mềm định danh khách hàng điện tử (eKYC) do một doanh nghiệp Việt Nam phát triển.', null,
'USER-001', '07/09/2020',N'27.jpg', 2, '14/09/2020','USER-001');

INSERT INTO tbl_baiviet values
(N'BV-012', 4,
 N'Định danh điện tử hàng triệu người nhờ giải pháp Make in VietNam', 
N'Định danh điện tử hàng triệu người nhờ giải pháp Make in VietNam',
N'Phân biệt thật giả, nhận dạng thông tin tự động qua CMTND, không cần phải nhập liệu khi đăng ký dịch vụ, đó là những tiện ích của phần mềm định danh khách hàng điện tử (eKYC) do một doanh nghiệp Việt Nam phát triển.', null,
'USER-001', '07/09/2020',N'27.jpg', 2, '14/09/2020','USER-001');

INSERT INTO tbl_baiviet values
(N'BV-013', 4,
 N'Định danh điện tử hàng triệu người nhờ giải pháp Make in VietNam', 
N'Định danh điện tử hàng triệu người nhờ giải pháp Make in VietNam',
N'Phân biệt thật giả, nhận dạng thông tin tự động qua CMTND, không cần phải nhập liệu khi đăng ký dịch vụ, đó là những tiện ích của phần mềm định danh khách hàng điện tử (eKYC) do một doanh nghiệp Việt Nam phát triển.', null,
'USER-001', '07/09/2020',N'27.jpg', 2, '14/09/2020','USER-001');

INSERT INTO tbl_baiviet values
(N'BV-014', 4,
 N'Định danh điện tử hàng triệu người nhờ giải pháp Make in VietNam', 
N'Định danh điện tử hàng triệu người nhờ giải pháp Make in VietNam',
N'Phân biệt thật giả, nhận dạng thông tin tự động qua CMTND, không cần phải nhập liệu khi đăng ký dịch vụ, đó là những tiện ích của phần mềm định danh khách hàng điện tử (eKYC) do một doanh nghiệp Việt Nam phát triển.', null,
'USER-001', '07/09/2020',N'27.jpg', 2, '14/09/2020','USER-001');

--------------------------------------------Trang chủ----------------------------------------
-----proceduce get tin nóng----------
alter proc get_tinnong
as
begin
	SELECT TOP 1 * FROM tbl_baiviet, tbl_loaitin 
	where tbl_baiviet.FK_MaLT = tbl_loaitin.PK_iMaLT 
	and tbl_loaitin.sTenLT = N'Sự kiện nóng'
	and tbl_baiviet.FK_TrangThai = 2
	ORDER BY tbl_baiviet.sNgaydang DESC
end
exec get_tinnong
---- get danh muc menu----
create proc get_danhmuc_menu
as
begin
	select * from tbl_danhmuc
end

<<<<<<< HEAD
=======
-- get loại tin left
>>>>>>> 7def3ae9f94237e8762d4e6ab84e2f1be4c53006
alter proc get_tin_right
as
begin
	SELECT  TOP 4 * FROM tbl_baiviet, tbl_loaitin 
	where tbl_baiviet.FK_MaLT = tbl_loaitin.PK_iMaLT 
	and tbl_loaitin.sTenLT = N'Sự kiện nóng'
	and tbl_baiviet.FK_TrangThai = 2
	and tbl_baiviet.PK_sMabaiviet != (
		SELECT TOP 1 tbl_baiviet.PK_sMabaiviet FROM tbl_baiviet, tbl_loaitin 
		where tbl_baiviet.FK_MaLT = tbl_loaitin.PK_iMaLT 
		and tbl_loaitin.sTenLT = N'Sự kiện nóng'
		
		ORDER BY tbl_baiviet.sNgaydang DESC
	)
end

alter proc get_tin_down
as
begin
	SELECT  TOP 6 * FROM tbl_baiviet, tbl_loaitin 
	where tbl_baiviet.FK_MaLT = tbl_loaitin.PK_iMaLT 
	and tbl_loaitin.sTenLT = N'Tin văn hóa'
	and tbl_baiviet.FK_TrangThai = 2
	ORDER BY NEWID()
end
 
SELECT * FROM tbl_baiviet

exec get_tin_down

---- tin mới nhất-----
alter proc get_tin_new
as
begin
	SELECT  TOP 3 * FROM tbl_baiviet, tbl_loaitin 
	where tbl_baiviet.FK_MaLT = tbl_loaitin.PK_iMaLT 
	and tbl_loaitin.sTenLT = N'Tin mới nhất'
	and tbl_baiviet.FK_TrangThai = 2
	ORDER BY tbl_baiviet.sNgaydang DESC
end

---- tin 1 tin bất kì-----
create proc get_danhmuc_rand
as
begin
	select TOP 1 * from tbl_danhmuc
	ORDER BY NEWID()
end

alter proc get_baiviet_rand
@id int
as
begin
	SELECT  TOP 3 * FROM tbl_baiviet, tbl_loaitin,tbl_danhmuc 
	where tbl_baiviet.FK_MaLT = tbl_loaitin.PK_iMaLT 
	and tbl_danhmuc.PK_iMaDM = tbl_loaitin.FK_iMaDM
	and tbl_loaitin.FK_iMaDM = @id
	and tbl_baiviet.FK_TrangThai = 2
end
<<<<<<< HEAD

alter proc get_thitruong_tieudung
as
begin
	SELECT * FROM tbl_loaitin, tbl_baiviet 
	WHERE tbl_loaitin.PK_iMaLT = tbl_baiviet.FK_MaLT and tbl_loaitin.PK_iMaLT = 4 
	and tbl_baiviet.FK_TrangThai = 2
end

select * from tbl_Trangthai

----proceducelogin
alter PROC proc_login
@user nvarchar(50),
@pass nvarchar(50)
AS
BEGIN
	SELECT * FROM tbl_taikhoan, tbl_User,tbl_quyen
	WHERE tbl_taikhoan.sTenTK = @user and tbl_quyen.PK_iMaQuyen = tbl_taikhoan.FK_iMaQuyen
	AND tbl_taikhoan.sMatKhau = @pass 
	and tbl_taikhoan.FK_sMaUser = tbl_User.PK_sUser

END

SELECT * FROM tbl_danhmuc
SELECT * FROM tbl_loaitin
SELECT * FROM tbl_User
SELECT * FROM tbl_taikhoan
SELECT * FROM tbl_quyen
SELECT * FROM tbl_baiviet
=======
--------------------------------------------Trang chủ----------------------------------------

--------------------------------------------Trang con----------------------------------------
---- lấy loại tin đầu tiên ứng với danh mục-----
create proc get_loaitin_trangcon(@id int)
as
begin
	select TOP 1 * from tbl_loaitin where FK_iMaDM = @id
end

----lấy loại tin tiếp theo sau loại tin đầu tiên ứng với danh mục
create proc get_loaitin2_right_trangcon(@id int)
as
begin
	SELECT TOP 1 PK_iMaLT,sTenLT,FK_iMaDM FROM tbl_loaitin
	WHERE FK_iMaDM = @id AND PK_iMaLT NOT IN (
				SELECT TOP 1 PK_iMaLT FROM tbl_loaitin WHERE FK_iMaDM = @id)
end

---lấy 3 bài của loại tin thứ 2 hiện ra bên content-mid theo danh mục tương ứng
alter proc get_baiviet_loaitin2_right_trangcon(@id int)
as
begin
	select top 3 * from tbl_baiviet,tbl_loaitin 
	where tbl_baiviet.FK_MaLT = tbl_loaitin.PK_iMaLT and tbl_loaitin.FK_iMaDM = @id and
	tbl_loaitin.PK_iMaLT = (SELECT TOP 1 PK_iMaLT FROM tbl_loaitin
							WHERE FK_iMaDM = @id AND PK_iMaLT NOT IN (SELECT TOP 1 PK_iMaLT FROM tbl_loaitin WHERE FK_iMaDM = @id))
		and tbl_baiviet.FK_TrangThai = 2
	ORDER BY NEWID()
end

-- get tin bên phải của body trái (lấy 4 tin tiếp theo k phải là tin đầu để hiện ra)
alter proc get_tin_rightofleft_trangcon(@id int)
as
begin
	SELECT  TOP 4 * FROM tbl_baiviet,tbl_loaitin
	WHERE tbl_baiviet.FK_MaLT = tbl_loaitin.PK_iMaLT AND 
	tbl_baiviet.PK_sMabaiviet NOT IN (SELECT TOP 1 tbl_baiviet.PK_sMabaiviet FROM tbl_baiviet,tbl_loaitin
	WHERE tbl_baiviet.FK_MaLT = tbl_loaitin.PK_iMaLT
	AND FK_iMaDM = @id AND tbl_baiviet.FK_MaLT = (SELECT TOP 1 PK_iMaLT FROM tbl_loaitin WHERE FK_iMaDM = @id))
	and tbl_baiviet.FK_TrangThai = 2
	AND FK_iMaDM = @id AND tbl_baiviet.FK_MaLT = (SELECT TOP 1 PK_iMaLT FROM tbl_loaitin WHERE FK_iMaDM = @id)
end

--get tin đầu tiên theo loại tin đầu tiên và danh mục tương ứng
alter proc get_tinfisrt_theoloaitindau_trangcon(@id int)
as
begin
	SELECT  TOP 1 * FROM tbl_baiviet,tbl_loaitin
	WHERE tbl_baiviet.FK_MaLT = tbl_loaitin.PK_iMaLT
	AND FK_iMaDM = @id AND tbl_baiviet.FK_MaLT = (SELECT TOP 1 PK_iMaLT FROM tbl_loaitin WHERE FK_iMaDM = @id)
	and tbl_baiviet.FK_TrangThai = 2
end

--get 6 tin từ dưới lên theo loại tin đầu tiên và danh mục tương ứng
alter proc get_tindown_theoloaitin_trangcon(@id int)
as
begin
	SELECT  TOP 6 * FROM tbl_baiviet,tbl_loaitin
	WHERE tbl_baiviet.FK_MaLT = tbl_loaitin.PK_iMaLT
	AND FK_iMaDM = @id AND tbl_baiviet.FK_MaLT = (SELECT TOP 1 PK_iMaLT FROM tbl_loaitin WHERE FK_iMaDM = @id)
	AND tbl_baiviet.PK_sMabaiviet NOT IN (SELECT TOP 4 tbl_baiviet.PK_sMabaiviet FROM tbl_baiviet,tbl_loaitin
							WHERE tbl_baiviet.FK_MaLT = tbl_loaitin.PK_iMaLT
							AND FK_iMaDM = @id AND tbl_baiviet.FK_MaLT = (SELECT TOP 1 PK_iMaLT FROM tbl_loaitin WHERE FK_iMaDM = @id))
	and tbl_baiviet.FK_TrangThai = 2
	ORDER BY tbl_baiviet.sNgaydang DESC
end

---lấy loại tin dưới cùng tương ứng với danh mục
create proc get_loaitin_rightbottom_trangcon(@id int)
as
begin
	select top 1 * from tbl_loaitin
	where FK_iMaDM = @id
	order by PK_iMaLT DESC
end

---lấy 3 bài của loại tin dưới cùng
alter proc get_tinofloaitin_rightbottom_trangcon(@id int)
as
begin
	select top 3 * from tbl_baiviet,tbl_loaitin
	where tbl_loaitin.PK_iMaLT = tbl_baiviet.FK_MaLT and FK_iMaDM = @id 
	and FK_MaLT = (select top 1 PK_iMaLT from tbl_loaitin where FK_iMaDM = @id order by PK_iMaLT DESC)
	and tbl_baiviet.FK_TrangThai = 2
	order by NEWID()
end

select * from dbo.tbl_loaitin
select * from dbo.tbl_baiviet

select * from dbo.tbl_User
select * from dbo.tbl_taikhoan

delete from tbl_User where PK_sUser = 'xuantu'
delete from tbl_taikhoan where PK_sMaTK = 'xuantu'

--------------------------------------------Trang con----------------------------------------


---get danh sách bài viết----------

alter proc get_dsbaiviet
as
begin
	SELECT tbl_baiviet.*, tbl_loaitin.sTenLT, tbl_Trangthai.sTenTrangThai, tbl_User.sTenUser
	from tbl_baiviet
	inner join tbl_Trangthai on tbl_baiviet.FK_TrangThai = tbl_Trangthai.PK_iMaTT
	inner join tbl_loaitin on tbl_baiviet.FK_MaLT = tbl_loaitin.PK_iMaLT
	inner join tbl_User on tbl_baiviet.FK_User_dang = tbl_User.PK_sUser
	order by tbl_baiviet.FK_TrangThai DESC
	--SELECT tbl_baiviet.* 
	--FROM tbl_baiviet, tbl_User, tbl_Trangthai 
	--where tbl_Trangthai.PK_iMaTT = tbl_baiviet.FK_TrangThai
	--and tbl_baiviet.FK_User_duyet = tbl_User.PK_sUser
	--and  tbl_baiviet.FK_User_dang = tbl_User.PK_sUser 
end


--------------------------------------------Đăng kí------------------------------------------

create proc get_dangki
	@MaTK NVARCHAR(100), 
	@TaiKhoan NVARCHAR(100),
	@Hoten NVARCHAR(100),
	@MatKhau NVARCHAR(100), 
	@quyen INT, 
	@Email NVARCHAR(100),
	@Sdt NVARCHAR(100)
as
begin
	begin
	insert into tbl_User
	values(@TaiKhoan,@Hoten,@Email,@Sdt)
	end
	
	begin
	insert into tbl_taikhoan
	values(@MaTK,@TaiKhoan,@TaiKhoan,@MatKhau,@quyen)
	end
end

alter proc get_quyen
as
begin
	select * from tbl_quyen where [PK_iMaQuyen] = 2
end
--------------------------------------------Đăng kí------------------------------------------
<<<<<<< HEAD
select * from tbl_User
--------------------------------------------Quản lý bài viết------------------------------------------
--ProC xóa bài viết
create proc xoa_Baiviet
@maBaiviet nvarchar(255)
as
begin
	delete from tbl_baiviet
	where tbl_baiviet.PK_sMabaiviet = @maBaiviet
end
-- Lấy danh sách loại tin
create proc get_loaitin
as
begin
	select * from dbo.tbl_loaitin
end
-- Lấy bài viết dựa vào ID
create proc layBaiviet_theoID
@id nvarchar(255)
as
begin
	select * 
	from tbl_baiviet 
	where PK_sMabaiviet = @id
end

--- proc Thêm, sửa vài viết
alter proc them_Suabaiviet
@PK_sMabaiviet nvarchar(255)= null,
@FK_MaLT int= null,
@sTenbaiviet nvarchar(255)= null,
@sTieude nvarchar(255)= null,
@sTomtatnoidung nvarchar(255)= null,
@sNoidung ntext= null,
@FK_User_dang nvarchar(100)= null,
@sNgaydang nvarchar(50)= null,
@sAnhdaidien nvarchar(50)= null,
@FK_TrangThai int= null,
@sNgayduyet nvarchar(50)= null,
@FK_User_duyet nvarchar(100)= null,
@hanhdong char(20) = null
as
begin
	if(@hanhdong = 'them')
		begin
			insert into tbl_baiviet
			values(@PK_sMabaiviet,@FK_MaLT,@sTenbaiviet,@sTieude,@sTomtatnoidung,@sNoidung,@FK_User_dang,@sNgaydang,@sAnhdaidien,1,@sNgayduyet,@FK_User_duyet)
		end
	if(@hanhdong = 'sua')
		begin
		if(@sAnhdaidien = 'khongco')
			begin
						update tbl_baiviet
			set FK_MaLT			= @FK_MaLT,
				sTenbaiviet		= @sTenbaiviet,
				sTieude			= @sTieude,
				sTomtatnoidung	= @sTomtatnoidung,
				sNoidung		= @sNoidung,
				FK_User_dang	= @FK_User_dang,
				sNgaydang		= @sNgaydang,
				sNgayduyet		= @sNgayduyet,
				FK_User_duyet	= @FK_User_duyet
			where PK_sMabaiviet	= @PK_sMabaiviet
			end
		else
			begin
			update tbl_baiviet
			set FK_MaLT			= @FK_MaLT,
				sTenbaiviet		= @sTenbaiviet,
				sTieude			= @sTieude,
				sTomtatnoidung	= @sTomtatnoidung,
				sNoidung		= @sNoidung,
				FK_User_dang	= @FK_User_dang,
				sNgaydang		= @sNgaydang,
				sAnhdaidien		= @sAnhdaidien,
				sNgayduyet		= @sNgayduyet,
				FK_User_duyet	= @FK_User_duyet
			where PK_sMabaiviet	= @PK_sMabaiviet
			end
		end
end

--------------------------------------------Đổi mật khẩu------------------------------------------
--thủ tục đổi mật khẩu
create proc get_doimatkhau(@user nvarchar(100),@passOld nvarchar(100),@passNew nvarchar(100))
as
begin
	update tbl_taikhoan
	set sMatKhau = @passNew
	where FK_sMaUser = @user and sMatKhau = @passOld
end

update tbl_taikhoan
set sMatKhau = '123'
where FK_sMaUser = 'xuantu' and sMatKhau = '1'

select * from dbo.tbl_User
select * from dbo.tbl_taikhoan
--------------------------------------------Đổi mật khẩu------------------------------------------

--------------------------------------------Tìm kiếm------------------------------------------
--thủ tục tìm kiếm
create proc get_timkiem(@id nvarchar(255))
as
begin
	select * from tbl_baiviet
	where sTenbaiviet like N'%' + @id + '%'
end

--thủ tục đếm số kết quả
create proc get_kqtimkiem(@id nvarchar(255))
as
begin
	select COUNT(*) as KQ from tbl_baiviet
	where sTenbaiviet like N'%' + @id + '%'
end

select * from dbo.tbl_baiviet
--------------------------------------------Tìm kiếm------------------------------------------

>>>>>>> master

create proc get_chiTietBaiViet(@id nvarchar (255))
as
begin
	select tbl_baiviet.*, tbl_danhmuc.[sTenDM] from tbl_loaitin 
	right join tbl_baiviet on tbl_baiviet.[FK_MaLT] = tbl_loaitin.[PK_iMaLT]
	inner join tbl_danhmuc on tbl_danhmuc.PK_iMaDM = tbl_loaitin.FK_iMaDM
	where [PK_sMabaiviet]=@id
end
exec get_chiTietBaiViet @id='BV-001'
--thêm tài khoản có quyền admin thực hiện duyệt
INSERT INTO tbl_User values
('ADMIN-001', N'ADMIN',null, null)

INSERT INTO tbl_taikhoan values
('TK-0002','ADMIN-001','ADMIN-001',1,1)

select *from tbl_taikhoan
select *from tbl_User
select *from tbl_Trangthai
select *from tbl_baiviet

---- lấy danh sách tin cần duyêtj
alter proc sp_DanhSachTinDuyet
@MaLoaiTin int
as
begin
	select [PK_sMabaiviet],[sTieude],[sTomtatnoidung],[sNgaydang]  from tbl_baiviet where FK_TrangThai=1 and FK_MaLT=@MaLoaiTin
end
exec sp_DanhSachTinDuyet @MaLoaiTin=1

--- Duyệt bài viết----
alter proc sp_duyet
@maBaiViet nvarchar (255),
@ThoiGianDuyet nvarchar (50),
@idNguoiDuyet nvarchar (100)
as
begin
	update tbl_baiviet 
	SET  [FK_TrangThai]=2, [sNgayduyet]=@ThoiGianDuyet, [FK_User_duyet]=@idNguoiDuyet
	WHERE PK_sMabaiviet = @maBaiViet;
end

--Bài viết không được duyệt sẽ bị xóa khỏi bảng bài viết
create proc sp_xoaBaiViet
@maBaiViet nvarchar (255)
as
begin
	delete from tbl_baiviet  where PK_sMabaiviet = @maBaiViet;
end

-- hiển thị trang con đầy đủ thông tin cho đỡ trống thôi nhé
update tbl_baiviet set sNoidung=N'Bộ Quốc phòng chỉ đạo các đơn vị và lực lượng chức năng tiếp tục phối hợp với Bộ GTVT tổ chức tìm kiếm cứu nạn các thuyền viên mất tích và bị mắc kẹt; kịp thời điều động lực lượng, phương tiện tham gia tìm kiếm, cứu nạn.
UBND tỉnh Quảng Trị phối hợp với Bộ GTVT rà soát các phương tiện vận tải biển đang neo đậu và hoạt động khu vực vùng biển tỉnh Quảng Trị, kịp thời huy động tham gia tìm kiếm cứu nạn các thuyền viên.
Ủy ban Quốc gia Ứng phó sự cố thiên tai và Tìm kiếm Cứu nạn theo chức năng, nhiệm vụ được giao phối hợp với Bộ GTVT, UBND tỉnh Quảng Trị và cơ quan chức năng tăng cường chỉ đạo công tác tìm kiếm cứu nạn đạt hiệu quả; chỉ đạo lực lượng tham gia tìm kiếm cứu nạn phải bảo đảm an toàn tuyệt đối cho người và phương tiện.
Hiện nay tình hình thời tiết ở các tỉnh miền Trung rất phức tạp, yêu cầu các Bộ: Quốc phòng, GTVT, NN&PTNT, Công Thương, TN&MT và UBND các tỉnh miền Trung chủ động, sẵn sàng các lực lượng, phương tiện ứng phó với các tình huống nguy cấp có thể xảy ra với phương châm “4 tại chỗ”.'
where tbl_baiviet.PK_sMabaiviet='BV-001'
DELETE  from tbl_baiviet
