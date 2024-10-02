create database demo;
use demo;
create table users (
    id int(3) not null  auto_increment primary key ,
    name varchar(50) not null ,
    email varchar(50) not null ,
    country varchar(120)
);
insert into users (name, email, country) VALUES ('hiếu','hsads@gmail.com','vietnam'),
                                                ('tuyết','dhsfihj@gmail.com','lào');