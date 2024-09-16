CREATE DATABASE QuanLyCodeGym;
USE QuanLyCodeGym;

CREATE TABLE Account
(
    id_account    INT PRIMARY KEY AUTO_INCREMENT,
    account_name  VARCHAR(50) NOT NULL,
    pass_word     VARCHAR(30) NOT NULL,
    creation_date DATETIME,
    status        VARCHAR(20)
);

CREATE TABLE Class
(
    id_class          INT PRIMARY KEY AUTO_INCREMENT,
    ngay_bat_dau      DATETIME,
    ngay_ket_thuc     DATETIME,
    so_luong_hoc_sinh INT NOT NULL,
    nganh_day         VARCHAR(40)
);

CREATE TABLE Teacher
(
    id_giang_vien INT PRIMARY KEY AUTO_INCREMENT,
    id_class      INT,
    id_account    INT,
    TenGV         VARCHAR(80),
    Email         VARCHAR(50),
    Phone         VARCHAR(15),
    DayLop        VARCHAR(30),
    FOREIGN KEY (id_class) REFERENCES Class (id_class),
    FOREIGN KEY (id_account) REFERENCES Account (id_account)
);

CREATE TABLE Student
(
    id_hoc_sinh   INT PRIMARY KEY AUTO_INCREMENT,
    id_class      INT,
    id_giang_vien INT,
    id_account    INT,
    ten_hoc_sinh  VARCHAR(80),
    ngay_sinh     DATETIME,
    dia_chi       VARCHAR(100),
    Phone         VARCHAR(20),
    Email         VARCHAR(50),
    ngay_nhap_hoc DATETIME,
    FOREIGN KEY (id_class) REFERENCES Class (id_class),
    FOREIGN KEY (id_giang_vien) REFERENCES Teacher (id_giang_vien),
    FOREIGN KEY (id_account) REFERENCES Account (id_account)
);
CREATE TABLE Phone
(
    id_phone      INT PRIMARY KEY AUTO_INCREMENT,
    phone_number  VARCHAR(20) NOT NULL,
    phone_type    VARCHAR(20),
    id_hoc_sinh   INT,
    id_giang_vien INT,
    FOREIGN KEY (id_giang_vien) REFERENCES Teacher (id_giang_vien),
    FOREIGN KEY (id_hoc_sinh) REFERENCES Student (id_hoc_sinh)
);