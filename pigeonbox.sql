-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 20, 2024 at 07:30 PM
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
-- Database: `pigeonbox`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Food'),
(2, 'Drink');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2024_07_20_004149_products_table', 1),
(2, '2024_07_20_011503_add_to_products_table', 2),
(3, '2024_07_20_011902_create_categories_table', 3),
(4, '2024_07_20_023708_create_payments_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`order`)),
  `type` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `order`, `type`, `price`, `created_at`) VALUES
(1, '[{\"id\":2,\"name\":\"Toastie\",\"price\":7,\"category\":\"Food\",\"created_at\":\"2024-07-20T02:29:24.000000Z\"},{\"id\":2,\"name\":\"Toastie\",\"price\":7,\"category\":\"Food\",\"created_at\":\"2024-07-20T02:29:24.000000Z\"}]', '0', 14, '2024-07-20 01:49:38'),
(2, '[{\"id\":1,\"name\":\"Latte\",\"price\":3.5,\"category\":\"Drink\",\"created_at\":null},{\"id\":1,\"name\":\"Latte\",\"price\":3.5,\"category\":\"Drink\",\"created_at\":null},{\"id\":1,\"name\":\"Latte\",\"price\":3.5,\"category\":\"Drink\",\"created_at\":null},{\"id\":1,\"name\":\"Latte\",\"price\":3.5,\"category\":\"Drink\",\"created_at\":null}]', '1', 14, '2024-07-20 01:57:32'),
(3, '[{\"id\":1,\"name\":\"Latte\",\"price\":3.5,\"category\":\"Drink\",\"created_at\":null},{\"id\":1,\"name\":\"Latte\",\"price\":3.5,\"category\":\"Drink\",\"created_at\":null},{\"id\":1,\"name\":\"Latte\",\"price\":3.5,\"category\":\"Drink\",\"created_at\":null},{\"id\":1,\"name\":\"Latte\",\"price\":3.5,\"category\":\"Drink\",\"created_at\":null}]', '1', 14, '2024-07-19 02:01:32'),
(4, '[{\"id\":2,\"name\":\"Toastie\",\"price\":7,\"category\":\"Food\",\"created_at\":\"2024-07-20T02:29:24.000000Z\"},{\"id\":2,\"name\":\"Toastie\",\"price\":7,\"category\":\"Food\",\"created_at\":\"2024-07-20T02:29:24.000000Z\"},{\"id\":1,\"name\":\"Latte\",\"price\":3.5,\"category\":\"Drink\",\"created_at\":null},{\"id\":2,\"name\":\"Toastie\",\"price\":7,\"category\":\"Food\",\"created_at\":\"2024-07-20T02:29:24.000000Z\"}]', '0', 24.5, '2024-07-20 02:15:28'),
(5, '[]', '1', 0, '2024-07-20 02:32:56'),
(6, '[{\"id\":2,\"name\":\"Toastie\",\"price\":7,\"category\":\"Food\",\"created_at\":\"2024-07-20T02:29:24.000000Z\"},{\"id\":2,\"name\":\"Toastie\",\"price\":7,\"category\":\"Food\",\"created_at\":\"2024-07-20T02:29:24.000000Z\"}]', '0', 14, '2024-07-20 02:39:19'),
(7, '[{\"id\":2,\"name\":\"Toastie\",\"price\":7,\"category\":\"Food\",\"created_at\":\"2024-07-20T02:29:24.000000Z\"},{\"id\":2,\"name\":\"Toastie\",\"price\":7,\"category\":\"Food\",\"created_at\":\"2024-07-20T02:29:24.000000Z\"}]', '0', 14, '2024-07-20 02:41:27'),
(8, '[{\"id\":2,\"name\":\"Toastie\",\"price\":7,\"category\":\"Food\",\"created_at\":\"2024-07-20T02:29:24.000000Z\"}]', '0', 7, '2024-07-20 02:42:04'),
(9, '[{\"id\":1,\"name\":\"Latte\",\"price\":3.5,\"category\":\"Drink\",\"created_at\":null}]', '0', 3.5, '2024-07-20 02:42:53'),
(10, '[{\"id\":1,\"name\":\"Latte\",\"price\":3.5,\"category\":\"Drink\",\"created_at\":null}]', '0', 3.5, '2024-07-20 02:43:00'),
(11, '[{\"id\":1,\"name\":\"Latte\",\"price\":3.5,\"category\":\"Drink\",\"created_at\":null}]', '0', 3.5, '2024-07-20 02:43:23'),
(12, '[{\"id\":1,\"name\":\"Latte\",\"price\":3.5,\"category\":\"Drink\",\"created_at\":null},{\"id\":1,\"name\":\"Latte\",\"price\":3.5,\"category\":\"Drink\",\"created_at\":null},{\"id\":1,\"name\":\"Latte\",\"price\":3.5,\"category\":\"Drink\",\"created_at\":null},{\"id\":1,\"name\":\"Latte\",\"price\":3.5,\"category\":\"Drink\",\"created_at\":null}]', '0', 14, '2024-07-20 02:44:55');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `category` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `category`, `created_at`) VALUES
(1, 'Latte', 3.5, 'Drink', NULL),
(2, 'Toastie', 7, 'Food', '2024-07-20 01:29:24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
