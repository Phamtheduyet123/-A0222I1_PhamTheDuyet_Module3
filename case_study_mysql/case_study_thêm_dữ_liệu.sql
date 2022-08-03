use `case_study_module_3`;
INSERT INTO bo_phan (`ma_bo_phan`, `ten_bo_phan`) VALUES
('1', 'Sale-Marketing'),
('2', 'hanh chinh'),
('3', 'phuc vu'),
('4','quan ly');
INSERT INTO trinh_do (`ma_trinh_do`, `ten_trinh_do`) VALUES
('1', 'trung cap'),
('2', 'cao dang'),
('3', 'dai hoc'),
('4','sau dai hoc');
INSERT INTO vi_tri (`ma_vi_tri`, `ten_vi_tri`) VALUES
('1', 'quan ly'),
('2', 'nhan vien');
INSERT INTO nhan_vien ( `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`, `ma_vi_tri`, `ma_trinh_do`, `ma_bo_phan`)
 VALUES ( 'Nguyễn Văn An', '1970-11-07', '413131', '123445', '41241244', 'nv1441@gmail.com', '295 Nguyễn Tất Thành, Đà Nẵng', '1', '3', '1'),
 ('Lê Văn Bình', '1997-04-09', '513131', '233411', '5125125', 'nv5111@gmail.com', '22 Yên Bái, Đà Nẵng', '1', '2', '2'),
 ( 'Hồ Thị Yến', '1997-04-09', '515555', '321121', '12313123', 'nv15112@gmail.com', 'K234/11 Điện Biên Phủ, Gia Lai', '1', '3', '2'),
 ( 'Võ Công Toản', '1980-04-04', '984567', '125521', '5623244', 'nv15512@gmail.com', '77 Hoàng Diệu, Quảng Trị', '1', '4', '4'),
 ( 'Nguyễn Bỉnh Phát', '1999-12-09', '984567', '125521', '5623244', 'nv15512@gmail.com', '43 Yên Bái, Đà Nẵng', '2', '1', '1'),
 ( 'Khúc Nguyễn An Nghi', '2000-11-08', '984567', '125521', '5623244', 'nv15512@gmail.com', '294 Nguyễn Tất Thành, Đà Nẵng', '2', '2', '3'),
 ( 'Nguyễn Hữu Hà', '1993-01-01', '984567', '125521', '5623244', 'nv15512@gmail.com', '4 Nguyễn Chí Thanh, Huế', '2', '3', '2'),
 ( 'Nguyễn Hà Đông', '1989-09-03', '984567', '125521', '5623244', 'nv15512@gmail.com', '111 Hùng Vương, Hà Nội', '2', '4', '4'),
 ( 'Tòng Hoang', '1982-09-03', '984567', '125521', '5623244', 'nv15512@gmail.com', '213 Hàm Nghi, Đà Nẵng', '2', '4', '4'),
 ( 'Nguyễn Công Đạo', '1994-01-08', '984567', '125521', '5623244', 'nv15512@gmail.com', '6 Hoà Khánh, Đồng Nai', '2', '3', '2');
 INSERT INTO loai_khach (`ma_loai_khach`, `ten_loai_khach`) VALUES
 ('1', 'diamond'),
