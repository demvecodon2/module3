create database quan_ly_sinh_vien;
use quan_ly_sinh_vien;
create table class(
    id_class int primary key auto_increment,
    class_name varchar(60) not null ,
    start_date datetime,
    status bit
);
insert into class (class_name, start_date, status) values ('c06241','2024-06-01',0),
                                                          ('c0724i1','2024-07-01',1),
                                                          ('c0824i1','2024-08-01',0);
create table student(
    id_student int primary key auto_increment,
    student_name varchar(100) not null ,
    address varchar(50),
    phone varchar(20),
    status bit,
    id_class int not null ,
    foreign key (id_class) references class (id_class)
);
insert into student (id_student, student_name, address, phone, status, id_class)
values (1,'hiếu','quảng trị','0165-123-412',1,1),
       (2,'nguyên','quảng nam','1231-12341-123',1,1),
       (3,'tuyết','bình định','1234-112-111',1,2);
create table subject (
    id_sub int primary key auto_increment,
    name_sub varchar(50) not null ,
    credit tinyint not null default 1 check(credit >=1),
    status bit default 1
 );
insert into subject (id_sub, name_sub, credit, status) values (1,'ahhhh',2,1),
                                                              (2,'bhsfd',6,1),
                                                              (3,'vadf',3,1);
CREATE TABLE mark (
                      id_mark INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                      id_sub INT NOT NULL,
                      id_student INT NOT NULL,
                      mark FLOAT DEFAULT 0 CHECK (mark BETWEEN 0 AND 100),
                      exam_times TINYINT DEFAULT 1,
                      UNIQUE (id_sub, id_student),
                      FOREIGN KEY (id_sub) REFERENCES subject (id_sub),
                      FOREIGN KEY (id_student) REFERENCES student (id_student)
);

INSERT INTO mark (id_mark, id_sub, id_student, mark, exam_times) values (1,1,1,1,1);
INSERT INTO mark (id_mark, id_sub, id_student, mark, exam_times) values (2,1,3,2,1);
INSERT INTO mark (id_mark, id_sub, id_student, mark, exam_times) values (3,2,2,4,1);

select *from subject where credit=(select min(credit)from subject);

select *from  subject where  credit=(select min(credit) from subject);

select s.* from subject s join mark m on s.id_sub = m.id_sub
where m.mark =(select min(mark)from mark);

select s.* from subject s join mark m on s.id_sub = m.id_sub
where m.mark=(select max(mark)from mark);

select  s.id_student,s.student_name,s.address,s.phone, avg(m.mark) as average_mark
from student s left join mark m on s.id_student = m.id_student
group by s.id_student, s.student_name, s.address, s.phone
order by average_mark desc ;