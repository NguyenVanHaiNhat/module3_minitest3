drop database if exists quanlivattu;
create database if not exists quanlivattu;

use quanlivattu;

create table vat_tu(
id int auto_increment primary key,
ma_vat_tu varchar(255) not null,
ten_vat_tu varchar(255) not null,
don_vi_tinh varchar(255) not null,
gia_tien double not null
);

create table ton_kho(
id int auto_increment primary key,
so_luong_dau int not null,
tong_so_luong_nhap int not null,
tong_so_luong_xuat int not null,
id_vat_tu int,
foreign key (id_vat_tu) references vat_tu(id)
);

create table nha_cung_cap(
id int auto_increment primary key,
ma_nha_cung_cap varchar(255) not null,
ten_nha_cung_cap varchar(255) not null,
dia_chi varchar(255) not null,
so_dien_thoai varchar(255) not null
);

create table don_dat_hang(
id int auto_increment primary key,
ma_don varchar(255) not null,
ngay_dat_hang date not null,
id_nha_cung_cap int,
foreign key (id_nha_cung_cap) references nha_cung_cap(id)
);

create table phieu_nhap(
id int auto_increment primary key,
ma_phieu_nhap varchar(255) not null,
ngay_nhap date not null,
id_don_hang int,
foreign key (id_don_hang) references don_dat_hang(id)
);

create table phieu_xuat(
id int auto_increment primary key,
ma_phieu_xuat varchar(255) not null,
ngay_xuat date not null,
ten_khach_hang varchar(255) not null
);

create table chi_tiet_don_hang(
id int auto_increment primary key,
id_don_hang int,
id_vat_tu int,
so_luong_dat int not null,
foreign key (id_don_hang) references don_dat_hang(id),
foreign key (id_vat_tu) references vat_tu(id)
);

create table chi_tiet_phieu_nhap(
id int auto_increment primary key,
id_phieu_nhap int,
id_vat_tu int,
so_luong_nhap int not null,
don_gia_nhap double not null,
ghi_chu text not null,
foreign key (id_phieu_nhap) references phieu_nhap(id),
foreign key (id_vat_tu) references vat_tu(id)
);

create table chi_tiet_phieu_xuat(
id int auto_increment primary key,
id_phieu_xuat int,
id_vat_tu int,
so_luong_xuat int not null,
don_gia_xuat double not null,
ghi_chu text not null,
foreign key (id_phieu_xuat) references phieu_xuat(id),
foreign key (id_vat_tu) references vat_tu(id)
);

SELECT * FROM quanlivattu.vat_tu;

insert into quanlivattu.vat_tu(ma_vat_tu, ten_vat_tu, don_vi_tinh, gia_tien) value
('s1', 'thép', 'kg', 12600),
('s2', 'xi măng', 'kg', 1840),
('s3', 'gạch', 'viên', 980),
('s4', 'cát', 'mét khối', 135000),
('s5', 'sắt', 'cây', 70484);	

SELECT * FROM quanlivattu.ton_kho;

insert into quanlivattu.ton_kho(so_luong_dau, tong_so_luong_nhap, tong_so_luong_xuat, id_vat_tu) value
(23, 250, 200, 1),
(12, 222, 150, 2),
(130, 260, 130, 3),
(162, 320, 200, 4),
(192, 250, 200, 5);

SELECT * FROM quanlivattu.nha_cung_cap;

insert into quanlivattu.nha_cung_cap(ma_nha_cung_cap, ten_nha_cung_cap, dia_chi, so_dien_thoai) value
('ST1', 'Hòa Phát', 'TP Hồ Chí Minh', '02862975599'),
('ST2', 'Văn Đạt', 'Hà Tĩnh', '01258369147'),
('ST3', 'Hải Nhật', 'Quảng Trị', '0945962203');

SELECT * FROM quanlivattu.don_dat_hang;

insert into quanlivattu.don_dat_hang(ma_don, ngay_dat_hang, id_nha_cung_cap) value
('h1', '2024-01-12', 1),
('h2', '2024-02-28', 2),
('h3', '2024-01-29', 3);

