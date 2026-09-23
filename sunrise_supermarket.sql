-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 23, 2026 at 01:47 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sunrise_supermarket`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `email`, `city`) VALUES
(1, 'Abayo Benie', 'benie@gmail.com', 'Remera'),
(2, 'Norah Jones', 'jones@gmail.com', 'Rebero'),
(3, 'Uwase Louange', 'louange@gmail.com', 'Remera'),
(4, 'Sheja Frank', 'frank@gmail.com', 'Kimironko'),
(5, 'Rwego pitie', 'pitie@gmail.com', 'Busanza');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `order_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `order_date`) VALUES
(1, 1, '2026-09-01'),
(2, 2, '2026-09-02'),
(3, 1, '2026-09-05'),
(4, 3, '2026-09-06'),
(5, 4, '2026-09-07'),
(6, 2, '2026-09-10'),
(7, 1, '2026-09-12'),
(8, 3, '2026-09-14'),
(9, 4, '2026-09-15'),
(10, 2, '2026-09-16'),
(11, 1, '2026-09-17'),
(12, 3, '2026-09-18'),
(13, 4, '2026-09-19'),
(14, 2, '2026-09-20'),
(15, 1, '2026-09-21');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `product_id`, `quantity`) VALUES
(1, 1, 101, 2),
(2, 1, 103, 1),
(3, 2, 104, 1),
(4, 2, 105, 2),
(5, 3, 102, 3),
(6, 3, 107, 2),
(7, 4, 106, 5),
(8, 4, 108, 2),
(9, 5, 104, 2),
(10, 6, 101, 4),
(11, 7, 105, 3),
(12, 7, 102, 1),
(13, 8, 103, 2),
(14, 8, 108, 1),
(15, 9, 104, 1),
(16, 9, 107, 3),
(17, 10, 106, 10),
(18, 11, 101, 1),
(19, 11, 102, 2),
(20, 12, 105, 4),
(21, 13, 108, 3),
(22, 14, 103, 5),
(23, 14, 104, 1),
(24, 15, 101, 2),
(25, 15, 107, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `category`, `price`) VALUES
(101, 'Fresh Milk 1L', 'Dairy', 1.50),
(102, 'Cheddar Cheese 250g', 'Dairy', 3.20),
(103, 'White Bread', 'Bakery', 1.00),
(104, 'Chocolate Cake', 'Bakery', 12.00),
(105, 'Apple Juice 1L', 'Beverages', 2.50),
(106, 'Mineral Water 500ml', 'Beverages', 0.80),
(107, 'Greek Yogurt 500g', 'Dairy', 2.80),
(108, 'Croissant Pack', 'Bakery', 4.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
