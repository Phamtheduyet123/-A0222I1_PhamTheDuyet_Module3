use case_study_module_3;
select *
from nhan_vien;

-- câu 2 :Hiển thị thông tin của tất cả nhân viên có trong hệ thống có
-- tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
SELECT *
FROM  nhan_vien 
WHERE ho_ten REGEXP '^[HTK]' AND character_length(ho_ten) <= 15;

/* câu 3 Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.*/
select * ,(year(curdate()) - year(ngay_sinh)) as year1
FROM khach_hang s
group by s.ma_khach_hang 
having year1 >=18 and year1 <=50 and 
dia_chi = 'Đà Nẵng' or dia_chi = 'Quảng Trị';
-- update
update hop_dong
set ngay_lam_hop_dong = '2021-03-12'
where ma_hop_dong = 4;
/* câu 4 4.Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần.
 Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.*/
select  k.ho_ten as khách_hàng, count(h.ma_khach_hang) as so_luong
from khach_hang k
join loai_khach l on k.ma_loai_khach = l.ma_loai_khach
join hop_dong h on k.ma_khach_hang = h.ma_khach_hang
where l.ma_loai_khach = 1
group by h.ma_khach_hang
order by so_luong asc;

-- câu 5 **** Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien----------
select k.ma_khach_hang,k.ho_ten,l.ten_loai_khach,h.ma_hop_dong,d.ten_dich_vu,h.ngay_lam_hop_dong,
h.ngay_ket_thuc, (d.chi_phi_thue +sum(ifnull(hc.so_luong*dk.gia,0))) as tong_tien
from khach_hang k
left join loai_khach l on k.ma_loai_khach = l.ma_loai_khach
left join hop_dong h on k.ma_khach_hang = h.ma_khach_hang
left join dich_vu d on h.ma_dich_vu = d.ma_dich_vu
left join hop_dong_chi_tiet hc on h.ma_hop_dong = hc.ma_hop_dong
left join dich_vu_di_kem dk on hc.ma_dich_vu_di_kem = dk.ma_dich_vu_di_kem
group by k.ma_khach_hang;

/* câu 6 Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021. */
select d.ma_dich_vu , d.ten_dich_vu ,d.dien_tich , d.chi_phi_thue, l.ten_loai_dich_vu
from dich_vu d
join loai_dich_vu l on d.ma_loai_dich_vu = l.ma_loai_dich_vu
join hop_dong h on d.ma_dich_vu = h.ma_dich_vu
where d.ma_dich_vu not in(
 select h.ma_dich_vu
 from hop_dong h
 where month(h.ngay_lam_hop_dong) = 3 or month(h.ngay_lam_hop_dong) = 2 or month(h.ngay_lam_hop_dong) =1 and year(h.ngay_lam_hop_dong) = 2021)
 group by h.ma_dich_vu;
/* câu 7 7.Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
*/
select ma_dich_vu,ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ld.ten_loai_dich_vu
from dich_vu d
join loai_dich_vu ld on d.ma_loai_dich_vu = ld.ma_loai_dich_vu
where d.ma_dich_vu  not in(
select h.ma_dich_vu 
from hop_dong h 
where year(ngay_lam_hop_dong) <> 2020);
/* câu 8 Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.*/
select ho_ten
from khach_hang
group by ho_ten;

/* câu 9Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
*/
select month(ngay_lam_hop_dong) as tháng , count(ma_khach_hang) as so_luong_khach_hang
from hop_dong
where year(ngay_lam_hop_dong) = 2021
group by month(ngay_lam_hop_dong);

/* câu 10 Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.*/
select h.ma_hop_dong, h.ngay_lam_hop_dong,h.ngay_ket_thuc, h.tien_dat_coc, count(hc.so_luong) as số_lượng
from hop_dong h 
left join hop_dong_chi_tiet hc on h.ma_hop_dong = hc.ma_hop_dong
group by h.ma_hop_dong;
 
