CREATE DATABASE student_management;
USE student_management;

CREATE TABLE student_managements (
                                     id INT PRIMARY KEY AUTO_INCREMENT,
                                     name VARCHAR(100),
                                     address VARCHAR(100)
);

INSERT INTO student_managements (name, address) VALUES
                                                    ('Hiếu', 'Quảng Trị'),
                                                    ('Tuyết', 'Bình Định'),
                                                    ('Nguyên', 'Quảng Nam');
