-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 09, 2024 lúc 12:47 PM
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
-- Cơ sở dữ liệu: `tour5`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `cartid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `tourid` int(11) NOT NULL,
  `soluong` int(11) NOT NULL DEFAULT 0,
  `ngaythem` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`cartid`, `userid`, `tourid`, `soluong`, `ngaythem`) VALUES
(1, 1, 1, 2, '2024-03-25'),
(2, 2, 2, 3, '2024-03-26'),
(3, 3, 3, 1, '2024-03-27'),
(4, 4, 4, 2, '2024-03-28'),
(5, 5, 5, 4, '2024-03-29');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhgia`
--

CREATE TABLE `danhgia` (
  `reviewid` int(11) NOT NULL,
  `tourid` int(11) NOT NULL,
  `rating` int(11) NOT NULL DEFAULT 0,
  `cmt` varchar(255) DEFAULT NULL,
  `userid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `danhgia`
--

INSERT INTO `danhgia` (`reviewid`, `tourid`, `rating`, `cmt`, `userid`) VALUES
(1, 1, 4, 'Tour rất tuyệt vời!', 1),
(2, 2, 5, 'Tour rất thú vị và đáng nhớ!', 2),
(3, 3, 3, 'Tour không quá ấn tượng như mong đợi.', 3),
(4, 4, 4, 'Địa điểm đẹp, dịch vụ tốt.', 4),
(5, 5, 5, 'Sapa là một nơi tuyệt vời để khám phá!', 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadon`
--

CREATE TABLE `hoadon` (
  `MaHD` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `tourid` int(11) NOT NULL,
  `ngaythanhtoan` date NOT NULL,
  `money` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `hoadon`
--

INSERT INTO `hoadon` (`MaHD`, `userid`, `tourid`, `ngaythanhtoan`, `money`) VALUES
(1, 1, 1, '2024-03-25', 4000000),
(2, 2, 2, '2024-03-26', 9000000),
(3, 3, 3, '2024-03-27', 1500000),
(4, 4, 4, '2024-03-28', 9000000),
(5, 5, 5, '2024-03-29', 11200000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `location`
--

CREATE TABLE `location` (
  `locationid` int(11) NOT NULL,
  `tourid` int(11) NOT NULL,
  `tendiadiem` varchar(100) NOT NULL DEFAULT '',
  `khuvuc` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `location`
--

INSERT INTO `location` (`locationid`, `tourid`, `tendiadiem`, `khuvuc`) VALUES
(1, 1, 'Bãi Dài, Vinpearl land', 'Nha Trang'),
(2, 2, 'Bà Nà Hills', 'Đà Nẵng'),
(3, 3, 'Hồ Gươm', 'Hà Nội'),
(4, 4, 'Bãi Trường', 'Phú Quốc'),
(5, 5, 'Thác Bạc', 'Sapa'),
(6, 6, 'Cầu Hiền Lương, Chùa Thiên Mụ', 'Huế'),
(7, 7, 'Biển Back Beach', 'Vũng Tàu'),
(8, 8, 'Hội An Ancient Town, An Bang Beach', 'Hội An'),
(9, 9, 'Thung Lũng Tình Yêu, Hồ Tuyền Lâm', 'Đà Lạt'),
(10, 10, 'Chợ nổi Cái Răng,Bến Ninh Kiều', 'Cần Thơ'),
(11, 11, 'Vịnh Hạ Long, Hang Sửng Sốt', 'Hạ Long'),
(12, 12, 'Bãi Xếp, Hòn Khô', 'Quy Nhơn'),
(13, 13, 'Vịnh Lan Hạ, Suối Trùng Sóc', 'Cát Bà'),
(14, 14, 'Đồi Cát Mũi Né, Bãi biển Mũi Né', 'Mũi Né'),
(15, 15, 'Cồn Phụng, làng hoa Sa Đét', 'Đồng Tháp');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tour`
--

CREATE TABLE `tour` (
  `tourid` int(11) NOT NULL,
  `tentour` varchar(50) NOT NULL,
  `chitiet` varchar(255) NOT NULL,
  `giatour` int(11) NOT NULL DEFAULT 0,
  `thoigiandi` date NOT NULL,
  `thoigianve` date NOT NULL,
  `tendiadiem` varchar(50) NOT NULL,
  `area` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tour`
--

INSERT INTO `tour` (`tourid`, `tentour`, `chitiet`, `giatour`, `thoigiandi`, `thoigianve`, `tendiadiem`, `area`) VALUES
(1, 'Tour Nha Trang', 'Tour du lịch Nha Trang 3 ngày 2 đêm', 2000000, '2024-04-15', '2024-04-17', 'Nha Trang', 'Northern Region'),
(2, 'Tour Đà Nẵng', 'Tour du lịch Đà Nẵng 4 ngày 3 đêm', 3000000, '2024-05-10', '2024-05-13', 'Đà Nẵng', 'Central Region'),
(3, 'Tour Hà Nội', 'Tour du lịch Hà Nội 2 ngày 1 đêm', 1500000, '2024-06-05', '2024-06-06', 'Hà Nội', 'Central Region'),
(4, 'Tour Phú Quốc', 'Tour du lịch Phú Quốc 5 ngày 4 đêm', 4500000, '2024-07-20', '2024-07-24', 'Phú Quốc', 'Northern Region'),
(5, 'Tour Sapa', 'Tour du lịch Sapa 3 ngày 2 đêm', 2800000, '2024-08-12', '2024-08-14', 'Sapa', 'Southern Region'),
(6, 'Tour Huế', 'Tour du lịch Huế 2 ngày 1 đêm', 1800000, '2024-09-05', '2024-09-06', 'Huế', 'Southern Region'),
(7, 'Tour Vũng Tàu', 'Tour du lịch Vũng Tàu 3 ngày 2 đêm', 2200000, '2024-10-10', '2024-10-12', 'Vũng Tàu', 'Central Region'),
(8, 'Tour Hội An', 'Tour du lịch Hội An 4 ngày 3 đêm', 3200000, '2024-11-15', '2024-11-18', 'Hội An', 'Northern Region'),
(9, 'Tour Đà Lạt', 'Tour du lịch Đà Lạt 3 ngày 2 đêm', 2500000, '2024-12-20', '2024-12-22', 'Đà Lạt', 'Southern Region'),
(10, 'Tour Cần Thơ', 'Tour du lịch Cần Thơ 2 ngày 1 đêm', 1700000, '2025-01-05', '2025-01-06', 'Cần Thơ', 'Southern Region'),
(11, 'Tour Hạ Long', 'Tour du lịch Hạ Long 3 ngày 2 đêm', 2600000, '2025-02-10', '2025-02-12', 'Hạ Long', 'Southern Region'),
(12, 'Tour Quy Nhơn', 'Tour du lịch Quy Nhơn 4 ngày 3 đêm', 3300000, '2025-03-15', '2025-03-18', 'Quy Nhơn', 'Central Region'),
(13, 'Tour Cát Bà', 'Tour du lịch Cát Bà 2 ngày 1 đêm', 1900000, '2025-04-20', '2025-04-21', 'Cát Bà', 'Northern Region'),
(14, 'Tour Mũi Né', 'Tour du lịch Mũi Né 3 ngày 2 đêm', 2400000, '2025-05-10', '2025-05-12', 'Mũi Né', 'Southern Region'),
(15, 'Tour Đồng Tháp', 'Tour du lịch Đồng Tháp 2 ngày 1 đêm', 1600000, '2025-06-05', '2025-06-06', 'Đồng Tháp', 'Southern Region');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `userid` int(11) NOT NULL,
  `ten` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone` varchar(12) NOT NULL DEFAULT '',
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`userid`, `ten`, `email`, `phone`, `password`) VALUES
(1, 'Nguyen Van A', 'nguyenvana@example.com', '123456789', '1234567'),
(2, 'Tran Thi B', 'tranthib@example.com', '987654321', '1234576'),
(3, 'Hoang Minh C', 'hoangminhc@example.com', '456123789', '1234589'),
(4, 'Le Thi D', 'lethid@example.com', '321654987', '1234569'),
(5, 'Pham Van E', 'phamvane@example.com', '789321654', '1234599'),
(6, 'Vo Van F', 'vovanf@example.com', '456789123', '1234555'),
(7, 'Nguyen Thi G', 'nguyenthig@example.com', '654789321', '1234566'),
(8, 'Tran Van H', 'tranvanh@example.com', '987123456', '1234577'),
(9, 'Le Van I', 'levani@example.com', '321789456', '1234543'),
(10, 'Pham Thi K', 'phamthik@example.com', '654321987', '12345600');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cartid`),
  ADD KEY `cart_tour` (`tourid`),
  ADD KEY `cart_user` (`userid`);

--
-- Chỉ mục cho bảng `danhgia`
--
ALTER TABLE `danhgia`
  ADD PRIMARY KEY (`reviewid`),
  ADD KEY `danhgia_tour` (`tourid`),
  ADD KEY `danhgia_user` (`userid`);

--
-- Chỉ mục cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD PRIMARY KEY (`MaHD`),
  ADD KEY `hoadon_tour` (`tourid`),
  ADD KEY `hoadon_user` (`userid`);

--
-- Chỉ mục cho bảng `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`locationid`),
  ADD KEY `location_tour` (`tourid`);

--
-- Chỉ mục cho bảng `tour`
--
ALTER TABLE `tour`
  ADD PRIMARY KEY (`tourid`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `cartid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `danhgia`
--
ALTER TABLE `danhgia`
  MODIFY `reviewid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  MODIFY `MaHD` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `location`
--
ALTER TABLE `location`
  MODIFY `locationid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `tour`
--
ALTER TABLE `tour`
  MODIFY `tourid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_tour` FOREIGN KEY (`tourid`) REFERENCES `tour` (`tourid`),
  ADD CONSTRAINT `cart_user` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`);

--
-- Các ràng buộc cho bảng `danhgia`
--
ALTER TABLE `danhgia`
  ADD CONSTRAINT `danhgia_tour` FOREIGN KEY (`tourid`) REFERENCES `tour` (`tourid`),
  ADD CONSTRAINT `danhgia_user` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`);

--
-- Các ràng buộc cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD CONSTRAINT `hoadon_tour` FOREIGN KEY (`tourid`) REFERENCES `tour` (`tourid`),
  ADD CONSTRAINT `hoadon_user` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`);

--
-- Các ràng buộc cho bảng `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `location_tour` FOREIGN KEY (`tourid`) REFERENCES `tour` (`tourid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
