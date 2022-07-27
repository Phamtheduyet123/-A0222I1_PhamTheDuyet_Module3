use quan_ly_ban_hang;
insert into customer(cName,cAge)
values('Minh Quan',19),
('Ngoc Oanh',20),
('Hong Ha',50);
insert into `order`(cID,oDate)
values(1,'2006-3-21'),
(2,'2006-3-23'),
(1,'2006-3-16');
insert into product(pName,pPrice)
values('May giat',3),
('Tu lanh',5),
('Dieu hoa',7),
('Quat',1),
('Bep Dien',2);
insert into orderdetail
values(1,1,'3'),
(1,3,'7'),
(1,4,'2'),
(2,1,'1'),
(3,1,'8'),
(2,5,'4'),
(2,3,'3');
delete from customer
where (cAge= 19 and cID<>0);
select r.oID,r.oDate,r.oTotalPrice
from `order` r;
select c.cName,p.pName
from customer c join `order` o on c.cID = o.cID
join orderdetail d on o.oID = d.oID_order
join product p on d.pID_product = p.pID;
select c.cName as `Name`
from customer c join `order` o on c.cID = o.oID
where c.cID <> o.cID;
select o.oID,o.oDate,  p.pPrice * d.odQTY as total
from `order` o join `orderdetail` d on o.oID = d.oID_order
join product p on d.pID_product = p.pID;





