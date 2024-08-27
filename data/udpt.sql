-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th8 27, 2024 lúc 11:19 PM
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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
