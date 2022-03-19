-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th2 25, 2022 lúc 07:13 AM
-- Phiên bản máy phục vụ: 10.4.21-MariaDB
-- Phiên bản PHP: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `asmnodejs`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giohang`
--

CREATE TABLE `giohang` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `idProduct` int(11) NOT NULL,
  `count` int(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `giohang`
--

INSERT INTO `giohang` (`id`, `user_id`, `idProduct`, `count`, `created_at`) VALUES
(16, 3, 2, 2, '2022-02-22 17:51:06'),
(17, 3, 4, 5, '2022-02-22 17:51:21'),
(39, 7, 2, 2, '2022-02-24 03:37:34');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadon`
--

CREATE TABLE `hoadon` (
  `id` int(11) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `customer_address` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_phone_number` varchar(255) NOT NULL,
  `status` int(10) NOT NULL COMMENT '1 đã xử lý, 0 chưa',
  `created_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `hoadon`
--

INSERT INTO `hoadon` (`id`, `user_id`, `customer_name`, `customer_address`, `customer_email`, `customer_phone_number`, `status`, `created_date`) VALUES
(11, '7', 'pham chinh', 'kien giang', 'phamchinh347@gmail.com', '+84366390249', 0, '2022-02-23 16:32:21'),
(12, '7', 'pham chinh', 'kien giang', 'phamchinh347@gmail.com', '+84366390249', 0, '2022-02-24 03:36:06'),
(13, '8', 'Phạm hoàng chính', 'kien giang', 'phamchinh347@gmail.com', '+84366390249', 0, '2022-02-24 17:48:14'),
(14, '9', 'pham chinh', 'kien giang', 'phamchinh347@gmail.com', '+84366390249', 0, '2022-02-25 04:11:05');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadon_chitiet`
--

CREATE TABLE `hoadon_chitiet` (
  `id` int(11) NOT NULL,
  `order_id` int(50) NOT NULL,
  `product_id` int(50) NOT NULL,
  `quantity` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `hoadon_chitiet`
--

INSERT INTO `hoadon_chitiet` (`id`, `order_id`, `product_id`, `quantity`) VALUES
(14, 11, 1, 2),
(15, 11, 2, 3),
(16, 11, 3, 4),
(17, 12, 2, 3),
(18, 12, 1, 6),
(19, 13, 3, 4),
(20, 14, 3, 3),
(21, 14, 4, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaisanpham`
--

CREATE TABLE `loaisanpham` (
  `id` int(11) NOT NULL,
  `tenLoai` varchar(200) NOT NULL,
  `stt` int(11) NOT NULL,
  `anHien` tinyint(1) NOT NULL COMMENT '1 hiện, 2 ẩn'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `loaisanpham`
--

INSERT INTO `loaisanpham` (`id`, `tenLoai`, `stt`, `anHien`) VALUES
(1, 'Trái cây', 1, 1),
(2, 'Rau củ', 2, 1),
(3, 'Nấm', 3, 1),
(4, 'Giàu VitaminC', 4, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguoidung`
--

CREATE TABLE `nguoidung` (
  `id` int(11) NOT NULL,
  `hoVaTen` varchar(200) NOT NULL,
  `taiKhoan` varchar(200) NOT NULL,
  `matKhau` varchar(200) NOT NULL,
  `quyen` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 là user, 1 Admin',
  `gioiTinh` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 là nam, 2 là nữ',
  `kichHoat` tinyint(4) NOT NULL COMMENT '0 chưa kh, 1 đã kích hoạt',
  `ngaySinh` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `nguoidung`
--

INSERT INTO `nguoidung` (`id`, `hoVaTen`, `taiKhoan`, `matKhau`, `quyen`, `gioiTinh`, `kichHoat`, `ngaySinh`) VALUES
(3, 'werwerwe', 'werwerwe', '$2b$10$zltMeO3C/YenY6S5i4kfH.ou7qWkWavkKfMamkv9vEFEEDLlvqaMC', 0, 1, 0, NULL),
(5, 'Phùng Thanh Độ', 'dochet1989', '$2b$10$ZUnMOg6YIqEe.p53J2UwD.GwuG.UWJ7LAJLOs6by/n6LFz9gk.jw6', 0, 1, 0, NULL),
(7, 'PHẠM HOÀNG CHÍNH', 'ssminhhieuss', '$2b$10$pXw5KH91F29xOivmbNk5wOB/ot9gD3talwtNsjWMiaoTdI7zJ7NGS', 1, 1, 0, NULL),
(8, 'Thành Người', 'thanhnguoi', '$2b$10$HCjbErgFvIObsdm8BzsHMeyMLRBblppa.97bQfTFcFtst/AbgL00u', 0, 1, 0, NULL),
(9, 'Hoàng Chính', 'hoangchinh', '$2b$10$GggEFZU..gYS0E6VS8NvOODzvqwXL07ulYI5JF8Q20Mavo3FzCa5G', 1, 1, 0, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `id` int(11) NOT NULL,
  `tenSP` varchar(200) NOT NULL,
  `anhSP` varchar(300) NOT NULL,
  `gia` int(11) NOT NULL,
  `giamGia` int(100) NOT NULL,
  `moTa` varchar(500) NOT NULL,
  `luotXem` int(11) NOT NULL DEFAULT 0,
  `hot` tinyint(1) NOT NULL COMMENT '1 hot, 0 không',
  `idLoai` int(11) NOT NULL,
  `anHien` tinyint(1) NOT NULL COMMENT '1 hiện, 0 ẩn',
  `capNhatLanCuoi` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`id`, `tenSP`, `anhSP`, `gia`, `giamGia`, `moTa`, `luotXem`, `hot`, `idLoai`, `anHien`, `capNhatLanCuoi`) VALUES
(1, 'Đào đà lạt 1kg\n', 'https://tunatheme.com/tf/html/broccoli-preview/broccoli/img/product/1.png', 60000, 10, 'Mô tả nè', 100, 0, 1, 1, '2022-01-16 12:46:35'),
(2, 'Đu đủ 1kg', 'https://tunatheme.com/tf/html/broccoli-preview/broccoli/img/product/2.png', 120000, 10, 'Mô tả nè', 0, 0, 1, 1, '2022-01-16 12:46:35'),
(3, 'Combo quả họ dâu', 'https://tunatheme.com/tf/html/broccoli-preview/broccoli/img/product/3.png', 150000, 10, 'Mô tả nè', 0, 0, 2, 1, '2022-01-16 12:46:35'),
(4, 'Bơ đà lạt', 'https://tunatheme.com/tf/html/broccoli-preview/broccoli/img/product/4.png', 139000, 10, 'Mô tả nè', 0, 0, 1, 1, '2022-01-16 12:46:35'),
(5, 'Xoài thái', 'https://tunatheme.com/tf/html/broccoli-preview/broccoli/img/product/5.png', 300000, 10, 'Mô tả nè', 500, 0, 1, 1, '2022-01-16 12:46:35'),
(6, 'Lê Corella Úc', 'https://tunatheme.com/tf/html/broccoli-preview/broccoli/img/product/6.png', 200000, 10, 'Mô tả nè', 0, 0, 1, 1, '2022-01-16 12:46:35'),
(7, 'Kiwi xanh', 'https://tunatheme.com/tf/html/broccoli-preview/broccoli/img/product/7.png', 250000, 10, 'Mô tả nè', 400, 0, 1, 1, '2022-01-16 12:46:35'),
(8, 'Nấm linh chi', 'https://tunatheme.com/tf/html/broccoli-preview/broccoli/img/product/8.png', 99000, 10, 'Mô tả nè', 200, 0, 3, 1, '2022-01-16 12:46:35'),
(9, 'Măng cụt', 'https://tunatheme.com/tf/html/broccoli-preview/broccoli/img/product/9.png', 120000, 10, 'Mô tả nè', 0, 0, 2, 1, '2022-01-16 12:46:35'),
(10, 'Kiwi vàng', 'https://tunatheme.com/tf/html/broccoli-preview/broccoli/img/product/10.png', 300000, 10, 'Mô tả nè', 0, 0, 2, 1, '2022-01-16 12:46:35'),
(11, 'Combo cà chua, cam', 'https://tunatheme.com/tf/html/broccoli-preview/broccoli/img/product/11.png', 60000, 10, 'Mô tả nè', 0, 0, 4, 1, '2022-01-16 12:46:35'),
(12, 'Xúp lơ', 'https://tunatheme.com/tf/html/broccoli-preview/broccoli/img/product/12.png', 210000, 10, 'Mô tả nè', 0, 0, 2, 1, '2022-01-16 12:46:35'),
(13, 'Chanh dây', 'https://tunatheme.com/tf/html/broccoli-preview/broccoli/img/product/13.png', 70000, 10, 'Mô tả nè', 0, 0, 4, 1, '2022-01-16 12:46:35'),
(14, 'Hành tím', 'https://tunatheme.com/tf/html/broccoli-preview/broccoli/img/product/14.png', 20000, 10, 'Mô tả nè', 0, 0, 2, 1, '2022-01-16 12:46:35'),
(15, 'Xà lách mỡ', 'https://tunatheme.com/tf/html/broccoli-preview/broccoli/img/product/15.png', 150000, 10, 'Mô tả nè', 0, 0, 2, 1, '2022-01-16 12:46:35'),
(17, 'Lựu peru', 'https://tunatheme.com/tf/html/broccoli-preview/broccoli/img/product/17.png', 400000, 10, 'sản phẩm này nhì không sản phẩm nào nhất cả =))', 0, 0, 1, 1, '2022-01-17 03:27:09');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sothich`
--

CREATE TABLE `sothich` (
  `id` int(11) NOT NULL,
  `idNguoiDung` int(11) NOT NULL,
  `soThich` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `giohang`
--
ALTER TABLE `giohang`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hoadon_chitiet`
--
ALTER TABLE `hoadon_chitiet`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `loaisanpham`
--
ALTER TABLE `loaisanpham`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sothich`
--
ALTER TABLE `sothich`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `giohang`
--
ALTER TABLE `giohang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `hoadon_chitiet`
--
ALTER TABLE `hoadon_chitiet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `loaisanpham`
--
ALTER TABLE `loaisanpham`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `sothich`
--
ALTER TABLE `sothich`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
