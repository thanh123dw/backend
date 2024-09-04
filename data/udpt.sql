-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th9 04, 2024 lúc 06:42 PM
-- Phiên bản máy phục vụ: 8.3.0
-- Phiên bản PHP: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `udpt`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `approveworkschedule`
--

DROP TABLE IF EXISTS `approveworkschedule`;
CREATE TABLE IF NOT EXISTS `approveworkschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `workscheduleid` int NOT NULL,
  `staffid` int NOT NULL,
  `workdate` date NOT NULL,
  `starttime` time NOT NULL,
  `endtime` time NOT NULL,
  `shifttype` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_vietnamese_ci,
  `status` tinyint NOT NULL DEFAULT '0',
  `locked` tinyint(1) DEFAULT '0',
  `createdat` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedat` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reason` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `approveworkschedule`
--

INSERT INTO `approveworkschedule` (`id`, `workscheduleid`, `staffid`, `workdate`, `starttime`, `endtime`, `shifttype`, `description`, `status`, `locked`, `createdat`, `updatedat`, `reason`) VALUES
(1, 1, 1, '0000-00-00', '08:00:00', '17:00:00', 'Ca làm việc ban ngày', 'Working on project A', 0, 0, '2024-09-03 14:29:55', '2024-09-03 14:29:55', ''),
(2, 1, 1, '0000-00-00', '08:00:00', '17:00:00', 'Ca làm việc ban ngày', 'Working on project A', 0, 0, '2024-09-04 08:31:14', '2024-09-04 08:31:14', 'tha tao');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `log`
--

DROP TABLE IF EXISTS `log`;
CREATE TABLE IF NOT EXISTS `log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `logdate` date NOT NULL,
  `logtime` time NOT NULL,
  `page` varchar(100) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `actionname` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `userid` int DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_vietnamese_ci,
  `createdat` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `log`
--

