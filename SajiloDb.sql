-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 03, 2019 at 08:05 AM
-- Server version: 8.0.15
-- PHP Version: 7.1.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `SajiloDb`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `addClient` (IN `cname` VARCHAR(100), IN `cusername` VARCHAR(50), IN `cphone` BIGINT(50), IN `caddress` VARCHAR(100))  NO SQL
insert into tbl_clients (name,username,phone,address) select * from (SELECT cname,cusername,cphone,caddress) as tmp WHERE NOT EXISTS (select username from tbl_clients where username=cusername) limit 1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addTicket` (IN `cid` VARCHAR(50), IN `pdomain` INT(11), IN `area` INT(11), IN `service` INT(11), IN `noted_by` INT(11), IN `status` INT(11))  NO SQL
insert into tbl_com_tickets(client_id,problem_domain,area,service,noted_by,status) values ((select id from tbl_clients where username=cid),pdomain,area,service,noted_by,status)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getOpenTicket` ()  NO SQL
select tbl_clients.name as name,tbl_clients.username as username,tbl_clients.phone as phone,tbl_clients.address as address,tbl_problemdomain.problem,tbl_service.service from tbl_clients join tbl_com_tickets on tbl_clients.id = tbl_com_tickets.client_id join tbl_area on tbl_com_tickets.area = tbl_area.id join tbl_service on tbl_com_tickets.service = tbl_service.id join tbl_problemdomain on tbl_com_tickets.problem_domain=tbl_problemdomain.ID$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getTicketByArea` (IN `stat` INT(11))  NO SQL
select tbl_area.area,count(tbl_com_tickets.area) as number from tbl_area left join tbl_com_tickets on tbl_area.id = tbl_com_tickets.area where tbl_com_tickets.status = stat group by tbl_area.area$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `navmenu`
--

CREATE TABLE `navmenu` (
  `id` int(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `parent_id` int(70) DEFAULT NULL,
  `bootstrap` varchar(150) NOT NULL,
  `css` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `navmenu`
--

INSERT INTO `navmenu` (`id`, `title`, `parent_id`, `bootstrap`, `css`, `url`) VALUES
(1, 'Dashboard', NULL, 'btn btn-success', 'color:white;', '/main/index.php'),
(2, 'Inventory', NULL, 'btn btn-default', 'color:white;', '/app/chart.php'),
(3, 'Store Inventory', 2, 'btn', 'color:red;', '/app/store.php'),
(4, 'Area Inventory', 2, 'btn', 'color:blue;', '/app/areainventory.php'),
(5, 'Graph', NULL, 'btn btn-default', 'color:white;', '/main/graph.php');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_area`
--