('2', 'platinum'),
('3', 'gold'),
('4', 'silver'),
('5','member');
INSERT INTO khach_hang (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) VALUES
('1', '5', 'Nguyễn Thị Hào', '1970-11-07', b'1', '11413', '40959', 'cumeo154@gmail.com','23 Nguyễn Hoàng, Đà Nẵng'),
('2', '3', 'Phạm Xuân Diệu', '1992-08-08', b'1', '99212', '41211', 'piupiu1@gmail.com', 'K77/22 Thái Phiên, Quảng Trị'),
('3', '1', 'Trương Đình Nghệ', '1990-02-27', b'0', '28811', '12431', 'piupiu12@gmail.com', 'K323/12 Ông Ích Khiêm, Vinh'),
('4', '1', 'Dương Văn Quan', '1981-07-08', b'0', '51212', '51221', 'piupiu15@gmail.com', 'K453/12 Lê Lợi, Đà Nẵng'),
('5', '4', 'Hoàng Trần Nhi Nhi', '1995-12-09', b'0', '50019', '09531', 'piupiu11@gmail.com', '224 Lý Thái Tổ, Gia Lai'),
('6', '4', 'Tôn Nữ Mộc Châu', '2005-12-06', b'1', '87122', '99531', 'piupiu95@gmail.com', '37 Yên Thế, Đà Nẵng'),
('7', '1', 'Nguyễn Mỹ Kim', '1984-04-08', b'0', '50979', '78921', 'piupiu1411@gmail.com', 'K123/45 Lê Lợi, Hồ Chí Minh'),
('8', '3', 'Nguyễn Thị Hào', '1999-04-08', b'1', '51111', '98021', 'piupiu189@gmail.com', '55 Nguyễn Văn Linh, Kon Tum'),
('9', '1', 'Trần Đại Danh', '1994-07-01', b'1', '09785', '97811', 'piupiu1902@gmail.com', '24 Lý Thường Kiệt, Quảng Ngãi'),
('10', '2', 'Nguyễn Tâm Đắc', '1989-07-01', b'0', '88592', '72158', 'thuytien@gmail.com', '22 Ngô Quyền, Đà Nẵng');
INSERT INTO kieu_thue (`ma_kieu_thue`, `ten_kieu_thue`) VALUES ('1', 'year'),
('2', 'month'),
('3', 'day'),
('4', 'hour');
INSERT INTO dich_vu_di_kem (`ma_dich_vu_di_kem`, `ten_dich_vu_di_kem`, `gia`, `don_vi`, `trang_thai`)
VALUES ('1', 'karaoke', '10000', 'gio', 'tiện nghi, hiện tại'),
('2', 'Thuê xe máy', '10000', 'chiec', 'hỏng 1 xe'),
('3', 'Thuê xe đạp', '20000', 'chiec', 'tốt'),
('4', 'Buffet buổi sáng', '15000', 'suat', 'đầy đủ đồ ăn, tráng miệng'),
('5', 'Buffet buổi trưa', '90000', 'suat', 'đầy đủ đồ ăn, tráng miệng'),
('6', 'Buffet buổi tối', '16000', 'suat', 'đầy đủ đồ ăn, tráng miệng');
INSERT INTO loai_dich_vu (`ma_loai_dich_vu`, `ten_loai_dich_vu`) VALUES
('1', 'villa'),
('2', 'room'),
('3', 'house');
INSERT INTO dich_vu(`ma_dich_vu`, `ten_dich_vu`, `dien_tich`, `chi_phi_thue`, `so_nguoi_toi_da`, `ma_kieu_thue`, `ma_loai_dich_vu`, `tieu_chuan_phong`, `mo_ta_tien_nghi_khac`, `dien_tich_ho_boi`, `so_tang`) VALUES
('1', 'Villa Beach Front', '25000', '1000000', '10', '3', '1', 'VIP', 'Có hồ bơi', '500', '3'),
('2', 'House Princess 01', '14000', '5000000', '7', '2', '2', 'VIP', 'Có thêm bếp nướng', '0', '2'),
('3', 'Room Twin 01', '5000', '1000000', '2', '4', '3', 'Normal', 'Có tivi', '0', '0'),
('4', 'Villa No Beach Front', '22000', '9000000', '8', '3', '1', 'Normal', 'Có hồ bơi', '300', '3'),
('5', 'House Princess 02', '10000', '4000000', '5', '3', '2', 'Normal', 'Có thêm bếp nướng', '0', '2'),
('6', 'Room Twin 02', '3000', '900000', '2', '4', '3', 'Normal', 'Có tivi', '0', '0');
INSERT INTO hop_dong (`ma_hop_dong`, `ngay_lam_hop_dong`, `ngay_ket_thuc`, `tien_dat_coc`, `ma_nhan_vien`, `ma_khach_hang`, `ma_dich_vu`) VALUES
('1', '2020-12-08', '2020-12-08', '0', '3', '1', '3'),
('2', '2020-07-14', '2020-07-21', '200000', '7', '3', '1'),
('3', '2021-03-15', '2021-03-17', '50000', '3', '4', '2'),
('4', '2021-01-14', '2021-01-18', '100000', '7', '5', '5'),
('5', '2021-07-14', '2021-07-15', '0', '7', '2', '6'),
('6', '2021-06-01', '2021-06-03', '0', '7', '7', '6'),
('7', '2021-09-02', '2021-09-05', '100000', '7', '4', '4'),
('8', '2021-06-17', '2021-06-18', '150000', '3', '4', '1'),
('9', '2020-11-19', '2020-11-19', '0', '3', '4', '3'),
('10', '2021-04-12', '2021-04-14', '0', '10', '3', '5'),
('11', '2021-04-25', '2021-04-25', '0', '2', '2', '1'),
('12', '2021-05-25', '2021-05-27', '0', '7', '10', '1');
INSERT INTO hop_dong_chi_tiet (`ma_hop_dong_chi_tiet`, `ma_hop_dong`, `ma_dich_vu_di_kem`, `so_luong`) VALUES
('1', '2', '4', '5'),
('2', '2', '5', '8'),
('3', '2', '6', '15'),
('4', '3', '1', '1'),
('5', '3', '2', '11'),
('6', '1', '3', '1'),
('7', '1', '2', '2'),
('8', '12', '2', '2');