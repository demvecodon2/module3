create database quan_ly_resort;
use quan_ly_resort;
create table vi_tri
(
    id_vi_tri  int primary key auto_increment,
    ten_vi_tri varchar(50)
);
insert into vi_tri (id_vi_tri, ten_vi_tri)
values (1, 'nhân viên'),
       (2, 'quản lý'),
       (3, 'đầu bếp ');

create table trinh_do
(
    id_trinh_do int primary key auto_increment,
    trinh_do    varchar(50)
);
insert into trinh_do(id_trinh_do, trinh_do)
values (1, 'cấp 3'),
       (2, 'đại học'),
       (3, 'sư phạm');

create table bo_phan
(
    id_bo_phan  int primary key auto_increment,
    ten_bo_phan varchar(50)
);
insert into bo_phan(id_bo_phan, ten_bo_phan)
values (1, 'phục vụ');
insert into bo_phan(id_bo_phan, ten_bo_phan)
values (2, 'quản lý');
insert into bo_phan(id_bo_phan, ten_bo_phan)
values (3, ' bếp');
insert into bo_phan(id_bo_phan, ten_bo_phan)
values (4, 'lễ tân');

create table nhan_vien
(
    id_nhan_vien  int primary key auto_increment,
    ho_ten        varchar(100),
    id_vi_tri     int,
    id_trinh_do   int,
    id_bo_phan    int,
    ngay_sinh     date,
    so_can_cuoc   varchar(30),
    luong         varchar(15),
    so_dien_thoai varchar(20),
    email         varchar(45),
    dia_chi       varchar(100),
    FOREIGN KEY (id_vi_tri) REFERENCES vi_tri (id_vi_tri),
    FOREIGN KEY (id_trinh_do) REFERENCES trinh_do (id_trinh_do),
    FOREIGN KEY (id_bo_phan) REFERENCES bo_phan (id_bo_phan)
);
insert into nhan_vien (id_nhan_vien, ho_ten, id_vi_tri, id_trinh_do, id_bo_phan, ngay_sinh,
                       so_can_cuoc, luong, so_dien_thoai, email, dia_chi)
values (1, 'hieu', 1, 1, 1, '1996-10-11', '12314', '41212', '123421', 'gfhiuh@gmail.com', 'đà nẵng'),
       (2, 'hoang', 3, 3, 3, '2002-11-11', '47265432', '141234', '41232151', 'khhgjk13@gmail.com', 'sài gòn'),
       (3, 'khánh', 2, 2, 3, '2002-11-11', '7671237191', '14134', '1012-421-111', 'kgjask13@gmail.com', 'bình định'),
       (4, 'khanh', 1, 1, 1, '2001-01-07', '12312412', '12341', '12412311', '123ssd@gmail.com', 'quảng tri'),
       (5, 'tuyet', 2, 2, 2, '2000-03-07', '12311412', '41231', '124124124', 'fdasd@gmil.com', 'nam định'),
       (6, 'thi', 3, 3, 3, '1997-12-11', '1312312', '12312', '12312', 'idsii@gmail.com', 'quảng nam');

create table loai_khach
(
    id_loai_khach  int primary key auto_increment,
    ten_loai_khach varchar(100)
);
insert into loai_khach (id_loai_khach, ten_loai_khach)
values (1, 'newbie'),
       (2, 'silver'),
       (3, 'Platinium'),
       (4, 'Diamond');

create table khach_hang
(
    id_khach_hang int primary key auto_increment,
    id_loai_khach int,
    ho_ten        varchar(100),
    ngay_sinh     date,
    so_can_cuoc   varchar(30),
    so_dien_thoai varchar(30),
    emai          varchar(50),
    dia_chi       varchar(100),
    foreign key (id_loai_khach) references loai_khach (id_loai_khach)
);
insert into khach_hang(id_khach_hang, id_loai_khach, ho_ten, ngay_sinh, so_can_cuoc, so_dien_thoai, emai, dia_chi)
VALUES (1, 1, 'hieu', '1001-01-01', '1231131', '123-456-123', 'asjdqw@gmail.com', 'quảngtri'),
       (2, 4, 'sơn', '2000-03-07', '131212321', '131241231', '123124@gmail.com', ' bình định'),
       (3, 2, 'thi', '2000-03-07', '131212321', '131241231', '123124@gmail.com', ' quảng nam '),
       (4, 3, 'tuyet', '2000-03-07', '131212321', '131241231', '123124@gmail.com', 'quảng bình '),
       (5, 4, 'nam', '2000-03-07', '131212321', '131241231', '123124@gmail.com', ' huế'),
       (6, 3, 'nguyen', '1997-10-12', '312312', '123121213', '123sfd@gmail.com', 'quảng nam');

