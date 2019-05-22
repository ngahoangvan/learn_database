-- Câu 3: Liệt kê những hộ dân có từ 5 nhân khẩu trở lên (0.5 điểm)

SELECT "HoTenChuHo", "SoNhanKhau"
FROM public."HO_DAN"
WHERE "SoNhanKhau" >= 5

-- Câu 4: Liệt kê các hộ dân là hộ nghèo và thuộc diện gia đình 'Thuong binh'
-- và các hộ dân không là hộ nghèo và thuộc diện gia đình 'Cong nhan vien chuc' (0.5 điểm)

SELECT "HoTenChuHo"
FROM public."HO_DAN"
WHERE "DienGiaDinh" = 'Thuong binh' AND "LaHoNgheo" = 'true'
    OR "DienGiaDinh" = 'Cong nhan vien chuc' AND "LaHoNgheo" = 'false'

-- Câu 5: Liệt kê các đơn vị ủng hộ có MaDVUH bắt đầu bằng cụm từ "CTY" (0.5 điểm)

SELECT "MaDVUH", "HoTenNguoiDaiDien", "DiaChiNguoiDaiDien"
FROM public."DON_VI_UNG_HO"
WHERE "MaDVUH" LIKE 'CTY%'

-- Câu 6: Liệt kê thông tin của toàn bộ các hộ dân, yêu cầu sắp xếp giảm dần theo số nhân khẩu (0.5 điểm)

SELECT *
FROM public."HO_DAN"
ORDER BY "SoNhanKhau" DESC

-- Câu 7: Đếm số lượt ủng hộ diễn ra trong ngày hiện tại (của hệ thống) (0.5 điểm)

SELECT COUNT("MaDotUngHo") AS "SoDotUngHoTrongNgay"
FROM public."DOT_UNG_HO"
WHERE "NgayUngHo" = CURRENT_DATE

-- Câu 8: Liệt kê toàn bộ các loại diện gia đình trong bảng HO_DAN với yêu cầu mỗi loại diện gia đình được liệt kê một lần duy nhất (0.5 điểm)

SELECT DISTINCT "DienGiaDinh"
FROM public."HO_DAN"

-- Câu 9: Liệt kê MaDotUngHo, NgayUngHo, HoTenNguoiDaiDien, DiaChiNguoiDaiDien, SoDienThoaiLienLac, SoCMNDNguoiDaiDien
-- của tất cả các đợt ủng hộ có trong hệ thống (0.5 điểm)


SELECT "MaDotUngHo", "NgayUngHo", "HoTenNguoiDaiDien", "DiaChiNguoiDaiDien", "SoDienThoaiLienLac", "SoCMNDNguoiDaiDien"
FROM public."DOT_UNG_HO" INNER JOIN public."DON_VI_UNG_HO" ON "DON_VI_UNG_HO"."MaDVUH" = "DOT_UNG_HO"."MaDVUH"

-- Câu 10: Liệt kê MaHoDan, HoTenChuHo, ToDanPho, KhoiHoacThon, DienGiaDinh, MaDotNhanUngHo, NgayNhanUngHo của tất cả các hộ dân
-- với yêu cầu những hộ dân nào chưa từng được nhận ủng hộ lần nào thì cũng liệt kê thông tin những hộ dân đó ra (0.5 điểm)


SELECT "HO_DAN"."MaHoDan", "HoTenChuHo", "ToDanPho", "KhoiHoacThon", "DienGiaDinh", "MaDotNhanUngHo", "NgayNhanUngHo"
FROM public."HO_DAN" LEFT JOIN public."DOT_NHAN_UNG_HO" ON "HO_DAN"."MaHoDan" = "DOT_NHAN_UNG_HO"."MaHoDan"

-- Câu 11: Liệt kê thông tin của các hộ dân đã từng được nhận ủng hộ dưới hình thức là 'Tien mat' hoặc là hộ dân thuộc diện hộ nghèo
-- mà có số nhân khẩu dưới 3 người (0.5 điểm)

