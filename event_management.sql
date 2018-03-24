-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 24, 2018 at 01:28 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `event_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `buyer_info`
--

CREATE TABLE `buyer_info` (
  `b_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `mail` varchar(60) NOT NULL,
  `mobile` bigint(10) NOT NULL,
  `city` varchar(20) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `dob` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `acc_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buyer_info`
--

INSERT INTO `buyer_info` (`b_id`, `name`, `mail`, `mobile`, `city`, `gender`, `dob`, `password`, `acc_created`) VALUES
(1, 'aashay', 'a@gmail.com', 9999999999, 'pune', '0', '1998-02-02', '1234', '2017-11-03 15:24:23'),
(2, 'divyansh', 'd@gmail.com', 9899188052, 'aldea', '0', '6 November, 2017', '1234', '2017-11-03 21:11:17');

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `e_id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `venue` varchar(100) NOT NULL,
  `start_date` varchar(50) NOT NULL,
  `start_time` varchar(50) NOT NULL,
  `close_date` varchar(50) NOT NULL,
  `close_time` varchar(50) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `l_id` int(11) NOT NULL,
  `seats` int(11) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `description` varchar(200) NOT NULL,
  `org_id` int(11) NOT NULL,
  `e_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`e_id`, `name`, `venue`, `start_date`, `start_time`, `close_date`, `close_time`, `cat_id`, `l_id`, `seats`, `price`, `status`, `description`, `org_id`, `e_timestamp`) VALUES
(1, 'jds', 'skjb', '29 October, 2017', '20:17', '31 October, 2017', '20:17', 3, 1, 111, '11.00', 0, 'kjsb', 1, '2017-10-29 14:48:13'),
(3, 'techronoz', 'SIT', '4 November, 2017', '11:27', '12 December, 2018', '07:28', 2, 2, 80, '200.00', 0, 'Technical event', 1, '2017-11-04 05:58:50'),
(4, 'Techela', 'SIT', '7 November, 2017', '11:29', '5 November, 2017', '07:30', 5, 3, 500, '2000.00', 0, 'CS IT techfest', 1, '2017-11-04 06:00:07'),
(5, 'Sunburn', 'Baner,Pune', '6 November, 2017', '11:30', '15 November, 2017', '05:30', 5, 1, 500, '3000.00', 0, 'Electronic Music', 1, '2017-11-04 06:01:45'),
(8, 'Techela', 'SIT', '7 November, 2017', '11:29', '5 November, 2017', '07:30', 5, 3, 500, '2000.00', 0, 'CS IT techfest', 1, '2017-11-04 06:07:51'),
(9, 'Capture the flag', 'akGNksNGk', '8 November, 2017', '09:25', '14 November, 2017', '17:27', 5, 2, 20, '500.00', 0, 'Cyber Security', 1, '2017-11-09 05:58:05');

-- --------------------------------------------------------

--
-- Table structure for table `event_category`
--

CREATE TABLE `event_category` (
  `cat_id` int(11) NOT NULL,
  `c_name` varchar(20) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event_category`
--

INSERT INTO `event_category` (`cat_id`, `c_name`, `creation_date`) VALUES
(1, 'Education & Learning', '2017-09-04 10:53:27'),
(2, 'Tech', '2017-09-04 10:53:30'),
(3, 'Sports & Fitness', '2017-09-04 10:53:34'),
(4, 'Networking', '2017-09-04 10:53:37'),
(5, 'Entertainment', '2017-09-04 10:53:44'),
(6, 'Travel & Adventure', '2017-09-04 10:53:51');

-- --------------------------------------------------------

--
-- Table structure for table `event_feedback`
--

CREATE TABLE `event_feedback` (
  `f_id` int(11) NOT NULL,
  `b_id` int(11) NOT NULL,
  `e_id` int(11) NOT NULL,
  `stars` int(1) NOT NULL,
  `f_text` mediumtext NOT NULL,
  `posted_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `l_id` int(11) NOT NULL,
  `city` varchar(40) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`l_id`, `city`, `status`, `added_on`) VALUES
(1, 'Pune', 0, '2017-09-12 15:47:00'),
(2, 'Hyderabad', 0, '2017-09-12 15:47:52'),
(3, 'Mumbai', 0, '2017-09-12 15:48:06');

-- --------------------------------------------------------

--
-- Table structure for table `organiser_info`
--