SELECT * FROM quanlivattu.phieu_nhap;

insert into quanlivattu.phieu_nhap(ma_phieu_nhap, ngay_nhap, id_don_hang) value
('g1', '2024-01-23', 1),
('g2', '2024-03-24', 2),
('g3', '2024-06-22', 3);

SELECT * FROM quanlivattu.phieu_xuat;

insert into quanlivattu.phieu_xuat(ma_phieu_xuat, ngay_xuat, ten_khach_hang) value
('f1', '2024-02-28', 'nhật'),
('f2', '2024-05-23', 'đạt'),
('f3', '2024-08-12', 'nhơn');

SELECT * FROM quanlivattu.chi_tiet_don_hang;

insert into quanlivattu.chi_tiet_don_hang(id_don_hang, id_vat_tu, so_luong_dat) value
(1, 1, 100),
(2, 2, 120),
(3, 3, 250),
(1, 4, 200),
(2, 5, 235),
(3, 5, 260);

SELECT * FROM quanlivattu.chi_tiet_phieu_nhap;

insert into quanlivattu.chi_tiet_phieu_nhap(id_phieu_nhap, id_vat_tu, so_luong_nhap, don_gia_nhap, ghi_chu) value
(1, 1, 15, 160000, 'đắt'),
(2, 2, 25, 300000, 'lên giá'),
(3, 3, 28, 360000, 'rẻ'),
(1, 4, 23, 250000, 'đắt'),
(2, 5, 62, 10000000, 'nhiều'),
(3, 2, 31, 1000000, 'nhiều');

SELECT * FROM quanlivattu.chi_tiet_phieu_xuat;

insert into quanlivattu.chi_tiet_phieu_xuat(id_phieu_xuat, id_vat_tu, so_luong_xuat, don_gia_xuat, ghi_chu) value
(1, 1, 15, 260000, 'lời'),
(2, 2, 21, 500000, 'lên giá'),
(3, 3, 25, 460000, 'rẻ'),
(1, 4, 23, 350000, 'lỗ'),
(2, 5, 67, 20000000, 'rất nhiều'),
(3, 2, 41, 2000000, 'nhiều');

-- Câu 1. Tạo view có tên vw_CTPNHAP bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.

create view vw_CTPNHAP as
select ma_phieu_nhap, ma_vat_tu, so_luong_nhap, don_gia_nhap, (so_luong_nhap * don_gia_nhap) as 'thành tiền nhập'
from quanlivattu.chi_tiet_phieu_nhap cn join quanlivattu.vat_tu vt on cn.id_vat_tu = vt.id
join quanlivattu.phieu_nhap pn on cn.id_phieu_nhap = pn.id;

select * from vw_CTPNHAP;

-- Câu 2. Tạo view có tên vw_CTPNHAP_VT bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.

create view vw_CTPNHAP_VT as
select ma_phieu_nhap, ma_vat_tu, ten_vat_tu, so_luong_nhap, don_gia_nhap, (so_luong_nhap * don_gia_nhap) as 'thành tiền nhập'
from quanlivattu.chi_tiet_phieu_nhap cn join quanlivattu.vat_tu vt on cn.id_vat_tu = vt.id
join quanlivattu.phieu_nhap pn on cn.id_phieu_nhap = pn.id;

select * from vw_CTPNHAP_VT;

-- Câu 3. Tạo view có tên vw_CTPNHAP_VT_PN bao gồm các thông tin sau: số phiếu nhập hàng, ngày nhập hàng, số đơn đặt hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập,
-- thành tiền nhập.

