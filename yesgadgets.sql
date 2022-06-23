-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 23, 2022 at 08:10 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yesgadgets`
--

-- --------------------------------------------------------

--
-- Table structure for table `item_order`
--

CREATE TABLE `item_order` (
  `item_order_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `item_order`
--

INSERT INTO `item_order` (`item_order_id`, `order_id`, `product_id`, `quantity`) VALUES
(1, 1, 1, 2),
(2, 1, 4, 1),
(3, 2, 1, 3),
(4, 2, 10, 1),
(5, 2, 9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `date` date DEFAULT curdate(),
  `time` time DEFAULT curtime(),
  `total_price` int(11) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'pending',
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `date`, `time`, `total_price`, `status`, `user_id`) VALUES
(1, '2022-06-22', '20:29:08', 69000, 'completed', 1),
(2, '2022-06-23', '08:54:31', 89490, 'pending', 2);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(120) NOT NULL,
  `product_brand` varchar(100) NOT NULL,
  `product_price` decimal(8,2) NOT NULL,
  `product_ram` char(5) NOT NULL,
  `product_category` varchar(50) NOT NULL,
  `product_image` varchar(100) NOT NULL,
  `product_quantity` mediumint(5) NOT NULL,
  `product_status` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_brand`, `product_price`, `product_ram`, `product_category`, `product_image`, `product_quantity`, `product_status`) VALUES
(1, 's22 ultra', 'samsung', '22500.00', '4', 'phone', 's22 ultra12gb.jpg', 7, '1'),
(2, '\r\nInfinix Hot S3 (Sandstone Black, 32 GB)  (3 GB RAM)', 'Infinix', '8999.00', '3', 'phone', 'image-2.jpeg', 10, '1'),
(3, 'tablet s8', 'Samsung', '15000.00', '4', 'Laptop', 'image-3.jpeg', 10, '1'),
(4, 'Mac S14', 'Apple', '24000.00', '3', 'laptop', 'mac14.jpg', 10, '1'),
(5, 'Lg 42 inch ', 'Lg', '47000.00', '3', 'Television', 'N01.jpg', 10, '1'),
(6, 'Redmi wrist band', 'xioami', '2500.00', '3', 'smartwatch', 'redmiwatch.jpg', 10, '1'),
(7, 'Oppo wrist watch band', 'oppo', '2500.00', '2', 'smartwatch', 'oppob.jpg', 10, '1'),
(8, 'pova a2', 'Nokia', '5999.00', '1', 'phone', 'pova2.jpg', 10, '1'),
(9, 'OPPO F5 (Black, 64 GB)  (6 GB RAM)', 'OPPO', '19990.00', '6', 'phone', 'image-9.jpeg', 10, '1'),
(10, 'harman speaker', 'speaker', '2000.00', '3', 'speaker', 'harman.jpg', 15, '1'),
(12, 'Galaxy A0', 'Galaxy', '10999.00', '3', 'Phone', 'GA0.jpg', 10, '1'),
(14, 'xioami airdots', 'xioami', '3000.00', '4', 'earpods', 'xiomiairdots.jpg', 10, '1');

-- --------------------------------------------------------

--
-- Table structure for table `shippingdetails`
--

CREATE TABLE `shippingdetails` (
  `order_id` int(11) NOT NULL,
  `shippingDetails_id` int(11) NOT NULL,
  `fullName` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `email` varchar(40) NOT NULL,
  `phoneNo` varchar(10) NOT NULL,
  `city` varchar(20) NOT NULL,
  `postalCode` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shippingdetails`
--

INSERT INTO `shippingdetails` (`order_id`, `shippingDetails_id`, `fullName`, `address`, `email`, `phoneNo`, `city`, `postalCode`) VALUES
(1, 1, 'Jane Kendi', 'Mirema House No.31', 'kendi@gmail.com', '0712323232', 'Nairobi', '10010'),
(2, 2, 'John', 'Membley', 'john@gmail.com', '0766554463', 'Nairobi', '10010');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `email_address` varchar(25) NOT NULL,
  `user_name` varchar(25) NOT NULL,
  `user_password` varchar(25) NOT NULL,
  `role` varchar(6) NOT NULL DEFAULT 'client'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`user_id`, `first_name`, `last_name`, `email_address`, `user_name`, `user_password`, `role`) VALUES
(1, 'Simon', 'Peter', 'peter@gmail.com', 'Simon', 'simon123', 'client'),
(2, 'Milly', 'Wambui', 'milly@gmail.com', 'MillWam', 'Milly123', 'admin'),
(3, 'Drexel', 'Alexis', 'alexis@gmail.com', 'Alexis', 'alexis123', 'client');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `item_order`
--
ALTER TABLE `item_order`
  ADD PRIMARY KEY (`item_order_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `shippingdetails`
--
ALTER TABLE `shippingdetails`
  ADD PRIMARY KEY (`shippingDetails_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `item_order`
--
ALTER TABLE `item_order`
  MODIFY `item_order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `shippingdetails`
--
ALTER TABLE `shippingdetails`
  MODIFY `shippingDetails_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `item_order`
--
ALTER TABLE `item_order`
  ADD CONSTRAINT `item_order_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `item_order_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`user_id`);

--
-- Constraints for table `shippingdetails`
--
ALTER TABLE `shippingdetails`
  ADD CONSTRAINT `shippingdetails_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
