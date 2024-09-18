CREATE DATABASE quan_ly_ban_hang;

USE quan_ly_ban_hang;

CREATE TABLE customer (
                          c_id INT PRIMARY KEY AUTO_INCREMENT,
                          c_name VARCHAR(100),
                          c_age INT
);
insert into customer (c_id, c_name, c_age) values (1,'Minh Quan','10'),
                                                  (2,'Ngoc Oanh','20'),
                                                  (3,'Hong Ha','50');

CREATE TABLE orders (
                        o_id INT PRIMARY KEY AUTO_INCREMENT,
                        c_id INT,
                        o_date DATETIME,
                        o_total_price INT,
                        FOREIGN KEY (c_id) REFERENCES customer(c_id)
);

INSERT INTO orders (c_id, o_date, o_total_price) VALUES (1, '2024-09-18', 100),
                                                        (2,'2006-03-21',200),
                                                        (1,'2006-01-16',123);


CREATE TABLE product (
                         p_id INT PRIMARY KEY AUTO_INCREMENT,
                         p_name VARCHAR(100),
                         p_price DECIMAL(10, 2)
);
insert into product (p_id, p_name, p_price) VALUES (1,'may giat','3'),
                                                   (2,'tu lanh','5'),
                                                   (3,'dieu hoa','7'),
                                                   (4,'quat','1'),
                                                   (5,'bep dien','2');
CREATE TABLE orderdetail (
                             o_id INT,
                             p_id INT,
                             od_qty INT,
                             PRIMARY KEY (o_id, p_id),
                             FOREIGN KEY (o_id) REFERENCES orders(o_id),
                             FOREIGN KEY (p_id) REFERENCES product(p_id)
);
INSERT INTO orderdetail (o_id, p_id, od_qty)VALUES
                                                           (1, 1, 3),
                                                           (1, 3, 7),
                                                           (1, 4, 2),
                                                           (2, 1, 1),
                                                           (3, 1, 8),
                                                           (2, 5, 4),
                                                           (2, 3, 3);
select *from orders ;
SELECT c.c_name AS Customer_Name,p.p_name AS Product_Name,od.od_qty AS Quantity,o.o_date AS Order_Date,
    o.o_total_price AS Total_Price
FROM customer c JOIN orders o ON c.c_id = o.c_id JOIN orderdetail od ON o.o_id = od.o_id
JOIN product p ON od.p_id = p.p_id ORDER BY c.c_name, o.o_date;

SELECT c.c_name AS Customer_Name
FROM customer c LEFT JOIN orders o ON c.c_id = o.c_id LEFT JOIN orderdetail od ON o.o_id = od.o_id
WHERE od.o_id IS NULL;

SELECT o.o_id AS Order_ID, o.o_date AS Sale_Date, SUM(od.od_qty * p.p_price) AS Total_Price
FROM  orders o JOIN orderdetail od ON o.o_id = od.o_id JOIN product p ON od.p_id = p.p_id
GROUP BY o.o_id, o.o_date;