create table kieu_thue
(
    id_dang_thue int primary key auto_increment,
    dang_thue    varchar(50),
    gia          int
);
insert into kieu_thue(id_dang_thue, dang_thue, gia)
VALUES (1, 'villa', '20500');
insert into kieu_thue(id_dang_thue, dang_thue, gia)
VALUES (2, 'House ', '10000');
create table loai_dich_vu
(
    id_loai_dich_vu  int primary key auto_increment,
    ten_loai_dich_vu varchar(100)
);
insert into loai_dich_vu(id_loai_dich_vu, ten_loai_dich_vu)
VALUES (1, 'thực phẩm'),
       (2, 'đồ uống'),
       (3, 'giải trí');

create table dich_vu
(
    id_dich_vu      int primary key auto_increment,
    ten_dich_vu     varchar(100),
    dien_tich       int,
    so_tang         int,
    so_nguoi_toi_da varchar(50),
    chi_phi_thue    varchar(50),
    id_kieu_thue    int,
    id_loai_dich_vu int,
    trang_thai      varchar(50),
    foreign key (id_kieu_thue) references kieu_thue (id_dang_thue),
    foreign key (id_loai_dich_vu) references loai_dich_vu (id_loai_dich_vu)
);
insert into dich_vu(id_dich_vu, ten_dich_vu, dien_tich, so_tang, so_nguoi_toi_da, chi_phi_thue, id_kieu_thue,
                    id_loai_dich_vu, trang_thai)
values (1, 'nghỉ dưỡng', '200', '2', '20', '20000đ', 1, 1, 'đang thuê'),
       (2, 'du lich', '300', '1', '10', '100000', 2, 2, 'đang thuê'),
       (3, 'qua đêm', '100', '1', '10', '500000', 1, 3, 'đang thuê'),
       (4, 'du lich', '300', '1', '10', '100000', 2, 3, 'đang thuê');

create table hop_dong
(
    id_hop_dong       int primary key auto_increment,
    id_nhan_vien      int,
    id_khach_hang     int,
    id_dich_vu        int,
    ngay_lam_hop_dong date,
    ngay_ket_thuc     date,
    tien_dat_coc      int,
    tong_tien         int,
    foreign key (id_nhan_vien) references nhan_vien (id_nhan_vien),
    foreign key (id_khach_hang) references khach_hang (id_khach_hang),
    foreign key (id_dich_vu) references dich_vu (id_dich_vu)
);
insert into hop_dong (id_nhan_vien, id_khach_hang, id_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc,
                      tong_tien)
VALUES (1, 1, 1, '2024-12-11', '2025-03-01', '1000', '20000'),
       (4, 2, 2, '2024-12-11', '2025-03-01', '1000', '20000'),
       (5, 3, 3, '2024-12-11', '2025-03-01', '1000', '20000');

create table di_vu_di_kem
(
    id_dich_vu_di_kem   int primary key auto_increment,
    ten_dich_vu_di_kem  varchar(100),
    gia                 int,
    don_vi              int,
    trang_thai_kha_dung varchar(50)
);
insert into di_vu_di_kem (id_dich_vu_di_kem, ten_dich_vu_di_kem, gia, don_vi, trang_thai_kha_dung)
VALUES (1, 'thức uống', '200', '113', 'còn'),
       (2, 'thức ăn', '500', '12314', 'còn'),
       (3, 'giải trí ', '1000', '1000', 'còn');

