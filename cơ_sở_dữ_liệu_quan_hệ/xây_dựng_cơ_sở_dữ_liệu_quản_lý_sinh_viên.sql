CREATE DATABASE if not exists student;
use student;
CREATE TABLE students(
id int,
`name` varchar(35)
);
-- thêm mới
insert into students
values(1,'duyet');
insert  into students(id , name)
values(2,'vuong');
-- lấy thông tin
select s.id, s.`name`
from students s
where id = 1;
select *
from students;
-- thay đổi thông tin
update studens 	
set name = 'long' 
where id = 1;
-- xoá thông tin
delete from students 
where name = 'long';

-- thêm mới 1 trường
alter table students
add column `point` int;

-- xoá bảng
drop table students;

-- xoá csdl 
drop database student;


