-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 01, 2019 at 01:54 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pizza`
--

-- --------------------------------------------------------

--
-- Table structure for table `pizza`
--

CREATE TABLE `pizza` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pizza_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pizza_price` double(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pizza`
--

INSERT INTO `pizza` (`id`, `pizza_name`, `pizza_price`) VALUES
(1, 'MacDac Pizza', 8.70),
(2, 'Lovely Mushroom Pizza', 6.45);

-- --------------------------------------------------------

--
-- Table structure for table `pizza_toppings`
--

CREATE TABLE `pizza_toppings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pizza_id` int(2) NOT NULL,
  `topping_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `topping_price` double(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pizza_toppings`
--

INSERT INTO `pizza_toppings` (`id`, `pizza_id`, `topping_name`, `topping_price`) VALUES
(1, 1, 'tomato', 0.50),
(2, 1, 'sliced mushrooms', 0.50),
(3, 1, 'feta cheese', 1.00),
(4, 1, 'sausages', 1.00),
(5, 1, 'sliced onion', 0.50),
(6, 1, 'mozzarella cheese', 0.30),
(7, 1, 'oregano', 2.00),
(8, 2, 'tomato', 0.50),
(9, 2, 'bacon', 1.00),
(10, 2, 'mozzarella cheese', 0.30),
(11, 2, 'sliced mushrooms', 0.50),
(12, 2, 'oregano', 2.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pizza`
--
ALTER TABLE `pizza`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pizza_toppings`
--
ALTER TABLE `pizza_toppings`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pizza`
--
ALTER TABLE `pizza`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pizza_toppings`
--
ALTER TABLE `pizza_toppings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
