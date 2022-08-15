CREATE DATABASE DNTU
GO
USE DNTU
GO
CREATE TABLE Course(
ID int primary key identity not null,
nameCourse nvarchar(max) not null,
created_at datetime not null,
delete_at bit not null 
)
GO
CREATE TABLE Student(
ID int primary key identity not null,
nameStudent nvarchar(max) not null,
birthday datetime not null,
course_id int not null,
status int not null,
created_at datetime not null,
delete_at bit not null
)
GO
CREATE TABLE Auth(
ID int primary key identity not null,
name nvarchar(max) not null,
email nvarchar(max) not null,
password nvarchar(max) not null,
role nvarchar(max) not null,
)

alter table Student add constraint fk_student_course foreign key (course_id) references Course(id)

INSERT INTO Course(nameCourse, created_at, delete_at) VALUES('Laravel', (select GETDATE()), '0')