-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2018 at 03:38 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `cr09_giava_ferrandina_carrental`
--
CREATE DATABASE IF NOT EXISTS `cr09_giava_ferrandina_carrental` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `cr09_giava_ferrandina_carrental`;

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `branches_id` int(11) NOT NULL,
  `branches_name` varchar(30) NOT NULL,
  `branches_address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`branches_id`, `branches_name`, `branches_address`) VALUES
(1, 'Branch No.1', 'johannesgasse,24'),
(2, 'Branch No.2', 'berggasse,41');

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `car_id` int(11) NOT NULL,
  `car_model` varchar(50) NOT NULL,
  `car_licence_plate` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`car_id`, `car_model`, `car_licence_plate`) VALUES
(1, 'Ferrari Testa Rossa', 'X124'),
(2, 'Lamborghini Diablo', 'Y894');

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `driver_id` int(11) NOT NULL,
  `driver_first_name` varchar(50) NOT NULL,
  `driver_last_name` varchar(50) NOT NULL,
  `driver_phone` varchar(30) NOT NULL,
  `driver_address` varchar(100) NOT NULL,
  `driver_birthday` date NOT NULL,
  `driver_email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`driver_id`, `driver_first_name`, `driver_last_name`, `driver_phone`, `driver_address`, `driver_birthday`, `driver_email`) VALUES
(1, 'Alex', 'Doe', '0123456', 'Stephansplats 1', '1978-02-15', 'alex.doe@test.com'),
(2, 'David', 'Robinson', '01342987', 'Brauergasse,5', '1983-11-21', 'david.robindon@test.com');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `invoice_number` int(11) DEFAULT NULL,
  `invoice_vat` int(11) DEFAULT NULL,
  `fk_pick_id` int(11) DEFAULT NULL,
  `fk_return_id` int(11) DEFAULT NULL,
  `invoice_total` float DEFAULT NULL,
  `additional_charges` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `invoice_number`, `invoice_vat`, `fk_pick_id`, `fk_return_id`, `invoice_total`, `additional_charges`) VALUES
(1, 1000, 20, 1, 1, 120, 0),
(2, 1001, 20, 2, 2, 100, 10);

-- --------------------------------------------------------

--
-- Table structure for table `pick`
--

CREATE TABLE `pick` (
  `pick_id` int(11) NOT NULL,
  `pick_date` datetime DEFAULT NULL,
  `fk_reservation_id` int(11) DEFAULT NULL,
  `pick_fuel` int(11) DEFAULT NULL,
  `pick_km` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pick`
--

INSERT INTO `pick` (`pick_id`, `pick_date`, `fk_reservation_id`, `pick_fuel`, `pick_km`) VALUES
(1, '2018-01-13 15:00:00', 1, 50, 100),
(2, '2018-01-06 11:00:00', 2, 30, 200);

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `reservation_id` int(11) NOT NULL,
  `reservation_date_start` datetime DEFAULT NULL,
  `reservation_date_end` datetime DEFAULT NULL,
  `fk_driver_id` int(11) DEFAULT NULL,
  `fk_car_id` int(11) DEFAULT NULL,
  `fk_branches_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`reservation_id`, `reservation_date_start`, `reservation_date_end`, `fk_driver_id`, `fk_car_id`, `fk_branches_id`) VALUES
(1, '2018-01-13 00:00:00', '2018-01-14 00:00:00', 1, 1, 1),
(2, '2018-01-04 00:00:00', '2018-01-06 00:00:00', 2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `return`
--

CREATE TABLE `return` (
  `return_id` int(11) NOT NULL,
  `return_date` datetime DEFAULT NULL,
  `fk_reservation_id` int(11) DEFAULT NULL,
  `return_fuel` int(11) DEFAULT NULL,
  `return_km` int(11) DEFAULT NULL,
  `fk_branches_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `return`
--

INSERT INTO `return` (`return_id`, `return_date`, `fk_reservation_id`, `return_fuel`, `return_km`, `fk_branches_id`) VALUES
(1, '2018-01-14 20:00:00', 1, 70, 200, 2),
(2, '2018-01-06 19:00:00', 2, 50, 280, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`branches_id`);

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`car_id`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`driver_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `fk_pick_id` (`fk_pick_id`),
  ADD KEY `fk_return_id` (`fk_return_id`);

--
-- Indexes for table `pick`
--
ALTER TABLE `pick`
  ADD PRIMARY KEY (`pick_id`),
  ADD KEY `fk_reservation_id` (`fk_reservation_id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `fk_driver_id` (`fk_driver_id`),
  ADD KEY `fk_car_id` (`fk_car_id`),
  ADD KEY `fk_branches_id` (`fk_branches_id`);

--
-- Indexes for table `return`
--
ALTER TABLE `return`
  ADD PRIMARY KEY (`return_id`),
  ADD KEY `fk_reservation_id` (`fk_reservation_id`),
  ADD KEY `fk_branches_id` (`fk_branches_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`fk_pick_id`) REFERENCES `pick` (`pick_id`),
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`fk_return_id`) REFERENCES `return` (`return_id`);

--
-- Constraints for table `pick`
--
ALTER TABLE `pick`
  ADD CONSTRAINT `pick_ibfk_1` FOREIGN KEY (`fk_reservation_id`) REFERENCES `reservation` (`reservation_id`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`fk_driver_id`) REFERENCES `driver` (`driver_id`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`),
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`fk_branches_id`) REFERENCES `branches` (`branches_id`);

--
-- Constraints for table `return`
--
ALTER TABLE `return`
  ADD CONSTRAINT `return_ibfk_1` FOREIGN KEY (`fk_reservation_id`) REFERENCES `reservation` (`reservation_id`),
  ADD CONSTRAINT `return_ibfk_2` FOREIGN KEY (`fk_branches_id`) REFERENCES `branches` (`branches_id`);
COMMIT;
