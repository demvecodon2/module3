CREATE DATABASE demo;
USE demo;
CREATE TABLE products (
                          id INT PRIMARY KEY AUTO_INCREMENT,
                          product_code VARCHAR(50) UNIQUE,
                          product_name VARCHAR(100),
                          product_price DECIMAL(10, 2),
                          product_amount INT,
                          product_description TEXT,
                          product_status VARCHAR(50)
);
INSERT INTO products (product_code, product_name, product_price, product_amount, product_description, product_status)
VALUES  ('P001', 'Sản phẩm A', 100.00, 50, 'Mô tả sản phẩm A', 'Còn hàng'),
        ('P002', 'Sản phẩm B', 150.00, 30, 'Mô tả sản phẩm B', 'Hết hàng'),
        ('P003', 'Sản phẩm C', 200.00, 20, 'Mô tả sản phẩm C', 'Còn hàng'),
        ('P004', 'Sản phẩm D', 120.00, 40, 'Mô tả sản phẩm D', 'Còn hàng');

CREATE UNIQUE INDEX idx_productCode ON Products(product_code);
CREATE INDEX idx_productNamePrice ON Products(product_name, product_price);
EXPLAIN SELECT * FROM Products WHERE product_name = 'Sản phẩm A' AND product_price = 100.00;
CREATE VIEW ProductInfo AS

SELECT product_code, product_name, product_price, product_status
FROM Products;

CREATE OR REPLACE VIEW ProductInfo AS
SELECT product_code, product_name, product_price, product_status
FROM Products
WHERE product_status = 'Còn hàng';
DROP VIEW IF EXISTS ProductInfo;
DELIMITER //
CREATE PROCEDURE GetAllProducts()
BEGIN
    SELECT * FROM Products;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE AddProduct(
    IN p_productCode VARCHAR(50),
    IN p_productName VARCHAR(100),
    IN p_productPrice DECIMAL(10, 2),
    IN p_productAmount INT,
    IN p_productDescription TEXT,
    IN p_productStatus VARCHAR(50)
)
BEGIN
    INSERT INTO Products (product_code, product_name, product_price, product_amount, product_description, product_status)
    VALUES (p_productCode, p_productName, p_productPrice, p_productAmount, p_productDescription, p_productStatus);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DeleteProduct(IN p_id INT)
BEGIN
    DELETE FROM Products WHERE id = p_id;
END //
DELIMITER ;


call GetAllProducts();