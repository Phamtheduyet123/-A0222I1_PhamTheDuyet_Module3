create database `demo`;
use `demo`;
create table Products(
id int primary key auto_increment,
productCode bigint,
productName varchar(45),
productPrice double,
productAmuont int,
productDescription varchar(100),
productStatus varchar(45)
);
insert into Products(productCode,productName,productPrice,productAmuont,productDescription,productStatus)
values(264189,'laptop',26000000,3,'san sang','sansang'),
(264189,'laptop',26000000,3,'san sang','sansang');
create index p_Code on Products(productCode);
drop index p_Code on Products;
create index name_price on Products(productName,productPrice);
drop index name_price on Products;
explain select * 
from Products
where id = 2;
-- dùng index truy vấn sẽ nhanh hơn
create view p_view as 
select productCode,productName,productPrice,productStatus
from products;
select *
from p_view;
drop view p_view;
-- lấy thông tin 
delimiter //
create procedure select_product()
begin
select * 
from products;
end //
delimiter ; 
call select_product();
delimiter //
create procedure insert_product(in productCode bigint,productName varchar(45),productPrice double,productAmuont int,  productDescription varchar(45),productStatus varchar(45))
 begin
insert into products(productCode,productName,productPrice,productAmuont,productDescription,productStatus) 
values(productCode,productName,productPrice,productAmuont,productDescription,productStatus);
end //
delimiter ;
call insert_product(12333,'lenovo',32000000,5,'ready','san sang');
-- sửa thông tin sản phẩm theo id
delimiter //
create procedure update_product(in id int,productCode bigint,productName varchar(45),productPrice double,productAmuont int,  productDescription varchar(45),productStatus varchar(45))
 begin
update products s
set s.productCode =productCode,
s.productName =productName ,
s.productPrice = productPrice,
s.productAmuont =productAmuont ,
s.productDescription = productDescription,
s.productStatus = productStatus
where s.id = id;
end //
delimiter ;
call update_product(1,123123,'dell',28000000,1,'ready','san sang');
-- xoá theo id
delimiter //
create procedure delete_product(in id int)
begin
delete 
from products s
where s.id = id;
end //
delimiter ; 
call delete_product(2);

