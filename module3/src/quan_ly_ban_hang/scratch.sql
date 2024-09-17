CREATE DATABASE QuanLyBanHang;

USE QuanLyBanHang;

CREATE TABLE Customer (
                          c_id INT PRIMARY KEY AUTO_INCREMENT,
                          c_name VARCHAR(100),
                          c_age INT
);

CREATE TABLE `Order` (
                         o_id INT PRIMARY KEY AUTO_INCREMENT,
                         c_id INT,
                         o_date DATETIME,
                         o_total_price DECIMAL(10, 2),
                         FOREIGN KEY (c_id) REFERENCES Customer(c_id)
);

CREATE TABLE Product (
                         p_id INT PRIMARY KEY AUTO_INCREMENT,
                         p_name VARCHAR(100),
                         p_price DECIMAL(10, 2)
);
CREATE TABLE Orderdetail (
                             o_id INT,
                             p_id INT,
                             od_qty INT,
                             od_price DECIMAL(10, 2),
                             PRIMARY KEY (o_id, p_id),
                             FOREIGN KEY (o_id) REFERENCES `Order`(o_id),
                             FOREIGN KEY (p_id) REFERENCES Product(p_id)
);