-- câu 11 
select *
from dich_vu_di_kem d
join hop_dong_chi_tiet hd on d.ma_dich_vu_di_kem = hd.ma_dich_vu_di_kem
join hop_dong h on hd.ma_hop_dong = h.ma_hop_dong 
join khach_hang kh on h.ma_khach_hang = kh.ma_khach_hang
join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
where lk.ten_loai_khach = 'Diamond' and kh.dia_chi = 'Vinh' or kh.dia_chi = 'Quang Ngai';
/* câu 12 Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau)*/
select h.ma_hop_dong , nv.ho_ten, kh.ho_ten, kh.so_dien_thoai,dv.ten_dich_vu, sum(hd.so_luong) as so_luong_dich_vu_di_kem,h.tien_dat_coc
from hop_dong h 
join nhan_vien nv on nv.ma_nhan_vien = h.ma_nhan_vien
join khach_hang kh on kh.ma_khach_hang = h.ma_khach_hang
join dich_vu dv on h.ma_dich_vu = dv.ma_dich_vu
left join hop_dong_chi_tiet hd on hd.ma_hop_dong = h.ma_hop_dong
where month(ngay_lam_hop_dong) = 10 or month(ngay_lam_hop_dong) = 11 or month(ngay_lam_hop_dong)= 12 and year(ngay_lam_hop_dong) = 2020
and month(ngay_lam_hop_dong) not in(
select month(ngay_lam_hop_dong)
from hop_dong h 
where year(ngay_lam_hop_dong)= 2021 and month(ngay_lam_hop_dong) between 1 and 6) 
group by h.ma_hop_dong;

-- câu 13
select * , sum(hd.so_luong) as sl
from dich_vu_di_kem	dv
join hop_dong_chi_tiet hd on dv.ma_dich_vu_di_kem = hd.ma_dich_vu_di_kem 
group by hd.ma_dich_vu_di_kem
having sl  = (select sum(so_luong)
from hop_dong_chi_tiet 
group by ma_dich_vu_di_kem 
order by ma_dich_vu_di_kem desc
limit 1);

-- câu 14

select h.ma_hop_dong, l.ten_loai_dich_vu,dv.ten_dich_vu_di_kem,count(hd.ma_dich_vu_di_kem) as so_luong
from hop_dong h
join dich_vu d on h.ma_dich_vu = d.ma_dich_vu
join loai_dich_vu l on d.ma_loai_dich_vu = l.ma_loai_dich_vu
join hop_dong_chi_tiet hd on hd.ma_hop_dong = h.ma_hop_dong
join dich_vu_di_kem dv on hd.ma_dich_vu_di_kem  = dv.ma_dich_vu_di_kem
group by hd.ma_dich_vu_di_kem
having so_luong =1;
 
-- cau 15
select n.ma_nhan_vien, n.ho_ten, t.ten_trinh_do,b.ten_bo_phan,n.so_dien_thoai,n.dia_chi,count(h.ma_nhan_vien) as sl
from nhan_vien n join trinh_do t on n.ma_trinh_do = t.ma_trinh_do
join hop_dong h on h.ma_nhan_vien = n.ma_nhan_vien
join bo_phan b on n.ma_bo_phan = b.ma_bo_phan
where year(h.ngay_lam_hop_dong) between 2020 and 2021
group by h.ma_nhan_vien 
having sl <=3 ;
-- câu 16
-- chạy dòng này để không bị lỗi rằng buộc các khoá
SET SQL_SAFE_UPDATES = 0;
delete from nhan_vien
where ma_nhan_vien not in
(select ma_nhan_vien from hop_dong 
where year(ngay_lam_hop_dong) between 2019 and 2021
 group by ma_nhan_vien)  ;

-- câu 17 
update khach_hang k 
join hop_dong h on h.ma_khach_hang = k.ma_khach_hang
join hop_dong_chi_tiet hd on hd.ma_hop_dong = h.ma_hop_dong
join dich_vu_di_kem dv on hd.ma_dich_vu_di_kem = dv.ma_dich_vu_di_kem
join dich_vu d on h.ma_dich_vu = d.ma_dich_vu
set ma_loai_khach = 1
where ma_loai_khach = 2 and d.chi_phi_thue+hd.so_luong*dv.gia>=1000000 ;
 
-- câu 18--*********** làm sai: nên là trigger
delete from khach_hang
where ma_khach_hang in(select ma_khach_hang from hop_dong
where year(ngay_lam_hop_dong)<2021
group by ma_khach_hang);
--