SELECT *
FROM public."HO_DAN"
WHERE EXISTS ( SELECT *
    FROM public."DOT_NHAN_UNG_HO"
        INNER JOIN public."CHI_TIET_NHAN_UNG_HO" ON "DOT_NHAN_UNG_HO"."MaDotNhanUngHo" = "CHI_TIET_NHAN_UNG_HO"."MaDotNhanUngHo"
        INNER JOIN public."HINH_THUC_UH" ON "CHI_TIET_NHAN_UNG_HO"."MaHinhThucUH" = "HINH_THUC_UH"."MaHinhThucUH"
    WHERE "HO_DAN"."MaHoDan" = "DOT_NHAN_UNG_HO"."MaHoDan" AND "TenHinhThucUngHo" = 'Tien mat')
    OR "LaHoNgheo" = 'true' AND "SoNhanKhau" < 3

-- Câu 12: Liệt kê thông tin của các hộ dân chưa từng được nhận ủng hộ lần nào cả (0.5 điểm)

SELECT *
FROM public."HO_DAN"
WHERE NOT EXISTS (SELECT *
FROM "DOT_NHAN_UNG_HO"
WHERE "HO_DAN"."MaHoDan" = "DOT_NHAN_UNG_HO"."MaHoDan")

-- Câu 13: Liệt kê thông tin của các đơn vị ủng hộ đã từng ủng hộ dưới hình thức 'Tien mat' và chưa từng ủng hộ dưới hình thức 'Quan ao' (0.5 điểm)

SELECT *
FROM public."DON_VI_UNG_HO"
WHERE EXISTS (SELECT *
    FROM public."DOT_UNG_HO"
        INNER JOIN public."CHI_TIET_UNG_HO" ON "DOT_UNG_HO"."MaDotUngHo" = "CHI_TIET_UNG_HO"."MaDotUngHo"
        INNER JOIN public."HINH_THUC_UH" ON "CHI_TIET_UNG_HO"."MaHinhThucUH" = "HINH_THUC_UH"."MaHinhThucUH"
    WHERE "DON_VI_UNG_HO"."MaDVUH" = "DOT_UNG_HO"."MaDVUH" and "TenHinhThucUngHo" = 'Tien mat')
    OR NOT EXISTS (SELECT *
    FROM public."DOT_UNG_HO"
        INNER JOIN public."CHI_TIET_UNG_HO" ON "DOT_UNG_HO"."MaDotUngHo" = "CHI_TIET_UNG_HO"."MaDotUngHo"
        INNER JOIN public."HINH_THUC_UH" ON "CHI_TIET_UNG_HO"."MaHinhThucUH" = "HINH_THUC_UH"."MaHinhThucUH"
    WHERE "DON_VI_UNG_HO"."MaDVUH" = "DOT_UNG_HO"."MaDVUH" and "TenHinhThucUngHo" = 'Quan ao')

-- Câu 14: Liệt kê thông tin của những đơn vị ủng hộ đã từng ủng hộ vào năm "2015" nhưng chưa từng ủng hộ vào năm "2016" (0.5 điểm)

SELECT *
FROM public."DON_VI_UNG_HO"
WHERE EXISTS (SELECT *
    FROM "DOT_UNG_HO"
    WHERE "DON_VI_UNG_HO"."MaDVUH" = "DOT_UNG_HO"."MaDVUH" AND EXTRACT(YEAR FROM "NgayUngHo") = '2015')
    AND NOT EXISTS (SELECT *
    FROM "DOT_UNG_HO"
    WHERE "DON_VI_UNG_HO"."MaDVUH" = "DOT_UNG_HO"."MaDVUH" AND EXTRACT(YEAR FROM "NgayUngHo") = '2016')

-- Câu 15: Hiển thị thông tin của những đơn vị ủng hộ đã thực hiện ít nhất 2 đợt ủng hộ tính từ 30/07/2015 đến hết năm 2015 (0.5 điểm)

SELECT "DON_VI_UNG_HO"."MaDVUH", "HoTenNguoiDaiDien", COUNT("DOT_UNG_HO"."MaDVUH") AS "SoLanUngHo"
FROM public."DON_VI_UNG_HO" INNER JOIN public."DOT_UNG_HO" ON "DON_VI_UNG_HO"."MaDVUH" = "DOT_UNG_HO"."MaDVUH"
WHERE "NgayUngHo" > '2015/07/30' AND "NgayUngHo" < '2016/01/01'
GROUP BY "DON_VI_UNG_HO"."MaDVUH"
HAVING COUNT("DOT_UNG_HO"."MaDVUH") >= 2

