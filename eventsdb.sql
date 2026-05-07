-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 18, 2026 at 02:19 AM
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
-- Database: `eventsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `contribution_statements`
--

CREATE TABLE `contribution_statements` (
  `id` int(11) NOT NULL,
  `statement` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contribution_statements`
--

INSERT INTO `contribution_statements` (`id`, `statement`) VALUES
(1, 'Special recognition for their contribution as $contribution.'),
(2, 'We sincerely appreciate their outstanding contribution as $contribution.'),
(3, 'This certificate acknowledges their valuable role in $contribution.'),
(4, 'Heartfelt appreciation for their dedication towards $contribution.'),
(5, 'In recognition of their remarkable efforts in $contribution.'),
(6, 'Acknowledging their unwavering commitment to $contribution.'),
(7, 'This certificate is presented for their excellence in $contribution.'),
(8, 'We proudly honor their achievements in $contribution.'),
(9, 'Grateful recognition for their selfless contribution in $contribution.'),
(10, 'With gratitude for their meaningful participation in $contribution.'),
(11, 'Special thanks for their active involvement in $contribution.'),
(12, 'We honor their consistent efforts towards $contribution.'),
(13, 'Appreciation for their outstanding support in $contribution.'),
(14, 'Recognizing their valuable guidance in $contribution.'),
(15, 'Presented in honor of their role in $contribution.'),
(16, 'This acknowledges their dedicated service in $contribution.'),
(17, 'Respectful appreciation for their commitment in $contribution.'),
(18, 'With recognition of their innovative work in $contribution.'),
(19, 'Commending their significant efforts in $contribution.'),
(20, 'We celebrate their contribution in $contribution.'),
(21, 'Acknowledged with thanks for their efforts in $contribution.'),
(22, 'Their perseverance in $contribution is highly appreciated.'),
(23, 'Sincere appreciation for their teamwork in $contribution.'),
(24, 'In acknowledgment of their continuous support in $contribution.'),
(25, 'We value their excellence in $contribution.'),
(26, 'With recognition of their role in $contribution.'),
(27, 'Proudly presented for their dedication in $contribution.'),
(28, 'Honoring their tireless efforts in $contribution.'),
(29, 'We recognize their creativity in $contribution.'),
(30, 'With sincere thanks for their energy in $contribution.'),
(31, 'Recognition for their positive impact in $contribution.'),
(32, 'Their passion in $contribution is commendable.'),
(33, 'Appreciation for their contribution to $contribution.'),
(34, 'We express gratitude for their initiative in $contribution.'),
(35, 'Acknowledgment for their unique ideas in $contribution.'),
(36, 'Presented for their inspiring role in $contribution.'),
(37, 'Honoring their great support in $contribution.'),
(38, 'With heartfelt appreciation for their part in $contribution.'),
(39, 'Their leadership in $contribution is recognized.'),
(40, 'Sincere thanks for their role in $contribution.'),
(41, 'Acknowledged for their hard work in $contribution.'),
(42, 'Presented in recognition of their excellence in $contribution.'),
(43, 'Grateful acknowledgment for their commitment in $contribution.'),
(44, 'With thanks for their dedication in $contribution.'),
(45, 'Recognizing their positive role in $contribution.'),
(46, 'This award highlights their contribution in $contribution.'),
(47, 'Presented as a token of appreciation for $contribution.'),
(48, 'Sincere gratitude for their valuable input in $contribution.'),
(49, 'Appreciating their selfless dedication in $contribution.'),
(50, 'This recognition is for their contribution in $contribution.'),
(51, 'Their invaluable efforts in $contribution are honored.'),
(52, 'Awarded for their active participation in $contribution.'),
(53, 'Presented with thanks for their assistance in $contribution.'),
(54, 'With great respect for their role in $contribution.'),
(55, 'Acknowledging their creativity and effort in $contribution.'),
(56, 'Commended for their contribution in $contribution.'),
(57, 'We gratefully recognize their perseverance in $contribution.'),
(58, 'This certificate appreciates their hard work in $contribution.'),
(59, 'Their dedication in $contribution is praiseworthy.'),
(60, 'We sincerely value their input in $contribution.'),
(61, 'Acknowledged for excellence in $contribution.'),
(62, 'Grateful for their determination in $contribution.'),
(63, 'Presented to recognize their initiative in $contribution.'),
(64, 'Their outstanding efforts in $contribution are recognized.'),
(65, 'With pride we acknowledge their role in $contribution.'),
(66, 'Presented with respect for their contribution in $contribution.'),
(67, 'This highlights their achievements in $contribution.'),
(68, 'We appreciate their consistent efforts in $contribution.'),
(69, 'In recognition of their support in $contribution.'),
(70, 'With sincere gratitude for their dedication to $contribution.'),
(71, 'Commending their involvement in $contribution.'),
(72, 'Presented to honor their participation in $contribution.'),
(73, 'This certificate appreciates their innovation in $contribution.'),
(74, 'Grateful recognition for their enthusiasm in $contribution.'),
(75, 'Acknowledged with pride for their performance in $contribution.'),
(76, 'This honors their initiative in $contribution.'),
(77, 'Recognizing their meaningful involvement in $contribution.'),
(78, 'Sincere recognition for their excellence in $contribution.'),
(79, 'With gratitude for their valuable service in $contribution.'),
(80, 'Acknowledging their responsibility in $contribution.'),
(81, 'We recognize their dedication in $contribution.'),
(82, 'Appreciation for their enthusiasm towards $contribution.'),
(83, 'Presented with respect for their outstanding work in $contribution.'),
(84, 'Recognition for their team spirit in $contribution.'),
(85, 'We proudly appreciate their input in $contribution.'),
(86, 'Their relentless effort in $contribution is recognized.'),
(87, 'This certificate honors their creativity in $contribution.'),
(88, 'We are grateful for their resourcefulness in $contribution.'),
(89, 'Recognizing their valuable dedication in $contribution.'),
(90, 'Presented with honor for their efforts in $contribution.'),
(91, 'Commending their contribution in $contribution with pride.'),
(92, 'This certificate appreciates their courage in $contribution.'),
(93, 'Acknowledgment of their perseverance in $contribution.'),
(94, 'Recognizing their integrity in $contribution.'),
(95, 'We value their leadership in $contribution.'),
(96, 'Presented with pride for their outstanding input in $contribution.'),
(97, 'This honors their consistent dedication in $contribution.'),
(98, 'Acknowledging their significant role in $contribution.'),
(99, 'Grateful thanks for their dedication in $contribution.'),
(100, 'This certificate celebrates their role in $contribution.'),
(101, 'Honoring their achievements in $contribution.'),
(102, 'With admiration for their dedication in $contribution.'),
(103, 'Respectfully recognizing their great work in $contribution.'),
(104, 'We deeply appreciate their efforts in $contribution.');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `event_name` varchar(100) NOT NULL,
  `event_date` date NOT NULL,
  `template_file` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `event_name`, `event_date`, `template_file`) VALUES
