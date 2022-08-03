use case_study_module_3;
select *
from nhan_vien;

-- câu 2----------
SELECT *
FROM  nhan_vien 
WHERE ho_ten REGEXP '^[HTK]' AND character_length(ho_ten) <= 15;

-- câu 3----------
select * ,(year(curdate()) - year(ngay_sinh)) as year1
FROM khach_hang s
group by s.ma_khach_hang 
having year1 >=18 and year1 <=50 and 
dia_chi = 'Đà Nẵng' or dia_chi = 'Quảng Trị';
-- update
update hop_dong
set ngay_lam_hop_dong = '2021-03-12 00:00:00'
where ma_hop_dong = 4;
-- câu 4--------
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

-- câu 6-------------
select d.ma_dich_vu , d.ten_dich_vu ,d.dien_tich , d.chi_phi_thue, l.ten_loai_dich_vu
from dich_vu d
join loai_dich_vu l on d.ma_loai_dich_vu = l.ma_loai_dich_vu
join hop_dong h on d.ma_dich_vu = h.ma_dich_vu
where d.ma_dich_vu not in(
 select h.ma_dich_vu
 from hop_dong h
 where month(h.ngay_lam_hop_dong) = 3 or month(h.ngay_lam_hop_dong) = 2 or month(h.ngay_lam_hop_dong) =1 and year(h.ngay_lam_hop_dong) = 2021)
 group by h.ma_dich_vu;
-- câu 7-----------------
select ma_dich_vu,ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ld.ten_loai_dich_vu
from dich_vu d
join loai_dich_vu ld on d.ma_loai_dich_vu = ld.ma_loai_dich_vu
where d.ma_dich_vu  not in(
select h.ma_dich_vu 
from hop_dong h 
where year(ngay_lam_hop_dong) <> 2020);
-- câu 8 ----
select ho_ten
from khach_hang
group by ho_ten;

-- câu 9
select month(ngay_lam_hop_dong) as tháng , count(ma_khach_hang) as so_luong_khach_hang
from hop_dong
where year(ngay_lam_hop_dong) = 2021
group by month(ngay_lam_hop_dong);

-- câu 10
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
-- câu 12
select h.ma_hop_dong , nv.ho_ten, kh.ho_ten, kh.so_dien_thoai,dv.ten_dich_vu, sum(hd.so_luong) as so_luong_dich_vu_di_kem,h.tien_dat_coc
from hop_dong h 
left join nhan_vien nv on nv.ma_nhan_vien = h.ma_nhan_vien
left join khach_hang kh on kh.ma_khach_hang = h.ma_khach_hang
left join dich_vu dv on h.ma_dich_vu = dv.ma_dich_vu
left join hop_dong_chi_tiet hd on hd.ma_hop_dong = h.ma_hop_dong
where month(ngay_lam_hop_dong) = 10 or month(ngay_lam_hop_dong) = 11 or month(ngay_lam_hop_dong)= 12 and year(ngay_lam_hop_dong) = 2020
and month(ngay_lam_hop_dong) not in(
select month(ngay_lam_hop_dong)
from hop_dong h 
where year(ngay_lam_hop_dong)= 2021 and month(ngay_lam_hop_dong) between 1 and 6) ;

-- câu 13
select * , sum(hd.so_luong) as sl
from dich_vu_di_kem	dv
join hop_dong_chi_tiet hd on dv.ma_dich_vu_di_kem = hd.ma_dich_vu_di_kem 
group by hd.ma_dich_vu_di_kem
having sl  = (select sum(so_luong)
from hop_dong_chi_tiet 
group by ma_dich_vu_di_kem 
order by count(ma_dich_vu_di_kem) desc
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
update dich_vu_di_kem dv 
join hop_dong_chi_tiet hd on hd.ma_dich_vu_di_kem = dv.ma_dich_vu_di_kem 
join hop_dong h on hd.ma_hop_dong = h.ma_hop_dong
set gia = gia*2
where dv.ma_dich_vu_di_kem in(select hd.ma_dich_vu_di_kem
from hop_dong_chi_tiet  hd
join hop_dong h on hd.ma_hop_dong = h.ma_hop_dong
where year(h.ngay_lam_hop_dong) = 2020
group by ma_dich_vu_di_kem
having count(ma_dich_vu_di_kem)>=10);
-- ****** đặt câu hỏi vì sao trong truy vấn con chỉ dc 1 cột
-- câu 20
select ma_khach_hang, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from khach_hang
union 
select ma_nhan_vien, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from nhan_vien 
;
-----------------------------
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

