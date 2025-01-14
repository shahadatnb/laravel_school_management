-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 14, 2025 at 06:13 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_school`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_years`
--

CREATE TABLE `academic_years` (
  `id` int UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED DEFAULT NULL,
  `year` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sl` tinyint UNSIGNED DEFAULT '0',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `academic_years`
--

INSERT INTO `academic_years` (`id`, `branch_id`, `year`, `sl`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '2022', 0, 1, NULL, '2024-11-29 04:23:21'),
(2, 1, '2023', 1, 1, '2024-11-29 04:22:25', '2024-11-29 04:23:06'),
(3, 1, '2024', 0, 1, '2024-12-10 06:59:54', '2024-12-10 06:59:54');

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendances`
--

INSERT INTO `attendances` (`id`, `student_id`, `date`, `created_at`, `updated_at`) VALUES
(1, 13, '2024-12-03', '2024-12-03 05:54:40', '2024-12-03 05:54:40'),
(2, 14, '2024-12-03', '2024-12-03 05:54:40', '2024-12-03 05:54:40');

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subdomain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `refer_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `head` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `head_designation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `head_sign` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `head_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `head_contact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `academic_year_id` int UNSIGNED DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `sms_domain_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_api_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_secretkey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_client` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `name`, `subdomain`, `address`, `contact`, `email`, `status`, `refer_by`, `head`, `head_designation`, `head_sign`, `head_email`, `head_contact`, `logo`, `favicon`, `website`, `academic_year_id`, `exp_date`, `sms_domain_url`, `sms_api_key`, `sms_secretkey`, `sms_client`, `created_at`, `updated_at`) VALUES
(1, 'Branch One', NULL, 'Nawdapara', '01757839516', 'branch1@gmail.com', 1, NULL, 'Asikur Rahman', 'Principal', '1736673949.jpg', 'ashik@gmail.com', '01757839516', '1736673949.png', '1732517045.png', NULL, 3, NULL, 'sms3.pondit.com', 'ed57ddde38dd4fc7', 'a95186ae', 'asiancoder', '2024-11-24 09:07:41', '2025-01-12 09:25:49'),
(2, 'Branch Two', 'branch2', 'Rajshahi', '01757839516', 'branch1@gmail.com', 1, NULL, 'Abdur Rahman', 'Principal', NULL, 'ar@gmail.com', '01757839516', NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '2024-11-24 09:07:41', '2024-11-25 11:23:24'),
(3, 'Nawdapara School', 'nschool', 'Nawdapara', '01757839516', 'ns@gmail.com', 1, NULL, 'Asikur Rahman', 'Principal', NULL, 'ashik@gmail.com', '01757839516', NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '2024-11-25 11:22:00', '2024-11-25 11:22:00');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `branch_id` int UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial` tinyint UNSIGNED DEFAULT '0',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `branch_id`, `name`, `serial`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'General', 1, 1, '2024-11-29 13:07:24', '2024-11-29 13:07:24'),
(2, 2, 'General', 1, 1, '2024-12-02 02:44:27', '2024-12-02 02:44:27');

-- --------------------------------------------------------

--
-- Table structure for table `class_configs`
--

CREATE TABLE `class_configs` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_id` int UNSIGNED NOT NULL,
  `class_id` bigint UNSIGNED NOT NULL,
  `shift_id` bigint UNSIGNED NOT NULL,
  `section_id` bigint UNSIGNED NOT NULL,
  `serial` tinyint UNSIGNED DEFAULT '0',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `class_configs`
--