CREATE TABLE `tbl_area` (
  `ID` int(11) NOT NULL,
  `area` varchar(30) NOT NULL,
  `area_head` varchar(30) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_area`
--

INSERT INTO `tbl_area` (`ID`, `area`, `area_head`, `status`) VALUES
(1, 'Chundevi', 'Ramesh Siwakoti', 0),
(3, 'Baluwatar', 'Suresh Parja', 0),
(6, 'Ranibari', 'Hari K.C', 0),
(7, 'Sanepa', 'Keshav Dhital', 0),
(9, 'Satdobato', 'Santosh Mandal', 0),
(11, 'Narayanthan', 'Suraj Dangol', 0),
(13, 'Anamnagar', 'Balkrishna Subedi', 0),
(15, 'Chabahil', 'Ganesh Majhi', 0),
(17, 'Jorpati', 'Khilanath ', 0),
(19, 'Soaltee', 'Salik Bedari', 0),
(21, 'Switchatar', 'Upendra Rupakheti', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_clients`
--

CREATE TABLE `tbl_clients` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `phone` bigint(50) NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_clients`
--

INSERT INTO `tbl_clients` (`id`, `name`, `username`, `phone`, `address`) VALUES
(1, 'Hariram Ale Magar', 'hariram_subisu', 9801158296, 'Mandikhatar'),
(2, 'Sandeep Shrestha', 'ssandeep', 98012334567, 'Balaju'),
(3, 'Sarita Khanal', 'skhanal', 9851002233, 'Baluwatar'),
(4, 'Sandesh Lama', 'lamas', 98511112223, 'Baneshwore'),
(5, 'Rupak Thapa', 'rt', 9801158234, 'chabahil'),
(6, 'Roshan Shrestha', 'roshans', 9800111111, 'gorkha'),
(7, 'Roshan Shrestha', 'roshans1', 9800111111, 'gorkha'),
(8, 'Dil Bahadur Magar', 'dbm', 9801234567, 'Bansbari'),
(9, 'Dil Bahadur Magar', 'dbm1', 9801234567, 'Bansbari'),
(10, 'Krishna Kumar  Gurung', 'kkg', 9810101010, 'Lamatar'),
(11, 'Sajen Maharjan', 'sajenm', 9852012318, 'Kalanki'),
(12, 'Ram Hari Neupane', 'ramhari', 9810348491, 'Gongabu'),
(13, 'Pranesh Khadka', 'pranesh', 14325683, 'Sanepa'),
(14, 'Suman Sapkota', 'sumansapkota', 9851044236, 'Satdobato'),
(15, 'Alex Magar', 'alex.magar', 9898989898, 'Nepal');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_comments`
--

CREATE TABLE `tbl_comments` (
  `id` bigint(20) NOT NULL,
  `ticket_id` bigint(20) NOT NULL,
  `comment` text NOT NULL,
  `comment_by` int(11) NOT NULL,
  `comment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_comments`
--

INSERT INTO `tbl_comments` (`id`, `ticket_id`, `comment`, `comment_by`) VALUES
(1, 1, 'Area Problem and technician are working..', 1),
(2, 1, 'Technician has given time for tomorrow as still pole shifting tasking is on going.', 1),
(3, 2, 'Earlier there was problem in whole area but area problem been resolved now. And further technician are working for this customer.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_complains`
--

CREATE TABLE `tbl_complains` (
  `ID` bigint(20) NOT NULL,
  `RegDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `contact` bigint(30) NOT NULL,
  `address` varchar(50) NOT NULL,
  `area` varchar(20) NOT NULL,
  `problem` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Service` varchar(20) NOT NULL,
  `Status` varchar(6) NOT NULL,
  `Remarks` varchar(256) NOT NULL,
  `NotedBy` int(3) DEFAULT NULL,
  `DoneBy` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_complains`
--

INSERT INTO `tbl_complains` (`ID`, `Name`, `username`, `contact`, `address`, `area`, `problem`, `Service`, `Status`, `Remarks`, `NotedBy`, `DoneBy`) VALUES
(1, 'Hariram Ale Magar', 'hariram_subisu', 9801158296, 'Mandikhatar', '3', 'Cable Blink', 'Cable Modem', 'Open', 'This is test complain..', 1, 'Forwarded'),
(2, 'Sabita Maharjan', 'sabita.maharjan', 98000000000, 'Samakhusho', '9', 'Cable Blink', 'Cable Modem', 'Open', 'This is test complain..', 1, 'Forwarded'),
(3, 'Shyam Krishna Thapa', 'shyamkt', 98000000000, 'Satdobato', 'Satdobato', 'Internet not working', 'Clear TV', 'Open', 'Test complain.', 1, 'Forwarded'),
(4, 'Shyam Krishna Thapa', 'shyamkt', 98000000000, 'Satdobato', 'Satdobato', 'Internet not working', 'Clear TV', 'Open', 'Test complain.', 1, 'Forwarded'),
(5, 'Bishal Mahat', 'bishal.mahat', 98000000000, 'Baluwatar', 'Baluwatar', 'Cable Blink', 'Cable Modem', 'Open', 'Test complains.', 1, 'Forwarded'),
(6, 'Bishal Mahat', 'bishal.mahat', 98000000000, 'Baluwatar', 'Baluwatar', 'Cable Blink', 'Cable Modem', 'Open', 'Test complains.', 1, 'Forwarded'),
(7, 'Narayan Shrestha', 'snarayan', 9801158296, 'Gongabu', 'Chundevi', 'Cable Blink', 'FTTH', 'Open', 'TEst remarks', 1, 'Forwarded'),
(8, 'Narayan Shrestha', 'snarayan', 9801158296, 'Gongabu', 'Gongabu', 'Cable Blink', 'FTTH', 'Open', 'TEst remarks', 1, 'Forwarded'),
(9, 'Muna Thapa', 'munat', 9800000000, 'Sanepa', 'Sanepa', 'Wire Manage', 'FTTH', 'Open', 'test remarks', 1, 'Forwarded'),
(10, 'Muna Thapa', 'munat', 9800000000, 'Sanepa', 'Sanepa', 'Wire Manage', 'FTTH', 'Open', 'test remarks', 1, 'Forwarded'),
(11, 'Mohan Lama', 'mohan.lama', 9800000000, 'Baniyatare', 'Gongabu', 'Fiber Break', 'FTTH', 'Open', 'Test complains', 1, 'Forwarded'),
(12, 'Mohan Lama', 'mohan.lama', 9800000000, 'Baniyatare', 'Gongabu', 'Fiber Break', 'FTTH', 'Open', 'Test complains', 1, 'Forwarded'),
(13, 'Sandesh Gurung', 'gurung.sandesh', 988979898, 'Dhumbarahi', 'Chundevi', 'Cable Blink', 'Cable Modem', 'Open', 'Test Complain', 1, 'Forwarded'),
(14, 'Sandesh Gurung', 'gurung.sandesh', 988979898, 'Dhumbarahi', 'Chundevi', 'Cable Blink', 'Cable Modem', 'Open', 'Test Complain', 1, 'Forwarded'),
(15, 'Resham Lama', 'reshaml', 9812345678, 'Pulchowk', '2', '6', '3', '1', 'This is complain registered from stred procudered', NULL, NULL),
(16, 'Gopal Neupane', 'ngopal', 9802324543, 'Pokhara', '4', '1', '6', '2', 'sdfjsldfjl', 1, NULL),
(17, 'Alex Magar', 'alex.magar', 9898989898, 'Ranibari', '1', '1', '5', '3', 'Complain has been forwarded..', 1, NULL),
(18, 'Alex Magar', 'alex.magar', 9898989898, 'Ranibari', '1', '1', '5', '3', 'Complain has been forwarded..', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_com_tickets`
--

CREATE TABLE `tbl_com_tickets` (
  `id` bigint(20) NOT NULL,
  `client_id` bigint(20) NOT NULL,
  `problem_domain` int(11) NOT NULL,
  `area` int(11) NOT NULL,
  `service` int(11) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `noted_by` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `technician` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `done_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `duration` decimal(10,0) DEFAULT NULL,
  `close_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_com_tickets`
--

INSERT INTO `tbl_com_tickets` (`id`, `client_id`, `problem_domain`, `area`, `service`, `noted_by`, `status`, `technician`, `done_by`, `duration`, `close_date`) VALUES
(1, 1, 11, 1, 1, 1, 1, NULL, NULL, NULL, NULL),
(2, 2, 8, 6, 3, 2, 1, 'Suman', NULL, NULL, NULL),
(3, 3, 8, 3, 2, 1, 1, 'Dipendra', NULL, NULL, NULL),
(4, 4, 9, 6, 2, 2, 1, NULL, NULL, NULL, NULL),
(5, 2, 10, 1, 1, 1, 1, 'Birendra', NULL, NULL, NULL),
(7, 1, 1, 1, 1, 2, 1, NULL, NULL, NULL, NULL),
(8, 10, 12, 19, 3, 1, 1, NULL, NULL, NULL, NULL),
(9, 8, 4, 15, 2, 1, 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 15, 3, 1, 1, NULL, NULL, NULL, NULL),
(11, 10, 8, 21, 1, 1, 1, NULL, NULL, NULL, NULL),
(12, 11, 3, 21, 1, 1, 1, NULL, NULL, NULL, NULL),
(13, 12, 9, 6, 1, 1, 1, NULL, NULL, NULL, NULL),
(14, 13, 3, 7, 2, 1, 1, NULL, NULL, NULL, NULL),
(15, 14, 3, 9, 2, 1, 1, NULL, NULL, NULL, NULL),
(16, 14, 3, 9, 2, 1, 1, NULL, NULL, NULL, NULL),
(17, 14, 3, 9, 2, 1, 1, NULL, NULL, NULL, NULL),
(18, 14, 3, 9, 2, 1, 1, NULL, NULL, NULL, NULL),
(19, 13, 4, 1, 1, 1, 1, NULL, NULL, NULL, NULL),
(20, 1, 3, 3, 2, 1, 1, NULL, NULL, NULL, NULL),
(21, 15, 1, 13, 1, 1, 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_department`
--

CREATE TABLE `tbl_department` (
  `id` int(11) NOT NULL,
  `dep_name` varchar(100) NOT NULL,
  `hod` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_department`
--

INSERT INTO `tbl_department` (`id`, `dep_name`, `hod`, `type`) VALUES
(1, 'System', 'Sailesh Shrestha', 'Technical'),
(2, 'support', 'Abc', 'Technical');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login`
--

CREATE TABLE `tbl_login` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `department` int(11) NOT NULL,
  `permission` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_login`
--

INSERT INTO `tbl_login` (`id`, `first_name`, `last_name`, `username`, `password`, `department`, `permission`, `status`) VALUES
(1, 'Hariram', 'Ale Magar', 'ahariram', '12345678', 1, 15, 1),
(2, 'Admin', 'admin', 'admin', '12345678', 2, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_problemdomain`
--

CREATE TABLE `tbl_problemdomain` (
  `ID` int(11) NOT NULL,
  `problem` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_problemdomain`
--

INSERT INTO `tbl_problemdomain` (`ID`, `problem`) VALUES
(1, 'Cable Blink'),
(3, 'Clear TV Problem'),
(4, 'Clear TV Scratch'),
(5, 'Clear TV Low Signal Quality'),
(6, 'Location Shift'),
(7, 'Wire Manage'),
(8, 'Packet Loss'),
(9, 'Channel Missing'),
(10, 'Roll Back'),
(11, 'Frequent Disconnection'),
(12, 'Fiber Break'),
(13, 'Re-Connection');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_service`
--

CREATE TABLE `tbl_service` (
  `id` int(11) NOT NULL,
  `service` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_service`
--

INSERT INTO `tbl_service` (`id`, `service`) VALUES
(1, 'Cable Modem'),
(2, 'Clear TV'),
(3, 'FTTH');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_status`
--

CREATE TABLE `tbl_status` (
  `id` int(11) NOT NULL,
  `status` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_status`
--

INSERT INTO `tbl_status` (`id`, `status`) VALUES
(1, 'open'),
(2, 'pending'),
(3, 'close');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `navmenu`
--
ALTER TABLE `navmenu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_area`
--
ALTER TABLE `tbl_area`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbl_clients`
--
ALTER TABLE `tbl_clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `tbl_comments`
--
ALTER TABLE `tbl_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_id` (`ticket_id`),
  ADD KEY `comment_by` (`comment_by`);

--
-- Indexes for table `tbl_complains`
--
ALTER TABLE `tbl_complains`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbl_com_tickets`
--
ALTER TABLE `tbl_com_tickets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `area` (`area`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `noted_by` (`noted_by`),
  ADD KEY `status` (`status`),
  ADD KEY `problem_domain` (`problem_domain`),
  ADD KEY `service` (`service`);

--
-- Indexes for table `tbl_department`
--
ALTER TABLE `tbl_department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_problemdomain`
--
ALTER TABLE `tbl_problemdomain`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbl_service`
--
ALTER TABLE `tbl_service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_status`
--
ALTER TABLE `tbl_status`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_area`
--
ALTER TABLE `tbl_area`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tbl_clients`
--
ALTER TABLE `tbl_clients`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_comments`
--
ALTER TABLE `tbl_comments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_complains`
--
ALTER TABLE `tbl_complains`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tbl_com_tickets`
--
ALTER TABLE `tbl_com_tickets`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tbl_department`
--
ALTER TABLE `tbl_department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_login`
--
ALTER TABLE `tbl_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_problemdomain`
--
ALTER TABLE `tbl_problemdomain`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbl_service`
--
ALTER TABLE `tbl_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_status`
--
ALTER TABLE `tbl_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_comments`
--
ALTER TABLE `tbl_comments`
  ADD CONSTRAINT `tbl_comments_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tbl_com_tickets` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tbl_comments_ibfk_2` FOREIGN KEY (`comment_by`) REFERENCES `tbl_login` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `tbl_com_tickets`
--
ALTER TABLE `tbl_com_tickets`
  ADD CONSTRAINT `tbl_com_tickets_ibfk_1` FOREIGN KEY (`area`) REFERENCES `tbl_area` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tbl_com_tickets_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `tbl_clients` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tbl_com_tickets_ibfk_3` FOREIGN KEY (`noted_by`) REFERENCES `tbl_login` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tbl_com_tickets_ibfk_4` FOREIGN KEY (`status`) REFERENCES `tbl_status` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tbl_com_tickets_ibfk_5` FOREIGN KEY (`problem_domain`) REFERENCES `tbl_problemdomain` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tbl_com_tickets_ibfk_6` FOREIGN KEY (`service`) REFERENCES `tbl_service` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
