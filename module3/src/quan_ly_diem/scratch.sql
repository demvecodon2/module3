create database QuanLyDiemThi;
use QuanLyDiemThi;
create table HocSinh(
    MaHs varchar(20) primary key ,
    TenHs varchar(50),
    NgaySinh datetime,
    Lop varchar(20),
    GT varchar(50)
);
insert into HocSinh (MaHs, TenHs, NgaySinh, Lop, GT) values ('23','hieu','2001-11-12','12b7','fw1');
