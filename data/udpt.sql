-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th8 22, 2024 lúc 12:47 AM
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
-- Cấu trúc bảng cho bảng `employeerequest`
--

DROP TABLE IF EXISTS `employeerequest`;
CREATE TABLE IF NOT EXISTS `employeerequest` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employeeid` int NOT NULL,
  `requesttypeid` int NOT NULL,
  `requestdate` date NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `requestdetails` text COLLATE utf8mb4_vietnamese_ci,
  `createdat` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedat` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `locked` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

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
(10, '2024-08-22', '00:42:09', 'Login', 'login', NULL, NULL, '', '2024-08-21 17:42:09');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `requesttype`
--

DROP TABLE IF EXISTS `requesttype`;
CREATE TABLE IF NOT EXISTS `requesttype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `requesttype`
--

INSERT INTO `requesttype` (`id`, `name`) VALUES
(2, 'Cập nhật bảng chấm công'),
(3, 'Check-in'),
(4, 'Check-out'),
(5, 'Làm việc từ xa'),
(1, 'Nghỉ phép');

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
  `locked` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `userprofile`
--

INSERT INTO `userprofile` (`id`, `employee_id`, `fullname`, `username`, `idcard`, `taxcode`, `address`, `phonenumber`, `bankaccountnumber`, `password`, `token`, `created_at`, `staffids`, `locked`) VALUES
(1, 'E001', 'Nguyen Van A', 'nguyenvana', '123456789', '1234567890', '123 ABC Street', '0123456789', '123456789012', 'password123', 'token1', '2024-08-20 16:39:44', '[1, 3, 5, 7]', 0),
(2, 'E002', 'Tran Thi B', 'tranthib', '234567891', '2345678901', '234 DEF Street', '0987654321', '234567890123', 'password123', 'token2', '2024-08-20 16:39:44', NULL, 0),
(3, 'E003', 'Le Van C', 'levanc', '345678912', '3456789012', '345 GHI Street', '0912345678', '345678901234', 'password123', 'token3', '2024-08-20 16:39:44', NULL, 0),
(4, 'E004', 'Pham Thi D', 'phamthid', '456789123', '4567890123', '456 JKL Street', '0938765432', '456789012345', 'password123', 'token4', '2024-08-20 16:39:44', NULL, 0),
(5, 'E005', 'Hoang Van E', 'hoangvane', '567891234', '5678901234', '567 MNO Street', '0945678901', '567890123456', 'password123', 'token5', '2024-08-20 16:39:44', NULL, 0),
(6, 'E006', 'Ngo Thi F', 'ngothif', '678912345', '6789012345', '678 PQR Street', '0923456789', '678901234567', 'password123', 'token6', '2024-08-20 16:39:44', NULL, 0),
(7, 'E007', 'Bui Van G', 'buivang', '789123456', '7890123456', '789 STU Street', '0909876543', '789012345678', 'password123', 'token7', '2024-08-20 16:39:44', NULL, 0),
(8, 'E008', 'Do Thi H', 'dothih', '891234567', '8901234567', '890 VWX Street', '0976543210', '890123456789', 'password123', 'token8', '2024-08-20 16:39:44', NULL, 0),
(9, 'E009', 'Vu Van I', 'vuvani', '912345678', '9012345678', '901 YZA Street', '0981234567', '901234567890', 'password123', 'token9', '2024-08-20 16:39:44', NULL, 0),
(10, 'E010', 'Dang Thi K', 'dangthik', '123456780', '0123456789', '012 BCD Street', '0910987654', '012345678901', 'password123', 'token10', '2024-08-20 16:39:44', NULL, 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
