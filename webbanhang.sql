-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 27, 2024 at 04:30 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webbanhang`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` bigint(20) NOT NULL,
  `created_date_time` datetime(6) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `modified_date_time` datetime(6) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `details` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `district` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ward` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `created_date_time`, `created_by`, `status`, `modified_date_time`, `updated_by`, `details`, `district`, `province`, `ward`) VALUES
(1, '2024-08-22 21:47:42.000000', 'ltb@gmail.com', NULL, '2024-08-22 21:47:42.000000', 'ltb@gmail.com', '12 HN', 'Xã Chiềng Khoi', 'Sơn La', 'Huyện Yên Châu'),
(2, '2024-08-22 21:48:15.000000', 'ltb@gmail.com', NULL, '2024-08-22 21:48:15.000000', 'ltb@gmail.com', '12 HN', 'Xã Chiềng Khoi', 'Sơn La', 'Huyện Yên Châu');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` bigint(20) NOT NULL,
  `created_date_time` datetime(6) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `modified_date_time` datetime(6) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `total_cost` decimal(38,2) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `created_date_time`, `created_by`, `status`, `modified_date_time`, `updated_by`, `total_cost`, `user_id`) VALUES
(1, '2024-08-22 21:42:41.000000', 'SUPER_ADMIN', 1, '2024-08-22 21:42:41.000000', 'SUPER_ADMIN', 0.00, NULL),
(2, '2024-08-22 21:44:13.000000', 'SUPER_ADMIN', 1, '2024-08-22 21:44:13.000000', 'SUPER_ADMIN', 100000.00, NULL),
(3, '2024-08-27 20:29:51.000000', 'admin', 0, NULL, NULL, 199999.00, NULL),
(4, '2024-08-27 15:41:09.000000', '4', 0, NULL, NULL, 0.00, 4),
(5, '2024-08-27 20:55:18.000000', '1', 0, NULL, NULL, 50000.00, 1),
(6, '2024-08-27 16:20:10.000000', '6', 0, NULL, NULL, 199999.00, 6);

-- --------------------------------------------------------

--
-- Table structure for table `cart_details`
--

