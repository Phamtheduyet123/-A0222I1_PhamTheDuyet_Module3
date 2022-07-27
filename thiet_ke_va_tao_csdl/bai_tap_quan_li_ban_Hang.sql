create database if not exists quan_ly_ban_hang;
use quan_ly_ban_hang;
create table customer(
cID int auto_increment primary key,
cName varchar(50) not null,
cAge int not null check(cAge >=18)
);
create table `order`(
oID int auto_increment primary key,
cID int not null ,
oDate date not null,
oTotalPrice double ,
foreign key (cID) references customer(cID)
);
create table product(
pID int auto_increment,
pName varchar(20) not null,
pPrice double not null ,
primary key(pID)
);
create table orderdetail(
oID_order int ,
pID_product int ,
odQTY varchar(20) not null,
primary key(oID_order,pID_product),
foreign key (oID_order) references `order`(oID),
foreign key (pID_product) references product(pID)
);