-- Câu 16: Đếm tổng số đợt được nhận ủng hộ của từng hộ dân trong năm 2016 với yêu cầu chỉ thực hiện tính đối với những
-- đợt được nhận ủng hộ có hình thức nhận ủng hộ là 'Tien mat' (0.5 điểm)

SELECT "HO_DAN"."MaHoDan", "HoTenChuHo", COUNT("DOT_NHAN_UNG_HO"."MaDotNhanUngHo") AS "SoLanNhanUngHoTrongNam2016"
FROM public."HO_DAN" INNER JOIN public."DOT_NHAN_UNG_HO" ON "HO_DAN"."MaHoDan" = "DOT_NHAN_UNG_HO"."MaHoDan"
    INNER JOIN public."CHI_TIET_NHAN_UNG_HO" ON "DOT_NHAN_UNG_HO"."MaDotNhanUngHo" = "CHI_TIET_NHAN_UNG_HO"."MaDotNhanUngHo"
    INNER JOIN public."HINH_THUC_UH" ON "CHI_TIET_NHAN_UNG_HO"."MaHinhThucUH" = "HINH_THUC_UH"."MaHinhThucUH"
WHERE EXTRACT(YEAR FROM "NgayNhanUngHo") = '2016' AND "TenHinhThucUngHo" = 'Tien mat'
GROUP BY "HO_DAN"."MaHoDan"

-- Câu 17: Liệt kê những ngày vừa diễn ra sự kiện có đơn vị ủng hộ đến trao hàng cứu trợ cho chính quyền,
-- vừa diễn ra sự kiện có hộ dân được chính quyền phân phối hàng cứu trợ, kết quả được sắp xếp tăng dần theo ngày tìm được (0.5 điểm)

SELECT "NgayUngHo" AS "NgayDienRaHaiSuKien"
FROM public."DOT_UNG_HO"
WHERE EXISTS (SELECT *
FROM public."DOT_NHAN_UNG_HO"
WHERE "DOT_UNG_HO"."NgayUngHo" = "DOT_NHAN_UNG_HO"."NgayNhanUngHo" )
ORDER BY "NgayUngHo"

-- Câu 18: Cập nhật cột DonViTinh trong bảng CHI_TIET_UNG_HO thành NULL đối với record có hình thức ủng hộ với TenHinhThucUngHo là 'Quan ao'
-- và có ngày ủng hộ (NgayUngHo) trước ngày 30/12/2015 (0.5 điểm)

UPDATE public."CHI_TIET_UNG_HO" SET "DonViTinh" = null
FROM public."HINH_THUC_UH"
WHERE  "CHI_TIET_UNG_HO"."MaHinhThucUH" = "HINH_THUC_UH"."MaHinhThucUH" AND "TenHinhThucUngHo" = 'Quan ao' AND
    EXISTS (SELECT *
    FROM public."DOT_UNG_HO"
    WHERE "CHI_TIET_UNG_HO"."MaDotUngHo" = "DOT_UNG_HO"."MaDotUngHo" AND "NgayUngHo" < '2015/12/30')

-- Câu 19: Xóa những hộ dân chưa từng được nhận một lần ủng hộ nào từ chính quyền (0.5 điểm)

DELETE FROM public."HO_DAN" 
WHERE NOT EXISTS (SELECT *
FROM "DOT_NHAN_UNG_HO"
WHERE "HO_DAN"."MaHoDan" = "DOT_NHAN_UNG_HO"."MaHoDan")


-- Câu 20: Xóa những record trong bảng CHI_TIET_UNG_HO của những đợt ủng hộ diễn ra trước năm 2015 (0.5 điểm)


DELETE FROM public."CHI_TIET_UNG_HO" 
WHERE EXISTS (SELECT *
FROM public."DOT_UNG_HO"
WHERE "CHI_TIET_UNG_HO"."MaDotUngHo" = "DOT_UNG_HO"."MaDotUngHo" AND "NgayUngHo" < '2015/01/01')
