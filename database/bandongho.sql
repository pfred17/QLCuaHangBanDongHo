-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 16, 2024 lúc 03:10 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `bandongho`
--
use bandongho;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `baohanh`
--

CREATE TABLE `baohanh` (
  `mabh` int(11) NOT NULL,
  `ngaybd` date NOT NULL,
  `ngaykt` date NOT NULL,
  `dieukien` text DEFAULT NULL,
  `trangthai` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `baohanh`
--

INSERT INTO `baohanh` (`mabh`, `ngaybd`, `ngaykt`, `dieukien`, `trangthai`) VALUES
(1, '2023-01-15', '2024-01-15', 'Bảo hành sản phẩm do lỗi nhà sản xuất', 1),
(2, '2023-03-10', '2024-03-10', 'Bảo hành 12 tháng từ ngày mua', 1),
(3, '2023-05-20', '2023-11-20', 'Chỉ bảo hành các lỗi phần cứng', 1),
(4, '2023-07-01', '2024-07-01', 'Bảo hành không bao gồm các lỗi do người sử dụng gây ra', 1),
(5, '2023-09-15', '2024-09-15', 'Bảo hành 6 tháng cho pin và 12 tháng cho các linh kiện khác', 1),
(6, '2023-11-01', '2024-11-01', 'Bảo hành không áp dụng cho các lỗi phần mềm', 1),
(7, '2023-12-20', '2024-12-20', 'Bảo hành theo điều kiện nhà sản xuất', 1),
(8, '2024-01-01', '2025-01-01', 'Bảo hành 1 năm từ ngày mua', 1),
(9, '2024-02-14', '2025-02-14', 'Bảo hành chỉ áp dụng khi có hóa đơn mua hàng', 1),
(10, '2024-03-15', '2025-03-15', 'Bảo hành không áp dụng cho linh kiện tiêu hao', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ctbaohanh`
--

CREATE TABLE `ctbaohanh` (
  `mabh` int(11) NOT NULL,
  `ngaynhan` date NOT NULL,
  `ngaytra` date NOT NULL,
  `noidungbaohanh` text NOT NULL,
  `chiphi` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `ctbaohanh`
--

INSERT INTO `ctbaohanh` (`mabh`, `ngaynhan`, `ngaytra`, `noidungbaohanh`, `chiphi`) VALUES
(1, '2023-02-10', '2023-02-14', 'Thay mặt kính đồng hồ bị nứt', 300000.00),
(2, '2023-04-05', '2023-04-08', 'Thay pin đồng hồ', 150000.00),
(3, '2023-06-15', '2023-06-17', 'Sửa chữa nút điều chỉnh giờ', 200000.00),
(4, '2023-08-10', '2023-08-12', 'Vệ sinh và bảo trì bộ máy đồng hồ', 100000.00),
(5, '2023-10-20', '2023-10-22', 'Thay dây đeo da bị rách', 250000.00),
(6, '2023-12-01', '2023-12-03', 'Thay vòng bezel', 400000.00),
(7, '2024-01-15', '2024-01-17', 'Sửa lỗi chống nước', 500000.00),
(8, '2024-02-10', '2024-02-13', 'Sửa kim giây không chạy', 200000.00),
(9, '2024-03-01', '2024-03-03', 'Thay mặt số bị mờ', 350000.00),
(10, '2024-04-12', '2024-04-14', 'Thay bộ vỏ ngoài bị trầy xước', 600000.00);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ctphieunhap`
--

CREATE TABLE `ctphieunhap` (
  `maphieunhap` int(11) NOT NULL,
  `masp` int(11) NOT NULL,
  `soluong` int(11) NOT NULL,
  `gianhap` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `ctphieunhap`
--

INSERT INTO `ctphieunhap` (`maphieunhap`, `masp`, `soluong`, `gianhap`) VALUES
(1, 1, 10, 1500000.00),
(1, 2, 5, 2000000.00),
(2, 1, 12, 1500000.00),
(2, 3, 8, 1750000.00),
(3, 4, 7, 2200000.00),
(3, 5, 10, 2500000.00),
(4, 1, 15, 1500000.00),
(4, 6, 20, 1300000.00),
(5, 2, 6, 2000000.00),
(5, 7, 4, 2800000.00);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ctphieuxuat`
--

CREATE TABLE `ctphieuxuat` (
  `maphieuxuat` int(11) NOT NULL,
  `masp` int(11) NOT NULL DEFAULT 0,
  `mabh` int(11) NOT NULL,
  `soluong` int(11) NOT NULL DEFAULT 0,
  `dongia` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `ctphieuxuat`
--

INSERT INTO `ctphieuxuat` (`maphieuxuat`, `masp`, `mabh`, `soluong`, `dongia`) VALUES
(1, 1, 1, 1, 2500000.00),
(1, 2, 1, 2, 2500000.00),
(2, 1, 1, 2, 2250000.00),
(2, 3, 2, 3, 4500000.00),
(2, 4, 3, 1, 5000000.00),
(3, 1, 1, 1, 3000000.00),
(3, 5, 2, 1, 3500000.00),
(4, 6, 4, 1, 3000000.00),
(5, 2, 5, 2, 6000000.00),
(5, 7, 6, 4, 2500000.00),
(6, 2, 8, 2, 1800000.00),
(6, 8, 7, 1, 4500000.00),
(7, 1, 10, 1, 3000000.00),
(7, 3, 9, 3, 2700000.00),
(8, 4, 10, 1, 4000000.00),
(8, 5, 9, 2, 2500000.00);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ctsanpham`
--

CREATE TABLE `ctsanpham` (
  `masp` int(11) NOT NULL,
  `duongkinh` varchar(50) DEFAULT NULL,
  `dochiunuoc` varchar(50) DEFAULT NULL,
  `chatlieumat` varchar(100) DEFAULT NULL,
  `sizeday` varchar(50) DEFAULT NULL,
  `chatlieuday` varchar(100) DEFAULT NULL,
  `chatlieuvo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `ctsanpham`
--

INSERT INTO `ctsanpham` (`masp`, `duongkinh`, `dochiunuoc`, `chatlieumat`, `sizeday`, `chatlieuday`, `chatlieuvo`) VALUES
(1, '40mm', '30m', 'Thép không gỉ', '20mm', 'Da thật', 'Silicon'),
(2, '45mm', '200m', 'Nhựa', '22mm', 'Nhựa', 'Nhựa'),
(3, '42mm', '100m', 'Thép không gỉ', '21mm', 'Da', 'Thép không gỉ'),
(4, '38mm', '50m', 'Thép không gỉ', '18mm', 'Da thật', 'Thép không gỉ'),
(5, '40mm', '300m', 'Thép không gỉ', '20mm', 'Gốm', 'Thép không gỉ'),
(6, '41mm', '300m', 'Thép không gỉ', '21mm', 'Da', 'Thép không gỉ'),
(7, '39mm', '30m', 'Thép không gỉ', '20mm', 'Da thật', 'Thép không gỉ'),
(8, '42mm', '50m', 'Thép không gỉ', '22mm', 'Da', 'Thép không gỉ'),
(9, '43mm', '100m', 'Thép không gỉ', '21mm', 'Gốm', 'Thép không gỉ'),
(10, '44mm', '100m', 'Thép không gỉ', '22mm', 'Da thật', 'Thép không gỉ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giamgia`
--

CREATE TABLE `giamgia` (
  `magiamgia` int(11) NOT NULL,
  `tenctgiamgia` varchar(50) NOT NULL,
  `mocgiamgia` int(11) NOT NULL,
  `sotienduocgiam` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `giamgia`
--

INSERT INTO `giamgia` (`magiamgia`, `tenctgiamgia`, `mocgiamgia`, `sotienduocgiam`) VALUES
(1, 'Giảm giá cuối năm', 5000000, 500000),
(2, 'Khuyến mãi sinh nhật', 10000000, 1000000),
(3, 'Black Friday', 7000000, 700000),
(4, 'Giảm giá mùa hè', 3000000, 300000),
(5, 'Tuần lễ vàng', 15000000, 1500000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang`
--

CREATE TABLE `khachhang` (
  `makh` int(11) NOT NULL,
  `tenkhachhang` varchar(255) NOT NULL,
  `diachi` varchar(255) NOT NULL,
  `gioitinh` varchar(255) NOT NULL,
  `sdt` varchar(255) NOT NULL,
  `ngaythamgia` date NOT NULL DEFAULT current_timestamp(),
  `trangthai` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `khachhang`
--

INSERT INTO `khachhang` (`makh`, `tenkhachhang`, `diachi`, `gioitinh`, `sdt`, `ngaythamgia`, `trangthai`) VALUES
(1, 'Trần Văn Nghĩa', 'Gia Đức, Ân Đức, Hoài Ân, Bình Định', 'Nam', '0387913347', '2005-11-11', 1),
(2, 'Trần Nhất Nhất', '205 Trần Hưng Đạo, Phường 10, Quận 5, Thành phố Hồ Chí Minh', 'Nam', '0412378234', '1999-04-19', 1),
(3, 'Hoàng Gia Bảo', 'Khoa Trường, Hoài Ân, Bình Định', 'Nam', '0987654321', '2004-02-04', 1),
(4, 'Hồ Minh Hưng', 'Khoa Trường, Hoài Ân, Bình Định', 'Nam', '0867987456', '2001-12-19', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khuvuckho`
--

CREATE TABLE `khuvuckho` (
  `makhuvuc` int(11) NOT NULL,
  `tenkhuvuc` varchar(255) NOT NULL,
  `ghichu` varchar(255) NOT NULL,
  `trangthai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `khuvuckho`
--

INSERT INTO `khuvuckho` (`makhuvuc`, `tenkhuvuc`, `ghichu`, `trangthai`) VALUES
(1, 'Kho Đặc Biệt', 'Kho chứa các mẫu đồng hồ độc quyền', 1),
(2, 'Kho Tiêu Chuẩn', 'Kho chứa các mẫu đồng hồ thông dụng', 1),
(3, 'Kho Sang Trọng', 'Kho chứa các mẫu đồng hồ cao cấp', 1),
(4, 'Kho Thời Trang', 'Kho chứa các mẫu đồng hồ thời trang mới nhất', 1),
(5, 'Kho Khuyến Mãi', 'Kho chứa các mẫu đồng hồ đang giảm giá', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaisanpham`
--

CREATE TABLE `loaisanpham` (
  `maloai` int(11) NOT NULL,
  `tenloai` varchar(255) NOT NULL,
  `trangthai` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `loaisanpham`
--

INSERT INTO `loaisanpham` (`maloai`, `tenloai`, `trangthai`) VALUES
(1, 'Đồng hồ thời trang', 1),
(2, 'Đồng hồ thể thao', 1),
(3, 'Đồng hồ cao cấp', 1),
(4, 'Đồng hồ thông minh', 1),
(5, 'Đồng hồ điện tử', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhacungcap`
--

CREATE TABLE `nhacungcap` (
  `mancc` int(11) NOT NULL,
  `tenncc` varchar(255) NOT NULL,
  `diachi` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `sdt` varchar(255) NOT NULL,
  `trangthai` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nhacungcap`
--

INSERT INTO `nhacungcap` (`mancc`, `tenncc`, `diachi`, `email`, `sdt`, `trangthai`) VALUES
(1, 'Giới Đồng Hồ', '112 Đường Nguyễn Thị Minh Khai, Quận 3, TP.HCM', 'contact@gioidongho.com', '0901234567', 1),
(2, 'WatchZone', '24 Trần Nhân Tông, Hai Bà Trưng, Hà Nội', 'info@watchzone.com', '0912345678', 1),
(3, 'Duy Anh Watch', '285 Đường Nguyễn Văn Cừ, Quận 1, TP.HCM', 'support@duyanhwatch.com', '0923456789', 1),
(4, 'Shop Đồng Hồ Chính Hãng', '123 Đường Lê Văn Sỹ, Quận 3, TP.HCM', 'sales@shopdongho.com', '0934567890', 1),
(5, 'Watches Việt', '78 Đường Lê Thánh Tôn, Quận 1, TP.HCM', 'hello@watchesviet.com', '0945678901', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhanvien`
--

CREATE TABLE `nhanvien` (
  `manv` int(11) NOT NULL,
  `hoten` varchar(255) NOT NULL,
  `gioitinh` varchar(11) NOT NULL,
  `ngaysinh` date NOT NULL,
  `sdt` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `trangthai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nhanvien`
--

INSERT INTO `nhanvien` (`manv`, `hoten`, `gioitinh`, `ngaysinh`, `sdt`, `email`, `trangthai`) VALUES
(1, 'Huỳnh Lê Phúc', 'Nam', '2004-01-09', '0387913347', 'phucle@gmail.com', 1),
(2, 'Huy Đinh', 'Nam', '2004-04-22', '0355374322', 'huydinh@gmail.com', 1),
(3, 'Lê Bửu Trí', 'Nam', '2003-10-11', '0359499423', 'buutri@gmail.com', 1),
(4, 'Ngô Trí Anh', 'Nam', '1999-05-05', '0384583050', 'trianh@gmail.com', 1),
(5, 'Thanh Huy', 'Nam', '2003-04-03', '0384575757', 'thanhhuy@gmail.com', 1),
(6, 'Nguyễn Chí Phong', 'Nam', '2001-10-04', '0384435454', 'chiphong@gmail.com', 1),
(7, 'Nguyễn Minh Phát', 'Nam', '2002-05-12', '0384749287', 'minhphat@gmail.com', 1),
(8, 'Sơn Nguyễn', 'Nam', '2000-05-29', '0364828901', 'sonnguyen@gmail.com', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhomquyen`
--

CREATE TABLE `nhomquyen` (
  `manhomquyen` int(11) NOT NULL,
  `tennhomquyen` varchar(255) NOT NULL,
  `trangthai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nhomquyen`
--

INSERT INTO `nhomquyen` (`manhomquyen`, `tennhomquyen`, `trangthai`) VALUES
(1, 'admin', 1),
(2, 'Nhân viên nhập hàng', 1),
(3, 'Nhân viên xuất hàng', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phieunhap`
--

CREATE TABLE `phieunhap` (
  `maphieunhap` int(11) NOT NULL,
  `mancc` int(11) NOT NULL,
  `makhuvuc` int(11) NOT NULL,
  `manv` int(11) NOT NULL,
  `thoigian` datetime DEFAULT current_timestamp(),
  `tongtien` decimal(10,2) NOT NULL DEFAULT 0.00,
  `trangthai` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `phieunhap`
--

INSERT INTO `phieunhap` (`maphieunhap`, `mancc`, `makhuvuc`, `manv`, `thoigian`, `tongtien`, `trangthai`) VALUES
(1, 1, 1, 1, '2023-02-10 00:00:00', 17500000.00, 1),
(2, 2, 2, 2, '2023-03-15 00:00:00', 24000000.00, 1),
(3, 3, 1, 3, '2023-04-20 00:00:00', 29500000.00, 1),
(4, 4, 3, 4, '2023-05-25 00:00:00', 37500000.00, 1),
(5, 1, 4, 5, '2023-06-30 00:00:00', 12000000.00, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phieuxuat`
--

CREATE TABLE `phieuxuat` (
  `maphieuxuat` int(11) NOT NULL,
  `thoigian` datetime NOT NULL DEFAULT current_timestamp(),
  `tongtien` decimal(10,2) DEFAULT NULL,
  `soluong` int(11) NOT NULL,
  `manv` int(11) NOT NULL,
  `makh` int(11) NOT NULL,
  `magiamgia` int(11) DEFAULT NULL,
  `trangthai` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `phieuxuat`
--

INSERT INTO `phieuxuat` (`maphieuxuat`, `thoigian`, `tongtien`, `soluong`, `manv`, `makh`, `magiamgia`, `trangthai`) VALUES
(1, '2024-01-10 00:00:00', 7500000.00, 3, 1, 1, 1, 1),
(2, '2024-01-15 00:00:00', 13500000.00, 5, 2, 2, 2, 1),
(3, '2024-02-05 00:00:00', 6500000.00, 2, 3, 3, 2, 1),
(4, '2024-02-20 00:00:00', 3000000.00, 1, 4, 4, 3, 1),
(5, '2024-03-12 00:00:00', 17500000.00, 6, 5, 1, 3, 1),
(6, '2024-03-15 00:00:00', 5400000.00, 4, 6, 2, 1, 1),
(7, '2024-03-20 00:00:00', 8000000.00, 3, 7, 3, 2, 1),
(8, '2024-04-01 00:00:00', 9100000.00, 5, 8, 4, 2, 1),
(9, '2024-10-16 00:00:00', 9000000.00, 0, 1, 3, 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `masp` int(11) NOT NULL,
  `maloai` int(11) NOT NULL,
  `tensp` varchar(255) DEFAULT NULL,
  `hinhanh` varchar(255) DEFAULT NULL,
  `xuatxu` int(11) DEFAULT NULL,
  `thuonghieu` int(11) DEFAULT NULL,
  `gianhap` decimal(10,2) DEFAULT NULL,
  `soluongton` int(11) DEFAULT 0,
  `trangthai` tinyint(1) DEFAULT 1,
  `giaban` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`masp`, `maloai`, `tensp`, `hinhanh`, `xuatxu`, `thuonghieu`, `gianhap`, `soluongton`, `trangthai`, `giaban`) VALUES
(1, 1, 'Đồng hồ Seiko Automatic', 'src/GUI/imageSanPham/seikoautomatic.jpg\n', 1, 1, 1500000.00, 25, 1, 3000000.00),
(2, 1, 'Đồng hồ Casio G-Shock', 'src/GUI/imageSanPham/casiog-shock.jpg\n', 1, 2, 2000000.00, 30, 1, 4500000.00),
(3, 2, 'Đồng hồ Citizen Eco-Drive', 'src/GUI/imageSanPham/citizen.jpg\n', 2, 3, 1750000.00, 15, 1, 4000000.00),
(4, 1, 'Đồng hồ Orient Bambino', 'src/GUI/imageSanPham/orient.jpg\n', 1, 4, 2200000.00, 10, 1, 5000000.00),
(5, 3, 'Đồng hồ Rolex Submariner', 'src/GUI/imageSanPham/rolex-bambino.jpg\n', 3, 5, 2500000.00, 5, 1, 7500000.00),
(6, 2, 'Đồng hồ Omega Seamaster', 'src/GUI/imageSanPham/omega.jpg\n', 3, 6, 4000000.00, 7, 1, 9000000.00),
(7, 1, 'Đồng hồ Tissot T-Classic', 'src/GUI/imageSanPham/tissot.jpg\n', 2, 7, 1200000.00, 12, 1, 2800000.00),
(8, 1, 'Đồng hồ Longines Master', 'src/GUI/imageSanPham/longines.jpg\n', 1, 8, 3000000.00, 7, 1, 6000000.00),
(9, 3, 'Đồng hồ Tag Heuer Carrera', 'src/GUI/imageSanPham/heuer.jpg\n', 3, 9, 3500000.00, 6, 1, 7000000.00),
(10, 2, 'Đồng hồ Hublot Big Bang', 'src/GUI/imageSanPham/hublot.jpg\n', 3, 10, 6000000.00, 4, 1, 12000000.00);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

CREATE TABLE `taikhoan` (
  `mataikhoan` int(11) NOT NULL,
  `manv` int(11) NOT NULL,
  `matkhau` char(255) NOT NULL,
  `manhomquyen` int(11) NOT NULL,
  `tendangnhap` varchar(50) NOT NULL DEFAULT '',
  `trangthai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `taikhoan`
--

INSERT INTO `taikhoan` (`mataikhoan`, `manv`, `matkhau`, `manhomquyen`, `tendangnhap`, `trangthai`) VALUES
(1, 1, 'abc', 1, 'admin', 1),
(2, 2, 'abc', 1, 'huydinh', 1),
(3, 3, 'abc', 1, 'buutri', 1),
(4, 4, 'abc', 1, 'trianh', 1),
(5, 5, 'abc', 1, 'thanhhuy', 1),
(6, 6, 'abc', 1, 'chiphong', 1),
(7, 7, 'abc', 1, 'minhphat', 1),
(8, 8, 'abc', 1, 'son', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thuonghieu`
--

CREATE TABLE `thuonghieu` (
  `mathuonghieu` int(11) NOT NULL,
  `tenthuonghieu` varchar(255) NOT NULL,
  `trangthai` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `thuonghieu`
--

INSERT INTO `thuonghieu` (`mathuonghieu`, `tenthuonghieu`, `trangthai`) VALUES
(1, 'Seiko', 1),
(2, 'Casio', 1),
(3, 'Citizen', 1),
(4, 'Orient', 1),
(5, 'Rolex', 1),
(6, 'Omega', 1),
(7, 'Tissot', 1),
(8, 'Longines', 1),
(9, 'Tag Heuer', 1),
(10, 'Hublot', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `xuatxu`
--

CREATE TABLE `xuatxu` (
  `maxuatxu` int(11) NOT NULL,
  `tenxuatxu` varchar(50) NOT NULL,
  `trangthai` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `xuatxu`
--

INSERT INTO `xuatxu` (`maxuatxu`, `tenxuatxu`, `trangthai`) VALUES
(1, 'Nhật Bản', 1),
(2, 'Thụy Sĩ', 1),
(3, 'Thụy Điển', 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `baohanh`
--
ALTER TABLE `baohanh`
  ADD PRIMARY KEY (`mabh`);

--
-- Chỉ mục cho bảng `ctbaohanh`
--
ALTER TABLE `ctbaohanh`
  ADD PRIMARY KEY (`mabh`),
  ADD KEY `fk_ctbaohanh_mabh` (`mabh`);

--
-- Chỉ mục cho bảng `ctphieunhap`
--
ALTER TABLE `ctphieunhap`
  ADD PRIMARY KEY (`maphieunhap`,`masp`),
  ADD KEY `fk_ctphieunhap_maphieunhap` (`maphieunhap`),
  ADD KEY `fk_ctphieunhap_masp` (`masp`);

--
-- Chỉ mục cho bảng `ctphieuxuat`
--
ALTER TABLE `ctphieuxuat`
  ADD PRIMARY KEY (`maphieuxuat`,`masp`),
  ADD KEY `fk_ctphieuxuat_masp` (`masp`),
  ADD KEY `fk_ctphieuxuat_mabh` (`mabh`),
  ADD KEY `fk_ctphieuxuat_maphieuxuat` (`maphieuxuat`);

--
-- Chỉ mục cho bảng `ctsanpham`
--
ALTER TABLE `ctsanpham`
  ADD PRIMARY KEY (`masp`),
  ADD KEY `fk_ctsanpham_sanpham` (`masp`);

--
-- Chỉ mục cho bảng `giamgia`
--
ALTER TABLE `giamgia`
  ADD PRIMARY KEY (`magiamgia`);

--
-- Chỉ mục cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`makh`);

--
-- Chỉ mục cho bảng `khuvuckho`
--
ALTER TABLE `khuvuckho`
  ADD PRIMARY KEY (`makhuvuc`);

--
-- Chỉ mục cho bảng `loaisanpham`
--
ALTER TABLE `loaisanpham`
  ADD PRIMARY KEY (`maloai`);

--
-- Chỉ mục cho bảng `nhacungcap`
--
ALTER TABLE `nhacungcap`
  ADD PRIMARY KEY (`mancc`);

--
-- Chỉ mục cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`manv`);

--
-- Chỉ mục cho bảng `nhomquyen`
--
ALTER TABLE `nhomquyen`
  ADD PRIMARY KEY (`manhomquyen`);

--
-- Chỉ mục cho bảng `phieunhap`
--
ALTER TABLE `phieunhap`
  ADD PRIMARY KEY (`maphieunhap`),
  ADD KEY `fk_phieunhap_mancc` (`mancc`),
  ADD KEY `fk_phieunhap_makhuvuc` (`makhuvuc`),
  ADD KEY `fk_phieunhap_manv` (`manv`);

--
-- Chỉ mục cho bảng `phieuxuat`
--
ALTER TABLE `phieuxuat`
  ADD PRIMARY KEY (`maphieuxuat`),
  ADD KEY `fk_phieuxuat_manv` (`manv`),
  ADD KEY `fk_phieuxuat_makh` (`makh`),
  ADD KEY `fk_phieuxuat_magiamgia` (`magiamgia`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`masp`),
  ADD KEY `fk_sanpham_loaisanpham` (`maloai`),
  ADD KEY `fk_sanpham_thuonghieu` (`thuonghieu`),
  ADD KEY `fk_sanpham_xuatxu` (`xuatxu`);

--
-- Chỉ mục cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`mataikhoan`),
  ADD KEY `fk_taikhoan_manhomquyen` (`manhomquyen`),
  ADD KEY `fk_taikhoan_manv` (`manv`);

--
-- Chỉ mục cho bảng `thuonghieu`
--
ALTER TABLE `thuonghieu`
  ADD PRIMARY KEY (`mathuonghieu`);

--
-- Chỉ mục cho bảng `xuatxu`
--
ALTER TABLE `xuatxu`
  ADD PRIMARY KEY (`maxuatxu`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `baohanh`
--
ALTER TABLE `baohanh`
  MODIFY `mabh` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `giamgia`
--
ALTER TABLE `giamgia`
  MODIFY `magiamgia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  MODIFY `makh` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `khuvuckho`
--
ALTER TABLE `khuvuckho`
  MODIFY `makhuvuc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `loaisanpham`
--
ALTER TABLE `loaisanpham`
  MODIFY `maloai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `nhacungcap`
--
ALTER TABLE `nhacungcap`
  MODIFY `mancc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  MODIFY `manv` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `nhomquyen`
--
ALTER TABLE `nhomquyen`
  MODIFY `manhomquyen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `phieunhap`
--
ALTER TABLE `phieunhap`
  MODIFY `maphieunhap` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `phieuxuat`
--
ALTER TABLE `phieuxuat`
  MODIFY `maphieuxuat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `masp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  MODIFY `mataikhoan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `thuonghieu`
--
ALTER TABLE `thuonghieu`
  MODIFY `mathuonghieu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `xuatxu`
--
ALTER TABLE `xuatxu`
  MODIFY `maxuatxu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `ctbaohanh`
--

ALTER TABLE `ctbaohanh`
  ADD CONSTRAINT `fk_ctbaohanh_mabh` FOREIGN KEY (`mabh`) REFERENCES `baohanh`(`mabh`);
--
-- Các ràng buộc cho bảng `ctphieunhap`
--
ALTER TABLE `ctphieunhap`
  ADD CONSTRAINT `fk_ctphieunhap_maphieunhap` FOREIGN KEY (`maphieunhap`) REFERENCES `phieunhap` (`maphieunhap`);
ALTER TABLE `ctphieunhap`
  ADD CONSTRAINT `fk_ctphieunhap_masp` FOREIGN KEY (`masp`) REFERENCES `sanpham` (`masp`);

--
-- Các ràng buộc cho bảng `ctphieuxuat`
--
ALTER TABLE `ctphieuxuat`
  ADD CONSTRAINT `fk_ctphieuxuat_maphieuxuat` FOREIGN KEY (`maphieuxuat`) REFERENCES `phieuxuat` (`maphieuxuat`);
ALTER TABLE `ctphieuxuat`
  ADD CONSTRAINT `fk_ctphieuxuat_masp` FOREIGN KEY (`masp`) REFERENCES `sanpham` (`masp`);
ALTER TABLE `ctphieuxuat`
  ADD CONSTRAINT `fk_ctphieuxuat_baohanh` FOREIGN KEY(`mabh`) REFERENCES `baohanh` (`mabh`);
--
-- Các ràng buộc cho bảng `phieunhap`
--
ALTER TABLE `phieunhap`
  ADD CONSTRAINT `fk_phieunhap_makhuvuc` FOREIGN KEY (`makhuvuc`) REFERENCES `khuvuckho` (`makhuvuc`);
ALTER TABLE `phieunhap`
  ADD CONSTRAINT `fk_phieunhap_mancc` FOREIGN KEY (`mancc`) REFERENCES `nhacungcap` (`mancc`);
ALTER TABLE `phieunhap`
  ADD CONSTRAINT `fk_phieunhap_manv` FOREIGN KEY (`manv`) REFERENCES `nhanvien` (`manv`);

--
-- Các ràng buộc cho bảng `phieuxuat`
--
ALTER TABLE `phieuxuat`
  ADD CONSTRAINT `fk_phieuxuat_magiamgia` FOREIGN KEY (`magiamgia`) REFERENCES `giamgia` (`magiamgia`);
ALTER TABLE `phieuxuat`
  ADD CONSTRAINT `fk_phieuxuat_makh` FOREIGN KEY (`makh`) REFERENCES `khachhang` (`makh`);
ALTER TABLE `phieuxuat`
  ADD CONSTRAINT `fk_phieuxuat_manv` FOREIGN KEY (`manv`) REFERENCES `nhanvien` (`manv`);

--
-- Các ràng buộc cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `fk_sanpham_loaisanpham` FOREIGN KEY (`maloai`) REFERENCES `loaisanpham` (`maloai`);
ALTER TABLE `sanpham`
  ADD CONSTRAINT `fk_sanpham_thuonghieu` FOREIGN KEY (`thuonghieu`) REFERENCES `thuonghieu` (`mathuonghieu`);
ALTER TABLE `sanpham`
  ADD CONSTRAINT `fk_sanpham_xuatxu` FOREIGN KEY (`xuatxu`) REFERENCES `xuatxu` (`maxuatxu`);

--
-- Các ràng buộc cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD CONSTRAINT `fk_taikhoan_manhomquyen` FOREIGN KEY (`manhomquyen`) REFERENCES `nhomquyen` (`manhomquyen`);
ALTER TABLE `taikhoan`
  ADD CONSTRAINT `fk_taikhoan_manv` FOREIGN KEY (`manv`) REFERENCES `nhanvien` (`manv`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;