create view vw_CTPNHAP_VT_PN as
select ma_phieu_nhap, ngay_nhap, so_luong_dat, ma_vat_tu, ten_vat_tu, so_luong_nhap, don_gia_nhap, (so_luong_nhap * don_gia_nhap) as 'thành tiền nhập'
from quanlivattu.chi_tiet_phieu_nhap cn join quanlivattu.vat_tu vt on cn.id_vat_tu = vt.id
join quanlivattu.phieu_nhap pn on cn.id_phieu_nhap = pn.id 
join quanlivattu.chi_tiet_don_hang dh on dh.id_vat_tu = vt.id;

select * from vw_CTPNHAP_VT_PN;

-- Câu 4. Tạo view có tên vw_CTPNHAP_VT_PN_DH bao gồm các thông tin sau: số phiếu nhập hàng, ngày nhập hàng, số đơn đặt hàng, mã nhà cung cấp, mã vật tư, tên vật tư, số lượng nhập
-- , đơn giá nhập, thành tiền nhập.

create view vw_CTPNHAP_VT_PN_DH as
select ma_phieu_nhap, ngay_nhap, so_luong_dat, ma_nha_cung_cap, ma_vat_tu, ten_vat_tu, so_luong_nhap, don_gia_nhap, (so_luong_nhap * don_gia_nhap) as 'thành tiền nhập'
from quanlivattu.chi_tiet_phieu_nhap cn join quanlivattu.vat_tu vt on cn.id_vat_tu = vt.id
join quanlivattu.phieu_nhap pn on cn.id_phieu_nhap = pn.id 
join quanlivattu.chi_tiet_don_hang dh on dh.id_vat_tu = vt.id
join quanlivattu.don_dat_hang ddh on dh.id_don_hang = ddh.id
join quanlivattu.nha_cung_cap ncc on ddh.id_nha_cung_cap = ncc.id;

select * from vw_CTPNHAP_VT_PN_DH;	

-- Câu 5. Tạo view có tên vw_CTPNHAP_loc  bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập. Và chỉ liệt kê các chi tiết nhập
-- có số lượng nhập > 5.

create view vw_CTPNHAP_loc as
select ma_phieu_nhap, ma_vat_tu, so_luong_nhap, don_gia_nhap, (so_luong_nhap * don_gia_nhap) as 'thành tiền nhập'
from quanlivattu.chi_tiet_phieu_nhap cn join quanlivattu.vat_tu vt on cn.id_vat_tu = vt.id
join quanlivattu.phieu_nhap pn on cn.id_phieu_nhap = pn.id
where cn.don_gia_nhap > 5;

select * from vw_CTPNHAP_loc;

-- Câu 6. Tạo view có tên vw_CTPNHAP_VT_loc bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.
-- Và chỉ liệt kê các chi tiết nhập vật tư có đơn vị tính là Bộ.

create view vw_CTPNHAP_VT_loc as
select ma_phieu_nhap, ma_vat_tu, ten_vat_tu, so_luong_nhap, don_gia_nhap, (so_luong_nhap * don_gia_nhap) as 'thành tiền nhập'
from quanlivattu.chi_tiet_phieu_nhap cn join quanlivattu.vat_tu vt on cn.id_vat_tu = vt.id
join quanlivattu.phieu_nhap pn on cn.id_phieu_nhap = pn.id
where vt.don_vi_tinh = 'kg';

select * from vw_CTPNHAP_VT_loc;

-- Câu 7. Tạo view có tên vw_CTPXUAT bao gồm các thông tin sau: số phiếu xuất hàng, mã vật tư, số lượng xuất, đơn giá xuất, thành tiền xuất.

create view vw_CTPXUAT as
select ma_phieu_xuat, ma_vat_tu, so_luong_xuat, don_gia_xuat, (so_luong_xuat * don_gia_xuat) as 'thành tiền xuất'
from quanlivattu.chi_tiet_phieu_xuat cx join quanlivattu.vat_tu vt on cx.id_vat_tu = vt.id
join quanlivattu.phieu_xuat px on cx.id_phieu_xuat = px.id;

select * from vw_CTPXUAT;

-- Câu 8. Tạo view có tên vw_CTPXUAT_VT bao gồm các thông tin sau: số phiếu xuất hàng, mã vật tư, tên vật tư, số lượng xuất, đơn giá xuất.