INSERT INTO `log` (`id`, `logdate`, `logtime`, `page`, `actionname`, `userid`, `username`, `description`, `createdat`) VALUES
(1, '2024-08-21', '23:59:14', 'Login', 'login', NULL, NULL, '', '2024-08-21 16:59:14'),
(2, '2024-08-22', '00:00:42', 'Logout', 'logout', NULL, NULL, '', '2024-08-21 17:00:42'),
(3, '2024-08-22', '00:25:00', 'Logout', 'logout', NULL, NULL, '', '2024-08-21 17:25:00'),
(4, '2024-08-22', '00:25:00', 'Login', 'login', NULL, NULL, '', '2024-08-21 17:25:00'),
(5, '2024-08-22', '00:25:07', 'Login', 'login', NULL, NULL, '', '2024-08-21 17:25:07'),
(6, '2024-08-22', '00:26:18', 'Login', 'login', NULL, NULL, '', '2024-08-21 17:26:18'),
(7, '2024-08-22', '00:30:28', 'Login', 'login', NULL, NULL, '', '2024-08-21 17:30:28'),
(8, '2024-08-22', '00:33:38', 'Login', 'login', NULL, NULL, '', '2024-08-21 17:33:38'),
(9, '2024-08-22', '00:35:19', 'Login', 'login', NULL, NULL, '', '2024-08-21 17:35:19'),
(10, '2024-08-22', '00:42:09', 'Login', 'login', NULL, NULL, '', '2024-08-21 17:42:09'),
(11, '2024-08-22', '10:52:06', 'Login', 'login', NULL, NULL, '', '2024-08-22 03:52:06'),
(12, '2024-08-22', '14:14:54', 'Login', 'login', NULL, NULL, '', '2024-08-22 07:14:54'),
(13, '2024-08-22', '14:45:35', 'Login', 'login', NULL, NULL, '', '2024-08-22 07:45:35'),
(14, '2024-08-22', '14:48:35', 'Login', 'login', NULL, NULL, '', '2024-08-22 07:48:35'),
(15, '2024-08-22', '14:48:59', 'Login', 'login', NULL, NULL, '', '2024-08-22 07:48:59'),
(16, '2024-08-22', '14:52:33', 'Login', 'login', NULL, NULL, '', '2024-08-22 07:52:33'),
(17, '2024-08-22', '15:00:23', 'Logout', 'logout', NULL, NULL, '', '2024-08-22 08:00:23'),
(18, '2024-08-22', '15:02:35', 'Login', 'login', NULL, NULL, '', '2024-08-22 08:02:35'),
(19, '2024-08-22', '15:02:40', 'Login', 'login', NULL, NULL, '', '2024-08-22 08:02:40'),
(20, '2024-08-22', '15:04:00', 'Login', 'login', NULL, NULL, '', '2024-08-22 08:04:00'),
(21, '2024-08-22', '15:04:09', 'Login', 'login', NULL, NULL, '', '2024-08-22 08:04:09'),
(22, '2024-08-22', '15:07:03', 'Login', 'login', NULL, NULL, '', '2024-08-22 08:07:03'),
(23, '2024-08-22', '15:07:24', 'Login', 'login', NULL, NULL, '', '2024-08-22 08:07:24'),
(24, '2024-08-22', '15:07:35', 'Login', 'login', NULL, NULL, '', '2024-08-22 08:07:35'),
(25, '2024-08-22', '15:09:32', 'Login', 'login', NULL, NULL, '', '2024-08-22 08:09:32'),
(26, '2024-08-22', '15:10:05', 'Login', 'login', NULL, NULL, '', '2024-08-22 08:10:05'),
(27, '2024-08-22', '15:10:28', 'Login', 'login', NULL, NULL, '', '2024-08-22 08:10:28'),
(28, '2024-08-22', '15:10:32', 'Login', 'login', NULL, NULL, '', '2024-08-22 08:10:32'),
(29, '2024-08-22', '15:14:32', 'Login', 'login', NULL, NULL, '', '2024-08-22 08:14:32'),
(30, '2024-08-22', '15:14:35', 'Login', 'login', NULL, NULL, '', '2024-08-22 08:14:35'),
(31, '2024-08-22', '15:14:41', 'Login', 'login', NULL, NULL, '', '2024-08-22 08:14:41'),
(32, '2024-08-22', '15:14:45', 'Login', 'login', NULL, NULL, '', '2024-08-22 08:14:45'),
(33, '2024-08-22', '15:15:49', 'Login', 'login', NULL, NULL, '', '2024-08-22 08:15:49'),
(34, '2024-08-22', '15:17:16', 'Login', 'login', NULL, NULL, '', '2024-08-22 08:17:16'),
(35, '2024-08-22', '17:33:34', 'Login', 'login', NULL, NULL, '', '2024-08-22 10:33:34'),
(36, '2024-08-22', '17:33:41', 'Login', 'login', NULL, NULL, '', '2024-08-22 10:33:41'),
(37, '2024-08-22', '21:19:23', 'Login', 'login', NULL, NULL, '', '2024-08-22 14:19:23'),
(38, '2024-08-22', '21:19:29', 'Login', 'login', NULL, NULL, '', '2024-08-22 14:19:29'),
(39, '2024-08-22', '23:13:13', 'Login', 'login', NULL, NULL, '', '2024-08-22 16:13:13'),
(40, '2024-08-22', '23:44:00', 'Login', 'login', NULL, NULL, '', '2024-08-22 16:44:00'),
(41, '2024-08-22', '23:52:35', 'Login', 'login', NULL, NULL, '', '2024-08-22 16:52:35'),
(42, '2024-08-23', '08:31:18', 'Login', 'login', NULL, NULL, '', '2024-08-23 01:31:18'),
(43, '2024-08-23', '09:28:22', 'Login', 'login', NULL, NULL, '', '2024-08-23 02:28:22'),
(44, '2024-08-23', '09:30:34', 'Login', 'login', NULL, NULL, '', '2024-08-23 02:30:34'),
(45, '2024-08-23', '09:33:28', 'Login', 'login', NULL, NULL, '', '2024-08-23 02:33:28'),
(46, '2024-08-23', '09:34:00', 'Login', 'login', NULL, NULL, '', '2024-08-23 02:34:00'),
(47, '2024-08-23', '09:35:16', 'Login', 'login', NULL, NULL, '', '2024-08-23 02:35:16'),
(48, '2024-08-23', '09:37:10', 'Login', 'login', NULL, NULL, '', '2024-08-23 02:37:10'),
(49, '2024-08-23', '09:39:55', 'Login', 'login', NULL, NULL, '', '2024-08-23 02:39:55'),
(50, '2024-08-23', '13:34:55', 'Login', 'login', NULL, NULL, '', '2024-08-23 06:34:55'),
(51, '2024-08-23', '13:41:32', 'Login', 'login', NULL, NULL, '', '2024-08-23 06:41:32'),
(52, '2024-08-23', '13:42:24', 'Login', 'login', NULL, NULL, '', '2024-08-23 06:42:24'),
(53, '2024-08-23', '13:55:55', 'Login', 'login', NULL, NULL, '', '2024-08-23 06:55:55'),
(54, '2024-08-23', '13:59:12', 'Login', 'login', NULL, NULL, '', '2024-08-23 06:59:12'),
(55, '2024-08-23', '13:59:53', 'Login', 'login', NULL, NULL, '', '2024-08-23 06:59:53'),
(56, '2024-08-23', '14:02:16', 'Login', 'login', NULL, NULL, '', '2024-08-23 07:02:16'),
(57, '2024-08-23', '14:02:24', 'Login', 'login', NULL, NULL, '', '2024-08-23 07:02:24'),
(58, '2024-08-26', '20:58:41', 'Login', 'login', NULL, NULL, '', '2024-08-26 13:58:41'),
(59, '2024-08-26', '21:10:35', 'Login', 'login', NULL, NULL, '', '2024-08-26 14:10:35'),
(60, '2024-08-27', '23:13:38', 'Login', 'login', NULL, NULL, '', '2024-08-27 16:13:38'),
(61, '2024-08-27', '23:15:13', 'Login', 'login', NULL, NULL, '', '2024-08-27 16:15:13'),
(62, '2024-08-27', '23:15:25', 'Login', 'login', NULL, NULL, '', '2024-08-27 16:15:25'),
(63, '2024-08-27', '23:15:40', 'Login', 'login', NULL, NULL, '', '2024-08-27 16:15:40'),
(64, '2024-08-27', '23:17:11', 'Login', 'login', NULL, NULL, '', '2024-08-27 16:17:11'),
(65, '2024-08-28', '08:21:41', 'Login', 'login', NULL, NULL, '', '2024-08-28 01:21:41'),
(66, '2024-08-28', '08:30:27', 'Login', 'login', NULL, NULL, '', '2024-08-28 01:30:27'),
(67, '2024-08-28', '08:30:40', 'Login', 'login', NULL, NULL, '', '2024-08-28 01:30:40'),
(68, '2024-08-28', '08:31:39', 'Login', 'login', NULL, NULL, '', '2024-08-28 01:31:39'),
(69, '2024-08-28', '08:34:22', 'Login', 'login', NULL, NULL, '', '2024-08-28 01:34:22'),
(70, '2024-08-28', '08:36:06', 'Login', 'login', NULL, NULL, '', '2024-08-28 01:36:06'),
(71, '2024-08-30', '10:23:02', 'Login', 'login', NULL, NULL, '', '2024-08-30 03:23:02'),
(72, '2024-09-03', '13:30:36', 'Login', 'login', NULL, NULL, '', '2024-09-03 06:30:36'),
(73, '2024-09-03', '15:06:06', 'Login', 'login', NULL, NULL, '', '2024-09-03 08:06:06'),
(74, '2024-09-03', '15:47:35', 'Login', 'login', NULL, NULL, '', '2024-09-03 08:47:35'),
(75, '2024-09-04', '08:31:00', 'Login', 'login', NULL, NULL, '', '2024-09-04 01:31:00'),
(76, '2024-09-04', '18:15:33', 'Login', 'login', NULL, NULL, '', '2024-09-04 11:15:33'),
(77, '2024-09-04', '18:15:42', 'Login', 'login', NULL, NULL, '', '2024-09-04 11:15:42'),
(78, '2024-09-04', '18:15:46', 'Login', 'login', NULL, NULL, '', '2024-09-04 11:15:46'),
(79, '2024-09-04', '18:15:50', 'Login', 'login', NULL, NULL, '', '2024-09-04 11:15:50');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pointlog`
--

DROP TABLE IF EXISTS `pointlog`;
CREATE TABLE IF NOT EXISTS `pointlog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `senderid` int DEFAULT NULL,
  `sendername` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `receiverid` int NOT NULL,
  `receivername` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `pointsadded` int NOT NULL,
  `createdat` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `pointlog`
