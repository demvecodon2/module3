CREATE DATABASE case_module3;
USE case_module3;

-- Bảng cho vai trò người dùng
CREATE TABLE user_role (
                           id INT PRIMARY KEY AUTO_INCREMENT,
                           role_name VARCHAR(30) NOT NULL UNIQUE
);

-- Bảng người dùng để lưu trữ thông tin cơ bản
CREATE TABLE user (
                      id INT PRIMARY KEY AUTO_INCREMENT,
                      name VARCHAR(100),
                      date DATE,
                      date_of_birth DATE,
                      email VARCHAR(50) UNIQUE,
                      phone VARCHAR(30),
                      role_id INT,
                      FOREIGN KEY (role_id) REFERENCES user_role(id)
);

-- Bảng tài khoản để lưu trữ tên đăng nhập và mật khẩu
CREATE TABLE account (
                         id INT PRIMARY KEY AUTO_INCREMENT,
                         user_id INT UNIQUE,
                         username VARCHAR(50) NOT NULL UNIQUE,
                         password VARCHAR(255) NOT NULL,
                         FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE
);

-- Bảng danh mục sản phẩm
CREATE TABLE product_category (
                                  id INT PRIMARY KEY AUTO_INCREMENT,
                                  name VARCHAR(100) NOT NULL,
                                  description VARCHAR(255)
);

-- Bảng sản phẩm
CREATE TABLE product (
                         id INT PRIMARY KEY AUTO_INCREMENT,
                         name VARCHAR(70) NOT NULL,
                         description VARCHAR(255),
                         price DECIMAL(10, 2) NOT NULL,
                         image VARCHAR(100),
                         category_id INT,
                         FOREIGN KEY (category_id) REFERENCES product_category(id)
);

-- Bảng giỏ hàng
CREATE TABLE shopping_cart (
                               id INT PRIMARY KEY AUTO_INCREMENT,
                               total_price DECIMAL(10, 2),
                               date DATETIME,
                               address VARCHAR(100),
                               user_id INT,
                               status VARCHAR(20),
                               FOREIGN KEY (user_id) REFERENCES user(id)
);

-- Bảng mặt hàng trong giỏ hàng
CREATE TABLE shopping_cart_item (
                                    id INT PRIMARY KEY AUTO_INCREMENT,
                                    cart_id INT,
                                    product_id INT,
                                    quantity INT,
                                    FOREIGN KEY (cart_id) REFERENCES shopping_cart(id) ON DELETE CASCADE,
                                    FOREIGN KEY (product_id) REFERENCES product(id)
);

-- Bảng thanh toán
CREATE TABLE payment (
                         id INT PRIMARY KEY AUTO_INCREMENT,
                         date DATETIME,
                         method_payment VARCHAR(100),
                         shopping_cart_id INT,
                         user_id INT,
                         total_price DECIMAL(10, 2),
                         transaction_id VARCHAR(50),
                         FOREIGN KEY (shopping_cart_id) REFERENCES shopping_cart(id) ON DELETE CASCADE,
                         FOREIGN KEY (user_id) REFERENCES user(id)
);

-- Bảng vận chuyển
CREATE TABLE shipping (
                          id INT PRIMARY KEY AUTO_INCREMENT,
                          address VARCHAR(100),
                          date DATETIME,
                          total_price DECIMAL(10, 2),
                          order_id INT,
                          FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE
);

-- Bảng đơn hàng
CREATE TABLE orders (
                        id INT PRIMARY KEY AUTO_INCREMENT,
                        user_id INT,
                        shopping_cart_id INT,
                        total_price DECIMAL(10, 2),
                        order_date DATETIME,
                        status VARCHAR(20),
                        FOREIGN KEY (user_id) REFERENCES user(id),
                        FOREIGN KEY (shopping_cart_id) REFERENCES shopping_cart(id)
);