create view vw_CTPXUAT_VT as
select ma_phieu_xuat, ma_vat_tu, ten_vat_tu, so_luong_xuat, don_gia_xuat
from quanlivattu.chi_tiet_phieu_xuat cx join quanlivattu.vat_tu vt on cx.id_vat_tu = vt.id
join quanlivattu.phieu_xuat px on cx.id_phieu_xuat = px.id;

select * from vw_CTPXUAT_VT;

-- Câu 9. Tạo view có tên vw_CTPXUAT_VT_PX bao gồm các thông tin sau: số phiếu xuất hàng, tên khách hàng, mã vật tư, tên vật tư, số lượng xuất, đơn giá xuất.

create view vw_CTPXUAT_VT_PX as
select ma_phieu_xuat, ten_khach_hang, ma_vat_tu, ten_vat_tu, so_luong_xuat, don_gia_xuat
from quanlivattu.chi_tiet_phieu_xuat cx join quanlivattu.vat_tu vt on cx.id_vat_tu = vt.id
join quanlivattu.phieu_xuat px on cx.id_phieu_xuat = px.id;

select * from vw_CTPXUAT_VT_PX;

-- Câu 10. Tạo Stored procedure (SP) cho biết tổng số lượng cuối của vật tư với mã vật tư là tham số vào.

DELIMITER //
create procedure getTotalFinal
(in ma_vt varchar(255))
begin
select ma_vat_tu, (tong_luong_dau + tong_so_luong_nhap - tong_so_luong_xuat) as 'tổng số lượng cuối'
from quanlivattu.vat_tu vt join quanlivattu.ton_kho tk on vt.id = tk.id_vat_tu
where vt.ma_vat_tu = ma_VT;
end //
DELIMITER //

call getTotalFinal('s1');

-- Câu 2. Tạo SP cho biết tổng tiền xuất của vật tư với mã vật tư là tham số vào, out là tổng tiền xuất

DELIMITER //
create procedure getPriceOut
(in ma_vt varchar(255))
begin
select ma_vat_tu, (tong_so_luong_xuat * gia_tien) as 'tổng tiền xuất'
from quanlivattu.vat_tu vt join quanlivattu.ton_kho tk on vt.id = tk.id_vat_tu
where vt.ma_vat_tu = ma_VT;
end //
DELIMITER //

call getPriceOut('s2');

-- Câu 3. Tạo SP cho biết tổng số lượng đặt theo số đơn hàng với số đơn hàng là tham số vào.

DELIMITER //
create procedure getQuantity
(in madon varchar(255))
begin
select ma_don, so_luong_dat 
from quanlivattu.don_dat_hang ddh join quanlivattu.chi_tiet_don_hang dh on ddh.id = dh.id_don_hang
where ddh.ma_don = madon;
end //
DELIMITER //

call getQuantity('h1');

-- Câu 4. Tạo SP dùng để thêm một đơn đặt hàng.

DELIMITER //
create procedure addNewOrder(
ma_don varchar(255),
ngay_dat_hang date,
id_nha_cung_cap int
)
begin
insert into quanlivattu.don_dat_hang(ma_don, ngay_dat_hang, id_nha_cung_cap) value
(ma_don, ngay_dat_hang, id_nha_cung_cap);
end//
DELIMITER //

call addNewOrder('h4', '2024-01-23', 1);
select * from quanlivattu.don_dat_hang;

-- Câu 5. Tạo SP dùng để thêm một chi tiết đơn đặt hàng.

DELIMITER //
create procedure addNew(
id_don_hang int,
id_vat_tu int,
so_luong_dat int
)
begin
insert into quanlivattu.chi_tiet_don_hang(id_don_hang, id_vat_tu, so_luong_dat) value
(id_don_hang, id_vat_tu, so_luong_dat);
end //
DELIMITER //

call addNew(1, 1, 15);
select * from quanlivattu.chi_tiet_don_hang;