INSERT INTO `class_configs` (`id`, `name`, `branch_id`, `class_id`, `shift_id`, `section_id`, `serial`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Play-Boyes-Day', 1, 11, 1, 1, 1, 1, '2024-11-29 16:53:24', '2024-12-02 10:51:22'),
(2, NULL, 2, 12, 2, 3, 1, 1, '2024-12-02 02:44:42', '2024-12-02 02:44:42'),
(3, NULL, 2, 12, 2, 4, 2, 1, '2024-12-02 02:44:58', '2024-12-02 02:44:58'),
(4, NULL, 2, 13, 2, 3, 3, 1, '2024-12-02 02:45:13', '2024-12-02 02:45:13'),
(5, 'One-Boyes-Day', 1, 14, 1, 1, 2, 1, '2024-12-02 10:17:50', '2024-12-02 10:51:08'),
(7, 'Play-Girls-Day', 1, 11, 1, 2, 3, 1, '2024-12-02 10:53:55', '2024-12-02 10:53:55');

-- --------------------------------------------------------

--
-- Table structure for table `exam_configurations`
--

CREATE TABLE `exam_configurations` (
  `id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `class_id` bigint UNSIGNED NOT NULL,
  `exam_id` bigint UNSIGNED NOT NULL,
  `merit_process_type_id` bigint UNSIGNED NOT NULL,
  `percentage` float UNSIGNED DEFAULT '0',
  `serial` tinyint UNSIGNED DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exam_configurations`
--

INSERT INTO `exam_configurations` (`id`, `branch_id`, `class_id`, `exam_id`, `merit_process_type_id`, `percentage`, `serial`, `created_at`, `updated_at`) VALUES
(1, 1, 11, 1, 1, 100, 1, '2024-12-06 09:21:25', '2024-12-08 11:04:07'),
(3, 1, 11, 2, 1, 0, 1, '2024-12-08 11:03:48', '2024-12-08 11:03:48'),
(4, 1, 11, 3, 1, 0, 1, '2024-12-08 11:03:48', '2024-12-08 11:03:48'),
(5, 1, 11, 4, 1, 0, 1, '2024-12-08 11:03:48', '2024-12-08 11:03:48'),
(6, 1, 14, 4, 1, 0, 1, '2025-01-13 11:25:11', '2025-01-13 11:25:11');

-- --------------------------------------------------------

--
-- Table structure for table `exam_grades`
--

CREATE TABLE `exam_grades` (
  `id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `class_id` bigint UNSIGNED NOT NULL,
  `grade` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `grade_point` float UNSIGNED DEFAULT NULL,
  `grade_range` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exam_grades`
--

INSERT INTO `exam_grades` (`id`, `branch_id`, `class_id`, `grade`, `grade_point`, `grade_range`, `created_at`, `updated_at`) VALUES
(1, 1, 11, 'A+', 5, '80-100', '2024-12-05 06:43:30', '2025-01-13 11:23:11'),
(2, 1, 11, 'A', 4, '70-79', '2024-12-05 06:43:30', '2025-01-13 11:23:18'),
(3, 1, 11, 'A-', 3.5, '60-69', '2024-12-05 06:43:30', '2025-01-13 11:23:29'),
(4, 1, 11, 'B', 3, '50-59', '2024-12-05 06:43:30', '2025-01-13 11:23:41'),
(5, 1, 11, 'C', 2, '40-49', '2024-12-05 06:43:30', '2025-01-13 11:23:54'),
(6, 1, 11, 'D', 1, '33-39', '2024-12-05 06:43:30', '2025-01-13 11:24:01'),
(7, 1, 11, 'F', 0, '0-32', '2024-12-05 06:43:30', '2025-01-13 11:24:09'),
(8, 1, 14, 'A+', 5, '80-100', '2024-12-05 06:56:25', '2024-12-05 06:56:25'),
(9, 1, 14, 'A', 4, '70-79', '2024-12-05 06:56:25', '2024-12-05 06:56:25'),
(10, 1, 14, 'A-', 3.5, '60-69', '2024-12-05 06:56:25', '2024-12-05 06:56:25'),
(11, 1, 14, 'B', 3, '50-59', '2024-12-05 06:56:25', '2025-01-13 11:24:17'),
(12, 1, 14, 'C', 2, '40-49', '2024-12-05 06:56:26', '2024-12-05 06:56:26'),
(13, 1, 14, 'D', 1, '33-39', '2024-12-05 06:56:26', '2024-12-05 06:56:26'),
(14, 1, 14, 'F', 0, '0-32', '2024-12-05 06:56:26', '2024-12-05 06:56:26');

-- --------------------------------------------------------

--
-- Table structure for table `exam_grade_defaults`
--

CREATE TABLE `exam_grade_defaults` (
  `id` bigint UNSIGNED NOT NULL,
  `grade` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `grade_point` float UNSIGNED DEFAULT NULL,
  `grade_range` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exam_grade_defaults`
--

INSERT INTO `exam_grade_defaults` (`id`, `grade`, `grade_point`, `grade_range`, `created_at`, `updated_at`) VALUES
(1, 'A+', 5, '80-100', NULL, NULL),
(2, 'A', 4, '70-79', NULL, NULL),
(3, 'A-', 3.5, '60-69', NULL, NULL),
(4, 'B', 4, '50-59', NULL, NULL),
(5, 'C', 2, '40-49', NULL, NULL),
(6, 'D', 1, '33-39', NULL, NULL),
(7, 'F', 0, '0-32', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exam_lists`
--

CREATE TABLE `exam_lists` (
  `id` bigint UNSIGNED NOT NULL,
  `branch_id` int UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial` tinyint UNSIGNED DEFAULT '0',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exam_lists`
--

INSERT INTO `exam_lists` (`id`, `branch_id`, `name`, `serial`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Weekly', 1, 1, '2024-12-04 04:44:43', '2024-12-08 09:36:14'),
(2, 1, '1st Terminal', 2, 1, '2024-12-04 06:54:36', '2024-12-08 09:36:27'),
(3, 1, '2nd Terminal', 3, 1, '2024-12-08 09:34:32', '2024-12-08 09:36:39'),
(4, 1, 'Final', 4, 1, '2024-12-08 09:35:58', '2024-12-08 09:35:58');

-- --------------------------------------------------------

--
-- Table structure for table `exam_marks`
--

CREATE TABLE `exam_marks` (
  `id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `academic_year_id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL,
  `section_id` int UNSIGNED DEFAULT NULL,
  `mark_config_id` bigint UNSIGNED NOT NULL,
  `is_absent` tinyint UNSIGNED DEFAULT NULL,
  `marks` double(6,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exam_marks`
--

INSERT INTO `exam_marks` (`id`, `branch_id`, `academic_year_id`, `student_id`, `section_id`, `mark_config_id`, `is_absent`, `marks`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 18, 5, 45, NULL, 85.00, '2025-01-14 07:07:30', '2025-01-14 07:07:30'),
(2, 1, 3, 18, 5, 46, NULL, 25.00, '2025-01-14 07:07:30', '2025-01-14 07:07:30'),
(3, 1, 3, 19, 5, 45, NULL, 75.00, '2025-01-14 07:07:30', '2025-01-14 07:07:30'),
(4, 1, 3, 19, 5, 46, NULL, 19.00, '2025-01-14 07:07:30', '2025-01-14 07:07:30'),
(5, 1, 3, 18, 5, 47, NULL, 75.00, '2025-01-14 07:07:56', '2025-01-14 07:07:56'),
(6, 1, 3, 18, 5, 48, NULL, 20.00, '2025-01-14 07:07:56', '2025-01-14 07:07:56'),
(7, 1, 3, 19, 5, 47, NULL, 60.00, '2025-01-14 07:07:56', '2025-01-14 07:07:56'),
(8, 1, 3, 19, 5, 48, NULL, 16.00, '2025-01-14 07:07:56', '2025-01-14 07:07:56'),
(9, 1, 3, 18, 5, 49, NULL, 65.00, '2025-01-14 07:08:28', '2025-01-14 07:08:28'),
(10, 1, 3, 18, 5, 50, NULL, 19.00, '2025-01-14 07:08:28', '2025-01-14 07:08:28'),
(11, 1, 3, 19, 5, 49, NULL, 53.00, '2025-01-14 07:08:28', '2025-01-14 07:08:28'),
(12, 1, 3, 19, 5, 50, NULL, 14.00, '2025-01-14 07:08:28', '2025-01-14 07:08:28');

-- --------------------------------------------------------

--
-- Table structure for table `exam_mark_configs`
--

CREATE TABLE `exam_mark_configs` (
  `id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `class_id` bigint UNSIGNED NOT NULL,
  `group_id` bigint UNSIGNED NOT NULL,
  `exam_id` bigint UNSIGNED NOT NULL,
  `subject_id` bigint UNSIGNED NOT NULL,
  `sc_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_marks` smallint UNSIGNED NOT NULL DEFAULT '0',
  `pass_mark` double(8,2) NOT NULL DEFAULT '0.00',
  `acceptance` double(8,2) NOT NULL DEFAULT '1.00',
  `sc_merge` decimal(8,2) UNSIGNED NOT NULL DEFAULT '1.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exam_mark_configs`
--

INSERT INTO `exam_mark_configs` (`id`, `branch_id`, `class_id`, `group_id`, `exam_id`, `subject_id`, `sc_title`, `total_marks`, `pass_mark`, `acceptance`, `sc_merge`, `created_at`, `updated_at`) VALUES
(45, 1, 14, 1, 4, 1, 'SC-1', 100, 33.00, 0.70, '0.00', '2025-01-13 12:00:21', '2025-01-13 12:00:21'),
(46, 1, 14, 1, 4, 1, 'MC-2', 30, 33.00, 1.00, '0.00', '2025-01-13 12:00:21', '2025-01-13 12:00:21'),
(47, 1, 14, 1, 4, 3, 'SC-1', 100, 33.00, 0.70, '0.00', '2025-01-13 12:00:21', '2025-01-13 12:00:21'),
(48, 1, 14, 1, 4, 3, 'MC-2', 30, 33.00, 1.00, '0.00', '2025-01-13 12:00:21', '2025-01-13 12:00:21'),
(49, 1, 14, 1, 4, 5, 'SC-1', 100, 33.00, 0.70, '0.00', '2025-01-13 12:00:21', '2025-01-13 12:00:21'),
(50, 1, 14, 1, 4, 5, 'MC-2', 30, 33.00, 1.00, '0.00', '2025-01-13 12:00:21', '2025-01-13 12:00:21');

-- --------------------------------------------------------

--
-- Table structure for table `exam_merit_process_types`
--

CREATE TABLE `exam_merit_process_types` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exam_merit_process_types`
--

INSERT INTO `exam_merit_process_types` (`id`, `name`) VALUES
(1, 'Total Mark (Sequential)'),
(2, 'Grade Point (Sequential)'),
(3, 'Grade Point (Non Sequential)'),
(4, 'Grand Total Mark (Sequential)'),
(5, 'Grand Total Mark (Non Sequential)');

-- --------------------------------------------------------

--
-- Table structure for table `exam_results`
--

CREATE TABLE `exam_results` (
  `id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `academic_year_id` bigint UNSIGNED NOT NULL,
  `class_id` bigint UNSIGNED NOT NULL,
  `section_id` bigint UNSIGNED NOT NULL,
  `exam_id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL,
  `total_marks` double(6,2) DEFAULT NULL,
  `grand_total_marks` double(5,2) DEFAULT NULL,
  `class_position` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `section_position` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `grade` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grade_point` float(3,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exam_results`
--

INSERT INTO `exam_results` (`id`, `branch_id`, `academic_year_id`, `class_id`, `section_id`, `exam_id`, `student_id`, `total_marks`, `grand_total_marks`, `class_position`, `section_position`, `grade`, `grade_point`, `created_at`, `updated_at`) VALUES
(24, 1, 3, 14, 5, 4, 18, 221.50, NULL, 1, 1, 'A', 4.17, '2025-01-14 16:52:29', '2025-01-14 16:53:28'),
(25, 1, 3, 14, 5, 4, 19, 180.60, NULL, 2, 2, 'B', 3.33, '2025-01-14 16:52:29', '2025-01-14 16:53:28');

-- --------------------------------------------------------

--
-- Table structure for table `exam_result_tabulations`
--

CREATE TABLE `exam_result_tabulations` (
  `id` bigint UNSIGNED NOT NULL,
  `exam_result_id` bigint UNSIGNED NOT NULL,
  `subject_id` bigint UNSIGNED NOT NULL,
  `full_marks` smallint DEFAULT NULL,
  `marks` double(7,2) DEFAULT NULL,
  `grade` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grade_point` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exam_result_tabulations`
--

INSERT INTO `exam_result_tabulations` (`id`, `exam_result_id`, `subject_id`, `full_marks`, `marks`, `grade`, `grade_point`, `created_at`, `updated_at`) VALUES
(31, 24, 1, 100, 84.50, 'A+', '5', '2025-01-14 16:52:29', '2025-01-14 16:52:29'),
(32, 24, 3, 100, 72.50, 'A', '4', '2025-01-14 16:52:29', '2025-01-14 16:52:29'),
(33, 24, 5, 100, 64.50, 'A-', '3.5', '2025-01-14 16:52:29', '2025-01-14 16:52:29'),
(34, 25, 1, 100, 71.50, 'A', '4', '2025-01-14 16:52:29', '2025-01-14 16:52:29'),
(35, 25, 3, 100, 58.00, 'B', '3', '2025-01-14 16:52:29', '2025-01-14 16:52:29'),
(36, 25, 5, 100, 51.10, 'B', '3', '2025-01-14 16:52:29', '2025-01-14 16:52:29');

-- --------------------------------------------------------

--
-- Table structure for table `exam_short_codes`
--

CREATE TABLE `exam_short_codes` (
  `id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED DEFAULT NULL,
  `class_id` bigint UNSIGNED NOT NULL,
  `default_id` bigint UNSIGNED NOT NULL,
  `code_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_marks` smallint UNSIGNED NOT NULL,
  `pass_mark` double(5,2) NOT NULL,
  `acceptance` double(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exam_short_codes`
--

INSERT INTO `exam_short_codes` (`id`, `branch_id`, `class_id`, `default_id`, `code_title`, `total_marks`, `pass_mark`, `acceptance`, `created_at`, `updated_at`) VALUES
(1, 1, 14, 1, 'SC-1', 100, 33.00, 1.00, '2024-12-04 10:26:53', '2024-12-04 10:37:54'),
(2, 1, 14, 2, 'MC-2', 100, 33.00, 1.00, '2024-12-04 10:26:53', '2025-01-11 08:47:23'),
(3, 1, 11, 1, 'SC-1', 100, 33.00, 1.00, '2024-12-08 09:37:15', '2024-12-08 09:37:15'),
(4, 1, 11, 2, 'SC-2', 100, 33.00, 1.00, '2024-12-08 09:37:15', '2024-12-08 09:37:15'),
(7, 1, 15, 1, 'SC-1', 100, 33.00, 1.00, '2025-01-11 08:57:01', '2025-01-11 08:57:01'),
(8, 1, 15, 2, 'SC-2', 100, 33.00, 1.00, '2025-01-11 08:57:01', '2025-01-11 08:57:01');

-- --------------------------------------------------------

--
-- Table structure for table `exam_short_code_defaults`
--

CREATE TABLE `exam_short_code_defaults` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_marks` smallint UNSIGNED NOT NULL,
  `pass_mark` double(5,2) NOT NULL,
  `acceptance` double(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exam_short_code_defaults`
--

INSERT INTO `exam_short_code_defaults` (`id`, `name`, `total_marks`, `pass_mark`, `acceptance`, `created_at`, `updated_at`) VALUES
(1, 'SC-1', 100, 33.00, 1.00, NULL, NULL),
(2, 'SC-2', 100, 33.00, 1.00, NULL, NULL),
(3, 'SC-3', 100, 33.00, 1.00, NULL, NULL),
(4, 'SC-4', 100, 33.00, 1.00, NULL, NULL),
(5, 'SC-5', 100, 33.00, 1.00, NULL, NULL),
(6, 'SC-6', 100, 33.00, 1.00, NULL, NULL),
(7, 'SC-7', 100, 33.00, 1.00, NULL, NULL),
(8, 'SC-8', 100, 33.00, 1.00, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exam_subjects`
--

CREATE TABLE `exam_subjects` (
  `id` bigint UNSIGNED NOT NULL,
  `branch_id` int UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial` tinyint UNSIGNED DEFAULT '0',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exam_subjects`
--

INSERT INTO `exam_subjects` (`id`, `branch_id`, `name`, `serial`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Bangla', 1, 1, '2024-12-04 06:59:44', '2025-01-11 07:40:14'),
(2, 1, 'Sciences', 4, 1, '2024-12-04 07:43:58', '2025-01-13 11:08:34'),
(3, 1, 'English', 2, 1, '2024-12-06 03:37:22', '2025-01-13 11:04:58'),
(4, 1, 'Religion', 5, 1, '2024-12-06 03:37:40', '2025-01-13 11:09:13'),
(5, 1, 'Mathematic', 3, 1, '2024-12-06 03:38:32', '2025-01-13 11:08:07'),
(6, 1, 'Digital Technology', 6, 1, '2025-01-13 11:09:37', '2025-01-13 11:09:37'),
(7, 1, 'History & Social Science', 7, 1, '2025-01-13 11:09:56', '2025-01-13 11:09:56'),
(8, 1, 'Well Being', 8, 1, '2025-01-13 11:10:16', '2025-01-13 11:10:16'),
(9, 1, 'Art & Culture', 9, 1, '2025-01-13 11:10:31', '2025-01-13 11:10:31'),
(10, 1, 'Life & Livelyhood', 10, 1, '2025-01-13 11:10:46', '2025-01-13 11:10:46');

-- --------------------------------------------------------

--
-- Table structure for table `exam_subject_configs`
--

CREATE TABLE `exam_subject_configs` (
  `id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `class_id` bigint UNSIGNED NOT NULL,
  `group_id` bigint UNSIGNED NOT NULL,
  `subject_id` bigint UNSIGNED NOT NULL,
  `subject_type_id` bigint UNSIGNED DEFAULT '1',
  `serial` smallint UNSIGNED DEFAULT '0',
  `merge` smallint UNSIGNED DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exam_subject_configs`
--

INSERT INTO `exam_subject_configs` (`id`, `branch_id`, `class_id`, `group_id`, `subject_id`, `subject_type_id`, `serial`, `merge`, `created_at`, `updated_at`) VALUES
(24, 1, 14, 1, 1, 1, 1, 0, '2024-12-07 07:25:26', '2025-01-13 11:20:57'),
(25, 1, 14, 1, 3, 1, 2, 0, '2024-12-07 07:25:26', '2025-01-13 11:20:57'),
(26, 1, 14, 1, 5, 1, 3, 0, '2024-12-07 07:25:26', '2025-01-13 11:20:57'),
(27, 1, 11, 1, 1, 1, 1, 0, '2025-01-13 11:18:58', '2025-01-13 11:19:47'),
(28, 1, 11, 1, 2, 1, 4, 0, '2025-01-13 11:18:58', '2025-01-13 11:19:47'),
(29, 1, 11, 1, 3, 1, 2, 0, '2025-01-13 11:18:58', '2025-01-13 11:19:47'),
(30, 1, 11, 1, 4, 1, 5, 0, '2025-01-13 11:18:58', '2025-01-13 11:19:47'),
(31, 1, 11, 1, 5, 1, 3, 0, '2025-01-13 11:18:58', '2025-01-13 11:19:47'),
(32, 1, 11, 1, 6, 1, 6, 0, '2025-01-13 11:18:58', '2025-01-13 11:19:47'),
(33, 1, 11, 1, 7, 1, 7, 0, '2025-01-13 11:18:58', '2025-01-13 11:19:47'),
(34, 1, 11, 1, 8, 1, 8, 0, '2025-01-13 11:18:58', '2025-01-13 11:19:48'),
(35, 1, 11, 1, 9, 1, 9, 0, '2025-01-13 11:18:58', '2025-01-13 11:19:48'),
(36, 1, 11, 1, 10, 1, 10, 0, '2025-01-13 11:18:58', '2025-01-13 11:19:48');

-- --------------------------------------------------------

--
-- Table structure for table `exam_subject_types`
--

CREATE TABLE `exam_subject_types` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exam_subject_types`
--

INSERT INTO `exam_subject_types` (`id`, `name`) VALUES
(1, 'Compulsory'),
(2, 'Choosable'),
(3, 'Group Based'),
(4, 'Uncountable');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` bigint UNSIGNED NOT NULL,
  `branch_id` int UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial` tinyint UNSIGNED DEFAULT '0',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `branch_id`, `name`, `serial`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'General', 1, 1, '2024-11-29 13:06:05', '2024-11-29 13:06:05'),
(2, 2, 'Bangla', 1, 1, '2024-12-02 02:44:13', '2024-12-02 02:44:13'),
(3, 1, 'Scince', 2, 1, '2024-12-07 07:53:17', '2024-12-07 07:53:17'),
(4, 1, 'Arts', 3, 1, '2024-12-07 07:53:33', '2024-12-07 07:53:33');

-- --------------------------------------------------------

--
-- Table structure for table `group_configs`
--

CREATE TABLE `group_configs` (
  `id` bigint UNSIGNED NOT NULL,
  `branch_id` int UNSIGNED NOT NULL,
  `group_id` bigint UNSIGNED NOT NULL,
  `class_id` bigint UNSIGNED NOT NULL,
  `serial` tinyint UNSIGNED DEFAULT '0',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `group_configs`
--

INSERT INTO `group_configs` (`id`, `branch_id`, `group_id`, `class_id`, `serial`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 11, 1, 1, '2024-12-07 07:51:32', '2024-12-07 07:51:32'),
(2, 1, 1, 14, 2, 1, '2024-12-07 07:51:49', '2024-12-07 07:51:49'),
(3, 1, 3, 17, 1, 1, '2024-12-07 07:54:05', '2024-12-07 07:54:05'),
(4, 1, 4, 17, 5, 1, '2024-12-07 07:54:40', '2024-12-07 07:54:40');

-- --------------------------------------------------------

--
-- Table structure for table `idcard_templates`
--

CREATE TABLE `idcard_templates` (
  `id` bigint UNSIGNED NOT NULL,
  `branch_id` int UNSIGNED DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_6` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color_code_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color_code_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color_code_3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color_code_4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color_code_5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color_code_6` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color_code_7` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `idcard_templates`
--

INSERT INTO `idcard_templates` (`id`, `branch_id`, `title`, `slug`, `image`, `text_1`, `text_2`, `text_3`, `text_4`, `text_5`, `text_6`, `color_code_1`, `color_code_2`, `color_code_3`, `color_code_4`, `color_code_5`, `color_code_6`, `color_code_7`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Template 1', 'template1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, NULL, 'Template 2', 'template2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, NULL, 'Template 3', 'template3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED DEFAULT NULL,
  `student_id` bigint UNSIGNED NOT NULL,
  `voucher_date` date NOT NULL,
  `created_by` smallint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_heads`
--

CREATE TABLE `invoice_heads` (
  `id` int UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,2) UNSIGNED DEFAULT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_heads`
--

INSERT INTO `invoice_heads` (`id`, `branch_id`, `code`, `title`, `amount`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 'Admission Fee', '200.00', 0, '2022-10-08 02:03:13', '2022-10-08 13:52:17'),
(2, NULL, NULL, 'Tution Fee', '150.00', 1, '2022-10-08 02:12:53', '2022-10-08 13:52:26');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE `invoice_items` (
  `id` bigint UNSIGNED NOT NULL,
  `invoice_id` bigint UNSIGNED NOT NULL,
  `invoice_head_id` int UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_payments`
--

CREATE TABLE `invoice_payments` (
  `id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED DEFAULT NULL,
  `invoice_id` bigint UNSIGNED DEFAULT NULL,
  `student_id` bigint UNSIGNED NOT NULL,
  `amount` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `received_by` smallint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_payments`
--

INSERT INTO `invoice_payments` (`id`, `branch_id`, `invoice_id`, `student_id`, `amount`, `remarks`, `received_by`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 1, '500.00', 'test', 1, '2022-11-05 02:13:20', '2022-11-05 02:13:20'),
(2, NULL, NULL, 1, '100.00', 'test2', 1, '2022-11-05 15:50:30', '2022-11-05 15:50:30'),
(3, NULL, NULL, 5, '500.00', 'test', 1, '2022-11-06 01:33:02', '2022-11-06 01:33:02'),
(4, NULL, NULL, 6, '2000.00', 'Payment', 1, '2022-11-06 01:35:03', '2022-11-06 01:35:03'),
(5, NULL, NULL, 8, '0.00', 'free', 1, '2023-01-17 10:35:22', '2023-01-17 10:35:22'),
(6, NULL, NULL, 9, '1000.00', 'paid', 1, '2023-09-06 04:27:30', '2023-09-06 04:27:30'),
(7, NULL, NULL, 10, '200.00', 'sdfg', 1, '2023-09-12 08:30:25', '2023-09-12 08:30:25');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` enum('Basic','Customer') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Basic',
  `en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `code`, `group`, `en`, `bn`, `created_at`, `updated_at`) VALUES
(1, 'Product', 'Basic', 'Product', 'Product', NULL, '2022-03-14 09:54:37'),
(2, 'Zila', 'Customer', 'গ্রাম', 'গ্রাম', NULL, '2022-03-14 09:54:37'),
(3, 'Upazila', 'Customer', 'পাড়া', 'পাড়া', NULL, '2022-03-14 09:54:37'),
(4, 'Address', 'Customer', 'পিতা/রেফারেন্স', 'পিতা/রেফারেন্স', NULL, '2022-03-14 09:54:37'),
(5, 'Name', 'Customer', 'নাম', 'নাম', NULL, '2022-03-14 09:54:37'),
(6, 'Phone', 'Customer', 'মোবাইল', 'মোবাইল', NULL, '2022-03-14 09:54:37');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_bn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int UNSIGNED DEFAULT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `name`, `name_bn`, `parent_id`, `status`) VALUES
(337, 'Bagerhat', 'বাগেরহাট', NULL, 1),
(338, 'Bandarban', 'বান্দরবান', NULL, 1),
(339, 'Barguna', 'বরগুনা', NULL, 1),
(340, 'Barisal', 'বরিশাল', NULL, 1),
(341, 'Bhola', 'ভোলা', NULL, 1),
(342, 'Bogora', 'বগুড়া', NULL, 1),
(343, 'Brahman Bariya', 'ব্রাহ্মণবাড়িয়া', NULL, 1),
(344, 'Chandpur', 'চাঁদপুর', NULL, 1),
(345, 'Chattogram', 'চট্টগ্রাম', NULL, 1),
(347, 'Chuadanga', 'চুয়াডাঙ্গা', NULL, 1),
(348, 'Dhaka', 'ঢাকা', NULL, 1),
(349, 'Dinajpur', 'দিনাজপুর', NULL, 1),
(350, 'Faridpur', 'ফরিদপুর', NULL, 1),
(351, 'Feni', 'ফেনী', NULL, 1),
(353, 'Gazipur', 'গাজীপুর', NULL, 1),
(354, 'Gopalganj', 'গোপালগঞ্জ', NULL, 1),
(355, 'Habiganj', 'হবিগঞ্জ', NULL, 1),
(356, 'Jaipur Hat', 'জয়পুরহাট', NULL, 1),
(357, 'Jamalpur', 'জামালপুর', NULL, 1),
(361, 'Khagrachhari', 'খাগড়াছড়ি', NULL, 1),
(362, 'Khulna', 'খুলনা', NULL, 1),
(363, 'Kishorganj', 'কিশোরগঞ্জ', NULL, 1),
(366, 'Kurigram', 'কুড়িগ্রাম', NULL, 1),
(367, 'Kushtia', 'কুষ্টিয়া', NULL, 1),
(368, 'Lakshmipur', 'লক্ষ্মীপুর', NULL, 1),
(369, 'Lalmanir Hat', 'লালমনিরহাট', NULL, 1),
(370, 'Madaripur', 'মাদারীপুর', NULL, 1),
(371, 'Magura', 'মাগুরা', NULL, 1),
(373, 'Manikganj', 'মানিকগঞ্জ', NULL, 1),
(374, 'Maulvi Bazar', 'মৌলভীবাজার', NULL, 1),
(375, 'Meherpur', 'মেহেরপুর', NULL, 1),
(376, 'Munshiganj', 'মুন্সিগঞ্জ', NULL, 1),
(378, 'Narayanganj', 'নারায়ণগঞ্জ', NULL, 1),
(379, 'Narsingdi', 'নরসিংদী', NULL, 1),
(380, 'Nator', 'নাটোর', NULL, 1),
(383, 'Netrakona', 'নেত্রকোণা', NULL, 1),
(384, 'Nilphamari', 'নীলফামারী', NULL, 1),
(385, 'Noakhali', 'নোয়াখালী', NULL, 1),
(386, 'Pabna', 'পাবনা', NULL, 1),
(387, 'Panchagarh', 'পঞ্চগড়', NULL, 1),
(388, 'Patuakhali', 'পটুয়াখালী', NULL, 1),
(389, 'Pirojpur', 'পিরোজপুর', NULL, 1),
(390, 'Rajbari', 'রাজবাড়ী', NULL, 1),
(391, 'Rajshahi', 'রাজশাহী', NULL, 1),
(392, 'Rangamati', 'রাঙ্গামাটি', NULL, 1),
(393, 'Rangpur', 'রংপুর', NULL, 1),
(394, 'Satkhira', 'সাতক্ষীরা', NULL, 1),
(395, 'Shariatpur', 'শরীয়তপুর', NULL, 1),
(396, 'Sherpur', 'শেরপুর', NULL, 1),
(398, 'Sirajganj', 'সিরাজগঞ্জ', NULL, 1),
(399, 'Sunamganj', 'সুনামগঞ্জ', NULL, 1),
(400, 'Tangail', 'টাঙ্গাইল', NULL, 1),
(401, 'Thakurgaon', 'ঠাকুরগাঁও', NULL, 1),
(404, 'Barisal Sadar', 'বরিশাল সদর', 340, 1),
(406, 'Mehendiganj', 'মেহেন্দিগঞ্জ', 340, 1),
(407, 'Nalchiti', NULL, 340, 1),
(408, 'Barishal Sadar', 'ভোলা সদর', 341, 1),
(409, 'Burhanuddin', 'বোরহান উদ্দিন', 341, 1),
(411, 'Lalmohan', 'লালমোহন', 341, 1),
(413, 'Bogora Sadar', 'বগুড়া সদর', 342, 1),
(414, 'Sherpur Upazila', 'শেরপুর', 342, 1),
(415, 'Chandpur Sadar', 'চাঁদপুর সদর', 344, 1),
(416, 'Hajiganj', 'হাজীগঞ্জ', 344, 1),
(426, 'Alamdanga', 'আলমডাঙ্গা', 347, 1),
(427, 'Chuadangasadar', 'চুয়াডাঙ্গা সদর', 347, 1),
(428, 'Damurhuda', 'দামুড়হুদা', 347, 1),
(429, 'Dhaka City', 'ঢাকা সিটি', 348, 1),
(430, 'Dhamrai', 'ধামরাই', 348, 1),
(431, 'Dohar', 'দোহার', 348, 1),
(433, 'Dinajpur Sadar', 'দিনাজপুর সদর', 349, 1),
(434, 'Fulbari', 'ফুলবাড়ী', 349, 1),
(435, 'Parbatipur', 'পার্বতীপুর', 349, 1),
(436, 'Bhanga', 'ভাঙ্গা', 350, 1),
(438, 'Faridpur Sadar', 'ফরিদপুর সদর', 350, 1),
(439, 'Chhagalnaiya', 'ছাগলনাইয়া উপজেলা', 351, 1),
(440, 'Feni Sadar', 'ফেনী সদর', 351, 1),
(442, 'Gazipur Sadar', 'গাজীপুর সদর', 353, 1),
(443, 'Tungi', NULL, 353, 1),
(444, 'Gopalganj Sadar', 'গোপালগঞ্জ সদর', 354, 1),
(447, 'Habiganj Sadar', 'হবিগঞ্জ সদর', 355, 1),
(448, 'Jamalpursadar', 'জামালপুর সদর', 357, 1),
(449, 'Sarishabari', 'সরিষাবাড়ী', 357, 1),
(462, 'Khulna Sadar', 'খুলনা সদর', 362, 1),
(464, 'Bajitpur', 'বাজিতপুর', 363, 1),
(466, 'Itna', 'ইটনা', 363, 1),
(467, 'Kishoreganj Sadar', 'কিশোরগঞ্জ সদর', 363, 1),
(470, 'Chilmari', 'চিলমারী', 366, 1),
(471, 'Kurigram Sadar', 'কুড়িগ্রাম সদর', 366, 1),
(472, 'Nageshwari', 'নাগেশ্বরী', 366, 1),
(473, 'Ulipur', 'উলিপুর', 366, 1),
(474, 'Bheramara', 'ভেড়ামারা', 367, 1),
(475, 'Kushtia Sadar', 'কুষ্টিয়া সদর', 367, 1),
(476, 'Lakshmipur Sadar', 'লক্ষ্মীপুর সদর', 368, 1),
(477, 'Ramganj', 'রামগঞ্জ', 368, 1),
(478, 'Ramgati', 'রামগতি', 368, 1),
(480, 'Madaripur Sadar', 'মাদারীপুর সদর', 370, 1),
(490, 'Meherpursadar', 'মেহেরপুর সদর', 375, 1),
(491, 'Munshiganj Sadar', 'মুন্সিগঞ্জ সদর', 376, 1),
(494, 'Narayanganj Sadar', 'নারায়নগঞ্জ সদর', 378, 1),
(495, 'Rupganj', 'রূপগঞ্জ', 378, 1),
(504, 'Netrokonasadar', 'নেত্রকোণা সদর', 383, 1),
(505, 'Domar', 'ডোমার উপজেলা', 384, 1),
(506, 'Nilphamari Sadar', 'নীলফামারী সদর', 384, 1),
(509, 'Noakhali Sadar', 'নোয়াখালী', 385, 1),
(511, 'Bera', 'বেড়া', 386, 1),
(512, 'Bhangura', 'ভাঙ্গুড়া', 386, 1),
(513, 'Ishurdi', 'ঈশ্বরদী', 386, 1),
(515, 'Panchagarh Sadar', 'পঞ্চগড় সদর', 387, 1),
(517, 'Bhandaria', 'ভান্ডারিয়া', 389, 1),
(518, 'Mathbaria', 'মঠবাড়ীয়া', 389, 1),
(519, 'Nesarabad', 'নেছারাবাদ', 389, 1),
(520, 'Pirojpur Sadar', 'পিরোজপুর সদর', 389, 1),
(522, 'Rajbari Sadar', 'রাজবাড়ী সদর', 390, 1),
(524, 'Kaptai', 'কাপ্তাই', 392, 1),
(525, 'Rangamati Sadar', 'রাঙ্গামাটি সদর', 392, 1),
(527, 'Kaunia', 'কাউনিয়া উপজেলা', 393, 1),
(528, 'Rangpur Sadar', 'রংপুর সদর', 393, 1),
(529, 'Satkhirasadar', 'সাতক্ষীরা সদর', 394, 1),
(530, 'Shariatpur Sadar', 'শরিয়তপুর সদর', 395, 1),
(531, 'Nalitabari', 'নালিতাবাড়ী উপজেলা', 396, 1),
(532, 'Sherpur Sadar', 'শেরপুর সদর', 396, 1),
(536, 'Chhatak', 'ছাতক', 399, 1),
(537, 'Sunamganj Sadar', 'সুনামগঞ্জ সদর', 399, 1),
(538, 'Gopalpur', 'গোপালপুর', 400, 1),
(539, 'Mirzapur', 'মির্জাপুর', 400, 1),
(540, 'Sakhipur', 'সখিপুর', 400, 1),
(541, 'Tangail Sadar', 'টাঙ্গাইল সদর', 400, 1),
(542, 'Pirganj', 'পীরগঞ্জ উপজেলা', 401, 1),
(543, 'Thakurgaon Sadar', 'ঠাকুরগাঁও সদর', 401, 1),
(544, 'Bagha', 'বাঘা', 391, 1),
(545, 'Paba', 'পবা', 391, 1),
(547, 'Durgapur', 'দুর্গাপুর', 391, 1),
(548, 'Mohonpur', 'মোহনপুর', 391, 1),
(549, 'Charghat', 'চারঘাট', 391, 1),
(550, 'Puthia', 'পুঠিয়া', 391, 1),
(551, 'Godagari', 'গোদাগাড়ী', 391, 1),
(552, 'Tanore', 'তানোর', 391, 1),
(553, 'Bagmara', 'বাগমারা', 391, 1),
(554, 'Cumilla', 'কুমিল্লা', NULL, 1),
(555, 'Debidwar', 'দেবিদ্বার', 554, 1),
(556, 'Barura', 'বরুড়া', 554, 1),
(557, 'Brahmanpara', 'ব্রাহ্মণপাড়া', 554, 1),
(558, 'Chandina', 'চান্দিনা', 554, 1),
(559, 'Chauddagram', 'চৌদ্দগ্রাম', 554, 1),
(560, 'Daudkandi', 'দাউদকান্দি', 554, 1),
(561, 'Homna', 'হোমনা', 554, 1),
(562, 'Laksam', 'লাকসাম', 554, 1),
(563, 'Muradnagar', 'মুরাদনগর', 554, 1),
(564, 'Nangalkot', 'নাঙ্গলকোট', 554, 1),
(565, 'Cumillasadar', 'কুমিল্লা সদর', 554, 1),
(566, 'Meghna', 'মেঘনা', 554, 1),
(567, 'Monohargonj', 'মনোহরগঞ্জ', 554, 1),
(568, 'Sadarsouth', 'সদর দক্ষিণ', 554, 1),
(569, 'Titas', 'তিতাস', 554, 1),
(570, 'Burichang', 'বুড়িচং', 554, 1),
(571, 'Lalmai', 'লালমাই', 554, 1),
(572, 'Sonagazi', 'সোনাগাজী উপজেলা', 351, 1),
(573, 'Fulgazi', 'ফুলগাজী উপজেলা', 351, 1),
(574, 'Parshuram', 'পরশুরাম', 351, 1),
(575, 'Daganbhuiyan', 'দাগনভূঞা', 351, 1),
(576, 'Sadar', 'ব্রাহ্মণবাড়িয়া সদর', 343, 1),
(577, 'Kasba', 'কসবা', 343, 1),
(578, 'Nasirnagar', 'নাসিরনগর', 343, 1),
(579, 'Sarail', 'সরাইল উপজেলা', 343, 1),
(580, 'Ashuganj', 'আশুগঞ্জ', 343, 1),
(581, 'Akhaura', 'আখাউড়া', 343, 1),
(582, 'Nabinagar', 'নবীনগর', 343, 1),
(583, 'Bancharampur', 'বাঞ্ছারামপুর', 343, 1),
(584, 'Bijoynagar', 'বিজয়নগর', 343, 1),
(585, 'Kawkhali', 'কাউখালী', 392, 1),
(586, 'Baghaichari', 'বাঘাইছড়ি', 392, 1),
(587, 'Barkal', 'বরকল', 392, 1),
(588, 'Langadu', 'লংগদু', 392, 1),
(589, 'Rajasthali', 'রাজস্থলী', 392, 1),
(590, 'Belaichari', 'বিলাইছড়ি', 392, 1),
(591, 'Juraichari', 'জুরাছড়ি', 392, 1),
(592, 'Naniarchar', 'নানিয়ারচর', 392, 1),
(593, 'Companiganj', 'কোম্পানীগঞ্জ', 385, 1),
(594, 'Hatia', 'হাতিয়া', 385, 1),
(595, 'Subarnachar', 'সুবর্ণচর', 385, 1),
(596, 'Kabirhat', 'কবিরহাট', 385, 1),
(597, 'Chatkhil', 'চাটখিল', 385, 1),
(598, 'Sonaimuri', 'সোনাইমুড়ী', 385, 1),
(599, 'Haimchar', 'হাইমচর', 344, 1),
(600, 'Kachua', 'কচুয়া', 344, 1),
(601, 'Shahrasti', 'শাহরাস্তি', 344, 1),
(602, 'Matlabsouth', 'মতলব', 344, 1),
(603, 'Matlabnorth', 'মতলব', 344, 1),
(604, 'Faridgonj', 'ফরিদগঞ্জ', 344, 1),
(605, 'Kamalnagar', 'কমলনগর ', 368, 1),
(614, 'Coxsbazar', 'কক্সবাজার', NULL, 1),
(615, 'Coxsbazar Sadar', 'কক্সবাজার সদর', 614, 1),
(616, 'Chakaria', 'চকরিয়া', 614, 1),
(617, 'Kutubdia', 'কুতুবদিয়া', 614, 1),
(618, 'Ukhiya', ' উখিয়া', 614, 1),
(619, 'Moheshkhali', ' মহেশখালী', 614, 1),
(620, 'Pekua', ' পেকুয়া', 614, 1),
(621, 'Ramu', ' রামু', 614, 1),
(622, 'Teknaf', ' টেকনাফ', 614, 1),
(623, 'Sadar', 'খাগড়াছড়ি সদর', 361, 1),
(624, 'Dighinala', ' দিঘীনালা', 361, 1),
(625, 'Panchari', ' পানছড়ি', 361, 1),
(626, 'Laxmichhari', ' লক্ষীছড়ি', 361, 1),
(627, 'Mohalchari', ' মহালছড়ি', 361, 1),
(628, 'Manikchari', ' মানিকছড়ি', 361, 1),
(629, 'Ramgarh', ' রামগড়', 361, 1),
(630, 'Matiranga', ' মাটিরাঙ্গা', 361, 1),
(631, 'Guimara', ' গুইমারা', 361, 1),
(632, 'Sadar', 'বান্দরবান সদর', 338, 1),
(633, 'Alikadam', ' আলীকদম', 338, 1),
(634, 'Naikhongchhari', ' নাইক্ষ্যংছড়ি', 338, 1),
(635, 'Rowangchhari', ' রোয়াংছড়ি', 338, 1),
(636, 'Lama', ' লামা', 338, 1),
(637, 'Ruma', ' রুমা', 338, 1),
(638, 'Thanchi', ' থানচি', 338, 1),
(639, 'Rajshahi City', 'রাজশাহী সিটি', 391, 1),
(640, 'Nator Sadar', 'নাটোর সদর', 380, 1),
(641, 'Singra', ' সিংড়া', 380, 1),
(642, 'Baraigram', ' বড়াইগ্রাম', 380, 1),
(643, 'Bagatipara', 'বাগাতিপাড়া', 380, 1),
(644, 'Lalpur', 'লালপুর', 380, 1),
(645, 'Gurudaspur', 'গুরুদাসপুর', 380, 1),
(646, 'Naldanga', 'নলডাঙ্গা', 380, 1),
(647, 'Belkuchi', 'বেলকুচি', 398, 1),
(648, 'Chauhali', 'চৌহালি', 398, 1),
(649, 'Kamarkhand', 'কামারখন্দ', 398, 1),
(650, 'Kazipur', 'কাজীপুর', 398, 1),
(651, 'Raigonj', 'রায়গঞ্জ', 398, 1),
(652, 'Shahjadpur', 'শাহজাদপুর', 398, 1),
(653, 'Sirajganjsadar', 'সিরাজগঞ্জ', 398, 1),
(654, 'Tarash', 'তাড়াশ', 398, 1),
(655, 'Ullapara', 'উল্লাপাড়া', 398, 1),
(656, 'Sujanagar', 'সুজানগর', 386, 1),
(657, 'Pabnasadar', 'পাবনা সদর', 386, 1),
(658, 'Atghoria', 'আটঘরিয়া', 386, 1),
(659, 'Chatmohar', 'চাটমোহর', 386, 1),
(660, 'Santhia', 'সাঁথিয়া', 386, 1),
(661, 'Faridpur Upazila', 'ফরিদপুর', 386, 1),
(662, 'Kahaloo', 'কাহালু উপজেলা', 342, 1),
(663, 'Shariakandi', 'সারিয়াকান্দি', 342, 1),
(664, 'Shajahanpur', 'শাজাহানপুর', 342, 1),
(665, 'Dupchanchia', 'দুপচাচিঁয়া', 342, 1),
(666, 'Adamdighi', 'আদমদিঘি', 342, 1),
(667, 'Nondigram', 'নন্দিগ্রাম', 342, 1),
(668, 'Sonatala', 'সোনাতলা', 342, 1),
(669, 'Dhunot', 'ধুনট', 342, 1),
(670, 'Gabtali', 'গাবতলী', 342, 1),
(671, 'Shibganj', 'শিবগঞ্জ', 342, 1),
(672, 'Joypurhat', 'জয়পুরহাট', NULL, 1),
(673, 'Akkelpur', 'আক্কেলপুর', 672, 1),
(674, 'Kalai', 'কালাই', 672, 1),
(675, 'Khetlal', 'ক্ষেতলাল', 672, 1),
(676, 'Panchbibi', 'পাঁচবিবি', 672, 1),
(677, 'Joypurhatsadar', 'জয়পুরহাট সদর', 672, 1),
(678, 'Chapainawabganj', 'চাঁপাইনবাবগঞ্জ', NULL, 1),
(679, 'Chapainawabganjsadar', 'চাঁপাইনবাবগঞ্জ সদর', 678, 1),
(680, 'Gomostapur', 'গোমস্তাপুর', 678, 1),
(681, 'Nachol', 'নাচোল', 678, 1),
(682, 'Bholahat', 'ভোলাহাট', 678, 1),
(683, 'Shibganj', 'শিবগঞ্জ', 678, 1),
(684, 'Naogaon', 'নওগাঁ', NULL, 1),
(685, 'Mohadevpur', 'মহাদেবপুর', 684, 1),
(686, 'Badalgachi', 'বদলগাছী', 684, 1),
(687, 'Patnitala', 'পত্নিতলা', 684, 1),
(688, 'Dhamoirhat', 'ধামইরহাট', 684, 1),
(689, 'Niamatpur', 'নিয়ামতপুর', 684, 1),
(690, 'Manda', 'মান্দা', 684, 1),
(691, 'Atrai', 'আত্রাই', 684, 1),
(692, 'Raninagar', 'রাণীনগর', 684, 1),
(693, 'Naogaonsadar', 'নওগাঁ সদর', 684, 1),
(694, 'Porsha', 'পোরশা', 684, 1),
(695, 'Sapahar', 'সাপাহার', 684, 1),
(696, 'Jashore', 'যশোর', NULL, 1),
(697, 'Manirampur', 'মণিরামপুর', 696, 1),
(698, 'Abhaynagar', 'অভয়নগর', 696, 1),
(699, 'Bagherpara', 'বাঘারপাড়া', 696, 1),
(700, 'Chougachha', 'চৌগাছা', 696, 1),
(701, 'Jhikargacha', 'ঝিকরগাছা', 696, 1),
(702, 'Keshabpur', 'কেশবপুর', 696, 1),
(703, 'Sadar', 'যশোর সদর', 696, 1),
(704, 'Sharsha', 'শার্শা', 696, 1),
(705, 'Assasuni', 'আশাশুনি', 394, 1),
(706, 'Debhata', 'দেবহাটা', 394, 1),
(707, 'Kalaroa', 'কলারোয়া', 394, 1),
(708, 'Shyamnagar', 'শ্যামনগর', 394, 1),
(709, 'Tala', 'তালা', 394, 1),
(710, 'Kaliganj', 'কালিগঞ্জ', 394, 1),
(711, 'Mujibnagar', 'মুজিবনগর', 375, 1),
(712, 'Gangni', 'গাংনী', 375, 1),
(713, 'Narail', 'নড়াইল', NULL, 1),
(714, 'Narailsadar', 'নড়াইল সদর', 713, 1),
(715, 'Lohagara', 'লোহাগড়া', 713, 1),
(716, 'Kalia', 'কালিয়া', 713, 1),
(717, 'Jibannagar', 'জীবননগর', 347, 1),
(718, 'Kumarkhali', 'কুমারখালী', 367, 1),
(719, 'Khoksa', 'খোকসা', 367, 1),
(720, 'Mirpur', 'মিরপুর', 367, 1),
(721, 'Daulatpur', 'দৌলতপুর', 367, 1),
(722, 'Shalikha', 'শালিখা', 371, 1),
(723, 'Sreepur', 'শ্রীপুর', 371, 1),
(724, 'Magura Sadar', 'মাগুরা সদর', 371, 1),
(725, 'Mohammadpur', 'মহম্মদপুর', 371, 1),
(726, 'Paikgasa', 'পাইকগাছা', 362, 1),
(727, 'Fultola', 'ফুলতলা', 362, 1),
(728, 'Digholia', 'দিঘলিয়া', 362, 1),
(729, 'Rupsha', 'রূপসা', 362, 1),
(730, 'Terokhada', 'তেরখাদা', 362, 1),
(731, 'Dumuria', 'ডুমুরিয়া', 362, 1),
(732, 'Botiaghata', 'বটিয়াঘাটা', 362, 1),
(733, 'Dakop', 'দাকোপ', 362, 1),
(734, 'Koyra', 'কয়রা', 362, 1),
(735, 'Fakirhat', 'ফকিরহাট', 337, 1),
(736, 'Sadar', 'বাগেরহাট সদর', 337, 1),
(737, 'Mollahat', 'মোল্লাহাট', 337, 1),
(738, 'Sarankhola', 'শরণখোলা', 337, 1),
(739, 'Rampal', 'রামপাল', 337, 1),
(740, 'Morrelganj', 'মোড়েলগঞ্জ', 337, 1),
(741, 'Kachua', 'কচুয়া', 337, 1),
(742, 'Mongla', 'মোংলা', 337, 1),
(743, 'Chitalmari', 'চিতলমারী', 337, 1),
(744, 'Jhenaidah', 'ঝিনাইদহ', NULL, 1),
(745, 'Jhenaidah Sadar', 'ঝিনাইদহ সদর', 744, 1),
(746, 'Shailkupa', 'শৈলকুপা', 744, 1),
(747, 'Harinakundu', 'হরিণাকুন্ডু', 744, 1),
(748, 'Kaliganj', 'কালীগঞ্জ', 744, 1),
(749, 'Kotchandpur', 'কোটচাঁদপুর', 744, 1),
(750, 'Moheshpur', 'মহেশপুর', 744, 1),
(751, 'Jhalakathi', 'ঝালকাঠি', NULL, 1),
(752, 'Jhalakathi Sadar', 'ঝালকাঠি সদর', 751, 1),
(753, 'Kathalia', 'কাঠালিয়া', 751, 1),
(754, 'Nalchity', 'নলছিটি', 751, 1),
(755, 'Rajapur', 'রাজাপুর', 751, 1),
(756, 'Bauphal', 'বাউফল', 388, 1),
(757, 'Patuakhali Sadar', 'পটুয়াখালী সদর', 388, 1),
(758, 'Dumki', 'দুমকি', 388, 1),
(759, 'Dashmina', 'দশমিনা', 388, 1),
(760, 'Kalapara', 'কলাপাড়া', 388, 1),
(761, 'Mirzaganj', 'মির্জাগঞ্জ', 388, 1),
(762, 'Galachipa', 'গলাচিপা', 388, 1),
(763, 'Rangabali', 'রাঙ্গাবালী', 388, 1),
(764, 'Nazirpur', 'নাজিরপুর', 389, 1),
(765, 'Kawkhali', 'কাউখালী', 389, 1),
(766, 'Indurkani', 'ইন্দুরকানী', 389, 1),
(767, 'Bakerganj', 'বাকেরগঞ্জ', 340, 1),
(768, 'Babuganj', 'বাবুগঞ্জ', 340, 1),
(769, 'Wazirpur', 'উজিরপুর ', 340, 1),
(770, 'Banaripara', 'বানারীপাড়া', 340, 1),
(771, 'Gournadi', 'গৌরনদী', 340, 1),
(772, 'Agailjhara', 'আগৈলঝাড়া', 340, 1),
(773, 'Muladi', 'মুলাদী ', 340, 1),
(774, 'Hizla', 'হিজলা', 340, 1),
(781, 'Borhanuddin', 'বোরহান উদ্দিন', 341, 1),
(782, 'Charfesson', 'চরফ্যাশন', 341, 1),
(783, 'Doulatkhan', 'দৌলতখান', 341, 1),
(784, 'Monpura', 'মনপুরা', 341, 1),
(785, 'Tazumuddin', 'তজুমদ্দিন', 341, 1),
(786, 'Amtali', 'আমতলী', 339, 1),
(787, 'Barguna Sadar', 'বরগুনা সদর', 339, 1),
(788, 'Betagi', 'বেতাগী উপজেলা', 339, 1),
(789, 'Bamna', 'বামনা', 339, 1),
(790, 'Pathorghata', 'পাথরঘাটা', 339, 1),
(791, 'Taltali', 'তালতলি', 339, 1),
(792, 'Sylhet', 'সিলেট', NULL, 1),
(793, 'Balaganj', 'বালাগঞ্জ', 792, 1),
(794, 'Beanibazar', 'বিয়ানীবাজার', 792, 1),
(795, 'Bishwanath', 'বিশ্বনাথ', 792, 1),
(796, 'Companiganj', 'কোম্পানীগঞ্জ', 792, 1),
(797, 'Fenchuganj', 'ফেঞ্চুগঞ্জ', 792, 1),
(798, 'Golapganj', 'গোলাপগঞ্জ', 792, 1),
(799, 'Gowainghat', 'গোয়াইনঘাট', 792, 1),
(800, 'Jaintiapur', 'জৈন্তাপুর', 792, 1),
(801, 'Kanaighat', 'কানাইঘাট', 792, 1),
(802, 'Sylhetsadar', 'সিলেট সদর', 792, 1),
(803, 'Zakiganj', 'জকিগঞ্জ', 792, 1),
(804, 'Dakshinsurma', 'দক্ষিণ সুরমা', 792, 1),
(805, 'Osmaninagar', 'ওসমানী', 792, 1),
(806, 'Moulvibazar', 'মৌলভীবাজার', NULL, 1),
(807, 'Barlekha', 'বড়লেখা', 806, 1),
(808, 'Kamolganj', 'কমলগঞ্জ', 806, 1),
(809, 'Kulaura', 'কুলাউড়া', 806, 1),
(810, 'Moulvibazarsadar', 'মৌলভীবাজার সদর', 806, 1),
(811, 'Rajnagar', 'রাজনগর', 806, 1),
(812, 'Sreemangal', 'শ্রীমঙ্গল', 806, 1),
(813, 'Juri', 'জুড়ী', 806, 1),
(814, 'Nabiganj', 'নবীগঞ্জ', 355, 1),
(815, 'Bahubal', 'বাহুবল', 355, 1),
(816, 'Ajmiriganj', 'আজমিরীগঞ্জ', 355, 1),
(817, 'Baniachong', 'বানিয়াচং', 355, 1),
(818, 'Lakhai', 'লাখাই', 355, 1),
(819, 'Chunarughat', 'চুনারুঘাট', 355, 1),
(820, 'Madhabpur', 'মাধবপুর উপজেলা', 355, 1),
(821, 'Shayestaganj', 'শায়েস্তাগঞ্জ', 355, 1),
(822, 'Southsunamganj', 'দক্ষিণ সুনামগঞ্জ', 399, 1),
(823, 'Bishwambarpur', 'বিশ্বম্ভরপুর', 399, 1),
(824, 'Jagannathpur', 'জগন্নাথপুর', 399, 1),
(825, 'Dowarabazar', 'দোয়ারাবাজার', 399, 1),
(826, 'Tahirpur', 'তাহিরপুর', 399, 1),
(827, 'Dharmapasha', 'ধর্মপাশা', 399, 1),
(828, 'Jamalganj', 'জামালগঞ্জ', 399, 1),
(829, 'Shalla', 'শাল্লা', 399, 1),
(830, 'Derai', 'দিরাই', 399, 1),
(831, 'Madhyanagar', 'মধ্যনগর', 399, 1),
(832, 'Belabo', 'বেলাবো', 379, 1),
(833, 'Monohardi', 'মনোহরদী', 379, 1),
(834, 'Narsingdisadar', 'নরসিংদী', 379, 1),
(835, 'Palash', 'পলাশ', 379, 1),
(836, 'Raipura', 'রায়পুরা', 379, 1),
(837, 'Shibpur', 'শিবপুর', 379, 1),
(838, 'Kaliganj', 'কালীগঞ্জ', 353, 1),
(839, 'Kaliakair', 'কালিয়াকৈর', 353, 1),
(840, 'Kapasia', 'কাপাসিয়া', 353, 1),
(841, 'Sreepur', 'শ্রীপুর', 353, 1),
(842, 'Naria', 'নড়িয়া', 395, 1),
(843, 'Zajira', 'জাজিরা', 395, 1),
(844, 'Gosairhat', 'গোসাইরহাট', 395, 1),
(845, 'Bhedarganj', 'ভেদরগঞ্জ', 395, 1),
(846, 'Damudya', 'ডামুড্যা', 395, 1),
(847, 'Araihazar', 'আড়াইহাজার', 378, 1),
(848, 'Bandar', 'বন্দর উপজেলা', 378, 1),
(849, 'Sonargaon', 'সোনারগাঁ উপজেলা', 378, 1),
(850, 'Basail', 'বাসাইল', 400, 1),
(851, 'Bhuapur', 'ভুয়াপুর', 400, 1),
(852, 'Delduar', 'দেলদুয়ার', 400, 1),
(853, 'Ghatail', 'ঘাটাইল', 400, 1),
(854, 'Madhupur', 'মধুপুর', 400, 1),
(855, 'Nagarpur', 'নাগরপুর', 400, 1),
(856, 'Kalihati', 'কালিহাতী', 400, 1),
(857, 'Dhanbari', 'ধনবাড়ী', 400, 1),
(858, 'Katiadi', 'কটিয়াদী', 363, 1),
(859, 'Bhairab', 'ভৈরব', 363, 1),
(860, 'Tarail', 'তাড়াইল', 363, 1),
(861, 'Hossainpur', 'হোসেনপুর', 363, 1),
(862, 'Pakundia', 'পাকুন্দিয়া', 363, 1),
(863, 'Kuliarchar', 'কুলিয়ারচর', 363, 1),
(864, 'Karimgonj', 'করিমগঞ্জ', 363, 1),
(865, 'Austagram', 'অষ্টগ্রাম', 363, 1),
(866, 'Mithamoin', 'মিঠামইন', 363, 1),
(867, 'Nikli', 'নিকলী', 363, 1),
(868, 'Harirampur', 'হরিরামপুর', 373, 1),
(869, 'Saturia', 'সাটুরিয়া', 373, 1),
(870, 'Manikganj Sadar', 'মানিকগঞ্জ সদর', 373, 1),
(871, 'Gior', 'ঘিওর', 373, 1),
(872, 'Shibaloy', 'শিবালয়', 373, 1),
(873, 'Doulatpur', 'দৌলতপুর', 373, 1),
(874, 'Singiar', 'সিংগাইর', 373, 1),
(875, 'Savar', 'সাভার', 348, 1),
(876, 'Keraniganj', 'কেরাণীগঞ্জ', 348, 1),
(877, 'Nawabganj', 'নবাবগঞ্জ', 348, 1),
(878, 'Sreenagar', 'শ্রীনগর', 376, 1),
(879, 'Sirajdikhan', 'সিরাজদিখান', 376, 1),
(880, 'Louhajanj', 'লৌহজং', 376, 1),
(881, 'Gajaria', 'গজারিয়া', 376, 1),
(882, 'Tongibari', 'টংগীবাড়ি', 376, 1),
(883, 'Goalanda', 'গোয়ালন্দ', 390, 1),
(884, 'Pangsa', 'পাংশা', 390, 1),
(885, 'Baliakandi', 'বালিয়াকান্দি', 390, 1),
(886, 'Kalukhali', 'কালুখালী', 390, 1),
(887, 'Shibchar', 'শিবচর', 370, 1),
(888, 'Kalkini', 'কালকিনি', 370, 1),
(889, 'Rajoir', 'রাজৈর', 370, 1),
(890, 'Dasar', 'ডাসার', 370, 1),
(891, 'Kashiani', 'কাশিয়ানী', 354, 1),
(892, 'Tungipara', 'টুংগীপাড়া', 354, 1),
(893, 'Kotalipara', 'কোটালীপাড়া', 354, 1),
(894, 'Muksudpur', 'মুকসুদপুর', 354, 1),
(895, 'Alfadanga', 'আলফাডাঙ্গা', 350, 1),
(896, 'Boalmari', 'বোয়ালমারী', 350, 1),
(897, 'Sadarpur', 'সদরপুর', 350, 1),
(898, 'Nagarkanda', 'নগরকান্দা', 350, 1),
(899, 'Charbhadrasan', 'চরভদ্রাসন', 350, 1),
(900, 'Madhukhali', 'মধুখালী', 350, 1),
(901, 'Saltha', 'সালথা', 350, 1),
(902, 'Debiganj', 'দেবীগঞ্জ', 387, 1),
(903, 'Boda', 'বোদা', 387, 1),
(904, 'Atwari', 'আটোয়ারী', 387, 1),
(905, 'Tetulia', 'তেতুলিয়া', 387, 1),
(906, 'Nawabganj', 'নবাবগঞ্জ', 349, 1),
(907, 'Birganj', 'বীরগঞ্জ উপজেলা', 349, 1),
(908, 'Ghoraghat', 'ঘোড়াঘাট', 349, 1),
(909, 'Birampur', 'বিরামপুর', 349, 1),
(910, 'Bochaganj', 'বোচাগঞ্জ', 349, 1),
(911, 'Kaharol', 'কাহারোল', 349, 1),
(912, 'Hakimpur', 'হাকিমপুর', 349, 1),
(913, 'Khansama', 'খানসামা', 349, 1),
(914, 'Birol', 'বিরল', 349, 1),
(915, 'Chirirbandar', 'চিরিরবন্দর', 349, 1),
(916, 'Lalmonirhat Sadar', 'লালমনিরহাট সদর', 369, 1),
(917, 'Kaliganj', 'কালীগঞ্জ', 369, 1),
(918, 'Hatibandha', 'হাতীবান্ধা', 369, 1),
(919, 'Patgram', 'পাটগ্রাম', 369, 1),
(920, 'Aditmari', 'আদিতমারী', 369, 1),
(921, 'Syedpur', 'সৈয়দপুর উপজেলা', 384, 1),
(922, 'Dimla', 'ডিমলা', 384, 1),
(923, 'Jaldhaka', 'জলঢাকা', 384, 1),
(924, 'Kishorganj Upazila', 'কিশোরগঞ্জ', 384, 1),
(925, 'Gaibandha', 'গাইবান্ধা', NULL, 1),
(926, 'Sadullapur', 'সাদুল্লাপুর', 925, 1),
(927, 'Gaibandha Sadar', 'গাইবান্ধা সদর', 925, 1),
(928, 'Palashbari', 'পলাশবাড়ী', 925, 1),
(929, 'Saghata', 'সাঘাটা উপজেলা', 925, 1),
(930, 'Gobindaganj', 'গোবিন্দগঞ্জ উপজেলা', 925, 1),
(931, 'Sundarganj', 'সুন্দরগঞ্জ', 925, 1),
(932, 'Phulchari', 'ফুলছড়ি', 925, 1),
(933, 'Ranisankail', 'রাণীশংকৈল উপজেলা', 401, 1),
(934, 'Haripur', 'হরিপুর উপজেলা', 401, 1),
(935, 'Baliadangi', 'বালিয়াডাঙ্গী', 401, 1),
(936, 'Gangachara', 'গংগাচড়া', 393, 1),
(937, 'Taragonj', 'তারাগঞ্জ', 393, 1),
(938, 'Badargonj', 'বদরগঞ্জ', 393, 1),
(939, 'Mithapukur', 'মিঠাপুকুর', 393, 1),
(940, 'Pirgonj', 'পীরগঞ্জ', 393, 1),
(941, 'Pirgacha', 'পীরগাছা', 393, 1),
(942, 'Bhurungamari', 'ভুরুঙ্গামারী', 366, 1),
(943, 'Phulbari', 'ফুলবাড়ী', 366, 1),
(944, 'Rajarhat', 'রাজারহাট', 366, 1),
(945, 'Rowmari', 'রৌমারী', 366, 1),
(946, 'Charrajibpur', 'চর রাজিবপুর', 366, 1),
(947, 'Sreebordi', 'শ্রীবরদী উপজেলা', 396, 1),
(948, 'Nokla', 'নকলা উপজেলা', 396, 1),
(949, 'Jhenaigati', 'ঝিনাইগাতী উপজেলা', 396, 1),
(950, 'Mymensingh', 'ময়মনসিংহ', NULL, 1),
(951, 'Fulbaria', 'ফুলবাড়ীয়া', 950, 1),
(952, 'Trishal', 'ত্রিশাল', 950, 1),
(953, 'Bhaluka', 'ভালুকা', 950, 1),
(954, 'Muktagacha', 'মুক্তাগাছা', 950, 1),
(955, 'Mymensingh Sadar', 'ময়মনসিংহ সদর', 950, 1),
(956, 'Dhobaura', 'ধোবাউড়া', 950, 1),
(957, 'Phulpur', 'ফুলপুর', 950, 1),
(958, 'Haluaghat', 'হালুয়াঘাট', 950, 1),
(959, 'Gouripur', 'গৌরীপুর', 950, 1),
(960, 'Gafargaon', 'গফরগাঁও', 950, 1),
(961, 'Iswarganj', 'ঈশ্বরগঞ্জ', 950, 1),
(962, 'Nandail', 'নান্দাইল', 950, 1),
(963, 'Tarakanda', 'তারাকান্দা', 950, 1),
(964, 'Melandah', 'মেলান্দহ', 357, 1),
(965, 'Islampur', 'ইসলামপুর', 357, 1),
(966, 'Dewangonj', 'দেওয়ানগঞ্জ', 357, 1),
(967, 'Madarganj', 'মাদারগঞ্জ', 357, 1),
(968, 'Bokshiganj', 'বকশীগঞ্জ', 357, 1),
(969, 'Barhatta', 'বারহাট্টা', 383, 1),
(970, 'Durgapur', 'দুর্গাপুর', 383, 1),
(971, 'Kendua', 'কেন্দুয়া', 383, 1),
(972, 'Atpara', 'আটপাড়া', 383, 1),
(973, 'Madan', 'মদন', 383, 1),
(974, 'Khaliajuri', 'খালিয়াজুরী', 383, 1),
(975, 'Kalmakanda', 'কলমাকান্দা', 383, 1),
(976, 'Mohongonj', 'মোহনগঞ্জ', 383, 1),
(977, 'Purbadhala', 'পূর্বধলা', 383, 1),
(993, 'Rangunia', 'রাঙ্গুনিয়া', 345, 1),
(994, 'Sitakunda', 'সীতাকুন্ড উপজেলা', 345, 1),
(995, 'Mirsharai', 'মীরসরাই', 345, 1),
(996, 'Patiya', 'পটিয়া', 345, 1),
(997, 'Sandwip', 'সন্দ্বীপ', 345, 1),
(998, 'Banshkhali', 'বাঁশখালী', 345, 1),
(999, 'Boalkhali', 'বোয়ালখালী', 345, 1),
(1000, 'Anwara', 'আনোয়ারা', 345, 1),
(1001, 'Chandanaish', 'চন্দনাইশ', 345, 1),
(1002, 'Satkania', 'সাতকানিয়া', 345, 1),
(1003, 'Lohagara', 'লোহাগাড়া', 345, 1),
(1004, 'Hathazari', 'হাটহাজারী', 345, 1),
(1005, 'Fatikchhari', 'ফটিকছড়ি', 345, 1),
(1006, 'Raozan', 'রাউজান', 345, 1),
(1007, 'Karnafuli', 'কর্ণফুলী', 345, 1),
(1008, 'Begumganj', 'বেগমগঞ্জ', 385, 1),
(1009, 'Senbug', 'সেনবাগ', 385, 1),
(1010, 'Raipur', 'রায়পুর', 368, 1),
(1017, 'Jashore Sadar', 'যশোর সদর', 696, 1);

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint UNSIGNED NOT NULL,
  `branch_id` int UNSIGNED DEFAULT NULL,
  `menu_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `branch_id`, `menu_id`, `Title`, `created_at`, `updated_at`) VALUES
(1, 1, 'main', 'Main Menu', '2020-10-13 20:09:24', '2020-10-13 20:09:24'),
(2, 1, 'social', 'Social', '2020-11-10 22:52:41', '2020-11-10 22:52:41'),
(3, 1, 'footer-menu', 'Footer Menu', '2021-10-12 09:06:23', '2021-10-12 09:06:23'),
(4, 1, 'footer-menu2', 'Footer Menu', '2021-10-12 09:57:49', '2021-10-12 09:57:49'),
(5, 1, 'categories', 'Category Menu', '2023-08-16 04:42:37', '2023-08-16 04:42:37'),
(6, 2, 'main', 'Top Menu', '2023-08-16 04:48:44', '2023-08-16 04:48:44'),
(7, 1, 'lebel', 'Lebel', '2023-08-16 05:25:11', '2023-08-16 05:25:11');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` bigint UNSIGNED NOT NULL,
  `menu_id` smallint UNSIGNED NOT NULL,
  `lebel` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu_url` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_class` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu_role` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` mediumint UNSIGNED DEFAULT NULL,
  `sl` mediumint UNSIGNED NOT NULL DEFAULT '0',
  `loged_in` tinyint DEFAULT '0',
  `menuType` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `lebel`, `menu_url`, `menu_class`, `menu_role`, `parent_id`, `sl`, `loged_in`, `menuType`) VALUES
(1, 1, 'Home', '/', 'fa fa-home', NULL, NULL, 0, 0, 'home'),
(3, 1, 'Electronics', 'category/electronics', NULL, NULL, 2, 2, 0, 'others'),
(4, 1, 'Nut', 'category/nut', NULL, NULL, 2, 1, 0, 'others'),
(5, 1, 'Cart', '/cart', NULL, NULL, 35, 5, 0, 'others'),
(7, 1, 'About', '/page/about-us', NULL, NULL, NULL, 1, 0, 'others'),
(9, 2, 'facebook', 'https://facebook.com', 'fa-facebook-f', NULL, NULL, 0, 0, 'extrenal'),
(10, 2, 'twitter', 'https://twitter.com', 'fa-twitter', NULL, NULL, 2, 0, 'extrenal'),
(11, 2, 'linkedin', 'https://www.linkedin.com', 'fa-linkedin-in', NULL, NULL, 1, 0, 'extrenal'),
(12, 2, 'instagram', 'https://www.instagram.com', 'fa-instagram', NULL, NULL, 3, 0, 'extrenal'),
(13, 3, 'About', 'page/about-us', NULL, NULL, NULL, 0, 0, 'others'),
(15, 3, 'terms and condition', '#', NULL, NULL, NULL, 0, 0, 'others'),
(16, 4, 'terms and condition', '#', NULL, NULL, NULL, 0, 0, 'others'),
(17, 4, 'terms and condition 2', '#', NULL, NULL, NULL, 0, 0, 'others'),
(21, 5, 'Shirts', 'category/shirt', NULL, NULL, NULL, 0, 0, 'others'),
(23, 6, 'About', 'page/about-us', NULL, NULL, NULL, 0, 0, 'others'),
(24, 6, 'Contact', 'page/contact', NULL, NULL, NULL, 1, 0, 'others'),
(25, 7, 'Quality Product', '#', 'fab fa-cc-mastercard', NULL, NULL, 0, 0, 'others'),
(26, 7, 'First Delivery', '#', 'fa fa-truck', NULL, NULL, 1, 0, 'others'),
(27, 7, '14-Day Return', '#', 'fa fa-sync-alt', NULL, NULL, 2, 0, 'others'),
(28, 7, '24/7 Support', '#', 'fa fa-comments', NULL, NULL, 3, 0, 'others'),
(29, 5, 'Electronics', 'category/electronics', NULL, NULL, NULL, 0, 0, 'others'),
(30, 1, 'Checkout', '/checkout', NULL, NULL, 35, 7, 0, 'others'),
(31, 1, 'Contact', '/page/contact', NULL, NULL, NULL, 6, 0, 'others'),
(32, 5, 'Automotive & Motorbike', 'category/automotive-motorbike', 'fa fa-shopping-bag', NULL, NULL, 0, 0, 'others'),
(33, 1, 'Teachers', '/section/teacher', NULL, NULL, NULL, 3, 0, 'others'),
(34, 1, 'Notice', '/section/notice', NULL, NULL, NULL, 2, 0, 'others'),
(35, 1, 'Shop', '#', NULL, NULL, NULL, 4, 0, 'others');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_05_19_103751_create_roles_table', 1),
(5, '2020_05_19_193413_create_permissions_table', 1),
(8, '2020_05_19_230503_create_roles_permissions_table', 1),
(24, '2020_05_19_194259_create_users_roles_table', 2),
(25, '2020_05_19_224316_create_users_permissions_table', 2),
(35, '2021_03_18_103610_create_sessions_table', 4),
(53, '2021_09_03_191526_add_banned_till_to_users_table', 11),
(78, '2022_03_06_143532_create_locations_table', 25),
(80, '2022_03_09_100940_create_languages_table', 27),
(82, '2022_09_20_152731_create_departments_table', 28),
(83, '2022_09_20_153952_create_semesters_table', 28),
(84, '2022_09_20_154036_create_students_table', 28),
(85, '2022_09_20_154225_create_courses_table', 28),
(86, '2022_09_20_154502_create_invoices_table', 29),
(87, '2022_09_20_074959_create_invoice_heads_table', 30),
(88, '2022_09_20_154518_create_invoice_items_table', 30),
(89, '2022_09_20_154539_create_invoice_payments_table', 30),
(90, '2022_10_08_195537_create_student_payments_table', 31),
(91, '2022_10_08_200246_create_student_marks_table', 31),
(92, '2022_11_04_190104_create_academic_years_table', 32),
(93, '2024_01_09_091506_create_exam_titles_table', 33),
(94, '2024_01_09_092043_create_exam_students_table', 33),
(95, '2024_01_16_192021_create_exam_halls_table', 34),
(96, '2024_06_21_155213_create_admission_classes_table', 35),
(104, '2024_06_21_283357_create_admissions_table', 36),
(105, '2024_06_21_362931_create_admission_payments_table', 36),
(106, '2024_07_16_074538_create_admission_results_table', 37),
(107, '2024_07_27_185408_create_admission_trades_table', 38),
(108, '2019_12_14_000001_create_personal_access_tokens_table', 39),
(109, '2024_11_03_164245_create_admission_quotas_table', 40),
(110, '2024_11_06_110547_create_admission_selected_trades_table', 41),
(111, '2024_11_23_174454_create_branches_table', 42),
(112, '2024_11_26_154541_create_attendances_table', 43),
(113, '2014_10_12_100000_create_password_reset_tokens_table', 44),
(115, '2024_11_29_182335_create_shifts_table', 45),
(116, '2024_11_29_183949_create_sections_table', 46),
(117, '2024_11_29_185021_create_groups_table', 47),
(118, '2024_11_29_190015_create_categories_table', 47),
(119, '2024_11_29_195943_create_class_configs_table', 48),
(120, '2024_11_29_200008_create_group_configs_table', 48),
(121, '2024_12_03_185947_create_exan_lists_table', 49),
(122, '2024_12_03_190019_create_exan_subjects_table', 49),
(123, '2024_12_04_134940_create_exam_short_code_lists_table', 50),
(124, '2024_12_04_134958_create_exam_short_code_defaults_table', 50),
(125, '2024_12_04_164110_create_exam_grades_table', 51),
(126, '2024_12_04_164132_create_exam_grade_defaults_table', 51),
(127, '2024_12_05_141341_create_exam_subject_configs_table', 52),
(128, '2024_12_05_142938_create_subject_types_table', 52),
(129, '2024_12_06_144851_create_merit_process_types_table', 53),
(130, '2024_12_06_145029_create_exam_configurations_table', 53),
(132, '2024_12_06_161154_create_final_mark_configs_table', 54),
(133, '2024_12_10_111006_create_exam_marks_table', 55),
(134, '2024_12_14_160940_create_student_ac_heads_table', 56),
(135, '2024_12_14_161639_create_student_ac_sub_heads_table', 56),
(136, '2024_12_14_161845_create_student_ac_fee_waivers_table', 56),
(137, '2024_12_14_162910_create_student_ac_sub_head_configs_table', 56),
(138, '2024_12_14_163333_create_student_ac_fee_configs_table', 56),
(139, '2024_12_14_163728_create_student_ac_time_configs_table', 56),
(140, '2024_12_14_163813_create_student_ac_free_waiver_configs_table', 56),
(141, '2025_01_12_070921_create_idcard_templates_table', 57),
(142, '2025_01_13_131408_create_exam_results_table', 58),
(143, '2025_01_14_135140_create_exam_result_tabulations_table', 59);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Create User', 'create-user', '2021-10-02 01:34:39', '2021-10-02 01:34:39'),
(2, 'User Permission', 'user-permission', '2021-10-02 01:34:39', '2021-10-02 01:34:39'),
(11, 'Patient Admission', 'patient-admission', '2022-03-09 16:03:17', '2022-03-09 16:03:17'),
(13, 'Create Bill', 'create-bill', '2022-03-09 16:03:17', '2022-03-09 16:03:17'),
(14, 'Create Pathology Bill', 'create-pathology-bill', '2022-03-09 16:03:57', '2022-03-09 16:03:57');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `postmetas`
--

CREATE TABLE `postmetas` (
  `id` bigint UNSIGNED NOT NULL,
  `post_id` int UNSIGNED NOT NULL,
  `meta_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED DEFAULT NULL,
  `title` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `body` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `image` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `post_type` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `pageTemplate` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` tinyint UNSIGNED DEFAULT '0',
  `user_id` int UNSIGNED NOT NULL,
  `status` tinyint UNSIGNED DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `branch_id`, `title`, `slug`, `body`, `image`, `post_type`, `pageTemplate`, `sort`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Class six Merit', 'class-six-merit', NULL, 'post_file/1731509849.pdf', 'result', NULL, NULL, 1, 1, '2024-11-13 14:57:29', '2024-11-13 14:57:30'),
(2, 1, 'Slide1', 'slide1', NULL, 'post_file/1732603142.jpg', 'slider', NULL, NULL, 1, 1, '2024-11-24 15:23:21', '2024-11-26 06:39:02'),
(3, 2, 'Slide1', 'slide12', NULL, 'post_file/1732461826.png', 'slider', NULL, NULL, 1, 1, '2024-11-24 15:23:46', '2024-11-24 15:23:46'),
(4, 1, 'About Us', 'about-us', '<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; border-radius: 0px !important; line-height: 30px; font-size: 20px; color: rgb(0, 0, 0); font-family: solaimanlipi, serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; text-align: justify;\">&#2453;&#2499;&#2487;&#2495; &#2451; &#2488;&#2509;&#2476;&#2480;&#2494;&#2487;&#2509;&#2463;&#2509;&#2480; &#2478;&#2472;&#2509;&#2468;&#2509;&#2480;&#2467;&#2494;&#2482;&#2527;&#2503;&#2480; &#2441;&#2474;&#2470;&#2503;&#2487;&#2509;&#2463;&#2494; &#2482;&#2503;&#2475;&#2463;&#2503;&#2472;&#2509;&#2479;&#2494;&#2472;&#2509;&#2463; &#2460;&#2503;&#2472;&#2494;&#2480;&#2503;&#2482; &#2478;&#2507;: &#2460;&#2494;&#2489;&#2494;&#2457;&#2509;&#2455;&#2496;&#2480; &#2438;&#2482;&#2478; &#2458;&#2508;&#2471;&#2497;&#2480;&#2496; &#2476;&#2482;&#2503;&#2459;&#2503;&#2472;, &#2453;&#2482;&#2503;&#2460;&#2503;&#2480; &#2488;&#2478;&#2488;&#2509;&#2479;&#2494; &#2438;&#2482;&#2507;&#2458;&#2472;&#2494; &#2453;&#2480;&#2503; &#2488;&#2478;&#2494;&#2471;&#2494;&#2472; &#2453;&#2480;&#2468;&#2503; &#2489;&#2476;&#2503;&#2404; &#2447;&#2460;&#2472;&#2509;&#2479; &#2438;&#2478;&#2494;&#2470;&#2503;&#2480; &#2486;&#2495;&#2453;&#2509;&#2487;&#2453;&#2480;&#2494; &#2480;&#2527;&#2503;&#2459;&#2503;&#2472;&#2404; &#2438;&#2478;&#2480;&#2494; &#2453;&#2507;&#2472;&#2507;&#2477;&#2494;&#2476;&#2503; &#2486;&#2495;&#2453;&#2509;&#2487;&#2494;&#2480;&#2509;&#2469;&#2496;&#2470;&#2503;&#2480; &#2438;&#2472;&#2509;&#2470;&#2507;&#2482;&#2472; &#2453;&#2464;&#2507;&#2480; &#2489;&#2527;&#2503; &#2470;&#2478;&#2472; &#2453;&#2480;&#2468;&#2503; &#2458;&#2494;&#2439; &#2472;&#2494;&#2404; &#2438;&#2482;&#2507;&#2458;&#2472;&#2494;&#2480; &#2478;&#2494;&#2471;&#2509;&#2479;&#2478;&#2503; &#2486;&#2494;&#2472;&#2509;&#2468;&#2495;&#2474;&#2498;&#2480;&#2509;&#2467;&#2477;&#2494;&#2476;&#2503; &#2488;&#2478;&#2494;&#2471;&#2494;&#2472;&#2503;&#2480; &#2458;&#2503;&#2487;&#2509;&#2463;&#2494; &#2453;&#2480;&#2459;&#2495;&#2404;<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; border-radius: 0px !important; line-height: 30px; font-size: 20px; color: rgb(0, 0, 0); font-family: solaimanlipi, serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; text-align: justify;\">&#2438;&#2460; &#2478;&#2457;&#2509;&#2455;&#2482;&#2476;&#2494;&#2480; &#2470;&#2497;&#2474;&#2497;&#2480;&#2503; &#2488;&#2497;&#2472;&#2494;&#2478;&#2455;&#2462;&#2509;&#2460;&#2503;&#2480; &#2468;&#2494;&#2489;&#2495;&#2480;&#2474;&#2497;&#2480;&#2503; &#2478;&#2494;&#2463;&#2495;&#2527;&#2494;&#2472; &#2489;&#2494;&#2451;&#2480; &#2474;&#2480;&#2495;&#2470;&#2480;&#2509;&#2486;&#2472;&#2503; &#2447;&#2488;&#2503; &#2468;&#2495;&#2472;&#2495; &#2447;&#2488;&#2476; &#2453;&#2469;&#2494; &#2476;&#2482;&#2503;&#2472;&#2404;</p><div class=\"ads\" style=\"box-sizing: border-box; margin: 0px; padding: 10px; border-radius: 0px !important; color: rgb(0, 0, 0); font-family: solaimanlipi, serif; font-size: 20px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; float: left;\"></div><p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; border-radius: 0px !important; line-height: 30px; font-size: 20px; color: rgb(0, 0, 0); font-family: solaimanlipi, serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; text-align: justify;\">&#2488;&#2524;&#2453; &#2437;&#2476;&#2480;&#2507;&#2471; &#2453;&#2480;&#2503; &#2460;&#2472;&#2477;&#2507;&#2455;&#2494;&#2472;&#2509;&#2468;&#2495; &#2488;&#2499;&#2487;&#2509;&#2463;&#2495; &#2472;&#2494; &#2453;&#2480;&#2494;&#2480; &#2438;&#2489;&#2509;&#2476;&#2494;&#2472; &#2460;&#2494;&#2472;&#2495;&#2527;&#2503; &#2441;&#2474;&#2470;&#2503;&#2487;&#2509;&#2463;&#2494; &#2476;&#2482;&#2503;&#2472;, &#2453;&#2503;&#2441; &#2480;&#2494;&#2488;&#2509;&#2468;&#2494;&#2527; &#2472;&#2494;&#2478;&#2494;&#2480; &#2474;&#2509;&#2480;&#2527;&#2507;&#2460;&#2472; &#2472;&#2503;&#2439;&#2404; &#2480;&#2494;&#2488;&#2509;&#2468;&#2494; &#2476;&#2509;&#2482;&#2453; &#2472;&#2494; &#2453;&#2480;&#2503; &#2488;&#2507;&#2489;&#2480;&#2494;&#2451;&#2479;&#2492;&#2494;&#2480;&#2509;&#2470;&#2496; &#2441;&#2470;&#2509;&#2479;&#2494;&#2472;&#2503; &#2447;&#2488;&#2503;&#2451; &#2470;&#2494;&#2476;&#2495; &#2460;&#2494;&#2472;&#2494;&#2468;&#2503; &#2474;&#2494;&#2480;&#2503;&#2472;&#2404; &#2438;&#2474;&#2494;&#2472;&#2494;&#2470;&#2503;&#2480; &#2474;&#2509;&#2480;&#2468;&#2495;&#2472;&#2495;&#2471;&#2495;&#2480;&#2494; &#2438;&#2478;&#2494;&#2470;&#2503;&#2480; &#2488;&#2494;&#2469;&#2503; &#2476;&#2488;&#2503; &#2488;&#2478;&#2488;&#2509;&#2479;&#2494; &#2472;&#2495;&#2527;&#2503; &#2438;&#2482;&#2494;&#2474; &#2453;&#2480;&#2468;&#2503; &#2474;&#2494;&#2480;&#2503;&#2472;&#2404; &#2476;&#2495;&#2477;&#2495;&#2472;&#2509;&#2472; &#2453;&#2482;&#2503;&#2460;&#2503;&#2480; &#2488;&#2478;&#2488;&#2509;&#2479;&#2494; &#2472;&#2495;&#2527;&#2503; &#2459;&#2494;&#2468;&#2509;&#2480; &#2474;&#2509;&#2480;&#2468;&#2495;&#2472;&#2495;&#2471;&#2495;&#2480;&#2494; &#2472;&#2495;&#2460;&#2503;&#2470;&#2503;&#2480; &#2478;&#2471;&#2509;&#2479;&#2503;&#2451; &#2438;&#2482;&#2494;&#2474; &#2438;&#2482;&#2507;&#2458;&#2472;&#2494; &#2453;&#2480;&#2468;&#2503; &#2474;&#2494;&#2480;&#2503;&#2472;&#2404;</p><p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; border-radius: 0px !important; line-height: 30px; font-size: 20px; color: rgb(0, 0, 0); font-family: solaimanlipi, serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; text-align: justify;\">&#2489;&#2494;&#2451;&#2480;&#2503;&#2480; &#2453;&#2499;&#2487;&#2495; &#2472;&#2495;&#2527;&#2503; &#2468;&#2495;&#2472;&#2495; &#2476;&#2482;&#2503;&#2472;, &#2453;&#2499;&#2487;&#2495; &#2474;&#2467;&#2509;&#2479;&#2503; &#2453;&#2499;&#2487;&#2453;&#2480;&#2494; &#2441;&#2474;&#2453;&#2499;&#2468; &#2489;&#2458;&#2509;&#2459;&#2503;&#2472; &#2453;&#2495; &#2472;&#2494; &#2488;&#2503;&#2463;&#2494; &#2470;&#2503;&#2454;&#2494;&#2480; &#2476;&#2495;&#2487;&#2527;&#2404; &#2453;&#2507;&#2472;&#2507; &#2478;&#2471;&#2509;&#2479;&#2488;&#2509;&#2476;&#2468;&#2509;&#2476;&#2477;&#2507;&#2455;&#2496; &#2479;&#2494;&#2468;&#2503; &#2488;&#2497;&#2476;&#2495;&#2471;&#2494; &#2472;&#2495;&#2468;&#2503; &#2472;&#2494; &#2474;&#2494;&#2480;&#2503; &#2488;&#2503;&#2463;&#2495;&#2451; &#2470;&#2503;&#2454;&#2468;&#2503; &#2489;&#2476;&#2503;&#2404;</p><div style=\"box-sizing: border-box; margin: 0px; padding: 10px; border-radius: 0px !important; color: rgb(0, 0, 0); font-family: solaimanlipi, serif; font-size: 20px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"></div><p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; border-radius: 0px !important; line-height: 30px; font-size: 20px; color: rgb(0, 0, 0); font-family: solaimanlipi, serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; text-align: justify;\">&#2453;&#2499;&#2487;&#2453;&#2470;&#2503;&#2480; &#2441;&#2470;&#2509;&#2470;&#2503;&#2486;&#2503; &#2441;&#2474;&#2470;&#2503;&#2487;&#2509;&#2463;&#2494; &#2476;&#2482;&#2503;&#2472;, &#2453;&#2499;&#2487;&#2453;&#2470;&#2503;&#2480; &#2458;&#2495;&#2472;&#2509;&#2468;&#2494;&#2480; &#2453;&#2507;&#2472;&#2507; &#2453;&#2494;&#2480;&#2467; &#2472;&#2503;&#2439;, &#2474;&#2480;&#2509;&#2479;&#2494;&#2474;&#2509;&#2468; &#2474;&#2480;&#2495;&#2478;&#2494;&#2467; &#2488;&#2494;&#2480; &#2451; &#2476;&#2496;&#2460; &#2478;&#2460;&#2497;&#2468; &#2438;&#2459;&#2503;&#2404; &#2438;&#2478;&#2480;&#2494; &#2488;&#2476; &#2488;&#2478;&#2527; &#2453;&#2499;&#2487;&#2453;&#2470;&#2503;&#2480; &#2474;&#2494;&#2486;&#2503; &#2469;&#2503;&#2453;&#2503; &#2447;&#2439; &#2476;&#2459;&#2480; &#2476;&#2507;&#2480;&#2507; &#2471;&#2494;&#2472; &#2456;&#2480;&#2503; &#2468;&#2497;&#2482;&#2476;&#2404;</p><div style=\"box-sizing: border-box; margin: 0px; padding: 10px; border-radius: 0px !important; color: rgb(0, 0, 0); font-family: solaimanlipi, serif; font-size: 20px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"><div id=\"div-ub-dailynayadiganta.com_1706868023779\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; border-radius: 0px !important;\"></div></div><p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; border-radius: 0px !important; line-height: 30px; font-size: 20px; color: rgb(0, 0, 0); font-family: solaimanlipi, serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; text-align: justify;\">&#2447; &#2488;&#2478;&#2527; &#2441;&#2474;&#2488;&#2509;&#2469;&#2495;&#2468; &#2459;&#2495;&#2482;&#2503;&#2472; &#2474;&#2480;&#2495;&#2476;&#2503;&#2486;, &#2476;&#2472; &#2451; &#2460;&#2482;&#2476;&#2494;&#2479;&#2492;&#2497; &#2474;&#2480;&#2495;&#2476;&#2480;&#2509;&#2468;&#2472; &#2478;&#2472;&#2509;&#2468;&#2509;&#2480;&#2467;&#2494;&#2482;&#2527; &#2447;&#2476;&#2434; &#2474;&#2494;&#2472;&#2495; &#2488;&#2478;&#2509;&#2474;&#2470; &#2478;&#2472;&#2509;&#2468;&#2509;&#2480;&#2467;&#2494;&#2482;&#2527;&#2503;&#2480; &#2441;&#2474;&#2470;&#2503;&#2487;&#2509;&#2463;&#2494; &#2488;&#2504;&#2527;&#2470;&#2494; &#2480;&#2495;&#2460;&#2451;&#2527;&#2494;&#2472;&#2494; &#2489;&#2494;&#2488;&#2494;&#2472;, &#2474;&#2494;&#2472;&#2495; &#2488;&#2478;&#2509;&#2474;&#2470; &#2478;&#2472;&#2509;&#2468;&#2509;&#2480;&#2467;&#2494;&#2482;&#2527;&#2503;&#2480; &#2488;&#2458;&#2495;&#2476; &#2472;&#2494;&#2460;&#2478;&#2497;&#2482; &#2438;&#2489;&#2488;&#2494;&#2472;, &#2460;&#2503;&#2482;&#2494; &#2474;&#2509;&#2480;&#2486;&#2494;&#2488;&#2453; &#2465;. &#2478;&#2507;&#2489;&#2494;&#2478;&#2509;&#2478;&#2470; &#2439;&#2482;&#2495;&#2527;&#2494;&#2488; &#2478;&#2495;&#2527;&#2494;, &#2474;&#2497;&#2482;&#2495;&#2486; &#2488;&#2497;&#2474;&#2494;&#2480;, &#2438; &#2475; &#2478; &#2438;&#2472;&#2507;&#2527;&#2494;&#2480; &#2489;&#2507;&#2488;&#2503;&#2472; &#2454;&#2494;&#2472;, &#2488;&#2497;&#2472;&#2494;&#2478;&#2455;&#2462;&#2509;&#2460; &#2476;&#2504;&#2487;&#2478;&#2509;&#2479;&#2476;&#2495;&#2480;&#2507;&#2471;&#2496; &#2459;&#2494;&#2468;&#2509;&#2480; &#2438;&#2472;&#2509;&#2470;&#2507;&#2482;&#2472;&#2503;&#2480; &#2438;&#2489;&#2509;&#2476;&#2494;&#2527;&#2453; &#2439;&#2478;&#2472; &#2470;&#2507;&#2460;&#2509;&#2460;&#2494;, &#2453;&#2476;&#2495; &#2472;&#2460;&#2480;&#2497;&#2482; &#2488;&#2480;&#2453;&#2494;&#2480;&#2495; &#2453;&#2482;&#2503;&#2460;&#2503;&#2480; &#2476;&#2504;&#2487;&#2478;&#2509;&#2479;&#2476;&#2495;&#2480;&#2507;&#2471;&#2496; &#2459;&#2494;&#2468;&#2509;&#2480; &#2438;&#2472;&#2509;&#2470;&#2507;&#2482;&#2472;&#2503;&#2480; &#2438;&#2489;&#2509;&#2476;&#2494;&#2527;&#2453; &#2468;&#2494;&#2472;&#2477;&#2496;&#2480; &#2439;&#2488;&#2482;&#2494;&#2478; &#2458;&#2508;&#2471;&#2497;&#2480;&#2496;&#2404;</p><p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; border-radius: 0px !important; line-height: 30px; font-size: 20px; color: rgb(0, 0, 0); font-family: solaimanlipi, serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; text-align: justify;\">&#2474;&#2480;&#2495;&#2476;&#2503;&#2486;, &#2476;&#2472; &#2451; &#2460;&#2482;&#2476;&#2494;&#2479;&#2492;&#2497; &#2474;&#2480;&#2495;&#2476;&#2480;&#2509;&#2468;&#2472; &#2478;&#2472;&#2509;&#2468;&#2509;&#2480;&#2467;&#2494;&#2482;&#2527; &#2447;&#2476;&#2434; &#2474;&#2494;&#2472;&#2495; &#2488;&#2478;&#2509;&#2474;&#2470; &#2478;&#2472;&#2509;&#2468;&#2509;&#2480;&#2467;&#2494;&#2482;&#2527;&#2503;&#2480; &#2441;&#2474;&#2470;&#2503;&#2487;&#2509;&#2463;&#2494; &#2488;&#2504;&#2527;&#2470;&#2494; &#2480;&#2495;&#2460;&#2451;&#2527;&#2494;&#2472;&#2494; &#2489;&#2494;&#2488;&#2494;&#2472; &#2476;&#2482;&#2503;&#2472;, &#2488;&#2497;&#2472;&#2494;&#2478;&#2455;&#2462;&#2509;&#2460;&#2503;&#2480; &#2447;&#2476;&#2434; &#2489;&#2494;&#2451;&#2480;&#2494;&#2462;&#2509;&#2458;&#2482;&#2503;&#2480; &#2482;&#2494;&#2454;&#2507; &#2482;&#2494;&#2454;&#2507; &#2478;&#2494;&#2472;&#2497;&#2487; &#2476;&#2507;&#2480;&#2507; &#2475;&#2488;&#2482;&#2503;&#2480; &#2451;&#2474;&#2480; &#2472;&#2495;&#2480;&#2509;&#2477;&#2480;&#2486;&#2496;&#2482;&#2404; &#2476;&#2507;&#2480;&#2507; &#2475;&#2488;&#2482; &#2437;&#2453;&#2494;&#2482; &#2476;&#2472;&#2509;&#2479;&#2494;&#2480; &#2489;&#2494;&#2468; &#2469;&#2503;&#2453;&#2503; &#2480;&#2453;&#2509;&#2487;&#2494; &#2453;&#2480;&#2468;&#2503; &#2476;&#2494;&#2433;&#2471;&#2503;&#2480; &#2453;&#2494;&#2460;&#2503; &#2488;&#2453;&#2482; &#2437;&#2472;&#2495;&#2527;&#2478; &#2470;&#2498;&#2480; &#2453;&#2480;&#2503; &#2479;&#2469;&#2494; &#2488;&#2478;&#2527;&#2503; &#2453;&#2494;&#2460; &#2486;&#2497;&#2480;&#2497; &#2451; &#2486;&#2503;&#2487; &#2453;&#2480;&#2468;&#2503; &#2489;&#2476;&#2503;&#2404; &#2447;&#2459;&#2494;&#2524;&#2494; &#2489;&#2494;&#2451;&#2480;&#2503; &#2472;&#2495;&#2527;&#2472;&#2509;&#2468;&#2509;&#2480;&#2495;&#2468; &#2474;&#2480;&#2509;&#2479;&#2463;&#2472; &#2476;&#2509;&#2479;&#2476;&#2488;&#2494; &#2455;&#2524;&#2503; &#2468;&#2507;&#2482;&#2494;&#2480; &#2478;&#2494;&#2471;&#2509;&#2479;&#2478;&#2503; &#2488;&#2476;&#2494;&#2439;&#2453;&#2503; &#2474;&#2480;&#2495;&#2476;&#2503;&#2486; &#2476;&#2495;&#2487;&#2527;&#2503; &#2488;&#2458;&#2503;&#2468;&#2472; &#2480;&#2494;&#2454;&#2494;&#2480;&#2451; &#2438;&#2489;&#2509;&#2476;&#2494;&#2472; &#2460;&#2494;&#2472;&#2494;&#2472; &#2468;&#2495;&#2472;&#2495;&#2404;</p><p></p></p>\n', NULL, 'page', NULL, NULL, 1, 1, '2024-11-26 08:54:32', '2024-11-26 08:54:32');

-- --------------------------------------------------------

--
-- Table structure for table `post_tax`
--

CREATE TABLE `post_tax` (
  `id` int NOT NULL,
  `post_id` mediumint UNSIGNED NOT NULL,
  `tax_id` mediumint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'superadmin', '2020-11-09 19:42:09', '2020-11-09 19:42:09'),
(2, 'Admin', 'admin', '2021-03-19 04:42:52', '2021-03-19 04:42:52'),
(4, 'HR', 'hr', NULL, NULL),
(5, 'Account', 'account', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles_permissions`
--

CREATE TABLE `roles_permissions` (
  `role_id` bigint UNSIGNED NOT NULL,
  `permission_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles_permissions`
--

INSERT INTO `roles_permissions` (`role_id`, `permission_id`) VALUES
(1, 1),
(2, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` bigint UNSIGNED NOT NULL,
  `branch_id` int UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial` tinyint UNSIGNED DEFAULT '0',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `branch_id`, `name`, `serial`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Boyes', 1, 1, '2024-11-29 12:47:09', '2024-11-29 12:47:09'),
(2, 1, 'Girls', 2, 1, '2024-11-29 12:47:26', '2024-11-29 12:47:26'),
(3, 2, 'A', 1, 1, '2024-12-02 02:43:19', '2024-12-02 02:43:19'),
(4, 2, 'B', 2, 1, '2024-12-02 02:43:29', '2024-12-02 02:43:29');

-- --------------------------------------------------------

--
-- Table structure for table `semesters`
--

CREATE TABLE `semesters` (
  `id` int UNSIGNED NOT NULL,
  `branch_id` int UNSIGNED DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_bn` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial` tinyint UNSIGNED DEFAULT '0',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `semesters`
--

INSERT INTO `semesters` (`id`, `branch_id`, `code`, `name`, `name_bn`, `serial`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 'Six', NULL, 0, 1, NULL, NULL),
(2, NULL, NULL, 'Seven', NULL, 0, 1, NULL, NULL),
(3, NULL, NULL, 'Eight', NULL, 0, 1, NULL, NULL),
(4, NULL, NULL, 'Nine', NULL, 0, 1, NULL, NULL),
(5, NULL, NULL, 'Ten', NULL, 0, 1, NULL, NULL),
(6, NULL, NULL, 'Eleven', NULL, 0, 1, NULL, NULL),
(7, NULL, NULL, 'Twelve', NULL, 0, 1, NULL, NULL),
(8, NULL, NULL, 'Basic', NULL, 0, 1, NULL, NULL),
(9, NULL, 'Cancel', 'Cancel', NULL, 0, 0, NULL, NULL),
(10, NULL, 'Complete', 'Complete', NULL, 0, 0, NULL, NULL),
(11, 1, NULL, 'Play', NULL, 1, 1, '2024-11-29 12:15:39', '2024-11-29 12:16:16'),
(12, 2, NULL, 'Play', NULL, 1, 1, '2024-12-02 02:42:58', '2024-12-02 02:42:58'),
(13, 2, NULL, 'One', NULL, 2, 1, '2024-12-02 02:43:08', '2024-12-02 02:43:08'),
(14, 1, NULL, 'One', NULL, 2, 1, '2024-12-02 10:12:16', '2024-12-02 10:12:16'),
(15, 1, NULL, 'Two', NULL, 3, 1, '2024-12-07 07:52:14', '2024-12-07 07:52:14'),
(16, 1, NULL, 'Three', NULL, 4, 1, '2024-12-07 07:52:30', '2024-12-07 07:52:30'),
(17, 1, NULL, 'Four', NULL, 5, 1, '2024-12-07 07:52:52', '2024-12-07 07:52:52');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('8VnI2UGCJBbFSc2UpkEdqJuObNLZRLev45JHNxnz', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:122.0) Gecko/20100101 Firefox/122.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoidVFFWDIyZW9qYm5QdEVnelU1TFVIaEI5dWE3eHhHRDlORjFKZzQyZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHBzOi8vbG9jYWxob3N0L2xhcmF2ZWwvbGFyYXZlbC04LWtwaS9zdHVkZW50L3N0dWRlbnQvMSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czo0OiJhdXRoIjthOjE6e3M6MjE6InBhc3N3b3JkX2NvbmZpcm1lZF9hdCI7aToxNzAzMjkyODU1O319', 1703296428),
('SlOHu4gPIbqiDrRbdgYa30FzOCyBMHlOJ6r5YFK9', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:122.0) Gecko/20100101 Firefox/122.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiRnJLUWpaUDJNbUw4Q1pLdTdySjk1RlVvejIzcnNQUmFnbloxc1QwTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vbG9jYWxob3N0L2xhcmF2ZWwvbGFyYXZlbC04LWtwaS9zdHVkZW50L3N0dWRlbnQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6NDoiYXV0aCI7YToxOntzOjIxOiJwYXNzd29yZF9jb25maXJtZWRfYXQiO2k6MTcwMzQ3Njg2Mzt9fQ==', 1703480270);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int UNSIGNED NOT NULL,
  `sl` smallint NOT NULL DEFAULT '1',
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `category` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `field` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `sl`, `name`, `description`, `value`, `category`, `field`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'siteTitle', 'Site Name', 'কুষ্টিয়া সরকারি টেকনিক্যাল স্কুল ও কলেজ, কুষ্টিয়া', 'basic', '{\"required\":\"1\",\"label\":\"Value\",\"type\":\"text\"}', 1, NULL, '2024-11-03 02:13:44'),
(2, 1, 'siteAddress', 'Site Address', 'জেলখানা মোড়, কুষ্টিয়া ৭০০০', 'basic', '{\"required\":\"1\",\"label\":\"Value\",\"type\":\"textarea\"}', 1, NULL, '2024-11-03 02:12:39'),
(3, 1, 'siteEmail', 'Site Email', 'shahadat@asiancoder.com', 'basic', '{\"required\":\"1\",\"label\":\"Value\",\"type\":\"email\"}', 1, NULL, '2022-02-06 20:11:26'),
(4, 1, 'sitePhone', 'Site Phone', '01757839516', 'basic', '{\"required\":\"1\",\"label\":\"Value\",\"type\":\"text\"}', 1, NULL, '2022-02-06 20:11:50'),
(5, 3, 'search', 'Item Search', 'random', 'basic', '{\"required\":\"1\",\"label\":\"Value\",\"type\":\"select\",\"options\": {\"prefix\": \"Prefix\", \"random\": \"Random\"}}', 0, NULL, '2020-03-20 08:44:37'),
(6, 3, 'siteLogo', 'Site Logo', '1730599789.png', 'basic', '{\"required\":\"1\",\"label\":\"Value\",\"type\":\"image\"}', 1, NULL, '2024-11-03 02:09:49'),
(7, 5, 'product_allow_discount_input', 'Allow product sales discount', '0', 'product', '{\"required\":\"1\",\"label\":\"Value\",\"type\":\"number\"}', 0, NULL, NULL),
(11, 4, 'sms_senderid', 'SMS Sender ID', '642', 'sms', '{\"required\":\"1\",\"label\":\"Value\",\"type\":\"number\"}', 1, NULL, '2022-04-21 16:29:31'),
(12, 4, 'sms_domain_url', 'SMS Domain Link', 'http://esms.rampsbd.com', 'sms', '{\"required\":\"1\",\"label\":\"Value\",\"type\":\"text\"}', 1, NULL, '2020-09-08 00:17:38'),
(13, 4, 'sms_api_key', 'SMS API Key', 'R20000165f81b3c5b2d7b6.56372184', 'sms', '{\"required\":\"1\",\"label\":\"Value\",\"type\":\"text\"}', 1, NULL, '2022-04-21 16:29:13'),
(38, 1, 'tagLine2', 'Tag Line 2', 'Office of the Principal', 'basic', '{\"required\":\"1\",\"label\":\"Value\",\"type\":\"text\"}', 1, NULL, '2024-01-07 05:10:53'),
(35, 1, 'tagLine', 'Tag Line', 'Government of the People\'s Republic of Bangladesh', 'basic', '{\"required\":\"1\",\"label\":\"Value\",\"type\":\"text\"}', 1, NULL, '2024-01-07 05:10:53'),
(36, 1, 'siteWeb', 'Website', 'http://shilpakala.natore.gov.bd', 'basic', '{\"required\":\"1\",\"label\":\"Value\",\"type\":\"text\"}', 1, NULL, '2024-03-07 17:03:40'),
(37, 1, 'principal', 'Principal', 'মোঃ রাকিবুল বারী', 'basic', '{\"required\":\"1\",\"label\":\"Value\",\"type\":\"text\"}', 1, NULL, '2022-02-06 20:10:32'),
(39, 1, 'principal_signature', 'Principal Signature', '1709823766.jpg', 'basic', '{\"required\":\"1\",\"label\":\"Value\",\"type\":\"image\"}', 1, NULL, '2024-03-07 15:02:46'),
(40, 4, 'admission_payment_amount', 'Admission Payment Amount', '10', 'basic', '{\"required\":\"1\",\"label\":\"Value\",\"type\":\"number\"}', 1, NULL, NULL),
(41, 1, 'admission_open', 'Admission Open Date', '2024-11-04', 'basic', '{\"required\":\"1\",\"label\":\"Value\",\"type\":\"text\"}', 1, NULL, '2024-11-03 15:48:29'),
(42, 1, 'admission_close', 'Admission Close', '2024-12-22', 'basic', '{\"required\":\"1\",\"label\":\"Value\",\"type\":\"text\"}', 1, NULL, '2024-11-16 17:13:56');

-- --------------------------------------------------------

--
-- Table structure for table `shifts`
--

CREATE TABLE `shifts` (
  `id` bigint UNSIGNED NOT NULL,
  `branch_id` int UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial` tinyint UNSIGNED DEFAULT '0',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shifts`
--

INSERT INTO `shifts` (`id`, `branch_id`, `name`, `serial`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Day', 1, 1, '2024-11-29 12:37:12', '2024-11-29 12:37:12'),
(2, 2, 'Day', 1, 1, '2024-12-02 02:43:47', '2024-12-02 02:43:47');

-- --------------------------------------------------------

--
-- Table structure for table `sms_contacts`
--

CREATE TABLE `sms_contacts` (
  `id` bigint UNSIGNED NOT NULL,
  `branch_id` int UNSIGNED DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sms_contacts`
--

INSERT INTO `sms_contacts` (`id`, `branch_id`, `name`, `mobile`, `category_id`, `note`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 'Zakir', '01740836439', '2', NULL, 1, '2023-11-08 02:27:35', '2023-11-08 02:27:35'),
(2, NULL, 'Shahadat Hosain', '01757839516', '2', NULL, 1, '2024-10-28 09:26:23', '2024-10-28 09:26:23'),
(3, NULL, 'Bulbul', '01912624881', '1', NULL, 1, '2024-10-28 09:26:52', '2024-10-28 09:26:52'),
(4, 1, 'Shahadat', '01757839516', '3', NULL, 1, '2025-01-05 07:59:27', '2025-01-05 07:59:27'),
(5, 1, 'Bulbul', '01912624881', '3', NULL, 1, '2025-01-05 08:00:30', '2025-01-05 08:00:30');

-- --------------------------------------------------------

--
-- Table structure for table `sms_contact_categories`
--

CREATE TABLE `sms_contact_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `branch_id` int UNSIGNED DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sms_contact_categories`
--

INSERT INTO `sms_contact_categories` (`id`, `branch_id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Family', 1, '2023-11-08 02:24:42', '2023-11-08 02:24:42'),
(2, NULL, 'Friend', 1, '2023-11-08 02:27:17', '2023-11-08 02:27:17'),
(3, 1, 'Friends', 1, '2025-01-05 07:59:20', '2025-01-05 07:59:20');

-- --------------------------------------------------------

--
-- Table structure for table `sms_logs`
--

CREATE TABLE `sms_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `branch_id` int UNSIGNED DEFAULT NULL,
  `send_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `send_to` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sms_count` smallint UNSIGNED NOT NULL,
  `response` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sms_logs`
--

INSERT INTO `sms_logs` (`id`, `branch_id`, `send_type`, `send_to`, `name`, `mobile`, `message`, `status`, `created_by`, `sms_count`, `response`, `created_at`, `updated_at`) VALUES
(14, NULL, NULL, NULL, NULL, '8801757839516', 'Hello Rajshahai', 'success', '1', 1, 'success', '2024-11-30 03:25:26', '2024-11-30 03:25:26'),
(15, NULL, NULL, NULL, NULL, '8801912624881', 'Hello Rajshahai', 'success', '1', 1, 'success', '2024-11-30 03:25:26', '2024-11-30 03:25:26'),
(16, NULL, NULL, NULL, NULL, '8801918136999', 'Hello Rajshahai', 'success', '1', 1, 'success', '2024-11-30 03:26:28', '2024-11-30 03:26:28'),
(17, NULL, NULL, NULL, NULL, '8801757839516,8801740836439', 'Hello Rajshahai', 'success', '1', 1, 'success', '2024-11-30 03:27:24', '2024-11-30 03:27:24'),
(18, NULL, NULL, NULL, NULL, '8801912624881', 'Hello Rajshahai', 'success', '1', 1, 'success', '2024-11-30 03:27:24', '2024-11-30 03:27:24'),
(19, 1, NULL, NULL, NULL, '8801757839516', 'Hello Rajshahai', 'success', '1', 1, 'success', '2025-01-07 12:23:51', '2025-01-07 12:23:51');

-- --------------------------------------------------------

--
-- Table structure for table `sms_templates`
--

CREATE TABLE `sms_templates` (
  `id` bigint UNSIGNED NOT NULL,
  `branch_id` int UNSIGNED DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sms_templates`
--

INSERT INTO `sms_templates` (`id`, `branch_id`, `title`, `content`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Test Template', 'Hello Rajshahai', 1, '2023-11-08 02:54:52', '2023-11-08 02:54:52'),
(3, 1, 'New Year', 'Happy new year', 1, '2025-01-05 07:49:50', '2025-01-05 07:49:50');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint UNSIGNED NOT NULL,
  `branch_id` int UNSIGNED DEFAULT NULL,
  `reg_no` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class_roll` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `mobile` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `religion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `section_id` int UNSIGNED NOT NULL,
  `semester_id` int UNSIGNED NOT NULL,
  `fathersName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobileFather` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mothersName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobileMother` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sex` enum('Male','Female','Others','') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `presentVillage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `presentPost` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `presentUpazila` int UNSIGNED DEFAULT NULL,
  `presentZila` int UNSIGNED DEFAULT NULL,
  `permanentVillage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permanentPost` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permanentUpazila` int UNSIGNED DEFAULT NULL,
  `permanentZila` int UNSIGNED DEFAULT NULL,
  `studentBirthRegNo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shift_id` int UNSIGNED DEFAULT NULL,
  `group_id` int UNSIGNED DEFAULT NULL,
  `category_id` int UNSIGNED DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `jscBoard` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jscResistration` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jscExamYear` smallint DEFAULT NULL,
  `jscBoardRoll` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jscCgpa` decimal(4,2) DEFAULT NULL,
  `guardianName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobileGuardian` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guardianNID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guardianRelation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MISStudentID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Bank_Mobile` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountNumber` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `academic_year_id` int DEFAULT NULL,
  `others` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `branch_id`, `reg_no`, `class_roll`, `name`, `dateOfBirth`, `mobile`, `religion`, `section_id`, `semester_id`, `fathersName`, `mobileFather`, `mothersName`, `mobileMother`, `sex`, `presentVillage`, `presentPost`, `presentUpazila`, `presentZila`, `permanentVillage`, `permanentPost`, `permanentUpazila`, `permanentZila`, `studentBirthRegNo`, `shift_id`, `group_id`, `category_id`, `photo`, `Comment`, `jscBoard`, `jscResistration`, `jscExamYear`, `jscBoardRoll`, `jscCgpa`, `guardianName`, `mobileGuardian`, `guardianNID`, `guardianRelation`, `MISStudentID`, `Bank_Mobile`, `accountName`, `accountNumber`, `academic_year_id`, `others`, `created_at`, `updated_at`) VALUES
(1, 1, '20221001', 20221001, 'শাহাদৎ হোসেন', NULL, '01757839516', 'Islam', 1, 1, 'মোস্তফা কামাল', '01912624881', 'সাজেদা বেগম', '01912624882', 'Male', NULL, 'kharkhari', 545, 391, 'Kharkhari, Rajshahi', 'kharkhari', 545, 391, NULL, 1, 1, NULL, 'students/1707924977.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 'মোস্তফা কামাল', '01912624883', '5465652623', 'Father', NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-07 03:59:48', '2024-02-14 15:36:17'),
(2, 1, '20223001', 20223001, 'Saima', '2014-07-10', '01757839516', 'Islam', 7, 1, 'Shahadat Hosain', '01757839516', 'Azmira Khatun', NULL, 'Female', 'নারিকেলবাড়িয়া', 'খড়খড়ি', 545, 391, 'নারিকেলবাড়িয়া', 'খড়খড়ি', 545, 391, NULL, 1, 1, NULL, 'students/1709823888.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-02 08:09:57', '2024-03-07 15:04:48'),
(3, 1, '20221011', 20221011, 'Mamun', '2022-08-09', '01757839516', 'Islam', 1, 1, 'Sumon', '01757839516', 'Azmira Khatun', '01757839516', 'Male', 'Kechuatoil', 'Kharkhari', 499, 380, 'Kechuatoil', 'Kharkhari', 405, 380, NULL, 1, 1, NULL, 'students/1709823983.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-02 08:13:59', '2024-03-07 15:06:23'),
(4, 1, '20221002', 20221002, 'Masun', '2022-11-15', '01757839516', NULL, 1, 1, 'Shahadat Hosain', 'বাংলাদেশি', 'Azmira Khatun', NULL, 'Male', 'Kechuatoil', 'Kharkhari', 403, 339, 'Kechuatoil', 'Kharkhari', 403, 339, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-02 08:17:39', '2024-01-09 03:04:32'),
(5, 1, '20172001', 20172001, 'Abu Ahmed Rafi', '2006-02-01', '01757839516', NULL, 7, 1, 'Azam Ali', 'বাংলাদেশি', 'Rojeda', NULL, 'Male', 'Bamon Sikor', 'kharkhari', 545, 391, 'Bamon Sikor', 'Kharkhari', 545, 391, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-06 01:33:02', '2024-01-09 03:04:32'),
(6, 1, '20172002', 20172002, 'Selim', '2014-07-10', '01757839516', NULL, 7, 1, 'Sumon', 'বাংলাদেশি', 'Mother', NULL, 'Male', 'Bamon Sikor', 'kharkhari', 545, 391, 'Bamon Sikor', 'Kharkhari', 545, 391, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-06 01:35:03', '2024-01-09 03:04:32'),
(7, 1, '20221003', 20221003, 'Masun', '2022-11-15', '01757839516', NULL, 1, 1, 'Shahadat Hosain', 'বাংলাদেশি', 'Azmira Khatun', NULL, 'Male', 'Kechuatoil', 'Kharkhari', 403, 339, 'Kechuatoil', 'Kharkhari', 403, 339, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-02 08:17:39', '2024-01-09 03:04:32'),
(8, 1, '20222001', 20222001, 'Nabila', '2023-01-01', '01757839516', NULL, 7, 1, 'Ahmen', NULL, 'Nipa', NULL, 'Female', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-17 10:35:22', '2024-01-09 03:04:32'),
(9, 1, '20203001', 20203001, 'Rikat', '2010-09-06', '01757839516', NULL, 7, 1, 'Rahat', 'Bangladeshi', 'nipa', NULL, 'Male', 'Kacutaol', 'kharkhari', 545, 391, 'Kacutaol', 'kharkhari', 545, 391, NULL, 1, 1, NULL, 'students/1693974450.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-09-06 04:27:30', '2024-01-09 03:04:32'),
(10, 1, '20231001', 20231001, 'Md. Nasiruddin', '1990-09-12', '01739201222', NULL, 1, 1, 'Rahat', 'Bangladeshi', 'nipa', NULL, 'Male', 'Kacutaol', 'kharkhari', 544, 391, 'Kacutaol', 'kharkhari', 403, 391, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-09-12 08:30:25', '2024-01-09 03:04:32'),
(12, 1, '56565656', 56565656, 'Mahfuz', NULL, '8801757839516', NULL, 1, 1, NULL, '1912624881', NULL, NULL, 'Male', 'soriotpur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-01 03:07:57', '2024-01-09 03:04:32'),
(13, 1, '56565657', 5, 'Akbok Ali', '2024-12-01', '01912624881', 'Islam', 1, 1, 'Father', NULL, 'Mother', NULL, 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01757839516', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-02 11:54:48', '2024-12-02 11:57:23'),
(14, 1, '56565658', 25, 'Mahfuz', NULL, '8801757839516', NULL, 1, 1, 'Mahbub Ali', NULL, 'Nresa', NULL, 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-03 05:20:29', '2024-12-03 05:20:29'),
(15, 1, '25001', 1, 'Mizan', NULL, '01740839548', 'Muslim', 1, 11, 'jobbar', NULL, 'abeda', NULL, 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, '2025-01-06 10:07:15', '2025-01-06 11:51:36'),
(16, 1, '25002', 2, 'mazder', NULL, '01757839516', 'Hindu', 1, 11, 'jamil', NULL, 'mina', NULL, 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, '2025-01-06 10:07:15', '2025-01-06 11:51:36'),
(17, 1, '25003', 3, 'aslam', NULL, '01912624881', 'Muslim', 1, 11, 'akber', NULL, 'farah', NULL, 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, '2025-01-06 10:07:15', '2025-01-06 11:39:59'),
(18, 1, '25004', 1, 'Azmira', NULL, '01701063565', 'Muslim', 5, 14, 'Azam', NULL, 'Rozi', NULL, 'Female', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, '2025-01-06 10:11:58', '2025-01-06 10:11:58'),
(19, 1, '25005', 2, 'saima', NULL, '01701063566', 'Muslim', 5, 14, 'Shahadat', NULL, 'Azmira', NULL, 'Female', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, '2025-01-06 10:11:58', '2025-01-06 10:11:58'),
(20, 1, '25006', 25, 'Mahfuz', NULL, '01757839516', 'Muslim', 1, 11, 'Mahbub Ali', NULL, 'Nresa', NULL, 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, '2025-01-09 06:04:13', '2025-01-09 06:04:13');

-- --------------------------------------------------------

--
-- Table structure for table `student_ac_fee_configs`
--

CREATE TABLE `student_ac_fee_configs` (
  `id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED DEFAULT NULL,
  `academic_year_id` bigint UNSIGNED DEFAULT NULL,
  `class_id` bigint UNSIGNED DEFAULT NULL,
  `group_id` bigint UNSIGNED DEFAULT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `head_id` bigint UNSIGNED DEFAULT NULL,
  `sub_head_id` bigint UNSIGNED DEFAULT NULL,
  `fee_amount` decimal(10,2) UNSIGNED DEFAULT NULL,
  `fine_amount` decimal(10,2) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_ac_fee_configs`
--

INSERT INTO `student_ac_fee_configs` (`id`, `branch_id`, `academic_year_id`, `class_id`, `group_id`, `category_id`, `head_id`, `sub_head_id`, `fee_amount`, `fine_amount`, `created_at`, `updated_at`) VALUES
(2, 1, 3, 11, 1, 1, 1, 1, '20.00', '0.00', '2024-12-17 09:29:09', '2024-12-17 09:29:09'),
(4, 1, 3, 11, 1, 1, 2, 2, '50.00', '10.00', '2024-12-17 09:32:20', '2024-12-17 09:32:20'),
(5, 1, 3, 11, 1, 1, 2, 3, '50.00', '10.00', '2024-12-17 09:32:20', '2024-12-17 09:32:20'),
(6, 1, 3, 11, 1, 1, 2, 4, '50.00', '10.00', '2024-12-17 09:32:20', '2024-12-17 09:32:20'),
(7, 1, 3, 11, 1, 1, 2, 5, '50.00', '10.00', '2024-12-17 09:32:20', '2024-12-17 09:32:20'),
(8, 1, 3, 11, 1, 1, 2, 6, '50.00', '10.00', '2024-12-17 09:32:20', '2024-12-17 09:32:20'),
(9, 1, 3, 11, 1, 1, 2, 7, '50.00', '10.00', '2024-12-17 09:32:20', '2024-12-17 09:32:20'),
(10, 1, 3, 11, 1, 1, 2, 8, '50.00', '10.00', '2024-12-17 09:32:20', '2024-12-17 09:32:20'),
(11, 1, 3, 11, 1, 1, 2, 9, '50.00', '10.00', '2024-12-17 09:32:20', '2024-12-17 09:32:20'),
(12, 1, 3, 11, 1, 1, 2, 10, '50.00', '10.00', '2024-12-17 09:32:20', '2024-12-17 09:32:20'),
(13, 1, 3, 11, 1, 1, 2, 11, '50.00', '10.00', '2024-12-17 09:32:20', '2024-12-17 09:32:20'),
(14, 1, 3, 11, 1, 1, 2, 12, '50.00', '10.00', '2024-12-17 09:32:20', '2024-12-17 09:32:20'),
(15, 1, 3, 11, 1, 1, 2, 13, '50.00', '10.00', '2024-12-17 09:32:21', '2024-12-17 09:32:21');

-- --------------------------------------------------------

--
-- Table structure for table `student_ac_fee_waivers`
--

CREATE TABLE `student_ac_fee_waivers` (
  `id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial` tinyint UNSIGNED DEFAULT NULL,
  `status` tinyint UNSIGNED DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_ac_fee_waivers`
--

INSERT INTO `student_ac_fee_waivers` (`id`, `branch_id`, `name`, `serial`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Poor Waiver', 1, 1, '2024-12-15 07:08:04', '2024-12-15 07:08:04');

-- --------------------------------------------------------

--
-- Table structure for table `student_ac_free_waiver_configs`
--

CREATE TABLE `student_ac_free_waiver_configs` (
  `id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED DEFAULT NULL,
  `academic_year_id` bigint UNSIGNED DEFAULT NULL,
  `class_id` bigint UNSIGNED DEFAULT NULL,
  `student_id` bigint UNSIGNED DEFAULT NULL,
  `head_id` bigint UNSIGNED DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_ac_heads`
--

CREATE TABLE `student_ac_heads` (
  `id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial` tinyint UNSIGNED DEFAULT NULL,
  `status` tinyint UNSIGNED DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_ac_heads`
--

INSERT INTO `student_ac_heads` (`id`, `branch_id`, `name`, `serial`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admission Fee', 1, 1, '2024-12-15 06:55:26', '2024-12-15 06:55:26'),
(2, 1, 'Tution Fee', 2, 1, '2024-12-15 06:56:46', '2024-12-15 06:56:46');

-- --------------------------------------------------------

--
-- Table structure for table `student_ac_sub_heads`
--

CREATE TABLE `student_ac_sub_heads` (
  `id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial` tinyint UNSIGNED DEFAULT NULL,
  `status` tinyint UNSIGNED DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_ac_sub_heads`
--

INSERT INTO `student_ac_sub_heads` (`id`, `branch_id`, `name`, `serial`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admission Fee', 1, 1, '2024-12-15 07:00:56', '2024-12-15 07:00:56'),
(2, 1, 'January', 2, 1, '2024-12-15 07:01:15', '2024-12-15 07:01:15'),
(3, 1, 'February', 3, 1, '2024-12-15 07:01:34', '2024-12-15 07:01:34'),
(4, 1, 'March', 4, 1, '2024-12-15 07:01:49', '2024-12-15 07:01:49'),
(5, 1, 'April', 5, 1, '2024-12-15 09:13:05', '2024-12-15 09:13:05'),
(6, 1, 'May', 6, 1, '2024-12-15 09:13:18', '2024-12-15 09:13:18'),
(7, 1, 'June', 7, 1, '2024-12-15 09:13:43', '2024-12-15 09:13:43'),
(8, 1, 'July', 8, 1, '2024-12-15 09:14:22', '2024-12-15 09:14:55'),
(9, 1, 'August', 9, 1, '2024-12-15 09:15:28', '2024-12-15 09:15:28'),
(10, 1, 'September', 10, 1, '2024-12-15 09:16:10', '2024-12-15 09:16:10'),
(11, 1, 'October', 11, 1, '2024-12-15 09:16:30', '2024-12-15 09:16:30'),
(12, 1, 'November', 12, 1, '2024-12-15 09:16:52', '2024-12-15 09:16:52'),
(13, 1, 'December', 13, 1, '2024-12-15 09:17:12', '2024-12-15 09:17:12');

-- --------------------------------------------------------

--
-- Table structure for table `student_ac_sub_head_configs`
--

CREATE TABLE `student_ac_sub_head_configs` (
  `id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED DEFAULT NULL,
  `sub_head_id` bigint UNSIGNED DEFAULT NULL,
  `head_id` bigint UNSIGNED DEFAULT NULL,
  `serial` tinyint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_ac_sub_head_configs`
--

INSERT INTO `student_ac_sub_head_configs` (`id`, `branch_id`, `sub_head_id`, `head_id`, `serial`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, NULL, '2024-12-15 09:19:26', '2024-12-15 09:19:26'),
(2, 1, 2, 2, NULL, '2024-12-15 09:22:02', '2024-12-15 09:22:02'),
(3, 1, 3, 2, NULL, '2024-12-15 09:22:02', '2024-12-15 09:22:02'),
(4, 1, 4, 2, NULL, '2024-12-15 09:22:02', '2024-12-15 09:22:02'),
(5, 1, 5, 2, NULL, '2024-12-15 09:22:02', '2024-12-15 09:22:02'),
(6, 1, 6, 2, NULL, '2024-12-15 09:22:02', '2024-12-15 09:22:02'),
(7, 1, 7, 2, NULL, '2024-12-15 09:22:02', '2024-12-15 09:22:02'),
(8, 1, 8, 2, NULL, '2024-12-15 09:22:02', '2024-12-15 09:22:02'),
(9, 1, 9, 2, NULL, '2024-12-15 09:22:02', '2024-12-15 09:22:02'),
(10, 1, 10, 2, NULL, '2024-12-15 09:22:02', '2024-12-15 09:22:02'),
(11, 1, 11, 2, NULL, '2024-12-15 09:22:02', '2024-12-15 09:22:02'),
(12, 1, 12, 2, NULL, '2024-12-15 09:22:02', '2024-12-15 09:22:02'),
(14, 1, 13, 2, NULL, '2024-12-15 09:23:41', '2024-12-15 09:23:41');

-- --------------------------------------------------------

--
-- Table structure for table `student_ac_time_configs`
--

CREATE TABLE `student_ac_time_configs` (
  `id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED DEFAULT NULL,
  `academic_year_id` bigint UNSIGNED DEFAULT NULL,
  `sub_head_id` bigint UNSIGNED DEFAULT NULL,
  `month` tinyint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taxonomies`
--

CREATE TABLE `taxonomies` (
  `id` mediumint UNSIGNED NOT NULL,
  `branch_id` int UNSIGNED DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` mediumint UNSIGNED DEFAULT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `image` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` smallint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Designation` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `banned_till` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `mobile`, `Designation`, `email`, `banned_till`, `email_verified_at`, `password`, `remember_token`, `photo`, `created_at`, `updated_at`) VALUES
(1, 'Shahadat Hosain', 'shahadat', '01757839516', 'IT Engineer', 'shahadat@asiancoder.com', NULL, NULL, '$2y$10$MA6Q/mISlCRrdduJ8HHT0uOziOlXSUZrm04emRs6zKI3LoJzrrrHS', NULL, NULL, '2020-10-31 19:51:35', '2024-11-24 15:21:33'),
(6, 'Nawdapara School', NULL, NULL, NULL, 'ns@gmail.com', NULL, NULL, '$2y$10$PV3A9DFiGcarj1NgdN.S3ulxW0nGHd8a4eWZVicz2xdSe32PHjFXO', NULL, NULL, '2024-11-25 11:22:01', '2024-11-25 11:22:01');

-- --------------------------------------------------------

--
-- Table structure for table `users_permissions`
--

CREATE TABLE `users_permissions` (
  `user_id` smallint UNSIGNED NOT NULL,
  `permission_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_roles`
--

CREATE TABLE `users_roles` (
  `id` int NOT NULL,
  `user_id` smallint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_roles`
--

INSERT INTO `users_roles` (`id`, `user_id`, `role_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_branches`
--

CREATE TABLE `user_branches` (
  `id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `user_id` smallint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_branches`
--

INSERT INTO `user_branches` (`id`, `branch_id`, `user_id`) VALUES
(2, 1, 1),
(3, 3, 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_years`
--
ALTER TABLE `academic_years`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendances_student_id_foreign` (`student_id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `branches_slug_unique` (`subdomain`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `class_configs`
--
ALTER TABLE `class_configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_configurations`
--
ALTER TABLE `exam_configurations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_grades`
--
ALTER TABLE `exam_grades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_grade_defaults`
--
ALTER TABLE `exam_grade_defaults`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_lists`
--
ALTER TABLE `exam_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_marks`
--
ALTER TABLE `exam_marks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `academic_year_id` (`academic_year_id`);

--
-- Indexes for table `exam_mark_configs`
--
ALTER TABLE `exam_mark_configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_merit_process_types`
--
ALTER TABLE `exam_merit_process_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_results`
--
ALTER TABLE `exam_results`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_result_tabulations`
--
ALTER TABLE `exam_result_tabulations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_result_tabulations_exam_result_id_foreign` (`exam_result_id`);

--
-- Indexes for table `exam_short_codes`
--
ALTER TABLE `exam_short_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_short_code_defaults`
--
ALTER TABLE `exam_short_code_defaults`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_subjects`
--
ALTER TABLE `exam_subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_subject_configs`
--
ALTER TABLE `exam_subject_configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_subject_types`
--
ALTER TABLE `exam_subject_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_configs`
--
ALTER TABLE `group_configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `idcard_templates`
--
ALTER TABLE `idcard_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_created_by_foreign` (`created_by`),
  ADD KEY `invoices_student_id_index` (`student_id`);

--
-- Indexes for table `invoice_heads`
--
ALTER TABLE `invoice_heads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_items_invoice_id_foreign` (`invoice_id`),
  ADD KEY `invoice_items_invoice_head_id_foreign` (`invoice_head_id`);

--
-- Indexes for table `invoice_payments`
--
ALTER TABLE `invoice_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_payments_invoice_id_foreign` (`invoice_id`),
  ADD KEY `invoice_payments_student_id_foreign` (`student_id`),
  ADD KEY `invoice_payments_received_by_foreign` (`received_by`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `postmetas`
--
ALTER TABLE `postmetas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_tax`
--
ALTER TABLE `post_tax`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles_permissions`
--
ALTER TABLE `roles_permissions`
  ADD PRIMARY KEY (`role_id`,`permission_id`),
  ADD KEY `roles_permissions_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `semesters`
--
ALTER TABLE `semesters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shifts`
--
ALTER TABLE `shifts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_contacts`
--
ALTER TABLE `sms_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_contact_categories`
--
ALTER TABLE `sms_contact_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_logs`
--
ALTER TABLE `sms_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_templates`
--
ALTER TABLE `sms_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `students_semester_id_index` (`semester_id`) USING BTREE;

--
-- Indexes for table `student_ac_fee_configs`
--
ALTER TABLE `student_ac_fee_configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_ac_fee_waivers`
--
ALTER TABLE `student_ac_fee_waivers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_ac_free_waiver_configs`
--
ALTER TABLE `student_ac_free_waiver_configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_ac_heads`
--
ALTER TABLE `student_ac_heads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_ac_sub_heads`
--
ALTER TABLE `student_ac_sub_heads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_ac_sub_head_configs`
--
ALTER TABLE `student_ac_sub_head_configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_ac_time_configs`
--
ALTER TABLE `student_ac_time_configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxonomies`
--
ALTER TABLE `taxonomies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- Indexes for table `users_permissions`
--
ALTER TABLE `users_permissions`
  ADD PRIMARY KEY (`user_id`,`permission_id`),
  ADD KEY `users_permissions_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `users_roles`
--
ALTER TABLE `users_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`role_id`),
  ADD KEY `users_roles_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_branches`
--
ALTER TABLE `user_branches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_branches_branch_id_foreign` (`branch_id`),
  ADD KEY `user_branches_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_years`
--
ALTER TABLE `academic_years`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `class_configs`
--
ALTER TABLE `class_configs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `exam_configurations`
--
ALTER TABLE `exam_configurations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `exam_grades`
--
ALTER TABLE `exam_grades`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `exam_grade_defaults`
--
ALTER TABLE `exam_grade_defaults`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `exam_lists`
--
ALTER TABLE `exam_lists`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `exam_marks`
--
ALTER TABLE `exam_marks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `exam_mark_configs`
--
ALTER TABLE `exam_mark_configs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `exam_merit_process_types`
--
ALTER TABLE `exam_merit_process_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `exam_results`
--
ALTER TABLE `exam_results`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `exam_result_tabulations`
--
ALTER TABLE `exam_result_tabulations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `exam_short_codes`
--
ALTER TABLE `exam_short_codes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `exam_short_code_defaults`
--
ALTER TABLE `exam_short_code_defaults`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `exam_subjects`
--
ALTER TABLE `exam_subjects`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `exam_subject_configs`
--
ALTER TABLE `exam_subject_configs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `exam_subject_types`
--
ALTER TABLE `exam_subject_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `group_configs`
--
ALTER TABLE `group_configs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `idcard_templates`
--
ALTER TABLE `idcard_templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_heads`
--
ALTER TABLE `invoice_heads`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_payments`
--
ALTER TABLE `invoice_payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1018;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `postmetas`
--
ALTER TABLE `postmetas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `post_tax`
--
ALTER TABLE `post_tax`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `semesters`
--
ALTER TABLE `semesters`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `shifts`
--
ALTER TABLE `shifts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sms_contacts`
--
ALTER TABLE `sms_contacts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sms_contact_categories`
--
ALTER TABLE `sms_contact_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sms_logs`
--
ALTER TABLE `sms_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `sms_templates`
--
ALTER TABLE `sms_templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `student_ac_fee_configs`
--
ALTER TABLE `student_ac_fee_configs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `student_ac_fee_waivers`
--
ALTER TABLE `student_ac_fee_waivers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `student_ac_free_waiver_configs`
--
ALTER TABLE `student_ac_free_waiver_configs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_ac_heads`
--
ALTER TABLE `student_ac_heads`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `student_ac_sub_heads`
--
ALTER TABLE `student_ac_sub_heads`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `student_ac_sub_head_configs`
--
ALTER TABLE `student_ac_sub_head_configs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `student_ac_time_configs`
--
ALTER TABLE `student_ac_time_configs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taxonomies`
--
ALTER TABLE `taxonomies`
  MODIFY `id` mediumint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users_roles`
--
ALTER TABLE `users_roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user_branches`
--
ALTER TABLE `user_branches`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendances`
--
ALTER TABLE `attendances`
  ADD CONSTRAINT `attendances_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_result_tabulations`
--
ALTER TABLE `exam_result_tabulations`
  ADD CONSTRAINT `exam_result_tabulations_exam_result_id_foreign` FOREIGN KEY (`exam_result_id`) REFERENCES `exam_results` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `invoices_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD CONSTRAINT `invoice_items_invoice_head_id_foreign` FOREIGN KEY (`invoice_head_id`) REFERENCES `invoice_heads` (`id`),
  ADD CONSTRAINT `invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_payments`
--
ALTER TABLE `invoice_payments`
  ADD CONSTRAINT `invoice_payments_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoice_payments_received_by_foreign` FOREIGN KEY (`received_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `invoice_payments_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `roles_permissions`
--
ALTER TABLE `roles_permissions`
  ADD CONSTRAINT `roles_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `roles_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users_permissions`
--
ALTER TABLE `users_permissions`
  ADD CONSTRAINT `users_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users_roles`
--
ALTER TABLE `users_roles`
  ADD CONSTRAINT `users_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_branches`
--
ALTER TABLE `user_branches`
  ADD CONSTRAINT `user_branches_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_branches_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