(26, 'Tech Talk', '2025-09-09', NULL),
(27, 'ideathon', '2025-09-12', 'uploads/1757409613_FF0417-01-free-certificate-template-16x9-1 (2).pptx.jpg'),
(28, 'coding', '2025-09-12', 'uploads/1757519919_Templates (2).jpg'),
(29, 'Tech Dasara', '2025-09-26', NULL),
(30, 'HACKAthon', '2025-11-07', NULL),
(31, 'minivora', '2025-11-29', NULL),
(32, 'open day', '2025-12-10', NULL),
(33, 'Projectexpo', '2025-12-04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `usn` varchar(50) NOT NULL,
  `satisfaction` varchar(50) DEFAULT NULL,
  `mentor_helpfulness` varchar(50) DEFAULT NULL,
  `team_collaboration` varchar(255) DEFAULT NULL,
  `learning` text DEFAULT NULL,
  `problem_difficulty` text DEFAULT NULL,
  `suggestions` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `usn`, `satisfaction`, `mentor_helpfulness`, `team_collaboration`, `learning`, `problem_difficulty`, `suggestions`) VALUES
(1, '', 'Excellent', 'Very Helpful', 'Usefull', 'Time Management', 'Lack of Ideas', 'Nothing'),
(2, 'Unknown', 'Good', 'Helpful', 'dwe', 'wedd', 'Time Management', 'dccsdc');