--

INSERT INTO `pointlog` (`id`, `senderid`, `sendername`, `receiverid`, `receivername`, `pointsadded`, `createdat`) VALUES
(1, NULL, 'System', 1, 'Nguyen Van A', 200, '2024-08-27 16:17:34'),
(2, NULL, 'System', 2, 'Tran Thi B', 200, '2024-08-27 16:17:34'),
(3, NULL, 'System', 3, 'Le Van C', 200, '2024-08-27 16:17:34'),
(4, NULL, 'System', 4, 'Pham Thi D', 200, '2024-08-27 16:17:34'),
(5, NULL, 'System', 5, 'Hoang Van E', 200, '2024-08-27 16:17:34'),
(6, NULL, 'System', 6, 'Ngo Thi F', 200, '2024-08-27 16:17:34'),
(7, NULL, 'System', 7, 'Bui Van G', 200, '2024-08-27 16:17:34'),
(8, NULL, 'System', 8, 'Do Thi H', 200, '2024-08-27 16:17:34'),
(9, NULL, 'System', 9, 'Vu Van I', 200, '2024-08-27 16:17:34'),
(10, NULL, 'System', 10, 'Dang Thi K', 200, '2024-08-27 16:17:34');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shifttype`
--

DROP TABLE IF EXISTS `shifttype`;
CREATE TABLE IF NOT EXISTS `shifttype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` text COLLATE utf8mb4_vietnamese_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `shifttype`
--

INSERT INTO `shifttype` (`id`, `description`) VALUES
(1, 'Ca làm việc ban ngày'),
(2, 'Ca làm việc buổi tối'),
(3, 'Ca làm việc buổi sáng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `userprofile`
--

DROP TABLE IF EXISTS `userprofile`;
CREATE TABLE IF NOT EXISTS `userprofile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `fullname` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `idcard` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `taxcode` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_vietnamese_ci,
  `phonenumber` varchar(20) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `bankaccountnumber` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `staffids` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `point` int NOT NULL DEFAULT '0',
  `locked` tinyint NOT NULL DEFAULT '0',
  `user_role` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `userprofile`