CREATE TABLE `cart_details` (
  `id` bigint(20) NOT NULL,
  `created_date_time` datetime(6) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `modified_date_time` datetime(6) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `price_of_one` decimal(38,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_price` decimal(38,2) DEFAULT NULL,
  `cart_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_details`
--

INSERT INTO `cart_details` (`id`, `created_date_time`, `created_by`, `status`, `modified_date_time`, `updated_by`, `price_of_one`, `quantity`, `total_price`, `cart_id`, `product_id`) VALUES
(3, '2024-08-27 20:29:51.000000', 'admin', 0, NULL, NULL, 199999.00, 1, 199999.00, 3, 2),
(8, '2024-08-27 21:26:44.000000', 'admin', 0, NULL, NULL, 199999.00, 1, 199999.00, 6, 2);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) NOT NULL,
  `created_date_time` datetime(6) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `modified_date_time` datetime(6) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `created_date_time`, `created_by`, `status`, `modified_date_time`, `updated_by`, `category_name`) VALUES
(1, '2024-08-22 21:28:25.000000', NULL, 1, '2024-08-22 21:28:34.000000', NULL, 'Áo phông'),
(2, '2024-08-22 21:34:30.000000', NULL, 1, '2024-08-22 21:34:38.000000', NULL, 'Quần đùi'),
(3, '2024-08-22 21:48:55.000000', 'superadmin@gmail.com', 1, '2024-08-22 21:49:02.000000', 'superadmin@gmail.com', 'Quần bò');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) NOT NULL,
  `created_date_time` datetime(6) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `modified_date_time` datetime(6) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `full_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `gender` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `cart_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `created_date_time`, `created_by`, `status`, `modified_date_time`, `updated_by`, `address`, `dob`, `full_name`, `gender`, `phone`, `cart_id`, `user_id`) VALUES
(1, NULL, 'SUPER_ADMIN', 1, NULL, 'SUPER_ADMIN', 'Hanoi', NULL, 'Nguyen Van A', 'MALE', NULL, 1, 2),
(2, NULL, 'SUPER_ADMIN', 1, NULL, 'SUPER_ADMIN', 'HCM', NULL, 'Le Thi B', 'MALE', NULL, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` bigint(20) NOT NULL,
  `created_date_time` datetime(6) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `modified_date_time` datetime(6) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `image_link` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `created_date_time`, `created_by`, `status`, `modified_date_time`, `updated_by`, `image_link`) VALUES
(1, '2024-08-22 21:29:57.000000', NULL, 1, '2024-08-22 21:29:57.000000', NULL, 'https://onlineshopswp391g1.s3-ap-southeast-1.amazonaws.com/product_null_2024-08-22T21%3A29%3A56.821901500?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240822T142957Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIA4MTWGWUSPDNXQGTX%2F20240822%2Fap-southeast-1%2Fs3%2Faws4_request&X-Amz-Signature=eb4a1968fdd8be4345673aba39d9429414fb6af5d3cf1f7c8733b49ca1bd2941'),
(2, '2024-08-22 21:30:30.000000', NULL, 1, '2024-08-22 21:30:30.000000', NULL, 'https://onlineshopswp391g1.s3-ap-southeast-1.amazonaws.com/product_null_2024-08-22T21%3A30%3A29.773620200?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240822T143030Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIA4MTWGWUSPDNXQGTX%2F20240822%2Fap-southeast-1%2Fs3%2Faws4_request&X-Amz-Signature=9f1b6e0d67beeed862a75e7717561914872ba0ca61b7eaff528a14aaaa25172f'),
(3, '2024-08-22 21:30:38.000000', NULL, 1, '2024-08-22 21:30:38.000000', NULL, 'https://onlineshopswp391g1.s3-ap-southeast-1.amazonaws.com/product_2_2024-08-22T21%3A30%3A37.376047800?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240822T143038Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIA4MTWGWUSPDNXQGTX%2F20240822%2Fap-southeast-1%2Fs3%2Faws4_request&X-Amz-Signature=bc5d548c20021374532c0c158330b71c6d62c887d09241a8ed7cf7077fd5d926'),
(4, '2024-08-22 21:35:06.000000', NULL, 1, '2024-08-22 21:35:06.000000', NULL, 'https://onlineshopswp391g1.s3-ap-southeast-1.amazonaws.com/product_null_2024-08-22T21%3A35%3A05.681200100?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240822T143506Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604799&X-Amz-Credential=AKIA4MTWGWUSPDNXQGTX%2F20240822%2Fap-southeast-1%2Fs3%2Faws4_request&X-Amz-Signature=d609e893afb66b09dd40d2c259484bcf50f307b7967f13d27b89b12bc0c9ed6e'),
(5, '2024-08-22 21:49:39.000000', 'superadmin@gmail.com', 1, '2024-08-22 21:49:39.000000', 'superadmin@gmail.com', 'https://onlineshopswp391g1.s3-ap-southeast-1.amazonaws.com/product_null_2024-08-22T21%3A49%3A37.253990?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240822T144939Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIA4MTWGWUSPDNXQGTX%2F20240822%2Fap-southeast-1%2Fs3%2Faws4_request&X-Amz-Signature=c681781e3c67f5e4b43e5f0b10e436ac45f4d90a2c116469b1845115b79a8f2b'),
(6, '2024-08-22 21:49:51.000000', 'superadmin@gmail.com', 1, '2024-08-22 21:49:51.000000', 'superadmin@gmail.com', 'https://onlineshopswp391g1.s3-ap-southeast-1.amazonaws.com/product_4_2024-08-22T21%3A49%3A50.616874?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240822T144951Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIA4MTWGWUSPDNXQGTX%2F20240822%2Fap-southeast-1%2Fs3%2Faws4_request&X-Amz-Signature=ce120086708445047fabce0d9a3072f3224182e490569729c8b31331383d8b2c');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL,
  `created_date_time` datetime(6) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `modified_date_time` datetime(6) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `full_cost` decimal(38,2) DEFAULT NULL,
  `transaction_code` varchar(255) DEFAULT NULL,
  `order_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `order_time` datetime(6) DEFAULT NULL,
  `shipping_fee` decimal(38,2) DEFAULT NULL,
  `total_cost` decimal(38,2) DEFAULT NULL,
  `transaction_status` varchar(255) DEFAULT NULL,
  `address_id` bigint(20) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `address` varchar(1000) NOT NULL,
  `phone` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `created_date_time`, `created_by`, `status`, `modified_date_time`, `updated_by`, `full_cost`, `transaction_code`, `order_status`, `order_time`, `shipping_fee`, `total_cost`, `transaction_status`, `address_id`, `customer_id`, `address`, `phone`) VALUES
(1, '2024-08-22 21:47:42.000000', 'ltb@gmail.com', 1, '2024-08-22 21:47:42.000000', 'ltb@gmail.com', 400000.00, NULL, 'SUCCEEDED', '2024-08-22 21:47:42.000000', 41501.00, 441501.00, NULL, 1, 2, '', ''),
(2, '2024-08-22 21:48:15.000000', 'ltb@gmail.com', 1, '2024-08-22 21:48:15.000000', 'ltb@gmail.com', 200000.00, NULL, 'SUCCEEDED', '2024-08-22 21:48:15.000000', 41501.00, 241501.00, NULL, 2, 2, '', ''),
(3, '2024-08-27 21:18:58.000000', 'admin', 0, '2024-08-27 21:18:58.000000', 'admin', NULL, NULL, 'Pending', '2024-08-27 21:18:58.000000', NULL, 50000.00, 'Pending', NULL, NULL, 'Hanoi', '0912345678'),
(4, '2024-08-27 21:20:39.000000', 'admin', 0, '2024-08-27 21:20:39.000000', 'admin', NULL, NULL, 'Pending', '2024-08-27 21:20:39.000000', NULL, 399999.00, 'Pending', NULL, NULL, 'Hanoi', '090909090');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) NOT NULL,
  `created_date_time` datetime(6) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `modified_date_time` datetime(6) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `price_of_one` decimal(38,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_price` decimal(38,2) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `created_date_time`, `created_by`, `status`, `modified_date_time`, `updated_by`, `price_of_one`, `quantity`, `total_price`, `order_id`, `product_id`) VALUES