-- --------------------------------------------------------

--
-- Table structure for table `participants`
--

CREATE TABLE `participants` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `usn` varchar(50) NOT NULL,
  `event_id` int(11) NOT NULL,
  `contribution` varchar(255) NOT NULL,
  `template_file` varchar(50) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Submitted',
  `semester` varchar(50) DEFAULT NULL,
  `topic` varchar(100) DEFAULT NULL,
  `event_date` date DEFAULT NULL,
  `achievement` varchar(50) DEFAULT 'Participated'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `participants`
--

INSERT INTO `participants` (`id`, `name`, `usn`, `event_id`, `contribution`, `template_file`, `status`, `semester`, `topic`, `event_date`, `achievement`) VALUES
(61, 'Manasa G R', '4GW23CI027', 27, 'coordinator', '4.jpg', 'Approved', '', '', '0000-00-00', 'Won Prize'),
(62, 'Manasa G R', '4GW23CI027', 27, 'df', '4.jpg', 'Approved', '', '', '0000-00-00', 'Participated'),
(63, 'keerthana', '4GW23CI021', 28, 'coordinator', '4.jpg', 'Approved', '', '', '0000-00-00', 'Won Prize'),
(64, 'Keerthana B', '4GW23CI021', 29, 'COORDINATOR', '4.jpg', 'Approved', '', '', '0000-00-00', 'Participated'),
(65, 'Manasa G R', '4GW23CI027', 27, 'coordinator', '3.jpg', 'Approved', '', '', '0000-00-00', 'Won Prize'),
(66, 'Manasa G R', '4GW23CI027', 30, 'coordinator', '2.jpg', 'Approved', '', '', '0000-00-00', 'Participated'),
(67, 'keerthana', '4GW23CI021', 31, 'COORDINATOR', '4.jpg', 'Approved', '', '', '0000-00-00', 'Won Prize'),
(68, 'Manasa G R', '4GW23CI027', 28, 'COORDINATOR', '2.jpg', 'Approved', '', '', '0000-00-00', 'Participated'),
(69, 'keerthana', '4GW23CI021', 27, 'Teammanagement', '2.jpg', 'Approved', '', '', '0000-00-00', 'Won Prize'),
(70, 'keerthana', '4GW23CI021', 27, 'Teammanagement', NULL, 'Rejected', '', '', '0000-00-00', 'Won Prize'),
(71, 'Nandini', '4GW23CI021', 32, 'participated', '3.jpg', 'Approved', '', '', '0000-00-00', 'Won Prize'),
(72, 'Nandini', '4GW23CI021', 32, 'participated', '3.jpg', 'Approved', '', '', '0000-00-00', 'Won Prize'),
(73, 'Manasa G R', '4GW23CI027', 27, 'df', '3.jpg', 'Approved', '', '', '0000-00-00', 'Won Prize'),
(74, 'Manasa G R', '4GW23CI027', 27, 'df', NULL, 'Rejected', '', '', '0000-00-00', 'Won Prize'),
(75, 'kee', 'Unknown', 28, 'coordinator', NULL, 'Submitted', '', '', '0000-00-00', 'Participated'),
(76, 'manasa', 'Unknown', 30, 'coordinator', NULL, 'Rejected', '7', 'hih', '2026-02-12', 'Participated'),
(77, 'manasa', 'Unknown', 30, 'coordinator', '3.jpg', 'Approved', NULL, NULL, '2026-02-12', 'Participated'),
(78, 'nsfnds', 'Unknown', 28, 'js', '2.jpg', 'Approved', NULL, NULL, '2026-02-21', 'Participated');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contribution_statements`
--
ALTER TABLE `contribution_statements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `participants`
--
ALTER TABLE `participants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contribution_statements`
--
ALTER TABLE `contribution_statements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `participants`
--
ALTER TABLE `participants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `participants`
--
ALTER TABLE `participants`
  ADD CONSTRAINT `participants_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
