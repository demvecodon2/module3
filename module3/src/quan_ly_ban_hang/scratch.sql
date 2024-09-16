create database QuanLyBanHang ;
use QuanLyBanHang;
create table Customer(
    c_id int primary key auto_increment,
    c_name varchar(100),
    c_age int
);
create table Order(
    o_id int primary key auto_increment,
    c_id int,
    o_date datetime,
    o_total_price double,
   foreign key (c_id) references Customer(c_id)
);
create table Product(
  p_id int primary key auto_increment,
  p_name varchar(100),
  p_prive double
);
create table Orderdetail (
  o_id int,
  p_id int,
  od_qty varchar(100),
    foreign key (o_id) references Order(o_id),
    foreign key (p_id) references Product(p_id)
);