(1, '2024-08-22 21:47:42.000000', 'ltb@gmail.com', 1, '2024-08-22 21:47:42.000000', 'ltb@gmail.com', 200000.00, 2, 200000.00, 1, 2),
(2, '2024-08-22 21:48:15.000000', 'ltb@gmail.com', 1, '2024-08-22 21:48:15.000000', 'ltb@gmail.com', 100000.00, 2, 100000.00, 2, 3),
(3, '2024-08-27 21:18:58.000000', 'admin', 0, '2024-08-27 21:18:58.000000', 'admin', 50000.00, 1, 50000.00, 3, 3),
(4, '2024-08-27 21:20:39.000000', 'admin', 0, '2024-08-27 21:20:39.000000', 'admin', 200000.00, 1, 200000.00, 4, 5),
(5, '2024-08-27 21:20:39.000000', 'admin', 0, '2024-08-27 21:20:39.000000', 'admin', 199999.00, 1, 199999.00, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) NOT NULL,
  `created_date_time` datetime(6) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `modified_date_time` datetime(6) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `price` decimal(38,2) DEFAULT NULL,
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sale_price` decimal(38,2) DEFAULT NULL,
  `thumbnail` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `created_date_time`, `created_by`, `status`, `modified_date_time`, `updated_by`, `amount`, `description`, `price`, `product_name`, `sale_price`, `thumbnail`, `category_id`) VALUES
(1, '2024-08-22 21:29:56.000000', NULL, 1, '2024-08-22 21:29:56.000000', NULL, 12, NULL, 100000.00, 'Áo phông cổ tròn basic than AP246', 200000.00, 'https://cdn0199.cdn4s.com/media/o%20ph%C3%B4ng%20c%E1%BB%99c%20tay/275270794_508218257533241_3115723458973560039_n.jpg', 1),
(2, '2024-08-22 21:30:29.000000', NULL, 1, '2024-08-22 21:30:29.000000', NULL, 9, NULL, 199999.00, 'ÁO PHÔNG BASIC ENTRY BOOLAAB ', 200000.00, 'https://cdn.boo.vn/media/catalog/product/1/_/1.2.02.3.18.002.123.23-10200011-bst-1.jpg', 1),
(3, '2024-08-22 21:35:05.000000', NULL, 1, '2024-08-22 21:35:05.000000', NULL, 9, NULL, 50000.00, 'Quần đùi Nam Nữ Essential Active Short - Xanh', 100000.00, 'https://bizweb.dktcdn.net/100/442/002/products/875f5727-3c22-45bf-828d-8f4a3e1cb102.jpg?v=1648046272613', 2),
(4, '2024-08-22 21:49:37.000000', 'superadmin@gmail.com', 1, '2024-08-22 21:49:37.000000', 'superadmin@gmail.com', 20, NULL, 200000.00, 'Quần Bò - Iggy - Loose Fit - Xanh Rách ', 300000.00, 'https://pos.nvncdn.com/778773-105877/ps/20240422_Osg41BlMCs.jpeg', 3),
(5, '2024-08-22 21:49:37.000000', 'superadmin@gmail.com', 1, '2024-08-22 21:49:37.000000', 'superadmin@gmail.com', 20, NULL, 200000.00, 'Quần Bò - Iggy - Loose Fit - Xanh Rách ', 300000.00, 'https://pos.nvncdn.com/778773-105877/ps/20240422_Osg41BlMCs.jpeg', 3),
(6, '2024-08-22 21:35:05.000000', NULL, 1, '2024-08-22 21:35:05.000000', NULL, 9, NULL, 50000.00, 'Quần đùi Nam Nữ Essential Active Short - Xanh', 100000.00, 'https://bizweb.dktcdn.net/100/442/002/products/875f5727-3c22-45bf-828d-8f4a3e1cb102.jpg?v=1648046272613', 2);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) NOT NULL,
  `created_date_time` datetime(6) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `modified_date_time` datetime(6) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `created_date_time`, `created_by`, `status`, `modified_date_time`, `updated_by`, `description`, `image_id`, `product_id`) VALUES
(1, '2024-08-22 21:30:38.000000', NULL, 1, '2024-08-22 21:30:38.000000', NULL, '', 3, 2),
(2, '2024-08-22 21:49:51.000000', 'superadmin@gmail.com', 1, '2024-08-22 21:49:51.000000', 'superadmin@gmail.com', '', 6, 4);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL,
  `created_date_time` datetime(6) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `modified_date_time` datetime(6) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `created_date_time`, `created_by`, `status`, `modified_date_time`, `updated_by`, `name`) VALUES
(1, NULL, NULL, 1, NULL, NULL, 'SUPER_ADMIN'),
(2, NULL, NULL, 1, NULL, NULL, 'ADMIN'),
(3, NULL, NULL, 1, NULL, NULL, 'CLIENT');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `created_date_time` datetime(6) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `modified_date_time` datetime(6) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(1000) NOT NULL,
  `phone_number` varchar(45) DEFAULT NULL,
  `avatar` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `created_date_time`, `created_by`, `status`, `modified_date_time`, `updated_by`, `email`, `password`, `phone_number`, `avatar`, `role_id`) VALUES
(1, NULL, NULL, 1, NULL, NULL, 'superadmin@gmail.com', '123456', NULL, NULL, 1),
(2, NULL, 'SUPER_ADMIN', 1, NULL, 'SUPER_ADMIN', 'nguyenvana@gmail.com', 'Nguyenvanan1@', '0912345678', NULL, 3),
(3, NULL, 'SUPER_ADMIN', 1, NULL, 'SUPER_ADMIN', 'ltb@gmail.com', 'Nguyenvanan1@', '0912345679', NULL, 3),
(4, '2024-08-27 15:41:09.000000', NULL, NULL, NULL, NULL, 'nva@gmai.com', '123', '0912345678', NULL, 3),
(6, '2024-08-27 16:20:10.000000', NULL, NULL, NULL, NULL, 'abc@gmail.com', '123', '090909090', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user` (`user_id`);

