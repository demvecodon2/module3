CREATE DATABASE demo;
USE demo;
CREATE TABLE Products (
                          Id INT PRIMARY KEY AUTO_INCREMENT,
                          productCode VARCHAR(50) UNIQUE,
                          productName VARCHAR(100),
                          productPrice DECIMAL(10, 2),
                          productAmount INT,
                          productDescription TEXT,
                          productStatus VARCHAR(50)
);
INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
VALUES  ('P001', 'Sản phẩm A', 100.00, 50, 'Mô tả sản phẩm A', 'Còn hàng'),
        ('P002', 'Sản phẩm B', 150.00, 30, 'Mô tả sản phẩm B', 'Hết hàng'),
        ('P003', 'Sản phẩm C', 200.00, 20, 'Mô tả sản phẩm C', 'Còn hàng'),
        ('P004', 'Sản phẩm D', 120.00, 40, 'Mô tả sản phẩm D', 'Còn hàng');

CREATE UNIQUE INDEX idx_productCode ON Products(productCode);
CREATE INDEX idx_productNamePrice ON Products(productName, productPrice);
EXPLAIN SELECT * FROM Products WHERE productName = 'Sản phẩm A' AND productPrice = 100.00;
CREATE VIEW ProductInfo AS

SELECT productCode, productName, productPrice, productStatus
FROM Products;

CREATE OR REPLACE VIEW ProductInfo AS
SELECT productCode, productName, productPrice, productStatus
FROM Products
WHERE productStatus = 'Còn hàng';
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
    INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
    VALUES (p_productCode, p_productName, p_productPrice, p_productAmount, p_productDescription, p_productStatus);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DeleteProduct(IN p_id INT)
BEGIN
    DELETE FROM Products WHERE Id = p_id;
END //
DELIMITER ;


call GetAllProducts();