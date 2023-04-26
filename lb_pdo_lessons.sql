-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 26, 2023 at 08:43 PM
-- Server version: 10.11.2-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lb_pdo_lessons`
--
DROP DATABASE IF EXISTS `lb_pdo_lessons`;
CREATE DATABASE IF NOT EXISTS `lb_pdo_lessons` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `lb_pdo_lessons`;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `ID_Groups` int(10) NOT NULL,
  `title` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`ID_Groups`, `title`) VALUES
(1, 'KI-12-1'),
(2, 'KI-12-2'),
(3, 'KI-12-3'),
(4, 'KI-12-4'),
(5, 'KI-12-5');

-- --------------------------------------------------------

--
-- Table structure for table `lesson`
--

DROP TABLE IF EXISTS `lesson`;
CREATE TABLE `lesson` (
  `ID_Lesson` int(10) NOT NULL,
  `week_day` mediumtext NOT NULL,
  `lesson_number` int(8) NOT NULL,
  `auditorium` mediumtext NOT NULL,
  `disciple` mediumtext NOT NULL,
  `type` enum('Lecture','Practical','Laboratory') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lesson`
--

INSERT INTO `lesson` (`ID_Lesson`, `week_day`, `lesson_number`, `auditorium`, `disciple`, `type`) VALUES
(1, 'Monday', 3, '104i', 'Computer Networks', 'Lecture'),
(2, 'Monday', 4, '106i', 'Creation of Images and Sound', 'Lecture'),
(3, 'Monday', 5, '229', 'Internet Technologies', 'Laboratory'),
(4, 'Monday', 6, '229', 'Internet Technologies', 'Laboratory'),
(5, 'Saturday', 1, '10012', 'MathIGS', 'Practical');

-- --------------------------------------------------------

--
-- Table structure for table `lesson_groups`
--

DROP TABLE IF EXISTS `lesson_groups`;
CREATE TABLE `lesson_groups` (
  `FID_Lesson2` int(10) NOT NULL,
  `FID_Groups` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lesson_groups`
--

INSERT INTO `lesson_groups` (`FID_Lesson2`, `FID_Groups`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 5),
(2, 3),
(2, 2),
(3, 3),
(4, 3),
(1, 4),
(4, 1),
(4, 1),
(4, 1),
(4, 1),
(4, 1),
(5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `lesson_teacher`
--

DROP TABLE IF EXISTS `lesson_teacher`;
CREATE TABLE `lesson_teacher` (
  `FID_Teacher` int(10) NOT NULL,
  `FID_Lesson1` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lesson_teacher`
--

INSERT INTO `lesson_teacher` (`FID_Teacher`, `FID_Lesson1`) VALUES
(1, 1),
(2, 2),
(3, 3),
(3, 4),
(1, 4),
(1, 4),
(1, 4),
(1, 4),
(3, 4),
(3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `ID_Teacher` int(10) NOT NULL,
  `name` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`ID_Teacher`, `name`) VALUES
(1, 'Kovalenko A.A.'),
(2, 'Yankovskiy O.A.'),
(3, 'Ivaschenko G.S.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`ID_Groups`);

--
-- Indexes for table `lesson`
--
ALTER TABLE `lesson`
  ADD PRIMARY KEY (`ID_Lesson`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`ID_Teacher`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