--

INSERT INTO `userprofile` (`id`, `employee_id`, `fullname`, `username`, `idcard`, `taxcode`, `address`, `phonenumber`, `bankaccountnumber`, `password`, `token`, `created_at`, `staffids`, `point`, `locked`, `user_role`) VALUES
(1, 'E001', 'Nguyen Van A', 'nguyenvana', '123456789', '1234567890', '123 ABC Street', '0123456789', '123456789012', 'password123', 'token1', '2024-08-20 16:39:44', '', 200, 0, 'manager'),
(2, 'E002', 'Tran Thi B', 'tranthib', '234567891', '2345678901', '234 DEF Street', '0987654321', '234567890123', 'password123', 'token2', '2024-08-20 16:39:44', NULL, 422, 0, ''),
(3, 'E003', 'Le Van C', 'levanc', '345678912', '3456789012', '345 GHI Street', '0912345678', '345678901234', 'password123', 'token3', '2024-08-20 16:39:44', NULL, 200, 0, ''),
(4, 'E004', 'Pham Thi D', 'phamthid', '456789123', '4567890123', '456 JKL Street', '0938765432', '456789012345', 'password123', 'token4', '2024-08-20 16:39:44', NULL, 200, 0, ''),
(5, 'E005', 'Hoang Van E', 'hoangvane', '567891234', '5678901234', '567 MNO Street', '0945678901', '567890123456', 'password123', 'token5', '2024-08-20 16:39:44', NULL, 200, 0, ''),
(6, 'E006', 'Ngo Thi F', 'ngothif', '678912345', '6789012345', '678 PQR Street', '0923456789', '678901234567', 'password123', 'token6', '2024-08-20 16:39:44', NULL, 200, 0, ''),
(7, 'E007', 'Bui Van G', 'buivang', '789123456', '7890123456', '789 STU Street', '0909876543', '789012345678', 'password123', 'token7', '2024-08-20 16:39:44', NULL, 200, 0, ''),
(8, 'E008', 'Do Thi H', 'dothih', '891234567', '8901234567', '890 VWX Street', '0976543210', '890123456789', 'password123', 'token8', '2024-08-20 16:39:44', NULL, 200, 0, ''),
(9, 'E009', 'Vu Van I', 'vuvani', '912345678', '9012345678', '901 YZA Street', '0981234567', '901234567890', 'password123', 'token9', '2024-08-20 16:39:44', NULL, 200, 0, ''),
(10, 'E010', 'Dang Thi K', 'dangthik', '123456780', '0123456789', '012 BCD Street', '0910987654', '012345678901', 'password123', 'token10', '2024-08-20 16:39:44', NULL, 200, 0, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vouchers`
--

DROP TABLE IF EXISTS `vouchers`;
CREATE TABLE IF NOT EXISTS `vouchers` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `point` int NOT NULL,
  `valid_to` date NOT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `vouchers`
--

INSERT INTO `vouchers` (`id`, `name`, `code`, `point`, `valid_to`, `image_url`) VALUES
(1, 'Voucher 20% Off', 'SHOP20', 2000, '2024-08-31', 'https://product.hstatic.net/200000551679/product/tag-03_88e5f3eb05634ba0b653defd664b4853_grande.png'),
(2, 'Voucher 50,000 VND Off', 'SHOP50K', 1800, '2024-09-01', 'https://tuanphong.vn/pictures/thumb/2018/09/1537415394-426-voucher-50000-vnd-640x640.png'),
(3, 'Voucher Buy 1 Get 1 Free', 'B1G1FREE', 1000, '2024-09-15', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCl1dSZ6qeIu0YtyY6iuFmcs9md8vbitg6Vw&s');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `workschedule`
--

DROP TABLE IF EXISTS `workschedule`;
CREATE TABLE IF NOT EXISTS `workschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `staffid` int NOT NULL,
  `workdate` date NOT NULL,
  `starttime` time NOT NULL,
  `endtime` time NOT NULL,
  `shifttype` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_vietnamese_ci,
  `createdat` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedat` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `locked` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `workschedule`
--

INSERT INTO `workschedule` (`id`, `staffid`, `workdate`, `starttime`, `endtime`, `shifttype`, `description`, `createdat`, `updatedat`, `locked`) VALUES
(1, 1, '2024-08-23', '08:00:00', '17:00:00', 'Ca làm việc ban ngày', 'Working on project A', '2024-08-22 22:16:59', '2024-08-22 22:16:59', 0),
(2, 2, '2024-08-23', '14:00:00', '22:00:00', 'Ca làm việc ban ngày', 'Maintaining the database servers', '2024-08-22 22:16:59', '2024-08-22 22:16:59', 0),
(3, 1, '2024-08-24', '09:00:00', '18:00:00', 'Ca làm việc ban ngày', 'Client meeting and project updates', '2024-08-22 22:16:59', '2024-08-22 22:16:59', 0),
(4, 3, '2024-08-24', '08:00:00', '16:00:00', 'Ca làm việc ban ngày', 'Reviewing the codebase and fixing bugs', '2024-08-22 22:16:59', '2024-08-22 22:16:59', 0),
(5, 2, '2024-08-25', '07:00:00', '15:00:00', 'Ca làm việc ban ngày', 'System maintenance and backups', '2024-08-22 22:16:59', '2024-08-22 22:16:59', 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
