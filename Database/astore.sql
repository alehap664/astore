-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 06, 2022 at 11:18 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `astore`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `Addresses` (
  `AddressID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `FullName` varchar(50) NOT NULL,
  `StreetAddress` varchar(255) NOT NULL,
  `PostCode` varchar(5) NOT NULL,
  `City` varchar(28) NOT NULL,
  `Country` varchar(28) NOT NULL,
  `Phone` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `addresses`
--

INSERT INTO `Addresses` (`AddressID`, `UserID`, `FullName`, `StreetAddress`, `PostCode`, `City`, `Country`, `Phone`) VALUES
(1, 1, 'Admin', 'Vanha Maantie 6', '02650', 'Espoo', 'Finland', '0123456789');


-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `Categories` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(58) NOT NULL,
  `Description` mediumtext DEFAULT NULL,
  `CategorySlug` varchar(68) NOT NULL,
  `Image` varchar(58) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `Categories` (`CategoryID`, `CategoryName`, `Description`, `CategorySlug`, `Image`) VALUES
(1, 'Áo khoác', 'Các loại áo khoác nam và nữ', 'Ao-khoac', 'Ao-khoac.png'),
(2, 'Áo thun', 'Các loại áo thun màu sắc', 'Ao-thun', 'Ao-thun.png'),
(3, 'Áo sơ mi', 'Các loại áo sơ mi theo thời thượng', 'Ao-so-mi', 'Ao-so-mi.png'),
(4, 'Áo kiểu ', 'Áo kiểu hot trend', 'Ao-kieu', 'Ao-kieu.png'),
(5, 'Quần short', 'Các loại quần short năng động', 'Quan-short', 'Quan-short.png'),
(6, 'Quần dài', 'Các loại quần dài cá tính', 'Quan-dai', 'Quan-dai.png'),
(7, 'Chân váy', 'Các loại chân váy ngắn và dài ', 'Chan-vay', 'Chan-vay.png'),
(8, 'Đầm', 'Các loại đầm tiểu thư công chúa', 'Dam', 'Dam.png'),
(9, 'Unisex', 'Unisex cho các cặp đôi', 'Unisex', 'Unisex.png'),
(10, 'Yếm', 'Các loại yếm bánh bèo', 'Yem', 'Yem.png'),
(11, 'Phụ kiện', 'Phụ kiện phù hợp mọi style', 'Phu-kien', 'Phu-kien.png');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `Messages` (
  `MessageID` int(11) NOT NULL,
  `FullName` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Subject` varchar(128) DEFAULT NULL,
  `Content` varchar(158) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order details`
--

CREATE TABLE `Order details` (
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` smallint(2) NOT NULL DEFAULT 1,
  `Total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `Orders` (
  `OrderID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `AddressID` int(11) NOT NULL,
  `SubTotal` decimal(10,2) DEFAULT NULL,
  `Discount` decimal(10,2) DEFAULT NULL,
  `ShippingFee` decimal(10,2) DEFAULT NULL,
  `Total` decimal(10,2) DEFAULT NULL,
  `OrderDate` datetime DEFAULT NULL,
  `Status` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `Products` (
  `ProductID` int(11) NOT NULL,
  `ProductName` varchar(40) NOT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `ProductPrice` decimal(10,2) DEFAULT 0.00,
  `UnitsInStock` smallint(5) DEFAULT 0,
  `Description` varchar(255) NOT NULL,
  `Image` varchar(50) NOT NULL,
  `ProductSlug` varchar(50) NOT NULL,
  `Feature` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `Products` (`ProductID`, `ProductName`, `CategoryID`, `ProductPrice`, `UnitsInStock`, `Description`, `Image`, `ProductSlug`, `Feature`) VALUES
(1, 'Áo khoác Nam xanh', 1, '340000', 99, 'Chất liệu:French Terry, Thành phần:100% cotton. Độ thấm hút thoát ẩm cao, mềm mại. Freesize','Ao-khoac-nam-xanh.png', 'Ao-khoac-nam-xanh',1),
(2, 'Áo khoác Nam họa tiết', 1, '350000', 99, 'Chất liệu:French Terry, Thành phần:100% cotton. Độ thấm hút thoát ẩm cao, co giãn đàn hồi. Freesize','Ao-khoac-nam-hoa.png', 'Ao-khoac-nam-hoa',1),
(3, 'Áo khoác Nam đen', 1, '340000', 99, 'Chất liệu:French Terry, Thành phần:100% cotton. Độ thấm hút thoát ẩm cao, sắc màu đen huyền bí. Freesize','Ao-khoac-nam-den.png', 'Ao-khoac-nam-den',1),
(4, 'Áo khoác Nữ trắng', 1, '330000', 99, 'Chất liệu:Crinkle Nylon, Thành phần:100% nylon. Chống tia UV,trượt nước, kết hợp màu trắng thanh lịch. Freesize','Ao-khoac-nu-trang.png', 'Ao-khoac-nu-trang',1),
(5, 'Áo khoác Nữ hồng', 1, '330000', 99, 'Chất liệu:Crinkle Nylon, Thành phần:100% nylon. Chống tia UV,trượt nước, kết hợp màu hồng nhẹ nhàng. Freesize','Ao-khoac-nu-hong.png', 'Ao-khoac-nu-hong',1),
(6, 'Áo khoác Nữ họa tiết', 1, '340000', 99, 'Chất liệu:French Terry, Thành phần:100% cotton. Độ thấm hút thoát ẩm cao, mềm mại. Freesize','Ao-khoac-nu-hoa.png', 'Ao-khoac-nu-hoa',1),
(7, 'Áo khoác Nữ hoodie', 1, '350000', 99, 'Chất liệu:French Terry, Thành phần:100% cotton. Co giãn đàn hồi, khóa túi có bề mặt ngoài kết hợp với màu sắc đẹp. Freesize','Ao-khoac-nu-hoodie.png', 'Ao-khoac-nu-hoodie',1),
(8, 'Áo khoác Nữ Cardigan', 1, '360000', 99, 'Chất liệu:French Terry, Thành phần:100% cotton. Thấm hút thoát ẩm, họa tiết thêu 2D, túi trong tiện lợi. Freesize','Ao-khoac-nu-cardigan.png', 'Ao-khoac-nu-cardigan',1),
(9, 'Áo thun Nam trắng', 2, '220000', 99, 'Chất liệu:Cotton Compact 2C, Thành phần:100% cotton. Thấm hút thoát ẩm, mềm mại, kiểm soát mùi. Freesize','Ao-thun-nam-trang.png', 'Ao-thun-nam-trang',1),
(10, 'Áo thun Nam đen', 2, '230000', 99, 'Chất liệu:Cotton Compact 2C, Thành phần:100% cotton. Thấm hút thoát ẩm, mềm mại, kiểm soát mùi kết hợp màu đen tạo độ huyền bí. Freesize','Ao-thun-nam-den.png', 'Ao-thun-nam-den',1),
(11, 'Áo thun Nam cổ trụ', 2, '300000', 99, 'Chất liệu:vải cá sấu TiCi, Thành phần:100% cotton. Thấm hút thoát ẩm, cổ trụ tạo độ lịch lãm, may đắp logo inox. Freesize','Ao-thun-nam-co-tru.png', 'Ao-thun-nam-co-tru',1),
(12, 'Áo thun Nam họa tiết', 2, '280000', 99, 'Chất liệu:cá sấu Cotton, Thành phần:6% cotton 74% Spandex. Thấm hút thoát ẩm, họa tiết in nước và thêu tỉ mỉ. Freesize','Ao-thun-nam-hoa.png', 'Ao-thun-nam-hoa',1),
(13, 'Áo thun Nữ trắng', 2, '230000', 60, 'Chất liệu:Cotton Compact 2C, Thành phần:100% cotton. Thấm hút thoát ẩm, mềm mại, điều hòa nhiệt. Freesize','Ao-thun-nu-trang.png', 'Ao-thun-nu-trang',1),
(14, 'Áo thun Nữ xanh', 2, '230000', 50, 'Chất liệu:Cotton Compact 2C, Thành phần:100% cotton. Thấm hút thoát ẩm, mềm mại, kiểm soát mùi, màu xanh trong mát. Freesize','Ao-thun-nu-xanh.png', 'Ao-thun-nu-xanh',1),
(15, 'Áo thun Nữ họa tiết', 2, '240000', 50, 'Chất liệu:thun Poly, Thành phần:97% Polyesster 3% Spandex. Bề mặt vải đẹp và lạ mắt kết hợp kiểu dệt Jacquard tạo ra một loại vải có chất lượng cao, co dãn tốt. Freesize','Ao-thun-nu-hoa.png', 'Ao-thun-nu-hoa',1),
(16, 'Áo thun Nữ cổ tròn', 2, '230000', 50, 'Chất liệu:Cotton Spandex, Thành phần:92% cotton 8% spandex. Thấm hút thoát ẩm, mềm mại, ít nhăn, họa tiết Bbuff thêu. Freesize','Ao-thun-nu-tron.png', 'Ao-thun-nu-tron',1),
(17, 'Áo sơ mi Nam tay dài', 3, '310000', 60, 'Chất liệu:Kate, Thành phần:12% modal 88% superfine. Ít nhăn dễ ủi, nhanh khô và thoáng mát. Freesize','Ao-so-mi-nam-dai.png', 'Ao-so-mi-nam-dai',1),
(18, 'Áo sơ mi Nam tay ngắn', 3, '305000', 40, 'Chất liệu:Nhung, Thành phần:100% Polyester. Bền bỉ, mềm mại kết hợp độ thoáng mát với thiết kế tay ngắn. Freesize','Ao-so-mi-nam-ngan.png', 'Ao-so-mi-nam-ngan',1),
(19, 'Áo sơ mi Nam caro', 3, '320000', 50, 'Chất liệu:vải Caro, Thành phần:70% Polyester 30% Rayon. Form dáng rộng rãi thường cực kỳ thoải mái và rất thời trang. Freesize','Ao-so-mi-nam-caro.png', 'Ao-so-mi-nam-caro',1),
(20, 'Áo sơ mi Nam họa tiết', 3, '330000', 50, 'Chất liệu:Vải dù, Thành phần:100% Polyester. Co giãn, vải nhẹ, nhanh khô, họa tiết in chuyển nhiệt. Freesize','Ao-so-mi-nam-hoa.png', 'Ao-so-mi-nam-hoa',1),
(21, 'Áo sơ mi Nữ tay dài', 3, '280000', 40, 'Chất liệu:Nhung, Thành phần:100% Polyester. Bền bỉ, mềm mại kết hợp độ thoáng mát dành cho phái nữ. Freesize','Ao-so-mi-nu-dai.png', 'Ao-so-mi-nu-dai',1),
(22, 'Áo sơ mi Nữ tay ngắn', 3, '270000', 40, 'Chất liệu:vải Linen Gân, Thành phần:100% Rayon. Nhanh khô, co giãn nhẹ, thích hợp cho môi trường công sở. Freesize','Ao-so-mi-nu-ngan.png', 'Ao-so-mi-nu-ngan',1),
(23, 'Áo sơ mi Nữ caro', 3, '280000', 50, 'Chất liệu:vải Caro, Thành phần:70% Polyester 30% Rayon. Mềm mịn, vải nhẹ thích hợp cho phái nữ, họa tiết in chuyển nhiệt. Freesize','Ao-so-mi-nu-caro.png', 'Ao-so-mi-n-caro',1),
(24, 'Áo sơ mi Nữ họa tiết', 3, '290000', 50, 'Chất liệu:Vải sợi tre, Thành phần:50% Bamboo 50% Poly. Họa tiết thêu, ít nhăn, chống tia UV và kháng khuẩn. Freesize','Ao-so-mi-nu-hoa.png', 'Ao-so-mi-nu-hoa',1),
(25, 'Áo kiểu một màu', 4, '320000', 40, 'Chất liệu:Cotton 4 chiều, Thành phần:100% Cotton. Kiểm soát mùi, co giãn tối ưu, họa tiết in dẻo. Freesize','Ao-kieu-mot-mau.png', 'Ao-kieu-mot-mau',1),
(26, 'Áo kiểu họa tiết', 4, '330000', 40, 'Chất liệu:Cotton Compact 2C, Thành phần:100% Cotton. Cut-out tay áo ấn tượng, may logo kim loại, thân thiện. Freesize','Ao-kieu-hoa-tiet.png', 'Ao-kieu-hoa-tiet',1),
(27, 'Áo kiểu nhiều màu', 4, '320000', 40, 'Chất liệu:Cotton 4 chiều, Thành phần:100% Cotton. Thấm hút thoát ẩm, co giãn tối ưu, nhiều màu tạo độ đa dạng. Freesize','Ao-kieu-nhieu-mau.png', 'Ao-kieu-nhieu-mau',1),
(28, 'Quần short Nam đen', 5, '305000', 50, 'Chất liệu:Mini Zurry, Thành phần:94% Cotton 6% Spandex. Thấm hút thoát ẩm, co giãn tối ưu, ít nhăn. Freesize','Quan-short-nam-den.png', 'Quan-short-nam-den',1),
(29, 'Quần short Nam xám', 5, '305000', 50, 'Chất liệu:Mini Zurry, Thành phần:94% Cotton 6% Spandex. Thấm hút thoát ẩm, co giãn tối ưu, xám huyền bí. Freesize','Quan-short-nam-xam.png', 'Quan-short-nam-xam',1),
(30, 'Quần short Nam dù', 5, '300000', 50, 'Chất liệu:vải Dù, Thành phần:100% Poly. Độ bền cao, dễ dàng giặt ủi, may đắp logo, 2 túi trước có dây kéo tiện lợi. Freesize','Quan-short-nam-du.png', 'Quan-short-nam-du',1),
(31, 'Quần short Nam họa tiết', 5, '315000', 50, 'Chất liệu:Non stick fabric, Thành phần:92% Polyester 8% Spandex. Sử dụng công nghệ in chuyển nhiệt trên vải tạo nên những họa tiết sắc nét sinh động, bền hơn, ít phai màu hơn. Freesize','Quan-short-nam-hoa.png', 'Quan-short-nam-hoa',1),
(32, 'Quần short Nữ trắng', 5, '290000', 50, 'Chất liệu:Mini Zurry, Thành phần:94% Cotton 6% Spandex. Thấm hút thoát ẩm, co giãn tối ưu, trắng tạo độ tao nhã. Freesize','Quan-short-nu-trang.png', 'Quan-short-nu-trang',1),
(33, 'Quần short Nữ nâu', 5, '300000', 50, 'Chất liệu:Mini Zurry, Thành phần:94% Cotton 6% Spandex. Thấm hút thoát ẩm, co giãn tối ưu, xám huyền bí. Freesize','Quan-short-nu-nau.png', 'Quan-short-nu-nau',1),
(34, 'Quần short Nữ dù', 5, '280000', 50, 'Chất liệu:vải Dù, Thành phần:100% Poly. Độ bền cao, dễ dàng giặt ủi, may đắp logo, 2 túi trước có dây kéo tiện lợi. Freesize','Quan-short-nu-du.png', 'Quan-short-nu-du',1),
(35, 'Quần short Nữ Jean', 5, '315000', 50, 'Chất liệu:Jean Cotton, Thành phần:92% Cotton 8% Spandex. Sử dụng công nghệ in chuyển nhiệt trên vải tạo nên những họa tiết sắc nét sinh động, bền hơn, ít phai màu hơn. Freesize','Quan-short-nu-jean.png', 'Quan-short-nu-jean',1),
(36, 'Quần dài Nam tây đen', 6, '380000', 99, 'Chất liệu:vải quần Tây, Thành phần:96% Polyester 4% Spandex. Hút ẩm tốt, mềm mại và thoáng khí, phù hợp với môi trường công sở. Freesize','Quan-nam-tay.png', 'Quan-nam-tay',1),
(37, 'Quần dài Nam jean', 6, '380000', 99, 'Chất liệu:Jean Cotton, Thành phần:99% Cotton 1% Spandex. Mang đến sự thoải mái ở phần hông và đùi nhưng vẫn rất gọn gàng, độ bền cao. Freesize','Quan-nam-jean.png', 'Quan-nam-jean',1),
(38, 'Quần dài Nam jogger', 6, '380000', 99, 'Chất liệu:Cotton Plus, Thành phần:100% Cotton. Hút ẩm tốt, mềm mại và thoáng khí, năng động. Freesize','Quan-nam-jogger.png', 'Quan-nam-jogger',1),
(39, 'Quần dài Nữ tây đen', 6, '350000', 69, 'Chất liệu:vải quần Tây, Thành phần:96% Polyester 4% Spandex. Hút ẩm tốt, mềm mại và thoáng khí, phù hợp với môi trường công sở. Freesize','Quan-nu-tay.png', 'Quan-nu-tay',1),
(40, 'Quần dài Nữ jean', 6, '380000', 69, 'Chất liệu:Jean Cotton, Thành phần:99% Cotton 1% Spandex. Mang đến sự thoải mái ở phần hông và đùi nhưng vẫn rất gọn gàng, độ bền cao. Freesize','Quan-nu-jean.png', 'Quan-nu-jean',1),
(41, 'Quần dài Nữ jogger', 6, '320000', 69, 'Chất liệu:Cotton Plus, Thành phần:100% Cotton. Hút ẩm tốt, mềm mại và thoáng khí, năng động. Freesize','Quan-nu-jogger.png', 'Quan-nu-jogger',1),
(42, 'Chân váy dài', 7, '250000', 60, 'Chất liệu:Cotton Plus, Thành phần:100% Cotton. Hút ẩm tốt, mềm mại và thoáng khí, trẻ trung. Freesize','Chan-vay-dai.png', 'Chan-vay-dai',1),
(43, 'Chân váy ngắn', 7, '250000', 60, 'Chất liệu:Cotton Plus, Thành phần:100% Cotton. Vải nhẹ, mềm mại và thoáng khí, dễ ủi. Freesize','Chan-vay-ngan.png', 'Chan-vay-ngan',1),
(44, 'Chân váy ôm body', 7, '260000', 60, 'Chất liệu:Cotton Plus, Thành phần:100% Cotton. Trẻ trung, tôn dáng cho phái nữ. Freesize','Chan-vay-om.png', 'Chan-vay-om',1),
(45, 'Chân váy họa tiết', 7, '270000', 60, 'Chất liệu:Cotton Plus, Thành phần:100% Cotton. Sản phẩm in cho hình ảnh chân thực, bền hơn, ít phai màu hơn. Freesize','Chan-vay-hoa.png', 'Chan-vay-hoa',1),
(46, 'Đầm nhiều màu', 8, '450000', 60, 'Chất liệu:Kaki Nhung, Thành phần:100% Polyester. Họa tiết thêu 3D, uyển chuyển, nhẹ nhàng. Freesize','Dam-nhieu-mau.png', 'Dam-nhieu-mau',1),
(47, 'Đầm họa tiết', 8, '455000', 60, 'Chất liệu:Cotton Plus, Thành phần:100% Cotton. Hình in không gây cộm, nhẹ nhàng, tao nhã. Freesize','Dam-hoa-tiet.png', 'Dam-hoa-tiet',1),
(48, 'Đầm ôm body', 8, '410000', 60, 'Chất liệu:Kaki Nhung, Thành phần:100% Polyester. Tạo đường cong gợi cảm, thoáng khí, dễ ủi. Freesize','Dam-om.png', 'Dam-om',1),
(49, 'Đầm jean', 8, '450000', 60, 'Chất liệu:Jean Cotton, Thành phần:99% Cotton 1% Spandex. Giữ form dáng, thoáng khí, nữ tính, độ bền. Freesize','Dam-jean.png', 'Dam-jean',1),
(50, 'Couple Sweater', 9, '450000', 60, 'Chất liệu:Cotton double face, Thành phần:99% Cotton 1% Polyester. Co giãn, độ bền cao, thoáng khí. Freesize','Couple-sweater.png', 'Couple-sweater',1),
(51, 'Couple cổ tròn', 9, '450000', 60, 'Chất liệu:Vải Cotton, Thành phần:99% Cotton 1% Spandex. Họa tiết in nước thêu, thích hợp cho các cặp đôi. Freesize','Couple-tron.png', 'Couple-tron',1),
(52, 'Couple Polo', 9, '450000', 60, 'Chất liệu:Cotton 2 da, Thành phần:99% Cotton 1% Polyester. Họa tiết in decal, độ bền cao, thoáng khí, nhanh khô. Freesize','Couple-polo.png', 'Couple-polo',1),
(53, 'Yếm dài', 10, '460000', 60, 'Chất liệu:Jean Cotton, Thành phần:92% Cotton 8% Spandex. Sử dụng công nghệ in chuyển nhiệt trên vải tạo nên những họa tiết sắc nét sinh động, bền hơn, ít phai màu hơn. Freesize','Yem-dai.png', 'Yem-dai',1),
(54, 'Yếm ngắn', 10, '455000', 60, 'Chất liệu:Jean Cotton, Thành phần:92% Cotton 8% Spandex. Họa tiết sắc nét sinh động, bền hơn, ít phai màu hơn. Freesize','Yem-ngan.png', 'Yem-ngan',1),
(55, 'Yếm họa tiết', 10, '460000', 60, 'Chất liệu:Vải sợi tre, Thành phần:50% Bamboo 50% Poly. Họa tiết thêu, ít nhăn, chống tia UV và kháng khuẩn. Freesize','Yem-hoa-tiet.png', 'Yem-hoa-tiet',1),
(56, 'Dây nịt nguyên bản', 11, '285000', 60, 'Chất liệu:Da, Thành phần:100% da bò thật. Bền bỉ, bề mặt sáng bóng và đẹp, sang trọng và tinh tế, không gỉ sét. Freesize','Day-nit-ban.png', 'Day-nit-ban',1),
(57, 'Ví nguyên bản', 11, '285000', 60, 'Chất liệu:Da, Thành phần:100% da bò thật. Tặng kèm Box sang trọng, bảo hành 365 ngày, kích thước ngang 9.5cm x cao 12cm. Freesize','Vi-nguyen-ban.png', 'Vi-nguyen-ban',1),
(58, 'Nón lưỡi trai', 11, '197000', 60, 'Chất liệu:Kaki, Thành phần:100% Cotton. May logo + Acid wash','Non-luoi-trai.png', 'Non-luoi-trai',1),
(59, 'Nón Bucket', 11, '125000', 60, 'Chất liệu:Da, Thành phần:100% da bò thật. Màu đỏ tươi tắn','Non-bucket.png', 'Non-bucket',1);

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `Subscribers` (
  `Email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `FullName` varchar(50) NOT NULL,
  `StreetAddress` varchar(255) NOT NULL,
  `PostCode` varchar(5) NOT NULL,
  `City` varchar(28) NOT NULL,
  `Country` varchar(28) NOT NULL,
  `Phone` varchar(12) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Username` varchar(28) DEFAULT NULL,
  `Password` varchar(158) DEFAULT NULL,
  `Admin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `FullName`, `StreetAddress`, `PostCode`, `City`, `Country`, `Phone`, `Email`, `Username`, `Password`, `Admin`) VALUES
(1, 'Admin', 'TestStreet', '1234', 'HCM city', 'Vietnam', '09123456789', 'admin@gmail.com', 'admin', '$2a$10$mpJCYlSr762SwQVzdLwxR.KgRuWEHA2NzUanxxG/nxEStDRcRBbB6', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `Addresses`
  ADD PRIMARY KEY (`AddressID`),
  ADD KEY `FK_Users_UserID` (`UserID`);

--
-- Indexes for table `categories`
--
ALTER TABLE `Categories`
  ADD PRIMARY KEY (`CategoryID`),
  ADD KEY `CategoryName` (`CategoryName`);

--
-- Indexes for table `messages`
--
ALTER TABLE `Messages`
  ADD PRIMARY KEY (`MessageID`);

--
-- Indexes for table `order details`
--
ALTER TABLE `Order details`
  ADD PRIMARY KEY (`OrderID`,`ProductID`),
  ADD KEY `FK_Order_Details_Products` (`ProductID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `FK_Orders_Users` (`UserID`);

--
-- Indexes for table `products`
--
ALTER TABLE `Products`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `FK_Products_Categories` (`CategoryID`),
  ADD KEY `ProductName` (`ProductName`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`),
  ADD KEY `Username` (`Username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `Addresses`
  MODIFY `AddressID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `Categories`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `Messages`
  MODIFY `MessageID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `Orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `Products`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `Addresses`
  ADD CONSTRAINT `FK_Users_UserID` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE;

--
-- Constraints for table `order details`
--
ALTER TABLE `Order details`
  ADD CONSTRAINT `FK_Order_Details_Orders` FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Order_Details_Products` FOREIGN KEY (`ProductID`) REFERENCES `Products` (`ProductID`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `FK_Orders_Users` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `Products`
  ADD CONSTRAINT `FK_Products_Categories` FOREIGN KEY (`CategoryID`) REFERENCES `Categories` (`CategoryID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