--
-- Indexes for table `cart_details`
--
ALTER TABLE `cart_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKhq1m50l0ke2fkqxxd6ubo3x4b` (`cart_id`),
  ADD KEY `FK9rlic3aynl3g75jvedkx84lhv` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK9presqvlsrgil0twjmwns5rcy` (`cart_id`),
  ADD UNIQUE KEY `UKeuat1oase6eqv195jvb71a93s` (`user_id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKf5464gxwc32ongdvka2rtvw96` (`address_id`),
  ADD KEY `FKpxtb8awmi0dk6smoh2vp1litg` (`customer_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKjyu2qbqt8gnvno9oe9j2s2ldk` (`order_id`),
  ADD KEY `FK4q98utpd73imf4yhttm3w0eax` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKog2rp4qthbtt2lfyhfo32lsw9` (`category_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1j9bvqvvdudsd1ydm4fr0y3bk` (`image_id`),
  ADD KEY `FKqnq71xsohugpqwf3c9gxmsuy` (`product_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKofx66keruapi6vyqpv6f2or37` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`),
  ADD UNIQUE KEY `UK4gywe1rqnip1n35rovh51od01` (`avatar`),
  ADD KEY `FKp56c1712k691lhsyewcssf40f` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cart_details`
--
ALTER TABLE `cart_details`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `cart_details`
--
ALTER TABLE `cart_details`
  ADD CONSTRAINT `FK9rlic3aynl3g75jvedkx84lhv` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FKhq1m50l0ke2fkqxxd6ubo3x4b` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`);

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `FK1y63n6caw4ic3oofwgammh3b7` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
  ADD CONSTRAINT `FKrh1g1a20omjmn6kurd35o3eit` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FKf5464gxwc32ongdvka2rtvw96` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  ADD CONSTRAINT `FKpxtb8awmi0dk6smoh2vp1litg` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `FK4q98utpd73imf4yhttm3w0eax` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FKjyu2qbqt8gnvno9oe9j2s2ldk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FKog2rp4qthbtt2lfyhfo32lsw9` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `FK1j9bvqvvdudsd1ydm4fr0y3bk` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`),
  ADD CONSTRAINT `FKqnq71xsohugpqwf3c9gxmsuy` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FKp56c1712k691lhsyewcssf40f` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `FKqj9s85bhls4d4odvynps0nxx` FOREIGN KEY (`avatar`) REFERENCES `images` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
