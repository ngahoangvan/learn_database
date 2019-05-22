# Câu 3: Liệt kê những cây cảnh có DonGiaChoThue nhỏ hơn 50000 VND. (0.5 điểm)

select * from caycanh where DonGiaChoThue < 50000;

# Câu 4: Liệt kê những khách hàng có địa chỉ ở 'Lien Chieu' mà có số điện thoại bắt đầu bằng '090' và
# những khách hàng có địa chỉ ở 'Thanh Khe' mà có số điện thoại bắt đầu bằng'091'. (0.5 điểm)

select * from khachhang where (DiaChiKH = 'Lien Chieu' and SoDienThoaiKH like '090%') 
						   or (DiaChiKH = 'Thanh Khe' and SoDienThoaiKH like '091%');
                           
# Câu 5: Liệt kê thông tin của các khách hàng có họ (trong họ tên) là 'Bui'. (0.5 điểm)

select * from khachhang where HoTenKH like 'Bui%';

# Câu 6: Liệt kê thông tin của toàn bộ các cây cảnh, yêu cầu sắp xếp giảm dần theo MoTa và
# giảm dần theo DonGiaChoThue. (0.5 điểm)

select * from caycanh group by MoTa order by DonGiaChoThue desc;

# Câu 7: Liệt kê các hợp đồng cho thuê có trạng thái là 'Da ket thuc' hoặc chưa xác định (có
# giá trị là NULL). (0.5 điểm)

select * from hopdongchothue where TrangThaiHopDong in ('NULL', 'Da ket thuc');

# Câu 8: Liệt kê họ tên của toàn bộ khách hàng với yêu cầu mỗi họ tên chỉ được liệt kê một
# lần duy nhất. (0.5 điểm)

select distinct HoTenKH from khachhang;

# Câu 9: Liệt kê MaHopDong, MaKH, TrangThaiHopDong, MaCayCanh, SoLuong của tất
# cả các hợp đồng có trạng thái là 'Dang cho thue'. (0.5 điểm)

select hd.MaHopDong, MaKH, TrangThaiHopDong, MaCayCanh, SoLuong
from hopdongchothue hd join chitiethopdong ct on hd.MaHopDong= ct.MaHopDong 
where TrangThaiHopDong = 'Dang Cho Thue';

# Câu 10: Liệt kê MaHopDong, MaKH, TrangThaiHopDong, MaCayCanh, SoLuong của
# tất cả các hợp đồng với yêu cầu những hợp đồng nào chưa có một chi tiết hợp đồng nào
# thì cũng phải liệt kê thông tin những hợp đồng đó ra. (0.5 điểm)

select hd.MaHopDong, MaKH, TrangThaiHopDong, MaCayCanh, SoLuong
from hopdongchothue hd left join chitiethopdong ct on hd.MaHopDong= ct.MaHopDong;

# Câu 11: Liệt kê thông tin của các khách hàng ở địa chỉ là 'Hai Chau' đã từng thuê cây cảnh
# thuộc loại cây cảnh có mô tà là 'Chung o phong khach' hoặc các khách hàng từng thuê cây
# cảnh với thời gian bắt đầu thuê là '11/12/2017'. (0.5 điểm)

select distinct kh.*
from khachhang kh join hopdongchothue hd on kh.MaKH = hd.MaKH
	 join chitiethopdong ct on hd.MaHopDong = ct.MaHopDong
     join caycanh cc on ct.MaCayCanh = cc.MaCayCanh
     join loaicaycanh lcc on cc.MaLoaiCC = lcc.MaLoaiCC
where lcc.MoTaLoaiCC = 'Chung o phong khach' or ct.NgayBatDauChoThue > '2017-12-11'
order by kh.MaKH asc;

# Câu 12: Liệt kê thông tin của các khách hàng chưa từng thuê cây cảnh một lần nào cả.
# (0.5 điểm)

# Use In
select distinct *
from khachhang
where MaKH not in (
select distinct kh.MaKH
from khachhang kh join hopdongchothue hd on kh.MaKH = hd.MaKH);

# Use not exists
select distinct *
from khachhang kh
where not exists(
select *
from hopdongchothue hd where kh.MaKH = hd.MaKH);
     
# Câu 13: Liệt kê thông tin của các khách hàng đã từng thuê loại cây cảnh được mô tả là
# 'Chung o phong khach' và đã từng thuê cây cảnh vào tháng 12 năm 2017 (gợi ý: dựa theo
# ngày bắt đầu thuê). (0.5 điểm)