create table hop_dong_chi_tiet
(
    id_hop_dong_chi_tiet int primary key auto_increment,
    id_hop_dong          int,
    id_dich_vu_di_kem    int,
    so_luong             int,
    foreign key (id_hop_dong) references hop_dong (id_hop_dong),
    foreign key (id_dich_vu_di_kem) references di_vu_di_kem (id_dich_vu_di_kem)
);
insert into hop_dong_chi_tiet (id_hop_dong_chi_tiet, id_hop_dong, id_dich_vu_di_kem, so_luong)
VALUES (1, 1, 1, '23'),
       (2, 2, 2, '1'),
       (3, 3, 3, '4');

select *
from nhan_vien
where ho_ten like '%t';

SELECT id_khach_hang,
       id_loai_khach,
       ho_ten,
       ngay_sinh,
       so_can_cuoc,
       so_dien_thoai,
       emai,
       dia_chi
FROM khach_hang
WHERE YEAR(ngay_sinh) >= 1997
  AND dia_chi LIKE '%Quảng%';

SELECT kh.id_khach_hang, kh.ho_ten, COUNT(hd.id_hop_dong) AS so_lan_dat_phong
FROM khach_hang kh
         JOIN loai_khach lk ON kh.id_loai_khach = lk.id_loai_khach
         LEFT JOIN hop_dong hd ON kh.id_khach_hang = hd.id_khach_hang
WHERE lk.ten_loai_khach = 'Diamond'
GROUP BY kh.id_khach_hang, kh.ho_ten
ORDER BY so_lan_dat_phong ASC;

SELECT dv.id_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu
FROM dich_vu dv
         JOIN loai_dich_vu ldv ON dv.id_loai_dich_vu = ldv.id_loai_dich_vu
         LEFT JOIN hop_dong hd ON dv.id_dich_vu = hd.id_dich_vu
WHERE hd.id_hop_dong IS NULL
   OR hd.ngay_lam_hop_dong NOT BETWEEN '2024-01-01' AND '2025-03-31';

SELECT dv.id_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu
FROM dich_vu dv
         JOIN loai_dich_vu ldv ON dv.id_loai_dich_vu = ldv.id_loai_dich_vu
WHERE EXISTS (SELECT 1 FROM hop_dong hd WHERE hd.id_dich_vu = dv.id_dich_vu AND YEAR(hd.ngay_lam_hop_dong) = 2024)
  AND NOT EXISTS (SELECT 1
                  FROM hop_dong hd
                  WHERE hd.id_dich_vu = dv.id_dich_vu
                    AND YEAR(hd.ngay_lam_hop_dong) = 2025);

SELECT DISTINCT ho_ten AS HoTenKhachHang
FROM khach_hang;
SELECT ho_ten AS HoTenKhachHang
FROM khach_hang
GROUP BY ho_ten;

SELECT ho_ten AS HoTenKhachHang
FROM (SELECT ho_ten
      FROM khach_hang
      GROUP BY ho_ten) AS unique_names;

select date_format(ngay_lam_hop_dong, '%y-%m') as month,
       count(distinct id_khach_hang)           as customer_count,
       sum(tong_tien)                          as total_revenue
from hop_dong
where year(ngay_lam_hop_dong) = 2024
group by month
order by month;

SELECT dvdk.ten_dich_vu_di_kem AS TenDichVuDiKem,
       kh.ho_ten               AS HoTenKhachHang,
       kh.dia_chi              AS DiaChi,
       hd.ngay_lam_hop_dong    AS NgayLamHopDong,
       hd.ngay_ket_thuc        AS NgayKetThuc,
       hdct.so_luong           AS SoLuong
FROM khach_hang kh
         JOIN loai_khach lk ON kh.id_loai_khach = lk.id_loai_khach
         JOIN
     hop_dong hd ON kh.id_khach_hang = hd.id_khach_hang
         JOIN
     hop_dong_chi_tiet hdct ON hd.id_hop_dong = hdct.id_hop_dong
         JOIN
     di_vu_di_kem dvdk ON hdct.id_dich_vu_di_kem = dvdk.id_dich_vu_di_kem
WHERE LOWER(lk.ten_loai_khach) = 'diamond'
  AND (LOWER(kh.dia_chi) LIKE '%quảng nam%' OR LOWER(kh.dia_chi) LIKE '%huế%')
