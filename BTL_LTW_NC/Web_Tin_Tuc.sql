SELECT * FROM tbl_taikhoan
SELECT * FROM tbl_quyen
SELECT * FROM tbl_User
SELECT * FROM tbl_Trangthai
SELECT * FROM tbl_danhmuc
SELECT * FROM tbl_loaitin
SELECT * FROM tbl_baiviet
SELECT * FROM tbl_hinhanh

DELETE FROM tbl_baiviet where PK_sMabaiviet = 'BV-163977300'
DELETE FROM tbl_baiviet where PK_sMabaiviet = 'BV-1284553813'
DELETE FROM tbl_baiviet where PK_sMabaiviet = 'BV-129262091'
--------------------------------------------Trang chủ----------------------------------------

INSERT INTO tbl_loaitin values
(N'Sự kiện nóng', 10),
(N'Quốc hội', 10),
(N'Công nghệ', 10),
(N'Tin vắn', 10);

SELECT * FROM tbl_danhmuc
SELECT * FROM tbl_loaitin


-----proceduce get tin nóng----------
alter proc get_tinnong
as
begin
	SELECT * FROM tbl_baiviet
	INNER JOIN tbl_loaitin on tbl_baiviet.FK_MaLT = tbl_loaitin.PK_iMaLT 
	INNER JOIN tbl_danhmuc on tbl_loaitin.FK_iMaDM = tbl_danhmuc.PK_iMaDM
	where tbl_loaitin.sTenLT = N'Sự kiện nóng'
	and tbl_baiviet.FK_TrangThai = 2
	ORDER BY tbl_baiviet.sNgaydang DESC
end
exec get_tinnong

---- get danh muc menu----
alter proc get_danhmuc_menu
as
begin
	select * from tbl_danhmuc
end

-- get loại tin left

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
	order by tbl_baiviet.sNgaydang DESC
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
select * from [dbo].[tbl_loaitin] where [FK_iMaDM] = 10

--ProC xóa bài viết
create proc xoa_Baiviet
@maBaiviet nvarchar(255)
as
begin
	delete from tbl_baiviet
	where tbl_baiviet.PK_sMabaiviet = @maBaiviet
end

-- Lấy danh sách loại tin
alter proc get_loaitin(@id int)
as
begin
	select * from dbo.tbl_loaitin where FK_iMaDM = @id
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
	select [PK_sMabaiviet],[sTieude],[sTomtatnoidung],[sNgaydang]  
	from tbl_baiviet 
	where FK_TrangThai=1 and FK_MaLT=@MaLoaiTin
	order by tbl_baiviet.sNgaydang DESC
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

