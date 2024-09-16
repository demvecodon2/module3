create database schol;
use schol;
create table teacher(
                        id int primary key auto_increment,
                        name varchar(40),
                        age int,
                        country varchar(30)
);
insert into teacher (id, name, age, country) values ('1','hieu','40','quảng trị');
insert into teacher (id, name, age, country) values ('2','hoa','41','quảng nam');
insert into teacher (id, name, age, country) values ('3','hi','43','ninh bình');
select *from teacher where teacher.country like ('quảng');

create table class (
                       id int primary key auto_increment,
                       name varchar(40)
);
insert into class (name) values ('hoang');
insert into class (name) values ('hoa');
insert into  class (name) values ('nam');
select*from  class where name like ('ho');