ORDER BY kh.ho_ten, dvdk.ten_dich_vu_di_kem;

SELECT hd.id_hop_dong                   AS IDHopDong,
       ldv.ten_loai_dich_vu             AS TenLoaiDichVu,
       dvdk.ten_dich_vu_di_kem          AS TenDichVuDiKem,
       COUNT(hdct.id_hop_dong_chi_tiet) AS SoLanSuDung
FROM hop_dong_chi_tiet hdct
         JOIN hop_dong hd ON hdct.id_hop_dong = hd.id_hop_dong
         JOIN
     di_vu_di_kem dvdk ON hdct.id_dich_vu_di_kem = dvdk.id_dich_vu_di_kem
         JOIN
     loai_dich_vu ldv ON dvdk.id_dich_vu_di_kem = dvdk.id_dich_vu_di_kem
GROUP BY hd.id_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem
HAVING SoLanSuDung = 1;

SELECT nv.id_nhan_vien  AS IDNhanVien,
       nv.ho_ten        AS HoTen,
       td.trinh_do      AS TrinhDo,
       bp.ten_bo_phan   AS TenBoPhan,
       nv.so_dien_thoai AS SoDienThoai,
       nv.dia_chi       AS DiaChi
FROM nhan_vien nv
         JOIN trinh_do td ON nv.id_trinh_do = td.id_trinh_do
         JOIN
     bo_phan bp ON nv.id_bo_phan = bp.id_bo_phan
         LEFT JOIN hop_dong hd ON nv.id_nhan_vien = hd.id_nhan_vien
    AND YEAR(hd.ngay_lam_hop_dong) BETWEEN 2023 AND 2025
GROUP BY nv.id_nhan_vien
HAVING COUNT(hd.id_hop_dong) <= 3;

DELETE
FROM nhan_vien
WHERE id_nhan_vien NOT IN (SELECT id_nhan_vien FROM hop_dong WHERE YEAR(ngay_lam_hop_dong) BETWEEN 2023 AND 2025);

UPDATE khach_hang kh
SET kh.id_loai_khach = (SELECT id_loai_khach FROM loai_khach WHERE ten_loai_khach = 'Diamond')
WHERE kh.id_loai_khach = (SELECT id_loai_khach FROM loai_khach WHERE ten_loai_khach = 'Platinium')
  AND kh.id_khach_hang IN (
    SELECT hd.id_khach_hang
    FROM hop_dong hd
    WHERE YEAR(hd.ngay_lam_hop_dong) = 2024
    GROUP BY hd.id_khach_hang
    HAVING SUM(hd.tong_tien) > 10000
);


DELETE FROM hop_dong
WHERE ngay_lam_hop_dong < '2024-01-01';
DELETE FROM khach_hang
WHERE id_khach_hang NOT IN (SELECT DISTINCT id_khach_hang FROM hop_dong);

UPDATE di_vu_di_kem dvdk
SET dvdk.gia = dvdk.gia * 2
WHERE dvdk.id_dich_vu_di_kem IN (
    SELECT hdct.id_dich_vu_di_kem
    FROM hop_dong_chi_tiet hdct
             JOIN hop_dong hd ON hdct.id_hop_dong = hd.id_hop_dong
    WHERE YEAR(hd.ngay_lam_hop_dong) = 2025
    GROUP BY hdct.id_dich_vu_di_kem
    HAVING COUNT(hdct.id_hop_dong_chi_tiet) > 10
);


SELECT
    nv.id_nhan_vien AS IDNhanVien,
    NULL AS IDKhachHang,
    nv.ho_ten AS HoTen,
    nv.email AS Email,
    nv.so_dien_thoai AS SoDienThoai,
    nv.ngay_sinh AS NgaySinh,
    nv.dia_chi AS DiaChi
FROM
    nhan_vien nv

UNION ALL

SELECT
    NULL AS IDNhanVien,
    kh.id_khach_hang AS IDKhachHang,
    kh.ho_ten AS HoTen,
    kh.emai AS Email,
    kh.so_dien_thoai AS SoDienThoai,
    kh.ngay_sinh AS NgaySinh,
    kh.dia_chi AS DiaChi
FROM
    khach_hang kh;



