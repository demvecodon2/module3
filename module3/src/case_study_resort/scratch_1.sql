create database quan_ly_resort;
use quan_ly_resort;
create table vi_tri(
    id_vi_tri int primary key auto_increment,
    ten_vi_tri varchar(50)
);
create table trinh_do(
    id_trinh_do int primary key auto_increment,
    trinh_do varchar(50)
);
create table bo_phan(
    id_bo_phan int primary key auto_increment,
    ten_bo_phan varchar(50)
);
create table nhan_vien(
    id_nhan_vien int primary key auto_increment,
    ho_ten varchar(100),
    id_vi_tri int,
    id_trinh_do int,
    id_bo_phan int,
    ngay_sinh date,
    so_can_cuoc varchar(30),
    luong varchar(15),
    so_dien_thoai varchar(20),
    email varchar(45),
    dia_chi varchar(100),
    FOREIGN KEY (id_vi_tri) REFERENCES vi_tri (id_vi_tri),
    FOREIGN KEY (id_trinh_do) REFERENCES trinh_do (id_trinh_do),
    FOREIGN KEY (id_bo_phan) REFERENCES bo_phan (id_bo_phan)
);
insert into nhan_vien (id_nhan_vien,ho_ten,id_vi_tri,id_trinh_do,id_bo_phan,ngay_sinh,
    so_can_cuoc,luong,so_dien_thoai,email,dia_chi)
values (1,'hieu',1,1,1,'2001-01-07','12312412','12341','12412311','123ssd@gmail.com','quảng tri');


create table loai_khach(
    id_loai_khach int primary key auto_increment,
    ten_loai_khach varchar(100)
);

create table khach_hang(
    id_khach_hang int primary key auto_increment,
    id_loai_khach int,
    ho_ten varchar(100),
    ngay_sinh date,
    so_can_cuoc varchar(30),
    so_dien_thoai varchar(30),
    emai varchar(50),
    dia_chi varchar(100),
    foreign key (id_loai_khach) references loai_khach(id_loai_khach)
);

create table kieu_thue(
    id_dang_thue int primary key auto_increment,
    dang_thue varchar(50),
    gia int
);
create table loai_dich_vu(
    id_loai_dich_vu int primary key auto_increment,
    ten_loai_dich_vu varchar(100)
);
create table dich_vu(
    id_dich_vu int primary key auto_increment,
    ten_dich_vu varchar(100),
    dien_tich int,
    so_tang int,
    so_nguoi_toi_da varchar(50),
    chi_phi_thue varchar(50),
    id_kieu_thue int,
    id_loai_dich_vu int,
    trang_thai varchar(50),
    foreign key (id_kieu_thue) references kieu_thue (id_dang_thue),
    foreign key (id_loai_dich_vu) references loai_dich_vu(id_loai_dich_vu)
);
create table hop_dong(
    id_hop_dong int primary key auto_increment,
    id_nhan_vien int,
    id_khach_hang int,
    id_dich_vu int,
    ngay_lam_hop_dong date,
    ngay_ket_thuc date,
    tien_dat_coc int,
    tong_tien int,
    foreign key (id_nhan_vien)references nhan_vien(id_nhan_vien),
    foreign key (id_khach_hang) references khach_hang(id_khach_hang),
    foreign key (id_dich_vu) references dich_vu(id_dich_vu)
);
create table di_vu_di_kem(
    id_dich_vu_di_kem int primary key auto_increment,
    ten_dich_vu_di_kem varchar(100),
    gia int,
    don_vi int,
    trang_thai_kha_dung varchar(50)
);
create table hop_dong_chi_tiet(
    id_hop_dong_chi_tiet int primary key auto_increment,
    id_hop_dong int,
    id_dich_vu_di_kem int,
    so_luong int,
    foreign key (id_hop_dong) references hop_dong (id_hop_dong),
    foreign key (id_dich_vu_di_kem)references di_vu_di_kem (id_dich_vu_di_kem)
);