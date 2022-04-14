-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 26, 2021 at 12:17 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `buyma_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `username`, `password`, `email`) VALUES
(1, 'test', 'test', 'test@test.com'),
(2, 'codemode', 'parsa500', 'spacenavard1@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `coinnews`
--

CREATE TABLE `coinnews` (
  `id` int(150) NOT NULL,
  `a_id` int(150) DEFAULT NULL,
  `title` text DEFAULT NULL,
  `coinName` varchar(150) DEFAULT NULL,
  `marketcap` int(200) DEFAULT NULL,
  `importance` int(50) DEFAULT NULL,
  `proof_add` int(50) DEFAULT NULL,
  `pic_proof` varchar(150) DEFAULT NULL,
  `coin_pic` varchar(150) DEFAULT NULL,
  `tex1` text DEFAULT NULL,
  `text2` text DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_event` datetime DEFAULT NULL,
  `id_pic_proof` int(11) DEFAULT NULL,
  `id_coin_pic` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `coinnews`
--

INSERT INTO `coinnews` (`id`, `a_id`, `title`, `coinName`, `marketcap`, `importance`, `proof_add`, `pic_proof`, `coin_pic`, `tex1`, `text2`, `date`, `date_event`, `id_pic_proof`, `id_coin_pic`) VALUES
(1, 1, 'بیت کوین', 'BitCoin', 200000, 0, NULL, NULL, NULL, 'انفجار بیت کوین به صد هزار دلار ', NULL, '2021-08-10 12:48:12', NULL, NULL, NULL),
(2, 1, 'بیت کوین', 'BitCoin', NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-08-10 12:52:52', NULL, NULL, NULL),
(5, NULL, 'کاردانو', 'ADA', 200000, 0, NULL, NULL, NULL, 'کاردانو سقف های جدیدی میزند .', NULL, '2021-08-10 12:49:41', NULL, NULL, NULL),
(6, NULL, 'کاردانو', 'ADA', 200000, 0, NULL, NULL, NULL, 'کاردانو سقف های جدیدی میزند .', NULL, '2021-08-12 06:04:29', NULL, NULL, NULL),
(7, NULL, 'xrp', 'xrp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-25 20:49:17', '2021-08-25 22:48:16', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `loginadmin`
--

CREATE TABLE `loginadmin` (
  `id` int(50) NOT NULL,
  `fullname` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(150) NOT NULL,
  `name` varchar(140) NOT NULL,
  `password` varchar(200) NOT NULL,
  `user_type_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `name`, `password`, `user_type_id`) VALUES
(4, 'spacenavard1@gmail.com', 'parsa bakhtiari', '[object Promise]', 1),
(6, 'test', 'parsa bakhtiari', '$2b$10$0/0BF9aZMWvf4jvNFEtSYuJBhVx2NK9C5o/A7YjzlOXH6Th.md6/O', 2),
(7, 'test2', 'parsa bakhtiari', '$2b$10$gkIxi7Gv9GW5E1Ut2/d46ueKy31kj2inIvAObbKTKENer9Z2AnWEG', 2),
(8, 'test3', 'parsa bakhtiari', '$2b$10$yaCyukdAJsc.Mk5lVMx1/eIlSWhon95XGBDltFmkbrC1YsYYe2pJG', 2),
(9, 'codemode', 'parsa bakhtiari', '$2b$10$HeCI6gbSObhh9UOmo8tulunyJEgd1LUL07iWT10biDV.lmsS27IfK', 1),
(10, 'mahmood', 'mahmood bakhtiari', '$2b$10$FKYjLfS3CjWwFMWebWDWzu26qir0rzDwcFqgapNYvIDXIUG3pRth2', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coinnews`
--
ALTER TABLE `coinnews`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `coinnews` ADD FULLTEXT KEY `title` (`title`,`coinName`);

--
-- Indexes for table `loginadmin`
--
ALTER TABLE `loginadmin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `coinnews`
--
ALTER TABLE `coinnews`
  MODIFY `id` int(150) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `loginadmin`
--
ALTER TABLE `loginadmin`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