-- câu 19 Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
UPDATE dich_vu_di_kem dv
        JOIN
    hop_dong_chi_tiet hd ON hd.ma_dich_vu_di_kem = dv.ma_dich_vu_di_kem
        JOIN
    hop_dong h ON hd.ma_hop_dong = h.ma_hop_dong 
SET 
    gia = gia * 2
WHERE
    dv.ma_dich_vu_di_kem IN (SELECT 
            hd.ma_dich_vu_di_kem
        FROM
            hop_dong_chi_tiet hd
                JOIN
            hop_dong h ON hd.ma_hop_dong = h.ma_hop_dong
        WHERE
            YEAR(h.ngay_lam_hop_dong) = 2020
        GROUP BY ma_dich_vu_di_kem
        HAVING COUNT(ma_dich_vu_di_kem) >= 10);
-- ****** 

/* đặt câu hỏi vì sao trong truy vấn con chỉ dc 1 cột
*/

-- ------
-- câu 20
select ma_khach_hang, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from khach_hang
union 
select ma_nhan_vien, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from nhan_vien 
;
-----------------------------
-- trigger cho câu 18 
delimiter $$
create trigger delete_khach_hang
 before delete on khach_hang
for each row
begin
delete from hop_dong_chi_tiet hdct where hdct.ma_hop_dong in (select ma_hop_dong from hop_dong hd where hd.ma_khach_hang = old.ma_khach_hang);

delete from hop_dong where ma_khach_hang = old.ma_khach_hang;
end $$
delimiter ;
drop trigger auto_create_jame;

--  câu 21--
create view n_nhan_vien as
select * from nhan_vien
where dia_chi like '%Đà Nẵng%' and ma_nhan_vien in( select ma_nhan_vien from hop_dong
where year(ngay_lam_hop_dong) = '12/12/2019'
group by ma_nhan_vien
having count(ma_nhan_vien)>=1
);
drop view n_nhan_vien;
/* câu 22 Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.
*/
update v_nhan_vien 
set dia_chi = 'Liên CHiểu';

-- câu 23
delimiter //
create procedure sp_xoa_khach_hang(in ma_khach_hang int)
begin
delete from khach_hang kh
where kh.ma_khach_hang = ma_khach_hang;
end //
delimiter ;
-- câu 24 Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu sp_them_moi_hop_dong phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.
delimiter //
create procedure sp_xoa_khach_hang(in
 h_ma_hop_dong int,
 h_ngay_lam_hop_dong date,
 h_ngay_ket_thuc date ,
 h_tien_dat_coc double,
 h_ma_nhan_vien int,
 h_ma_khach_hang int,
 h_ma_dich_vu int)
begin
declare lastId int ;
select max(ma_hop_dong) into lastId
from hop_dong;
if (h_ma_hop_dong <> lastId+1) then
signal sqlstate '0200' set message_text ='Invalid Id'; 
elseif (h_ngay_lam_hop_dong is null) then
signal sqlstate '0200' set message_text ='Invalid ngay_lam_hop_dong';
elseif( h_ngay_ket_thuc is null) then
signal sqlstate '0200' set message_text ='Invalid ngay_ket_thuc';
elseif( h_tien_dat_coc is null) then
signal sqlstate '0200' set message_text ='Invalid tien_dat_coc';
elseif(h_ma_nhan_vien not in(select ma_nhan_vien from nhan_vien)) then
signal sqlstate '0200' set message_text ='Invalid ma_nhan_vien';
elseif( h_ma_khach_hang not in(select  ma_khach_hang from khach_hang)) then
signal sqlstate '0200' set message_text ='Invalid ma_khach_hang';
elseif( h_ma_dich_vu not in(select ma_dich_vu from dich_vu)) then
signal sqlstate '0200' set message_text ='Invalid ma_dich_vu';
else  insert into hop_dong(ma_hop_dong,ngay_lam_hop_dong,ngay_ket_thuc, tien_dat_coc,
ma_nhan_vien,ma_khach_hang,ma_dich_vu)
values( h_ma_hop_dong,h_ngay_lam_hop_dong,h_ngay_ket_thuc,h_tien_dat_coc,h_ma_nhan_vien,
h_ma_khach_hang, h_ma_dich_vu) ;
end if;
end //
delimiter ;
-- câu 25
