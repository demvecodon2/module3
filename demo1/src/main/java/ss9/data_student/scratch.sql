CREATE DATABASE student_management;
USE student_management;

CREATE TABLE student_managements (
                                     id INT PRIMARY KEY AUTO_INCREMENT,
                                     name VARCHAR(100),
                                     address VARCHAR(100),
                                     age varchar(20),
                                     phone varchar(30)
);

INSERT INTO student_managements (name, address,age,phone) VALUES
                                                    ('Hiếu', 'Quảng Trị','23','123456789'),
                                                    ('Tuyết', 'Bình Định','20','987654321'),
                                                    ('Nguyên', 'Quảng Nam','27','1412313211');
