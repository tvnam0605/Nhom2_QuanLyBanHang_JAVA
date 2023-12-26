-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3308
-- Thời gian đã tạo: Th12 17, 2023 lúc 02:40 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `restaurant`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `phoneNumber` varchar(20) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `birthday` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`id`, `phoneNumber`, `name`, `address`, `birthday`) VALUES
(1, '0911175581', 'Cường', 'Nghệ An', '2000-04-09 10:00:00'),
(2, '0911175581', 'Linh', 'Hà Nội', '2000-09-16 10:00:00'),
(9, '0898354417', 'Nam', 'Đà Lạt', '2023-08-09 02:37:08');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phoneNumber` varchar(20) DEFAULT NULL,
  `startDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `permission` varchar(50) NOT NULL COMMENT 'manager-quản lý\r\nstaff-nhân viên\r\ninactive-nghỉ việc',
  `salary` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `employee`
--

INSERT INTO `employee` (`id`, `username`, `password`, `name`, `phoneNumber`, `startDate`, `permission`, `salary`) VALUES
(1, 'nhanvien1', '1', 'Khánh Thư', '0911175581', '2020-11-23 17:00:00', 'staff', 3000000),
(2, 'nhanvien2', '2', 'Khánh Thịnh', '0911175581', '2020-11-24 05:15:08', 'staff', 3000000),
(30, 'tvnam', 'tvnam', 'Trần Văn Nam', '0898354417', '2023-08-19 12:43:29', 'manager', 15000000),
(31, 'ductri', '123', 'Nông Đức Trí', '0976198203', '2023-12-08 05:39:56', 'manager', 15000000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `food_category`
--

CREATE TABLE `food_category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `food_category`
--

INSERT INTO `food_category` (`id`, `name`, `slug`) VALUES
(1, 'Sandwich', 'sandwich'),
(2, 'Hotdog', 'hotdog'),
(3, 'Kebab', 'kebab'),
(4, 'Coffee', 'coffee'),
(5, 'Ca cao', 'cacao');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `food_item`
--

CREATE TABLE `food_item` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `urlImage` varchar(50) DEFAULT NULL,
  `unitName` varchar(20) NOT NULL,
  `unitPrice` bigint(20) NOT NULL,
  `idCategory` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `food_item`
--

INSERT INTO `food_item` (`id`, `name`, `description`, `urlImage`, `unitName`, `unitPrice`, `idCategory`) VALUES
(1, 'Sandwich bò', '', 'sandwich-bo-2023-12-09-01-24-59.png', 'Cái', 25000, 1),
(3, 'Sandwich ba chỉ', '', 'sandwich-ba-chi-2023-12-09-01-24-48.png', 'Cái', 20000, 1),
(4, 'Sandwich trứng', '', 'sandwich-trung-2023-12-09-01-25-14.png', 'Cái', 15000, 1),
(5, 'Kebab thịt xông khói', '', 'kebab-thit-xong-khoi-2023-12-09-01-25-55.png', 'Cái', 25000, 3),
(7, 'Kebab rau củ', '', 'kebab-rau-cu-2023-12-09-01-25-48.png', 'Cái', 20000, 3),
(8, 'Hotdog phô mai kéo xợi', '', 'hotdog-pho-mai-keo-xoi-2023-12-09-01-25-27.png', 'Cái', 10000, 2),
(9, 'Hotdog xúc xích chà bông', '', 'hotdog-xuc-xich-cha-bong-2023-12-09-01-25-35.png', 'Cái', 8000, 2),
(15, 'Coffee đen', '', 'coffee-en-2023-12-09-01-26-16.png', 'Ly', 10000, 4),
(16, 'Coffee sữa', '', 'coffee-sua-2023-12-09-01-26-09.png', 'Ly', 12000, 4),
(31, 'Coffee muối', '', 'coffee-muoi-2023-12-09-01-26-02.png', 'Cái', 18000, 4),
(32, 'Cacao nóng', '', 'cacao-nong-2023-12-09-01-26-27.png', 'Ly', 10000, 5),
(33, 'Cacao sữa', '', 'cacao-sua-2023-12-09-01-26-35.png', 'Ly', 10000, 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `idEmployee` int(11) NOT NULL,
  `idTable` int(11) DEFAULT NULL,
  `type` varchar(45) NOT NULL DEFAULT 'local' COMMENT 'local - tại quán\nonline - đặt online',
  `status` varchar(45) NOT NULL DEFAULT 'unpaid' COMMENT 'unpaid - chưa thanh toán\npaid - đã thanh toán',
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `payDate` timestamp NULL DEFAULT NULL,
  `paidAmount` bigint(20) DEFAULT 0,
  `totalAmount` bigint(20) NOT NULL DEFAULT 0,
  `discount` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order`
--

INSERT INTO `order` (`id`, `idEmployee`, `idTable`, `type`, `status`, `orderDate`, `payDate`, `paidAmount`, `totalAmount`, `discount`) VALUES
(36, 2, 1, 'local', 'paid', '2023-09-05 13:32:53', '2023-12-08 18:28:03', 0, 0, 0),
(37, 2, 2, 'local', 'unpaid', '2023-12-08 16:57:51', NULL, 0, 0, 0),
(38, 1, 3, 'local', 'unpaid', '2023-12-08 18:12:01', NULL, 0, 0, 0),
(39, 1, 4, 'online', 'paid', '2023-12-08 18:31:18', '2023-12-08 17:07:36', 128000, 128000, 0),
(40, 31, 1, 'local', 'unpaid', '2023-12-09 00:21:00', NULL, 0, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_item`
--

CREATE TABLE `order_item` (
  `idOrder` int(11) NOT NULL,
  `idFoodItem` int(11) NOT NULL,
  `idTopping` int(11) NOT NULL DEFAULT 0,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `foodPrice` bigint(20) NOT NULL DEFAULT 0,
  `toppingPrice` bigint(20) NOT NULL DEFAULT 0,
  `note` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_item`
--

INSERT INTO `order_item` (`idOrder`, `idFoodItem`, `idTopping`, `quantity`, `foodPrice`, `toppingPrice`, `note`) VALUES
(39, 8, 15, 1, 10000, 10000, ''),
(39, 9, 15, 1, 8000, 10000, ''),
(39, 15, 1, 9, 10000, 0, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `session`
--

CREATE TABLE `session` (
  `id` int(11) NOT NULL,
  `idEmployee` int(11) NOT NULL,
  `startTime` timestamp NOT NULL DEFAULT current_timestamp(),
  `endTime` timestamp NULL DEFAULT NULL,
  `message` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `session`
--

INSERT INTO `session` (`id`, `idEmployee`, `startTime`, `endTime`, `message`) VALUES
(58, 1, '2023-08-19 05:42:01', '2023-08-19 05:44:12', 'logout'),
(59, 30, '2023-08-19 05:44:30', '2023-08-19 05:44:40', 'logout'),
(60, 2, '2023-08-19 05:44:45', '2023-08-19 05:45:57', 'logout'),
(61, 30, '2023-08-19 05:46:01', '2023-08-19 05:49:53', 'logout'),
(62, 30, '2023-08-19 06:37:50', '2023-08-19 06:42:26', 'logout'),
(63, 30, '2023-08-19 20:06:20', '2023-08-19 20:06:31', 'logout'),
(64, 30, '2023-08-19 20:06:38', '2023-08-19 20:09:51', 'logout'),
(65, 30, '2023-08-19 20:10:19', '2023-08-19 20:10:36', 'logout'),
(66, 2, '2023-08-19 20:10:42', NULL, 'login'),
(67, 30, '2023-08-20 06:15:41', '2023-08-20 06:15:53', 'logout'),
(68, 30, '2023-08-20 06:23:32', '2023-08-20 06:23:50', 'logout'),
(69, 30, '2023-08-20 06:51:46', '2023-08-20 06:52:44', 'logout'),
(70, 30, '2023-08-20 07:00:47', '2023-08-20 07:19:21', 'logout'),
(71, 30, '2023-08-20 07:23:34', NULL, 'login'),
(72, 30, '2023-08-22 19:42:19', '2023-08-22 19:43:37', 'logout'),
(73, 30, '2023-08-22 19:55:15', '2023-08-22 19:56:23', 'logout'),
(74, 30, '2023-08-25 18:48:46', '2023-08-25 18:54:12', 'logout'),
(75, 30, '2023-09-05 06:24:06', '2023-09-05 06:28:20', 'logout'),
(76, 2, '2023-09-05 06:30:57', '2023-09-05 06:33:08', 'logout'),
(77, 30, '2023-09-08 18:57:53', '2023-09-08 18:58:06', 'logout'),
(78, 30, '2023-09-08 19:20:32', '2023-09-08 19:21:24', 'logout'),
(79, 30, '2023-09-08 19:33:23', '2023-09-08 19:33:38', 'logout'),
(80, 30, '2023-09-08 19:34:59', '2023-09-08 19:35:09', 'logout'),
(81, 30, '2023-09-08 19:35:56', '2023-09-08 20:18:08', 'logout'),
(82, 30, '2023-09-08 21:29:08', '2023-09-08 21:30:10', 'logout'),
(83, 30, '2023-09-09 05:50:40', '2023-09-09 05:51:13', 'logout'),
(84, 2, '2023-09-09 05:51:18', '2023-09-09 05:52:10', 'logout'),
(85, 30, '2023-09-09 07:42:59', '2023-09-09 07:46:59', 'logout'),
(86, 30, '2023-10-22 03:08:38', '2023-10-22 03:09:05', 'logout'),
(87, 30, '2023-12-07 22:35:46', NULL, 'login'),
(88, 30, '2023-12-07 22:38:52', '2023-12-07 22:45:20', 'logout'),
(89, 31, '2023-12-07 22:45:25', '2023-12-08 05:01:29', 'logout'),
(90, 31, '2023-12-08 07:06:18', '2023-12-08 07:13:07', 'logout'),
(91, 2, '2023-12-08 07:13:11', '2023-12-08 07:23:27', 'logout'),
(92, 31, '2023-12-08 07:23:35', NULL, 'login'),
(93, 31, '2023-12-08 07:23:41', NULL, 'login'),
(94, 31, '2023-12-08 07:23:49', '2023-12-08 07:23:53', 'logout'),
(95, 31, '2023-12-08 07:24:11', NULL, 'login'),
(96, 31, '2023-12-08 07:24:13', NULL, 'login'),
(97, 2, '2023-12-08 07:24:21', NULL, 'login'),
(98, 2, '2023-12-08 07:24:26', '2023-12-08 07:24:29', 'logout'),
(99, 31, '2023-12-08 07:25:31', NULL, 'login'),
(100, 31, '2023-12-08 07:25:37', '2023-12-08 07:25:40', 'logout'),
(101, 31, '2023-12-08 07:26:00', NULL, 'login'),
(102, 31, '2023-12-08 07:26:06', '2023-12-08 07:26:08', 'logout'),
(103, 30, '2023-12-08 07:32:43', '2023-12-08 07:39:18', 'logout'),
(104, 31, '2023-12-08 07:37:37', NULL, 'login'),
(105, 31, '2023-12-08 07:37:45', NULL, 'login'),
(106, 31, '2023-12-08 07:39:20', NULL, 'login'),
(107, 31, '2023-12-08 07:49:05', '2023-12-08 09:41:21', 'logout'),
(108, 31, '2023-12-08 09:32:29', '2023-12-08 09:41:18', 'logout'),
(109, 31, '2023-12-08 09:43:55', '2023-12-08 09:44:27', 'logout'),
(110, 31, '2023-12-08 09:44:31', '2023-12-08 09:44:48', 'logout'),
(111, 31, '2023-12-08 09:44:55', '2023-12-08 09:49:24', 'logout'),
(112, 31, '2023-12-08 09:49:31', '2023-12-08 09:53:16', 'logout'),
(113, 31, '2023-12-08 09:50:01', '2023-12-08 09:50:03', 'logout'),
(114, 31, '2023-12-08 09:53:23', NULL, 'login'),
(115, 31, '2023-12-08 09:57:21', '2023-12-08 09:57:29', 'logout'),
(116, 2, '2023-12-08 09:57:33', '2023-12-08 10:02:51', 'logout'),
(117, 31, '2023-12-08 09:59:08', '2023-12-08 10:02:33', 'logout'),
(118, 31, '2023-12-08 10:02:55', '2023-12-08 10:02:59', 'logout'),
(119, 2, '2023-12-08 10:03:03', '2023-12-08 10:06:59', 'logout'),
(120, 31, '2023-12-08 10:05:53', '2023-12-08 10:06:57', 'logout'),
(121, 2, '2023-12-08 10:07:08', '2023-12-08 10:09:38', 'logout'),
(122, 31, '2023-12-08 10:09:50', '2023-12-08 10:14:16', 'logout'),
(123, 31, '2023-12-08 10:14:26', '2023-12-08 10:14:35', 'logout'),
(124, 2, '2023-12-08 10:14:38', '2023-12-08 10:42:16', 'logout'),
(125, 31, '2023-12-08 10:42:24', '2023-12-08 10:53:22', 'logout'),
(126, 2, '2023-12-08 10:53:26', '2023-12-08 10:56:57', 'logout'),
(127, 2, '2023-12-08 10:57:47', '2023-12-08 10:58:01', 'logout'),
(128, 31, '2023-12-08 11:05:19', '2023-12-08 11:07:10', 'logout'),
(129, 1, '2023-12-08 11:07:18', '2023-12-08 11:09:27', 'logout'),
(130, 1, '2023-12-08 11:10:18', '2023-12-08 11:10:35', 'logout'),
(131, 31, '2023-12-08 11:11:02', '2023-12-08 11:11:08', 'logout'),
(132, 1, '2023-12-08 11:11:53', '2023-12-08 11:14:30', 'logout'),
(133, 31, '2023-12-08 11:16:22', '2023-12-08 11:16:50', 'logout'),
(134, 1, '2023-12-08 11:16:57', '2023-12-08 11:17:10', 'logout'),
(135, 31, '2023-12-08 11:17:14', '2023-12-08 11:22:28', 'logout'),
(136, 31, '2023-12-08 11:24:19', '2023-12-08 11:26:46', 'logout'),
(137, 1, '2023-12-08 11:26:50', '2023-12-08 11:27:31', 'logout'),
(138, 31, '2023-12-08 11:29:51', '2023-12-08 11:30:41', 'logout'),
(139, 1, '2023-12-08 11:30:48', '2023-12-08 11:32:20', 'logout'),
(140, 31, '2023-12-08 16:53:40', '2023-12-08 16:53:59', 'logout'),
(141, 1, '2023-12-08 16:54:04', '2023-12-08 16:57:38', 'logout'),
(142, 30, '2023-12-08 17:04:28', '2023-12-08 17:11:18', 'logout'),
(143, 31, '2023-12-08 17:11:32', '2023-12-08 17:15:47', 'logout'),
(144, 30, '2023-12-08 17:19:04', '2023-12-08 17:19:14', 'logout'),
(145, 1, '2023-12-08 17:19:20', '2023-12-08 17:19:24', 'logout'),
(146, 31, '2023-12-08 17:20:47', '2023-12-08 17:21:03', 'logout'),
(147, 2, '2023-12-08 17:21:39', '2023-12-08 17:21:48', 'logout'),
(148, 2, '2023-12-08 17:22:12', '2023-12-08 17:22:20', 'logout'),
(149, 30, '2023-12-16 18:22:49', '2023-12-16 18:23:22', 'logout');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shipment`
--

CREATE TABLE `shipment` (
  `idOrder` int(11) NOT NULL,
  `idCustomer` int(11) NOT NULL,
  `shipperName` varchar(50) NOT NULL,
  `shipperPhoneNumber` varchar(20) NOT NULL,
  `shipCost` int(11) NOT NULL,
  `status` varchar(45) NOT NULL DEFAULT 'topay' COMMENT 'topay - chờ xác nhận\ntoship - chờ lấy hàng\ntoreceive - đang giao\ncompleted - hoàn thành\ncancelled - đã hủy',
  `notice` varchar(45) DEFAULT NULL,
  `startDate` timestamp NULL DEFAULT current_timestamp(),
  `endDate` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `table`
--

CREATE TABLE `table` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL DEFAULT 'free' COMMENT 'free-Trống\nserving-Đang phục vụ\nreserving-Đặt trước'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `table`
--

INSERT INTO `table` (`id`, `name`, `status`) VALUES
(1, 'Bàn 1', 'serving'),
(2, 'Bàn 2', 'serving'),
(3, 'Bàn 3', 'free'),
(4, 'Bàn 4', 'free'),
(5, 'Bàn 5', 'free'),
(6, 'Bàn 6', 'free'),
(7, 'Bàn 7', 'free'),
(8, 'Bàn 8', 'free'),
(10, 'Bàn 10', 'free'),
(11, 'Bàn 11', 'free'),
(15, 'Bàn 12', 'free');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Chỉ mục cho bảng `food_category`
--
ALTER TABLE `food_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `food_item`
--
ALTER TABLE `food_item`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `fk_item_category` (`idCategory`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_employee_order` (`idEmployee`),
  ADD KEY `fk_order_table` (`idTable`);

--
-- Chỉ mục cho bảng `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`idOrder`,`idFoodItem`,`idTopping`),
  ADD KEY `fk_order_main_item` (`idFoodItem`),
  ADD KEY `fk_order_topping` (`idTopping`);

--
-- Chỉ mục cho bảng `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_session` (`idEmployee`);

--
-- Chỉ mục cho bảng `shipment`
--
ALTER TABLE `shipment`
  ADD PRIMARY KEY (`idOrder`),
  ADD KEY `fk_ship_customer` (`idCustomer`);

--
-- Chỉ mục cho bảng `table`
--
ALTER TABLE `table`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT cho bảng `food_category`
--
ALTER TABLE `food_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `food_item`
--
ALTER TABLE `food_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `session`
--
ALTER TABLE `session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT cho bảng `table`
--
ALTER TABLE `table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `food_item`
--
ALTER TABLE `food_item`
  ADD CONSTRAINT `fk_item_category` FOREIGN KEY (`idCategory`) REFERENCES `food_category` (`id`);

--
-- Các ràng buộc cho bảng `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `fk_employee_order` FOREIGN KEY (`idEmployee`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `fk_order_table` FOREIGN KEY (`idTable`) REFERENCES `table` (`id`);

--
-- Các ràng buộc cho bảng `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `fk_order_item` FOREIGN KEY (`idOrder`) REFERENCES `order` (`id`),
  ADD CONSTRAINT `fk_order_main_item` FOREIGN KEY (`idFoodItem`) REFERENCES `food_item` (`id`),
  ADD CONSTRAINT `fk_order_topping` FOREIGN KEY (`idTopping`) REFERENCES `food_item` (`id`);

--
-- Các ràng buộc cho bảng `session`
--
ALTER TABLE `session`
  ADD CONSTRAINT `fk_session` FOREIGN KEY (`idEmployee`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `shipment`
--
ALTER TABLE `shipment`
  ADD CONSTRAINT `fk_order_ship` FOREIGN KEY (`idOrder`) REFERENCES `order` (`id`),
  ADD CONSTRAINT `fk_ship_customer` FOREIGN KEY (`idCustomer`) REFERENCES `customer` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
