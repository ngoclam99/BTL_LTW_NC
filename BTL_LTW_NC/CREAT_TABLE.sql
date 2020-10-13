CREATE DATABASE Web_Tin_Tuc
on(
	name = web_tin_tuc_data,
	filename = "E:\TaiLieuHocTap\HOU\CongNgheThongTin\Programing\LTW_NC\13_10\BTL_LTW_NC\web_tin_tuc.mdf" 
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