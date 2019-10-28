-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 28, 2019 at 01:59 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sauce chef`
--

-- --------------------------------------------------------

--
-- Table structure for table `card`
--

CREATE TABLE `card` (
  `id` int(11) NOT NULL,
  `CARD_LNAME` varchar(45) NOT NULL,
  `CARD_FNAME` varchar(45) NOT NULL,
  `CARD_NUM` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `card`
--

INSERT INTO `card` (`id`, `CARD_LNAME`, `CARD_FNAME`, `CARD_NUM`) VALUES
(1, 'Dinglasan', 'Christian', 123456789),
(2, 'Belanio', 'Joy Hazzel', 987654321),
(3, 'Bautista', 'Alliah Rose', 147258369),
(4, 'Macatangay', 'Mark Joshua', 963852741);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `CUST_LNAME` varchar(45) NOT NULL,
  `CUST_FNAME` varchar(45) NOT NULL,
  `CUST_INITIAL` varchar(45) DEFAULT NULL,
  `CUST_ADD` varchar(45) NOT NULL,
  `CUST_CITY` varchar(45) NOT NULL,
  `CUST_POSTCODE` varchar(45) NOT NULL,
  `CUST_PHONE` varchar(45) NOT NULL,
  `CUST_EMAIL` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `CUST_LNAME`, `CUST_FNAME`, `CUST_INITIAL`, `CUST_ADD`, `CUST_CITY`, `CUST_POSTCODE`, `CUST_PHONE`, `CUST_EMAIL`) VALUES
(1, 'Surname', 'First Name', NULL, 'Magallanes', 'Makati City', '1234', '+63920123456', 'email@email.com');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `EMP_ID` int(11) NOT NULL,
  `EMP_LNAME` varchar(45) NOT NULL,
  `EMP_FNAME` varchar(45) NOT NULL,
  `EMP_INITAL` varchar(45) NOT NULL,
  `EMP_ADD` varchar(45) NOT NULL,
  `EMP_EMAIL` varchar(45) NOT NULL,
  `EMP_PHONE` varchar(45) NOT NULL,
  `EMP_TYPE` varchar(45) NOT NULL,
  `ORDER_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `ORDER_ID` int(11) NOT NULL,
  `ORDER_DATE` varchar(45) NOT NULL,
  `ORDER_STATUS` varchar(45) NOT NULL,
  `CUST_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `PAYMENT_METHOD` varchar(45) NOT NULL,
  `CARD_ID` int(11) DEFAULT NULL,
  `CUSTOMER_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `PAYMENT_METHOD`, `CARD_ID`, `CUSTOMER_id`) VALUES
(3, 'cash', NULL, 1),
(4, 'card', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `card`
--
ALTER TABLE `card`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`EMP_ID`),
  ADD KEY `ORDER_ID_idx` (`ORDER_ID`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`ORDER_ID`),
  ADD KEY `CUST_ID_idx` (`CUST_ID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`,`CUSTOMER_id`),
  ADD KEY `CARD_ID_idx` (`CARD_ID`),
  ADD KEY `fk_PAYMENT_CUSTOMER1_idx` (`CUSTOMER_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `card`
--
ALTER TABLE `card`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `ORDER_ID` FOREIGN KEY (`ORDER_ID`) REFERENCES `order` (`ORDER_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `CUST_ID` FOREIGN KEY (`CUST_ID`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `CARD_ID` FOREIGN KEY (`CARD_ID`) REFERENCES `card` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_PAYMENT_CUSTOMER1` FOREIGN KEY (`CUSTOMER_id`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