select distinct kh.*
from khachhang kh join hopdongchothue hd on kh.MaKH = hd.MaKH
	 join chitiethopdong ct on hd.MaHopDong = ct.MaHopDong
     join caycanh cc on ct.MaCayCanh = cc.MaCayCanh
     join loaicaycanh lcc on cc.MaLoaiCC = lcc.MaLoaiCC
where lcc.MoTaLoaiCC = 'Chung o phong khach' 
      and month(ct.NgayBatDauChoThue) = 12 and year(ct.NgayBatDauChoThue) = 2017;
      
# Câu 14: Liệt kê thông tin của những khách hàng đã từng thuê cây cảnh vào năm 2016
# nhưng chưa từng thuê vào năm 2017 (gợi ý: dựa theo ngày bắt đầu thuê). (0.5 điểm)
select kh.*, ct.NgayBatDauChoThue
from khachhang kh join hopdongchothue hd on kh.MaKH = hd.MaKH
	 join chitiethopdong ct on hd.MaHopDong = ct.MaHopDong
where year(ct.NgayBatDauChoThue) = 2016 and year(ct.NgayBatDauChoThue) ;

select kh.MaKH
from khachhang kh
where kh.MaKH not in (
select kh.MaKH
from  hopdongchothue hd 
	 join chitiethopdong ct on hd.MaHopDong = ct.MaHopDong
where year(ct.NgayBatDauChoThue) in (2014,2015,2017) and kh.MaKH = hd.MaKH);



# Câu 15: Hiển thị MaCayCanh, MaLoaiCC của những cây cảnh từng được thuê với số
# lượng lớn hơn 10 trong một hợp đồng bất kỳ nào đó. Kết quả hiển thị cần được xóa bớt
# dữ liệu bị trùng lặp. (0.5 điểm)

select distinct cc.MaCayCanh, cc.MaLoaiCC
from caycanh cc join chitiethopdong ct on cc.MaCayCanh = ct.MaCayCanh
where ct.SoLuong > 10;

# Câu 16: Đếm tổng số khách hàng đã thuê cây cảnh trong năm 2016 với yêu cầu chỉ thực
# hiện tính đối với những khách hàng đã từng thuê ít nhất 2 lần (có từ 2 hợp đồng khác
# nhau với công ty trở lên) vào năm 2016. (0.5 điểm)

select kh.MaKH ,count(kh.MaKH) as Tong_Lan_Thue
from khachhang kh join hopdongchothue hd on kh.MaKH = hd.MaKH
		join chitiethopdong ct on ct.MaHopDong = hd.MaHopDong
where year(ct.NgayBatDauChoThue) = 2016
group by kh.MaKH
having Tong_Lan_Thue >= 2;


# Câu 17: Liệt kê những khách hàng chỉ mới thuê 1 lần duy nhất (chỉ có 1 hợp đồng duy
# nhất với công ty) và chỉ thuê 1 nhóm cây cảnh duy nhất trong năm 2017, kết quả được
# sắp xếp giảm dần theo MaKhachHang. (0.5 điểm)

# Câu 18: Cập nhật cột TrangThaiHopDong trong bảng HOPDONGCHOTHUE thành giá
# trị 'Bi huy' đối với những hợp đồng có TrangThaiHopDong là 'Chua bat dau' và có
# SoTienDatCoc là 0 VND. (0.5 điểm)

update hopdongchothue hd
set hd.TrangThaiHopDong = 'Bi Huy'
where hd.TrangThaiHopDong = 'Chua bat dau' and hd.SoTienDatCoc = '0';

# Câu 19: Cập nhật cột NgayKetThucChoThue trong bảng CHITIETHOPDONG thành
# NULL cho những cây cảnh đã từng được cho thuê từ 2 lần trở lên. (0.5 điểm)

update chitiethopdong ct
set ct.NgayKetThucChoThue = 'NULL'
where ct.MaCayCanh in (
select cc.MaCayCanh
from caycanh cc join chitiethopdong ct on cc.MaCayCanh = ct.MaCayCanh
group by cc.MaCayCanh
having count(cc.MaCayCanh) >= 2
);

# Câu 20: Xóa những loại dịch vụ chưa từng được sử dụng trong bất kỳ một hợp đồng nào.
# (0.5 điểm)
