-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 11, 2025 at 04:12 AM
-- Server version: 9.1.0
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `srms`
--

-- --------------------------------------------------------

--
-- Table structure for table `class_srms`
--

DROP TABLE IF EXISTS `class_srms`;
CREATE TABLE IF NOT EXISTS `class_srms` (
  `class_id` int NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `class_code` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `class_status` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Enable',
  `class_created_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`class_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_srms`
--

DROP TABLE IF EXISTS `exam_srms`;
CREATE TABLE IF NOT EXISTS `exam_srms` (
  `exam_id` int NOT NULL AUTO_INCREMENT,
  `class_id` int NOT NULL,
  `exam_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `exam_result_date` date NOT NULL DEFAULT '0000-00-00',
  `exam_result_published` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'No',
  `exam_status` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Enable',
  `exam_added_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`exam_id`),
  KEY `class_id` (`class_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `marks_srms`
--

DROP TABLE IF EXISTS `marks_srms`;
CREATE TABLE IF NOT EXISTS `marks_srms` (
  `marks_id` int NOT NULL AUTO_INCREMENT,
  `result_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `marks` float NOT NULL,
  PRIMARY KEY (`marks_id`),
  KEY `result_id` (`result_id`),
  KEY `subject_id` (`subject_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `result_srms`
--

DROP TABLE IF EXISTS `result_srms`;
CREATE TABLE IF NOT EXISTS `result_srms` (
  `result_id` int NOT NULL AUTO_INCREMENT,
  `class_id` int NOT NULL,
  `student_id` int NOT NULL,
  `exam_id` int NOT NULL,
  `result_percentage` float NOT NULL DEFAULT '0',
  `result_status` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Enable',
  `result_added_by` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`result_id`),
  KEY `class_id` (`class_id`),
  KEY `student_id` (`student_id`),
  KEY `exam_id` (`exam_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_srms`
--

DROP TABLE IF EXISTS `student_srms`;
CREATE TABLE IF NOT EXISTS `student_srms` (
  `student_id` int NOT NULL AUTO_INCREMENT,
  `class_id` int NOT NULL,
  `student_roll_no` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `student_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `student_email_id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `student_gender` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `student_dob` date NOT NULL,
  `student_status` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Enable',
  `student_added_by` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `student_added_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`student_id`),
  KEY `class_id` (`class_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subject_srms`
--

DROP TABLE IF EXISTS `subject_srms`;
CREATE TABLE IF NOT EXISTS `subject_srms` (
  `subject_id` int NOT NULL AUTO_INCREMENT,
  `class_id` int NOT NULL,
  `subject_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `subject_status` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Enable',
  `subject_created_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`subject_id`),
  KEY `class_id` (`class_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_srms`
--

DROP TABLE IF EXISTS `user_srms`;
CREATE TABLE IF NOT EXISTS `user_srms` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `user_password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `user_contact_no` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `user_profile` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `user_status` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Enable',
  `user_created_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
