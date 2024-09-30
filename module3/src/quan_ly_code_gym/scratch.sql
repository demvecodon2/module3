CREATE DATABASE quan_ly_code_gym;
USE quan_ly_code_gym;

CREATE TABLE account (
                         account_name  VARCHAR(50) PRIMARY KEY,
                         password      VARCHAR(30) NOT NULL,
                         creation_date DATE,
                         status        VARCHAR(20)
);

INSERT INTO account (account_name, password, creation_date, status)
VALUES ('hieu123', 'hdaasd', '2024-01-12', 'đang hoạt động'),
       ('tuyet12', 'asdasdqw', '2024-03-12', 'đang hoạt động'),
       ('tya', 'jefglsadl', '2024-02-12', 'đang hoạt động');

CREATE TABLE clas_type (
                           id_type_class INT PRIMARY KEY AUTO_INCREMENT,
                           name_type     VARCHAR(50)
);

INSERT INTO clas_type (name_type)
VALUES ('lop c06'),
       ('lop c07'),
       ('lop c09');

CREATE TABLE class (
                       id_class           INT PRIMARY KEY AUTO_INCREMENT,
                       id_type_class      INT,
                       start_date         DATE,
                       end_day            DATE,
                       number_of_students INT NOT NULL,
                       teaching_industry  VARCHAR(40),
                       FOREIGN KEY (id_type_class) REFERENCES clas_type (id_type_class)
);

INSERT INTO class (id_type_class, start_date, end_day, number_of_students, teaching_industry)
VALUES (1, '2001-11-11', '2002-04-04', 33, 'cntt'),
       (2, '2001-01-11', '2002-04-05', 24, 'bachkhoa'),
       (3, '2001-12-11', '2002-04-06', 23, 'tdtt');

CREATE TABLE teacher (
                         id_instructor INT PRIMARY KEY AUTO_INCREMENT,
                         id_class      INT,
                         account_name  VARCHAR(50) UNIQUE,
                         lecturer_name VARCHAR(80),
                         email         VARCHAR(50),
                         phone         VARCHAR(15),
                         FOREIGN KEY (id_class) REFERENCES class (id_class),
                         FOREIGN KEY (account_name) REFERENCES account (account_name)
);

INSERT INTO teacher (id_class, account_name, lecturer_name, email, phone)
VALUES (2, 'tuyet12', 'Tuyet Hoang', 'tuyet.hoang@example.com', '123-456-7880'),
       (1, 'hieu123', 'Hieu Nguyen', 'hieu.nguyen@example.com', '183-456-7890');

CREATE TABLE student (
                         student_id     INT PRIMARY KEY AUTO_INCREMENT,
                         id_class       INT,
                         id_instructor  INT,
                         account_name   VARCHAR(50) UNIQUE,
                         student_name   VARCHAR(80),
                         date_of_birth  DATE,
                         address        VARCHAR(100),
                         phone          VARCHAR(20),
                         email          VARCHAR(50),
                         admission_date DATE,
                         FOREIGN KEY (id_class) REFERENCES class (id_class),
                         FOREIGN KEY (account_name) REFERENCES account (account_name)
);

INSERT INTO student (id_class, id_instructor, account_name, student_name, date_of_birth, address, phone, email, admission_date)
VALUES (1, 1, 'tya', 'Tuan Anh', '2000-05-15', '123 Main St, hue', '098-765-4421', 'tuan.anh@example.com', '2024-09-01'),
       (2, 2, 'tuyet12', 'tien', '2000-05-15', '123 Main St, quang tri', '098-765-5321', 'hieu.anh@example.com', '2024-09-01'),
       (3, 2, 'hieu123', 'Toan', '2000-05-15', '123 Main St, quang tri', '098-765-4321', 'toan@example.com', '2024-09-01');

CREATE TABLE phone (
                       id_phone      INT PRIMARY KEY AUTO_INCREMENT,
                       phone_number  VARCHAR(20) NOT NULL,
                       phone_type    VARCHAR(20),
                       student_id    INT,
                       id_instructor INT,
                       FOREIGN KEY (id_instructor) REFERENCES teacher (id_instructor),
                       FOREIGN KEY (student_id) REFERENCES student (student_id)
);

CREATE TABLE teacher_class (
                               id_instructor INT,
                               id_class      INT,
                               PRIMARY KEY (id_class, id_instructor),
                               FOREIGN KEY (id_class) REFERENCES class (id_class),
                               FOREIGN KEY (id_instructor) REFERENCES teacher (id_instructor)
);

INSERT INTO teacher_class (id_instructor, id_class)
VALUES (1, 1),
       (2, 1),
       (1, 2),
       (2, 3);
SELECT s.student_id, s.student_name, c.id_class,c.start_date,c.end_day,c.teaching_industry
FROM student s JOIN class c ON s.id_class = c.id_class;

SELECT s.student_id, s.student_name, s.date_of_birth,s.Address,s.Phone,s.Email,
s.admission_date, c.id_class,c.start_date,c.end_day,c.teaching_industry,ct.name_type AS class_type
FROM student s JOIN class c ON s.id_class = c.id_class
JOIN clas_type ct ON c.id_type_class = ct.id_type_class;

SELECT s.student_id,s.student_name,s.date_of_birth,s.Address,
s.Phone,s.Email,s.admission_date,c.id_class,c.start_date,c.end_day,c.teaching_industry
FROM student s LEFT JOIN class c ON s.id_class = c.id_class;

SELECT student_id,student_name,date_of_birth,Address,Phone,Email,
admission_date,id_class,id_instructor
FROM student WHERE student_name like '%tien' or student_name like '%hieu%';

SELECT c.id_class, c.teaching_industry, COUNT(s.student_id) AS number_of_students
FROM class c LEFT JOIN student s ON c.id_class = s.id_class
GROUP BY c.id_class, c.teaching_industry;

SELECT student_id, student_name, date_of_birth, Address, Phone, Email, admission_date,
id_class, id_instructor
FROM student ORDER BY student_name ASC,address asc ;


DELIMITER //
CREATE PROCEDURE abc()
BEGIN
    SELECT c.id_class, c.teaching_industry, COUNT(s.student_id) AS number_of_students
    FROM class c LEFT JOIN student s ON c.id_class = s.id_class
    GROUP BY c.id_class, c.teaching_industry;
end //
DELIMITER ;
CALL abc()