CREATE TABLE `organiser_info` (
  `org_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `mail` varchar(60) NOT NULL,
  `mobile` bigint(10) NOT NULL,
  `gender` int(1) NOT NULL,
  `city` varchar(20) NOT NULL,
  `password` varchar(30) NOT NULL,
  `dob` varchar(200) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `organiser_info`
--

INSERT INTO `organiser_info` (`org_id`, `name`, `mail`, `mobile`, `gender`, `city`, `password`, `dob`, `status`, `reg_date`) VALUES
(1, 'aashay', 'aashayoo9@gmail.com', 9630552301, 0, 'indore', '1234', '1998-02-02', 1, '2017-10-29 12:13:33'),
(2, 'divyansh', 'div@r.com', 1234, 0, 'delhi', '1234', '1111-02-02', 1, '2017-09-15 16:09:56'),
(4, 'abc', 'abc@gmail.com', 12345, 0, 'ajvx', '1234', '2 November, 2017', 1, '2017-11-02 12:12:50'),
(6, 'Aashay jajoo', 'aashay.jajoo@sitpune.edu.in', 9630552305, 0, 'pune', '0000', '9 February, 2017', 1, '2017-11-03 17:35:23'),
(7, 'Lucifer', 'lucifer@gmail.com', 9595322353, 0, 'Baner, Pune', '1234', '9 November, 1999', 1, '2017-11-04 06:10:25');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `t_id` int(11) NOT NULL,
  `e_id` int(11) NOT NULL,
  `b_id` int(11) NOT NULL,
  `seats_booked` int(2) NOT NULL,
  `booking_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`t_id`, `e_id`, `b_id`, `seats_booked`, `booking_time`) VALUES
(1, 1, 1, 5, '2017-11-03 16:42:21'),
(3, 1, 1, 1, '2017-11-03 20:57:44'),
(4, 1, 1, 12, '2017-11-03 20:58:07'),
(5, 1, 2, 2, '2017-11-03 21:18:41'),
(6, 2, 2, 12, '2017-11-03 21:19:02'),
(7, 2, 1, 2, '2017-11-04 04:24:39'),
(8, 1, 1, 3, '2017-11-04 06:26:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buyer_info`
--
ALTER TABLE `buyer_info`
  ADD PRIMARY KEY (`b_id`),
  ADD UNIQUE KEY `mail` (`mail`),
  ADD UNIQUE KEY `mobile` (`mobile`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`e_id`),
  ADD KEY `cat_id` (`cat_id`),
  ADD KEY `org_id` (`org_id`),
  ADD KEY `l_id` (`l_id`);

--
-- Indexes for table `event_category`
--
ALTER TABLE `event_category`
  ADD PRIMARY KEY (`cat_id`),
  ADD UNIQUE KEY `c_name` (`c_name`);

--
-- Indexes for table `event_feedback`
--
ALTER TABLE `event_feedback`
  ADD PRIMARY KEY (`f_id`),
  ADD KEY `buyer_id` (`b_id`),
  ADD KEY `event_id` (`e_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`l_id`);

--
-- Indexes for table `organiser_info`
--
ALTER TABLE `organiser_info`
  ADD PRIMARY KEY (`org_id`),
  ADD UNIQUE KEY `mail` (`mail`),
  ADD UNIQUE KEY `mobile` (`mobile`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`t_id`),
  ADD KEY `event_id` (`e_id`),
  ADD KEY `buyer_id` (`b_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buyer_info`
--
ALTER TABLE `buyer_info`
  MODIFY `b_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `e_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `event_category`
--
ALTER TABLE `event_category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `event_feedback`
--
ALTER TABLE `event_feedback`
  MODIFY `f_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `l_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `organiser_info`
--
ALTER TABLE `organiser_info`
  MODIFY `org_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `event_category` (`cat_id`),
  ADD CONSTRAINT `event_ibfk_2` FOREIGN KEY (`org_id`) REFERENCES `organiser_info` (`org_id`),
  ADD CONSTRAINT `event_ibfk_3` FOREIGN KEY (`l_id`) REFERENCES `location` (`l_id`);

--
-- Constraints for table `event_feedback`
--
ALTER TABLE `event_feedback`
  ADD CONSTRAINT `event_feedback_ibfk_1` FOREIGN KEY (`b_id`) REFERENCES `buyer_info` (`b_id`);

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`b_id`) REFERENCES `buyer_info` (`b_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
