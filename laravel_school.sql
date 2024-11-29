-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 29, 2024 at 05:29 PM
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
(2, 1, '2023', 1, 1, '2024-11-29 04:22:25', '2024-11-29 04:23:06');

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
  `head_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `head_contact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `name`, `subdomain`, `address`, `contact`, `email`, `status`, `refer_by`, `head`, `head_designation`, `head_email`, `head_contact`, `logo`, `favicon`, `exp_date`, `created_at`, `updated_at`) VALUES
(1, 'Branch One', 'branch1', 'Nawdapara', '01757839516', 'branch1@gmail.com', 1, NULL, 'Asikur Rahman', 'Principal', 'ashik@gmail.com', '01757839516', '1732516903.png', '1732517045.png', NULL, '2024-11-24 09:07:41', '2024-11-25 11:23:17'),
(2, 'Branch Two', 'branch2', 'Rajshahi', '01757839516', 'branch1@gmail.com', 1, NULL, 'Abdur Rahman', 'Principal', 'ar@gmail.com', '01757839516', NULL, NULL, NULL, '2024-11-24 09:07:41', '2024-11-25 11:23:24'),
(3, 'Nawdapara School', 'nschool', 'Nawdapara', '01757839516', 'ns@gmail.com', 1, NULL, 'Asikur Rahman', 'Principal', 'ashik@gmail.com', '01757839516', NULL, NULL, NULL, '2024-11-25 11:22:00', '2024-11-25 11:22:00');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `branch_id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial` tinyint UNSIGNED DEFAULT '0',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `branch_id`, `name`, `serial`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'General', 1, 1, '2024-11-29 13:07:24', '2024-11-29 13:07:24');

-- --------------------------------------------------------

--
-- Table structure for table `class_configs`
--

CREATE TABLE `class_configs` (
  `id` bigint UNSIGNED NOT NULL,
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

INSERT INTO `class_configs` (`id`, `branch_id`, `class_id`, `shift_id`, `section_id`, `serial`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 11, 1, 1, 1, 1, '2024-11-29 16:53:24', '2024-11-29 16:53:24');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fullMarks` decimal(6,2) DEFAULT '0.00',
  `writenMarks` decimal(6,2) DEFAULT '0.00',
  `practicalMarks` decimal(6,2) DEFAULT '0.00',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_halls`
--

CREATE TABLE `exam_halls` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rows` tinyint UNSIGNED DEFAULT NULL,
  `columns` tinyint UNSIGNED DEFAULT NULL,
  `capacity` smallint UNSIGNED DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exam_halls`
--

INSERT INTO `exam_halls` (`id`, `name`, `rows`, `columns`, `capacity`, `description`, `created_at`, `updated_at`) VALUES
(1, '101', 10, 4, 40, NULL, '2024-01-16 14:54:17', '2024-01-17 03:06:52');

-- --------------------------------------------------------

--
-- Table structure for table `exam_hall_students`
--

CREATE TABLE `exam_hall_students` (
  `exam_hall_id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL,
  `sl` bigint UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exam_hall_students`
--

INSERT INTO `exam_hall_students` (`exam_hall_id`, `student_id`, `sl`) VALUES
(1, 47, 0),
(1, 48, 0),
(1, 49, 0),
(1, 50, 0),
(1, 51, 0),
(1, 52, 0),
(1, 53, 0),
(1, 54, 0),
(1, 55, 0),
(1, 56, 0),
(1, 57, 0),
(1, 58, 0),
(1, 59, 0),
(1, 60, 0),
(1, 61, 0),
(1, 62, 0),
(1, 63, 0),
(1, 64, 0),
(1, 65, 0),
(1, 66, 0),
(1, 89, 0),
(1, 90, 0),
(1, 91, 0),
(1, 92, 0),
(1, 93, 0),
(1, 94, 0),
(1, 95, 0),
(1, 96, 0),
(1, 97, 0),
(1, 98, 0),
(1, 99, 0),
(1, 100, 0),
(1, 101, 0),
(1, 102, 0),
(1, 103, 0),
(1, 104, 0),
(1, 105, 0),
(1, 106, 0),
(1, 107, 0),
(1, 108, 0);

-- --------------------------------------------------------

--
-- Table structure for table `exam_lists`
--

CREATE TABLE `exam_lists` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_students`
--

CREATE TABLE `exam_students` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `roll` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reg_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `semester` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `institute` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shift` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `student_group` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_subject` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'REFFERED SUBJECT CODE',
  `technology` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `probidhan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exam_students`
--

INSERT INTO `exam_students` (`id`, `name`, `roll`, `reg_no`, `session`, `semester`, `institute`, `shift`, `student_group`, `ref_subject`, `technology`, `probidhan`, `status`, `remarks`, `mobile`, `created_at`, `updated_at`) VALUES
(1, 'FAHMIDA HAQUE ORIN', '627540', '1502184396', '21-22', '2nd', 'KPI', '1st', '2CTA1', NULL, 'Civil', NULL, 'regular', NULL, '1942273977', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(2, ' MD. ATIKUL ALOM', '728006', ' 1502305894', '22-23', '2nd', 'KPI', '1st', '2CTA1', NULL, 'Civil', NULL, 'regular', NULL, '1995435777', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(3, ' MD. LABIB KHAN', '728007', ' 1502257337', '22-23', '2nd', 'KPI', '1st', '2CTA1', NULL, 'Civil', NULL, 'regular', NULL, '1964597452', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(4, ' NADIA HASAN HABIBA', '728008', ' 1502257336', '22-23', '2nd', 'KPI', '1st', '2CTA1', NULL, 'Civil', NULL, 'regular', NULL, '1716519559', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(5, ' MD. SANTO ISLAM', '728009', ' 1502257335', '22-23', '2nd', 'KPI', '1st', '2CTA1', NULL, 'Civil', NULL, 'regular', NULL, '1307424487', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(6, ' MST. ASHMIYA AKTER AYNA', '728010', ' 1502257334', '22-23', '2nd', 'KPI', '1st', '2CTA1', NULL, 'Civil', NULL, 'regular', NULL, '1796067549', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(7, ' MST. FARHANA RAHMAN MIM', '728011', ' 1502257333', '22-23', '2nd', 'others', '1st', '2CTA1', NULL, 'Civil', NULL, 'regular', NULL, '1787515586', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(8, ' AL SHAHRIAR REMON', '728014', ' 1502257330', '22-23', '2nd', 'others', '1st', '2CTA1', NULL, 'Civil', NULL, 'regular', NULL, '1822043214', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(9, ' MST. JANNATUL FERDOUS DRISTI', '728015', ' 1502257329', '22-23', '2nd', 'others', '1st', '2CTA1', NULL, 'Civil', NULL, 'regular', NULL, '1726583506', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(10, ' HASNAT ARIFIN ROUNAK', '728016', ' 1502257328', '22-23', '2nd', 'others', '1st', '2CTA1', NULL, 'Civil', NULL, 'regular', NULL, '1915542399', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(11, ' MD. AMANULLAH AMAN', '728017', ' 1502257327', '22-23', '2nd', 'others', '1st', '2CTA1', NULL, 'Civil', NULL, 'regular', NULL, '1319447029', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(12, ' JANNATUL FERDAUS JAMEY', '728018', ' 1502257326', '22-23', '2nd', 'others', '1st', '2CTA1', NULL, 'Civil', NULL, 'regular', NULL, '1790895970', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(13, ' MD. ABDULLA BIN NUR', '728019', ' 1502257325', '22-23', '2nd', 'others', '1st', '2CTA1', NULL, 'Civil', NULL, 'regular', NULL, '1810338149', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(14, ' MD. ANIK HOSSEN', '728020', ' 1502257324', '22-23', '2nd', 'others', '1st', '2CTA1', NULL, 'Civil', NULL, 'regular', NULL, '1715297795', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(15, ' MD. SHOEB KHAN RION', '728021', ' 1502257323', '22-23', '2nd', 'others', '1st', '2CTA1', NULL, 'Civil', NULL, 'regular', NULL, '1790865995', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(16, ' KHONDOKER MAHMUD ABID TONMOY', '728022', ' 1502257322', '22-23', '2nd', 'others', '1st', '2CTA1', NULL, 'Civil', NULL, 'regular', NULL, '1947722593', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(17, ' MST. TINNE RAHMAN', '728023', ' 1502257321', '22-23', '2nd', 'others', '1st', '2CTA1', NULL, 'Civil', NULL, 'regular', NULL, '1714771311', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(18, ' MD. NAHID HASAN', '728024', ' 1502257320', '22-23', '2nd', 'others', '1st', '2CTA1', NULL, 'Civil', NULL, 'regular', NULL, '1863464923', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(19, ' MD HEMAYET ALI KHAN', '728025', ' 1502257319', '22-23', '2nd', 'others', '1st', '2CTA1', NULL, 'Civil', NULL, 'regular', NULL, '1738797072', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(20, ' MD LIKHON ALI', '728026', ' 1502257318', '22-23', '2nd', 'others', '1st', '2CTA1', NULL, 'Civil', NULL, 'regular', NULL, '1721318314', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(21, ' ABDULLA AL PRANTOR', '728027', ' 1502257317', '22-23', '2nd', 'others', '1st', '2CTA1', NULL, 'Civil', NULL, 'regular', NULL, '1759017546', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(22, ' MST.SUMAYA AKTER RINI', '728029', ' 1502257315', '22-23', '2nd', 'others', '1st', '2CTA1', NULL, 'Civil', NULL, 'regular', NULL, '1754161252', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(23, ' ABIR HOSSAIN SHAKKOR', '728030', ' 1502257314', '22-23', '2nd', 'others', '1st', '2CTA1', NULL, 'Civil', NULL, 'regular', NULL, '1646600080', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(24, ' TASNIMUL HASAN RIAD', '728031', ' 1502257313', '22-23', '2nd', 'others', '1st', '2CTA1', NULL, 'Civil', NULL, 'regular', NULL, '1758577694', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(25, ' MST. SURIYA AKTER NITU', '728032', ' 1502257312', '22-23', '2nd', 'others', '1st', '2CTA1', NULL, 'Civil', NULL, 'regular', NULL, '1743749139', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(26, ' MD.SAKIBUL HASAN SOHEL', '728033', ' 1502257311', '22-23', '2nd', 'others', '1st', '2CTA1', NULL, 'Civil', NULL, 'regular', NULL, '1791732980', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(27, ' ASIK AZAM HANIF', '728034', ' 1502257310', '22-23', '2nd', 'others', '1st', '2CTA1', NULL, 'Civil', NULL, 'regular', NULL, '1324222779', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(28, ' MST. MIM KHATUN', '728035', ' 1502257309', '22-23', '2nd', 'others', '1st', '2CTA1', NULL, 'Civil', NULL, 'regular', NULL, '1722021967', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(29, ' MST. TASNIM MAHAJABIN', '728037', ' 1502257307', '22-23', '2nd', 'others', '1st', '2CTA1', NULL, 'Civil', NULL, 'regular', NULL, '1715857444', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(30, ' MD RIFAT ALAM', '728038', ' 1502257306', '22-23', '2nd', 'others', '1st', '2CTA1', NULL, 'Civil', NULL, 'regular', NULL, '1724298584', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(31, ' MD. ABID HOSSAIN', '728039', ' 1502257305', '22-23', '2nd', 'KPI', '1st', '2CTA1', NULL, 'Civil', NULL, 'regular', NULL, '1744770573', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(32, ' SHEKH SHAHID', '728040', ' 1502257304', '22-23', '2nd', 'KPI', '1st', '2CTA1', NULL, 'Civil', NULL, 'regular', NULL, '1955807240', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(33, ' MD. MONIRUL ISLAM AKASH', '728041', ' 1502257303', '22-23', '2nd', 'KPI', '1st', '2CTA1', NULL, 'Civil', NULL, 'regular', NULL, '1323487820', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(34, ' MST. TASNIM BINTI ATHOY', '728042', ' 1502257302', '22-23', '2nd', 'KPI', '1st', '2CTA1', NULL, 'Civil', NULL, 'regular', NULL, '1751339039', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(35, ' SHORIA AKTER ROSHNI', '728043', ' 1502257301', '22-23', '2nd', 'KPI', '1st', '2CTA1', NULL, 'Civil', NULL, 'regular', NULL, '1764596652', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(36, ' MD.SABBIR HOSSAIN', '728044', ' 1502257300', '22-23', '2nd', 'KPI', '1st', '2CTA1', NULL, 'Civil', NULL, 'regular', NULL, '1878637139', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(37, ' SEAM MAHAMUD SOKAL', '728045', ' 1502257299', '22-23', '2nd', 'KPI', '1st', '2CTA1', NULL, 'Civil', NULL, 'regular', NULL, '1325814610', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(38, ' MD. TONMOY HASAN', '728046', ' 1502257298', '22-23', '2nd', 'KPI', '1st', '2CTA1', NULL, 'Civil', NULL, 'regular', NULL, '1759845035', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(39, ' MD. ISMAIL HOSSAIN', '728047', ' 1502257297', '22-23', '2nd', 'KPI', '1st', '2CTA1', NULL, 'Civil', NULL, 'regular', NULL, '1403067758', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(40, ' UMME SURAIYA OTHOY', '728048', ' 1502257296', '22-23', '2nd', 'KPI', '1st', '2CTA1', NULL, 'Civil', NULL, 'regular', NULL, '1716297617', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(41, ' MD MARUF HOSSAIN', '728049', ' 1502257295', '22-23', '2nd', 'KPI', '1st', '2CTA1', NULL, 'Civil', NULL, 'regular', NULL, '1753662370', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(42, ' RAWSHANARA BINTE HAFIZ', '728050', ' 1502257294', '22-23', '2nd', 'KPI', '1st', '2CTA1', NULL, 'Civil', NULL, 'regular', NULL, '1780734122', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(43, ' MOMINUL ISLAM PIASH', '728051', ' 1502257293', '22-23', '2nd', 'KPI', '1st', '2CTA1', NULL, 'Civil', NULL, 'regular', NULL, '1787314047', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(44, ' MD. SIFAT HOSSAIN LAM', '728052', ' 1502257292', '22-23', '2nd', 'KPI', '1st', '2CTA1', NULL, 'Civil', NULL, 'regular', NULL, '1571283971', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(45, ' MD. TOUSIF MOSTAFA', '728053', ' 1502257291', '22-23', '2nd', 'KPI', '1st', '2CTA1', NULL, 'Civil', NULL, 'regular', NULL, '1635587742', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(46, 'MD. SAZADUL ISLAM SOJUL', '746735', '1502271077', '2223', '2nd', 'KPI', '1st', '2CTA1', NULL, 'Civil', NULL, 'regular', 'Transfar', NULL, '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(47, ' MD. SAYEM ISLAM', '728055', ' 1502257289', '22-23', '2nd', 'KPI', '1st', '2CTB1', NULL, 'Civil', NULL, 'regular', NULL, '1771960594', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(48, ' MD. ISMAM HOSSEN ROHAN', '728056', ' 1502257288', '22-23', '2nd', 'KPI', '1st', '2CTB1', NULL, 'Civil', NULL, 'regular', NULL, '1707655989', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(49, ' MD. ASIF ABDULLA', '728057', ' 1502257287', '22-23', '2nd', 'KPI', '1st', '2CTB1', NULL, 'Civil', NULL, 'regular', NULL, '1726907482', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(50, ' RATUL HASAN NOYTIK', '728058', ' 1502257286', '22-23', '2nd', 'KPI', '1st', '2CTB1', NULL, 'Civil', NULL, 'regular', NULL, '1868193365', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(51, ' MOHIUDDIN BORSHON', '728059', ' 1502257285', '22-23', '2nd', 'KPI', '1st', '2CTB1', NULL, 'Civil', NULL, 'regular', NULL, '1814375452', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(52, ' MD NABID HASAN', '728061', ' 1502257283', '22-23', '2nd', 'KPI', '1st', '2CTB1', NULL, 'Civil', NULL, 'regular', NULL, '1730168469', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(53, ' MST. SUMAIYA KHATUN', '728062', ' 1502257282', '22-23', '2nd', 'KPI', '1st', '2CTB1', NULL, 'Civil', NULL, 'regular', NULL, '1868274654', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(54, ' S.M. SATIL MAHMUD', '728063', ' 1502257281', '22-23', '2nd', 'KPI', '1st', '2CTB1', NULL, 'Civil', NULL, 'regular', NULL, '1926899579', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(55, ' KAYSER AHAMED BAPPY', '728065', ' 1502257279', '22-23', '2nd', 'KPI', '1st', '2CTB1', NULL, 'Civil', NULL, 'regular', NULL, '1954923995', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(56, ' MST. MISHTY KHATUN', '728066', ' 1502257278', '22-23', '2nd', 'KPI', '1st', '2CTB1', NULL, 'Civil', NULL, 'regular', NULL, '1726478722', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(57, ' MST. URMILA AKTER', '728068', ' 1502257276', '22-23', '2nd', 'KPI', '1st', '2CTB1', NULL, 'Civil', NULL, 'regular', NULL, '1987471990', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(58, ' MST. TRISHE RAHMAN', '728069', ' 1502257275', '22-23', '2nd', 'KPI', '1st', '2CTB1', NULL, 'Civil', NULL, 'regular', NULL, '1714771311', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(59, ' MD. SHARIAR HOSSIN', '728070', ' 1502257274', '22-23', '2nd', 'KPI', '1st', '2CTB1', NULL, 'Civil', NULL, 'regular', NULL, '1740887856', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(60, ' MD. RASEL', '728071', ' 1502257273', '22-23', '2nd', 'KPI', '1st', '2CTB1', NULL, 'Civil', NULL, 'regular', NULL, '1317075250', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(61, ' MST. NUSRAT JAHAN', '728072', ' 1502257272', '22-23', '2nd', 'KPI', '1st', '2CTB1', NULL, 'Civil', NULL, 'regular', NULL, '1725816340', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(62, ' MD.RAFIUL ISLAM', '728073', ' 1502257271', '22-23', '2nd', 'KPI', '1st', '2CTB1', NULL, 'Civil', NULL, 'regular', NULL, '1737386410', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(63, ' MD. RONI', '728075', ' 1502257269', '22-23', '2nd', 'KPI', '1st', '2CTB1', NULL, 'Civil', NULL, 'regular', NULL, '1310472838', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(64, ' SAWOUN KUMAR BISWAS', '728076', ' 1502257268', '22-23', '2nd', 'KPI', '1st', '2CTB1', NULL, 'Civil', NULL, 'regular', NULL, '1993061454', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(65, ' GOPENATH BISWAS', '728077', ' 1502257267', '22-23', '2nd', 'KPI', '1st', '2CTB1', NULL, 'Civil', NULL, 'regular', NULL, '1962356588', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(66, ' MD. ROHAN UDDIN MRIDHA', '728078', ' 1502257266', '22-23', '2nd', 'KPI', '1st', '2CTB1', NULL, 'Civil', NULL, 'regular', NULL, '1566050466', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(67, ' MD. ANIKUJJAMAN ANIK', '728079', ' 1502257265', '22-23', '2nd', 'KPI', '1st', '2CTB1', NULL, 'Civil', NULL, 'regular', NULL, '1613869642', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(68, ' TANVIR AHMED NAKIB', '728080', ' 1502257264', '22-23', '2nd', 'KPI', '1st', '2CTB1', NULL, 'Civil', NULL, 'regular', NULL, '1770565200', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(69, ' MD. JEHAD HOSSAIN', '728081', ' 1502257263', '22-23', '2nd', 'KPI', '1st', '2CTB1', NULL, 'Civil', NULL, 'regular', NULL, '1707147419', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(70, ' MD. SABBIR MONDAL', '728082', ' 1502257262', '22-23', '2nd', 'KPI', '1st', '2CTB1', NULL, 'Civil', NULL, 'regular', NULL, '1918090869', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(71, ' MD. ARKAM JAHAN', '728083', ' 1502257261', '22-23', '2nd', 'KPI', '1st', '2CTB1', NULL, 'Civil', NULL, 'regular', NULL, '1922054324', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(72, ' MD. SHOHAN HOSSAIN', '728085', ' 1502257259', '22-23', '2nd', 'KPI', '1st', '2CTB1', NULL, 'Civil', NULL, 'regular', NULL, '1308848054', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(73, ' AMIT PODDER', '728086', ' 1502257258', '22-23', '2nd', 'KPI', '1st', '2CTB1', NULL, 'Civil', NULL, 'regular', NULL, '1732040887', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(74, ' MYMUNA ISLAM LEA', '728087', ' 1502257257', '22-23', '2nd', 'KPI', '1st', '2CTB1', NULL, 'Civil', NULL, 'regular', NULL, '1719920298', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(75, ' MST. BONI AKTER', '728088', ' 1502257256', '22-23', '2nd', 'KPI', '1st', '2CTB1', NULL, 'Civil', NULL, 'regular', NULL, '1733268748', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(76, ' MASUM HOSSEN SHANTO', '728089', ' 1502257255', '22-23', '2nd', 'KPI', '1st', '2CTB1', NULL, 'Civil', NULL, 'regular', NULL, '1401838879', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(77, ' SOUMAN SARKAR', '728090', ' 1502257254', '22-23', '2nd', 'KPI', '1st', '2CTB1', NULL, 'Civil', NULL, 'regular', NULL, '1818964374', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(78, ' MD. TONMOY ISLAM', '728091', ' 1502257253', '22-23', '2nd', 'KPI', '1st', '2CTB1', NULL, 'Civil', NULL, 'regular', NULL, '1790896419', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(79, ' MD. SHAHIN BISWASH', '728092', ' 1502257252', '22-23', '2nd', 'KPI', '1st', '2CTB1', NULL, 'Civil', NULL, 'regular', NULL, '1770984690', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(80, ' MST. SOMONA AKTER SOHAGEE', '728093', ' 1502257251', '22-23', '2nd', 'KPI', '1st', '2CTB1', NULL, 'Civil', NULL, 'regular', NULL, '1963745600', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(81, ' ABU SAID TUMUL', '728094', ' 1502257250', '22-23', '2nd', 'KPI', '1st', '2CTB1', NULL, 'Civil', NULL, 'regular', NULL, '1719766385', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(82, ' SHAHAJADA AL MURSALIN', '728098', ' 1502257248', '22-23', '2nd', 'KPI', '1st', '2CTB1', NULL, 'Civil', NULL, 'regular', NULL, '1785826675', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(83, ' UMME ROSNI HAQUE', '728101', ' 1502257245', '22-23', '2nd', 'KPI', '1st', '2CTB1', NULL, 'Civil', NULL, 'regular', NULL, '1798464529', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(84, ' MOU AKTHER', '728104', ' 1502257244', '22-23', '2nd', 'KPI', '1st', '2CTB1', NULL, 'Civil', NULL, 'regular', NULL, '1739721360', '2024-01-12 03:40:53', '2024-01-12 03:40:53'),
(85, ' MARIAM CHOWDHURY', '728105', ' 1502257243', '22-23', '2nd', 'KPI', '1st', '2CTB1', NULL, 'Civil', NULL, 'regular', NULL, '1712335477', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(86, ' MST. KABERE AKTER MIM', '728106', ' 1502257242', '22-23', '2nd', 'KPI', '1st', '2CTB1', NULL, 'Civil', NULL, 'regular', NULL, '1839953877', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(87, 'MD. AL MAHFUZ', '740540', '1502266307', '2223', '2nd', 'KPI', '1st', '2CTB1', NULL, 'Civil', NULL, 'regular', 'Transfar', NULL, '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(88, 'MD BOSHIR AHMED', '790398', '1502308011', '22-23', '2nd', 'KPI', '1st', '2CTB1', NULL, 'Civil', NULL, 'regular', NULL, NULL, '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(89, ' MD.SABBIR AHAMED SIJAN', '728107', ' 1502305907', '22-23', '2nd', 'KPI', '2nd', '2CTA2', NULL, 'Civil', NULL, 'regular', NULL, '1709177987', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(90, ' MD. MAHMUDUL HASAN MAHIN', '728132', ' 1502257918', '22-23', '2nd', 'KPI', '2nd', '2CTA2', NULL, 'Civil', NULL, 'regular', NULL, '1830536772', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(91, ' MD.ABDUL WAHED', '728134', ' 1502257917', '22-23', '2nd', 'KPI', '2nd', '2CTA2', NULL, 'Civil', NULL, 'regular', NULL, '1817850529', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(92, ' RUBIA ISLAM', '728137', ' 1502257915', '22-23', '2nd', 'KPI', '2nd', '2CTA2', NULL, 'Civil', NULL, 'regular', NULL, '1720688321', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(93, ' MD.NAHIBUR RAHMAN', '728138', ' 1502257914', '22-23', '2nd', 'KPI', '2nd', '2CTA2', NULL, 'Civil', NULL, 'regular', NULL, '1907997439', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(94, ' MD. BIJOY HOSSEN', '728139', ' 1502257913', '22-23', '2nd', 'KPI', '2nd', '2CTA2', NULL, 'Civil', NULL, 'regular', NULL, '1757157686', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(95, ' MD PARVEZ KOMOL', '728140', ' 1502257912', '22-23', '2nd', 'KPI', '2nd', '2CTA2', NULL, 'Civil', NULL, 'regular', NULL, '1960614722', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(96, ' MST. ALO AKTER MISTI', '728144', ' 1502257910', '22-23', '2nd', 'KPI', '2nd', '2CTA2', NULL, 'Civil', NULL, 'regular', NULL, '1320474826', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(97, ' MD. RIMON AHAMAD', '728145', ' 1502257909', '22-23', '2nd', 'KPI', '2nd', '2CTA2', NULL, 'Civil', NULL, 'regular', NULL, '1995612504', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(98, ' MD. ASHIQUR ROHAMAN', '728148', ' 1502257908', '22-23', '2nd', 'KPI', '2nd', '2CTA2', NULL, 'Civil', NULL, 'regular', NULL, '1301339871', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(99, ' MD. ARAFAT MIA', '728149', ' 1502257907', '22-23', '2nd', 'KPI', '2nd', '2CTA2', NULL, 'Civil', NULL, 'regular', NULL, '1707520867', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(100, ' NAEEM IBNE KAMAL', '728151', ' 1502257906', '22-23', '2nd', 'KPI', '2nd', '2CTA2', NULL, 'Civil', NULL, 'regular', NULL, '1521457248', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(101, ' IBNE JUBAYER ALI', '728152', ' 1502257905', '22-23', '2nd', 'KPI', '2nd', '2CTA2', NULL, 'Civil', NULL, 'regular', NULL, '1751829324', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(102, ' MD. WADUR ZAMAN', '728153', ' 1502257904', '22-23', '2nd', 'KPI', '2nd', '2CTA2', NULL, 'Civil', NULL, 'regular', NULL, '1787156625', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(103, ' OVE AHMED', '728154', ' 1502257903', '22-23', '2nd', 'KPI', '2nd', '2CTA2', NULL, 'Civil', NULL, 'regular', NULL, '1752274995', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(104, ' MD. SELIM UDDIN', '728155', ' 1502257902', '22-23', '2nd', 'KPI', '2nd', '2CTA2', NULL, 'Civil', NULL, 'regular', NULL, '1867026305', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(105, ' MD.GOLAM RABBI', '728156', ' 1502257901', '22-23', '2nd', 'KPI', '2nd', '2CTA2', NULL, 'Civil', NULL, 'regular', NULL, '1759563960', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(106, ' MD. ZIM HOSSAIN', '728158', ' 1502257900', '22-23', '2nd', 'KPI', '2nd', '2CTA2', NULL, 'Civil', NULL, 'regular', NULL, '1953915036', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(107, ' MD. ALSAD HOSSAIN SAIKAT', '728159', ' 1502257899', '22-23', '2nd', 'KPI', '2nd', '2CTA2', NULL, 'Civil', NULL, 'regular', NULL, '1615458285', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(108, ' NISRAT PARVEZ MARIA', '728162', ' 1502257898', '22-23', '2nd', 'KPI', '2nd', '2CTA2', NULL, 'Civil', NULL, 'regular', NULL, '1761718624', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(109, ' MD. SABBIR HOSSAIN', '728163', ' 1502257897', '22-23', '2nd', 'KPI', '2nd', '2CTA2', NULL, 'Civil', NULL, 'regular', NULL, '1405599512', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(110, ' MD. SAIFUL ISLAM', '728164', ' 1502257896', '22-23', '2nd', 'KPI', '2nd', '2CTA2', NULL, 'Civil', NULL, 'regular', NULL, '1763710348', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(111, ' MD. JANNATUN NAYEEM', '728165', ' 1502257895', '22-23', '2nd', 'KPI', '2nd', '2CTA2', NULL, 'Civil', NULL, 'regular', NULL, '1764693592', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(112, ' MST FATEMA KHATUN', '728168', ' 1502257894', '22-23', '2nd', 'KPI', '2nd', '2CTA2', NULL, 'Civil', NULL, 'regular', NULL, '1304895683', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(113, ' MD. NISAR WAZID', '728169', ' 1502257893', '22-23', '2nd', 'KPI', '2nd', '2CTA2', NULL, 'Civil', NULL, 'regular', NULL, '1568682485', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(114, ' MD. EMON ALI', '728170', ' 1502257892', '22-23', '2nd', 'KPI', '2nd', '2CTA2', NULL, 'Civil', NULL, 'regular', NULL, '1316154318', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(115, ' MD. ABIR HASAN', '728173', ' 1502257891', '22-23', '2nd', 'KPI', '2nd', '2CTA2', NULL, 'Civil', NULL, 'regular', NULL, '1575498187', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(116, ' UMMA MADHA', '728175', ' 1502257890', '22-23', '2nd', 'KPI', '2nd', '2CTA2', NULL, 'Civil', NULL, 'regular', NULL, '1744904580', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(117, ' SHUPTO HOSSAN SIMUL', '728176', ' 1502257889', '22-23', '2nd', 'KPI', '2nd', '2CTA2', NULL, 'Civil', NULL, 'regular', NULL, '1711201013', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(118, ' EMON AHMED', '728184', ' 1502257886', '22-23', '2nd', 'KPI', '2nd', '2CTA2', NULL, 'Civil', NULL, 'regular', NULL, '1793115854', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(119, ' MD.RASEL ALI', '728188', ' 1502257885', '22-23', '2nd', 'KPI', '2nd', '2CTA2', NULL, 'Civil', NULL, 'regular', NULL, '1926158275', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(120, ' MD. NUR ISLAM SHUVO', '728192', ' 1502257883', '22-23', '2nd', 'KPI', '2nd', '2CTA2', NULL, 'Civil', NULL, 'regular', NULL, '1728335197', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(121, ' SANJID ALOM RIFAT', '728197', ' 1502257882', '22-23', '2nd', 'KPI', '2nd', '2CTA2', NULL, 'Civil', NULL, 'regular', NULL, '1301251877', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(122, ' ZAKARIAR AHMED', '728217', ' 1502257881', '22-23', '2nd', 'KPI', '2nd', '2CTA2', NULL, 'Civil', NULL, 'regular', NULL, '1814314459', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(123, ' MD. JUBAIR HOSEN JIBON', '728224', ' 1502257880', '22-23', '2nd', 'KPI', '2nd', '2CTA2', NULL, 'Civil', NULL, 'regular', NULL, '1927042642', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(124, ' LABIBA ISLAM', '728225', ' 1502257879', '22-23', '2nd', 'KPI', '2nd', '2CTA2', NULL, 'Civil', NULL, 'regular', NULL, '1773969443', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(125, ' SOJIB HOSSAIN SHIMUL', '728226', ' 1502257878', '22-23', '2nd', 'KPI', '2nd', '2CTA2', NULL, 'Civil', NULL, 'regular', NULL, '1740190829', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(126, ' MD. ATIKUR RAHMAN', '728228', ' 1502257877', '22-23', '2nd', 'KPI', '2nd', '2CTA2', NULL, 'Civil', NULL, 'regular', NULL, '1571386112', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(127, ' SINTHIA YASMIN MEGHLA', '728231', ' 1502257876', '22-23', '2nd', 'KPI', '2nd', '2CTA2', NULL, 'Civil', NULL, 'regular', NULL, '1734336522', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(128, ' MD. JIHAD ISLAM', '728232', ' 1502257875', '22-23', '2nd', 'KPI', '2nd', '2CTA2', NULL, 'Civil', NULL, 'regular', NULL, '1996491106', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(129, ' MD. SHAKIB', '728233', ' 1502257874', '22-23', '2nd', 'KPI', '2nd', '2CTA2', NULL, 'Civil', NULL, 'regular', NULL, '1306483388', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(130, ' MD. ROMJAN ALI', '728236', ' 1502257873', '22-23', '2nd', 'KPI', '2nd', '2CTA2', NULL, 'Civil', NULL, 'regular', NULL, '1771853808', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(131, ' SADIA TABASSUM TUBA', '728237', ' 1502257872', '22-23', '2nd', 'KPI', '2nd', '2CTA2', NULL, 'Civil', NULL, 'regular', NULL, '1972345805', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(132, ' MD. NANTU RAHMAN', '728238', ' 1502257871', '22-23', '2nd', 'KPI', '2nd', '2CTA2', NULL, 'Civil', NULL, 'regular', NULL, '1309536816', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(133, ' TOWHIDA AKTER ILMA', '728239', ' 1502257870', '22-23', '2nd', 'KPI', '2nd', '2CTA2', NULL, 'Civil', NULL, 'regular', NULL, '1721065072', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(134, ' SHAMSURNAHAR MAYA', '728240', ' 1502257869', '22-23', '2nd', 'KPI', '2nd', '2CTA2', NULL, 'Civil', NULL, 'regular', NULL, '1750174973', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(135, 'MD. ABDULLAH AL BARI', '736796', '1502264054', '2223', '2nd', 'KPI', '2nd', '2CTA2', NULL, 'Civil', NULL, 'regular', 'Transfar', NULL, '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(136, ' EMON AHAMMED', '728242', ' 1502257868', '22-23', '2nd', 'KPI', '2nd', '2CTB2', NULL, 'Civil', NULL, 'regular', NULL, '1947954186', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(137, ' BAPPY AHMED', '728243', ' 1502257867', '22-23', '2nd', 'KPI', '2nd', '2CTB2', NULL, 'Civil', NULL, 'regular', NULL, '1751543960', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(138, ' MD. ROWSHON ALOM', '728244', ' 1502257866', '22-23', '2nd', 'KPI', '2nd', '2CTB2', NULL, 'Civil', NULL, 'regular', NULL, '1743644767', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(139, ' SAHABI RAHMAN SHAKIB', '728245', ' 1502257865', '22-23', '2nd', 'KPI', '2nd', '2CTB2', NULL, 'Civil', NULL, 'regular', NULL, '1850457800', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(140, ' MD. MARUF HOSSEN', '728248', ' 1502257864', '22-23', '2nd', 'KPI', '2nd', '2CTB2', NULL, 'Civil', NULL, 'regular', NULL, '1868243040', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(141, ' ABU SALEH SHOVON', '728252', ' 1502257863', '22-23', '2nd', 'KPI', '2nd', '2CTB2', NULL, 'Civil', NULL, 'regular', NULL, '1567932674', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(142, ' MD. MOSADDIK RASHID MUHIT', '728259', ' 1502257862', '22-23', '2nd', 'KPI', '2nd', '2CTB2', NULL, 'Civil', NULL, 'regular', NULL, '1818349204', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(143, ' MD. TAMIM ISLAM', '728261', ' 1502257861', '22-23', '2nd', 'KPI', '2nd', '2CTB2', NULL, 'Civil', NULL, 'regular', NULL, '1781353147', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(144, ' MD. SHAHINUR RAHMAN', '728262', ' 1502257860', '22-23', '2nd', 'KPI', '2nd', '2CTB2', NULL, 'Civil', NULL, 'regular', NULL, '1703386621', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(145, ' MEHEDI HASAN', '728267', ' 1502257859', '22-23', '2nd', 'KPI', '2nd', '2CTB2', NULL, 'Civil', NULL, 'regular', NULL, '1813666652', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(146, ' DISHA RANI', '728280', ' 1502257856', '22-23', '2nd', 'KPI', '2nd', '2CTB2', NULL, 'Civil', NULL, 'regular', NULL, '1771974774', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(147, ' MD. MASHRAFE HOSSAIN', '728286', ' 1502257854', '22-23', '2nd', 'KPI', '2nd', '2CTB2', NULL, 'Civil', NULL, 'regular', NULL, '1916410565', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(148, ' MST. SUNJANA ZAMAN PURNOTA', '728288', ' 1502257853', '22-23', '2nd', 'KPI', '2nd', '2CTB2', NULL, 'Civil', NULL, 'regular', NULL, '1952635735', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(149, ' MD. LIMON HOSSAIN', '728289', ' 1502257852', '22-23', '2nd', 'KPI', '2nd', '2CTB2', NULL, 'Civil', NULL, 'regular', NULL, '1700504419', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(150, ' TANVIR ANJUM ANKON', '728290', ' 1502257851', '22-23', '2nd', 'KPI', '2nd', '2CTB2', NULL, 'Civil', NULL, 'regular', NULL, '1786327978', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(151, ' HASIBUL HASAN MAHI', '728291', ' 1502257850', '22-23', '2nd', 'KPI', '2nd', '2CTB2', NULL, 'Civil', NULL, 'regular', NULL, '1765498547', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(152, ' PURNIMA BISWAS', '728293', ' 1502257849', '22-23', '2nd', 'KPI', '2nd', '2CTB2', NULL, 'Civil', NULL, 'regular', NULL, '1571209823', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(153, ' EBADOT HOSSAIN', '728294', ' 1502257848', '22-23', '2nd', 'KPI', '2nd', '2CTB2', NULL, 'Civil', NULL, 'regular', NULL, '1870706524', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(154, ' MD. MOMINUL ISLAM MUKTA', '728299', ' 1502257847', '22-23', '2nd', 'KPI', '2nd', '2CTB2', NULL, 'Civil', NULL, 'regular', NULL, '1718045843', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(155, ' MD.MAHFUZ BIN ANTOR', '728301', ' 1502257846', '22-23', '2nd', 'KPI', '2nd', '2CTB2', NULL, 'Civil', NULL, 'regular', NULL, '1304536624', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(156, ' MD. ROKYBUL ISLAM', '728304', ' 1502257845', '22-23', '2nd', 'KPI', '2nd', '2CTB2', NULL, 'Civil', NULL, 'regular', NULL, '1303251431', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(157, ' MST. JANNATUL FERDOUS EVA', '728306', ' 1502257844', '22-23', '2nd', 'KPI', '2nd', '2CTB2', NULL, 'Civil', NULL, 'regular', NULL, '1728992805', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(158, ' MD. ABIR HOSSAIN', '728310', ' 1502257842', '22-23', '2nd', 'KPI', '2nd', '2CTB2', NULL, 'Civil', NULL, 'regular', NULL, '1733296068', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(159, ' ZUBAER AHMED RUMON', '728314', ' 1502257839', '22-23', '2nd', 'KPI', '2nd', '2CTB2', NULL, 'Civil', NULL, 'regular', NULL, '1750666707', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(160, ' SAIF AL SAMI', '728321', ' 1502257837', '22-23', '2nd', 'KPI', '2nd', '2CTB2', NULL, 'Civil', NULL, 'regular', NULL, '1917893390', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(161, ' MST. MAYA KHATUN', '728322', ' 1502257836', '22-23', '2nd', 'KPI', '2nd', '2CTB2', NULL, 'Civil', NULL, 'regular', NULL, '1323364611', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(162, ' MST.MOHUYA AKTER JIM', '728328', ' 1502257833', '22-23', '2nd', 'KPI', '2nd', '2CTB2', NULL, 'Civil', NULL, 'regular', NULL, '1753545003', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(163, ' JARIN AHMED PROVA', '728354', ' 1502257832', '22-23', '2nd', 'KPI', '2nd', '2CTB2', NULL, 'Civil', NULL, 'regular', NULL, '1752318165', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(164, ' MEHEDI RUMI SORDAR', '728361', ' 1502257831', '22-23', '2nd', 'KPI', '2nd', '2CTB2', NULL, 'Civil', NULL, 'regular', NULL, '1884924507', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(165, ' MURAD SHEIKH', '728363', ' 1502257830', '22-23', '2nd', 'KPI', '2nd', '2CTB2', NULL, 'Civil', NULL, 'regular', NULL, '1595682996', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(166, ' MD.ANIK SIKDER', '728364', ' 1502257829', '22-23', '2nd', 'KPI', '2nd', '2CTB2', NULL, 'Civil', NULL, 'regular', NULL, '1609089860', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(167, ' MST. SADIATUZ ZIMIYA', '728380', ' 1502257828', '22-23', '2nd', 'KPI', '2nd', '2CTB2', NULL, 'Civil', NULL, 'regular', NULL, '1723300085', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(168, ' RITTIK KUMAR DAS', '728381', ' 1502257827', '22-23', '2nd', 'KPI', '2nd', '2CTB2', NULL, 'Civil', NULL, 'regular', NULL, '1706947407', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(169, ' JANNATUL BULBUL', '728382', ' 1502257826', '22-23', '2nd', 'KPI', '2nd', '2CTB2', NULL, 'Civil', NULL, 'regular', NULL, '1749630615', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(170, ' MST. MOHIMA KHATUN', '728383', ' 1502257825', '22-23', '2nd', 'KPI', '2nd', '2CTB2', NULL, 'Civil', NULL, 'regular', NULL, '1756711570', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(171, ' SADIA SULTANA PITHILA', '728384', ' 1502257824', '22-23', '2nd', 'KPI', '2nd', '2CTB2', NULL, 'Civil', NULL, 'regular', NULL, '1316049122', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(172, ' MD. AL HAMIM', '728387', ' 1502257822', '22-23', '2nd', 'KPI', '2nd', '2CTB2', NULL, 'Civil', NULL, 'regular', NULL, '1860156581', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(173, ' MST.NUSRAT JAHAN SHANTA', '728388', ' 1502257821', '22-23', '2nd', 'KPI', '2nd', '2CTB2', NULL, 'Civil', NULL, 'regular', NULL, '1790064306', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(174, ' MD. SOHAN HOSEN', '728389', ' 1502257820', '22-23', '2nd', 'KPI', '2nd', '2CTB2', NULL, 'Civil', NULL, 'regular', NULL, '1795392988', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(175, 'AMIR HAMZA', '628814', ' 1502184346', '21-22', '2nd', 'KPI', '1st', '2CMTA1', NULL, 'Computer', NULL, 'regular', NULL, NULL, '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(176, ' MD. FAHIM FERDOUS', '729634', ' 1502305906', '22-23', '2nd', 'KPI', '1st', '2CMTA1', NULL, 'Computer', NULL, 'regular', NULL, '1878353494', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(177, ' OMAIR AHMED', '729635', ' 1502305905', '22-23', '2nd', 'KPI', '1st', '2CMTA1', NULL, 'Computer', NULL, 'regular', NULL, '1957039008', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(178, ' MD. MUTTAKIN HASAN', '729636', ' 1502305904', '22-23', '2nd', 'KPI', '1st', '2CMTA1', NULL, 'Computer', NULL, 'regular', NULL, '1718854708', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(179, ' MD. MUSHFIQUR RAHMAN RIDWAN', '729637', ' 1502257819', '22-23', '2nd', 'KPI', '1st', '2CMTA1', NULL, 'Computer', NULL, 'regular', NULL, '1722455501', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(180, ' BIJOY AHMED SOBUJ', '729639', ' 1502257817', '22-23', '2nd', 'KPI', '1st', '2CMTA1', NULL, 'Computer', NULL, 'regular', NULL, '1817849561', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(181, ' MD. JUBAIER KHAN', '729642', ' 1502257815', '22-23', '2nd', 'KPI', '1st', '2CMTA1', NULL, 'Computer', NULL, 'regular', NULL, '1892558981', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(182, ' MD. SHADIF HASAN', '729644', ' 1502257814', '22-23', '2nd', 'KPI', '1st', '2CMTA1', NULL, 'Computer', NULL, 'regular', NULL, '1715684715', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(183, ' EMTIAZ AHAMMAD LEMON', '729645', ' 1502257813', '22-23', '2nd', 'KPI', '1st', '2CMTA1', NULL, 'Computer', NULL, 'regular', NULL, '1715694222', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(184, ' MST. NAZIFA HASAN', '729646', ' 1502257812', '22-23', '2nd', 'KPI', '1st', '2CMTA1', NULL, 'Computer', NULL, 'regular', NULL, '1904371358', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(185, ' FAHIM AHMMED SARUF', '729647', ' 1502257811', '22-23', '2nd', 'KPI', '1st', '2CMTA1', NULL, 'Computer', NULL, 'regular', NULL, '1315470307', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(186, ' MD SAZZAD HOSSAIN', '729650', ' 1502257809', '22-23', '2nd', 'KPI', '1st', '2CMTA1', NULL, 'Computer', NULL, 'regular', NULL, '1843848025', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(187, ' MD. ASHIKUR RAHAMAN ASIF', '729652', ' 1502257808', '22-23', '2nd', 'KPI', '1st', '2CMTA1', NULL, 'Computer', NULL, 'regular', NULL, '1777558061', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(188, ' MD. MASUM BILLAH', '729653', ' 1502257807', '22-23', '2nd', 'KPI', '1st', '2CMTA1', NULL, 'Computer', NULL, 'regular', NULL, '1401753259', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(189, ' AL HABIB FERDOUS', '729654', ' 1502257806', '22-23', '2nd', 'KPI', '1st', '2CMTA1', NULL, 'Computer', NULL, 'regular', NULL, '1964500046', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(190, ' JOYA KHATUN', '729657', ' 1502257804', '22-23', '2nd', 'KPI', '1st', '2CMTA1', NULL, 'Computer', NULL, 'regular', NULL, '1728934299', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(191, ' MD. JUWEL RANA', '729659', ' 1502257803', '22-23', '2nd', 'KPI', '1st', '2CMTA1', NULL, 'Computer', NULL, 'regular', NULL, '1684766383', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(192, ' SHEMANTO MALAKAR', '729660', ' 1502257802', '22-23', '2nd', 'KPI', '1st', '2CMTA1', NULL, 'Computer', NULL, 'regular', NULL, '1716505156', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(193, ' MD. SHUYAIB ISLAM', '729662', ' 1502257801', '22-23', '2nd', 'KPI', '1st', '2CMTA1', NULL, 'Computer', NULL, 'regular', NULL, '1321950194', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(194, ' MD SADAT HOSSAIN', '729665', ' 1502257798', '22-23', '2nd', 'KPI', '1st', '2CMTA1', NULL, 'Computer', NULL, 'regular', NULL, '1722398109', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(195, ' MST. SADIA SULTANA', '729666', ' 1502257797', '22-23', '2nd', 'KPI', '1st', '2CMTA1', NULL, 'Computer', NULL, 'regular', NULL, '1884307911', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(196, ' MD. TASIN ISLAM', '729667', ' 1502257796', '22-23', '2nd', 'KPI', '1st', '2CMTA1', NULL, 'Computer', NULL, 'regular', NULL, '1863369532', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(197, ' MST ONAMIKA KHATUN ORNI', '729668', ' 1502257795', '22-23', '2nd', 'KPI', '1st', '2CMTA1', NULL, 'Computer', NULL, 'regular', NULL, '1739108888', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(198, ' MD. ASHRAFUL ISLAM', '729670', ' 1502257794', '22-23', '2nd', 'KPI', '1st', '2CMTA1', NULL, 'Computer', NULL, 'regular', NULL, '1300913249', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(199, ' RIZIA SULTANA ROZA', '729673', ' 1502257793', '22-23', '2nd', 'KPI', '1st', '2CMTA1', NULL, 'Computer', NULL, 'regular', NULL, '1712130294', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(200, ' MD. ATIKUR RAHMAN', '729674', ' 1502257792', '22-23', '2nd', 'KPI', '1st', '2CMTA1', NULL, 'Computer', NULL, 'regular', NULL, '1873406089', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(201, ' MD. ZISAN UDDIN', '729675', ' 1502257791', '22-23', '2nd', 'KPI', '1st', '2CMTA1', NULL, 'Computer', NULL, 'regular', NULL, '1842579457', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(202, ' P.M. UMOR FARUK AHAMMED NURJOY', '729678', ' 1502257790', '22-23', '2nd', 'KPI', '1st', '2CMTA1', NULL, 'Computer', NULL, 'regular', NULL, '1823282375', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(203, ' BIPROJEET ROY', '729679', ' 1502257789', '22-23', '2nd', 'KPI', '1st', '2CMTA1', NULL, 'Computer', NULL, 'regular', NULL, '1788526383', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(204, ' MD. CHAND MIA', '729680', ' 1502257788', '22-23', '2nd', 'KPI', '1st', '2CMTA1', NULL, 'Computer', NULL, 'regular', NULL, '1305421415', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(205, ' MST. SUMAIYA YESMIN', '729681', ' 1502257787', '22-23', '2nd', 'KPI', '1st', '2CMTA1', NULL, 'Computer', NULL, 'regular', NULL, '1920610065', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(206, ' MD. RUBAYET HOSSAIN', '729682', ' 1502257786', '22-23', '2nd', 'KPI', '1st', '2CMTA1', NULL, 'Computer', NULL, 'regular', NULL, '1798283897', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(207, ' MST. NISHAT TAMANNA NITU', '729683', ' 1502257785', '22-23', '2nd', 'KPI', '1st', '2CMTA1', NULL, 'Computer', NULL, 'regular', NULL, '1717406742', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(208, ' AKHI KHATUN', '729684', ' 1502257784', '22-23', '2nd', 'KPI', '1st', '2CMTA1', NULL, 'Computer', NULL, 'regular', NULL, '1747573057', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(209, ' TASNIM SABA', '729685', ' 1502257783', '22-23', '2nd', 'KPI', '1st', '2CMTA1', NULL, 'Computer', NULL, 'regular', NULL, '1712048640', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(210, ' MD ROKI', '729686', ' 1502257782', '22-23', '2nd', 'KPI', '1st', '2CMTA1', NULL, 'Computer', NULL, 'regular', NULL, '1307261289', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(211, ' MD.KAMRUZZAMAN NAHID', '729687', ' 1502257781', '22-23', '2nd', 'KPI', '1st', '2CMTA1', NULL, 'Computer', NULL, 'regular', NULL, '1795256072', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(212, ' MUNAYEM HOSSAIN MRIDUL', '729689', ' 1502257780', '22-23', '2nd', 'KPI', '1st', '2CMTA1', NULL, 'Computer', NULL, 'regular', NULL, '1985901029', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(213, ' MD. JABER ALI', '729690', ' 1502257779', '22-23', '2nd', 'KPI', '1st', '2CMTA1', NULL, 'Computer', NULL, 'regular', NULL, '1889487844', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(214, ' SIAM MAHMUD RUBEL', '729691', ' 1502257778', '22-23', '2nd', 'KPI', '1st', '2CMTA1', NULL, 'Computer', NULL, 'regular', NULL, '1963183246', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(215, ' ZAYAN HASAN TAJ', '729693', ' 1502257777', '22-23', '2nd', 'KPI', '1st', '2CMTA1', NULL, 'Computer', NULL, 'regular', NULL, '1716555093', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(216, ' ABDULLAH AL NOMAN', '729694', ' 1502257776', '22-23', '2nd', 'KPI', '1st', '2CMTA1', NULL, 'Computer', NULL, 'regular', NULL, '1772551875', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(217, ' SUMAYA AKTER JUI', '729695', ' 1502257775', '22-23', '2nd', 'KPI', '1st', '2CMTA1', NULL, 'Computer', NULL, 'regular', NULL, '1780937199', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(218, 'MST. SUMAYA KHATUN', '731244', '1502259473', '2223', '2nd', 'KPI', '1st', '2CMTA1', NULL, 'Computer', NULL, 'regular', 'Transfar', NULL, '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(219, 'MD. NAZMUS SAKIB', '731250', '1502259467', '2223', '2nd', 'KPI', '1st', '2CMTA1', NULL, 'Computer', NULL, 'regular', 'Transfar', NULL, '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(220, ' JARIN TASNIM TONNI', '729696', ' 1502257774', '22-23', '2nd', 'KPI', '1st', '2CMTB1', NULL, 'Computer', NULL, 'regular', NULL, '1730904226', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(221, ' MD. RAKIBUL ISLAM ROBI', '729697', ' 1502257773', '22-23', '2nd', 'KPI', '1st', '2CMTB1', NULL, 'Computer', NULL, 'regular', NULL, '1788752957', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(222, ' AL AMIN', '729699', ' 1502257771', '22-23', '2nd', 'KPI', '1st', '2CMTB1', NULL, 'Computer', NULL, 'regular', NULL, '1312211961', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(223, ' MD. SHADHIN HOSSAIN', '729701', ' 1502257770', '22-23', '2nd', 'KPI', '1st', '2CMTB1', NULL, 'Computer', NULL, 'regular', NULL, '1944704599', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(224, ' MD SIAM', '729702', ' 1502257769', '22-23', '2nd', 'KPI', '1st', '2CMTB1', NULL, 'Computer', NULL, 'regular', NULL, '1795973133', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(225, ' MD. ASHRAFUL ISLAM TONMOY', '729704', ' 1502257768', '22-23', '2nd', 'KPI', '1st', '2CMTB1', NULL, 'Computer', NULL, 'regular', NULL, '1765333663', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(226, ' RANA HOSSAIN', '729706', ' 1502257766', '22-23', '2nd', 'KPI', '1st', '2CMTB1', NULL, 'Computer', NULL, 'regular', NULL, '1615465289', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(227, ' SOHEL ALI', '729707', ' 1502257765', '22-23', '2nd', 'KPI', '1st', '2CMTB1', NULL, 'Computer', NULL, 'regular', NULL, '1316487517', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(228, ' SABBIR HOSSAIN', '729708', ' 1502257764', '22-23', '2nd', 'KPI', '1st', '2CMTB1', NULL, 'Computer', NULL, 'regular', NULL, '1595681249', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(229, ' MD. MAHMUDUL HAQUE SHAON', '729711', ' 1502257762', '22-23', '2nd', 'KPI', '1st', '2CMTB1', NULL, 'Computer', NULL, 'regular', NULL, '1882635096', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(230, ' ARIB BIN MASUD', '729712', ' 1502257761', '22-23', '2nd', 'KPI', '1st', '2CMTB1', NULL, 'Computer', NULL, 'regular', NULL, '1754648837', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(231, ' TASDIQUEL ISLAM AFIF', '729713', ' 1502257760', '22-23', '2nd', 'KPI', '1st', '2CMTB1', NULL, 'Computer', NULL, 'regular', NULL, '1721333103', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(232, ' MD. ABIR HASAN CHOWDHURY', '729715', ' 1502257759', '22-23', '2nd', 'KPI', '1st', '2CMTB1', NULL, 'Computer', NULL, 'regular', NULL, '1754433418', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(233, ' MST. MITHILA AKTER JUI', '729718', ' 1502257758', '22-23', '2nd', 'KPI', '1st', '2CMTB1', NULL, 'Computer', NULL, 'regular', NULL, '1987333460', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(234, ' MD. YEAMINUR RAHMAN', '729719', ' 1502257757', '22-23', '2nd', 'KPI', '1st', '2CMTB1', NULL, 'Computer', NULL, 'regular', NULL, '1766640755', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(235, ' MD. SABBIR HOSSAIN SAJOL', '729722', ' 1502257756', '22-23', '2nd', 'KPI', '1st', '2CMTB1', NULL, 'Computer', NULL, 'regular', NULL, '1719056129', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(236, ' MD. NAHID HASAN', '729723', ' 1502257755', '22-23', '2nd', 'KPI', '1st', '2CMTB1', NULL, 'Computer', NULL, 'regular', NULL, '1792538802', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(237, ' MST. ZOHURA YEASMIN TANIA', '729724', ' 1502257754', '22-23', '2nd', 'KPI', '1st', '2CMTB1', NULL, 'Computer', NULL, 'regular', NULL, '1319765638', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(238, ' MD. MAZHARUL ISLAM', '729728', ' 1502257753', '22-23', '2nd', 'KPI', '1st', '2CMTB1', NULL, 'Computer', NULL, 'regular', NULL, '1938636377', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(239, ' MD. LIMON RAHMAN JISHAN', '729730', ' 1502257751', '22-23', '2nd', 'KPI', '1st', '2CMTB1', NULL, 'Computer', NULL, 'regular', NULL, '1912448455', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(240, ' FERDOUS REZA', '729731', ' 1502257750', '22-23', '2nd', 'KPI', '1st', '2CMTB1', NULL, 'Computer', NULL, 'regular', NULL, '1761108999', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(241, ' TUHIN MONDOL', '729733', ' 1502257749', '22-23', '2nd', 'KPI', '1st', '2CMTB1', NULL, 'Computer', NULL, 'regular', NULL, '1313319145', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(242, ' BIJOY KUMAR GHOSH', '729734', ' 1502257748', '22-23', '2nd', 'KPI', '1st', '2CMTB1', NULL, 'Computer', NULL, 'regular', NULL, '1828746460', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(243, ' MST. JUI KHATUN', '729735', ' 1502257747', '22-23', '2nd', 'KPI', '1st', '2CMTB1', NULL, 'Computer', NULL, 'regular', NULL, '1977968324', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(244, ' MST. MARIA ZAMAN TISHA', '729736', ' 1502257746', '22-23', '2nd', 'KPI', '1st', '2CMTB1', NULL, 'Computer', NULL, 'regular', NULL, '1726189870', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(245, ' AHAD ALI', '729739', ' 1502257745', '22-23', '2nd', 'KPI', '1st', '2CMTB1', NULL, 'Computer', NULL, 'regular', NULL, '1400225414', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(246, ' MD. MONTAHIM FAHIM', '729745', ' 1502257743', '22-23', '2nd', 'KPI', '1st', '2CMTB1', NULL, 'Computer', NULL, 'regular', NULL, '1310298112', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(247, ' MST. SALIMA AKTER PROVA', '729747', ' 1502257741', '22-23', '2nd', 'KPI', '1st', '2CMTB1', NULL, 'Computer', NULL, 'regular', NULL, '1319761286', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(248, ' AL AHESAN AKASH', '729750', ' 1502257740', '22-23', '2nd', 'KPI', '1st', '2CMTB1', NULL, 'Computer', NULL, 'regular', NULL, '1962170755', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(249, ' ARIN KUMAR GHOSH', '729751', ' 1502257739', '22-23', '2nd', 'KPI', '1st', '2CMTB1', NULL, 'Computer', NULL, 'regular', NULL, '1310205409', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(250, ' IMTIAZ AHMED SHUVO', '729756', ' 1502257737', '22-23', '2nd', 'KPI', '1st', '2CMTB1', NULL, 'Computer', NULL, 'regular', NULL, '1402942191', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(251, ' AMIT KUMAR', '729757', ' 1502257736', '22-23', '2nd', 'KPI', '1st', '2CMTB1', NULL, 'Computer', NULL, 'regular', NULL, '1790145383', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(252, ' MD. ASHEQUR RAHMAN', '729758', ' 1502257735', '22-23', '2nd', 'KPI', '1st', '2CMTB1', NULL, 'Computer', NULL, 'regular', NULL, '1777813012', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(253, ' IFRATARA JAHAN JIM', '729759', ' 1502257734', '22-23', '2nd', 'KPI', '1st', '2CMTB1', NULL, 'Computer', NULL, 'regular', NULL, '1719707008', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(254, ' MASUM SHEIKH', '729760', ' 1502257733', '22-23', '2nd', 'KPI', '1st', '2CMTB1', NULL, 'Computer', NULL, 'regular', NULL, '1870373406', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(255, ' MD. POLASH', '729761', ' 1502257732', '22-23', '2nd', 'KPI', '1st', '2CMTB1', NULL, 'Computer', NULL, 'regular', NULL, '1323376075', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(256, ' MD. SHIMUL ISLAM', '729766', ' 1502257729', '22-23', '2nd', 'KPI', '1st', '2CMTB1', NULL, 'Computer', NULL, 'regular', NULL, '1795126412', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(257, ' RAJIB BISWAS', '729767', ' 1502257728', '22-23', '2nd', 'KPI', '1st', '2CMTB1', NULL, 'Computer', NULL, 'regular', NULL, '1830981712', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(258, ' MD. NOYON SORKAR', '729768', ' 1502257727', '22-23', '2nd', 'KPI', '1st', '2CMTB1', NULL, 'Computer', NULL, 'regular', NULL, '1892151906', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(259, ' MST. TAJKEYA RAHMAN', '729771', ' 1502257726', '22-23', '2nd', 'KPI', '1st', '2CMTB1', NULL, 'Computer', NULL, 'regular', NULL, '1317226701', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(260, ' MD. IMON ALI', '729772', ' 1502257725', '22-23', '2nd', 'KPI', '1st', '2CMTB1', NULL, 'Computer', NULL, 'regular', NULL, '1983161694', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(261, ' ABU JAFOR SUVO', '729773', ' 1502257724', '22-23', '2nd', 'KPI', '1st', '2CMTB1', NULL, 'Computer', NULL, 'regular', NULL, '1707146468', '2024-01-12 03:40:54', '2024-01-12 03:40:54');
INSERT INTO `exam_students` (`id`, `name`, `roll`, `reg_no`, `session`, `semester`, `institute`, `shift`, `student_group`, `ref_subject`, `technology`, `probidhan`, `status`, `remarks`, `mobile`, `created_at`, `updated_at`) VALUES
(262, ' MD.RIFAT PARVEZ', '729775', ' 1502257723', '22-23', '2nd', 'KPI', '1st', '2CMTB1', NULL, 'Computer', NULL, 'regular', NULL, '1722248288', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(263, 'MD SHOBUZ HOSSAIN', '426211', '1502051740', '19-20', '2nd', 'KPI', '2nd', '2CMTA2', NULL, 'Computer', NULL, 'regular', NULL, NULL, '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(264, 'RANA AHMED', '629138', ' 1502184894', '21-22', '2nd', 'KPI', '2nd', '2CMTA2', NULL, 'Computer', NULL, 'regular', NULL, '1703383860', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(265, ' MD. SOHAN AHAMMED', '729776', ' 1502305915', '22-23', '2nd', 'KPI', '2nd', '2CMTA2', NULL, 'Computer', NULL, 'regular', NULL, '1724912341', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(266, ' TANMOY', '729778', ' 1502258400', '22-23', '2nd', 'KPI', '2nd', '2CMTA2', NULL, 'Computer', NULL, 'regular', NULL, '1321579422', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(267, ' MD.ARJU AHAMED', '729779', ' 1502258399', '22-23', '2nd', 'KPI', '2nd', '2CMTA2', NULL, 'Computer', NULL, 'regular', NULL, '1787102455', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(268, ' SHEIKH SAFAT US SAFA', '729781', ' 1502258398', '22-23', '2nd', 'KPI', '2nd', '2CMTA2', NULL, 'Computer', NULL, 'regular', NULL, '1832823669', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(269, ' MD. ABRAR TAJOAR', '729782', ' 1502258397', '22-23', '2nd', 'KPI', '2nd', '2CMTA2', NULL, 'Computer', NULL, 'regular', NULL, '1853931748', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(270, ' MASHRABIN MHERAB ABIR', '729783', ' 1502258396', '22-23', '2nd', 'KPI', '2nd', '2CMTA2', NULL, 'Computer', NULL, 'regular', NULL, '1303567883', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(271, ' MD. APON HOSSEN', '729785', ' 1502258395', '22-23', '2nd', 'KPI', '2nd', '2CMTA2', NULL, 'Computer', NULL, 'regular', NULL, '1706616673', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(272, ' MD. EAKTIAR UDDIN LAZIM', '729789', ' 1502258393', '22-23', '2nd', 'KPI', '2nd', '2CMTA2', NULL, 'Computer', NULL, 'regular', NULL, '1756911998', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(273, ' MD. SEAM', '729790', ' 1502258392', '22-23', '2nd', 'KPI', '2nd', '2CMTA2', NULL, 'Computer', NULL, 'regular', NULL, '1882729046', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(274, ' MD RASEL FAKIR', '729791', ' 1502258391', '22-23', '2nd', 'KPI', '2nd', '2CMTA2', NULL, 'Computer', NULL, 'regular', NULL, '1323781821', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(275, ' TOUHED HASAN LIMON', '729795', ' 1502258390', '22-23', '2nd', 'KPI', '2nd', '2CMTA2', NULL, 'Computer', NULL, 'regular', NULL, '1610523512', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(276, ' MST. MARIA SULTANA', '729799', ' 1502258389', '22-23', '2nd', 'KPI', '2nd', '2CMTA2', NULL, 'Computer', NULL, 'regular', NULL, '1405400626', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(277, ' MD. MOHTASIM HABIB AKKHOR', '729801', ' 1502258388', '22-23', '2nd', 'KPI', '2nd', '2CMTA2', NULL, 'Computer', NULL, 'regular', NULL, '1710865690', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(278, ' MD. SHAHIN ALAM', '729805', ' 1502258386', '22-23', '2nd', 'KPI', '2nd', '2CMTA2', NULL, 'Computer', NULL, 'regular', NULL, '1967066773', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(279, ' MD. MAHMUDUL HASAN TANVIR', '729806', ' 1502258385', '22-23', '2nd', 'KPI', '2nd', '2CMTA2', NULL, 'Computer', NULL, 'regular', NULL, '1773557710', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(280, ' MD. MASUM HASSAN', '729808', ' 1502258383', '22-23', '2nd', 'KPI', '2nd', '2CMTA2', NULL, 'Computer', NULL, 'regular', NULL, '1788050342', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(281, ' AJIM HOSEN', '729815', ' 1502258382', '22-23', '2nd', 'KPI', '2nd', '2CMTA2', NULL, 'Computer', NULL, 'regular', NULL, '1311041453', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(282, ' MST. RIA KHATUN', '729822', ' 1502258381', '22-23', '2nd', 'KPI', '2nd', '2CMTA2', NULL, 'Computer', NULL, 'regular', NULL, '1405400626', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(283, ' MD. RIDOY ALI MALITHA', '729827', ' 1502258380', '22-23', '2nd', 'KPI', '2nd', '2CMTA2', NULL, 'Computer', NULL, 'regular', NULL, '1790018050', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(284, ' SALAUDDIN KHALID EMON', '729828', ' 1502258379', '22-23', '2nd', 'KPI', '2nd', '2CMTA2', NULL, 'Computer', NULL, 'regular', NULL, '1689997196', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(285, ' MD TOMAL MAHAMUD', '729839', ' 1502258376', '22-23', '2nd', 'KPI', '2nd', '2CMTA2', NULL, 'Computer', NULL, 'regular', NULL, '1778442238', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(286, ' MD. NOMAN IBNE SABIT', '729843', ' 1502258375', '22-23', '2nd', 'KPI', '2nd', '2CMTA2', NULL, 'Computer', NULL, 'regular', NULL, '1893401953', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(287, ' SABINA YASMIN MEGLA', '729845', ' 1502258374', '22-23', '2nd', 'KPI', '2nd', '2CMTA2', NULL, 'Computer', NULL, 'regular', NULL, '1760898489', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(288, ' MD. RIMON HOSSAIN', '729847', ' 1502258373', '22-23', '2nd', 'KPI', '2nd', '2CMTA2', NULL, 'Computer', NULL, 'regular', NULL, '1738525225', '2024-01-12 03:40:54', '2024-01-12 03:40:54'),
(289, ' MD. TUSHER', '729849', ' 1502258372', '22-23', '2nd', 'KPI', '2nd', '2CMTA2', NULL, 'Computer', NULL, 'regular', NULL, '1794389496', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(290, ' KHONDOKAR JARIF MAHMUD NIROB', '729852', ' 1502258371', '22-23', '2nd', 'KPI', '2nd', '2CMTA2', NULL, 'Computer', NULL, 'regular', NULL, '1937873785', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(291, ' ROWTUSHI ISLAM RICHI', '729869', ' 1502258369', '22-23', '2nd', 'KPI', '2nd', '2CMTA2', NULL, 'Computer', NULL, 'regular', NULL, '1777031157', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(292, ' RAFIA TABASSUM', '729873', ' 1502258368', '22-23', '2nd', 'KPI', '2nd', '2CMTA2', NULL, 'Computer', NULL, 'regular', NULL, '1718611875', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(293, ' MST.JHARNA', '729877', ' 1502258367', '22-23', '2nd', 'KPI', '2nd', '2CMTA2', NULL, 'Computer', NULL, 'regular', NULL, '1707302322', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(294, ' MST. SHADIA AFRIN', '729878', ' 1502258366', '22-23', '2nd', 'KPI', '2nd', '2CMTA2', NULL, 'Computer', NULL, 'regular', NULL, '1820859914', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(295, ' MST.MIM KHATUN', '729882', ' 1502258365', '22-23', '2nd', 'KPI', '2nd', '2CMTA2', NULL, 'Computer', NULL, 'regular', NULL, '1858567966', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(296, ' MST. MAYESHA TABASSUM', '729883', ' 1502258364', '22-23', '2nd', 'KPI', '2nd', '2CMTA2', NULL, 'Computer', NULL, 'regular', NULL, '1749374992', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(297, ' MD. JISAN UR ZAMAN', '729884', ' 1502258363', '22-23', '2nd', 'KPI', '2nd', '2CMTA2', NULL, 'Computer', NULL, 'regular', NULL, '1941639993', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(298, ' PROKETI SAHA RAKHI', '729886', ' 1502258362', '22-23', '2nd', 'KPI', '2nd', '2CMTA2', NULL, 'Computer', NULL, 'regular', NULL, '1746416111', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(299, ' MD. RIDOWAN FAISAL', '729888', ' 1502258360', '22-23', '2nd', 'KPI', '2nd', '2CMTA2', NULL, 'Computer', NULL, 'regular', NULL, '1936643901', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(300, ' MINAD HASAN', '729889', ' 1502258359', '22-23', '2nd', 'KPI', '2nd', '2CMTA2', NULL, 'Computer', NULL, 'regular', NULL, '1400255774', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(301, ' MST. SINTHIA', '729891', ' 1502258358', '22-23', '2nd', 'KPI', '2nd', '2CMTA2', NULL, 'Computer', NULL, 'regular', NULL, '1918868495', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(302, ' MARUF SHEKH', '729892', ' 1502258357', '22-23', '2nd', 'KPI', '2nd', '2CMTA2', NULL, 'Computer', NULL, 'regular', NULL, '1312774525', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(303, ' MD. KAMRUZZAMAN', '729894', ' 1502258355', '22-23', '2nd', 'KPI', '2nd', '2CMTA2', NULL, 'Computer', NULL, 'regular', NULL, '1931538124', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(304, ' MD TANVIR SHEIKH', '729895', ' 1502258354', '22-23', '2nd', 'KPI', '2nd', '2CMTA2', NULL, 'Computer', NULL, 'regular', NULL, '1581024889', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(305, ' AYASHA SIDDIQUE SARAH', '729898', ' 1502258353', '22-23', '2nd', 'KPI', '2nd', '2CMTB2', NULL, 'Computer', NULL, 'regular', NULL, '1745651072', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(306, ' MD. RATUL HASSAN MARUF', '729900', ' 1502258352', '22-23', '2nd', 'KPI', '2nd', '2CMTB2', NULL, 'Computer', NULL, 'regular', NULL, '1870368840', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(307, ' MD. RAKIBUJJAMAN', '729901', ' 1502258351', '22-23', '2nd', 'KPI', '2nd', '2CMTB2', NULL, 'Computer', NULL, 'regular', NULL, '1625413363', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(308, ' MST. SADIA AKTER', '729908', ' 1502258349', '22-23', '2nd', 'KPI', '2nd', '2CMTB2', NULL, 'Computer', NULL, 'regular', NULL, '1787137461', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(309, ' TASMIA RAHMAN PROVA', '729914', ' 1502258348', '22-23', '2nd', 'KPI', '2nd', '2CMTB2', NULL, 'Computer', NULL, 'regular', NULL, '1638693905', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(310, ' SHAKIB AL HASAN', '729916', ' 1502258347', '22-23', '2nd', 'KPI', '2nd', '2CMTB2', NULL, 'Computer', NULL, 'regular', NULL, '1792392696', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(311, ' MD. JUBAYER AHAMMED', '729918', ' 1502258346', '22-23', '2nd', 'KPI', '2nd', '2CMTB2', NULL, 'Computer', NULL, 'regular', NULL, '1721148203', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(312, ' REDWAN HOSSEN', '729920', ' 1502258345', '22-23', '2nd', 'KPI', '2nd', '2CMTB2', NULL, 'Computer', NULL, 'regular', NULL, '1320433517', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(313, ' MST. TAMANNA AKTAR', '729927', ' 1502258343', '22-23', '2nd', 'KPI', '2nd', '2CMTB2', NULL, 'Computer', NULL, 'regular', NULL, '1754516104', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(314, ' MST. RATHI KHATUN', '729928', ' 1502258342', '22-23', '2nd', 'KPI', '2nd', '2CMTB2', NULL, 'Computer', NULL, 'regular', NULL, '1759389842', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(315, ' MD. KAMRAN HOSSAIN', '729929', ' 1502258341', '22-23', '2nd', 'KPI', '2nd', '2CMTB2', NULL, 'Computer', NULL, 'regular', NULL, '1765216961', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(316, ' UTTOM KUMAR', '729930', ' 1502258340', '22-23', '2nd', 'KPI', '2nd', '2CMTB2', NULL, 'Computer', NULL, 'regular', NULL, '1708612078', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(317, ' MD. ABDUL MOMIN', '729932', ' 1502258339', '22-23', '2nd', 'KPI', '2nd', '2CMTB2', NULL, 'Computer', NULL, 'regular', NULL, '1301224589', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(318, ' MD. NAVIDUL ISLAM', '729936', ' 1502258338', '22-23', '2nd', 'KPI', '2nd', '2CMTB2', NULL, 'Computer', NULL, 'regular', NULL, '1892559063', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(319, ' MD. ABDULLAH AL MAMUN', '729940', ' 1502258337', '22-23', '2nd', 'KPI', '2nd', '2CMTB2', NULL, 'Computer', NULL, 'regular', NULL, '1902630221', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(320, ' NABIA TABUSSUM BORSHA', '729941', ' 1502258336', '22-23', '2nd', 'KPI', '2nd', '2CMTB2', NULL, 'Computer', NULL, 'regular', NULL, '1938968188', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(321, ' MD LIMON UDDIN BISWAS', '729944', ' 1502258335', '22-23', '2nd', 'KPI', '2nd', '2CMTB2', NULL, 'Computer', NULL, 'regular', NULL, '1954630578', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(322, ' MD. SHUVO ALI', '729949', ' 1502258333', '22-23', '2nd', 'KPI', '2nd', '2CMTB2', NULL, 'Computer', NULL, 'regular', NULL, '1743282036', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(323, ' SABID HASAN', '729951', ' 1502258332', '22-23', '2nd', 'KPI', '2nd', '2CMTB2', NULL, 'Computer', NULL, 'regular', NULL, '1824240087', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(324, ' AFIFA ISLAM ANANNA', '729955', ' 1502258330', '22-23', '2nd', 'KPI', '2nd', '2CMTB2', NULL, 'Computer', NULL, 'regular', NULL, '1711477972', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(325, ' MD NAEEM HOSSAIN', '729956', ' 1502258329', '22-23', '2nd', 'KPI', '2nd', '2CMTB2', NULL, 'Computer', NULL, 'regular', NULL, '1778756401', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(326, ' MARSHAL MOHAMMAD MAFIN', '729958', ' 1502258328', '22-23', '2nd', 'KPI', '2nd', '2CMTB2', NULL, 'Computer', NULL, 'regular', NULL, '1708641835', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(327, ' FAHMIDA FAIZA', '729963', ' 1502258327', '22-23', '2nd', 'KPI', '2nd', '2CMTB2', NULL, 'Computer', NULL, 'regular', NULL, '1722324457', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(328, ' MD. NAIMUL ARAF', '729968', ' 1502258326', '22-23', '2nd', 'KPI', '2nd', '2CMTB2', NULL, 'Computer', NULL, 'regular', NULL, '1925229125', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(329, ' SHOHANUR RHOMAN BADHON', '729969', ' 1502258325', '22-23', '2nd', 'KPI', '2nd', '2CMTB2', NULL, 'Computer', NULL, 'regular', NULL, '1840841345', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(330, ' NAFIZA HAQUE', '729970', ' 1502258324', '22-23', '2nd', 'KPI', '2nd', '2CMTB2', NULL, 'Computer', NULL, 'regular', NULL, '1739787276', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(331, ' NUR ZOBAYRA', '729972', ' 1502258322', '22-23', '2nd', 'KPI', '2nd', '2CMTB2', NULL, 'Computer', NULL, 'regular', NULL, '1530191742', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(332, ' NAHID HOSSEN', '729974', ' 1502258320', '22-23', '2nd', 'KPI', '2nd', '2CMTB2', NULL, 'Computer', NULL, 'regular', NULL, '1864084361', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(333, ' SABBIR HOSSAIN', '729975', ' 1502258319', '22-23', '2nd', 'KPI', '2nd', '2CMTB2', NULL, 'Computer', NULL, 'regular', NULL, '1734232264', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(334, ' MD. MITUL HOSSAIN', '729977', ' 1502258318', '22-23', '2nd', 'KPI', '2nd', '2CMTB2', NULL, 'Computer', NULL, 'regular', NULL, '1867953917', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(335, ' MD.SAEEM HOSEN', '729981', ' 1502258316', '22-23', '2nd', 'KPI', '2nd', '2CMTB2', NULL, 'Computer', NULL, 'regular', NULL, '1911490524', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(336, ' MD ANIK', '729985', ' 1502258315', '22-23', '2nd', 'KPI', '2nd', '2CMTB2', NULL, 'Computer', NULL, 'regular', NULL, '1983747068', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(337, ' TAMANNA KAZI', '729988', ' 1502258314', '22-23', '2nd', 'KPI', '2nd', '2CMTB2', NULL, 'Computer', NULL, 'regular', NULL, '1743787346', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(338, ' ASIF BISWAS', '729989', ' 1502258313', '22-23', '2nd', 'KPI', '2nd', '2CMTB2', NULL, 'Computer', NULL, 'regular', NULL, '1998176095', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(339, ' MST. JANNATUL FERDAUSHI MIM', '729991', ' 1502258312', '22-23', '2nd', 'KPI', '2nd', '2CMTB2', NULL, 'Computer', NULL, 'regular', NULL, '1595635644', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(340, ' MD. ROMAN SHARKAR', '729996', ' 1502258310', '22-23', '2nd', 'KPI', '2nd', '2CMTB2', NULL, 'Computer', NULL, 'regular', NULL, '1613869895', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(341, ' USID ALMAS', '729998', ' 1502258309', '22-23', '2nd', 'KPI', '2nd', '2CMTB2', NULL, 'Computer', NULL, 'regular', NULL, '1968333947', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(342, ' MD. ABDULLAH', '730000', ' 1502258307', '22-23', '2nd', 'KPI', '2nd', '2CMTB2', NULL, 'Computer', NULL, 'regular', NULL, '1821972730', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(343, ' MD. SOHAN ALI', '730001', ' 1502258306', '22-23', '2nd', 'KPI', '2nd', '2CMTB2', NULL, 'Computer', NULL, 'regular', NULL, '1617151770', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(344, 'BADHON AHMED SABBIR', '734539', '1502262099', '2223', '2nd', 'KPI', '2nd', '2CMTB2', NULL, 'Computer', NULL, 'regular', 'Transfar', NULL, '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(345, ' MD. NIRJON KABIR', '728390', ' 1502305896', '22-23', '2nd', 'KPI', '1st', '2ETA1', NULL, 'Electrical', NULL, 'regular', NULL, '1309271201', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(346, ' MD. ASIF MAHMUD', '728398', ' 1502305895', '22-23', '2nd', 'KPI', '1st', '2ETA1', NULL, 'Electrical', NULL, 'regular', NULL, '1951216182', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(347, ' MD. ABDULLAH', '728400', ' 1502257433', '22-23', '2nd', 'KPI', '1st', '2ETA1', NULL, 'Electrical', NULL, 'regular', NULL, '1300362873', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(348, ' MD. ABDULLAH IBNE AZIZ', '728402', ' 1502257432', '22-23', '2nd', 'KPI', '1st', '2ETA1', NULL, 'Electrical', NULL, 'regular', NULL, '1778135981', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(349, ' MD. ROKONUZZAMAN', '728411', ' 1502257429', '22-23', '2nd', 'KPI', '1st', '2ETA1', NULL, 'Electrical', NULL, 'regular', NULL, '1770707030', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(350, ' SREE SUPROJIT KARMAKAR', '728412', ' 1502257428', '22-23', '2nd', 'KPI', '1st', '2ETA1', NULL, 'Electrical', NULL, 'regular', NULL, '1930855626', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(351, ' HUSSAIN AHMED', '728425', ' 1502257427', '22-23', '2nd', 'KPI', '1st', '2ETA1', NULL, 'Electrical', NULL, 'regular', NULL, '1781325407', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(352, ' DIPA SORKAR', '728426', ' 1502257426', '22-23', '2nd', 'KPI', '1st', '2ETA1', NULL, 'Electrical', NULL, 'regular', NULL, '1304548372', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(353, ' B. M. JUBAER ABID', '728431', ' 1502257424', '22-23', '2nd', 'KPI', '1st', '2ETA1', NULL, 'Electrical', NULL, 'regular', NULL, '1776383428', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(354, ' KHONDOKAR ASHIQUR RAHMAN ASIF', '728433', ' 1502257423', '22-23', '2nd', 'KPI', '1st', '2ETA1', NULL, 'Electrical', NULL, 'regular', NULL, '1843270620', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(355, ' MD. AKTARUZZAMAN', '728434', ' 1502257422', '22-23', '2nd', 'KPI', '1st', '2ETA1', NULL, 'Electrical', NULL, 'regular', NULL, '1798137490', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(356, ' MD. TANVIR AHMED NAYEM', '728435', ' 1502257421', '22-23', '2nd', 'KPI', '1st', '2ETA1', NULL, 'Electrical', NULL, 'regular', NULL, '1538383112', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(357, ' TAHSAN RASHID NABIL', '728436', ' 1502257420', '22-23', '2nd', 'KPI', '1st', '2ETA1', NULL, 'Electrical', NULL, 'regular', NULL, '1957649085', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(358, ' MD. HASMOT ALI', '728437', ' 1502257419', '22-23', '2nd', 'KPI', '1st', '2ETA1', NULL, 'Electrical', NULL, 'regular', NULL, '1742591358', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(359, ' MD. TANZIR AHMED', '728438', ' 1502257418', '22-23', '2nd', 'KPI', '1st', '2ETA1', NULL, 'Electrical', NULL, 'regular', NULL, '1939143135', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(360, ' FUAD HOSSAN', '728439', ' 1502257417', '22-23', '2nd', 'KPI', '1st', '2ETA1', NULL, 'Electrical', NULL, 'regular', NULL, '1748235472', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(361, ' MD. SAAD IBN MUWAS', '728443', ' 1502257414', '22-23', '2nd', 'KPI', '1st', '2ETA1', NULL, 'Electrical', NULL, 'regular', NULL, '1721443246', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(362, ' MD. ABU SAYYED HOSSAIN TAMIM', '728445', ' 1502257413', '22-23', '2nd', 'KPI', '1st', '2ETA1', NULL, 'Electrical', NULL, 'regular', NULL, '1405725051', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(363, ' JIBON AHMED', '728446', ' 1502257412', '22-23', '2nd', 'KPI', '1st', '2ETA1', NULL, 'Electrical', NULL, 'regular', NULL, '1319591625', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(364, ' MST. ESHA YEASMIN KHUSHBU', '728447', ' 1502257411', '22-23', '2nd', 'KPI', '1st', '2ETA1', NULL, 'Electrical', NULL, 'regular', NULL, '1777178941', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(365, ' MD. ALIF HOSSAIN', '728448', ' 1502257410', '22-23', '2nd', 'KPI', '1st', '2ETA1', NULL, 'Electrical', NULL, 'regular', NULL, '1739981208', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(366, ' MD. RIDOY HOSSEN', '728449', ' 1502257409', '22-23', '2nd', 'KPI', '1st', '2ETA1', NULL, 'Electrical', NULL, 'regular', NULL, '1823337552', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(367, ' MD SHOHANUR RAHMAN', '728450', ' 1502257408', '22-23', '2nd', 'KPI', '1st', '2ETA1', NULL, 'Electrical', NULL, 'regular', NULL, '1771416153', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(368, ' MD. ATIKUR RAHMAN SANTO', '728454', ' 1502257407', '22-23', '2nd', 'KPI', '1st', '2ETA1', NULL, 'Electrical', NULL, 'regular', NULL, '1709086568', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(369, ' MST. FARIA AFROZ RIA', '728455', ' 1502257406', '22-23', '2nd', 'KPI', '1st', '2ETA1', NULL, 'Electrical', NULL, 'regular', NULL, '1824723770', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(370, ' MD IZAZUL ALAM', '728456', ' 1502257405', '22-23', '2nd', 'KPI', '1st', '2ETA1', NULL, 'Electrical', NULL, 'regular', NULL, '1712853387', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(371, ' MD. ABDULLAH AL SAFI', '728458', ' 1502257404', '22-23', '2nd', 'KPI', '1st', '2ETA1', NULL, 'Electrical', NULL, 'regular', NULL, '1816955491', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(372, ' MD.TASIN AHMED', '728459', ' 1502257403', '22-23', '2nd', 'KPI', '1st', '2ETA1', NULL, 'Electrical', NULL, 'regular', NULL, '1706617982', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(373, ' TAHSIN AHMED', '728462', ' 1502257402', '22-23', '2nd', 'KPI', '1st', '2ETA1', NULL, 'Electrical', NULL, 'regular', NULL, '1747176642', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(374, ' SHIBLI RAHMATULLAH', '728465', ' 1502257401', '22-23', '2nd', 'KPI', '1st', '2ETA1', NULL, 'Electrical', NULL, 'regular', NULL, '1727693064', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(375, ' SHAKIBUL HASAN SHIPON', '728467', ' 1502257399', '22-23', '2nd', 'KPI', '1st', '2ETA1', NULL, 'Electrical', NULL, 'regular', NULL, '1846452511', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(376, ' MD. NASIM UDDIN', '728468', ' 1502257398', '22-23', '2nd', 'KPI', '1st', '2ETA1', NULL, 'Electrical', NULL, 'regular', NULL, '1729716170', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(377, ' SHAHED AHAMMED', '728470', ' 1502257396', '22-23', '2nd', 'KPI', '1st', '2ETA1', NULL, 'Electrical', NULL, 'regular', NULL, '1749965474', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(378, ' MD. RAFAYEL ARAFAT REMON', '728475', ' 1502257395', '22-23', '2nd', 'KPI', '1st', '2ETA1', NULL, 'Electrical', NULL, 'regular', NULL, '1610825731', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(379, ' MD. SHUVO ISLAM', '728476', ' 1502257394', '22-23', '2nd', 'KPI', '1st', '2ETA1', NULL, 'Electrical', NULL, 'regular', NULL, '1868180367', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(380, ' MD. MAHADI HASAN NAFIS', '728477', ' 1502257393', '22-23', '2nd', 'KPI', '1st', '2ETA1', NULL, 'Electrical', NULL, 'regular', NULL, '1308455772', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(381, ' MUSTAKIM AHMED SHAFIN', '728478', ' 1502257392', '22-23', '2nd', 'KPI', '1st', '2ETA1', NULL, 'Electrical', NULL, 'regular', NULL, '1874620969', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(382, ' MD. SAIF HOSEN HAMZALA', '728481', ' 1502257391', '22-23', '2nd', 'KPI', '1st', '2ETA1', NULL, 'Electrical', NULL, 'regular', NULL, '1321962447', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(383, ' ASHIKUR RAHMAN', '728482', ' 1502257390', '22-23', '2nd', 'KPI', '1st', '2ETA1', NULL, 'Electrical', NULL, 'regular', NULL, '1319591022', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(384, ' TANVIR SHAKAWAT', '728484', ' 1502257389', '22-23', '2nd', 'KPI', '1st', '2ETA1', NULL, 'Electrical', NULL, 'regular', NULL, '1602490929', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(385, 'MD. SOJIB HOSSAIN', '733392', '1502261223', '2223', '2nd', 'KPI', '1st', '2ETA1', NULL, 'Electrical', NULL, 'regular', 'Transfar', NULL, '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(386, 'SAKHAWAT HOSSEN SAHIF', '733393', '1502261222', '2223', '2nd', 'KPI', '1st', '2ETA1', NULL, 'Electrical', NULL, 'regular', 'Transfar', NULL, '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(387, 'MD. SHAMIM HOSSAIN', '742724', '1502268366', '2223', '2nd', 'KPI', '1st', '2ETA1', NULL, 'Electrical', NULL, 'regular', 'Transfar', NULL, '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(388, 'MD. SIFAT ULLAH', '747271', '1502271130', '2223', '2nd', 'KPI', '1st', '2ETA1', NULL, 'Electrical', NULL, 'regular', 'Transfar', NULL, '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(389, ' MD.HAJJAJ KHAN', '728486', ' 1502257387', '22-23', '2nd', 'KPI', '1st', '2ETB1', NULL, 'Electrical', NULL, 'regular', NULL, '1709076190', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(390, ' NAHID AHMED', '728488', ' 1502257386', '22-23', '2nd', 'KPI', '1st', '2ETB1', NULL, 'Electrical', NULL, 'regular', NULL, '1776916309', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(391, ' MD. SHAMS E TABRIZ NOMAN', '728492', ' 1502257385', '22-23', '2nd', 'KPI', '1st', '2ETB1', NULL, 'Electrical', NULL, 'regular', NULL, '1315446312', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(392, ' MD. AHSHAN HABIB SIAM', '728493', ' 1502257384', '22-23', '2nd', 'KPI', '1st', '2ETB1', NULL, 'Electrical', NULL, 'regular', NULL, '1994351494', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(393, ' MST. KAKOLY KHATUN', '728495', ' 1502257383', '22-23', '2nd', 'KPI', '1st', '2ETB1', NULL, 'Electrical', NULL, 'regular', NULL, '1937873785', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(394, ' SABBIR AHMED', '728496', ' 1502257382', '22-23', '2nd', 'KPI', '1st', '2ETB1', NULL, 'Electrical', NULL, 'regular', NULL, '1733618501', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(395, ' MD. JUBAYED AL MAMUN', '728498', ' 1502257381', '22-23', '2nd', 'KPI', '1st', '2ETB1', NULL, 'Electrical', NULL, 'regular', NULL, '1903111569', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(396, ' SUNJID AHMED SRABON', '728501', ' 1502257379', '22-23', '2nd', 'KPI', '1st', '2ETB1', NULL, 'Electrical', NULL, 'regular', NULL, '1735687857', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(397, ' MOHAMMAD SAAD', '728503', ' 1502257378', '22-23', '2nd', 'KPI', '1st', '2ETB1', NULL, 'Electrical', NULL, 'regular', NULL, '1635677896', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(398, ' MST. AFSONA MIM', '728505', ' 1502257377', '22-23', '2nd', 'KPI', '1st', '2ETB1', NULL, 'Electrical', NULL, 'regular', NULL, '1724998443', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(399, ' MD. SAHARIAR RAHMAN SHIAM', '728507', ' 1502257376', '22-23', '2nd', 'KPI', '1st', '2ETB1', NULL, 'Electrical', NULL, 'regular', NULL, '1740659537', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(400, ' MD. SHIMUL', '728508', ' 1502257375', '22-23', '2nd', 'KPI', '1st', '2ETB1', NULL, 'Electrical', NULL, 'regular', NULL, '1966093660', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(401, ' MD. NIMUR RAHMAN', '728510', ' 1502257374', '22-23', '2nd', 'KPI', '1st', '2ETB1', NULL, 'Electrical', NULL, 'regular', NULL, '1715489386', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(402, ' MD. ANISUR RAHMAN ANAS', '728511', ' 1502257373', '22-23', '2nd', 'KPI', '1st', '2ETB1', NULL, 'Electrical', NULL, 'regular', NULL, '1727461084', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(403, ' MD. SHAWON AHAMMED', '728512', ' 1502257372', '22-23', '2nd', 'KPI', '1st', '2ETB1', NULL, 'Electrical', NULL, 'regular', NULL, '1980541695', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(404, ' MD. SHAFAET', '728513', ' 1502257371', '22-23', '2nd', 'KPI', '1st', '2ETB1', NULL, 'Electrical', NULL, 'regular', NULL, '1533462136', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(405, ' MD. GIHAD MANDAL', '728520', ' 1502257370', '22-23', '2nd', 'KPI', '1st', '2ETB1', NULL, 'Electrical', NULL, 'regular', NULL, '1756452671', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(406, ' MST. MONIRA AKTER', '728524', ' 1502257369', '22-23', '2nd', 'KPI', '1st', '2ETB1', NULL, 'Electrical', NULL, 'regular', NULL, '1301089671', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(407, ' MST. SHAHINA KHATUN', '728526', ' 1502257368', '22-23', '2nd', 'KPI', '1st', '2ETB1', NULL, 'Electrical', NULL, 'regular', NULL, '1750573641', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(408, ' LAMIMA AKTER', '728527', ' 1502257367', '22-23', '2nd', 'KPI', '1st', '2ETB1', NULL, 'Electrical', NULL, 'regular', NULL, '1772351385', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(409, ' NUSRAT JAHAN BINDU', '728530', ' 1502257366', '22-23', '2nd', 'KPI', '1st', '2ETB1', NULL, 'Electrical', NULL, 'regular', NULL, '1737080080', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(410, ' INZAMAMUL HAQUE', '728533', ' 1502257365', '22-23', '2nd', 'KPI', '1st', '2ETB1', NULL, 'Electrical', NULL, 'regular', NULL, '1409642564', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(411, ' MD. ALL SAIF', '728537', ' 1502257363', '22-23', '2nd', 'KPI', '1st', '2ETB1', NULL, 'Electrical', NULL, 'regular', NULL, '1947657639', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(412, ' MD. ABU HURAIRA', '728539', ' 1502257362', '22-23', '2nd', 'KPI', '1st', '2ETB1', NULL, 'Electrical', NULL, 'regular', NULL, '1980446443', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(413, ' IVE SULTANA BOISHAKHI', '728540', ' 1502257361', '22-23', '2nd', 'KPI', '1st', '2ETB1', NULL, 'Electrical', NULL, 'regular', NULL, '1764633032', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(414, ' MD. FARHAN LABIB ANGKON', '728541', ' 1502257360', '22-23', '2nd', 'KPI', '1st', '2ETB1', NULL, 'Electrical', NULL, 'regular', NULL, '1968436160', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(415, ' MD. ABDULLAH AL RAFI', '728549', ' 1502257357', '22-23', '2nd', 'KPI', '1st', '2ETB1', NULL, 'Electrical', NULL, 'regular', NULL, '1757576457', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(416, ' SAJON AHMED', '728550', ' 1502257356', '22-23', '2nd', 'KPI', '1st', '2ETB1', NULL, 'Electrical', NULL, 'regular', NULL, '1405523573', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(417, ' MD. NAFIM AL SHAHARIA', '728551', ' 1502257355', '22-23', '2nd', 'KPI', '1st', '2ETB1', NULL, 'Electrical', NULL, 'regular', NULL, '1779903178', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(418, ' SURAIA ISMIN', '728554', ' 1502257354', '22-23', '2nd', 'KPI', '1st', '2ETB1', NULL, 'Electrical', NULL, 'regular', NULL, '1783419837', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(419, ' SHUVRODEB SIKDAR', '728558', ' 1502257353', '22-23', '2nd', 'KPI', '1st', '2ETB1', NULL, 'Electrical', NULL, 'regular', NULL, '1310471011', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(420, ' MOST. HALIMATUS SADIA', '728559', ' 1502257352', '22-23', '2nd', 'KPI', '1st', '2ETB1', NULL, 'Electrical', NULL, 'regular', NULL, '1636988440', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(421, ' MST. TASMIM ROKSANA', '728562', ' 1502257350', '22-23', '2nd', 'KPI', '1st', '2ETB1', NULL, 'Electrical', NULL, 'regular', NULL, '1794960566', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(422, ' MIR MUHAIMIN UL HOQ', '728563', ' 1502257349', '22-23', '2nd', 'KPI', '1st', '2ETB1', NULL, 'Electrical', NULL, 'regular', NULL, '1941958822', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(423, ' MST.AFSONA KHATUN', '728564', ' 1502257348', '22-23', '2nd', 'KPI', '1st', '2ETB1', NULL, 'Electrical', NULL, 'regular', NULL, '1933724123', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(424, ' MD. MISHKATUR RAHMAN', '728565', ' 1502257347', '22-23', '2nd', 'KPI', '1st', '2ETB1', NULL, 'Electrical', NULL, 'regular', NULL, '1740962097', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(425, ' AUNKON BISWAS', '728568', ' 1502257346', '22-23', '2nd', 'KPI', '1st', '2ETB1', NULL, 'Electrical', NULL, 'regular', NULL, '1952752781', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(426, ' PEZUS KANTI BHOWMICK', '728569', ' 1502257345', '22-23', '2nd', 'KPI', '1st', '2ETB1', NULL, 'Electrical', NULL, 'regular', NULL, '1849807327', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(427, ' SHOVON AHMED MAHIN', '728570', ' 1502257344', '22-23', '2nd', 'KPI', '1st', '2ETB1', NULL, 'Electrical', NULL, 'regular', NULL, '1902747032', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(428, ' MST. MONIKA KHATUN', '728572', ' 1502257342', '22-23', '2nd', 'KPI', '1st', '2ETB1', NULL, 'Electrical', NULL, 'regular', NULL, '1752426756', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(429, ' MD. MONZURUL ISLAM RATUL', '728574', ' 1502257341', '22-23', '2nd', 'KPI', '1st', '2ETB1', NULL, 'Electrical', NULL, 'regular', NULL, '1581861916', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(430, ' SUBORNA BISWAS ANTORA', '728575', ' 1502257340', '22-23', '2nd', 'KPI', '1st', '2ETB1', NULL, 'Electrical', NULL, 'regular', NULL, '1817185534', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(431, ' SUMITA KHATUN', '728576', ' 1502257339', '22-23', '2nd', 'KPI', '1st', '2ETB1', NULL, 'Electrical', NULL, 'regular', NULL, '1940986909', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(432, ' SINTHIYA AFRIN AVA', '728577', ' 1502257338', '22-23', '2nd', 'KPI', '1st', '2ETB1', NULL, 'Electrical', NULL, 'regular', NULL, '1717103074', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(433, ' M.G. FATIN RAHMAN', '728578', ' 1502305908', '22-23', '2nd', 'KPI', '2nd', '2ETA2', NULL, 'Electrical', NULL, 'regular', NULL, '1934579832', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(434, ' MD. ROMIN HOSSAIN', '728579', ' 1502258015', '22-23', '2nd', 'KPI', '2nd', '2ETA2', NULL, 'Electrical', NULL, 'regular', NULL, '1782824260', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(435, ' MST. HIRA KHATUN', '728580', ' 1502258014', '22-23', '2nd', 'KPI', '2nd', '2ETA2', NULL, 'Electrical', NULL, 'regular', NULL, '1920434285', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(436, ' PROTOY BISWAS', '728581', ' 1502258013', '22-23', '2nd', 'KPI', '2nd', '2ETA2', NULL, 'Electrical', NULL, 'regular', NULL, '1952321517', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(437, ' SAFAT', '728582', ' 1502258012', '22-23', '2nd', 'KPI', '2nd', '2ETA2', NULL, 'Electrical', NULL, 'regular', NULL, '1319482046', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(438, ' MD. SAIF HOSSAIN', '728583', ' 1502258011', '22-23', '2nd', 'KPI', '2nd', '2ETA2', NULL, 'Electrical', NULL, 'regular', NULL, '1780871943', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(439, ' MD ZISAN SHEIKH', '728587', ' 1502258007', '22-23', '2nd', 'KPI', '2nd', '2ETA2', NULL, 'Electrical', NULL, 'regular', NULL, '1890216869', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(440, ' MD ASHIK SHEIKH', '728588', ' 1502258006', '22-23', '2nd', 'KPI', '2nd', '2ETA2', NULL, 'Electrical', NULL, 'regular', NULL, '1835964221', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(441, ' BADHON KUMAR DEY', '728589', ' 1502258005', '22-23', '2nd', 'KPI', '2nd', '2ETA2', NULL, 'Electrical', NULL, 'regular', NULL, '1884644995', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(442, ' MD. SAYED AHAMMED', '728590', ' 1502258004', '22-23', '2nd', 'KPI', '2nd', '2ETA2', NULL, 'Electrical', NULL, 'regular', NULL, '1580315038', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(443, ' MD. BIJOY HOSSAIN', '728591', ' 1502258003', '22-23', '2nd', 'KPI', '2nd', '2ETA2', NULL, 'Electrical', NULL, 'regular', NULL, '1943772948', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(444, ' MOHIBUR RAHAMAN', '728592', ' 1502258002', '22-23', '2nd', 'KPI', '2nd', '2ETA2', NULL, 'Electrical', NULL, 'regular', NULL, '1813587869', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(445, ' MD.JIHAD AHAMED', '728596', ' 1502258000', '22-23', '2nd', 'KPI', '2nd', '2ETA2', NULL, 'Electrical', NULL, 'regular', NULL, '1755864247', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(446, ' MD. TANJIL HASAN', '728597', ' 1502257999', '22-23', '2nd', 'KPI', '2nd', '2ETA2', NULL, 'Electrical', NULL, 'regular', NULL, '1843814257', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(447, ' MD. EMON HASAN', '728599', ' 1502257998', '22-23', '2nd', 'KPI', '2nd', '2ETA2', NULL, 'Electrical', NULL, 'regular', NULL, '1774335019', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(448, ' MD. EMON ALI', '728600', ' 1502257997', '22-23', '2nd', 'KPI', '2nd', '2ETA2', NULL, 'Electrical', NULL, 'regular', NULL, '1307261986', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(449, ' MD. RAKIB HASAN', '728601', ' 1502257996', '22-23', '2nd', 'KPI', '2nd', '2ETA2', NULL, 'Electrical', NULL, 'regular', NULL, '1927289491', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(450, ' SHAJARATUL MUNTAHA', '728602', ' 1502257995', '22-23', '2nd', 'KPI', '2nd', '2ETA2', NULL, 'Electrical', NULL, 'regular', NULL, '1718896947', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(451, ' MD.NILOY HOSSAIN NIRJON', '728603', ' 1502257994', '22-23', '2nd', 'KPI', '2nd', '2ETA2', NULL, 'Electrical', NULL, 'regular', NULL, '1310298141', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(452, ' MD. RIPON AHMED', '728605', ' 1502257993', '22-23', '2nd', 'KPI', '2nd', '2ETA2', NULL, 'Electrical', NULL, 'regular', NULL, '1403327153', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(453, ' MD. RONI SHEIKH', '728606', ' 1502257992', '22-23', '2nd', 'KPI', '2nd', '2ETA2', NULL, 'Electrical', NULL, 'regular', NULL, '1990897695', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(454, ' MD. LIMON HASAN RAHUL', '728607', ' 1502257991', '22-23', '2nd', 'KPI', '2nd', '2ETA2', NULL, 'Electrical', NULL, 'regular', NULL, '1878542206', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(455, ' ANIK BISWAS', '728608', ' 1502257990', '22-23', '2nd', 'KPI', '2nd', '2ETA2', NULL, 'Electrical', NULL, 'regular', NULL, '1885507354', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(456, ' ABUL KALAM AZAD', '728610', ' 1502257989', '22-23', '2nd', 'KPI', '2nd', '2ETA2', NULL, 'Electrical', NULL, 'regular', NULL, '1789588017', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(457, ' MD. SHIPON ISLAM', '728611', ' 1502257988', '22-23', '2nd', 'KPI', '2nd', '2ETA2', NULL, 'Electrical', NULL, 'regular', NULL, '1820911530', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(458, ' MD. RAFIK UDDIN', '728614', ' 1502257986', '22-23', '2nd', 'KPI', '2nd', '2ETA2', NULL, 'Electrical', NULL, 'regular', NULL, '1701356424', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(459, ' MD. EKRAMUL ISLAM LABIB', '728615', ' 1502257985', '22-23', '2nd', 'KPI', '2nd', '2ETA2', NULL, 'Electrical', NULL, 'regular', NULL, '1712946599', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(460, ' MST. SAMIA KHATUN', '728616', ' 1502257984', '22-23', '2nd', 'KPI', '2nd', '2ETA2', NULL, 'Electrical', NULL, 'regular', NULL, '1406749449', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(461, ' ROHANI AFROZ EMMANUYEL', '728617', ' 1502257983', '22-23', '2nd', 'KPI', '2nd', '2ETA2', NULL, 'Electrical', NULL, 'regular', NULL, '1774521444', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(462, ' MD. SHANJID SHAHRIAR ZISAN', '728618', ' 1502257982', '22-23', '2nd', 'KPI', '2nd', '2ETA2', NULL, 'Electrical', NULL, 'regular', NULL, '1405522234', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(463, ' MST.SUMAYA KHATUN', '728619', ' 1502257981', '22-23', '2nd', 'KPI', '2nd', '2ETA2', NULL, 'Electrical', NULL, 'regular', NULL, '1764144346', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(464, ' MD. ALIF UDDIN', '728620', ' 1502257980', '22-23', '2nd', 'KPI', '2nd', '2ETA2', NULL, 'Electrical', NULL, 'regular', NULL, '1405523224', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(465, ' SHAFAK AL JABIR', '728622', ' 1502257979', '22-23', '2nd', 'KPI', '2nd', '2ETA2', NULL, 'Electrical', NULL, 'regular', NULL, '1859811008', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(466, ' MD. ASHIK SHEIKH', '728624', ' 1502257977', '22-23', '2nd', 'KPI', '2nd', '2ETA2', NULL, 'Electrical', NULL, 'regular', NULL, '1991070373', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(467, ' MD. ARIF BILLAH', '728625', ' 1502257976', '22-23', '2nd', 'KPI', '2nd', '2ETA2', NULL, 'Electrical', NULL, 'regular', NULL, '1957000245', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(468, ' MD. RAJEBUL JAMAN RAKIB', '728626', ' 1502257975', '22-23', '2nd', 'KPI', '2nd', '2ETA2', NULL, 'Electrical', NULL, 'regular', NULL, '1902800377', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(469, ' TASNIHA AKTER ANY', '728627', ' 1502257974', '22-23', '2nd', 'KPI', '2nd', '2ETA2', NULL, 'Electrical', NULL, 'regular', NULL, '1742512218', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(470, ' SUMON AHMMED', '728628', ' 1502257973', '22-23', '2nd', 'KPI', '2nd', '2ETA2', NULL, 'Electrical', NULL, 'regular', NULL, '1401897674', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(471, ' MST. CHOYTI KHATUN', '728629', ' 1502257972', '22-23', '2nd', 'KPI', '2nd', '2ETA2', NULL, 'Electrical', NULL, 'regular', NULL, '1963291137', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(472, 'TOURID AHMED ARKA', '731580', '1502260410', '2223', '2nd', 'KPI', '2nd', '2ETA2', NULL, 'Electrical', NULL, 'regular', 'Transfar', NULL, '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(473, 'AL SAHARYA', '733485', '1502261819', '2223', '2nd', 'KPI', '2nd', '2ETA2', NULL, 'Electrical', NULL, 'regular', 'Transfar', NULL, '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(474, 'MD SUNJITU RAHMAN NIROB', '733487', '1502261817', '2223', '2nd', 'KPI', '2nd', '2ETA2', NULL, 'Electrical', NULL, 'regular', 'Transfar', NULL, '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(475, 'MD. SWEET HOSSEN', '737138', '1502264212', '2223', '2nd', 'KPI', '2nd', '2ETA2', NULL, 'Electrical', NULL, 'regular', 'Transfar', NULL, '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(476, 'ABDUR RAHMAN', '756646', '1502278861', '2223', '2nd', 'KPI', '2nd', '2ETA2', NULL, 'Electrical', NULL, 'regular', 'Transfar', NULL, '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(477, ' MD. PARVEJ KHAN SORON', '728630', ' 1502257971', '22-23', '2nd', 'KPI', '2nd', '2ETB2', NULL, 'Electrical', NULL, 'regular', NULL, '1990234488', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(478, ' MD. NASIM ALI', '728631', ' 1502257970', '22-23', '2nd', 'KPI', '2nd', '2ETB2', NULL, 'Electrical', NULL, 'regular', NULL, '1798381636', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(479, ' MD. SAIF ANWAR RAFI', '728633', ' 1502257968', '22-23', '2nd', 'KPI', '2nd', '2ETB2', NULL, 'Electrical', NULL, 'regular', NULL, '1747686580', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(480, ' HADIA AKTER', '728634', ' 1502257967', '22-23', '2nd', 'KPI', '2nd', '2ETB2', NULL, 'Electrical', NULL, 'regular', NULL, '1719828296', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(481, ' MST SHRABONY AFRIN', '728638', ' 1502257964', '22-23', '2nd', 'KPI', '2nd', '2ETB2', NULL, 'Electrical', NULL, 'regular', NULL, '1979295362', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(482, ' MST TISHA', '728640', ' 1502257963', '22-23', '2nd', 'KPI', '2nd', '2ETB2', NULL, 'Electrical', NULL, 'regular', NULL, '1301451449', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(483, ' NAZMUS SAKIB', '728641', ' 1502257962', '22-23', '2nd', 'KPI', '2nd', '2ETB2', NULL, 'Electrical', NULL, 'regular', NULL, '1306811568', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(484, ' MD. SADMAN SHOUMIK', '728643', ' 1502257961', '22-23', '2nd', 'KPI', '2nd', '2ETB2', NULL, 'Electrical', NULL, 'regular', NULL, '1735223505', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(485, ' MD. TASNIM RAHMAN', '728646', ' 1502257959', '22-23', '2nd', 'KPI', '2nd', '2ETB2', NULL, 'Electrical', NULL, 'regular', NULL, '1778654066', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(486, ' ASHIKUR RAHMAN', '728649', ' 1502257958', '22-23', '2nd', 'KPI', '2nd', '2ETB2', NULL, 'Electrical', NULL, 'regular', NULL, '1311448297', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(487, ' J. N. JABIR', '728651', ' 1502257956', '22-23', '2nd', 'KPI', '2nd', '2ETB2', NULL, 'Electrical', NULL, 'regular', NULL, '1860054104', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(488, ' TASNIA MOLLIK', '728653', ' 1502257954', '22-23', '2nd', 'KPI', '2nd', '2ETB2', NULL, 'Electrical', NULL, 'regular', NULL, '1705348690', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(489, ' MD. SHIBLI SADIK', '728655', ' 1502257953', '22-23', '2nd', 'KPI', '2nd', '2ETB2', NULL, 'Electrical', NULL, 'regular', NULL, '1315446235', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(490, ' MD. SHURRAN ALI', '728656', ' 1502257952', '22-23', '2nd', 'KPI', '2nd', '2ETB2', NULL, 'Electrical', NULL, 'regular', NULL, '1867418147', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(491, ' FARDIN BIN SAMAD', '728658', ' 1502257950', '22-23', '2nd', 'KPI', '2nd', '2ETB2', NULL, 'Electrical', NULL, 'regular', NULL, '1735658151', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(492, ' MST. MITHILA FARJANA SHOVA', '728659', ' 1502257949', '22-23', '2nd', 'KPI', '2nd', '2ETB2', NULL, 'Electrical', NULL, 'regular', NULL, '1988937452', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(493, ' SHANJIDA KHATUN', '728661', ' 1502257948', '22-23', '2nd', 'KPI', '2nd', '2ETB2', NULL, 'Electrical', NULL, 'regular', NULL, '1783668365', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(494, ' MD. MEHEDI HASAN', '728662', ' 1502257947', '22-23', '2nd', 'KPI', '2nd', '2ETB2', NULL, 'Electrical', NULL, 'regular', NULL, '1768371517', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(495, ' MD. ABU BOKKOR', '728663', ' 1502257946', '22-23', '2nd', 'KPI', '2nd', '2ETB2', NULL, 'Electrical', NULL, 'regular', NULL, '1318720289', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(496, ' TANISHA FUTONTO', '728664', ' 1502257945', '22-23', '2nd', 'KPI', '2nd', '2ETB2', NULL, 'Electrical', NULL, 'regular', NULL, '1746435968', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(497, ' MD. RABBY HASAN', '728667', ' 1502257943', '22-23', '2nd', 'KPI', '2nd', '2ETB2', NULL, 'Electrical', NULL, 'regular', NULL, '1915610550', '2024-01-12 03:40:55', '2024-01-12 03:40:55'),
(498, ' MD. MAHFUJUR RAHMAN', '728668', ' 1502257942', '22-23', '2nd', 'KPI', '2nd', '2ETB2', NULL, 'Electrical', NULL, 'regular', NULL, '1982650473', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(499, ' BIJOY ISLAM', '728669', ' 1502257941', '22-23', '2nd', 'KPI', '2nd', '2ETB2', NULL, 'Electrical', NULL, 'regular', NULL, '1795219482', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(500, ' MD. OVI PARVEJ', '728671', ' 1502257940', '22-23', '2nd', 'KPI', '2nd', '2ETB2', NULL, 'Electrical', NULL, 'regular', NULL, '1793090145', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(501, ' MST. SONALI KHATUN', '728672', ' 1502257939', '22-23', '2nd', 'KPI', '2nd', '2ETB2', NULL, 'Electrical', NULL, 'regular', NULL, '1834526991', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(502, ' MD. ARIFUL ISLAM SRABON', '728673', ' 1502257938', '22-23', '2nd', 'KPI', '2nd', '2ETB2', NULL, 'Electrical', NULL, 'regular', NULL, '1886629826', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(503, ' MD. ABDUR RAHMAN', '728674', ' 1502257937', '22-23', '2nd', 'KPI', '2nd', '2ETB2', NULL, 'Electrical', NULL, 'regular', NULL, '1613869874', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(504, ' MST. UMMY KHADIJA', '728676', ' 1502257936', '22-23', '2nd', 'KPI', '2nd', '2ETB2', NULL, 'Electrical', NULL, 'regular', NULL, '1960394086', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(505, ' IFTEKHAR HOSSEN NAHID', '728677', ' 1502257935', '22-23', '2nd', 'KPI', '2nd', '2ETB2', NULL, 'Electrical', NULL, 'regular', NULL, '1961940403', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(506, ' ANONNO FARHAN', '728678', ' 1502257934', '22-23', '2nd', 'KPI', '2nd', '2ETB2', NULL, 'Electrical', NULL, 'regular', NULL, '1994181883', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(507, ' MD. EASIR ARAFAT', '728679', ' 1502257933', '22-23', '2nd', 'KPI', '2nd', '2ETB2', NULL, 'Electrical', NULL, 'regular', NULL, '1707796030', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(508, ' SIHAB HOSEN', '728680', ' 1502257932', '22-23', '2nd', 'KPI', '2nd', '2ETB2', NULL, 'Electrical', NULL, 'regular', NULL, '1863314255', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(509, ' HALIMA KHATUN BRISTY', '728681', ' 1502257931', '22-23', '2nd', 'KPI', '2nd', '2ETB2', NULL, 'Electrical', NULL, 'regular', NULL, '1779173051', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(510, ' MD.SHAHRIAR KOBIR', '728682', ' 1502257930', '22-23', '2nd', 'KPI', '2nd', '2ETB2', NULL, 'Electrical', NULL, 'regular', NULL, '1938578564', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(511, ' JIM AKTAR', '728683', ' 1502257929', '22-23', '2nd', 'KPI', '2nd', '2ETB2', NULL, 'Electrical', NULL, 'regular', NULL, '1735451739', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(512, ' KHADIZA ALMIM', '728684', ' 1502257928', '22-23', '2nd', 'KPI', '2nd', '2ETB2', NULL, 'Electrical', NULL, 'regular', NULL, '1818311128', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(513, ' SHANTO SARKAR', '728685', ' 1502257927', '22-23', '2nd', 'KPI', '2nd', '2ETB2', NULL, 'Electrical', NULL, 'regular', NULL, '1710116803', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(514, ' MD. SHUVO HOSSAIN', '728688', ' 1502257924', '22-23', '2nd', 'KPI', '2nd', '2ETB2', NULL, 'Electrical', NULL, 'regular', NULL, '1310230451', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(515, ' MD. JONY ISLAM', '728689', ' 1502257923', '22-23', '2nd', 'KPI', '2nd', '2ETB2', NULL, 'Electrical', NULL, 'regular', NULL, '1878698993', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(516, ' EKRAMUL ISLAM', '728690', ' 1502257922', '22-23', '2nd', 'KPI', '2nd', '2ETB2', NULL, 'Electrical', NULL, 'regular', NULL, '1823210892', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(517, ' MD. ANIK HOSSAIN', '728692', ' 1502257921', '22-23', '2nd', 'KPI', '2nd', '2ETB2', NULL, 'Electrical', NULL, 'regular', NULL, '1989264608', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(518, ' MD. PARVEZ MOLLA', '728695', ' 1502257919', '22-23', '2nd', 'KPI', '2nd', '2ETB2', NULL, 'Electrical', NULL, 'regular', NULL, '1595631040', '2024-01-12 03:40:56', '2024-01-12 03:40:56');
INSERT INTO `exam_students` (`id`, `name`, `roll`, `reg_no`, `session`, `semester`, `institute`, `shift`, `student_group`, `ref_subject`, `technology`, `probidhan`, `status`, `remarks`, `mobile`, `created_at`, `updated_at`) VALUES
(519, 'MD ABU SAFAYET PASHA', '627788', ' 1502184520', '21-22', '2nd', 'KPI', '2nd', '2ETA2', NULL, 'Electrical', NULL, 'regular', NULL, NULL, '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(520, ' MD.HABIB ALI', '728696', ' 1502307388', '22-23', '2nd', 'KPI', '1st', '2ENTA1', NULL, 'Electronics', NULL, 'regular', NULL, '1405523915', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(521, ' MOHAMMAD ALI', '728697', ' 1502305899', '22-23', '2nd', 'KPI', '1st', '2ENTA1', NULL, 'Electronics', NULL, 'regular', NULL, '1734512428', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(522, ' MD. MAHFUZUR RAHMAN', '728698', ' 1502305898', '22-23', '2nd', 'KPI', '1st', '2ENTA1', NULL, 'Electronics', NULL, 'regular', NULL, '1794442208', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(523, ' MD. ISMAY ERAF', '728700', ' 1502305897', '22-23', '2nd', 'KPI', '1st', '2ENTA1', NULL, 'Electronics', NULL, 'regular', NULL, '1401871677', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(524, ' YOUNUS ALI', '728702', ' 1502257524', '22-23', '2nd', 'KPI', '1st', '2ENTA1', NULL, 'Electronics', NULL, 'regular', NULL, '1993553693', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(525, ' HALIMA TUZ SADIA', '728704', ' 1502257522', '22-23', '2nd', 'KPI', '1st', '2ENTA1', NULL, 'Electronics', NULL, 'regular', NULL, '1723108845', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(526, ' MD. OBAIDULLAH', '728705', ' 1502257521', '22-23', '2nd', 'KPI', '1st', '2ENTA1', NULL, 'Electronics', NULL, 'regular', NULL, '1602231164', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(527, ' PIOUS MITRO', '728706', ' 1502257520', '22-23', '2nd', 'KPI', '1st', '2ENTA1', NULL, 'Electronics', NULL, 'regular', NULL, '1576693593', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(528, ' MD. SABBIR AHOMMED', '728709', ' 1502257517', '22-23', '2nd', 'KPI', '1st', '2ENTA1', NULL, 'Electronics', NULL, 'regular', NULL, '1311921987', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(529, ' SHAZIDUL ISLAM', '728711', ' 1502257516', '22-23', '2nd', 'KPI', '1st', '2ENTA1', NULL, 'Electronics', NULL, 'regular', NULL, '1828543640', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(530, ' ARIF HASAN SWEET', '728712', ' 1502257515', '22-23', '2nd', 'KPI', '1st', '2ENTA1', NULL, 'Electronics', NULL, 'regular', NULL, '1772610750', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(531, ' MD.RAKIBUZZAMAN', '728716', ' 1502257511', '22-23', '2nd', 'KPI', '1st', '2ENTA1', NULL, 'Electronics', NULL, 'regular', NULL, '1313668399', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(532, ' MD. JONY SHAEIKH', '728722', ' 1502257505', '22-23', '2nd', 'KPI', '1st', '2ENTA1', NULL, 'Electronics', NULL, 'regular', NULL, '1792053419', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(533, ' MD. KOUSHIK AHMED', '728724', ' 1502257504', '22-23', '2nd', 'KPI', '1st', '2ENTA1', NULL, 'Electronics', NULL, 'regular', NULL, '1766249349', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(534, ' MD. JUBAYER HOSSAIN FAHIM', '728725', ' 1502257503', '22-23', '2nd', 'KPI', '1st', '2ENTA1', NULL, 'Electronics', NULL, 'regular', NULL, '1953554403', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(535, ' MD. SABBIR', '728726', ' 1502257502', '22-23', '2nd', 'KPI', '1st', '2ENTA1', NULL, 'Electronics', NULL, 'regular', NULL, '1937946458', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(536, ' AMIRUL ISLAM', '728729', ' 1502257501', '22-23', '2nd', 'KPI', '1st', '2ENTA1', NULL, 'Electronics', NULL, 'regular', NULL, '1406756729', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(537, ' MD. ANIK HASAN', '728730', ' 1502257500', '22-23', '2nd', 'KPI', '1st', '2ENTA1', NULL, 'Electronics', NULL, 'regular', NULL, '1735953577', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(538, ' MD. IMON SHEIKH', '728732', ' 1502257499', '22-23', '2nd', 'KPI', '1st', '2ENTA1', NULL, 'Electronics', NULL, 'regular', NULL, '1764615175', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(539, ' MD. AHAD ALI', '728733', ' 1502257498', '22-23', '2nd', 'KPI', '1st', '2ENTA1', NULL, 'Electronics', NULL, 'regular', NULL, '1768363443', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(540, ' SHAKIL AHMED', '728734', ' 1502257497', '22-23', '2nd', 'KPI', '1st', '2ENTA1', NULL, 'Electronics', NULL, 'regular', NULL, '1308851243', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(541, ' MD. HABIBUL BASHAR', '728736', ' 1502257495', '22-23', '2nd', 'KPI', '1st', '2ENTA1', NULL, 'Electronics', NULL, 'regular', NULL, '1735657319', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(542, ' JOHURUL ISLAM', '728737', ' 1502257494', '22-23', '2nd', 'KPI', '1st', '2ENTA1', NULL, 'Electronics', NULL, 'regular', NULL, '1918067999', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(543, ' MD. ASAD MONDOL', '728738', ' 1502257493', '22-23', '2nd', 'KPI', '1st', '2ENTA1', NULL, 'Electronics', NULL, 'regular', NULL, '1753682956', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(544, ' MD. ARIFUZZAMAN ARIF', '728739', ' 1502257492', '22-23', '2nd', 'KPI', '1st', '2ENTA1', NULL, 'Electronics', NULL, 'regular', NULL, '1708712938', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(545, ' MUSTAKIM ISLAM', '728744', ' 1502257488', '22-23', '2nd', 'KPI', '1st', '2ENTA1', NULL, 'Electronics', NULL, 'regular', NULL, '1729160655', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(546, ' SHAMIM ISLAM', '728745', ' 1502257487', '22-23', '2nd', 'KPI', '1st', '2ENTA1', NULL, 'Electronics', NULL, 'regular', NULL, '1321955412', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(547, ' MD. SAJIB SHAIKH', '728747', ' 1502257485', '22-23', '2nd', 'KPI', '1st', '2ENTA1', NULL, 'Electronics', NULL, 'regular', NULL, '1313978932', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(548, ' MD RAKIBUL ISLAM ROKI', '728749', ' 1502257483', '22-23', '2nd', 'KPI', '1st', '2ENTA1', NULL, 'Electronics', NULL, 'regular', NULL, '1409027860', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(549, ' MD. ASHIKUR RAHMAN SHIMUL', '728751', ' 1502257482', '22-23', '2nd', 'KPI', '1st', '2ENTA1', NULL, 'Electronics', NULL, 'regular', NULL, '1795068872', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(550, ' MD. ISRAT RAHMAN RISHAD', '728752', ' 1502257481', '22-23', '2nd', 'KPI', '1st', '2ENTA1', NULL, 'Electronics', NULL, 'regular', NULL, '1760867927', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(551, 'MD. TOWFIQ ALAHI', '741578', '1502267206', '2223', '2nd', 'KPI', '1st', '2ENTA1', NULL, 'Electronics', NULL, 'regular', 'Transfar', NULL, '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(552, ' MD. HASIBUL BASHAR', '728753', ' 1502257480', '22-23', '2nd', 'KPI', '1st', '2ENTB1', NULL, 'Electronics', NULL, 'regular', NULL, '1918566245', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(553, ' MD. ABDUL HI', '728756', ' 1502257478', '22-23', '2nd', 'KPI', '1st', '2ENTB1', NULL, 'Electronics', NULL, 'regular', NULL, '1725183024', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(554, ' MD. SABBIR HOSSAIN', '728759', ' 1502257476', '22-23', '2nd', 'KPI', '1st', '2ENTB1', NULL, 'Electronics', NULL, 'regular', NULL, '1739175943', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(555, ' ADITTO BISWAS BARSON', '728763', ' 1502257475', '22-23', '2nd', 'KPI', '1st', '2ENTB1', NULL, 'Electronics', NULL, 'regular', NULL, '1961631185', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(556, ' MD. SOHANUR RAHMAN', '728764', ' 1502257474', '22-23', '2nd', 'KPI', '1st', '2ENTB1', NULL, 'Electronics', NULL, 'regular', NULL, '1949378020', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(557, ' ABU MOHAMMAD SEYAM', '728765', ' 1502257473', '22-23', '2nd', 'KPI', '1st', '2ENTB1', NULL, 'Electronics', NULL, 'regular', NULL, '1720117115', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(558, ' RUBAYAT RAIHAN RUDDRO', '728766', ' 1502257472', '22-23', '2nd', 'KPI', '1st', '2ENTB1', NULL, 'Electronics', NULL, 'regular', NULL, '1611957161', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(559, ' MD. RISHAN ISLAM', '728769', ' 1502257469', '22-23', '2nd', 'KPI', '1st', '2ENTB1', NULL, 'Electronics', NULL, 'regular', NULL, '1754995730', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(560, ' MD. RASEL MONDOL', '728770', ' 1502257468', '22-23', '2nd', 'KPI', '1st', '2ENTB1', NULL, 'Electronics', NULL, 'regular', NULL, '1738755041', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(561, ' MD. JUBAIR RAHMAN BISWAS', '728771', ' 1502257467', '22-23', '2nd', 'KPI', '1st', '2ENTB1', NULL, 'Electronics', NULL, 'regular', NULL, '1994584080', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(562, ' MD. MAREFUL ISLAM', '728776', ' 1502257465', '22-23', '2nd', 'KPI', '1st', '2ENTB1', NULL, 'Electronics', NULL, 'regular', NULL, '1730469524', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(563, ' MD SABU HOSSAIN', '728777', ' 1502257464', '22-23', '2nd', 'KPI', '1st', '2ENTB1', NULL, 'Electronics', NULL, 'regular', NULL, '1893693717', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(564, ' MD ASIF SIDDIQE', '728779', ' 1502257462', '22-23', '2nd', 'KPI', '1st', '2ENTB1', NULL, 'Electronics', NULL, 'regular', NULL, '1816052243', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(565, ' MST. BITHI KHATUN', '728781', ' 1502257460', '22-23', '2nd', 'KPI', '1st', '2ENTB1', NULL, 'Electronics', NULL, 'regular', NULL, '1729133103', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(566, ' MD. ANASH HOSEN OMI', '728786', ' 1502257457', '22-23', '2nd', 'KPI', '1st', '2ENTB1', NULL, 'Electronics', NULL, 'regular', NULL, '1747737602', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(567, ' SYEDA FARIA ZAMAN RAFA', '728787', ' 1502257456', '22-23', '2nd', 'KPI', '1st', '2ENTB1', NULL, 'Electronics', NULL, 'regular', NULL, '1716954493', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(568, ' MD. SAGOR ALI', '728788', ' 1502257455', '22-23', '2nd', 'KPI', '1st', '2ENTB1', NULL, 'Electronics', NULL, 'regular', NULL, '1852054594', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(569, ' MD. NAEIM ISLAM', '728790', ' 1502257454', '22-23', '2nd', 'KPI', '1st', '2ENTB1', NULL, 'Electronics', NULL, 'regular', NULL, '1734532240', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(570, ' MD. MUBIN ISLAM', '728794', ' 1502257451', '22-23', '2nd', 'KPI', '1st', '2ENTB1', NULL, 'Electronics', NULL, 'regular', NULL, '1576410069', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(571, ' TURZO KUMAR DEY', '728795', ' 1502257450', '22-23', '2nd', 'KPI', '1st', '2ENTB1', NULL, 'Electronics', NULL, 'regular', NULL, '1832943544', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(572, ' MD. RATUL HOSSAIN', '728798', ' 1502257447', '22-23', '2nd', 'KPI', '1st', '2ENTB1', NULL, 'Electronics', NULL, 'regular', NULL, '1615456791', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(573, ' MD. RABBI HASAN', '728800', ' 1502257446', '22-23', '2nd', 'KPI', '1st', '2ENTB1', NULL, 'Electronics', NULL, 'regular', NULL, '1798227444', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(574, ' SHAWON ALI', '728801', ' 1502257445', '22-23', '2nd', 'KPI', '1st', '2ENTB1', NULL, 'Electronics', NULL, 'regular', NULL, '1306750839', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(575, ' JANNATUL FERDOUS ATHOY', '728802', ' 1502257444', '22-23', '2nd', 'KPI', '1st', '2ENTB1', NULL, 'Electronics', NULL, 'regular', NULL, '1784929302', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(576, ' MD. FARID AHMED RAKIB', '728803', ' 1502257443', '22-23', '2nd', 'KPI', '1st', '2ENTB1', NULL, 'Electronics', NULL, 'regular', NULL, '1968056765', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(577, ' SAYED MAHMUD SAMMO', '728804', ' 1502257442', '22-23', '2nd', 'KPI', '1st', '2ENTB1', NULL, 'Electronics', NULL, 'regular', NULL, '1989340187', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(578, ' MD. MINHAZ HOSSEN', '728805', ' 1502257441', '22-23', '2nd', 'KPI', '1st', '2ENTB1', NULL, 'Electronics', NULL, 'regular', NULL, '1948577797', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(579, ' RUDRO PAMANIK', '728806', ' 1502257440', '22-23', '2nd', 'KPI', '1st', '2ENTB1', NULL, 'Electronics', NULL, 'regular', NULL, '1320708821', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(580, ' SHAHRIAR MAHMUD ANKON', '728807', ' 1502257439', '22-23', '2nd', 'KPI', '1st', '2ENTB1', NULL, 'Electronics', NULL, 'regular', NULL, '1720660666', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(581, ' MD. HASAN RUHANI', '728808', ' 1502257438', '22-23', '2nd', 'KPI', '1st', '2ENTB1', NULL, 'Electronics', NULL, 'regular', NULL, '1798868507', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(582, ' MD. AYAT', '728809', ' 1502257437', '22-23', '2nd', 'KPI', '1st', '2ENTB1', NULL, 'Electronics', NULL, 'regular', NULL, '1316953676', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(583, ' MD. JIHAD HOSSAIN', '728810', ' 1502257436', '22-23', '2nd', 'KPI', '1st', '2ENTB1', NULL, 'Electronics', NULL, 'regular', NULL, '1839254840', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(584, ' SAFAYET HOSSAIN', '728811', ' 1502257435', '22-23', '2nd', 'KPI', '1st', '2ENTB1', NULL, 'Electronics', NULL, 'regular', NULL, '1884460300', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(585, ' MD EMON HOSSEN', '728812', ' 1502257434', '22-23', '2nd', 'KPI', '1st', '2ENTB1', NULL, 'Electronics', NULL, 'regular', NULL, '1736419209', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(586, ' RAHUL SHEKH', '790005', '1502307616', ' 2223', '2nd', 'KPI', '1st', '2ENTB1', NULL, 'Electronics', NULL, 'regular', NULL, '1712168837', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(587, 'MD. NUR ALAM', '731685', '1502259956', '2223', '2nd', 'KPI', '1st', '2ENTA1', NULL, 'Electronics', NULL, 'regular', 'Transfar', NULL, '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(588, 'MD. MASUD', '628071', ' 1502184613', '21-22', '2nd', 'KPI', '2nd', '2ENTA2', NULL, 'Electronics', NULL, 'regular', NULL, '1320475125', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(589, ' MD. MOSTADUL ALI', '728815', ' 1502305910', '22-23', '2nd', 'KPI', '2nd', '2ENTA2', NULL, 'Electronics', NULL, 'regular', NULL, '1799152331', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(590, ' RAHAD MONDOL', '728816', ' 1502305909', '22-23', '2nd', 'KPI', '2nd', '2ENTA2', NULL, 'Electronics', NULL, 'regular', NULL, '1686581145', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(591, ' MD. SOJIB HASAN BADSHA', '728817', ' 1502258110', '22-23', '2nd', 'KPI', '2nd', '2ENTA2', NULL, 'Electronics', NULL, 'regular', NULL, '1612705976', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(592, ' ROHIT BISWAS', '728818', ' 1502258109', '22-23', '2nd', 'KPI', '2nd', '2ENTA2', NULL, 'Electronics', NULL, 'regular', NULL, '1756823736', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(593, ' MD. AKASH HOSSEN', '728820', ' 1502258108', '22-23', '2nd', 'KPI', '2nd', '2ENTA2', NULL, 'Electronics', NULL, 'regular', NULL, '1752894677', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(594, ' JAMADIUS SANI JIHAD', '728822', ' 1502258106', '22-23', '2nd', 'KPI', '2nd', '2ENTA2', NULL, 'Electronics', NULL, 'regular', NULL, '1759517443', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(595, ' MD. RABBI', '728823', ' 1502258105', '22-23', '2nd', 'KPI', '2nd', '2ENTA2', NULL, 'Electronics', NULL, 'regular', NULL, '1946660523', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(596, ' MD JIHAD ALI', '728824', ' 1502258104', '22-23', '2nd', 'KPI', '2nd', '2ENTA2', NULL, 'Electronics', NULL, 'regular', NULL, '1314548555', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(597, ' MD EASIN ARAFAT', '728825', ' 1502258103', '22-23', '2nd', 'KPI', '2nd', '2ENTA2', NULL, 'Electronics', NULL, 'regular', NULL, '1301832731', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(598, ' MD HABIBUR RAHMAN', '728826', ' 1502258102', '22-23', '2nd', 'KPI', '2nd', '2ENTA2', NULL, 'Electronics', NULL, 'regular', NULL, '1771484682', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(599, ' MD. NAYEEM', '728829', ' 1502258100', '22-23', '2nd', 'KPI', '2nd', '2ENTA2', NULL, 'Electronics', NULL, 'regular', NULL, '1920463383', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(600, ' MD ROKONUJJAMAN RUMON', '728830', ' 1502258099', '22-23', '2nd', 'KPI', '2nd', '2ENTA2', NULL, 'Electronics', NULL, 'regular', NULL, '1856464952', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(601, ' MST SUMI KHATUN', '728831', ' 1502258098', '22-23', '2nd', 'KPI', '2nd', '2ENTA2', NULL, 'Electronics', NULL, 'regular', NULL, '1777136557', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(602, ' MD. AL AMIN', '728832', ' 1502258097', '22-23', '2nd', 'KPI', '2nd', '2ENTA2', NULL, 'Electronics', NULL, 'regular', NULL, '1771971590', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(603, ' MD. RABBY ISLAM', '728833', ' 1502258096', '22-23', '2nd', 'KPI', '2nd', '2ENTA2', NULL, 'Electronics', NULL, 'regular', NULL, '1677307685', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(604, ' MD. MIZANUR RAHMAN MIZAN', '728834', ' 1502258095', '22-23', '2nd', 'KPI', '2nd', '2ENTA2', NULL, 'Electronics', NULL, 'regular', NULL, '1300667923', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(605, ' MD. SHAKIB ALI', '728837', ' 1502258092', '22-23', '2nd', 'KPI', '2nd', '2ENTA2', NULL, 'Electronics', NULL, 'regular', NULL, '1725406846', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(606, ' AL FIHAD AHAMMED', '728839', ' 1502258090', '22-23', '2nd', 'KPI', '2nd', '2ENTA2', NULL, 'Electronics', NULL, 'regular', NULL, '1319522825', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(607, ' EYAMIN ISLAM RATUL', '728840', ' 1502258089', '22-23', '2nd', 'KPI', '2nd', '2ENTA2', NULL, 'Electronics', NULL, 'regular', NULL, '1310945204', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(608, ' NAYMUZZAMAN NOMAN', '728842', ' 1502258087', '22-23', '2nd', 'KPI', '2nd', '2ENTA2', NULL, 'Electronics', NULL, 'regular', NULL, '1722023248', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(609, ' MD. ALIUL ABIR', '728843', ' 1502258086', '22-23', '2nd', 'KPI', '2nd', '2ENTA2', NULL, 'Electronics', NULL, 'regular', NULL, '1831840577', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(610, ' KHANDOKAR MARUF AHMED', '728846', ' 1502258083', '22-23', '2nd', 'KPI', '2nd', '2ENTA2', NULL, 'Electronics', NULL, 'regular', NULL, '1301252297', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(611, ' MD. AMIR HAMZA', '728849', ' 1502258080', '22-23', '2nd', 'KPI', '2nd', '2ENTA2', NULL, 'Electronics', NULL, 'regular', NULL, '1706751480', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(612, ' EFTEY AHAMMED', '728850', ' 1502258079', '22-23', '2nd', 'KPI', '2nd', '2ENTA2', NULL, 'Electronics', NULL, 'regular', NULL, '1822192127', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(613, ' MD. ROYEL ISLAM', '728851', ' 1502258078', '22-23', '2nd', 'KPI', '2nd', '2ENTA2', NULL, 'Electronics', NULL, 'regular', NULL, '1866587454', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(614, ' MD. SHADHIN', '728852', ' 1502258077', '22-23', '2nd', 'KPI', '2nd', '2ENTA2', NULL, 'Electronics', NULL, 'regular', NULL, '1794045203', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(615, ' SNAHA RAHMAN', '728853', ' 1502258076', '22-23', '2nd', 'KPI', '2nd', '2ENTA2', NULL, 'Electronics', NULL, 'regular', NULL, '1725570771', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(616, ' EFRAN AHMED', '728854', ' 1502258075', '22-23', '2nd', 'KPI', '2nd', '2ENTA2', NULL, 'Electronics', NULL, 'regular', NULL, '1902258121', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(617, ' FARDIN ISLAM', '728856', ' 1502258073', '22-23', '2nd', 'KPI', '2nd', '2ENTA2', NULL, 'Electronics', NULL, 'regular', NULL, '1758524857', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(618, ' MD. SHAHAD AHAMMED', '728857', ' 1502258072', '22-23', '2nd', 'KPI', '2nd', '2ENTA2', NULL, 'Electronics', NULL, 'regular', NULL, '1832437488', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(619, ' MD. SABBIR PRAMANIK', '728858', ' 1502258071', '22-23', '2nd', 'KPI', '2nd', '2ENTA2', NULL, 'Electronics', NULL, 'regular', NULL, '1754148189', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(620, ' MD RUMAN HOSSAIN', '728859', ' 1502258070', '22-23', '2nd', 'KPI', '2nd', '2ENTA2', NULL, 'Electronics', NULL, 'regular', NULL, '1725178932', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(621, ' ROHAN AHMED SHIMUL', '728860', ' 1502258069', '22-23', '2nd', 'KPI', '2nd', '2ENTA2', NULL, 'Electronics', NULL, 'regular', NULL, '1793644754', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(622, ' MD. AMIR RABBY', '728861', ' 1502258068', '22-23', '2nd', 'KPI', '2nd', '2ENTA2', NULL, 'Electronics', NULL, 'regular', NULL, '1750132011', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(623, ' KAIF AHMED ARANNO', '728862', ' 1502258067', '22-23', '2nd', 'KPI', '2nd', '2ENTA2', NULL, 'Electronics', NULL, 'regular', NULL, '1609170885', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(624, ' MD. SHAHANUR RAHMAN', '728864', ' 1502258066', '22-23', '2nd', 'KPI', '2nd', '2ENTA2', NULL, 'Electronics', NULL, 'regular', NULL, '1927783367', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(625, ' MD. SIAM BISWAS', '728869', ' 1502258065', '22-23', '2nd', 'KPI', '2nd', '2ENTA2', NULL, 'Electronics', NULL, 'regular', NULL, '1706753745', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(626, ' MD.NOYON ALI', '728870', ' 1502258064', '22-23', '2nd', 'KPI', '2nd', '2ENTA2', NULL, 'Electronics', NULL, 'regular', NULL, '1308862128', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(627, 'MD. SHEFAT ARAFAT SHANTO', '731773', '1502260511', '2223', '2nd', 'KPI', '2nd', '2ENTA2', NULL, 'Electronics', NULL, 'regular', 'Transfar', NULL, '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(628, 'MD. TUHIN HOSSAIN', '740974', '1502266781', '2223', '2nd', 'KPI', '2nd', '2ENTA2', NULL, 'Electronics', NULL, 'regular', 'Transfar', NULL, '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(629, 'MD. MASHRAFI ALAM', '745066', '1502270065', '2122', '2nd', 'KPI', '2nd', '2ENTA2', NULL, 'Electronics', NULL, 'regular', 'Transfar', NULL, '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(630, ' MD. AMIR HAMZA SHUVO', '728872', ' 1502258063', '22-23', '2nd', 'KPI', '2nd', '2ENTB2', NULL, 'Electronics', NULL, 'regular', NULL, '1715878410', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(631, ' MD. RAIYAN ISLAM', '728874', ' 1502258062', '22-23', '2nd', 'KPI', '2nd', '2ENTB2', NULL, 'Electronics', NULL, 'regular', NULL, '1978672419', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(632, ' MD. ABDUL ZARZIZ SARDAR', '728876', ' 1502258060', '22-23', '2nd', 'KPI', '2nd', '2ENTB2', NULL, 'Electronics', NULL, 'regular', NULL, '1315590195', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(633, ' MD. ZOBAYED HOSSAIN HIMEL', '728877', ' 1502258059', '22-23', '2nd', 'KPI', '2nd', '2ENTB2', NULL, 'Electronics', NULL, 'regular', NULL, '1612727593', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(634, ' MD.JAHIDUL ISLAM JAKIR', '728878', ' 1502258058', '22-23', '2nd', 'KPI', '2nd', '2ENTB2', NULL, 'Electronics', NULL, 'regular', NULL, '1875041763', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(635, ' MD. NIROB HOSSEN', '728879', ' 1502258057', '22-23', '2nd', 'KPI', '2nd', '2ENTB2', NULL, 'Electronics', NULL, 'regular', NULL, '1778746503', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(636, ' RAHABUL ISLAM', '728880', ' 1502258056', '22-23', '2nd', 'KPI', '2nd', '2ENTB2', NULL, 'Electronics', NULL, 'regular', NULL, '1792835058', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(637, ' MD. FAHIM AKTER SAYEM', '728882', ' 1502258055', '22-23', '2nd', 'KPI', '2nd', '2ENTB2', NULL, 'Electronics', NULL, 'regular', NULL, '1773272967', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(638, ' MD. MAJHARUL ISLAM', '728883', ' 1502258054', '22-23', '2nd', 'KPI', '2nd', '2ENTB2', NULL, 'Electronics', NULL, 'regular', NULL, '1708681103', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(639, ' MD. AKIB HOSSEN', '728884', ' 1502258053', '22-23', '2nd', 'KPI', '2nd', '2ENTB2', NULL, 'Electronics', NULL, 'regular', NULL, '1725449786', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(640, ' MD. MARUF RIDOY', '728886', ' 1502258051', '22-23', '2nd', 'KPI', '2nd', '2ENTB2', NULL, 'Electronics', NULL, 'regular', NULL, '1735289466', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(641, ' SAYED AFRAHAM RAHAMAN PROTUYS', '728887', ' 1502258050', '22-23', '2nd', 'KPI', '2nd', '2ENTB2', NULL, 'Electronics', NULL, 'regular', NULL, '1908212307', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(642, ' ABDUR RAHMAN BIJOY', '728888', ' 1502258049', '22-23', '2nd', 'KPI', '2nd', '2ENTB2', NULL, 'Electronics', NULL, 'regular', NULL, '1723427034', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(643, ' MD. MUJAHIDUL ISLAM', '728889', ' 1502258048', '22-23', '2nd', 'KPI', '2nd', '2ENTB2', NULL, 'Electronics', NULL, 'regular', NULL, '1919101137', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(644, ' MD. RAJON HOSSAIN', '728892', ' 1502258045', '22-23', '2nd', 'KPI', '2nd', '2ENTB2', NULL, 'Electronics', NULL, 'regular', NULL, '1854524918', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(645, ' RAJ SAHA', '728894', ' 1502258043', '22-23', '2nd', 'KPI', '2nd', '2ENTB2', NULL, 'Electronics', NULL, 'regular', NULL, '1884632561', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(646, ' FARHAN KHAN RAYAT', '728895', ' 1502258042', '22-23', '2nd', 'KPI', '2nd', '2ENTB2', NULL, 'Electronics', NULL, 'regular', NULL, '1301563414', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(647, ' MD. RAKIBUL ISLAM RAJU', '728899', ' 1502258038', '22-23', '2nd', 'KPI', '2nd', '2ENTB2', NULL, 'Electronics', NULL, 'regular', NULL, '1319446541', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(648, ' MD. SHANTO ISLAM', '728903', ' 1502258035', '22-23', '2nd', 'KPI', '2nd', '2ENTB2', NULL, 'Electronics', NULL, 'regular', NULL, '1826175393', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(649, ' YEASIR ARAFAT', '728904', ' 1502258034', '22-23', '2nd', 'KPI', '2nd', '2ENTB2', NULL, 'Electronics', NULL, 'regular', NULL, '1967344155', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(650, ' MD. SOUROV MIA', '728905', ' 1502258033', '22-23', '2nd', 'KPI', '2nd', '2ENTB2', NULL, 'Electronics', NULL, 'regular', NULL, '1784860510', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(651, ' MD. SAKIB HOSSIN', '728906', ' 1502258032', '22-23', '2nd', 'KPI', '2nd', '2ENTB2', NULL, 'Electronics', NULL, 'regular', NULL, '1311696926', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(652, ' OVEJIT ROY', '728908', ' 1502258031', '22-23', '2nd', 'KPI', '2nd', '2ENTB2', NULL, 'Electronics', NULL, 'regular', NULL, '1720465236', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(653, ' MD. MONOWAR HOSSAIN RIFAT', '728909', ' 1502258030', '22-23', '2nd', 'KPI', '2nd', '2ENTB2', NULL, 'Electronics', NULL, 'regular', NULL, '1948727957', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(654, ' MD.SHIPON ALI', '728911', ' 1502258029', '22-23', '2nd', 'KPI', '2nd', '2ENTB2', NULL, 'Electronics', NULL, 'regular', NULL, '1306980071', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(655, ' MD.SADIKUR RAHMAN', '728912', ' 1502258028', '22-23', '2nd', 'KPI', '2nd', '2ENTB2', NULL, 'Electronics', NULL, 'regular', NULL, '1902260475', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(656, ' MD. RAKIBUL ISLAM', '728913', ' 1502258027', '22-23', '2nd', 'KPI', '2nd', '2ENTB2', NULL, 'Electronics', NULL, 'regular', NULL, '1727325089', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(657, ' MD. REJVI AHMED', '728915', ' 1502258026', '22-23', '2nd', 'KPI', '2nd', '2ENTB2', NULL, 'Electronics', NULL, 'regular', NULL, '1744311582', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(658, ' MD NOYON HOSSEN', '728916', ' 1502258025', '22-23', '2nd', 'KPI', '2nd', '2ENTB2', NULL, 'Electronics', NULL, 'regular', NULL, '1913541866', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(659, ' MD. SUJON MIA', '728917', ' 1502258024', '22-23', '2nd', 'KPI', '2nd', '2ENTB2', NULL, 'Electronics', NULL, 'regular', NULL, '1875446019', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(660, ' MD. RAHAD HASSAN', '728918', ' 1502258023', '22-23', '2nd', 'KPI', '2nd', '2ENTB2', NULL, 'Electronics', NULL, 'regular', NULL, '1705699076', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(661, ' MD. RAKIB HOSSAIN', '728919', ' 1502258022', '22-23', '2nd', 'KPI', '2nd', '2ENTB2', NULL, 'Electronics', NULL, 'regular', NULL, '1986987054', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(662, ' MD. ANTOR ISLAM', '728921', ' 1502258020', '22-23', '2nd', 'KPI', '2nd', '2ENTB2', NULL, 'Electronics', NULL, 'regular', NULL, '1970742816', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(663, ' AL SAHOREAR JOY', '728922', ' 1502258019', '22-23', '2nd', 'KPI', '2nd', '2ENTB2', NULL, 'Electronics', NULL, 'regular', NULL, '1793554095', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(664, ' MD.NAJMUS SAKIB SURUJ', '728924', ' 1502258018', '22-23', '2nd', 'KPI', '2nd', '2ENTB2', NULL, 'Electronics', NULL, 'regular', NULL, '1925569602', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(665, ' MD AL MAHMUD HASAN', '728927', ' 1502258016', '22-23', '2nd', 'KPI', '2nd', '2ENTB2', NULL, 'Electronics', NULL, 'regular', NULL, '1310298068', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(666, 'MD. ALI HASAN MUJAHID APON', '731193', '1502259662', '2223', '2nd', 'KPI', '2nd', '2ENTB2', NULL, 'Electronics', NULL, 'regular', 'Transfar', NULL, '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(667, 'NAYEM AHMED LIMON', '733672', '1502261863', '2223', '2nd', 'KPI', '2nd', '2ENTB2', NULL, 'Electronics', NULL, 'regular', 'Transfar', NULL, '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(668, 'MD. SHAHEB ALI', '733679', '1502261858', '2223', '2nd', 'KPI', '2nd', '2ENTB2', NULL, 'Electronics', NULL, 'regular', 'Transfar', NULL, '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(669, 'MD SAZZAD MAHMUD SAJIB', '628004', ' 1502183991', '21-22', '2nd', 'KPI', '1st', '2ENTA1', NULL, 'Electronics', NULL, 'regular', 'Connection', '1302553167', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(670, 'MD. ROKONUZZAMAN RION', '627950', ' 1502184021', '21-22', '2nd', 'KPI', '1st', '2ENTB1', NULL, 'Electronics', NULL, 'regular', NULL, 'M', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(671, 'MD. BIJOY HOSSAIN', '628068', ' 1502184616', '21-22', '2nd', 'KPI', '2nd', '2ENTA2-IRR', NULL, 'Electronics', NULL, 'regular', NULL, 'M', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(672, 'MD ABU HURAIRA', '726086', '1502255552', '2223', '2nd', 'KPI', '1st', '2MTA1', NULL, 'Mechanical', NULL, 'regular', NULL, 'M', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(673, ' MD. NOYON ISLAM', '728928', ' 1502305901', '22-23', '2nd', 'KPI', '1st', '2MTA1', NULL, 'Mechanical', NULL, 'regular', NULL, '1812194879', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(674, ' MD. ATIKUR RAHMAN', '728930', ' 1502305900', '22-23', '2nd', 'KPI', '1st', '2MTA1', NULL, 'Mechanical', NULL, 'regular', NULL, '1860783924', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(675, ' MD. ALIF HOSSEN', '728931', ' 1502257624', '22-23', '2nd', 'KPI', '1st', '2MTA1', NULL, 'Mechanical', NULL, 'regular', NULL, '1912844535', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(676, ' SAIDUL ISLAM', '728932', ' 1502257623', '22-23', '2nd', 'KPI', '1st', '2MTA1', NULL, 'Mechanical', NULL, 'regular', NULL, '1779998654', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(677, ' MD. ALIRAJ SOMADHAN', '728935', ' 1502257621', '22-23', '2nd', 'KPI', '1st', '2MTA1', NULL, 'Mechanical', NULL, 'regular', NULL, '1595636259', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(678, ' MD. SOJIB AHMED', '728936', ' 1502257620', '22-23', '2nd', 'KPI', '1st', '2MTA1', NULL, 'Mechanical', NULL, 'regular', NULL, '1315513432', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(679, ' SHOWVIK AHMED SAIF', '728937', ' 1502257619', '22-23', '2nd', 'KPI', '1st', '2MTA1', NULL, 'Mechanical', NULL, 'regular', NULL, '1888535110', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(680, ' ALIF IMRAN', '728938', ' 1502257618', '22-23', '2nd', 'KPI', '1st', '2MTA1', NULL, 'Mechanical', NULL, 'regular', NULL, '1308025110', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(681, ' MST. RIYA', '728940', ' 1502257616', '22-23', '2nd', 'KPI', '1st', '2MTA1', NULL, 'Mechanical', NULL, 'regular', NULL, '1721974080', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(682, ' RATUL MOLLA', '728942', ' 1502257615', '22-23', '2nd', 'KPI', '1st', '2MTA1', NULL, 'Mechanical', NULL, 'regular', NULL, '1768258826', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(683, ' MD FORHAD HOSSAIN', '728943', ' 1502257614', '22-23', '2nd', 'KPI', '1st', '2MTA1', NULL, 'Mechanical', NULL, 'regular', NULL, '1731206764', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(684, ' MD. ABDULLAH', '728949', ' 1502257611', '22-23', '2nd', 'KPI', '1st', '2MTA1', NULL, 'Mechanical', NULL, 'regular', NULL, '1301940758', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(685, ' NISHAN HOSSAIN', '728950', ' 1502257610', '22-23', '2nd', 'KPI', '1st', '2MTA1', NULL, 'Mechanical', NULL, 'regular', NULL, '1772447688', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(686, ' MD. IBRAHIM SHEIKH', '728952', ' 1502257609', '22-23', '2nd', 'KPI', '1st', '2MTA1', NULL, 'Mechanical', NULL, 'regular', NULL, '1317421674', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(687, ' MST.EITI KHATUN', '728955', ' 1502257607', '22-23', '2nd', 'KPI', '1st', '2MTA1', NULL, 'Mechanical', NULL, 'regular', NULL, '1754178865', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(688, ' KHALID BIN WALID', '728956', ' 1502257606', '22-23', '2nd', 'KPI', '1st', '2MTA1', NULL, 'Mechanical', NULL, 'regular', NULL, '1739931199', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(689, ' MD. ASHAN ALI', '728957', ' 1502257605', '22-23', '2nd', 'KPI', '1st', '2MTA1', NULL, 'Mechanical', NULL, 'regular', NULL, '1848179765', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(690, ' MD. PAVEL ISLAM', '728959', ' 1502257604', '22-23', '2nd', 'KPI', '1st', '2MTA1', NULL, 'Mechanical', NULL, 'regular', NULL, '1816957485', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(691, ' MD. ARAFAT HOSSAIN ARAF', '728960', ' 1502257603', '22-23', '2nd', 'KPI', '1st', '2MTA1', NULL, 'Mechanical', NULL, 'regular', NULL, '1918546149', '2024-01-12 03:40:56', '2024-01-12 03:40:56'),
(692, ' MD.ESTAKUR RAHMAN SHOZIB', '728962', ' 1502257601', '22-23', '2nd', 'KPI', '1st', '2MTA1', NULL, 'Mechanical', NULL, 'regular', NULL, '1748500787', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(693, ' MD. TAZBIR RAHAMAN', '728964', ' 1502257600', '22-23', '2nd', 'KPI', '1st', '2MTA1', NULL, 'Mechanical', NULL, 'regular', NULL, '1706039555', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(694, ' MOSTAFIJUR RAHMAN SHIHAB', '728965', ' 1502257599', '22-23', '2nd', 'KPI', '1st', '2MTA1', NULL, 'Mechanical', NULL, 'regular', NULL, '1870420449', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(695, ' MD. ASHIQUR RAHMAN AKASH', '728966', ' 1502257598', '22-23', '2nd', 'KPI', '1st', '2MTA1', NULL, 'Mechanical', NULL, 'regular', NULL, '1754745914', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(696, ' MD SAMRAT', '728970', ' 1502257597', '22-23', '2nd', 'KPI', '1st', '2MTA1', NULL, 'Mechanical', NULL, 'regular', NULL, '1722204766', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(697, ' MD. SAYED HOSSEN', '728971', ' 1502257596', '22-23', '2nd', 'KPI', '1st', '2MTA1', NULL, 'Mechanical', NULL, 'regular', NULL, '1707529830', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(698, ' MST. SUBORNA AKTER', '728973', ' 1502257595', '22-23', '2nd', 'KPI', '1st', '2MTA1', NULL, 'Mechanical', NULL, 'regular', NULL, '1753269356', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(699, ' SHEIKH FARHA FARJANA SHAMMI', '728974', ' 1502257594', '22-23', '2nd', 'KPI', '1st', '2MTA1', NULL, 'Mechanical', NULL, 'regular', NULL, '1671128993', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(700, ' MD. SHIBBIR AHOMMED BADHON', '728976', ' 1502257593', '22-23', '2nd', 'KPI', '1st', '2MTA1', NULL, 'Mechanical', NULL, 'regular', NULL, '1639791131', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(701, ' SUVOJIT PODDER', '728977', ' 1502257592', '22-23', '2nd', 'KPI', '1st', '2MTA1', NULL, 'Mechanical', NULL, 'regular', NULL, '1752441505', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(702, ' SUJON MAHMUD', '728980', ' 1502257591', '22-23', '2nd', 'KPI', '1st', '2MTA1', NULL, 'Mechanical', NULL, 'regular', NULL, '1581858362', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(703, ' MD. JUBAYER', '728984', ' 1502257588', '22-23', '2nd', 'KPI', '1st', '2MTA1', NULL, 'Mechanical', NULL, 'regular', NULL, '1906214134', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(704, ' MD. SAMIUL ISLAM', '728987', ' 1502257587', '22-23', '2nd', 'KPI', '1st', '2MTA1', NULL, 'Mechanical', NULL, 'regular', NULL, '1701027397', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(705, ' RAJES KUMAR DAS', '728988', ' 1502257586', '22-23', '2nd', 'KPI', '1st', '2MTA1', NULL, 'Mechanical', NULL, 'regular', NULL, '1786285692', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(706, ' MD. JUBAYER HOSSAIN SORON', '728989', ' 1502257585', '22-23', '2nd', 'KPI', '1st', '2MTA1', NULL, 'Mechanical', NULL, 'regular', NULL, '1720201762', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(707, ' AL SHAHARIAR NOYON', '728991', ' 1502257584', '22-23', '2nd', 'KPI', '1st', '2MTA1', NULL, 'Mechanical', NULL, 'regular', NULL, '1706117792', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(708, ' MD.UZZAL HOSSAIN', '728993', ' 1502257582', '22-23', '2nd', 'KPI', '1st', '2MTA1', NULL, 'Mechanical', NULL, 'regular', NULL, '1773131453', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(709, ' MD. ARIF HOSSIN', '728997', ' 1502257581', '22-23', '2nd', 'KPI', '1st', '2MTA1', NULL, 'Mechanical', NULL, 'regular', NULL, '1303676915', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(710, ' SAJADUR RAHAMAN SOMUDRO', '728998', ' 1502257580', '22-23', '2nd', 'KPI', '1st', '2MTA1', NULL, 'Mechanical', NULL, 'regular', NULL, '1919571920', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(711, ' MD. IMRAN HOSSEN', '729001', ' 1502257579', '22-23', '2nd', 'KPI', '1st', '2MTA1', NULL, 'Mechanical', NULL, 'regular', NULL, '1988121949', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(712, ' SIAM HOSSAIN', '729002', ' 1502257578', '22-23', '2nd', 'KPI', '1st', '2MTA1', NULL, 'Mechanical', NULL, 'regular', NULL, '1880745977', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(713, ' ZARIN TASNIM SNEHA', '729003', ' 1502257577', '22-23', '2nd', 'KPI', '1st', '2MTA1', NULL, 'Mechanical', NULL, 'regular', NULL, '1731687428', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(714, ' MD. YASIN SHEIKH', '729007', ' 1502257576', '22-23', '2nd', 'KPI', '1st', '2MTA1', NULL, 'Mechanical', NULL, 'regular', NULL, '1874068928', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(715, ' MD. TASFIR ALI', '729009', ' 1502257575', '22-23', '2nd', 'KPI', '1st', '2MTA1', NULL, 'Mechanical', NULL, 'regular', NULL, '1627800596', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(716, 'MD TANVIR ROHMAN', '733791', '1502261336', '2223', '2nd', 'KPI', '1st', '2MTA1', NULL, 'Mechanical', NULL, 'regular', 'Transfar', NULL, '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(717, ' SHAWON HOSSEN', '729011', ' 1502257574', '22-23', '2nd', 'KPI', '1st', '2MTB1', NULL, 'Mechanical', NULL, 'regular', NULL, '1907013121', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(718, ' MD. SABBIR HOSSIN', '729012', ' 1502257573', '22-23', '2nd', 'KPI', '1st', '2MTB1', NULL, 'Mechanical', NULL, 'regular', NULL, '1704432587', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(719, ' MD. MAHABUL ISLAM DIPU', '729013', ' 1502257572', '22-23', '2nd', 'KPI', '1st', '2MTB1', NULL, 'Mechanical', NULL, 'regular', NULL, '1790849740', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(720, ' MD. RIDOY AHMED JUEL', '729014', ' 1502257571', '22-23', '2nd', 'KPI', '1st', '2MTB1', NULL, 'Mechanical', NULL, 'regular', NULL, '1647192315', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(721, ' MD. BADHON AL MAMUN', '729015', ' 1502257570', '22-23', '2nd', 'KPI', '1st', '2MTB1', NULL, 'Mechanical', NULL, 'regular', NULL, '1826078249', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(722, ' PARTHO RANA', '729017', ' 1502257569', '22-23', '2nd', 'KPI', '1st', '2MTB1', NULL, 'Mechanical', NULL, 'regular', NULL, '1877040560', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(723, ' TABASSUM BINTE ARONI RUMANA', '729018', ' 1502257568', '22-23', '2nd', 'KPI', '1st', '2MTB1', NULL, 'Mechanical', NULL, 'regular', NULL, '1735308012', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(724, ' MD. SHUVO ISLAM', '729019', ' 1502257567', '22-23', '2nd', 'KPI', '1st', '2MTB1', NULL, 'Mechanical', NULL, 'regular', NULL, '1817164591', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(725, ' MD. SUMON HOSSEN', '729036', ' 1502257566', '22-23', '2nd', 'KPI', '1st', '2MTB1', NULL, 'Mechanical', NULL, 'regular', NULL, '1312232196', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(726, ' MD. SHOWON PERVEJ', '729038', ' 1502257564', '22-23', '2nd', 'KPI', '1st', '2MTB1', NULL, 'Mechanical', NULL, 'regular', NULL, '1619209414', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(727, ' MD ABU SIAM', '729042', ' 1502257563', '22-23', '2nd', 'KPI', '1st', '2MTB1', NULL, 'Mechanical', NULL, 'regular', NULL, '1721741312', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(728, ' MST. KUASHA AKTER MOU', '729043', ' 1502257562', '22-23', '2nd', 'KPI', '1st', '2MTB1', NULL, 'Mechanical', NULL, 'regular', NULL, '1744157364', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(729, ' SHAKARUL ISLAM SHAKIL', '729046', ' 1502257560', '22-23', '2nd', 'KPI', '1st', '2MTB1', NULL, 'Mechanical', NULL, 'regular', NULL, '1920098867', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(730, ' SHISHIR AHAMED ZISAN', '729047', ' 1502257559', '22-23', '2nd', 'KPI', '1st', '2MTB1', NULL, 'Mechanical', NULL, 'regular', NULL, '1817596311', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(731, ' MD. TANJIL MORSHED', '729048', ' 1502257558', '22-23', '2nd', 'KPI', '1st', '2MTB1', NULL, 'Mechanical', NULL, 'regular', NULL, '1311360453', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(732, ' MD.MOMINUL ISLAM', '729050', ' 1502257557', '22-23', '2nd', 'KPI', '1st', '2MTB1', NULL, 'Mechanical', NULL, 'regular', NULL, '1641040334', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(733, ' MD. RUHAN ALI', '729053', ' 1502257556', '22-23', '2nd', 'KPI', '1st', '2MTB1', NULL, 'Mechanical', NULL, 'regular', NULL, '1319457560', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(734, ' MD. MASUM ALI', '729056', ' 1502257555', '22-23', '2nd', 'KPI', '1st', '2MTB1', NULL, 'Mechanical', NULL, 'regular', NULL, '1758466243', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(735, ' MD. RASHAD JAMAN USAID', '729060', ' 1502257554', '22-23', '2nd', 'KPI', '1st', '2MTB1', NULL, 'Mechanical', NULL, 'regular', NULL, '1722501826', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(736, ' MST. RABEYA KHATUN', '729061', ' 1502257553', '22-23', '2nd', 'KPI', '1st', '2MTB1', NULL, 'Mechanical', NULL, 'regular', NULL, '1797705619', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(737, ' MD. MINHAJUR RAHMAN MAHIM', '729062', ' 1502257552', '22-23', '2nd', 'KPI', '1st', '2MTB1', NULL, 'Mechanical', NULL, 'regular', NULL, '1725179716', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(738, ' ROBIN AHMED', '729068', ' 1502257551', '22-23', '2nd', 'KPI', '1st', '2MTB1', NULL, 'Mechanical', NULL, 'regular', NULL, '1723327162', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(739, ' MD.ASADUL ISLAM', '729071', ' 1502257550', '22-23', '2nd', 'KPI', '1st', '2MTB1', NULL, 'Mechanical', NULL, 'regular', NULL, '1312971344', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(740, ' MD. SUMON ALI', '729072', ' 1502257549', '22-23', '2nd', 'KPI', '1st', '2MTB1', NULL, 'Mechanical', NULL, 'regular', NULL, '1786655642', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(741, ' MD TANJIM FAHIM KOWSHIK', '729074', ' 1502257548', '22-23', '2nd', 'KPI', '1st', '2MTB1', NULL, 'Mechanical', NULL, 'regular', NULL, '1935284143', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(742, ' MD EMRAN HOSSEN', '729076', ' 1502257547', '22-23', '2nd', 'KPI', '1st', '2MTB1', NULL, 'Mechanical', NULL, 'regular', NULL, '1920561826', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(743, ' JUBAYER AHMED JARIF', '729079', ' 1502257546', '22-23', '2nd', 'KPI', '1st', '2MTB1', NULL, 'Mechanical', NULL, 'regular', NULL, '1571239114', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(744, ' MEHEDY HASAN', '729082', ' 1502257544', '22-23', '2nd', 'KPI', '1st', '2MTB1', NULL, 'Mechanical', NULL, 'regular', NULL, '1310389098', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(745, ' SAIFI', '729083', ' 1502257543', '22-23', '2nd', 'KPI', '1st', '2MTB1', NULL, 'Mechanical', NULL, 'regular', NULL, '1935996176', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(746, ' HAMZELLA HOSSAIN', '729084', ' 1502257542', '22-23', '2nd', 'KPI', '1st', '2MTB1', NULL, 'Mechanical', NULL, 'regular', NULL, '1884660848', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(747, ' JEYEL RANA', '729087', ' 1502257541', '22-23', '2nd', 'KPI', '1st', '2MTB1', NULL, 'Mechanical', NULL, 'regular', NULL, '1404974148', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(748, ' MD. MUSTAKIM MASUM', '729088', ' 1502257540', '22-23', '2nd', 'KPI', '1st', '2MTB1', NULL, 'Mechanical', NULL, 'regular', NULL, '1796042796', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(749, ' MD. JAKARIYA HOSEN JOY', '729089', ' 1502257539', '22-23', '2nd', 'KPI', '1st', '2MTB1', NULL, 'Mechanical', NULL, 'regular', NULL, '1755489440', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(750, ' ABDUL KADER', '729090', ' 1502257538', '22-23', '2nd', 'KPI', '1st', '2MTB1', NULL, 'Mechanical', NULL, 'regular', NULL, '1716647502', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(751, ' SAFIA YESMIN SHAMMI', '729091', ' 1502257537', '22-23', '2nd', 'KPI', '1st', '2MTB1', NULL, 'Mechanical', NULL, 'regular', NULL, '1849826576', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(752, ' MD. MOHIUDDIN AHMED FAYSAL', '729093', ' 1502257536', '22-23', '2nd', 'KPI', '1st', '2MTB1', NULL, 'Mechanical', NULL, 'regular', NULL, '1919361096', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(753, ' MST. SUMAIYA KHATUN', '729095', ' 1502257535', '22-23', '2nd', 'KPI', '1st', '2MTB1', NULL, 'Mechanical', NULL, 'regular', NULL, '1754145826', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(754, ' RAYHAN', '729096', ' 1502257534', '22-23', '2nd', 'KPI', '1st', '2MTB1', NULL, 'Mechanical', NULL, 'regular', NULL, '1815956777', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(755, ' K.M.HASIBUL ALOM SANTO', '729097', ' 1502257533', '22-23', '2nd', 'KPI', '1st', '2MTB1', NULL, 'Mechanical', NULL, 'regular', NULL, '1798514734', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(756, ' MD. JISAN HOSSAIN', '729099', ' 1502257532', '22-23', '2nd', 'KPI', '1st', '2MTB1', NULL, 'Mechanical', NULL, 'regular', NULL, '1318124951', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(757, ' MUNNY', '729100', ' 1502257531', '22-23', '2nd', 'KPI', '1st', '2MTB1', NULL, 'Mechanical', NULL, 'regular', NULL, '1617150701', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(758, ' MD. MAZIDIS SHAHID LAMIM', '729101', ' 1502257530', '22-23', '2nd', 'KPI', '1st', '2MTB1', NULL, 'Mechanical', NULL, 'regular', NULL, '1568753299', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(759, ' SHREE BIPROJIT KARMOKAR', '729103', ' 1502257529', '22-23', '2nd', 'KPI', '1st', '2MTB1', NULL, 'Mechanical', NULL, 'regular', NULL, '1707249744', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(760, ' MD. SERAJUL ISLAM AHAD', '729104', ' 1502257528', '22-23', '2nd', 'KPI', '1st', '2MTB1', NULL, 'Mechanical', NULL, 'regular', NULL, '1782399879', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(761, ' MD. TARIQUL ISLAM', '729105', ' 1502257527', '22-23', '2nd', 'KPI', '1st', '2MTB1', NULL, 'Mechanical', NULL, 'regular', NULL, '1850782356', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(762, ' ANIK', '729107', ' 1502305912', '22-23', '2nd', 'KPI', '2nd', '2MTA2', NULL, 'Mechanical', NULL, 'regular', NULL, '1770418056', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(763, ' ZANNATUL TISHA', '729109', ' 1502258209', '22-23', '2nd', 'KPI', '2nd', '2MTA2', NULL, 'Mechanical', NULL, 'regular', NULL, '1778533143', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(764, ' MD. SHIMUL HOSSAIN', '729110', ' 1502258208', '22-23', '2nd', 'KPI', '2nd', '2MTA2', NULL, 'Mechanical', NULL, 'regular', NULL, '1638833075', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(765, ' MST. EASMIN AKTER', '729111', ' 1502258207', '22-23', '2nd', 'KPI', '2nd', '2MTA2', NULL, 'Mechanical', NULL, 'regular', NULL, '1741374070', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(766, ' SULTANUR RAHMAN', '729114', ' 1502258205', '22-23', '2nd', 'KPI', '2nd', '2MTA2', NULL, 'Mechanical', NULL, 'regular', NULL, '1719451790', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(767, ' MD. SHAWON HOSSEN', '729118', ' 1502258204', '22-23', '2nd', 'KPI', '2nd', '2MTA2', NULL, 'Mechanical', NULL, 'regular', NULL, '1991823266', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(768, ' MD. SADMAN SAMI', '729122', ' 1502258202', '22-23', '2nd', 'KPI', '2nd', '2MTA2', NULL, 'Mechanical', NULL, 'regular', NULL, '1717821966', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(769, ' MD. RASEL AHMED TUHIN', '729125', ' 1502258201', '22-23', '2nd', 'KPI', '2nd', '2MTA2', NULL, 'Mechanical', NULL, 'regular', NULL, '1301462080', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(770, ' MD SALMAN', '729128', ' 1502258199', '22-23', '2nd', 'KPI', '2nd', '2MTA2', NULL, 'Mechanical', NULL, 'regular', NULL, '1868552444', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(771, ' MD. ABDULLAH AL MAMUN', '729130', ' 1502258198', '22-23', '2nd', 'KPI', '2nd', '2MTA2', NULL, 'Mechanical', NULL, 'regular', NULL, '1723979789', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(772, ' MD. RABBY HOSSEN PRITOM', '729133', ' 1502258197', '22-23', '2nd', 'KPI', '2nd', '2MTA2', NULL, 'Mechanical', NULL, 'regular', NULL, '1772340411', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(773, ' MD. ATIKUL ISLAM', '729134', ' 1502258196', '22-23', '2nd', 'KPI', '2nd', '2MTA2', NULL, 'Mechanical', NULL, 'regular', NULL, '1311864895', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(774, ' MD. LIMON SHIKDER', '729136', ' 1502258195', '22-23', '2nd', 'KPI', '2nd', '2MTA2', NULL, 'Mechanical', NULL, 'regular', NULL, '1688852374', '2024-01-12 03:40:57', '2024-01-12 03:40:57');
INSERT INTO `exam_students` (`id`, `name`, `roll`, `reg_no`, `session`, `semester`, `institute`, `shift`, `student_group`, `ref_subject`, `technology`, `probidhan`, `status`, `remarks`, `mobile`, `created_at`, `updated_at`) VALUES
(775, ' MD. MARUF HASAN', '729139', ' 1502258193', '22-23', '2nd', 'KPI', '2nd', '2MTA2', NULL, 'Mechanical', NULL, 'regular', NULL, '1731324788', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(776, ' MD TUSAR', '729140', ' 1502258192', '22-23', '2nd', 'KPI', '2nd', '2MTA2', NULL, 'Mechanical', NULL, 'regular', NULL, '1778176711', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(777, ' MD ABDULLAH AL MAMUN', '729142', ' 1502258191', '22-23', '2nd', 'KPI', '2nd', '2MTA2', NULL, 'Mechanical', NULL, 'regular', NULL, '1735301267', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(778, ' MD ULLAS', '729143', ' 1502258190', '22-23', '2nd', 'KPI', '2nd', '2MTA2', NULL, 'Mechanical', NULL, 'regular', NULL, '1785030442', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(779, ' MD. SABBIR HOSSAIN', '729144', ' 1502258189', '22-23', '2nd', 'KPI', '2nd', '2MTA2', NULL, 'Mechanical', NULL, 'regular', NULL, '1782234248', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(780, ' MD NOYON PRAMANIK', '729145', ' 1502258188', '22-23', '2nd', 'KPI', '2nd', '2MTA2', NULL, 'Mechanical', NULL, 'regular', NULL, '1719520156', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(781, ' MD. SHAHIN RAHMAN', '729149', ' 1502258186', '22-23', '2nd', 'KPI', '2nd', '2MTA2', NULL, 'Mechanical', NULL, 'regular', NULL, '1705154023', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(782, ' MD. SHAHARYA MAHFUZ', '729150', ' 1502258185', '22-23', '2nd', 'KPI', '2nd', '2MTA2', NULL, 'Mechanical', NULL, 'regular', NULL, '1839023307', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(783, ' SIAM UDDIN', '729152', ' 1502258184', '22-23', '2nd', 'KPI', '2nd', '2MTA2', NULL, 'Mechanical', NULL, 'regular', NULL, '1725789452', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(784, ' ADIL AHMED', '729153', ' 1502258183', '22-23', '2nd', 'KPI', '2nd', '2MTA2', NULL, 'Mechanical', NULL, 'regular', NULL, '1302046089', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(785, ' MD. EMON AHAMED', '729154', ' 1502258182', '22-23', '2nd', 'KPI', '2nd', '2MTA2', NULL, 'Mechanical', NULL, 'regular', NULL, '1917782658', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(786, ' MD.SHAHRIAR HASAN', '729155', ' 1502258181', '22-23', '2nd', 'KPI', '2nd', '2MTA2', NULL, 'Mechanical', NULL, 'regular', NULL, '1310231825', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(787, ' MD SAKIB HOSSAIN', '729157', ' 1502258180', '22-23', '2nd', 'KPI', '2nd', '2MTA2', NULL, 'Mechanical', NULL, 'regular', NULL, '1876147959', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(788, ' SHUVO ROY', '729161', ' 1502258178', '22-23', '2nd', 'KPI', '2nd', '2MTA2', NULL, 'Mechanical', NULL, 'regular', NULL, '1737340901', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(789, ' ASHRAFUL ISLAM GALIB', '729162', ' 1502258177', '22-23', '2nd', 'KPI', '2nd', '2MTA2', NULL, 'Mechanical', NULL, 'regular', NULL, '1735874222', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(790, ' MD. RUHUL AMIN', '729163', ' 1502258176', '22-23', '2nd', 'KPI', '2nd', '2MTA2', NULL, 'Mechanical', NULL, 'regular', NULL, '1405599924', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(791, ' TARIK JAMIL FAHIM', '729166', ' 1502258175', '22-23', '2nd', 'KPI', '2nd', '2MTA2', NULL, 'Mechanical', NULL, 'regular', NULL, '1407505530', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(792, ' MD. NOYON ALI', '729168', ' 1502258174', '22-23', '2nd', 'KPI', '2nd', '2MTA2', NULL, 'Mechanical', NULL, 'regular', NULL, '1400009925', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(793, ' MD. TAREQ RAHMAN', '729169', ' 1502258173', '22-23', '2nd', 'KPI', '2nd', '2MTA2', NULL, 'Mechanical', NULL, 'regular', NULL, '1798089643', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(794, ' MD. ROBIN HOSSAIN', '729170', ' 1502258172', '22-23', '2nd', 'KPI', '2nd', '2MTA2', NULL, 'Mechanical', NULL, 'regular', NULL, '1869638590', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(795, ' MD. MAHFUJUR RAHMAN', '729171', ' 1502258171', '22-23', '2nd', 'KPI', '2nd', '2MTA2', NULL, 'Mechanical', NULL, 'regular', NULL, '1795181159', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(796, ' MD. SIPON ISLAM', '729175', ' 1502258169', '22-23', '2nd', 'KPI', '2nd', '2MTA2', NULL, 'Mechanical', NULL, 'regular', NULL, '1719985079', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(797, ' MD. AHSAN HABIB', '729177', ' 1502258168', '22-23', '2nd', 'KPI', '2nd', '2MTA2', NULL, 'Mechanical', NULL, 'regular', NULL, '1611707255', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(798, ' MD. ALAMIN', '729178', ' 1502258167', '22-23', '2nd', 'KPI', '2nd', '2MTA2', NULL, 'Mechanical', NULL, 'regular', NULL, '1405400710', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(799, ' ASIFUL HOSSAIN', '729179', ' 1502258166', '22-23', '2nd', 'KPI', '2nd', '2MTA2', NULL, 'Mechanical', NULL, 'regular', NULL, '1406762814', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(800, ' MD.UMOR FARUK', '729181', ' 1502258165', '22-23', '2nd', 'KPI', '2nd', '2MTA2', NULL, 'Mechanical', NULL, 'regular', NULL, '1959229404', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(801, ' MD.RONJU HOSSAIN', '729183', ' 1502258164', '22-23', '2nd', 'KPI', '2nd', '2MTA2', NULL, 'Mechanical', NULL, 'regular', NULL, '1929408299', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(802, ' MD. SHOVON ALI', '729184', ' 1502258163', '22-23', '2nd', 'KPI', '2nd', '2MTA2', NULL, 'Mechanical', NULL, 'regular', NULL, '1314505332', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(803, ' MARUF HOSEN', '729185', ' 1502258162', '22-23', '2nd', 'KPI', '2nd', '2MTA2', NULL, 'Mechanical', NULL, 'regular', NULL, '1316921776', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(804, ' MST. SANIYA KHATUN', '729186', ' 1502258161', '22-23', '2nd', 'KPI', '2nd', '2MTA2', NULL, 'Mechanical', NULL, 'regular', NULL, '1759685605', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(805, ' SALEHIN AHAMMED', '729187', ' 1502258160', '22-23', '2nd', 'KPI', '2nd', '2MTA2', NULL, 'Mechanical', NULL, 'regular', NULL, '1319521125', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(806, 'MD. MEHEDI HASAN', '733818', '1502261980', '2223', '2nd', 'KPI', '2nd', '2MTA2', NULL, 'Mechanical', NULL, 'regular', 'Transfar', NULL, '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(807, 'SHAHARIAR MASUD', '733853', '1502261954', '22-23', '2nd', 'KPI', '2nd', '2MTA2', NULL, 'Mechanical', NULL, 'regular', NULL, NULL, '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(808, 'MD. ANIK SHEIKH', '747823', '1502271804', '2223', '2nd', 'KPI', '2nd', '2MTA2', NULL, 'Mechanical', NULL, 'regular', 'Transfar', NULL, '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(809, 'NAYMUR RAHMAN', '747845', '1502271788', '2223', '2nd', 'KPI', '2nd', '2MTA2', NULL, 'Mechanical', NULL, 'regular', 'Transfar', NULL, '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(810, ' MD.ABDUR RAHMAN', '729188', ' 1502258159', '22-23', '2nd', 'KPI', '2nd', '2MTB2', NULL, 'Mechanical', NULL, 'regular', NULL, '1776735712', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(811, ' MD. NAFIJ KHAN', '729189', ' 1502258158', '22-23', '2nd', 'KPI', '2nd', '2MTB2', NULL, 'Mechanical', NULL, 'regular', NULL, '1737456850', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(812, ' MD SHIMUL HOSSAIN', '729190', ' 1502258157', '22-23', '2nd', 'KPI', '2nd', '2MTB2', NULL, 'Mechanical', NULL, 'regular', NULL, '1906808078', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(813, ' SHOFIKUR RAHMAN SAIKAT', '729191', ' 1502258156', '22-23', '2nd', 'KPI', '2nd', '2MTB2', NULL, 'Mechanical', NULL, 'regular', NULL, '1940771334', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(814, ' MD. NAIMUR RAHMAN NISHAN', '729195', ' 1502258155', '22-23', '2nd', 'KPI', '2nd', '2MTB2', NULL, 'Mechanical', NULL, 'regular', NULL, '1765043544', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(815, ' RASHEDUJJAMAN KHAN BIPUL', '729199', ' 1502258154', '22-23', '2nd', 'KPI', '2nd', '2MTB2', NULL, 'Mechanical', NULL, 'regular', NULL, '1828486805', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(816, ' MD.SAMIM HOSSAIN', '729201', ' 1502258153', '22-23', '2nd', 'KPI', '2nd', '2MTB2', NULL, 'Mechanical', NULL, 'regular', NULL, '1407688830', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(817, ' MD. JAHID HASAN', '729203', ' 1502258152', '22-23', '2nd', 'KPI', '2nd', '2MTB2', NULL, 'Mechanical', NULL, 'regular', NULL, '1777924803', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(818, ' MD. TASHRIF MAHMUD DIPU', '729205', ' 1502258151', '22-23', '2nd', 'KPI', '2nd', '2MTB2', NULL, 'Mechanical', NULL, 'regular', NULL, '1936822032', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(819, ' MOHAMMAD ALI', '729206', ' 1502258150', '22-23', '2nd', 'KPI', '2nd', '2MTB2', NULL, 'Mechanical', NULL, 'regular', NULL, '1727018434', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(820, ' MD ASAD', '729209', ' 1502258149', '22-23', '2nd', 'KPI', '2nd', '2MTB2', NULL, 'Mechanical', NULL, 'regular', NULL, '1321564721', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(821, ' MD. SHAGOR', '729210', ' 1502258148', '22-23', '2nd', 'KPI', '2nd', '2MTB2', NULL, 'Mechanical', NULL, 'regular', NULL, '1317592574', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(822, ' SHEHAB SHEIKH', '729212', ' 1502258147', '22-23', '2nd', 'KPI', '2nd', '2MTB2', NULL, 'Mechanical', NULL, 'regular', NULL, '1936449209', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(823, ' MD SHAKIL KHAN', '729213', ' 1502258146', '22-23', '2nd', 'KPI', '2nd', '2MTB2', NULL, 'Mechanical', NULL, 'regular', NULL, '1776808473', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(824, ' MD.RAFIZ HASAN', '729218', ' 1502258145', '22-23', '2nd', 'KPI', '2nd', '2MTB2', NULL, 'Mechanical', NULL, 'regular', NULL, '1408592092', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(825, ' MD. MAHAMUDUR RAHMAN NISHAN', '729219', ' 1502258144', '22-23', '2nd', 'KPI', '2nd', '2MTB2', NULL, 'Mechanical', NULL, 'regular', NULL, '1614847832', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(826, ' MD. PARVEJ SHEAKH', '729221', ' 1502258143', '22-23', '2nd', 'KPI', '2nd', '2MTB2', NULL, 'Mechanical', NULL, 'regular', NULL, '1817842338', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(827, ' RUHAN ISLAM', '729222', ' 1502258142', '22-23', '2nd', 'KPI', '2nd', '2MTB2', NULL, 'Mechanical', NULL, 'regular', NULL, '1792335466', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(828, ' MD.RAHIN ROKON UDDIN', '729223', ' 1502258141', '22-23', '2nd', 'KPI', '2nd', '2MTB2', NULL, 'Mechanical', NULL, 'regular', NULL, '1762236732', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(829, ' MD RONY', '729225', ' 1502258140', '22-23', '2nd', 'KPI', '2nd', '2MTB2', NULL, 'Mechanical', NULL, 'regular', NULL, '1302797779', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(830, ' MD. SHISHIR MAHMUD SUJON', '729226', ' 1502258139', '22-23', '2nd', 'KPI', '2nd', '2MTB2', NULL, 'Mechanical', NULL, 'regular', NULL, '1972486467', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(831, ' MD. ASHIKUR RAHAMAN ASHIK', '729229', ' 1502258138', '22-23', '2nd', 'KPI', '2nd', '2MTB2', NULL, 'Mechanical', NULL, 'regular', NULL, '1785032546', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(832, ' MD RIFAJ HOSSAIN', '729231', ' 1502258137', '22-23', '2nd', 'KPI', '2nd', '2MTB2', NULL, 'Mechanical', NULL, 'regular', NULL, '1965200943', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(833, ' MD. ASHIK MONDOL', '729236', ' 1502258135', '22-23', '2nd', 'KPI', '2nd', '2MTB2', NULL, 'Mechanical', NULL, 'regular', NULL, '1317226741', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(834, ' MD. ASIF AHMED', '729240', ' 1502258134', '22-23', '2nd', 'KPI', '2nd', '2MTB2', NULL, 'Mechanical', NULL, 'regular', NULL, '1708784711', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(835, ' MD. BADHON', '729244', ' 1502258132', '22-23', '2nd', 'KPI', '2nd', '2MTB2', NULL, 'Mechanical', NULL, 'regular', NULL, '1316200889', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(836, ' RUDRO BISWAS', '729245', ' 1502258131', '22-23', '2nd', 'KPI', '2nd', '2MTB2', NULL, 'Mechanical', NULL, 'regular', NULL, '1776628690', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(837, ' MD. OMAR FARUK', '729247', ' 1502258129', '22-23', '2nd', 'KPI', '2nd', '2MTB2', NULL, 'Mechanical', NULL, 'regular', NULL, '1407284594', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(838, ' MD. OMIO HASAN', '729248', ' 1502258128', '22-23', '2nd', 'KPI', '2nd', '2MTB2', NULL, 'Mechanical', NULL, 'regular', NULL, '1716892998', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(839, ' MD. RAFIUL ISLAM RAFIZ', '729251', ' 1502258126', '22-23', '2nd', 'KPI', '2nd', '2MTB2', NULL, 'Mechanical', NULL, 'regular', NULL, '1783349967', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(840, ' MUHAMMAD IBRAHIM', '729252', ' 1502258125', '22-23', '2nd', 'KPI', '2nd', '2MTB2', NULL, 'Mechanical', NULL, 'regular', NULL, '1971399760', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(841, ' MD. MONIR HOSSAIN', '729253', ' 1502258124', '22-23', '2nd', 'KPI', '2nd', '2MTB2', NULL, 'Mechanical', NULL, 'regular', NULL, '1745412386', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(842, ' MD. SHOWROV AHMED', '729255', ' 1502258123', '22-23', '2nd', 'KPI', '2nd', '2MTB2', NULL, 'Mechanical', NULL, 'regular', NULL, '1919560358', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(843, ' SABBIR AHMED SOWRAV', '729257', ' 1502258121', '22-23', '2nd', 'KPI', '2nd', '2MTB2', NULL, 'Mechanical', NULL, 'regular', NULL, '1323914895', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(844, ' MD. ERFAN HOSSEN', '729258', ' 1502258120', '22-23', '2nd', 'KPI', '2nd', '2MTB2', NULL, 'Mechanical', NULL, 'regular', NULL, '1957943069', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(845, ' NAFIZ AHMED', '729259', ' 1502258119', '22-23', '2nd', 'KPI', '2nd', '2MTB2', NULL, 'Mechanical', NULL, 'regular', NULL, '1785970414', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(846, ' MD. SHIMUL AHMED', '729260', ' 1502258118', '22-23', '2nd', 'KPI', '2nd', '2MTB2', NULL, 'Mechanical', NULL, 'regular', NULL, '1749191259', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(847, ' MD DIPU HOSSAIN', '729261', ' 1502258117', '22-23', '2nd', 'KPI', '2nd', '2MTB2', NULL, 'Mechanical', NULL, 'regular', NULL, '1914679052', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(848, ' MD. POROSH SHEIKH', '729263', ' 1502258115', '22-23', '2nd', 'KPI', '2nd', '2MTB2', NULL, 'Mechanical', NULL, 'regular', NULL, '1789306188', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(849, ' MD. NUR ISLAM', '729266', ' 1502258113', '22-23', '2nd', 'KPI', '2nd', '2MTB2', NULL, 'Mechanical', NULL, 'regular', NULL, '1766589642', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(850, ' ABDUL AL MAHMUD NURAN', '729267', ' 1502258112', '22-23', '2nd', 'KPI', '2nd', '2MTB2', NULL, 'Mechanical', NULL, 'regular', NULL, '1315862975', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(851, ' MIZANUR RAHMAN RANJID', '729271', ' 1502258111', '22-23', '2nd', 'KPI', '2nd', '2MTB2', NULL, 'Mechanical', NULL, 'regular', NULL, '1772337943', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(852, 'MD. ARIFUL ISLAM', '747832', '1502271799', '2223', '2nd', 'KPI', '2nd', '2MTB2', NULL, 'Mechanical', NULL, 'regular', 'Transfar', NULL, '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(853, ' HASANUZZAMAN', '729272', ' 1502305903', '22-23', '2nd', 'KPI', '1st', '2PTA1', NULL, 'Power', NULL, 'regular', NULL, '1717948707', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(854, ' ALAMIN ISLAM', '729274', ' 1502257722', '22-23', '2nd', 'KPI', '1st', '2PTA1', NULL, 'Power', NULL, 'regular', NULL, '1752341281', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(855, ' NAZMUS SAKIB NAFIZ', '729276', ' 1502257721', '22-23', '2nd', 'KPI', '1st', '2PTA1', NULL, 'Power', NULL, 'regular', NULL, '1701320353', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(856, ' MST. JAKIYA PARVEN', '729278', ' 1502257720', '22-23', '2nd', 'KPI', '1st', '2PTA1', NULL, 'Power', NULL, 'regular', NULL, '1797667650', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(857, ' TAKVIR ISLAM', '729280', ' 1502257719', '22-23', '2nd', 'KPI', '1st', '2PTA1', NULL, 'Power', NULL, 'regular', NULL, '1758758658', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(858, ' PRANTO DAS', '729282', ' 1502257718', '22-23', '2nd', 'KPI', '1st', '2PTA1', NULL, 'Power', NULL, 'regular', NULL, '1787427445', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(859, ' MD. RONY AHOSAN ARZU', '729290', ' 1502257716', '22-23', '2nd', 'KPI', '1st', '2PTA1', NULL, 'Power', NULL, 'regular', NULL, '1951731196', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(860, ' MD. TUSHER HOSSEN', '729291', ' 1502257715', '22-23', '2nd', 'KPI', '1st', '2PTA1', NULL, 'Power', NULL, 'regular', NULL, '1797028908', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(861, ' MD. GOLAM RABBY', '729292', ' 1502257714', '22-23', '2nd', 'KPI', '1st', '2PTA1', NULL, 'Power', NULL, 'regular', NULL, '1300618443', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(862, ' JANETA RAHMAN JOYA', '729295', ' 1502257713', '22-23', '2nd', 'KPI', '1st', '2PTA1', NULL, 'Power', NULL, 'regular', NULL, '1766545675', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(863, ' MST. FATEMA KHATUN', '729296', ' 1502257712', '22-23', '2nd', 'KPI', '1st', '2PTA1', NULL, 'Power', NULL, 'regular', NULL, '1317594685', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(864, ' MD. ABU SAYED', '729298', ' 1502257711', '22-23', '2nd', 'KPI', '1st', '2PTA1', NULL, 'Power', NULL, 'regular', NULL, '1736152413', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(865, ' MD. FAHIM MAHMUD', '729301', ' 1502257710', '22-23', '2nd', 'KPI', '1st', '2PTA1', NULL, 'Power', NULL, 'regular', NULL, '1319765454', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(866, ' SHRABONTI YASMIN', '729306', ' 1502257709', '22-23', '2nd', 'KPI', '1st', '2PTA1', NULL, 'Power', NULL, 'regular', NULL, '1773407402', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(867, ' ABIR HASAN FAHIM', '729312', ' 1502257706', '22-23', '2nd', 'KPI', '1st', '2PTA1', NULL, 'Power', NULL, 'regular', NULL, '1736595942', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(868, ' MD. EFAZ AHAMED', '729316', ' 1502257705', '22-23', '2nd', 'KPI', '1st', '2PTA1', NULL, 'Power', NULL, 'regular', NULL, '1965470742', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(869, ' MD. SHAIM AHEMD', '729320', ' 1502257702', '22-23', '2nd', 'KPI', '1st', '2PTA1', NULL, 'Power', NULL, 'regular', NULL, '1725879050', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(870, ' MD. RAFIDUL ISLAM', '729321', ' 1502257701', '22-23', '2nd', 'KPI', '1st', '2PTA1', NULL, 'Power', NULL, 'regular', NULL, '1842583117', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(871, ' MD. HASAN ULLA', '729322', ' 1502257700', '22-23', '2nd', 'KPI', '1st', '2PTA1', NULL, 'Power', NULL, 'regular', NULL, '1319457606', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(872, ' MD. KAWSER ALI', '729323', ' 1502257699', '22-23', '2nd', 'KPI', '1st', '2PTA1', NULL, 'Power', NULL, 'regular', NULL, '1736569163', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(873, ' MD. NILOY HOSSEN', '729324', ' 1502257698', '22-23', '2nd', 'KPI', '1st', '2PTA1', NULL, 'Power', NULL, 'regular', NULL, '1312590349', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(874, ' MD. ROHANUR RAHMAN', '729326', ' 1502257697', '22-23', '2nd', 'KPI', '1st', '2PTA1', NULL, 'Power', NULL, 'regular', NULL, '1756757475', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(875, ' MD. RASEL ISLAM TANVIR', '729328', ' 1502257696', '22-23', '2nd', 'KPI', '1st', '2PTA1', NULL, 'Power', NULL, 'regular', NULL, '1308455705', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(876, ' MD.NAYEEM', '729329', ' 1502257695', '22-23', '2nd', 'KPI', '1st', '2PTA1', NULL, 'Power', NULL, 'regular', NULL, '1636169591', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(877, ' MST. ONI KHATUN', '729339', ' 1502257694', '22-23', '2nd', 'KPI', '1st', '2PTA1', NULL, 'Power', NULL, 'regular', NULL, '1303482080', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(878, ' MD. BAPPI HOSSAIN', '729341', ' 1502257693', '22-23', '2nd', 'KPI', '1st', '2PTA1', NULL, 'Power', NULL, 'regular', NULL, '1642676484', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(879, ' MST SABRIN SULTANA MITU', '729343', ' 1502257692', '22-23', '2nd', 'KPI', '1st', '2PTA1', NULL, 'Power', NULL, 'regular', NULL, '1734495796', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(880, ' RIFAT SHAHRIAR', '729353', ' 1502257687', '22-23', '2nd', 'KPI', '1st', '2PTA1', NULL, 'Power', NULL, 'regular', NULL, '1996489448', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(881, ' YASIN ARAFAT', '729355', ' 1502257685', '22-23', '2nd', 'KPI', '1st', '2PTA1', NULL, 'Power', NULL, 'regular', NULL, '1744228544', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(882, ' ABU BOKER SIDDIK', '729357', ' 1502257684', '22-23', '2nd', 'KPI', '1st', '2PTA1', NULL, 'Power', NULL, 'regular', NULL, '1720686598', '2024-01-12 03:40:57', '2024-01-12 03:40:57'),
(883, ' KAZI SHANTONUR RAHMAN', '729360', ' 1502257682', '22-23', '2nd', 'KPI', '1st', '2PTA1', NULL, 'Power', NULL, 'regular', NULL, '1923240953', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(884, ' MD. AKASH ALI', '729362', ' 1502257681', '22-23', '2nd', 'KPI', '1st', '2PTA1', NULL, 'Power', NULL, 'regular', NULL, '1312984429', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(885, ' MD. MAHIN AHMED SHAFIN', '729364', ' 1502257679', '22-23', '2nd', 'KPI', '1st', '2PTA1', NULL, 'Power', NULL, 'regular', NULL, '1781655671', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(886, ' EMON AHMMED BESHAL', '729365', ' 1502257678', '22-23', '2nd', 'KPI', '1st', '2PTA1', NULL, 'Power', NULL, 'regular', NULL, '1300660785', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(887, ' KAZI ALI HOSSEN', '729370', ' 1502257676', '22-23', '2nd', 'KPI', '1st', '2PTA1', NULL, 'Power', NULL, 'regular', NULL, '1752861590', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(888, ' KOISHIK', '729372', ' 1502257675', '22-23', '2nd', 'KPI', '1st', '2PTA1', NULL, 'Power', NULL, 'regular', NULL, '1767577045', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(889, ' MD. BORHAN ALI', '729377', ' 1502257672', '22-23', '2nd', 'KPI', '1st', '2PTB1', NULL, 'Power', NULL, 'regular', NULL, '1754968973', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(890, ' MD. OMI KHAN', '729378', ' 1502257671', '22-23', '2nd', 'KPI', '1st', '2PTB1', NULL, 'Power', NULL, 'regular', NULL, '1831726433', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(891, ' MD. FAHIM AHMED RUPOM', '729380', ' 1502257670', '22-23', '2nd', 'KPI', '1st', '2PTB1', NULL, 'Power', NULL, 'regular', NULL, '1978154019', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(892, ' MD. MINARUL ISLAM RAKIB', '729384', ' 1502257668', '22-23', '2nd', 'KPI', '1st', '2PTB1', NULL, 'Power', NULL, 'regular', NULL, '1620861163', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(893, ' MD. PARVES HOSSEN', '729387', ' 1502257666', '22-23', '2nd', 'KPI', '1st', '2PTB1', NULL, 'Power', NULL, 'regular', NULL, '1777346036', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(894, ' MD EMRAN ALI MOLLA', '729388', ' 1502257665', '22-23', '2nd', 'KPI', '1st', '2PTB1', NULL, 'Power', NULL, 'regular', NULL, '1319799028', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(895, ' MD NAFIZ IKBAL OMEY', '729389', ' 1502257664', '22-23', '2nd', 'KPI', '1st', '2PTB1', NULL, 'Power', NULL, 'regular', NULL, '1615743173', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(896, ' ISRAFIL HOSSEN SABBIR', '729390', ' 1502257663', '22-23', '2nd', 'KPI', '1st', '2PTB1', NULL, 'Power', NULL, 'regular', NULL, '1995996035', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(897, ' TANVIR MAHOTAB RODDRO', '729397', ' 1502257662', '22-23', '2nd', 'KPI', '1st', '2PTB1', NULL, 'Power', NULL, 'regular', NULL, '1981095036', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(898, ' MD. TOHA AHOMMED SAMI', '729401', ' 1502257660', '22-23', '2nd', 'KPI', '1st', '2PTB1', NULL, 'Power', NULL, 'regular', NULL, '1924238114', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(899, ' MD. IBRAHIM HOSSAIN', '729402', ' 1502257659', '22-23', '2nd', 'KPI', '1st', '2PTB1', NULL, 'Power', NULL, 'regular', NULL, '1868248478', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(900, ' MD. ABID HASAN TURJO', '729405', ' 1502257658', '22-23', '2nd', 'KPI', '1st', '2PTB1', NULL, 'Power', NULL, 'regular', NULL, '1717014142', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(901, ' TANVIR MAHMUD MITUL', '729410', ' 1502257657', '22-23', '2nd', 'KPI', '1st', '2PTB1', NULL, 'Power', NULL, 'regular', NULL, '1743457762', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(902, ' NISHAT TASNIN SUCHONA', '729412', ' 1502257656', '22-23', '2nd', 'KPI', '1st', '2PTB1', NULL, 'Power', NULL, 'regular', NULL, '1732093939', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(903, ' MD.NASIM BILLAH', '729413', ' 1502257655', '22-23', '2nd', 'KPI', '1st', '2PTB1', NULL, 'Power', NULL, 'regular', NULL, '1554679979', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(904, ' MD. TOUFIQ ISLAM', '729414', ' 1502257654', '22-23', '2nd', 'KPI', '1st', '2PTB1', NULL, 'Power', NULL, 'regular', NULL, '1798435675', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(905, ' MST. MYMUNA HAQUE LIZA', '729415', ' 1502257653', '22-23', '2nd', 'KPI', '1st', '2PTB1', NULL, 'Power', NULL, 'regular', NULL, '1764963968', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(906, ' MST. MIM AKTER JUI', '729416', ' 1502257652', '22-23', '2nd', 'KPI', '1st', '2PTB1', NULL, 'Power', NULL, 'regular', NULL, '1302430250', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(907, ' MD. REAJUL HAQUE UDOY', '729418', ' 1502257650', '22-23', '2nd', 'KPI', '1st', '2PTB1', NULL, 'Power', NULL, 'regular', NULL, '1315989095', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(908, ' MD. ABDULLAH HOSSAIN', '729421', ' 1502257649', '22-23', '2nd', 'KPI', '1st', '2PTB1', NULL, 'Power', NULL, 'regular', NULL, '1768632939', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(909, ' MD.SHOPON ALI', '729422', ' 1502257648', '22-23', '2nd', 'KPI', '1st', '2PTB1', NULL, 'Power', NULL, 'regular', NULL, '1923685246', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(910, ' MD. TOHIDUL ISLAM', '729423', ' 1502257647', '22-23', '2nd', 'KPI', '1st', '2PTB1', NULL, 'Power', NULL, 'regular', NULL, '1778318616', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(911, ' MD. MONIRUZZAMAN', '729428', ' 1502257644', '22-23', '2nd', 'KPI', '1st', '2PTB1', NULL, 'Power', NULL, 'regular', NULL, '1937143844', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(912, ' MD. TOUHIDUL ISLAM TOMAL', '729429', ' 1502257643', '22-23', '2nd', 'KPI', '1st', '2PTB1', NULL, 'Power', NULL, 'regular', NULL, '1798452270', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(913, ' MD SABBIR SHEIKH', '729430', ' 1502257642', '22-23', '2nd', 'KPI', '1st', '2PTB1', NULL, 'Power', NULL, 'regular', NULL, '1950553884', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(914, ' AMIO SUHAN', '729431', ' 1502257641', '22-23', '2nd', 'KPI', '1st', '2PTB1', NULL, 'Power', NULL, 'regular', NULL, '1754970159', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(915, ' TAHASIN HOSSAIN', '729434', ' 1502257640', '22-23', '2nd', 'KPI', '1st', '2PTB1', NULL, 'Power', NULL, 'regular', NULL, '1766791909', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(916, ' MD. JUBAYER HOSSAIN', '729438', ' 1502257636', '22-23', '2nd', 'KPI', '1st', '2PTB1', NULL, 'Power', NULL, 'regular', NULL, '1880077309', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(917, ' MD. SHAKIL ISLAM', '729439', ' 1502257635', '22-23', '2nd', 'KPI', '1st', '2PTB1', NULL, 'Power', NULL, 'regular', NULL, '1743979719', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(918, ' MD. SHAFIUDDIN AHMED SIMANTO', '729440', ' 1502257634', '22-23', '2nd', 'KPI', '1st', '2PTB1', NULL, 'Power', NULL, 'regular', NULL, '1933797948', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(919, ' MD.ASHIKUN NABI', '729442', ' 1502257633', '22-23', '2nd', 'KPI', '1st', '2PTB1', NULL, 'Power', NULL, 'regular', NULL, '1916696553', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(920, ' MD.NAZIM UDDIN PIASH', '729443', ' 1502257632', '22-23', '2nd', 'KPI', '1st', '2PTB1', NULL, 'Power', NULL, 'regular', NULL, '1407689111', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(921, ' JISBI JUBAER SHABAB', '729444', ' 1502257631', '22-23', '2nd', 'KPI', '1st', '2PTB1', NULL, 'Power', NULL, 'regular', NULL, '1724326270', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(922, ' MD NADIMUL BASHAR', '729445', ' 1502257630', '22-23', '2nd', 'KPI', '1st', '2PTB1', NULL, 'Power', NULL, 'regular', NULL, '1919597671', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(923, ' MD TAMIM IQUBAL', '729448', ' 1502257628', '22-23', '2nd', 'KPI', '1st', '2PTB1', NULL, 'Power', NULL, 'regular', NULL, '1796512175', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(924, ' MD.ANIK SIDDIKI', '729451', ' 1502257627', '22-23', '2nd', 'KPI', '1st', '2PTB1', NULL, 'Power', NULL, 'regular', NULL, '1728730252', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(925, ' MD. SHOHAN RAIHAN', '729452', ' 1502257626', '22-23', '2nd', 'KPI', '1st', '2PTB1', NULL, 'Power', NULL, 'regular', NULL, '1610830474', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(926, ' MD. FAHAD AL HASIB', '729454', ' 1502305914', '22-23', '2nd', 'KPI', '2nd', '2PTA2', NULL, 'Power', NULL, 'regular', NULL, '1303589821', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(927, ' MD. JAKARIA AHMED', '729456', ' 1502305913', '22-23', '2nd', 'KPI', '2nd', '2PTA2', NULL, 'Power', NULL, 'regular', NULL, '1635766094', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(928, ' MD MEHEDI HASAN', '729457', ' 1502258305', '22-23', '2nd', 'KPI', '2nd', '2PTA2', NULL, 'Power', NULL, 'regular', NULL, '1738156286', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(929, ' ARPON AHMED', '729459', ' 1502258303', '22-23', '2nd', 'KPI', '2nd', '2PTA2', NULL, 'Power', NULL, 'regular', NULL, '1716275825', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(930, ' MD. EMRAN ALI', '729475', ' 1502258300', '22-23', '2nd', 'KPI', '2nd', '2PTA2', NULL, 'Power', NULL, 'regular', NULL, '1303676915', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(931, ' MD. RAHAT HOSSAIN', '729478', ' 1502258299', '22-23', '2nd', 'KPI', '2nd', '2PTA2', NULL, 'Power', NULL, 'regular', NULL, '1701009991', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(932, ' MD. SANTO', '729482', ' 1502258296', '22-23', '2nd', 'KPI', '2nd', '2PTA2', NULL, 'Power', NULL, 'regular', NULL, '1323028143', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(933, ' MD.MUZAHID', '729484', ' 1502258295', '22-23', '2nd', 'KPI', '2nd', '2PTA2', NULL, 'Power', NULL, 'regular', NULL, '1709696534', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(934, ' MD. BIJOY HOSSAIN', '729486', ' 1502258294', '22-23', '2nd', 'KPI', '2nd', '2PTA2', NULL, 'Power', NULL, 'regular', NULL, '1798283644', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(935, ' TAFHIM MAHBUB', '729487', ' 1502258293', '22-23', '2nd', 'KPI', '2nd', '2PTA2', NULL, 'Power', NULL, 'regular', NULL, '1994985472', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(936, ' AKIB MAHAMUD RIAD', '729488', ' 1502258292', '22-23', '2nd', 'KPI', '2nd', '2PTA2', NULL, 'Power', NULL, 'regular', NULL, '1719486683', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(937, ' MD RAKIBUL ISLAM', '729489', ' 1502258291', '22-23', '2nd', 'KPI', '2nd', '2PTA2', NULL, 'Power', NULL, 'regular', NULL, '1947205541', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(938, ' MD. NISANUR', '729492', ' 1502258290', '22-23', '2nd', 'KPI', '2nd', '2PTA2', NULL, 'Power', NULL, 'regular', NULL, '1409300071', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(939, ' SHOVO KUMAR BISWAS', '729498', ' 1502258288', '22-23', '2nd', 'KPI', '2nd', '2PTA2', NULL, 'Power', NULL, 'regular', NULL, '1742160771', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(940, ' MD. ABU TOHA', '729499', ' 1502258287', '22-23', '2nd', 'KPI', '2nd', '2PTA2', NULL, 'Power', NULL, 'regular', NULL, '1880751580', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(941, ' MD. RAHUL', '729501', ' 1502258286', '22-23', '2nd', 'KPI', '2nd', '2PTA2', NULL, 'Power', NULL, 'regular', NULL, '1783317578', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(942, ' MD. HACHIBUR RAHAMAN TUSHER', '729505', ' 1502258285', '22-23', '2nd', 'KPI', '2nd', '2PTA2', NULL, 'Power', NULL, 'regular', NULL, '1741245418', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(943, ' MD. JAHIDUL ISLAM', '729506', ' 1502258284', '22-23', '2nd', 'KPI', '2nd', '2PTA2', NULL, 'Power', NULL, 'regular', NULL, '1323325143', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(944, ' MEHEROB HASAN RATUL', '729508', ' 1502258282', '22-23', '2nd', 'KPI', '2nd', '2PTA2', NULL, 'Power', NULL, 'regular', NULL, '1968033505', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(945, ' MD. MARUF SARKAR', '729513', ' 1502258280', '22-23', '2nd', 'KPI', '2nd', '2PTA2', NULL, 'Power', NULL, 'regular', NULL, '1727609579', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(946, ' SHEJKH MD MURAD', '729516', ' 1502258278', '22-23', '2nd', 'KPI', '2nd', '2PTA2', NULL, 'Power', NULL, 'regular', NULL, '1918685958', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(947, ' MD. SHAMENUL ISLAM SAGOR', '729517', ' 1502258277', '22-23', '2nd', 'KPI', '2nd', '2PTA2', NULL, 'Power', NULL, 'regular', NULL, '1995052648', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(948, ' BIPUL HOSSAIN', '729518', ' 1502258276', '22-23', '2nd', 'KPI', '2nd', '2PTA2', NULL, 'Power', NULL, 'regular', NULL, '1768829634', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(949, ' MD. SADAT UL ISLAM', '729519', ' 1502258275', '22-23', '2nd', 'KPI', '2nd', '2PTA2', NULL, 'Power', NULL, 'regular', NULL, '1315356461', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(950, ' ASIF', '729520', ' 1502258274', '22-23', '2nd', 'KPI', '2nd', '2PTA2', NULL, 'Power', NULL, 'regular', NULL, '1595681071', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(951, ' YEASIR SHARAFAT NUR', '729522', ' 1502258272', '22-23', '2nd', 'KPI', '2nd', '2PTA2', NULL, 'Power', NULL, 'regular', NULL, '1888444351', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(952, ' MD. ATIKUZZAMAN', '729524', ' 1502258271', '22-23', '2nd', 'KPI', '2nd', '2PTA2', NULL, 'Power', NULL, 'regular', NULL, '1714518136', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(953, ' MD JIBON SARDAR', '729526', ' 1502258270', '22-23', '2nd', 'KPI', '2nd', '2PTA2', NULL, 'Power', NULL, 'regular', NULL, '1307202944', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(954, ' MD. SHAKIBUL HOSSEN', '729528', ' 1502258269', '22-23', '2nd', 'KPI', '2nd', '2PTA2', NULL, 'Power', NULL, 'regular', NULL, '1319447726', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(955, ' MD ARAFAT SANI', '729532', ' 1502258268', '22-23', '2nd', 'KPI', '2nd', '2PTA2', NULL, 'Power', NULL, 'regular', NULL, '1317434137', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(956, ' MD. SABBIR HOSSAIN', '729534', ' 1502258267', '22-23', '2nd', 'KPI', '2nd', '2PTA2', NULL, 'Power', NULL, 'regular', NULL, '1928254738', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(957, ' MD. PINKU HOSSEN', '729536', ' 1502258265', '22-23', '2nd', 'KPI', '2nd', '2PTA2', NULL, 'Power', NULL, 'regular', NULL, '1405959676', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(958, ' AL EISHRA', '729539', ' 1502258263', '22-23', '2nd', 'KPI', '2nd', '2PTA2', NULL, 'Power', NULL, 'regular', NULL, '1718327760', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(959, ' MAHBUB', '729545', ' 1502258262', '22-23', '2nd', 'KPI', '2nd', '2PTA2', NULL, 'Power', NULL, 'regular', NULL, '1306901019', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(960, ' ZOHAOR RAHAMAN ZISAN', '729546', ' 1502258261', '22-23', '2nd', 'KPI', '2nd', '2PTA2', NULL, 'Power', NULL, 'regular', NULL, '1963750041', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(961, ' HAMIDUL ISLAM', '729549', ' 1502258260', '22-23', '2nd', 'KPI', '2nd', '2PTA2', NULL, 'Power', NULL, 'regular', NULL, '1766588878', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(962, ' MD ANAM', '729551', ' 1502258258', '22-23', '2nd', 'KPI', '2nd', '2PTA2', NULL, 'Power', NULL, 'regular', NULL, '1782517748', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(963, 'MD. SHAON HOSSAIN', '748114', '1502271900', '2223', '2nd', 'KPI', '2nd', '2PTA2', NULL, 'Power', NULL, 'regular', 'Transfar', NULL, '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(964, 'JIHAD SHAHRIAR', '748181', '1502271866', '2223', '2nd', 'KPI', '2nd', '2PTA2', NULL, 'Power', NULL, 'regular', 'Transfar', NULL, '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(965, ' MD. ALI HOSSAIN', '729553', ' 1502258256', '22-23', '2nd', 'KPI', '2nd', '2PTB2', NULL, 'Power', NULL, 'regular', NULL, '1305026515', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(966, ' MD. TARIKUL ISLAM LIKHON', '729554', ' 1502258255', '22-23', '2nd', 'KPI', '2nd', '2PTB2', NULL, 'Power', NULL, 'regular', NULL, '1305026420', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(967, ' MD. SABBIR AHMED', '729555', ' 1502258254', '22-23', '2nd', 'KPI', '2nd', '2PTB2', NULL, 'Power', NULL, 'regular', NULL, '1316918289', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(968, ' NIROB AHMED', '729556', ' 1502258253', '22-23', '2nd', 'KPI', '2nd', '2PTB2', NULL, 'Power', NULL, 'regular', NULL, '1767425952', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(969, ' JIHAD AHMED SIFAT', '729559', ' 1502258251', '22-23', '2nd', 'KPI', '2nd', '2PTB2', NULL, 'Power', NULL, 'regular', NULL, '1751323008', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(970, ' SHAMIM AHAMED MAHI', '729564', ' 1502258249', '22-23', '2nd', 'KPI', '2nd', '2PTB2', NULL, 'Power', NULL, 'regular', NULL, '1954403398', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(971, ' NAVID HASAN', '729569', ' 1502258246', '22-23', '2nd', 'KPI', '2nd', '2PTB2', NULL, 'Power', NULL, 'regular', NULL, '1876558107', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(972, ' ZIHAD FORAZI', '729570', ' 1502258245', '22-23', '2nd', 'KPI', '2nd', '2PTB2', NULL, 'Power', NULL, 'regular', NULL, '1752290879', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(973, ' MD. MOMINUL ISLAM', '729571', ' 1502258244', '22-23', '2nd', 'KPI', '2nd', '2PTB2', NULL, 'Power', NULL, 'regular', NULL, '1755057718', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(974, ' MD. SIDDIKUR RAHMAN RUDRO', '729578', ' 1502258241', '22-23', '2nd', 'KPI', '2nd', '2PTB2', NULL, 'Power', NULL, 'regular', NULL, '1822746099', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(975, ' MD. MEHEDI HASAN', '729580', ' 1502258240', '22-23', '2nd', 'KPI', '2nd', '2PTB2', NULL, 'Power', NULL, 'regular', NULL, '1764751317', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(976, ' MD. BADHON HOSSAIN', '729583', ' 1502258239', '22-23', '2nd', 'KPI', '2nd', '2PTB2', NULL, 'Power', NULL, 'regular', NULL, '1325796700', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(977, ' MD. PALLOB HOSSAIN', '729584', ' 1502258238', '22-23', '2nd', 'KPI', '2nd', '2PTB2', NULL, 'Power', NULL, 'regular', NULL, '1708643457', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(978, ' RABBI HOSSAIN', '729587', ' 1502258237', '22-23', '2nd', 'KPI', '2nd', '2PTB2', NULL, 'Power', NULL, 'regular', NULL, '1772314345', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(979, ' MD. RAFIZ ALI', '729589', ' 1502258236', '22-23', '2nd', 'KPI', '2nd', '2PTB2', NULL, 'Power', NULL, 'regular', NULL, '1713414142', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(980, ' MD. SHOHEL ALI', '729590', ' 1502258235', '22-23', '2nd', 'KPI', '2nd', '2PTB2', NULL, 'Power', NULL, 'regular', NULL, '1865778983', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(981, ' MD. NAYMUR RAHMAN NAYEM', '729591', ' 1502258234', '22-23', '2nd', 'KPI', '2nd', '2PTB2', NULL, 'Power', NULL, 'regular', NULL, '1926116897', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(982, ' MD. SHAHED HOSSAIN', '729592', ' 1502258233', '22-23', '2nd', 'KPI', '2nd', '2PTB2', NULL, 'Power', NULL, 'regular', NULL, '1772598848', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(983, ' MD. ESHRAK MAHMUD ONTU', '729593', ' 1502258232', '22-23', '2nd', 'KPI', '2nd', '2PTB2', NULL, 'Power', NULL, 'regular', NULL, '1884765092', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(984, ' ASHIQUR RAHMAN', '729595', ' 1502258231', '22-23', '2nd', 'KPI', '2nd', '2PTB2', NULL, 'Power', NULL, 'regular', NULL, '1307075895', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(985, ' MD. RABBY HASAN RATUL', '729598', ' 1502258230', '22-23', '2nd', 'KPI', '2nd', '2PTB2', NULL, 'Power', NULL, 'regular', NULL, '1795018752', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(986, ' MD. SHAUBAN MITUL', '729599', ' 1502258229', '22-23', '2nd', 'KPI', '2nd', '2PTB2', NULL, 'Power', NULL, 'regular', NULL, '1797988260', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(987, ' MD. RIYAD HOSSAIN', '729601', ' 1502258228', '22-23', '2nd', 'KPI', '2nd', '2PTB2', NULL, 'Power', NULL, 'regular', NULL, '1728849514', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(988, ' SOZIB AHMED RUDRY', '729602', ' 1502258227', '22-23', '2nd', 'KPI', '2nd', '2PTB2', NULL, 'Power', NULL, 'regular', NULL, '1863477163', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(989, ' MD. JIM ALI', '729604', ' 1502258225', '22-23', '2nd', 'KPI', '2nd', '2PTB2', NULL, 'Power', NULL, 'regular', NULL, '1793198460', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(990, ' MD. MOHSIN ALI', '729610', ' 1502258223', '22-23', '2nd', 'KPI', '2nd', '2PTB2', NULL, 'Power', NULL, 'regular', NULL, '1700518086', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(991, ' PROBANU RODRIQUES', '729611', ' 1502258222', '22-23', '2nd', 'KPI', '2nd', '2PTB2', NULL, 'Power', NULL, 'regular', NULL, '1305754642', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(992, ' AL SHAHRIAR RAHMAN', '729612', ' 1502258221', '22-23', '2nd', 'KPI', '2nd', '2PTB2', NULL, 'Power', NULL, 'regular', NULL, '1796169324', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(993, ' MD. TANJID HOSSEN', '729613', ' 1502258220', '22-23', '2nd', 'KPI', '2nd', '2PTB2', NULL, 'Power', NULL, 'regular', NULL, '1779949525', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(994, ' KOWSER MAHAMUD', '729614', ' 1502258219', '22-23', '2nd', 'KPI', '2nd', '2PTB2', NULL, 'Power', NULL, 'regular', NULL, '1868176617', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(995, ' MD. NAIMUR RAHMAN JIBON', '729619', ' 1502258218', '22-23', '2nd', 'KPI', '2nd', '2PTB2', NULL, 'Power', NULL, 'regular', NULL, '1963750489', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(996, ' FAHIM', '729629', ' 1502258214', '22-24', '2nd', 'KPI', '2nd', '2PTB2', NULL, 'Power', NULL, 'regular', NULL, '1830018893', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(997, ' MD. HAFIJUL ISLAM', '729631', ' 1502258212', '22-25', '2nd', 'KPI', '2nd', '2PTB2', NULL, 'Power', NULL, 'regular', NULL, '1864128474', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(998, ' MD. ARIFUL ISLAM', '729632', ' 1502258211', '22-26', '2nd', 'KPI', '2nd', '2PTB2', NULL, 'Power', NULL, 'regular', NULL, '1308564799', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(999, ' MD ASIF AKBAR', '729633', ' 1502258210', '22-27', '2nd', 'KPI', '2nd', '2PTB2', NULL, 'Power', NULL, 'regular', NULL, '1980585734', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(1000, 'MD. MINHAZUL ABEDIN SOYEB', '628696', '1502184828', '21-22', '2nd', 'KPI', '2nd', '2PTB2', NULL, 'Power', NULL, 'regular', 'Connection', '1790099323', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(1001, 'MST TAMANNA BIN JANNATUL', '627368', '1502183823', '21-22', '2nd', 'KPI', '1st', '2CTB1-IRR', NULL, 'Civil', NULL, 'Irregular', 'Irregular', NULL, '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(1002, 'MD RIADUJJAMAN RATUL', '627541', '1502184395', '21-22', '2nd', 'KPI', '2nd', '2CTB2-IRR', NULL, 'Civil', NULL, 'Irregular', 'Irregular', NULL, '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(1003, 'JAMIL WAKIL', '628807', ' 1502184353', '21-22', '2nd', 'KPI', '1st', '2CMTA1-IRR', NULL, 'Computer', NULL, 'Irregular', 'Irregular', '1730561914', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(1004, 'SUSMITA SARKAR', '629186', ' 1502184874', '21-22', '2nd', 'KPI', '2nd', '2CMTB2-IRR', NULL, 'Computer', NULL, 'Irregular', 'Irregular', '1994182551', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(1005, 'KOUSHIK KUMAR BISWAS', '629187', ' 1502184873', '21-22', '2nd', 'KPI', '2nd', '2CMTB2-IRR', NULL, 'Computer', NULL, 'Irregular', 'Irregular', '1920262674', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(1006, 'MD. EMON HOSSAIN', '627911', ' 1502184045', '21-22', '2nd', 'KPI', '1st', '2ENTA1-IRR', NULL, 'Electronics', NULL, 'Irregular', 'Irregular', '1874501421', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(1007, 'MD. SAGOR HOSSAIN', '627918', ' 1502184040', '21-22', '2nd', 'KPI', '1st', '2ENTA1-IRR', NULL, 'Electronics', NULL, 'Irregular', 'Irregular', '1781540436', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(1008, 'MD. RONY', '627919', ' 1502184039', '21-22', '2nd', 'KPI', '1st', '2ENTA1-IRR', NULL, 'Electronics', NULL, 'Irregular', 'Irregular', '1854366315', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(1009, 'MD.ROHAN ALI', '627937', ' 1502184028', '21-22', '2nd', 'KPI', '1st', '2ENTA1-IRR', NULL, 'Electronics', NULL, 'Irregular', 'Irregular', '1307889244', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(1010, 'MD YACHIN ARAFAT', '627947', ' 1502184022', '21-22', '2nd', 'KPI', '1st', '2ENTB1-IRR', NULL, 'Electronics', NULL, 'Irregular', 'Irregular', '1924389202', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(1011, 'MD. MUZAHID SHAIKH', '627959', ' 1502184017', '21-22', '2nd', 'KPI', '1st', '2ENTB1-IRR', NULL, 'Electronics', NULL, 'Irregular', 'Irregular', '1924085732', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(1012, 'MD. RASEL MOLLIK', '627965', ' 1502184013', '21-22', '2nd', 'KPI', '1st', '2ENTB1-IRR', NULL, 'Electronics', NULL, 'Irregular', 'Irregular', '1967885423', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(1013, 'MST. SUMAYA AFRIN JUI', '627967', ' 1502184012', '21-22', '2nd', 'KPI', '1st', '2ENTB1-IRR', NULL, 'Electronics', NULL, 'Irregular', 'Irregular', '1310248832', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(1014, 'MD.EMON ALI', '628057', ' 1502184625', '21-22', '2nd', 'KPI', '2nd', '2ENTA2-IRR', NULL, 'Electronics', NULL, 'Irregular', 'Irregular', '1743633565', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(1015, 'MD. SHAWON HOSSAIN', '628062', ' 1502184622', '21-22', '2nd', 'KPI', '2nd', '2ENTA2-IRR', NULL, 'Electronics', NULL, 'Irregular', 'Irregular', '1799945112', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(1016, 'KHONDOKAR GOLAM MOURTUJA', '628070', ' 1502184614', '21-22', '2nd', 'KPI', '2nd', '2ENTA2-IRR', NULL, 'Electronics', NULL, 'Irregular', 'Irregular', '1646747832', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(1017, 'MD. SAKIB HOSSAIN', '628085', ' 1502184602', '21-22', '2nd', 'KPI', '2nd', '2ENTA2-IRR', NULL, 'Electronics', NULL, 'Irregular', 'Irregular', '1763830542', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(1018, 'MD. RABBY AHMED', '628097', ' 1502184594', '21-22', '2nd', 'KPI', '2nd', '2ENTB2-IRR', NULL, 'Electronics', NULL, 'Irregular', 'Irregular', '1780239768', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(1019, 'MD. SHUVO AHMEM', '628120', ' 1502184574', '21-22', '2nd', 'KPI', '2nd', '2ENTB2-IRR', NULL, 'Electronics', NULL, 'Irregular', 'Irregular', '1718894026', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(1020, 'MD. TASDEKUL HASAN MUBIN', '628121', ' 1502184573', '21-22', '2nd', 'KPI', '2nd', '2ENTB2-IRR', NULL, 'Electronics', NULL, 'Irregular', 'Irregular', '1781464199', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(1021, 'MD. SAIF ARIFIN ARKO', '628135', ' 1502184563', '21-22', '2nd', 'KPI', '2nd', '2ENTB2-IRR', NULL, 'Electronics', NULL, 'Irregular', 'Irregular', '1308329276', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(1022, 'MST. TANJILA KHATUN', '628164', ' 1502184157', '21-22', '2nd', 'KPI', '1st', '2MTA1-IRR', NULL, 'Mechanical', NULL, 'Irregular', 'Irregular', '1709822027', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(1023, 'MD ABDULLAH AL MAMUN', '628178', ' 1502184146', '21-22', '2nd', 'KPI', '1st', '2MTA1-IRR', NULL, 'Mechanical', NULL, 'Irregular', 'Irregular', '1875312492', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(1024, 'MD. TANVIR AHMED', '628233', '1502184117', '21-22', '2nd', 'KPI', '1st', '2MTB1-IRR', NULL, 'Mechanical', NULL, 'Irregular', 'Irregular', '1828695219', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(1025, 'MD. JUBAER AL ROMAN', '628275', ' 1502184088', '21-22', '2nd', 'KPI', '1st', '2MTB1-IRR', NULL, 'Mechanical', NULL, 'Irregular', 'Irregular', '1951889580', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(1026, 'SUMAIYA AKTHER KEYA', '628289', ' 1502184080', '21-22', '2nd', 'KPI', '1st', '2MTB1-IRR', NULL, 'Mechanical', NULL, 'Irregular', 'Irregular', '1738951665', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(1027, 'MD SHAMIM ASFUQ', '530958', '1502106805', '20-21', '2nd', 'KPI', '2nd', '2MTA2-IRR', NULL, 'Mechanical', NULL, 'Irregular', 'Irregular', '1741438614', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(1028, 'MD. KAWSAR HOSSAIN SWADHIN', '628316', ' 1502184738', '21-22', '2nd', 'KPI', '2nd', '2MTA2-IRR', NULL, 'Mechanical', NULL, 'Irregular', 'Irregular', '1783437051', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(1029, 'OMAN ISLAM ALIF', '628331', ' 1502184724', '21-22', '2nd', 'KPI', '2nd', '2MTA2-IRR', NULL, 'Mechanical', NULL, 'Irregular', 'Irregular', '1955674472', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(1030, 'AKRAM HOSSAIN', '628475', ' 1502184256', '21-22', '2nd', 'KPI', '1st', '2PTA1-IRR', NULL, 'Power', NULL, 'Irregular', 'Irregular', '1754208642', '2024-01-12 03:40:58', '2024-01-12 03:40:58'),
(1031, ' MD ABDUR RAHMAN SANI', '728312', ' 1502257840', '22-23', '1st', NULL, '2nd', NULL, ' 21011(P), 25711(T), 25911(T,P), 25913(T,P), 26411(T,P), 26711(T,P) ', 'Civil', NULL, 'reguler', NULL, '1843051012', '2024-01-12 03:41:31', '2024-01-12 03:41:31'),
(1032, ' MST. RIYA KHATUN', '728325', ' 1502257835', '22-23', '1st', NULL, '2nd', NULL, ' 25911(T), 25913(T), 26411(T), 26711(T) ', 'Civil', NULL, NULL, NULL, '1748054542', '2024-01-12 03:41:31', '2024-01-12 03:41:31');
INSERT INTO `exam_students` (`id`, `name`, `roll`, `reg_no`, `session`, `semester`, `institute`, `shift`, `student_group`, `ref_subject`, `technology`, `probidhan`, `status`, `remarks`, `mobile`, `created_at`, `updated_at`) VALUES
(1033, ' MD. NAHID AHMED SUMON', '729656', ' 1502257805', '22-23', '1st', NULL, '1st', NULL, ' 21011(P), 25911(P), 25912(T,P), 26711(P), 28511(P) ', 'Computer', NULL, NULL, NULL, '1790069624', '2024-01-12 03:41:31', '2024-01-12 03:41:31'),
(1034, ' SAPNIL', '729729', ' 1502257752', '22-23', '1st', NULL, '1st', NULL, ' 21011(P), 25911(T,P), 25912(T,P), 26711(T,P), 28511(P) ', 'Computer', NULL, NULL, NULL, '1708766425', '2024-01-12 03:41:31', '2024-01-12 03:41:31'),
(1035, ' UMMA FATEMA', '728793', ' 1502257452', '22-23', '1st', NULL, '1st', NULL, ' 25911(T), 25912(T), 26711(T), 26811(T) ', 'Electronics', NULL, NULL, NULL, '1779042387', '2024-01-12 03:41:31', '2024-01-12 03:41:31'),
(1036, ' MD. ABDUR RAHIM SHEIKH', '728841', ' 1502258088', '22-23', '1st', NULL, '2nd', NULL, ' 25911(T), 25912(T), 26711(T), 26811(T) ', 'Electronics', NULL, NULL, NULL, '1924773045', '2024-01-12 03:41:31', '2024-01-12 03:41:31'),
(1037, ' MD. TANZIL ISLAM', '728897', ' 1502258040', '22-23', '1st', NULL, '2nd', NULL, ' 25911(T), 25912(T), 26711(T), 26811(T) ', 'Electronics', NULL, NULL, NULL, '1840783564', '2024-01-12 03:41:31', '2024-01-12 03:41:31'),
(1038, ' ANTOR AHMED', '728891', ' 1502258046', '22-23', '1st', NULL, '2nd', NULL, ' 25911(T), 25912(T), 26711(T), 26811(T) ', 'Electronics', NULL, NULL, NULL, '1772427909', '2024-01-12 03:41:31', '2024-01-12 03:41:31'),
(1039, ' ABDULLAH', '728920', ' 1502258021', '22-23', '1st', NULL, '2nd', NULL, ' 25911(T), 25912(T), 26711(T), 26811(T) ', 'Electronics', NULL, NULL, NULL, '1919570895', '2024-01-12 03:41:31', '2024-01-12 03:41:31'),
(1040, ' MD.BOURHAN KOBIR', '729458', ' 1502258304', '22-23', '1st', NULL, '2nd', NULL, ' 25711(T), 25712(T), 25811(T), 25911(T), 25912(T) ', 'Power', NULL, NULL, NULL, '1935312171', '2024-01-12 03:41:31', '2024-01-12 03:41:31'),
(1041, ' MD. SAIFUL ISLAM POLASH', '728708', ' 1502257518', '22-23', '1st', NULL, '1st', NULL, ' 21011(P), 25911(T,P), 25912(T,P), 26711(T,P), 26811(T,P) ', 'Electronics', NULL, NULL, NULL, '1650192063', '2024-01-12 03:41:31', '2024-01-12 03:41:31'),
(1042, ' JUBAED AHAMMED LIKON', '729515', ' 1502258279', '22-23', '1st', NULL, '2nd', NULL, ' 25712(T), 25811(T), 25911(T), 25912(T) ', 'Power', NULL, NULL, NULL, '1323919244', '2024-01-12 03:41:31', '2024-01-12 03:41:31'),
(1044, 'SRI.SAGOR CHANDRO BISWAS', '627307', '1502183852', '21-22', '3rd', 'KPI', '1st', '3CT', ' 25831(T), 25922(T),26431(T), 26433(T) ', 'Civil', NULL, 'Regular', NULL, '1311466780', '2024-01-13 04:00:29', '2024-01-13 04:00:29'),
(1045, 'MD.AKASH ALI', '628810', ' 1502184350', '21-22', '3rd', 'KPI', '1st', '3CST', ' 25912(T), 25922(T),25931(T), 26831(T), 28531(T),28533(T) ', 'Computer', NULL, 'Regular', NULL, '1746947346', '2024-01-13 04:00:29', '2024-01-13 04:00:29'),
(1046, 'MD SIHAB ASAD', '628811', ' 1502184349', '21-22', '3rd', 'KPI', '1st', '3ET', ' 25811(T), 25922(T),26831(T), 28531(T) ', 'Computer', NULL, 'Regular', NULL, '1316951201', '2024-01-13 04:00:29', '2024-01-13 04:00:29'),
(1047, 'SADIA SULTANA SHANU', '628833', ' 1502184340', '21-22', '3rd', 'KPI', '1st', '3ENT', ' 25911(T), 25912(T),25913(T), 25922(T), 25931(T),26831(T), 28521(T), 28531(T), 28533(T) ', 'Computer', NULL, 'Regular', NULL, '1317272533', '2024-01-13 04:00:29', '2024-01-13 04:00:29'),
(1048, 'MD. SOTON ALI', '628855', ' 1502184333', '21-22', '3rd', 'KPI', '1st', '3MT', ' 25911(T), 25913(T),25922(T), 25931(T), 26831(T),28531(T), 28533(T) ', 'Computer', NULL, 'Regular', NULL, '1310205896', '2024-01-13 04:00:29', '2024-01-13 04:00:29'),
(1049, 'MD. SHAKIB REZA ANTOR', '628869', ' 1502184330', '21-22', '3rd', 'KPI', '1st', '3PT', ' 25912(T), 25913(T),25922(T), 25931(T), 26831(T),28521(T), 28531(T) ', 'Computer', NULL, 'Regular', NULL, '1770998125', '2024-01-13 04:00:29', '2024-01-13 04:00:29'),
(1050, 'MD JARIF MIA', '628933', ' 1502184299', '21-22', '3rd', 'KPI', '1st', '3SUR', ' 25931(T), 26811(T),26831(T), 28531(T), 28533(T) ', 'Computer', NULL, 'Regular', NULL, '1723760425', '2024-01-13 04:00:29', '2024-01-13 04:00:29'),
(1051, 'MD. SHIMUL ISLAM', '628998', ' 1502233861', '21-22', '3rd', 'KPI', '2nd', '3CT', ' 25922(T), 25931(T),26831(T), 28521(T), 28531(T),28533(T) ', 'Computer', NULL, 'Regular', NULL, '1734058612', '2024-01-13 04:00:29', '2024-01-13 04:00:29'),
(1052, 'MD. NIROB HOSSAIN', '629033', ' 1502184927', '21-22', '3rd', 'KPI', '2nd', '3CST', ' 25921(T), 25922(T),25931(T), 26831(T), 28521(T),28533(T) ', 'Computer', NULL, 'Regular', NULL, '1932948961', '2024-01-13 04:00:29', '2024-01-13 04:00:29'),
(1053, 'MD. FARHADUL HASAN RATUL', '629059', ' 1502184919', '21-22', '3rd', 'KPI', '2nd', '3ET', ' 25922(T), 25931(T),26811(T), 26831(T), 28521(T),28533(T) ', 'Computer', NULL, 'Regular', NULL, '1763406448', '2024-01-13 04:00:29', '2024-01-13 04:00:29'),
(1054, 'SHAHARIYA NAFIJ JOY', '629102', ' 1502184905', '21-22', '3rd', 'KPI', '2nd', '3ENT', ' 25921(T), 25922(T),25931(T), 26831(T), 28531(T) ', 'Computer', NULL, 'Regular', NULL, '1964623811', '2024-01-13 04:00:29', '2024-01-13 04:00:29'),
(1055, 'MD.ATIK SHAHRIYAR', '629206', ' 1502184864', '21-22', '3rd', 'KPI', '2nd', '3MT', ' 25921(T), 25922(T),25931(T), 26811(T), 26831(T),28521(T), 28531(T) ', 'Computer', NULL, 'Regular', NULL, '1924779684', '2024-01-13 04:00:29', '2024-01-13 04:00:29'),
(1056, 'MD. ABDULLA ALL ADIB', '627642', ' 1502183933', '21-22', '3rd', 'KPI', '1st', '3PT', ' 25913(T), 25921(T),25931(P), 26731(P), 26833(T,P) ', 'Electrical', NULL, 'Regular', NULL, NULL, '2024-01-13 04:00:29', '2024-01-13 04:00:29'),
(1057, 'MD .ALMAS HOSSAIN', '627644', ' 1502183931', '21-22', '3rd', 'KPI', '1st', '3SUR', ' 25913(T), 25931(T),26731(T), 26833(T) ', 'Electrical', NULL, 'Regular', NULL, NULL, '2024-01-13 04:00:29', '2024-01-13 04:00:29'),
(1058, 'MD SAMAD HOSSAIN', '627875', ' 1502233841', '21-22', '3rd', 'KPI', '1st', '3CT', ' 25912(T), 25921(T),25922(T), 25931(T), 26721(T),26731(T), 26821(T), 26831(T),26832(T) ', 'Electronics', NULL, 'Regular', NULL, '1782618820', '2024-01-13 04:00:29', '2024-01-13 04:00:29'),
(1059, 'KOUSHIK AHMED', '627974', ' 1502184007', '21-22', '3rd', 'KPI', '1st', '3CST', ' 25913(T), 25922(T),25931(T), 26731(T), 26821(T),26831(T) ', 'Electronics', NULL, 'Regular', NULL, '1934585167', '2024-01-13 04:00:29', '2024-01-13 04:00:29'),
(1060, 'MD. HASIM HOSSAIN', '628025', ' 1502184651', '21-22', '3rd', 'KPI', '2nd', '3ET', ' 25921(T), 25922(T),25931(T), 26731(T), 26821(T),26831(T) ', 'Electronics', NULL, 'Regular', NULL, '1814552385', '2024-01-13 04:00:29', '2024-01-13 04:00:29'),
(1061, 'MD. MAWA ISLAM', '628115', ' 1502184579', '21-22', '3rd', 'KPI', '2nd', '3ENT', ' 25921(T), 25922(T),25931(T), 26721(T), 26731(T),26821(T), 26831(T) ', 'Electronics', NULL, 'Regular', NULL, '1732093008', '2024-01-13 04:00:29', '2024-01-13 04:00:29'),
(1062, 'SHAFONE AHAMED', '628520', ' 1502184223', '21-22', '3rd', 'KPI', '1st', '3MT', ' 25912(T), 25922(T),25931(T), 26811(T), 27131(T),27231(T) ', 'Power', NULL, 'Regular', NULL, '1736316234', '2024-01-13 04:00:29', '2024-01-13 04:00:29'),
(1063, 'MD. SOBUJ ALI', '628600', ' 1502184178', '21-22', '3rd', 'KPI', '1st', '3PT', ' 25912(T), 25931(T),26811(T), 27131(T), 27231(T) ', 'Power', NULL, 'Regular', NULL, '1770428029', '2024-01-13 04:00:29', '2024-01-13 04:00:29'),
(1064, 'MD. MARUF BILLAH', '628619', ' 1502184171', '21-22', '3rd', 'KPI', '1st', '3SUR', ' 25931(T), 26811(T),27131(T), 27231(T) ', 'Power', NULL, 'Regular', NULL, '1780214314', '2024-01-13 04:00:29', '2024-01-13 04:00:29'),
(1065, 'MD. MASUM BELLAH', '628622', ' 1502184169', '21-22', '3rd', 'KPI', '1st', '3CT', ' 25931(T), 26811(T),27131(T), 27231(T) ', 'Power', NULL, 'Regular', NULL, '1639892908', '2024-01-13 04:00:29', '2024-01-13 04:00:29'),
(1066, 'MD.TORUN PORAMANIK', '628649', ' 1502184843', '21-22', '3rd', 'KPI', '2nd', '3CST', ' 25912(T), 25931(T),26711(T), 26811(T), 27131(T),27231(T) ', 'Power', NULL, 'Regular', NULL, '1780910720', '2024-01-13 04:00:29', '2024-01-13 04:00:29'),
(1067, 'MD. TASIM MAHAMUD', '628675', ' 1502184836', '21-22', '3rd', 'KPI', '2nd', '3ET', ' 25911(T), 25912(T),25921(T), 25922(T), 25931(T),26711(T), 26811(T), 27012(T),27131(T), 27231(T) ', 'Power', NULL, 'Regular', NULL, '1721327567', '2024-01-13 04:00:29', '2024-01-13 04:00:29'),
(1068, 'MD. SHAUN SHEIKH', '628691', ' 1502184830', '21-22', '3rd', 'KPI', '2nd', '3ENT', ' 25912(T), 25921(T),25922(T), 25931(T), 26811(T),27131(T), 27231(T) ', 'Power', NULL, 'Regular', NULL, '1401567620', '2024-01-13 04:00:29', '2024-01-13 04:00:29'),
(1069, 'MD. REDOAN JAHEDEE NEROB', '628733', ' 1502184812', '21-22', '3rd', 'KPI', '2nd', '3MT', ' 25913(T), 25921(T),25931(T), 26811(T), 27131(T),27231(T) ', 'Power', NULL, 'Regular', NULL, '1408474278', '2024-01-13 04:00:29', '2024-01-13 04:00:29'),
(1070, 'IMON AHMED', '628763', ' 1502184783', '21-22', '3rd', 'KPI', '2nd', '3PT', ' 25913(T), 25921(T),25922(T), 25931(T), 26811(T),27131(T), 27231(T) ', 'Power', NULL, 'Regular', NULL, '1580958977', '2024-01-13 04:00:29', '2024-01-13 04:00:29'),
(1071, 'MD. ZAKIRUL HOSSAIN', '627998', ' 1502183994', '21-22', '3rd', 'KPI', '1st', '3SUR', ' 25913(T), 25922(T,P),25931(T,P), 26731(T,P), 26821(T),26831(T,P), 26832(P), 28511(P) ', 'Electronics', NULL, 'Regular', NULL, '1791057721', '2024-01-13 04:00:29', '2024-01-13 04:00:29'),
(1072, 'YAMIN HOSSAIN', '628021', ' 1502183980', '21-22', '3rd', 'KPI', '1st', '3PT', ' 25912(T), 25913(T),25921(T), 25922(T), 25931(T),26731(T), 26821(T), 26831(T) ', 'Electronics', NULL, 'Regular', NULL, '1710627697', '2024-01-13 04:00:29', '2024-01-13 04:00:29'),
(1073, 'MD. RASEL HOSSAIN', '628033', ' 1502184644', '21-22', '3rd', 'KPI', '2nd', '3SUR', ' 25912(T), 25913(T),25922(T), 25931(T), 26731(T),26821(T), 26831(T) ', 'Electronics', NULL, 'Regular', NULL, '1406535485', '2024-01-13 04:00:29', '2024-01-13 04:00:29'),
(1936, 'MST. IMAMA SHEKH TULI', '188435', '1500991773', '21-22', '4th', 'KPI', '1st', '4CTA1', NULL, 'Civil', '2022', 'Regular', NULL, '364150', '2024-01-13 14:14:24', '2024-01-13 14:14:24'),
(1937, 'MD. JAHID BIN SABIT', '188437', '1500991771', '21-22', '4th', 'KPI', '1st', '4CTA1', NULL, 'Civil', '2022', 'Regular', NULL, '364147', '2024-01-13 14:14:24', '2024-01-13 14:14:24'),
(1938, 'MD. SAKIB ALI', '188438', '1500991770', '21-22', '4th', 'KPI', '1st', '4CTA1', NULL, 'Civil', '2022', 'Regular', NULL, '364146', '2024-01-13 14:14:24', '2024-01-13 14:14:24'),
(1939, 'SHUVO SHORKER', '188439', '1500991769', '21-22', '4th', 'KPI', '1st', '4CTA1', NULL, 'Civil', '2022', 'Regular', NULL, '364145', '2024-01-13 14:14:24', '2024-01-13 14:14:24'),
(1940, 'MST SURAIYA ISLAM', '188440', '1500991768', '21-22', '4th', 'KPI', '1st', '4CTA1', NULL, 'Civil', '2022', 'Regular', NULL, '364141', '2024-01-13 14:14:24', '2024-01-13 14:14:24'),
(1941, 'AYESHA KHANDOKAR UPOMA', '188442', '1500991766', '21-22', '4th', 'KPI', '1st', '4CTA1', NULL, 'Civil', '2022', 'Regular', NULL, '364142', '2024-01-13 14:14:24', '2024-01-13 14:14:24'),
(1942, 'MIR NASIR UDDIN', '627274', '1502233838', '21-22', '4th', 'KPI', '1st', '4CTA1', NULL, 'Civil', '2022', 'Regular', NULL, '1402313331', '2024-01-13 14:14:24', '2024-01-13 14:14:24'),
(1943, 'AFSIAR RAHMAN OVI', '627275', '1502183881', '21-22', '4th', 'KPI', '1st', '4CTA1', NULL, 'Civil', '2022', 'Regular', NULL, '1310958000', '2024-01-13 14:14:24', '2024-01-13 14:14:24'),
(1944, 'MARJIYA AKTER MOU', '627280', '1502183876', '21-22', '4th', 'KPI', '1st', '4CTA1', NULL, 'Civil', '2022', 'Regular', NULL, '1736677169', '2024-01-13 14:14:24', '2024-01-13 14:14:24'),
(1945, 'MD. RAZU AHMMED', '627283', '1502183873', '21-22', '4th', 'KPI', '1st', '4CTA1', NULL, 'Civil', '2022', 'Regular', NULL, '1846597805', '2024-01-13 14:14:24', '2024-01-13 14:14:24'),
(1946, 'MD KARIBUL BASHAR', '627284', '1502183872', '21-22', '4th', 'KPI', '1st', '4CTA1', NULL, 'Civil', '2022', 'Regular', NULL, '1885559935', '2024-01-13 14:14:24', '2024-01-13 14:14:24'),
(1947, 'SADIA YESMIN OISHE', '627287', '1502183870', '21-22', '4th', 'KPI', '1st', '4CTA1', NULL, 'Civil', '2022', 'Regular', NULL, '1648292598', '2024-01-13 14:14:24', '2024-01-13 14:14:24'),
(1948, 'MST NASRIN KHATUN', '627288', '1502183869', '21-22', '4th', 'KPI', '1st', '4CTA1', NULL, 'Civil', '2022', 'Regular', NULL, '1926277874', '2024-01-13 14:14:24', '2024-01-13 14:14:24'),
(1949, 'TAHSIN AHMED', '627289', '1502183868', '21-22', '4th', 'KPI', '1st', '4CTA1', NULL, 'Civil', '2022', 'Regular', NULL, '1735873119', '2024-01-13 14:14:24', '2024-01-13 14:14:24'),
(1950, 'MD SAYEDUL MURSALEN', '627290', '1502183867', '21-22', '4th', 'KPI', '1st', '4CTA1', NULL, 'Civil', '2022', 'Regular', NULL, '1724784548', '2024-01-13 14:14:24', '2024-01-13 14:14:24'),
(1951, 'MD. SHOHANUR RAHMAN SHISHIR', '627291', '1502183866', '21-22', '4th', 'KPI', '1st', '4CTA1', NULL, 'Civil', '2022', 'Regular', NULL, '1743606195', '2024-01-13 14:14:24', '2024-01-13 14:14:24'),
(1952, 'IFTEKHAR MAHMUD TANJIR', '627293', '1502183864', '21-22', '4th', 'KPI', '1st', '4CTA1', NULL, 'Civil', '2022', 'Regular', NULL, '1937724000', '2024-01-13 14:14:24', '2024-01-13 14:14:24'),
(1953, 'ANTOR RAHMAN', '627295', '1502183863', '21-22', '4th', 'KPI', '1st', '4CTA1', NULL, 'Civil', '2022', 'Regular', NULL, '1792988300', '2024-01-13 14:14:24', '2024-01-13 14:14:24'),
(1954, 'MITU', '627296', '1502183862', '21-22', '4th', 'KPI', '1st', '4CTA1', NULL, 'Civil', '2022', 'Regular', NULL, '1980264689', '2024-01-13 14:14:24', '2024-01-13 14:14:24'),
(1955, 'MST. SANJIDA KHATUN', '627300', '1502183858', '21-22', '4th', 'KPI', '1st', '4CTA1', NULL, 'Civil', '2022', 'Regular', NULL, '1728686566', '2024-01-13 14:14:24', '2024-01-13 14:14:24'),
(1956, 'MD. JIHAD ALI', '627301', '1502183857', '21-22', '4th', 'KPI', '1st', '4CTA1', NULL, 'Civil', '2022', 'Regular', NULL, '1403638378', '2024-01-13 14:14:24', '2024-01-13 14:14:24'),
(1957, 'MD SAGOR MONDOL', '627303', '1502183855', '21-22', '4th', 'KPI', '1st', '4CTA1', NULL, 'Civil', '2022', 'Regular', NULL, '1841416897', '2024-01-13 14:14:24', '2024-01-13 14:14:24'),
(1958, 'ARAF TASNIM', '627305', '1502183854', '21-22', '4th', 'KPI', '1st', '4CTA1', NULL, 'Civil', '2022', 'Regular', NULL, '1739848450', '2024-01-13 14:14:24', '2024-01-13 14:14:24'),
(1959, 'MD. ABU RAIHAN MUNNA', '627306', '1502183853', '21-22', '4th', 'KPI', '1st', '4CTA1', NULL, 'Civil', '2022', 'Regular', NULL, '1749653347', '2024-01-13 14:14:24', '2024-01-13 14:14:24'),
(1960, 'MISS.ANJUMANARA KHATUN BRISTY', '627312', '1502183851', '21-22', '4th', 'KPI', '1st', '4CTA1', NULL, 'Civil', '2022', 'Regular', NULL, '1744277483', '2024-01-13 14:14:24', '2024-01-13 14:14:24'),
(1961, 'RAJ SHETT', '627314', '1502183850', '21-22', '4th', 'KPI', '1st', '4CTA1', NULL, 'Civil', '2022', 'Regular', NULL, '1401451445', '2024-01-13 14:14:24', '2024-01-13 14:14:24'),
(1962, 'MD. AKASH', '627316', '1502183849', '21-22', '4th', 'KPI', '1st', '4CTA1', NULL, 'Civil', '2022', 'Regular', NULL, '1777179642', '2024-01-13 14:14:24', '2024-01-13 14:14:24'),
(1963, 'MD SAZID ISLAM', '627318', '1502183848', '21-22', '4th', 'KPI', '1st', '4CTA1', NULL, 'Civil', '2022', 'Regular', NULL, '1935496095', '2024-01-13 14:14:24', '2024-01-13 14:14:24'),
(1964, 'MD. ALI HOSSAIN ASHIK', '627321', '1502183847', '21-22', '4th', 'KPI', '1st', '4CTA1', NULL, 'Civil', '2022', 'Regular', NULL, '1907651308', '2024-01-13 14:14:24', '2024-01-13 14:14:24'),
(1965, 'SAGOR KUMAR', '627324', '1502183845', '21-22', '4th', 'KPI', '1st', '4CTA1', NULL, 'Civil', '2022', 'Regular', NULL, '1792576377', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(1966, 'MD. ANTOR ALI', '627325', '1502183844', '21-22', '4th', 'KPI', '1st', '4CTA1', NULL, 'Civil', '2022', 'Regular', NULL, '1784290119', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(1967, 'JOY PAUL', '627327', '1502183843', '21-22', '4th', 'KPI', '1st', '4CTA1', NULL, 'Civil', '2022', 'Regular', NULL, '1781148437', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(1968, 'SURAYA AKTER JUI', '627328', '1502183842', '21-22', '4th', 'KPI', '1st', '4CTA1', NULL, 'Civil', '2022', 'Regular', NULL, '1406128392', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(1969, 'SALAUDDIN AHMED', '627329', '1502183841', '21-22', '4th', 'KPI', '1st', '4CTA1', NULL, 'Civil', '2022', 'Regular', NULL, '1865429791', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(1970, 'MST. SUMAIYA KHATUN SOMA', '627331', '1502183840', '21-22', '4th', 'KPI', '1st', '4CTA1', NULL, 'Civil', '2022', 'Regular', NULL, '1845421323', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(1971, 'MD. EMRUL PARVEJ', '627332', '1502183839', '21-22', '4th', 'KPI', '1st', '4CTA1', NULL, 'Civil', '2022', 'Regular', NULL, '1401684250', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(1972, 'AFIA ARIFIN', '627335', '1502183838', '21-22', '4th', 'KPI', '1st', '4CTA1', NULL, 'Civil', '2022', 'Regular', NULL, '1714906989', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(1973, 'MST. JESMIN KHATUN', '627339', '1502183837', '21-22', '4th', 'KPI', '1st', '4CTA1', NULL, 'Civil', '2022', 'Regular', NULL, '1313236205', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(1974, 'MD. AMANULLAH HOSSEN', '627342', '1502183834', '21-22', '4th', 'KPI', '1st', '4CTA1', NULL, 'Civil', '2022', 'Regular', NULL, '1708904559', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(1975, 'MD. RAHAT SHEIKH', '631027', '1502185895', '2122', '4th', 'KPI', '1st', '4CTA1', NULL, 'Civil', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(1976, 'MD. SHAJAHAN BADSHA', '688804', '1502232377', '21-22', '4th', 'KPI', '1st', '4CTA1', NULL, 'Civil', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(1977, 'SHOWRAV KUMAR KARMAKAR', '188436', '1500991772', '21-22', '4th', 'KPI', '1st', '4CTB1', NULL, 'Civil', '2022', 'Regular', NULL, '364247', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(1978, 'MD. SAKIB AHMED ANTO', '190098', '1500993168', '21-22', '4th', 'KPI', '1st', '4CTB1', NULL, 'Civil', '2022', 'Regular', NULL, '1753192021', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(1979, 'ABU TALEB PRANTO', '627347', '1502183831', '21-22', '4th', 'KPI', '1st', '4CTB1', NULL, 'Civil', '2022', 'Regular', NULL, '1929599766', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(1980, 'MD.AL MAMUN', '627348', '1502183830', '21-22', '4th', 'KPI', '1st', '4CTB1', NULL, 'Civil', '2022', 'Regular', NULL, '1890190613', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(1981, 'MST. UMME SADIA', '627357', '1502183829', '21-22', '4th', 'KPI', '1st', '4CTB1', NULL, 'Civil', '2022', 'Regular', NULL, '1793820337', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(1982, 'MD RAKIB HASAN', '627360', '1502183827', '21-22', '4th', 'KPI', '1st', '4CTB1', NULL, 'Civil', '2022', 'Regular', NULL, '1706337805', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(1983, 'MD WAHID HASAN', '627362', '1502183825', '21-22', '4th', 'KPI', '1st', '4CTB1', NULL, 'Civil', '2022', 'Regular', NULL, '1306755865', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(1984, 'MST. NESHAT NOUSHIN DIBA', '627366', '1502183824', '21-22', '4th', 'KPI', '1st', '4CTB1', NULL, 'Civil', '2022', 'Regular', NULL, '1310468105', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(1985, 'MD. SHAHID HASSAN SHUVO', '627388', '1502183822', '21-22', '4th', 'KPI', '1st', '4CTB1', NULL, 'Civil', '2022', 'Regular', NULL, '1714749627', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(1986, 'SHEIKH SADI', '627398', '1502183820', '21-22', '4th', 'KPI', '1st', '4CTB1', NULL, 'Civil', '2022', 'Regular', NULL, '1704291544', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(1987, 'MD. JUNAYED SIDDQUE', '627402', '1502183819', '21-22', '4th', 'KPI', '1st', '4CTB1', NULL, 'Civil', '2022', 'Regular', NULL, '1979202701', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(1988, 'MD. SHAJADUL ISLAM SHOVON', '627403', '1502183818', '21-22', '4th', 'KPI', '1st', '4CTB1', NULL, 'Civil', '2022', 'Regular', NULL, '1836779453', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(1989, 'MD. MAHBUBUR RAHMAN', '627407', '1502183817', '21-22', '4th', 'KPI', '1st', '4CTB1', NULL, 'Civil', '2022', 'Regular', NULL, '1953244541', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(1990, 'MD NASIM', '627409', '1502183815', '21-22', '4th', 'KPI', '1st', '4CTB1', NULL, 'Civil', '2022', 'Regular', NULL, '1931831470', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(1991, 'JANNATUL', '627411', '1502183814', '21-22', '4th', 'KPI', '1st', '4CTB1', NULL, 'Civil', '2022', 'Regular', NULL, '1746939368', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(1992, 'SAHARA SARA', '627412', '1502183813', '21-22', '4th', 'KPI', '1st', '4CTB1', NULL, 'Civil', '2022', 'Regular', NULL, '1408953678', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(1993, 'KH. JAHID IQBAL SIAM', '627414', '1502183812', '21-22', '4th', 'KPI', '1st', '4CTB1', NULL, 'Civil', '2022', 'Regular', NULL, '1319450238', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(1994, 'MYSUN MALIHA KATHA', '627415', '1502183811', '21-22', '4th', 'KPI', '1st', '4CTB1', NULL, 'Civil', '2022', 'Regular', NULL, '1996319515', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(1995, 'ZINIA AKTAR ETY', '627417', '1502183810', '21-22', '4th', 'KPI', '1st', '4CTB1', NULL, 'Civil', '2022', 'Regular', NULL, '1320632941', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(1996, 'TAMANNA KHATUN', '627418', '1502183809', '21-22', '4th', 'KPI', '1st', '4CTB1', NULL, 'Civil', '2022', 'Regular', NULL, '1754097113', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(1997, 'MST. SURAIYA AKTER', '627425', '1502183808', '21-22', '4th', 'KPI', '1st', '4CTB1', NULL, 'Civil', '2022', 'Regular', NULL, '1845524557', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(1998, 'NAZMUN NAHAR', '627426', '1502183807', '21-22', '4th', 'KPI', '1st', '4CTB1', NULL, 'Civil', '2022', 'Regular', NULL, '1980784000', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(1999, 'MD. ARAFAT MUBIN', '627427', '1502183806', '21-22', '4th', 'KPI', '1st', '4CTB1', NULL, 'Civil', '2022', 'Regular', NULL, '1737310631', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(2000, 'MD. ABDUS SALAM', '627430', '1502183803', '21-22', '4th', 'KPI', '1st', '4CTB1', NULL, 'Civil', '2022', 'Regular', NULL, '1746696862', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(2001, 'S.M.ABIR MAHMUD', '627433', '1502183800', '21-22', '4th', 'KPI', '1st', '4CTB1', NULL, 'Civil', '2022', 'Regular', NULL, '1870977258', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(2002, 'MD. RAISUL ISLAM SHAWON', '627434', '1502183799', '21-22', '4th', 'KPI', '1st', '4CTB1', NULL, 'Civil', '2022', 'Regular', NULL, '1711978659', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(2003, 'MD. EMON HOSSAIN', '627435', '1502183798', '21-22', '4th', 'KPI', '1st', '4CTB1', NULL, 'Civil', '2022', 'Regular', NULL, '1776376902', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(2004, 'SADIA SULTANA MIMU', '627436', '1502183797', '21-22', '4th', 'KPI', '1st', '4CTB1', NULL, 'Civil', '2022', 'Regular', NULL, '1733887336', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(2005, 'MD. SHIHAB RANA', '627438', '1502183795', '21-22', '4th', 'KPI', '1st', '4CTB1', NULL, 'Civil', '2022', 'Regular', NULL, '1792779551', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(2006, 'SHOEB AHAMED SRABON', '627439', '1502183794', '21-22', '4th', 'KPI', '1st', '4CTB1', NULL, 'Civil', '2022', 'Regular', NULL, '1783228743', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(2007, 'RUHAN UDDIN', '627440', '1502183793', '21-22', '4th', 'KPI', '1st', '4CTB1', NULL, 'Civil', '2022', 'Regular', NULL, '1781584622', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(2008, 'MD. HIMEL HOSSAIN', '627441', '1502183792', '21-22', '4th', 'KPI', '1st', '4CTB1', NULL, 'Civil', '2022', 'Regular', NULL, '1645708640', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(2009, 'MD. MEHEDI HASAN JOY', '627442', '1502183791', '21-22', '4th', 'KPI', '1st', '4CTB1', NULL, 'Civil', '2022', 'Regular', NULL, '1972513713', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(2010, 'MAMUN ISLAM', '627443', '1502183790', '21-22', '4th', 'KPI', '1st', '4CTB1', NULL, 'Civil', '2022', 'Regular', NULL, '1310468572', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(2011, 'MD. ASHIKE SHEIKH', '627444', '1502183789', '21-22', '4th', 'KPI', '1st', '4CTB1', NULL, 'Civil', '2022', 'Regular', NULL, '1302848549', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(2012, 'MST. MARIA AKTHER MOW', '627445', '1502183788', '21-22', '4th', 'KPI', '1st', '4CTB1', NULL, 'Civil', '2022', 'Regular', NULL, '1709806042', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(2013, 'ANTOR MOLLAH', '627446', '1502183787', '21-22', '4th', 'KPI', '1st', '4CTB1', NULL, 'Civil', '2022', 'Regular', NULL, '1880780012', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(2014, 'MD. ABU HURAIRA', '627447', '1502183786', '21-22', '4th', 'KPI', '1st', '4CTB1', NULL, 'Civil', '2022', 'Regular', NULL, '1319761220', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(2015, 'ESTIAK AHMED', '627448', '1502183785', '21-22', '4th', 'KPI', '1st', '4CTB1', NULL, 'Civil', '2022', 'Regular', NULL, '1810801381', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(2016, 'IMRAN HOSSEN', '627449', '1502183784', '21-22', '4th', 'KPI', '1st', '4CTB1', NULL, 'Civil', '2022', 'Regular', NULL, '1872690578', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(2017, 'MD. TANVIR RAIHAN', '627450', '1502183783', '21-22', '4th', 'KPI', '1st', '4CTB1', NULL, 'Civil', '2022', 'Regular', NULL, '1888761088', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(2018, 'MD. SHOHAN ALI', '630956', '1502233908', '21-22', '4th', 'KPI', '1st', '4CTB1', NULL, 'Civil', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(2019, 'MST. MATI KHATUN', '631025', '1502185896', '21-22', '4th', 'KPI', '1st', '4CTB1', NULL, 'Civil', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(2020, 'RAFIT HASSAN RUDDRO', '631039', '1502186158', '21-22', '4th', 'KPI', '1st', '4CTB1', NULL, 'Civil', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(2021, 'MD RANA MIA', '529801', '1502163396', '20-21', '4th', 'KPI', '2nd', '4CTA2', NULL, 'Civil', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(2022, 'SAKIB RAHMAN  EMON', '529958', '1502106457', '20-21', '4th', 'KPI', '2nd', '4CTA2', NULL, 'Civil', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(2023, 'MD. HAFIZ ALL ASAD', '530014', '1502106401', '20-21', '4th', 'KPI', '2nd', '4CTA2', NULL, 'Civil', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(2024, 'JOYANTO AKRAM NILOY', '627452', '1502184457', '21-22', '4th', 'KPI', '2nd', '4CTA2', NULL, 'Civil', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(2025, 'MD. MOMIN ISLAM', '627453', '1502184456', '21-22', '4th', 'KPI', '2nd', '4CTA2', NULL, 'Civil', '2022', 'Regular', NULL, '1770091419', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(2026, 'MAHABUB HASSAN MAHIM', '627454', '1502184455', '21-22', '4th', 'KPI', '2nd', '4CTA2', NULL, 'Civil', '2022', 'Regular', NULL, '1735600986', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(2027, 'MD.LITON AHMED', '627456', '1502184454', '21-22', '4th', 'KPI', '2nd', '4CTA2', NULL, 'Civil', '2022', 'Regular', NULL, '1780394843', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(2028, 'MD. RAKIB HASAN ZAHID', '627457', '1502184453', '21-22', '4th', 'KPI', '2nd', '4CTA2', NULL, 'Civil', '2022', 'Regular', NULL, '1758174414', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(2029, 'MD. ALI AKRAM NILOY CHOUDHURY', '627461', '1502184450', '21-22', '4th', 'KPI', '2nd', '4CTA2', NULL, 'Civil', '2022', 'Regular', NULL, '1919100165', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(2030, 'MD. BIPUL MIA', '627462', '1502184449', '21-22', '4th', 'KPI', '2nd', '4CTA2', NULL, 'Civil', '2022', 'Regular', NULL, '1927170726', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(2031, 'MD. ALIF HASSAN NISHAT', '627464', '1502184448', '21-22', '4th', 'KPI', '2nd', '4CTA2', NULL, 'Civil', '2022', 'Regular', NULL, '1318366703', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(2032, 'MD. ASRAFUL AHAD', '627465', '1502184447', '21-22', '4th', 'KPI', '2nd', '4CTA2', NULL, 'Civil', '2022', 'Regular', NULL, '1403557036', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(2033, 'SHAKIL AHMED SAYKOT', '627467', '1502184445', '21-22', '4th', 'KPI', '2nd', '4CTA2', NULL, 'Civil', '2022', 'Regular', NULL, '1737387431', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(2034, 'MD. ROFIQUL ISLAM RATUL', '627468', '1502184444', '21-22', '4th', 'KPI', '2nd', '4CTA2', NULL, 'Civil', '2022', 'Regular', NULL, '1921467889', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(2035, 'MD. SOJIB HOSSAIN', '627469', '1502184443', '21-22', '4th', 'KPI', '2nd', '4CTA2', NULL, 'Civil', '2022', 'Regular', NULL, '1930299973', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(2036, 'MST. LAILA KHATUN', '627470', '1502184442', '21-22', '4th', 'KPI', '2nd', '4CTA2', NULL, 'Civil', '2022', 'Regular', NULL, '1814548532', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(2037, 'SURAIYA SULTANA', '627474', '1502184440', '21-22', '4th', 'KPI', '2nd', '4CTA2', NULL, 'Civil', '2022', 'Regular', NULL, '1310474102', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(2038, 'MD. JEHAD', '627475', '1502184439', '21-22', '4th', 'KPI', '2nd', '4CTA2', NULL, 'Civil', '2022', 'Regular', NULL, '1781210929', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(2039, 'MD. AROZ MAHAMUD', '627476', '1502184438', '21-22', '4th', 'KPI', '2nd', '4CTA2', NULL, 'Civil', '2022', 'Regular', NULL, '1681277179', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(2040, 'SREE SOJIB KUMAR', '627477', '1502184437', '21-22', '4th', 'KPI', '2nd', '4CTA2', NULL, 'Civil', '2022', 'Regular', NULL, '1788857221', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(2041, 'MD. MONIR HOSSAIN', '627478', '1502184436', '21-22', '4th', 'KPI', '2nd', '4CTA2', NULL, 'Civil', '2022', 'Regular', NULL, '1829806295', '2024-01-13 14:14:25', '2024-01-13 14:14:25'),
(2042, 'ABIR AHAMMED ONTOR', '627482', '1502184434', '21-22', '4th', 'KPI', '2nd', '4CTA2', NULL, 'Civil', '2022', 'Regular', NULL, '1742525454', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2043, 'MST.SUMAIYA AKHTER NODI', '627483', '1502184433', '21-22', '4th', 'KPI', '2nd', '4CTA2', NULL, 'Civil', '2022', 'Regular', NULL, '1746014658', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2044, 'MD. JISHAN ISLAM JIBON', '627484', '1502184432', '21-22', '4th', 'KPI', '2nd', '4CTA2', NULL, 'Civil', '2022', 'Regular', NULL, '1751757916', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2045, 'MD. ADNAN SAMI', '627485', '1502184431', '21-22', '4th', 'KPI', '2nd', '4CTA2', NULL, 'Civil', '2022', 'Regular', NULL, '1721506512', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2046, 'MARUF AHMED SHAJOL', '627486', '1502184430', '21-22', '4th', 'KPI', '2nd', '4CTA2', NULL, 'Civil', '2022', 'Regular', NULL, '1859498593', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2047, 'SHISHIR AHMMED', '627489', '1502184429', '21-22', '4th', 'KPI', '2nd', '4CTA2', NULL, 'Civil', '2022', 'Regular', NULL, '1310467683', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2048, 'ANTOR ADHIKARY', '627491', '1502184428', '21-22', '4th', 'KPI', '2nd', '4CTA2', NULL, 'Civil', '2022', 'Regular', NULL, '1409565053', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2049, 'ARIF', '627492', '1502184427', '21-22', '4th', 'KPI', '2nd', '4CTA2', NULL, 'Civil', '2022', 'Regular', NULL, '1778732702', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2050, 'MD. RAHUL DRABIR', '627493', '1502184426', '21-22', '4th', 'KPI', '2nd', '4CTA2', NULL, 'Civil', '2022', 'Regular', NULL, '1408699153', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2051, 'MST. AKHI AKTER', '627495', '1502184425', '21-22', '4th', 'KPI', '2nd', '4CTA2', NULL, 'Civil', '2022', 'Regular', NULL, '1311748864', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2052, 'ABDULLAH ARHAM', '627500', '1502184422', '21-22', '4th', 'KPI', '2nd', '4CTA2', NULL, 'Civil', '2022', 'Regular', NULL, '1795302537', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2053, 'MD. SHAKIL HOSSEN', '627502', '1502184420', '21-22', '4th', 'KPI', '2nd', '4CTA2', NULL, 'Civil', '2022', 'Regular', NULL, '1706861077', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2054, 'RIFAT RAHMAN LIMON', '627503', '1502184419', '21-22', '4th', 'KPI', '2nd', '4CTA2', NULL, 'Civil', '2022', 'Regular', NULL, '1733640755', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2055, 'MD. NAHIDUL ISLAM', '627505', '1502184418', '21-22', '4th', 'KPI', '2nd', '4CTA2', NULL, 'Civil', '2022', 'Regular', NULL, '1743808789', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2056, 'MD. NOBAB ALI', '627506', '1502184417', '21-22', '4th', 'KPI', '2nd', '4CTA2', NULL, 'Civil', '2022', 'Regular', NULL, '1319457607', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2057, 'SOZIB HOSSAIN', '627507', '1502184416', '21-22', '4th', 'KPI', '2nd', '4CTA2', NULL, 'Civil', '2022', 'Regular', NULL, '1753357912', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2058, 'MD. MUIS SHAWON', '627508', '1502184415', '21-22', '4th', 'KPI', '2nd', '4CTA2', NULL, 'Civil', '2022', 'Regular', NULL, '1311388404', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2059, 'MD. MASHRAFE MESHRA', '627509', '1502184414', '21-22', '4th', 'KPI', '2nd', '4CTA2', NULL, 'Civil', '2022', 'Regular', NULL, '1825697747', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2060, 'MD. ABDUR RAHMAN', '627510', '1502184413', '21-22', '4th', 'KPI', '2nd', '4CTA2', NULL, 'Civil', '2022', 'Regular', NULL, '1716803728', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2061, 'MD. ABU SAYEED', '627512', '1502184412', '21-22', '4th', 'KPI', '2nd', '4CTA2', NULL, 'Civil', '2022', 'Regular', NULL, '1999620999', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2062, 'MD. SIZAN SAHARIA OMI', '627513', '1502184411', '21-22', '4th', 'KPI', '2nd', '4CTA2', NULL, 'Civil', '2022', 'Regular', NULL, '1874328606', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2063, 'RAHUL AMIN RAFI', '627514', '1502184410', '21-22', '4th', 'KPI', '2nd', '4CTA2', NULL, 'Civil', '2022', 'Regular', NULL, '1405453691', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2064, 'MD. APON HOSSEN', '627516', '1502184409', '21-22', '4th', 'KPI', '2nd', '4CTA2', NULL, 'Civil', '2022', 'Regular', NULL, '1884447330', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2065, 'MD. FAHIM SARKAR', '631065', '1502186138', '21-22', '4th', 'KPI', '2ND', '4CTA2', NULL, 'Civil', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2066, 'MD. AHAD ALI', '631067', '1502186136', '2122', '4th', 'KPI', '2nd', '4CTA2', NULL, 'Civil', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2067, 'MD SABBIR HOSSAIN', '638848', '1502192901', '21-22', '4th', 'KPI', '2nd', '4CTA2', NULL, 'Civil', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2068, 'MD RUBEL ALI', '639652', '1502193499', '21-22', '4th', 'KPI', '2nd', '4CTA2', NULL, 'Civil', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2069, 'MD. MANIK SHEIKH', '678433', '1502223384', '21-22', '4th', 'KPI', '2nd', '4CTA2', NULL, 'Civil', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2070, 'SUMAIYA AKTER MIMI', '627517', '1502184408', '21-22', '4th', 'KPI', '2nd', '4CTB2', NULL, 'Civil', '2022', 'Regular', NULL, '1709692969', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2071, 'MD. KHALID HASAN', '627518', '1502184407', '21-22', '4th', 'KPI', '2nd', '4CTB2', NULL, 'Civil', '2022', 'Regular', NULL, '1710270384', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2072, 'MST. SWEETY KHATUN', '627520', '1502184406', '21-22', '4th', 'KPI', '2nd', '4CTB2', NULL, 'Civil', '2022', 'Regular', NULL, '1301252406', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2073, 'IMRAN HOSSAIN', '627525', '1502184404', '21-22', '4th', 'KPI', '2nd', '4CTB2', NULL, 'Civil', '2022', 'Regular', NULL, '1793292223', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2074, 'MD. RAIHAN', '627526', '1502184403', '21-22', '4th', 'KPI', '2nd', '4CTB2', NULL, 'Civil', '2022', 'Regular', NULL, '1320823356', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2075, 'MD. RUBAYET KHAN RUDRO', '627527', '1502184402', '21-22', '4th', 'KPI', '2nd', '4CTB2', NULL, 'Civil', '2022', 'Regular', NULL, '1701333059', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2076, 'SOHEL RANA', '627534', '1502184401', '21-22', '4th', 'KPI', '2nd', '4CTB2', NULL, 'Civil', '2022', 'Regular', NULL, '1878828997', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2077, 'ABDULLAH BIN HANIF', '627535', '1502184400', '21-22', '4th', 'KPI', '2nd', '4CTB2', NULL, 'Civil', '2022', 'Regular', NULL, '1912843970', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2078, 'MST. SADIA IMROJ MIM', '627536', '1502184399', '21-22', '4th', 'KPI', '2nd', '4CTB2', NULL, 'Civil', '2022', 'Regular', NULL, '1305737696', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2079, 'MD. SAHIN SHAHA', '627538', '1502184398', '21-22', '4th', 'KPI', '2nd', '4CTB2', NULL, 'Civil', '2022', 'Regular', NULL, '1774123481', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2080, 'MST. MONIRA KHATUN', '627539', '1502184397', '21-22', '4th', 'KPI', '2nd', '4CTB2', NULL, 'Civil', '2022', 'Regular', NULL, '1403557385', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2081, 'MD. TASMIM HASAN ONY', '627542', '1502184394', '21-22', '4th', 'KPI', '2nd', '4CTB2', NULL, 'Civil', '2022', 'Regular', NULL, '1829662327', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2082, 'ORTHY LIMA', '627543', '1502184393', '21-22', '4th', 'KPI', '2nd', '4CTB2', NULL, 'Civil', '2022', 'Regular', NULL, '1718623720', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2083, 'MD.ANIK HASSAIN', '627544', '1502184392', '21-22', '4th', 'KPI', '2nd', '4CTB2', NULL, 'Civil', '2022', 'Regular', NULL, '1756814192', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2084, 'MD. MUSHFIQUR RAHMAN', '627547', '1502184389', '21-22', '4th', 'KPI', '2nd', '4CTB2', NULL, 'Civil', '2022', 'Regular', NULL, '1710745249', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2085, 'MD. NAZMUL HOSSEN', '627549', '1502184388', '21-22', '4th', 'KPI', '2nd', '4CTB2', NULL, 'Civil', '2022', 'Regular', NULL, '1753777185', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2086, 'TONMOY AHAMMED', '627550', '1502184387', '21-22', '4th', 'KPI', '2nd', '4CTB2', NULL, 'Civil', '2022', 'Regular', NULL, '1864934377', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2087, 'MD. EMON ALI', '627551', '1502184386', '21-22', '4th', 'KPI', '2nd', '4CTB2', NULL, 'Civil', '2022', 'Regular', NULL, '1940979878', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2088, 'SAIFULLAH API', '627552', '1502184385', '21-22', '4th', 'KPI', '2nd', '4CTB2', NULL, 'Civil', '2022', 'Regular', NULL, '1310459338', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2089, 'K.M. AFIFUZZAMAN', '627553', '1502184384', '21-22', '4th', 'KPI', '2nd', '4CTB2', NULL, 'Civil', '2022', 'Regular', NULL, '1713924751', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2090, 'MD. NAFIZ KHAN', '627554', '1502184383', '21-22', '4th', 'KPI', '2nd', '4CTB2', NULL, 'Civil', '2022', 'Regular', NULL, '1704744596', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2091, 'MD. FAISAL HASAN SIAM', '627556', '1502184381', '21-22', '4th', 'KPI', '2nd', '4CTB2', NULL, 'Civil', '2022', 'Regular', NULL, '1737040421', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2092, 'SUMAIA SADIA CHANDNI', '627558', '1502184379', '21-22', '4th', 'KPI', '2nd', '4CTB2', NULL, 'Civil', '2022', 'Regular', NULL, '1777323945', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2093, 'TAMANNA KHATUN', '627559', '1502184378', '21-22', '4th', 'KPI', '2nd', '4CTB2', NULL, 'Civil', '2022', 'Regular', NULL, '1301062317', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2094, 'MST. RUKAIYA NOWRIN SHREYOSHI', '627560', '1502184377', '21-22', '4th', 'KPI', '2nd', '4CTB2', NULL, 'Civil', '2022', 'Regular', NULL, '1758330400', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2095, 'MD.ASIF IKBAL', '627561', '1502184376', '21-22', '4th', 'KPI', '2nd', '4CTB2', NULL, 'Civil', '2022', 'Regular', NULL, '1701812713', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2096, 'MD. ASRAFUL ISLAM', '627565', '1502184373', '21-22', '4th', 'KPI', '2nd', '4CTB2', NULL, 'Civil', '2022', 'Regular', NULL, '1319695848', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2097, 'MD. MUZAHIDUL ISLAM', '627566', '1502184372', '21-22', '4th', 'KPI', '2nd', '4CTB2', NULL, 'Civil', '2022', 'Regular', NULL, '1770624168', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2098, 'MD. SANBIN JAMAN PRANTO', '627568', '1502184371', '21-22', '4th', 'KPI', '2nd', '4CTB2', NULL, 'Civil', '2022', 'Regular', NULL, '1869920529', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2099, 'MD.SAIEDUR RAHMAN SAIED', '627571', '1502184370', '21-22', '4th', 'KPI', '2nd', '4CTB2', NULL, 'Civil', '2022', 'Regular', NULL, '1774092482', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2100, 'MD.SIYAM AHMMED EMON', '627572', '1502184369', '21-22', '4th', 'KPI', '2nd', '4CTB2', NULL, 'Civil', '2022', 'Regular', NULL, '1793503009', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2101, 'AZMI SHARIFA', '627573', '1502184368', '21-22', '4th', 'KPI', '2nd', '4CTB2', NULL, 'Civil', '2022', 'Regular', NULL, '1776505671', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2102, 'MD. MAHER FOYSAL ABEER', '627575', '1502184367', '21-22', '4th', 'KPI', '2nd', '4CTB2', NULL, 'Civil', '2022', 'Regular', NULL, '1312984505', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2103, 'UPOMA BISWAS', '627576', '1502184366', '21-22', '4th', 'KPI', '2nd', '4CTB2', NULL, 'Civil', '2022', 'Regular', NULL, '1756887267', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2104, 'MD RABBY HASAN', '627577', '1502184365', '21-22', '4th', 'KPI', '2nd', '4CTB2', NULL, 'Civil', '2022', 'Regular', NULL, '1781581594', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2105, 'JANNATUN NAIM', '627578', '1502184364', '21-22', '4th', 'KPI', '2nd', '4CTB2', NULL, 'Civil', '2022', 'Regular', NULL, '1782072093', '2024-01-13 14:14:26', '2024-01-13 14:14:26'),
(2106, 'MD. JAFOR IKBAL', '627579', '1502184363', '21-22', '4th', 'KPI', '2nd', '4CTB2', NULL, 'Civil', '2022', 'Regular', NULL, '1823154075', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2107, 'MD. RUMON ISLAM JONY', '627580', '1502184362', '21-22', '4th', 'KPI', '2nd', '4CTB2', NULL, 'Civil', '2022', 'Regular', NULL, '1714592582', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2108, 'MD MARUF HOSSAIN', '627581', '1502184361', '21-22', '4th', 'KPI', '2nd', '4CTB2', NULL, 'Civil', '2022', 'Regular', NULL, '1798118180', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2109, 'MD. FOYSAL BADSHA', '627583', '1502184360', '21-22', '4th', 'KPI', '2nd', '4CTB2', NULL, 'Civil', '2022', 'Regular', NULL, '1823807455', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2110, 'SAKIB HASAN RAJIB', '631052', '1502186149', '21-22', '4th', 'KPI', '2nd', '4CTB2', NULL, 'Civil', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2111, 'MD. NAWSHER ALAM MRIDUL', '631073', '1502186130', '21-22', '4th', 'KPI', '2nd', '4CTB2', NULL, 'Civil', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2112, 'IKHTIAR ISLAM ARPON', '631078', '1502186126', '21-22', '4th', 'KPI', '2nd', '4CTB2', NULL, 'Civil', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2113, 'MD. SAZZAD AHMED', '631090', '1502186118', '21-22', '4th', 'KPI', '2nd', '4CTB2', NULL, 'Civil', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2114, 'MD ZAHID HOSSAIN', '633607', '1502188334', '21-22', '4th', 'KPI', '2nd', '4CTB2', NULL, 'Civil', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2115, 'ANIK KUMAR MOLLICK', '635274', '1502189560', '21-22', '4th', 'KPI', '2nd', '4CTB2', NULL, 'Civil', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2116, 'MD. REZOWAN ISLAM', '641034', '1502194297', '21-22', '4th', 'KPI', '2nd', '4CTB2', NULL, 'Civil', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2117, 'SAIFUL ISLAM EMON', '641055', '1502194286', '21-22', '4th', 'KPI', '2nd', '4CTB2', NULL, 'Civil', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2118, 'MD. SOHAN ALI', '689399', '1502236223', '21-22', '4th', 'KPI', '2nd', '4CTB2', NULL, 'Civil', '2022', 'Regular', NULL, '1633132525', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2119, 'MD. ROHAN PARVEG', '188456', '1500991795', '21-22', '4th', 'KPI', '1st', '4CMTA1', NULL, 'Computer', '2022', 'Regular', NULL, '385145', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2120, 'MD. NAFIUL ISLAM ZISHAN', '188457', '1500991794', '21-22', '4th', 'KPI', '1st', '4CMTA1', NULL, 'Computer', '2022', 'Regular', NULL, '385144', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2121, 'BEPUL HOSEN', '188460', '1500991791', '21-22', '4th', 'KPI', '1st', '4CMTA1', NULL, 'Computer', '2022', 'Regular', NULL, '385148', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2122, 'MD. RAKIBUL JAMAN', '188461', '1500991790', '21-22', '4th', 'KPI', '1st', '4CMTA1', NULL, 'Computer', '2022', 'Regular', NULL, '385142', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2123, 'MD. MOSNABI', '188462', '1500991789', '21-22', '4th', 'KPI', '1st', '4CMTA1', NULL, 'Computer', '2022', 'Regular', NULL, '385143', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2124, 'MD SANTO ISLAM', '190103', '1500993173', '21-22', '4th', 'KPI', '1st', '4CMTA1', NULL, 'Computer', '2022', 'Regular', NULL, '1874922138', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2125, 'MST. NAZMIN NAHAR', '533032', '1502105646', '2021', '4th', 'KPI', '1st', '4CMTA1', NULL, 'Computer', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2126, 'RITU PORNA', '628802', ' 1502184357', '21-22', '4th', 'KPI', '1st', '4CMTA1', NULL, 'Computer', '2022', 'Regular', NULL, '1302762622', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2127, 'MD. MARUF HOSSAIN', '628804', ' 1502184356', '21-22', '4th', 'KPI', '1st', '4CMTA1', NULL, 'Computer', '2022', 'Regular', NULL, '1877327186', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2128, 'MST. ASMA AKTER BRISTY', '628806', ' 1502184354', '21-22', '4th', 'KPI', '1st', '4CMTA1', NULL, 'Computer', '2022', 'Regular', NULL, '1762214515', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2129, 'MD. SHAZID HASAN', '628808', ' 1502184352', '21-22', '4th', 'KPI', '1st', '4CMTA1', NULL, 'Computer', '2022', 'Regular', NULL, '1715684715', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2130, 'MST. MIM KHATUN', '628809', ' 1502184351', '21-22', '4th', 'KPI', '1st', '4CMTA1', NULL, 'Computer', '2022', 'Regular', NULL, '1767074826', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2131, 'MD. MAHMUD SHAH', '628813', ' 1502184347', '21-22', '4th', 'KPI', '1st', '4CMTA1', NULL, 'Computer', '2022', 'Regular', NULL, '1314236722', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2132, 'MST. SUMAIYA KHATUN', '628827', ' 1502184341', '21-22', '4th', 'KPI', '1st', '4CMTA1', NULL, 'Computer', '2022', 'Regular', NULL, '1725790320', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2133, 'MD. RATUL AHAMED', '628840', ' 1502184338', '21-22', '4th', 'KPI', '1st', '4CMTA1', NULL, 'Computer', '2022', 'Regular', NULL, '1568001433', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2134, 'ONTOR ALI', '628847', ' 1502184337', '21-22', '4th', 'KPI', '1st', '4CMTA1', NULL, 'Computer', '2022', 'Regular', NULL, '1315446849', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2135, 'MD. ABDUL MOMIN MARUF', '628851', ' 1502184335', '21-22', '4th', 'KPI', '1st', '4CMTA1', NULL, 'Computer', '2022', 'Regular', NULL, '1998287625', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2136, 'MD. SHAKIL HOSSAIN', '628858', ' 1502184332', '21-22', '4th', 'KPI', '1st', '4CMTA1', NULL, 'Computer', '2022', 'Regular', NULL, '1744486869', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2137, 'MD. NAHID ALI', '628866', ' 1502184331', '21-22', '4th', 'KPI', '1st', '4CMTA1', NULL, 'Computer', '2022', 'Regular', NULL, '1405523531', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2138, 'MIME AKTAR ESHA', '628873', ' 1502184327', '21-22', '4th', 'KPI', '1st', '4CMTA1', NULL, 'Computer', '2022', 'Regular', NULL, '1734465622', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2139, 'MST.MIM', '628880', ' 1502184324', '21-22', '4th', 'KPI', '1st', '4CMTA1', NULL, 'Computer', '2022', 'Regular', NULL, '1936923599', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2140, 'SHOWROV BISHNU', '628891', ' 1502184321', '21-22', '4th', 'KPI', '1st', '4CMTA1', NULL, 'Computer', '2022', 'Regular', NULL, '1932117216', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2141, 'MST. SHINTHIEA SHARMIN SHITHI', '628893', ' 1502184320', '21-22', '4th', 'KPI', '1st', '4CMTA1', NULL, 'Computer', '2022', 'Regular', NULL, '1766980672', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2142, 'MD. FAHIM ABEEDIN', '628896', ' 1502184319', '21-22', '4th', 'KPI', '1st', '4CMTA1', NULL, 'Computer', '2022', 'Regular', NULL, '1749353268', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2143, 'MST. SHAILA', '628903', ' 1502184317', '21-22', '4th', 'KPI', '1st', '4CMTA1', NULL, 'Computer', '2022', 'Regular', NULL, '1320472324', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2144, 'RIFA TASFIA', '628904', ' 1502184316', '21-22', '4th', 'KPI', '1st', '4CMTA1', NULL, 'Computer', '2022', 'Regular', NULL, '1879356208', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2145, 'MD. RONY HOSSAIN', '628906', ' 1502184314', '21-22', '4th', 'KPI', '1st', '4CMTA1', NULL, 'Computer', '2022', 'Regular', NULL, '1756739304', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2146, 'MST. LUBNA AKTER', '628908', ' 1502184313', '21-22', '4th', 'KPI', '1st', '4CMTA1', NULL, 'Computer', '2022', 'Regular', NULL, '1701676422', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2147, 'MST. LIMA AFRIN MAOYA', '631389', '1502186067', '21-22', '4th', 'KPI', '1st', '4CMTA1', NULL, 'Computer', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:27', '2024-01-13 14:14:27');
INSERT INTO `exam_students` (`id`, `name`, `roll`, `reg_no`, `session`, `semester`, `institute`, `shift`, `student_group`, `ref_subject`, `technology`, `probidhan`, `status`, `remarks`, `mobile`, `created_at`, `updated_at`) VALUES
(2148, 'MD. FAHIM', '530101', '1502105930', '20-21', '4th', 'KPI', '1st', '4CMTB1', NULL, 'Computer', '2022', 'Regular', NULL, 'Connection', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2149, 'TANVIR HOSSAIN CHOWDHURY', '628911', ' 1502184311', '21-22', '4th', 'KPI', '1st', '4CMTB1', NULL, 'Computer', '2022', 'Regular', NULL, '1942620910', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2150, 'MD. RANAK HOSSAIN', '628912', ' 1502184310', '21-22', '4th', 'KPI', '1st', '4CMTB1', NULL, 'Computer', '2022', 'Regular', NULL, '1749650161', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2151, 'MD. SAZID CHOWDHURY', '628915', ' 1502184308', '21-22', '4th', 'KPI', '1st', '4CMTB1', NULL, 'Computer', '2022', 'Regular', NULL, '1778752306', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2152, 'MUSHFIKA MEHRIB MITH', '628916', ' 1502184307', '21-22', '4th', 'KPI', '1st', '4CMTB1', NULL, 'Computer', '2022', 'Regular', NULL, '1733485011', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2153, 'GOUROB MONDOL', '628917', ' 1502184306', '21-22', '4th', 'KPI', '1st', '4CMTB1', NULL, 'Computer', '2022', 'Regular', NULL, '1796418076', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2154, 'MD. RAFIUL ISLAM', '628920', ' 1502184305', '21-22', '4th', 'KPI', '1st', '4CMTB1', NULL, 'Computer', '2022', 'Regular', NULL, '1319574204', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2155, 'SOJOL AHMED', '628923', ' 1502184303', '21-22', '4th', 'KPI', '1st', '4CMTB1', NULL, 'Computer', '2022', 'Regular', NULL, '1405375092', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2156, 'MISS. MASUDA RAHMAN MEGHLA', '628925', ' 1502184302', '21-22', '4th', 'KPI', '1st', '4CMTB1', NULL, 'Computer', '2022', 'Regular', NULL, '1710118558', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2157, 'MST. SHIRABONI AKTER', '628926', ' 1502184301', '21-22', '4th', 'KPI', '1st', '4CMTB1', NULL, 'Computer', '2022', 'Regular', NULL, '1883487033', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2158, 'RAFSAN AHMED AKASH', '628936', ' 1502184298', '21-22', '4th', 'KPI', '1st', '4CMTB1', NULL, 'Computer', '2022', 'Regular', NULL, '1765061105', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2159, 'MST. JANNATUL MAWA', '628938', ' 1502184297', '21-22', '4th', 'KPI', '1st', '4CMTB1', NULL, 'Computer', '2022', 'Regular', NULL, '1730648839', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2160, 'BINITA BISWAS', '628944', ' 1502184296', '21-22', '4th', 'KPI', '1st', '4CMTB1', NULL, 'Computer', '2022', 'Regular', NULL, '1726033446', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2161, 'MD. AL AMIN PARVAJE', '628945', ' 1502184295', '21-22', '4th', 'KPI', '1st', '4CMTB1', NULL, 'Computer', '2022', 'Regular', NULL, '1795973741', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2162, 'MST. MARIA JAHAN MIM', '628947', ' 1502184294', '21-22', '4th', 'KPI', '1st', '4CMTB1', NULL, 'Computer', '2022', 'Regular', NULL, '1924401827', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2163, 'MD. HIMEL HOSSAIN', '628948', ' 1502184293', '21-22', '4th', 'KPI', '1st', '4CMTB1', NULL, 'Computer', '2022', 'Regular', NULL, '1942808708', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2164, 'RUBAIYA ZANNAT RAHA', '628950', ' 1502184292', '21-22', '4th', 'KPI', '1st', '4CMTB1', NULL, 'Computer', '2022', 'Regular', NULL, '1710746181', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2165, 'MD JANNATUL FERDOS KHOKA', '628954', ' 1502184290', '21-22', '4th', 'KPI', '1st', '4CMTB1', NULL, 'Computer', '2022', 'Regular', NULL, '1861947240', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2166, 'NASIF BIN BORHAN', '628958', ' 1502184288', '21-22', '4th', 'KPI', '1st', '4CMTB1', NULL, 'Computer', '2022', 'Regular', NULL, '1713798334', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2167, 'MD. ALAMIN HOSSAIN TAMIM', '628959', ' 1502184287', '21-22', '4th', 'KPI', '1st', '4CMTB1', NULL, 'Computer', '2022', 'Regular', NULL, '1627030411', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2168, 'ISHRAT ISLAM', '628960', ' 1502184286', '21-22', '4th', 'KPI', '1st', '4CMTB1', NULL, 'Computer', '2022', 'Regular', NULL, '1763173899', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2169, 'UMMAY KASHFI TONU', '628962', ' 1502184284', '21-22', '4th', 'KPI', '1st', '4CMTB1', NULL, 'Computer', '2022', 'Regular', NULL, '1972018468', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2170, 'MD.SAFAYAT ISLAM', '628963', ' 1502184283', '21-22', '4th', 'KPI', '1st', '4CMTB1', NULL, 'Computer', '2022', 'Regular', NULL, '1882671508', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2171, 'MD. SANY AMIN', '628965', ' 1502184282', '21-22', '4th', 'KPI', '1st', '4CMTB1', NULL, 'Computer', '2022', 'Regular', NULL, '1903612509', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2172, 'TANZIDA AKTER TINNY', '628966', ' 1502184281', '21-22', '4th', 'KPI', '1st', '4CMTB1', NULL, 'Computer', '2022', 'Regular', NULL, '1767967562', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2173, 'MD. IBRAHIM MESHAL', '628967', ' 1502184280', '21-22', '4th', 'KPI', '1st', '4CMTB1', NULL, 'Computer', '2022', 'Regular', NULL, '1752194403', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2174, 'SAYDA SULTANA MISHU', '628968', ' 1502184279', '21-22', '4th', 'KPI', '1st', '4CMTB1', NULL, 'Computer', '2022', 'Regular', NULL, '1773950612', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2175, 'MD NAFIUR RAHMAN NAFIZ', '628970', ' 1502184278', '21-22', '4th', 'KPI', '1st', '4CMTB1', NULL, 'Computer', '2022', 'Regular', NULL, '1306337680', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2176, 'MD. LIKHON ISLAM', '628971', ' 1502184277', '21-22', '4th', 'KPI', '1st', '4CMTB1', NULL, 'Computer', '2022', 'Regular', NULL, '1611513484', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2177, 'ALIM AL RAZI NIHAD', '628972', ' 1502184276', '21-22', '4th', 'KPI', '1st', '4CMTB1', NULL, 'Computer', '2022', 'Regular', NULL, '1787078724', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2178, 'MD. MUKUL JOADDER', '628973', ' 1502184275', '21-22', '4th', 'KPI', '1st', '4CMTB1', NULL, 'Computer', '2022', 'Regular', NULL, '1752041569', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2179, 'MD. TASNIMUL HAQUE MARUF', '628974', ' 1502184274', '21-22', '4th', 'KPI', '1st', '4CMTB1', NULL, 'Computer', '2022', 'Regular', NULL, '1302968591', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2180, 'ASIB HASAN', '628975', ' 1502184273', '21-22', '4th', 'KPI', '1st', '4CMTB1', NULL, 'Computer', '2022', 'Regular', NULL, '1760121458', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2181, 'AKIB BIN SOHEL', '628976', ' 1502184272', '21-22', '4th', 'KPI', '1st', '4CMTB1', NULL, 'Computer', '2022', 'Regular', NULL, '1733309899', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2182, 'MST. NAZIA FARHA ZIDNI', '628977', ' 1502184271', '21-22', '4th', 'KPI', '1st', '4CMTB1', NULL, 'Computer', '2022', 'Regular', NULL, '1737026972', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2183, 'MD. RUHUL AMIN', '628980', ' 1502184270', '21-22', '4th', 'KPI', '1st', '4CMTB1', NULL, 'Computer', '2022', 'Regular', NULL, '1710301411', '2024-01-13 14:14:27', '2024-01-13 14:14:27'),
(2184, 'MST. ANIKA TASNIM', '628982', ' 1502184269', '21-22', '4th', 'KPI', '1st', '4CMTB1', NULL, 'Computer', '2022', 'Regular', NULL, '1612695635', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2185, 'MOST. TABASSUM MYSHA', '628985', ' 1502184268', '21-22', '4th', 'KPI', '1st', '4CMTB1', NULL, 'Computer', '2022', 'Regular', NULL, '1718802754', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2186, 'SHAHADAT HOSSAIN', '628986', ' 1502184267', '21-22', '4th', 'KPI', '1st', '4CMTB1', NULL, 'Computer', '2022', 'Regular', NULL, '1867975903', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2187, 'IMRAN HOSSAIN', '628988', ' 1502184266', '21-22', '4th', 'KPI', '1st', '4CMTB1', NULL, 'Computer', '2022', 'Regular', NULL, '1879089876', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2188, 'FAHIMA NASRIN KEYA', '628990', ' 1502184265', '21-22', '4th', 'KPI', '1st', '4CMTB1', NULL, 'Computer', '2022', 'Regular', NULL, '1753141719', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2189, 'MST. PROVA AKTAR', '628993', ' 1502184264', '21-22', '4th', 'KPI', '1st', '4CMTB1', NULL, 'Computer', '2022', 'Regular', NULL, '1722463637', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2190, 'MS. SELIM AL HOSSAIN ASIF', '676119', '1502220516', '21-22', '4th', 'KPI', '1st', '4CMTB1', NULL, 'Computer', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2191, 'RIANA AHMED TONNY', '188466', '1500991802', '21-22', '4th', 'KPI', '2nd', '4CMTA2', NULL, 'Computer', '2022', 'Regular', NULL, '385343', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2192, 'SAKIB', '188468', '1500991800', '21-22', '4th', 'KPI', '2nd', '4CMTA2', NULL, 'Computer', '2022', 'Regular', NULL, '385341', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2193, 'LATA KHATUN', '188470', '1500991798', '21-22', '4th', 'KPI', '2nd', '4CMTA2', NULL, 'Computer', '2022', 'Regular', NULL, '385342', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2194, 'ARONNO HASAN TOPU', '188471', '1500991797', '21-22', '4th', 'KPI', '2nd', '4CMTA2', NULL, 'Computer', '2022', 'Regular', NULL, '385339', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2195, 'ANNA KHATUN', '188472', '1500991796', '21-22', '4th', 'KPI', '2nd', '4CMTA2', NULL, 'Computer', '2022', 'Regular', NULL, '385346', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2196, 'MD SAMRAT HOSSAIN', '530031', '1502163397', '20-21', '4th', 'KPI', '2nd', '4CMTA2', NULL, 'Computer', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2197, 'MUNNI SHANAZ MUNNI', '628997', ' 1502233862', '21-22', '4th', 'KPI', '2nd', '4CMTA2', NULL, 'Computer', '2022', 'Regular', NULL, '1724711869', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2198, 'DIP RAY', '629003', ' 1502184940', '21-22', '4th', 'KPI', '2nd', '4CMTA2', NULL, 'Computer', '2022', 'Regular', NULL, '1788291238', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2199, 'SHANKOR SAHA', '629007', ' 1502184939', '21-22', '4th', 'KPI', '2nd', '4CMTA2', NULL, 'Computer', '2022', 'Regular', NULL, '1307198216', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2200, 'NUSRAT JAHAN NISHAT', '629011', ' 1502184938', '21-22', '4th', 'KPI', '2nd', '4CMTA2', NULL, 'Computer', '2022', 'Regular', NULL, '1907667705', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2201, 'RATUL RANA', '629013', ' 1502184937', '21-22', '4th', 'KPI', '2nd', '4CMTA2', NULL, 'Computer', '2022', 'Regular', NULL, '1304632779', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2202, 'MD NAJMUL HUSAIN TUHIN', '629015', ' 1502184936', '21-22', '4th', 'KPI', '2nd', '4CMTA2', NULL, 'Computer', '2022', 'Regular', NULL, '1612227964', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2203, 'OISHI KHATUN', '629018', ' 1502184935', '21-22', '4th', 'KPI', '2nd', '4CMTA2', NULL, 'Computer', '2022', 'Regular', NULL, '1750743098', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2204, 'MD. MUSTAFIZUR RAHMAN', '629019', ' 1502184934', '21-22', '4th', 'KPI', '2nd', '4CMTA2', NULL, 'Computer', '2022', 'Regular', NULL, '1763531605', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2205, 'MD. ANAMUL HOK', '629032', ' 1502184928', '21-22', '4th', 'KPI', '2nd', '4CMTA2', NULL, 'Computer', '2022', 'Regular', NULL, '1959561499', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2206, 'MD. SABBIR AHMED', '629039', ' 1502184925', '21-22', '4th', 'KPI', '2nd', '4CMTA2', NULL, 'Computer', '2022', 'Regular', NULL, '1979516385', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2207, 'MD. EMTIAJ AHAMED SABBIR', '629045', ' 1502184924', '21-22', '4th', 'KPI', '2nd', '4CMTA2', NULL, 'Computer', '2022', 'Regular', NULL, '1402319687', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2208, 'MST RUME AKTER', '629046', ' 1502184923', '21-22', '4th', 'KPI', '2nd', '4CMTA2', NULL, 'Computer', '2022', 'Regular', NULL, '1765228302', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2209, 'ISRAFIL ISLAM SIFAT', '629047', ' 1502184922', '21-22', '4th', 'KPI', '2nd', '4CMTA2', NULL, 'Computer', '2022', 'Regular', NULL, '1723473344', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2210, 'MD. NAHID HASAN', '629052', ' 1502184920', '21-22', '4th', 'KPI', '2nd', '4CMTA2', NULL, 'Computer', '2022', 'Regular', NULL, '1738960324', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2211, 'MD. PLABON AHMED', '629061', ' 1502184917', '21-22', '4th', 'KPI', '2nd', '4CMTA2', NULL, 'Computer', '2022', 'Regular', NULL, '1826822599', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2212, 'MD.RAISUL ISLAM RITTIQ', '629068', ' 1502184916', '21-22', '4th', 'KPI', '2nd', '4CMTA2', NULL, 'Computer', '2022', 'Regular', NULL, '1917149774', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2213, 'WAHED KHONDOKAR NAFIZ', '629075', ' 1502184913', '21-22', '4th', 'KPI', '2nd', '4CMTA2', NULL, 'Computer', '2022', 'Regular', NULL, '1724530179', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2214, 'OVY BISWAS', '629078', ' 1502184912', '21-22', '4th', 'KPI', '2nd', '4CMTA2', NULL, 'Computer', '2022', 'Regular', NULL, '1403636071', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2215, 'MD. ATIQ HASAN SAGAR', '629089', ' 1502184908', '21-22', '4th', 'KPI', '2nd', '4CMTA2', NULL, 'Computer', '2022', 'Regular', NULL, '1779566741', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2216, 'SORNALI AKTER SHOSI', '629098', ' 1502184907', '21-22', '4th', 'KPI', '2nd', '4CMTA2', NULL, 'Computer', '2022', 'Regular', NULL, '1741696262', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2217, 'MD. SHAON HOSSEN', '629101', ' 1502184906', '21-22', '4th', 'KPI', '2nd', '4CMTA2', NULL, 'Computer', '2022', 'Regular', NULL, '1932990926', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2218, 'MD. IBRAHIM ISLAM', '629103', ' 1502184904', '21-22', '4th', 'KPI', '2nd', '4CMTA2', NULL, 'Computer', '2022', 'Regular', NULL, '1927229853', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2219, 'MD. RAKIBUL ISLAM', '629104', ' 1502184903', '21-22', '4th', 'KPI', '2nd', '4CMTA2', NULL, 'Computer', '2022', 'Regular', NULL, '1739895811', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2220, 'KOUSHIK KUMER BARMAN', '629119', ' 1502184901', '21-22', '4th', 'KPI', '2nd', '4CMTA2', NULL, 'Computer', '2022', 'Regular', NULL, '1770365981', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2221, 'MST SUBORNA KHATUN', '629127', ' 1502184900', '21-22', '4th', 'KPI', '2nd', '4CMTA2', NULL, 'Computer', '2022', 'Regular', NULL, '1639838549', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2222, 'UTSO AHAMED', '629128', ' 1502184899', '21-22', '4th', 'KPI', '2nd', '4CMTA2', NULL, 'Computer', '2022', 'Regular', NULL, '1736264823', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2223, 'MINTU UDDIN', '629131', ' 1502184898', '21-22', '4th', 'KPI', '2nd', '4CMTA2', NULL, 'Computer', '2022', 'Regular', NULL, '1744365775', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2224, 'KAZI ABDUR RAFI', '676941', '1502221731', '21-22', '4th', 'KPI', '2nd', '4CMTA2', NULL, 'Computer', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2225, 'MD. JUBAIR AHMED', '629134', ' 1502184897', '21-22', '4th', 'KPI', '2nd', '4CMTB2', NULL, 'Computer', '2022', 'Regular', NULL, '1785622121', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2226, 'MST. SUMAYA AKTER', '629136', ' 1502184896', '21-22', '4th', 'KPI', '2nd', '4CMTB2', NULL, 'Computer', '2022', 'Regular', NULL, '1861930042', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2227, 'S. M OMOR SABBIR', '629137', ' 1502184895', '21-22', '4th', 'KPI', '2nd', '4CMTB2', NULL, 'Computer', '2022', 'Regular', NULL, '1618825050', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2228, 'MD. TAREK HOSSEN', '629142', ' 1502184892', '21-22', '4th', 'KPI', '2nd', '4CMTB2', NULL, 'Computer', '2022', 'Regular', NULL, '1790388118', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2229, 'SHUVO BISWAS', '629145', ' 1502184891', '21-22', '4th', 'KPI', '2nd', '4CMTB2', NULL, 'Computer', '2022', 'Regular', NULL, '1983046517', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2230, 'SREE RAM GOPUL SHINGHA', '629146', ' 1502184890', '21-22', '4th', 'KPI', '2nd', '4CMTB2', NULL, 'Computer', '2022', 'Regular', NULL, '1310205642', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2231, 'MAHEDI HASAN', '629147', ' 1502184889', '21-22', '4th', 'KPI', '2nd', '4CMTB2', NULL, 'Computer', '2022', 'Regular', NULL, '1319571456', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2232, 'MD. SABBIR HOSSAIN', '629158', ' 1502184886', '21-22', '4th', 'KPI', '2nd', '4CMTB2', NULL, 'Computer', '2022', 'Regular', NULL, '1310298182', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2233, 'MD. HIMEL SHEKH', '629160', ' 1502184885', '21-22', '4th', 'KPI', '2nd', '4CMTB2', NULL, 'Computer', '2022', 'Regular', NULL, '1773146708', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2234, 'MST. AYESHA SIDDIK ASHA', '629161', ' 1502184884', '21-22', '4th', 'KPI', '2nd', '4CMTB2', NULL, 'Computer', '2022', 'Regular', NULL, '1741840148', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2235, 'POTTOY KUMAR SAHA', '629165', ' 1502184883', '21-22', '4th', 'KPI', '2nd', '4CMTB2', NULL, 'Computer', '2022', 'Regular', NULL, '1306751470', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2236, 'MD. SABBIR HOSSAIN', '629167', ' 1502184882', '21-22', '4th', 'KPI', '2nd', '4CMTB2', NULL, 'Computer', '2022', 'Regular', NULL, '1309885303', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2237, 'MD. RIPON SHEKH', '629171', ' 1502184881', '21-22', '4th', 'KPI', '2nd', '4CMTB2', NULL, 'Computer', '2022', 'Regular', NULL, '1725093305', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2238, 'MD. AKASH HOSSAIN', '629177', ' 1502184880', '21-22', '4th', 'KPI', '2nd', '4CMTB2', NULL, 'Computer', '2022', 'Regular', NULL, '1921895569', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2239, 'MD. ABDUL KABIR JIHAD', '629180', ' 1502184878', '21-22', '4th', 'KPI', '2nd', '4CMTB2', NULL, 'Computer', '2022', 'Regular', NULL, '1785777614', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2240, 'MD. SAHID ALI', '629182', ' 1502184877', '21-22', '4th', 'KPI', '2nd', '4CMTB2', NULL, 'Computer', '2022', 'Regular', NULL, '1400008742', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2241, 'MADHURI RANI', '629185', ' 1502184875', '21-22', '4th', 'KPI', '2nd', '4CMTB2', NULL, 'Computer', '2022', 'Regular', NULL, '1828841354', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2242, 'MD NAHID HASSAN', '629189', ' 1502184872', '21-22', '4th', 'KPI', '2nd', '4CMTB2', NULL, 'Computer', '2022', 'Regular', NULL, '1959321705', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2243, 'MD IMRAN KHAN ROHAN', '629190', ' 1502184871', '21-22', '4th', 'KPI', '2nd', '4CMTB2', NULL, 'Computer', '2022', 'Regular', NULL, '1307198676', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2244, 'MD. MUSABBIR HOSSAIN', '629191', ' 1502184870', '21-22', '4th', 'KPI', '2nd', '4CMTB2', NULL, 'Computer', '2022', 'Regular', NULL, '1880744098', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2245, 'MD. EAMIN ALI', '629197', ' 1502184869', '21-22', '4th', 'KPI', '2nd', '4CMTB2', NULL, 'Computer', '2022', 'Regular', NULL, '1784995957', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2246, 'MD. ASHRAFUL ISLAM APON', '629201', ' 1502184866', '21-22', '4th', 'KPI', '2nd', '4CMTB2', NULL, 'Computer', '2022', 'Regular', NULL, '1795685146', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2247, 'MD. SHAWON ISLAM', '629203', ' 1502184865', '21-22', '4th', 'KPI', '2nd', '4CMTB2', NULL, 'Computer', '2022', 'Regular', NULL, '1761647854', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2248, 'SEJAN MAHMUD', '629208', ' 1502184863', '21-22', '4th', 'KPI', '2nd', '4CMTB2', NULL, 'Computer', '2022', 'Regular', NULL, '1822527482', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2249, 'SHAIF UDDIN', '629209', ' 1502184862', '21-22', '4th', 'KPI', '2nd', '4CMTB2', NULL, 'Computer', '2022', 'Regular', NULL, '1750987303', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2250, 'MD POLOK HOSSAIN', '629211', ' 1502184860', '21-22', '4th', 'KPI', '2nd', '4CMTB2', NULL, 'Computer', '2022', 'Regular', NULL, '1884755439', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2251, 'MD. ROHAN BISWAS', '629213', ' 1502184859', '21-22', '4th', 'KPI', '2nd', '4CMTB2', NULL, 'Computer', '2022', 'Regular', NULL, '1865860383', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2252, 'MD. AL AMIN ISLAM', '629214', ' 1502184858', '21-22', '4th', 'KPI', '2nd', '4CMTB2', NULL, 'Computer', '2022', 'Regular', NULL, '1838586043', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2253, 'MD. RUHAN ALI', '629217', ' 1502184856', '21-22', '4th', 'KPI', '2nd', '4CMTB2', NULL, 'Computer', '2022', 'Regular', NULL, '1878701399', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2254, 'MD. TOWFIQ AHMED', '629226', ' 1502184854', '21-22', '4th', 'KPI', '2nd', '4CMTB2', NULL, 'Computer', '2022', 'Regular', NULL, '1743554182', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2255, 'MD. TANVIR AHMED', '629231', ' 1502184852', '21-22', '4th', 'KPI', '2nd', '4CMTB2', NULL, 'Computer', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2256, 'FARIA TASNIM MIM', '629237', ' 1502184850', '21-22', '4th', 'KPI', '2nd', '4CMTB2', NULL, 'Computer', '2022', 'Regular', NULL, '1316035084', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2257, 'MAHMUDUZZAMAN SHISHIR', '629238', ' 1502184849', '21-22', '4th', 'KPI', '2nd', '4CMTB2', NULL, 'Computer', '2022', 'Regular', NULL, '1860359765', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2258, 'GOURAB KUMAR BISWAS', '629242', ' 1502184847', '21-22', '4th', 'KPI', '2nd', '4CMTB2', NULL, 'Computer', '2022', 'Regular', NULL, '1701877715', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2259, 'MD. WASIUZZAMAN BADHON', '631444', '1502186294', '21-22', '4th', 'KPI', '2nd', '4CMTB2', NULL, 'Computer', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2260, 'TASKIN MAHAMUD SIFAT', '634582', '1502188718', '21-22', '4th', 'KPI', '2nd', '4CMTB2', NULL, 'Computer', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2261, 'MD SHAWON KHAN HIROK', '635640', '1502189694', '21-22', '4th', 'KPI', '2nd', '4CMTB2', NULL, 'Computer', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2262, 'MD ABDULLAH AL MAMUN', '639184', '1502193083', '21-22', '4th', 'KPI', '2nd', '4CMTB2', NULL, 'Computer', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2263, 'MD. AKASH HOSSAIN', '676958', '1502221714', '2122', '4th', 'KPI', '2nd', '4CMTB2', NULL, 'Computer', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2264, 'MD. TANVIR SHEIKH', '530410', '1502105786', '20-21', '4th', 'KPI', '1st', '4ETA1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2265, 'MD. RAZ BISWASH', '627586', ' 1502233840', '21-22', '4th', 'KPI', '1st', '4ETA1', NULL, 'Electrical', '2022', 'Regular', NULL, '1762115652', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2266, 'MD. ASIB JOARDDER', '627588', ' 1502183979', '21-22', '4th', 'KPI', '1st', '4ETA1', NULL, 'Electrical', '2022', 'Regular', NULL, '1908222717', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2267, 'MD.MAHINUR RAHMAN', '627589', ' 1502183978', '21-22', '4th', 'KPI', '1st', '4ETA1', NULL, 'Electrical', '2022', 'Regular', NULL, '1743029786', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2268, 'MD JIBON SHEIKH', '627590', ' 1502183977', '21-22', '4th', 'KPI', '1st', '4ETA1', NULL, 'Electrical', '2022', 'Regular', NULL, '1863978310', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2269, 'MD TAFSIN ADNAN AKIB', '627591', ' 1502183976', '21-22', '4th', 'KPI', '1st', '4ETA1', NULL, 'Electrical', '2022', 'Regular', NULL, '1683075318', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2270, 'MD. MUSTAKIM KABIR', '627592', ' 1502183975', '21-22', '4th', 'KPI', '1st', '4ETA1', NULL, 'Electrical', '2022', 'Regular', NULL, '1760767089', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2271, 'MD. MURSHID ALI', '627593', ' 1502183974', '21-22', '4th', 'KPI', '1st', '4ETA1', NULL, 'Electrical', '2022', 'Regular', NULL, '1405374768', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2272, 'MD. ISTIAK AHAMMED OMAR', '627597', ' 1502183972', '21-22', '4th', 'KPI', '1st', '4ETA1', NULL, 'Electrical', '2022', 'Regular', NULL, '1766656774', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2273, 'MD. ABU JAFOR KAEIM', '627598', ' 1502183971', '21-22', '4th', 'KPI', '1st', '4ETA1', NULL, 'Electrical', '2022', 'Regular', NULL, '1987021765', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2274, 'MD ARAFATH RAHMAN', '627599', ' 1502183970', '21-22', '4th', 'KPI', '1st', '4ETA1', NULL, 'Electrical', '2022', 'Regular', NULL, '1912199807', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2275, 'MD. SHOHANUR RAHMAN', '627603', ' 1502183966', '21-22', '4th', 'KPI', '1st', '4ETA1', NULL, 'Electrical', '2022', 'Regular', NULL, '1585204428', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2276, 'MST. AZMIRA KHATUN', '627605', ' 1502183965', '21-22', '4th', 'KPI', '1st', '4ETA1', NULL, 'Electrical', '2022', 'Regular', NULL, '1312973279', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2277, 'MD. ISTIAK AHMMED KOMOL', '627607', ' 1502183964', '21-22', '4th', 'KPI', '1st', '4ETA1', NULL, 'Electrical', '2022', 'Regular', NULL, '1737984728', '2024-01-13 14:14:28', '2024-01-13 14:14:28'),
(2278, 'SHANZU AHMED', '627608', ' 1502183963', '21-22', '4th', 'KPI', '1st', '4ETA1', NULL, 'Electrical', '2022', 'Regular', NULL, '1307726024', '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2279, 'MD. MINARUL ISLAM', '627609', ' 1502183962', '21-22', '4th', 'KPI', '1st', '4ETA1', NULL, 'Electrical', '2022', 'Regular', NULL, '1625737923', '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2280, 'SANZANA YESMIN', '627610', ' 1502183961', '21-22', '4th', 'KPI', '1st', '4ETA1', NULL, 'Electrical', '2022', 'Regular', NULL, '1722389036', '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2281, 'BAHARAM BADSHA BADOL', '627612', ' 1502183960', '21-22', '4th', 'KPI', '1st', '4ETA1', NULL, 'Electrical', '2022', 'Regular', NULL, '1757451981', '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2282, 'MD. MANIK SHAKH', '627613', ' 1502183959', '21-22', '4th', 'KPI', '1st', '4ETA1', NULL, 'Electrical', '2022', 'Regular', NULL, '1888361384', '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2283, 'SANGIDA AKHTER SONIA', '627614', ' 1502183958', '21-22', '4th', 'KPI', '1st', '4ETA1', NULL, 'Electrical', '2022', 'Regular', NULL, '1732491060', '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2284, 'MD. ZIHAD ALI', '627616', ' 1502183957', '21-22', '4th', 'KPI', '1st', '4ETA1', NULL, 'Electrical', '2022', 'Regular', NULL, '1944173485', '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2285, 'MEHEDI HASAN', '627618', ' 1502183955', '21-22', '4th', 'KPI', '1st', '4ETA1', NULL, 'Electrical', '2022', 'Regular', NULL, '1791605061', '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2286, 'MD. RABBI HOSSAIN', '627619', ' 1502183954', '21-22', '4th', 'KPI', '1st', '4ETA1', NULL, 'Electrical', '2022', 'Regular', NULL, '1789744937', '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2287, 'MST. SADIA KHATUN', '627620', ' 1502183953', '21-22', '4th', 'KPI', '1st', '4ETA1', NULL, 'Electrical', '2022', 'Regular', NULL, '1943889199', '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2288, 'MD. TANJILUL AHAMMED', '627622', ' 1502183951', '21-22', '4th', 'KPI', '1st', '4ETA1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2289, 'MST. SUMAYA SULTANA NISHI', '627623', ' 1502183950', '21-22', '4th', 'KPI', '1st', '4ETA1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2290, 'MD. ZISAN ALI', '627627', ' 1502183947', '21-22', '4th', 'KPI', '1st', '4ETA1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2291, 'SHUVO AHAMMED', '627628', ' 1502183946', '21-22', '4th', 'KPI', '1st', '4ETA1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2292, 'MST. MARZIA AKTER SANNA', '627629', ' 1502183945', '21-22', '4th', 'KPI', '1st', '4ETA1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2293, 'TOUFIK ARAFAT', '627630', ' 1502183944', '21-22', '4th', 'KPI', '1st', '4ETA1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2294, 'MD. SAID AL SIAM', '627631', ' 1502183943', '21-22', '4th', 'KPI', '1st', '4ETA1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2295, 'MD. SHAMIM MIA', '627633', ' 1502183942', '21-22', '4th', 'KPI', '1st', '4ETA1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2296, 'MD. TAFSIRUL ISLAM', '627634', ' 1502183941', '21-22', '4th', 'KPI', '1st', '4ETA1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2297, 'MD. RAKIBUL ISLAM RATUL', '627635', ' 1502183940', '21-22', '4th', 'KPI', '1st', '4ETA1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2298, 'MASUD SHAIKH', '627636', ' 1502183939', '21-22', '4th', 'KPI', '1st', '4ETA1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2299, 'AURNOB AHMED', '627638', ' 1502183937', '21-22', '4th', 'KPI', '1st', '4ETA1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2300, 'MD. ASADUZZAMAN', '627639', ' 1502183936', '21-22', '4th', 'KPI', '1st', '4ETA1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2301, 'MD. HASIBUL ISLAM', '627640', ' 1502183935', '21-22', '4th', 'KPI', '1st', '4ETA1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2302, 'SADI MOHAMMAD', '627641', ' 1502183934', '21-22', '4th', 'KPI', '1st', '4ETA1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2303, 'MD. RIDOY ALI', '627643', ' 1502183932', '21-22', '4th', 'KPI', '1st', '4ETA1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2304, 'MD. ABDUL AL BODUR', '530433', '1502105761', '20-21', '4th', 'KPI', '1st', '4ETB1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2305, 'MST. SADIA KHATUN', '627645', ' 1502183930', '21-22', '4th', 'KPI', '1st', '4ETB1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2306, 'MD. JIHAD ALI', '627647', ' 1502183928', '21-22', '4th', 'KPI', '1st', '4ETB1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2307, 'MD. RAIHAN', '627648', ' 1502183927', '21-22', '4th', 'KPI', '1st', '4ETB1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2308, 'MD. SHOHUG ALI', '627649', ' 1502183926', '21-22', '4th', 'KPI', '1st', '4ETB1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2309, 'RATUL HASAN OVI', '627650', ' 1502183925', '21-22', '4th', 'KPI', '1st', '4ETB1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2310, 'MD. HELAL UDDIN', '627652', ' 1502183923', '21-22', '4th', 'KPI', '1st', '4ETB1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2311, 'MD. SAJJAD HOSSAIN SHOMRAT', '627653', ' 1502183922', '21-22', '4th', 'KPI', '1st', '4ETB1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2312, 'MD. NAFIUR SARKAR ASIF', '627654', ' 1502183921', '21-22', '4th', 'KPI', '1st', '4ETB1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2313, 'MD. MEHEDI ISLAM', '627656', ' 1502183920', '21-22', '4th', 'KPI', '1st', '4ETB1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2314, 'MD. RUHAN HOSEN', '627657', ' 1502183919', '21-22', '4th', 'KPI', '1st', '4ETB1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2315, 'PAYEL', '627658', ' 1502183918', '21-22', '4th', 'KPI', '1st', '4ETB1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2316, 'ABDULLAH AL SHAFE', '627660', ' 1502183917', '21-22', '4th', 'KPI', '1st', '4ETB1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2317, 'MD. ROHAN AHMMED', '627661', ' 1502183916', '21-22', '4th', 'KPI', '1st', '4ETB1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2318, 'MD. SAIF AHOSUN', '627662', ' 1502183915', '21-22', '4th', 'KPI', '1st', '4ETB1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2319, 'MD. NAIM HOSEN SALAM', '627663', ' 1502183914', '21-22', '4th', 'KPI', '1st', '4ETB1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2320, 'MD. TUHIN ISLAM', '627665', ' 1502183912', '21-22', '4th', 'KPI', '1st', '4ETB1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2321, 'ABIR AHMED', '627667', ' 1502183911', '21-22', '4th', 'KPI', '1st', '4ETB1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2322, 'MD.RIFAT BISWAS', '627669', ' 1502183909', '21-22', '4th', 'KPI', '1st', '4ETB1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2323, 'SADAF ALMAS', '627670', ' 1502183908', '21-22', '4th', 'KPI', '1st', '4ETB1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2324, 'MD.TUHIN HOSSAIN', '627671', ' 1502183907', '21-22', '4th', 'KPI', '1st', '4ETB1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2325, 'S.M. MASHRAFI RAHMAN NILOY', '627672', ' 1502183906', '21-22', '4th', 'KPI', '1st', '4ETB1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2326, 'JANNATUL FARDOUS MIM', '627673', ' 1502183905', '21-22', '4th', 'KPI', '1st', '4ETB1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2327, 'MD SABBIR HOSSAIN', '627675', ' 1502183903', '21-22', '4th', 'KPI', '1st', '4ETB1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2328, 'MD. MONIRUL ISLAM', '627676', ' 1502183902', '21-22', '4th', 'KPI', '1st', '4ETB1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2329, 'ANIKA RAHMAN', '627677', ' 1502183901', '21-22', '4th', 'KPI', '1st', '4ETB1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2330, 'ASIF AHAMMED', '627679', ' 1502183900', '21-22', '4th', 'KPI', '1st', '4ETB1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2331, 'MD. HASIBUL HASAN PRANTO', '627681', ' 1502183899', '21-22', '4th', 'KPI', '1st', '4ETB1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2332, 'MASUM AL MAHMUD', '627682', ' 1502183898', '21-22', '4th', 'KPI', '1st', '4ETB1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2333, 'MD. RIGEN', '627684', ' 1502183896', '21-22', '4th', 'KPI', '1st', '4ETB1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2334, 'SABBIR AHMED', '627685', ' 1502183895', '21-22', '4th', 'KPI', '1st', '4ETB1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2335, 'MD. SHAMIUL HOSSIN HIMEL', '627686', ' 1502183894', '21-22', '4th', 'KPI', '1st', '4ETB1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2336, 'MD. AL AMIN', '627687', ' 1502183893', '21-22', '4th', 'KPI', '1st', '4ETB1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:29', '2024-01-13 14:14:29'),
(2337, 'KEYA BISWAS', '627688', ' 1502183892', '21-22', '4th', 'KPI', '1st', '4ETB1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2338, 'MD. NYMUL HASAN', '627689', ' 1502183891', '21-22', '4th', 'KPI', '1st', '4ETB1', NULL, 'Electrical', '2022', 'Regular', NULL, '1777701989', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2339, 'MD. SHAMOL ALI', '627690', ' 1502183890', '21-22', '4th', 'KPI', '1st', '4ETB1', NULL, 'Electrical', '2022', 'Regular', NULL, '1782321300', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2340, 'MD. SHOWHOROB HOSSEN', '627691', ' 1502183889', '21-22', '4th', 'KPI', '1st', '4ETB1', NULL, 'Electrical', '2022', 'Regular', NULL, '1737098401', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2341, 'MD. RAHAT HOSSEN', '627692', ' 1502183888', '21-22', '4th', 'KPI', '1st', '4ETB1', NULL, 'Electrical', '2022', 'Regular', NULL, '1722899213', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2342, 'MD. RABBY HASAN', '627694', ' 1502183887', '21-22', '4th', 'KPI', '1st', '4ETB1', NULL, 'Electrical', '2022', 'Regular', NULL, '1918206340', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2343, 'MD. MONIRUL ISLAM', '627695', ' 1502183886', '21-22', '4th', 'KPI', '1st', '4ETB1', NULL, 'Electrical', '2022', 'Regular', NULL, '1826075331', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2344, 'SOMOJIT BISWAS SONJOY', '627697', ' 1502183885', '21-22', '4th', 'KPI', '1st', '4ETB1', NULL, 'Electrical', '2022', 'Regular', NULL, '1300961096', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2345, 'BAYAZID AHMMED', '627698', ' 1502183884', '21-22', '4th', 'KPI', '1st', '4ETB1', NULL, 'Electrical', '2022', 'Regular', NULL, '1950368506', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2346, 'KAZI TANVIR AHMED SADIK', '627699', ' 1502183883', '21-22', '4th', 'KPI', '1st', '4ETB1', NULL, 'Electrical', '2022', 'Regular', NULL, '1710116610', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2347, 'MD.SAKIB AL HASAN', '627700', ' 1502183882', '21-22', '4th', 'KPI', '1st', '4ETB1', NULL, 'Electrical', '2022', 'Regular', NULL, '1822780161', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2348, 'MD. SAZZAD MAHMUD TAZ', '646920', '1502197826', '21-22', '4th', 'KPI', '1st', '4ETB1', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2349, 'MD. RANA AHAMED', '188443', '1500991781', '21-22', '4th', 'KPI', '2nd', '4ETA2', NULL, 'Electrical', '2022', 'Regular', NULL, '367247', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2350, 'MD SUJON ALI', '188448', '1500991776', '21-22', '4th', 'KPI', '2nd', '4ETA2', NULL, 'Electrical', '2022', 'Regular', NULL, '367250', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2351, 'MD HABIBUR RAHMAN', '188449', '1500991775', '21-22', '4th', 'KPI', '2nd', '4ETA2', NULL, 'Electrical', '2022', 'Regular', NULL, '367249', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2352, 'JOY AHMED', '530289', '1502163398', '20-21', '4th', 'KPI', '2nd', '4ETA2', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2353, 'MD. MOMINUR ISLAM', '627701', ' 1502233853', '21-22', '4th', 'KPI', '2nd', '4ETA2', NULL, 'Electrical', '2022', 'Regular', NULL, '1777696342', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2354, 'MD. RUMON HOSSAIN', '627703', ' 1502233852', '21-22', '4th', 'KPI', '2nd', '4ETA2', NULL, 'Electrical', '2022', 'Regular', NULL, '1961959862', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2355, 'ASHIKUR ZAMAN', '627705', ' 1502184554', '21-22', '4th', 'KPI', '2nd', '4ETA2', NULL, 'Electrical', '2022', 'Regular', NULL, '1754874107', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2356, 'MD. NAIM HOSSAIN', '627707', ' 1502184553', '21-22', '4th', 'KPI', '2nd', '4ETA2', NULL, 'Electrical', '2022', 'Regular', NULL, '1776132958', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2357, 'MD. MARUF HOSSAIN', '627708', ' 1502184552', '21-22', '4th', 'KPI', '2nd', '4ETA2', NULL, 'Electrical', '2022', 'Regular', NULL, '1315446332', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2358, 'MD. RAZA HOSSAIN', '627710', ' 1502184551', '21-22', '4th', 'KPI', '2nd', '4ETA2', NULL, 'Electrical', '2022', 'Regular', NULL, '1766862817', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2359, 'MD. RUHAN HOSSAIN', '627711', ' 1502184550', '21-22', '4th', 'KPI', '2nd', '4ETA2', NULL, 'Electrical', '2022', 'Regular', NULL, '1780181205', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2360, 'MST. PUSPO KHATUN', '627712', ' 1502184549', '21-22', '4th', 'KPI', '2nd', '4ETA2', NULL, 'Electrical', '2022', 'Regular', NULL, '1300341962', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2361, 'MD. ABEER HOSSAIN NIROB', '627713', ' 1502184548', '21-22', '4th', 'KPI', '2nd', '4ETA2', NULL, 'Electrical', '2022', 'Regular', NULL, '1833596433', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2362, 'MD. AKTARUJJAMAN ANIK', '627714', ' 1502184547', '21-22', '4th', 'KPI', '2nd', '4ETA2', NULL, 'Electrical', '2022', 'Regular', NULL, '1732004348', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2363, 'JANNATUL FERDOUS', '627715', ' 1502184546', '21-22', '4th', 'KPI', '2nd', '4ETA2', NULL, 'Electrical', '2022', 'Regular', NULL, '1876672220', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2364, 'ENEAT HASSAN', '627717', ' 1502184545', '21-22', '4th', 'KPI', '2nd', '4ETA2', NULL, 'Electrical', '2022', 'Regular', NULL, '1643775628', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2365, 'MD. FEROZ AHMMED', '627718', ' 1502184544', '21-22', '4th', 'KPI', '2nd', '4ETA2', NULL, 'Electrical', '2022', 'Regular', NULL, '1300847591', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2366, 'MARUF ALL SAIF', '627721', ' 1502184543', '21-22', '4th', 'KPI', '2nd', '4ETA2', NULL, 'Electrical', '2022', 'Regular', NULL, '1406535588', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2367, 'MD. HIMEL ALI', '627728', ' 1502184542', '21-22', '4th', 'KPI', '2nd', '4ETA2', NULL, 'Electrical', '2022', 'Regular', NULL, '1706358560', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2368, 'MD. SHUVO', '627733', ' 1502184541', '21-22', '4th', 'KPI', '2nd', '4ETA2', NULL, 'Electrical', '2022', 'Regular', NULL, '1779483316', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2369, 'OHI ISLAM ROHAN', '627734', ' 1502184540', '21-22', '4th', 'KPI', '2nd', '4ETA2', NULL, 'Electrical', '2022', 'Regular', NULL, '1728228979', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2370, 'MD. SHIMUL HOSSAIN', '627738', ' 1502184538', '21-22', '4th', 'KPI', '2nd', '4ETA2', NULL, 'Electrical', '2022', 'Regular', NULL, '1738572898', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2371, 'MD. ISHRAT MUBIN ANKON', '627740', ' 1502184537', '21-22', '4th', 'KPI', '2nd', '4ETA2', NULL, 'Electrical', '2022', 'Regular', NULL, '1724888055', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2372, 'MD. FERDOUS HOSSAIN PIASH', '627742', ' 1502184536', '21-22', '4th', 'KPI', '2nd', '4ETA2', NULL, 'Electrical', '2022', 'Regular', NULL, '1746977174', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2373, 'NOMAN BIN HAFIZ', '627743', ' 1502184535', '21-22', '4th', 'KPI', '2nd', '4ETA2', NULL, 'Electrical', '2022', 'Regular', NULL, '1862736645', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2374, 'RAJIM HOSSAIN MITHUN', '627747', ' 1502184534', '21-22', '4th', 'KPI', '2nd', '4ETA2', NULL, 'Electrical', '2022', 'Regular', NULL, '1305865541', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2375, 'MD SHAHRIAR KOBIR SHIHAB', '627749', ' 1502184533', '21-22', '4th', 'KPI', '2nd', '4ETA2', NULL, 'Electrical', '2022', 'Regular', NULL, '1975763899', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2376, 'AFSANA BULBUL', '627758', ' 1502184532', '21-22', '4th', 'KPI', '2nd', '4ETA2', NULL, 'Electrical', '2022', 'Regular', NULL, '1971108181', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2377, 'ATIKA AFIA ASHA', '627767', ' 1502184531', '21-22', '4th', 'KPI', '2nd', '4ETA2', NULL, 'Electrical', '2022', 'Regular', NULL, '1819704309', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2378, 'MD. TASAON TAZIN', '627769', ' 1502184530', '21-22', '4th', 'KPI', '2nd', '4ETA2', NULL, 'Electrical', '2022', 'Regular', NULL, '1856583243', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2379, 'MD. IMRAN HOSSAIN', '627770', ' 1502184529', '21-22', '4th', 'KPI', '2nd', '4ETA2', NULL, 'Electrical', '2022', 'Regular', NULL, '1319849203', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2380, 'JANNATUL FERDOUS RAISA', '627771', ' 1502184528', '21-22', '4th', 'KPI', '2nd', '4ETA2', NULL, 'Electrical', '2022', 'Regular', NULL, '1915319933', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2381, 'MD. RATUL HASAN', '627775', ' 1502184527', '21-22', '4th', 'KPI', '2nd', '4ETA2', NULL, 'Electrical', '2022', 'Regular', NULL, '1763642624', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2382, 'MST. SORNALY KHATUN', '627776', ' 1502184526', '21-22', '4th', 'KPI', '2nd', '4ETA2', NULL, 'Electrical', '2022', 'Regular', NULL, '1746822641', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2383, 'MARUF AHMED', '627777', ' 1502184525', '21-22', '4th', 'KPI', '2nd', '4ETA2', NULL, 'Electrical', '2022', 'Regular', NULL, '1888355303', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2384, 'MD. TISTAN ZOARDAR', '627779', ' 1502184524', '21-22', '4th', 'KPI', '2nd', '4ETA2', NULL, 'Electrical', '2022', 'Regular', NULL, '1790525095', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2385, 'MD. RAJIB ALI', '627786', ' 1502184522', '21-22', '4th', 'KPI', '2nd', '4ETA2', NULL, 'Electrical', '2022', 'Regular', NULL, '1796230706', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2386, 'MST.SHEMU AKTHER', '627787', ' 1502184521', '21-22', '4th', 'KPI', '2nd', '4ETA2', NULL, 'Electrical', '2022', 'Regular', NULL, '1319593507', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2387, 'MD. NAIMUR RAHMAN', '627789', ' 1502184519', '21-22', '4th', 'KPI', '2nd', '4ETA2', NULL, 'Electrical', '2022', 'Regular', NULL, '1757551056', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2388, 'RONI ISLAM', '627790', ' 1502184518', '21-22', '4th', 'KPI', '2nd', '4ETA2', NULL, 'Electrical', '2022', 'Regular', NULL, '1888472294', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2389, 'MD. RIYAD HOSSAIN', '627795', ' 1502184515', '21-22', '4th', 'KPI', '2nd', '4ETA2', NULL, 'Electrical', '2022', 'Regular', NULL, '1794071461', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2390, 'TONIMA KHATUN TONNY', '627796', ' 1502184514', '21-22', '4th', 'KPI', '2nd', '4ETA2', NULL, 'Electrical', '2022', 'Regular', NULL, '1750691388', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2391, 'SHIMUL', '631227', '1502186173', '21-22', '4th', 'KPI', '2nd', '4ETA2', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2392, 'MD SAMIUL ISLAM OWALLID', '631769', '1502235940', '21-22', '4th', 'KPI', '2nd', '4ETA2', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2393, 'MD. ALI ATH RAHMAN HASAN', '631824', '1502186933', '2122', '4th', 'KPI', '2nd', '4ETA2', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2394, 'MD TANVIR AREFIN OVI', '631844', '1502186925', '21-22', '4th', 'KPI', '2nd', '4ETA2', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2395, 'MD ALSHARAYER ALOM SYMON', '631895', '1502106898', '21-22', '4th', 'KPI', '2nd', '4ETA2', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2396, 'MD. RAYSUL ISLAM PRANTO', '631900', '1502186893', '2122', '4th', 'KPI', '2nd', '4ETA2', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2397, 'ISMILE RANA', '631903', '1502186891', '2122', '4th', 'KPI', '2nd', '4ETA2', NULL, 'Electrical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2398, 'MD. RAKIBUL ISLAM', '689578', '1502236380', '21-22', '4th', 'KPI', '2nd', '4ETA2', NULL, 'Electrical', '2022', 'Regular', NULL, '1753240888', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2399, 'SHOWN HASAN', '190099', '1500993169', '21-22', '4th', 'KPI', '2nd', '4ETB2', NULL, 'Electrical', '2022', 'Regular', NULL, '1735307191', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2400, 'MD ASIF AHMED', '190100', '1500993170', '21-22', '4th', 'KPI', '2nd', '4ETB2', NULL, 'Electrical', '2022', 'Regular', NULL, '1940942558', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2401, 'MD. TAHASAN UDDIN SHEIKH', '627797', ' 1502184513', '21-22', '4th', 'KPI', '2nd', '4ETB2', NULL, 'Electrical', '2022', 'Regular', NULL, '1306407196', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2402, 'MD. PIAS HOSEN', '627798', ' 1502184512', '21-22', '4th', 'KPI', '2nd', '4ETB2', NULL, 'Electrical', '2022', 'Regular', NULL, '1400330137', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2403, 'MD ZANNATUL FERWDOS', '627800', ' 1502184511', '21-22', '4th', 'KPI', '2nd', '4ETB2', NULL, 'Electrical', '2022', 'Regular', NULL, '1705579180', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2404, 'MD. RUHUL HOSSAIN', '627801', ' 1502184510', '21-22', '4th', 'KPI', '2nd', '4ETB2', NULL, 'Electrical', '2022', 'Regular', NULL, '1640366960', '2024-01-13 14:14:30', '2024-01-13 14:14:30'),
(2405, 'MD. SAIFUL ALAM AROS', '627802', ' 1502184509', '21-22', '4th', 'KPI', '2nd', '4ETB2', NULL, 'Electrical', '2022', 'Regular', NULL, '1962015254', '2024-01-13 14:14:30', '2024-01-13 14:14:30');
INSERT INTO `exam_students` (`id`, `name`, `roll`, `reg_no`, `session`, `semester`, `institute`, `shift`, `student_group`, `ref_subject`, `technology`, `probidhan`, `status`, `remarks`, `mobile`, `created_at`, `updated_at`) VALUES
(2406, 'KHONDOKER ABDULLAH AL MARUF', '627805', ' 1502184507', '21-22', '4th', 'KPI', '2nd', '4ETB2', NULL, 'Electrical', '2022', 'Regular', NULL, '1997513334', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2407, 'MD. SABBIR REZA', '627806', ' 1502184506', '21-22', '4th', 'KPI', '2nd', '4ETB2', NULL, 'Electrical', '2022', 'Regular', NULL, '1777904742', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2408, 'MD. ZEEM ALI', '627809', ' 1502184505', '21-22', '4th', 'KPI', '2nd', '4ETB2', NULL, 'Electrical', '2022', 'Regular', NULL, '1715466984', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2409, 'ABU UBAIDA SIDDIK', '627815', ' 1502184502', '21-22', '4th', 'KPI', '2nd', '4ETB2', NULL, 'Electrical', '2022', 'Regular', NULL, '1889949700', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2410, 'A K M AHOSANUR ZAMAN AKASH', '627816', ' 1502184501', '21-22', '4th', 'KPI', '2nd', '4ETB2', NULL, 'Electrical', '2022', 'Regular', NULL, '1768524662', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2411, 'MD. MARUF HOSSAIN', '627818', ' 1502184499', '21-22', '4th', 'KPI', '2nd', '4ETB2', NULL, 'Electrical', '2022', 'Regular', NULL, '1786650693', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2412, 'MD. MEHEDI HASSAN', '627822', ' 1502184498', '21-22', '4th', 'KPI', '2nd', '4ETB2', NULL, 'Electrical', '2022', 'Regular', NULL, '1400053796', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2413, 'SABBIR SAMIUL', '627824', ' 1502184497', '21-22', '4th', 'KPI', '2nd', '4ETB2', NULL, 'Electrical', '2022', 'Regular', NULL, '1640486030', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2414, 'ASIF AHMMED', '627826', ' 1502184496', '21-22', '4th', 'KPI', '2nd', '4ETB2', NULL, 'Electrical', '2022', 'Regular', NULL, '1762183818', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2415, 'MD. SHEMUL', '627827', ' 1502184495', '21-22', '4th', 'KPI', '2nd', '4ETB2', NULL, 'Electrical', '2022', 'Regular', NULL, '1907267605', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2416, 'MD. MINHAZUL ISLAM', '627829', ' 1502184494', '21-22', '4th', 'KPI', '2nd', '4ETB2', NULL, 'Electrical', '2022', 'Regular', NULL, '1707139574', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2417, 'MD.NAHARUL ISLAM NAHID', '627830', ' 1502184493', '21-22', '4th', 'KPI', '2nd', '4ETB2', NULL, 'Electrical', '2022', 'Regular', NULL, '1883487054', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2418, 'AKIB HOSSAIN', '627831', ' 1502184492', '21-22', '4th', 'KPI', '2nd', '4ETB2', NULL, 'Electrical', '2022', 'Regular', NULL, '1700841082', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2419, 'KHONDOKER SADIA AKTAR', '627833', ' 1502184490', '21-22', '4th', 'KPI', '2nd', '4ETB2', NULL, 'Electrical', '2022', 'Regular', NULL, '1706007929', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2420, 'MD. MAHFUJUR RAHMAN NISAN', '627836', ' 1502184488', '21-22', '4th', 'KPI', '2nd', '4ETB2', NULL, 'Electrical', '2022', 'Regular', NULL, '1792799564', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2421, 'MD. AZOM KHAN', '627837', ' 1502184487', '21-22', '4th', 'KPI', '2nd', '4ETB2', NULL, 'Electrical', '2022', 'Regular', NULL, '1782513870', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2422, 'MD. MILON UR RAHMAN LAM', '627839', ' 1502184485', '21-22', '4th', 'KPI', '2nd', '4ETB2', NULL, 'Electrical', '2022', 'Regular', NULL, '1866936658', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2423, 'MD. NASIM ALI', '627843', ' 1502184481', '21-22', '4th', 'KPI', '2nd', '4ETB2', NULL, 'Electrical', '2022', 'Regular', NULL, '1919525478', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2424, 'MD. HASIBUL', '627844', ' 1502184480', '21-22', '4th', 'KPI', '2nd', '4ETB2', NULL, 'Electrical', '2022', 'Regular', NULL, '1960394086', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2425, 'SAWAL HOSSAIN', '627846', ' 1502184478', '21-22', '4th', 'KPI', '2nd', '4ETB2', NULL, 'Electrical', '2022', 'Regular', NULL, '1315863576', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2426, 'MD. MINHAZ HOSSAIN', '627847', ' 1502184477', '21-22', '4th', 'KPI', '2nd', '4ETB2', NULL, 'Electrical', '2022', 'Regular', NULL, '1741993264', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2427, 'MD. ABIR MOLLIK', '627849', ' 1502184475', '21-22', '4th', 'KPI', '2nd', '4ETB2', NULL, 'Electrical', '2022', 'Regular', NULL, '1717748793', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2428, 'ABDULLAH', '627850', ' 1502184474', '21-22', '4th', 'KPI', '2nd', '4ETB2', NULL, 'Electrical', '2022', 'Regular', NULL, '1821412079', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2429, 'MD. ASADUL ISLAM ASAD', '627851', ' 1502184473', '21-22', '4th', 'KPI', '2nd', '4ETB2', NULL, 'Electrical', '2022', 'Regular', NULL, '1765676589', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2430, 'MD. MAMUN OR RASHID', '627852', ' 1502184472', '21-22', '4th', 'KPI', '2nd', '4ETB2', NULL, 'Electrical', '2022', 'Regular', NULL, '1996455275', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2431, 'MD.SOBUZ HOSSAN', '627854', ' 1502184470', '21-22', '4th', 'KPI', '2nd', '4ETB2', NULL, 'Electrical', '2022', 'Regular', NULL, '1998699461', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2432, 'SADIA NUR', '627855', ' 1502184469', '21-22', '4th', 'KPI', '2nd', '4ETB2', NULL, 'Electrical', '2022', 'Regular', NULL, '1738975374', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2433, 'MST. PROTYASHA AKTER SUMAYA', '627856', ' 1502184468', '21-22', '4th', 'KPI', '2nd', '4ETB2', NULL, 'Electrical', '2022', 'Regular', NULL, '1745571867', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2434, 'MD. MOMINUL ISLAM', '627858', ' 1502184467', '21-22', '4th', 'KPI', '2nd', '4ETB2', NULL, 'Electrical', '2022', 'Regular', NULL, '1784853629', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2435, 'MD. SAGOR ALI', '627869', ' 1502184461', '21-22', '4th', 'KPI', '2nd', '4ETB2', NULL, 'Electrical', '2022', 'Regular', NULL, '1639838111', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2436, 'MD. RIAD SHAKH', '627870', ' 1502184460', '21-22', '4th', 'KPI', '2nd', '4ETB2', NULL, 'Electrical', '2022', 'Regular', NULL, '1786596207', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2437, 'MD NUR ALAM', '627871', ' 1502184459', '21-22', '4th', 'KPI', '2nd', '4ETB2', NULL, 'Electrical', '2022', 'Regular', NULL, '1786267453', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2438, 'MD ALAMIN BISWAS', '627873', ' 1502233842', '21-22', '4th', 'KPI', '1st', '4ENTA1', NULL, 'Electronics', '2022', 'Regular', NULL, '1321351168', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2439, 'MD. AL AMIN', '627876', ' 1502184072', '21-22', '4th', 'KPI', '1st', '4ENTA1', NULL, 'Electronics', '2022', 'Regular', NULL, '1711342536', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2440, 'ARNIKA ZAMAN', '627878', ' 1502184070', '21-22', '4th', 'KPI', '1st', '4ENTA1', NULL, 'Electronics', '2022', 'Regular', NULL, '1636169505', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2441, 'MD.GOLAM ROSUL', '627884', ' 1502184067', '21-22', '4th', 'KPI', '1st', '4ENTA1', NULL, 'Electronics', '2022', 'Regular', NULL, '1842811671', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2442, 'MD. ISRAIL ISLAM', '627886', ' 1502184065', '21-22', '4th', 'KPI', '1st', '4ENTA1', NULL, 'Electronics', '2022', 'Regular', NULL, '1792772657', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2443, 'AMAN ULLAH TAJ', '627889', ' 1502184064', '21-22', '4th', 'KPI', '1st', '4ENTA1', NULL, 'Electronics', '2022', 'Regular', NULL, '1758121617', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2444, 'RUMAN HOWLADER', '627891', ' 1502184062', '21-22', '4th', 'KPI', '1st', '4ENTA1', NULL, 'Electronics', '2022', 'Regular', NULL, '1786698473', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2445, 'MD. SANJID KHAN SIAM', '627893', ' 1502184061', '21-22', '4th', 'KPI', '1st', '4ENTA1', NULL, 'Electronics', '2022', 'Regular', NULL, '1982841469', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2446, 'MD AJAJ AHAMMED', '627894', ' 1502184060', '21-22', '4th', 'KPI', '1st', '4ENTA1', NULL, 'Electronics', '2022', 'Regular', NULL, '1753151295', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2447, 'MST. AYRINE KHATUN', '627895', ' 1502184059', '21-22', '4th', 'KPI', '1st', '4ENTA1', NULL, 'Electronics', '2022', 'Regular', NULL, '1721880849', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2448, 'KANIZ FATEMA KANTA', '627896', ' 1502184058', '21-22', '4th', 'KPI', '1st', '4ENTA1', NULL, 'Electronics', '2022', 'Regular', NULL, '1739611335', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2449, 'MD. KONOK ALAMIN', '627897', ' 1502184057', '21-22', '4th', 'KPI', '1st', '4ENTA1', NULL, 'Electronics', '2022', 'Regular', NULL, '1969025800', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2450, 'MD. NUR AMIN POLASH', '627899', ' 1502184056', '21-22', '4th', 'KPI', '1st', '4ENTA1', NULL, 'Electronics', '2022', 'Regular', NULL, '1302358541', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2451, 'JUBAER AHAMMED JISAN', '627900', ' 1502184055', '21-22', '4th', 'KPI', '1st', '4ENTA1', NULL, 'Electronics', '2022', 'Regular', NULL, '1749967577', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2452, 'MD. HASIB UZ ZAMAN', '627902', ' 1502184053', '21-22', '4th', 'KPI', '1st', '4ENTA1', NULL, 'Electronics', '2022', 'Regular', NULL, '1913204367', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2453, 'MD. JIHAD SHIEK', '627903', ' 1502184052', '21-22', '4th', 'KPI', '1st', '4ENTA1', NULL, 'Electronics', '2022', 'Regular', NULL, '1720141861', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2454, 'PRANTO PAUL', '627904', ' 1502184051', '21-22', '4th', 'KPI', '1st', '4ENTA1', NULL, 'Electronics', '2022', 'Regular', NULL, '1969577882', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2455, 'MD. TANIM MONDOL', '627905', ' 1502184050', '21-22', '4th', 'KPI', '1st', '4ENTA1', NULL, 'Electronics', '2022', 'Regular', NULL, '1718252221', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2456, 'SAYEM AHMED POLASH', '627906', ' 1502184049', '21-22', '4th', 'KPI', '1st', '4ENTA1', NULL, 'Electronics', '2022', 'Regular', NULL, '1772297040', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2457, 'MD.MOTIUR RAHMAN', '627907', ' 1502184048', '21-22', '4th', 'KPI', '1st', '4ENTA1', NULL, 'Electronics', '2022', 'Regular', NULL, '1877515449', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2458, 'SHAFI ISLAM', '627909', ' 1502184047', '21-22', '4th', 'KPI', '1st', '4ENTA1', NULL, 'Electronics', '2022', 'Regular', NULL, '1717006283', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2459, 'MD. IMRAN HOSSAIN', '627914', ' 1502184044', '21-22', '4th', 'KPI', '1st', '4ENTA1', NULL, 'Electronics', '2022', 'Regular', NULL, '1756288221', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2460, 'MD.AMIR HOSSAIN', '627916', ' 1502184042', '21-22', '4th', 'KPI', '1st', '4ENTA1', NULL, 'Electronics', '2022', 'Regular', NULL, '1724173544', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2461, 'MD. RAFIKUL ISLAM', '627917', ' 1502184041', '21-22', '4th', 'KPI', '1st', '4ENTA1', NULL, 'Electronics', '2022', 'Regular', NULL, '1585209841', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2462, 'TANVIR HASAN BADHON', '627920', ' 1502184038', '21-22', '4th', 'KPI', '1st', '4ENTA1', NULL, 'Electronics', '2022', 'Regular', NULL, '1773105484', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2463, 'AMIYA SARKAR', '627929', ' 1502184033', '21-22', '4th', 'KPI', '1st', '4ENTA1', NULL, 'Electronics', '2022', 'Regular', NULL, '1741715316', '2024-01-13 14:14:31', '2024-01-13 14:14:31'),
(2464, 'MST. ZANNATUL FATEMA RIA', '627933', ' 1502184030', '21-22', '4th', 'KPI', '1st', '4ENTA1', NULL, 'Electronics', '2022', 'Regular', NULL, '1743281908', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2465, 'NABIL MOHAMMAD FAHIM', '627940', ' 1502184026', '21-22', '4th', 'KPI', '1st', '4ENTA1', NULL, 'Electronics', '2022', 'Regular', NULL, '1787369803', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2466, 'MD ZISAN SHEIKH', '631988', '1502186522', '21-22', '4th', 'KPI', '1st', '4ENTA1', NULL, 'Electronics', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2467, 'SHADMAN SHAREAIR PRANTO', '632013', '1502186504', '21-22', '4th', 'KPI', '1st', '4ENTA1', NULL, 'Electronics', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2468, 'MD. RAHUL PARVEZ LIKHON', '632019', '1502186498', '2122', '4th', 'KPI', '1st', '4ENTA1', NULL, 'Electronics', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2469, 'ZUNAYED BIN ANIS', '633981', '1502187891', '2122', '4th', 'KPI', '1st', '4ENTA1', NULL, 'Electronics', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2470, 'MD. TANVIR HASAN', '638913', '1502192709', '21-22', '4th', 'KPI', '1st', '4ENTA1', NULL, 'Electronics', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2471, 'MD. RAKIB HOSSAIN', '627944', ' 1502184025', '21-22', '4th', 'KPI', '1st', '4ENTB1', NULL, 'Electronics', '2022', 'Regular', NULL, '1715536913', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2472, 'MD. MAHAFUJ AHOMMED', '627946', ' 1502184023', '21-22', '4th', 'KPI', '1st', '4ENTB1', NULL, 'Electronics', '2022', 'Regular', NULL, '1788262113', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2473, 'KISHOUR PRAMANIK', '627951', ' 1502184020', '21-22', '4th', 'KPI', '1st', '4ENTB1', NULL, 'Electronics', '2022', 'Regular', NULL, '1640336694', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2474, 'SADI MOHAMMAD', '627958', ' 1502184018', '21-22', '4th', 'KPI', '1st', '4ENTB1', NULL, 'Electronics', '2022', 'Regular', NULL, '1902174949', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2475, 'BIDDUT HOSSAN', '627960', ' 1502184016', '21-22', '4th', 'KPI', '1st', '4ENTB1', NULL, 'Electronics', '2022', 'Regular', NULL, '1313878903', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2476, 'MD. ALIM', '627961', ' 1502184015', '21-22', '4th', 'KPI', '1st', '4ENTB1', NULL, 'Electronics', '2022', 'Regular', NULL, '1753530696', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2477, 'MD. OBAED HASAN', '627962', ' 1502184014', '21-22', '4th', 'KPI', '1st', '4ENTB1', NULL, 'Electronics', '2022', 'Regular', NULL, '1701292855', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2478, 'MD. SAGOR PRAMANIK', '627971', ' 1502184010', '21-22', '4th', 'KPI', '1st', '4ENTB1', NULL, 'Electronics', '2022', 'Regular', NULL, '1322648760', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2479, 'MD. EMON HOSSAIN', '627977', ' 1502184005', '21-22', '4th', 'KPI', '1st', '4ENTB1', NULL, 'Electronics', '2022', 'Regular', NULL, '1884167494', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2480, 'MD. NAIMUR RAHAMAN', '627982', ' 1502184002', '21-22', '4th', 'KPI', '1st', '4ENTB1', NULL, 'Electronics', '2022', 'Regular', NULL, '1878334204', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2481, 'MD. ZIHAD KHAN', '627983', ' 1502184001', '21-22', '4th', 'KPI', '1st', '4ENTB1', NULL, 'Electronics', '2022', 'Regular', NULL, '1827658714', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2482, 'MD. MUTTAKIN HOSSAIN', '627993', ' 1502183996', '21-22', '4th', 'KPI', '1st', '4ENTB1', NULL, 'Electronics', '2022', 'Regular', NULL, '1754414083', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2483, 'MD SIAM', '628002', ' 1502183992', '21-22', '4th', 'KPI', '1st', '4ENTB1', NULL, 'Electronics', '2022', 'Regular', NULL, '1880500636', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2484, 'PUJA BISWAS', '628007', ' 1502183988', '21-22', '4th', 'KPI', '1st', '4ENTB1', NULL, 'Electronics', '2022', 'Regular', NULL, '1716180904', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2485, 'MD. ASHIKUR RAHMAN', '628010', ' 1502183987', '21-22', '4th', 'KPI', '1st', '4ENTB1', NULL, 'Electronics', '2022', 'Regular', NULL, '1766132227', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2486, 'RABAYAT-E-ALOM', '628011', ' 1502183986', '21-22', '4th', 'KPI', '1st', '4ENTB1', NULL, 'Electronics', '2022', 'Regular', NULL, '1720839704', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2487, 'MD. ABDULLAH AL MAMUN', '631248', '1502186027', '2122', '4th', 'KPI', '1st', '4ENTB1', NULL, 'Electronics', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2488, 'MUSTAFIJUR RAHMAN RAHAT', '631251', '1502186024', '2122', '4th', 'KPI', '1st', '4ENTB1', NULL, 'Electronics', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2489, 'MD. RATUL MOLLIK', '632022', '1502186495', '21-22', '4th', 'KPI', '1st', '4ENTB1', NULL, 'Electronics', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2490, 'MOHAMMAD HUJAIFA', '644751', '1502196670', '2122', '4th', 'KPI', '1st', '4ENTB1', NULL, 'Electronics', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2491, 'MD AKRAMUL HAQUE UDAY', '188450', '1500991784', '21-22', '4th', 'KPI', '2nd', '4ENTA2', NULL, 'Electronics', '2022', 'Regular', NULL, '368343', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2492, 'MD. AL AMIN', '188451', '1500991783', '21-22', '4th', 'KPI', '2nd', '4ENTA2', NULL, 'Electronics', '2022', 'Regular', NULL, '368344', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2493, 'MD. IQBAL HOSSAIN CHOWDHURY', '628023', ' 1502184653', '21-22', '4th', 'KPI', '2nd', '4ENTA2', NULL, 'Electronics', '2022', 'Regular', NULL, '1735158198', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2494, 'NAHID HOSSIAN', '628024', ' 1502184652', '21-22', '4th', 'KPI', '2nd', '4ENTA2', NULL, 'Electronics', '2022', 'Regular', NULL, '1779995015', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2495, 'MD APON MIR RATUL', '628026', ' 1502184650', '21-22', '4th', 'KPI', '2nd', '4ENTA2', NULL, 'Electronics', '2022', 'Regular', NULL, '1706161957', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2496, 'MD. FARDIN ISLAM JITU', '628028', ' 1502184649', '21-22', '4th', 'KPI', '2nd', '4ENTA2', NULL, 'Electronics', '2022', 'Regular', NULL, '1409095342', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2497, 'MD. MINHAZUR RAHMAN', '628030', ' 1502184647', '21-22', '4th', 'KPI', '2nd', '4ENTA2', NULL, 'Electronics', '2022', 'Regular', NULL, '1706998045', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2498, 'MD JAHIDUL ISLAM', '628032', ' 1502184645', '21-22', '4th', 'KPI', '2nd', '4ENTA2', NULL, 'Electronics', '2022', 'Regular', NULL, '1795911616', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2499, 'MD. BISHAL HOSEN', '628035', ' 1502184643', '21-22', '4th', 'KPI', '2nd', '4ENTA2', NULL, 'Electronics', '2022', 'Regular', NULL, '1703381612', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2500, 'SUMON HOSSAIN', '628036', ' 1502184642', '21-22', '4th', 'KPI', '2nd', '4ENTA2', NULL, 'Electronics', '2022', 'Regular', NULL, '1794412749', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2501, 'MD IBRAHIM', '628037', ' 1502184641', '21-22', '4th', 'KPI', '2nd', '4ENTA2', NULL, 'Electronics', '2022', 'Regular', NULL, '1773051104', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2502, 'SHAWON AHMED', '628039', ' 1502184640', '21-22', '4th', 'KPI', '2nd', '4ENTA2', NULL, 'Electronics', '2022', 'Regular', NULL, '1306755851', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2503, 'GOLAM ESTIAK ESHAN', '628040', ' 1502184639', '21-22', '4th', 'KPI', '2nd', '4ENTA2', NULL, 'Electronics', '2022', 'Regular', NULL, '1729513251', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2504, 'MD. ANICH HOSSAIN', '628043', ' 1502184638', '21-22', '4th', 'KPI', '2nd', '4ENTA2', NULL, 'Electronics', '2022', 'Regular', NULL, '1717017388', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2505, 'NIRMOL AHMED SHIMUL', '628046', ' 1502184635', '21-22', '4th', 'KPI', '2nd', '4ENTA2', NULL, 'Electronics', '2022', 'Regular', NULL, '1778304793', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2506, 'MD. SUMON HOSSAIN', '628047', ' 1502184634', '21-22', '4th', 'KPI', '2nd', '4ENTA2', NULL, 'Electronics', '2022', 'Regular', NULL, '1939892543', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2507, 'KOWSER', '628054', ' 1502184628', '21-22', '4th', 'KPI', '2nd', '4ENTA2', NULL, 'Electronics', '2022', 'Regular', NULL, '1767155294', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2508, 'MD SAIM AHMED', '628064', ' 1502184620', '21-22', '4th', 'KPI', '2nd', '4ENTA2', NULL, 'Electronics', '2022', 'Regular', NULL, '1787307589', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2509, 'MD. SAMIUL ISLAM', '628074', ' 1502184612', '21-22', '4th', 'KPI', '2nd', '4ENTA2', NULL, 'Electronics', '2022', 'Regular', NULL, '1307325051', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2510, 'SIAM HOSSAIN EMON', '628075', ' 1502184611', '21-22', '4th', 'KPI', '2nd', '4ENTA2', NULL, 'Electronics', '2022', 'Regular', NULL, '1755006087', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2511, 'MD. RONI SHEIKH', '628079', ' 1502184608', '21-22', '4th', 'KPI', '2nd', '4ENTA2', NULL, 'Electronics', '2022', 'Regular', NULL, '1710510137', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2512, 'MD. MAHMUD UR RAHMAN', '628080', ' 1502184607', '21-22', '4th', 'KPI', '2nd', '4ENTA2', NULL, 'Electronics', '2022', 'Regular', NULL, '1771005658', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2513, 'MD. SALAM UDDIN', '628081', ' 1502184606', '21-22', '4th', 'KPI', '2nd', '4ENTA2', NULL, 'Electronics', '2022', 'Regular', NULL, '1788573284', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2514, 'MD JIBON HOSSEN', '628084', ' 1502184603', '21-22', '4th', 'KPI', '2nd', '4ENTA2', NULL, 'Electronics', '2022', 'Regular', NULL, '1999172064', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2515, 'AHAMMED SIDDIK ARKO', '631316', '1502186254', '21-22', '4th', 'KPI', '2nd', '4ENTA2', NULL, 'Electronics', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2516, 'MD. RATUL ISLAM', '632054', '1502187054', '21-22', '4th', 'KPI', '2nd', '4ENTA2', NULL, 'Electronics', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2517, 'ASME AZOM RATUL', '628029', ' 1502184648', '21-22', '4th', 'KPI', '2nd', '4ENTB2', NULL, 'Electronics', '2022', 'Regular', NULL, '1705348690', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2518, 'MD. EZAZ MAHMUD', '628045', ' 1502184636', '21-22', '4th', 'KPI', '2nd', '4ENTB2', NULL, 'Electronics', '2022', 'Regular', NULL, '1308065890', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2519, 'MD.SAMIUL ISLAM', '628048', ' 1502184633', '21-22', '4th', 'KPI', '2nd', '4ENTB2', NULL, 'Electronics', '2022', 'Regular', NULL, '1779280875', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2520, 'MD. NEROB', '628093', ' 1502184597', '21-22', '4th', 'KPI', '2nd', '4ENTB2', NULL, 'Electronics', '2022', 'Regular', NULL, '1315355889', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2521, 'MD SHARAFAT HOSSAIN SHAFI', '628094', ' 1502184596', '21-22', '4th', 'KPI', '2nd', '4ENTB2', NULL, 'Electronics', '2022', 'Regular', NULL, '1822629078', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2522, 'MAMUN AHMED', '628098', ' 1502184593', '21-22', '4th', 'KPI', '2nd', '4ENTB2', NULL, 'Electronics', '2022', 'Regular', NULL, '1759856906', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2523, 'MD. ALFAJ AHMED DURONTO', '628099', ' 1502184592', '21-22', '4th', 'KPI', '2nd', '4ENTB2', NULL, 'Electronics', '2022', 'Regular', NULL, '1722826120', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2524, 'SHAHED RAHMAN', '628100', ' 1502184591', '21-22', '4th', 'KPI', '2nd', '4ENTB2', NULL, 'Electronics', '2022', 'Regular', NULL, '1789249294', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2525, 'MD. MOJAHIDUL ISLAM', '628101', ' 1502184590', '21-22', '4th', 'KPI', '2nd', '4ENTB2', NULL, 'Electronics', '2022', 'Regular', NULL, '1725128381', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2526, 'MD. SADID ISLAM', '628103', ' 1502184589', '21-22', '4th', 'KPI', '2nd', '4ENTB2', NULL, 'Electronics', '2022', 'Regular', NULL, '1972762090', '2024-01-13 14:14:32', '2024-01-13 14:14:32'),
(2527, 'MD SUJON', '628105', ' 1502184587', '21-22', '4th', 'KPI', '2nd', '4ENTB2', NULL, 'Electronics', '2022', 'Regular', NULL, '1799373644', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2528, 'MD. REYAD HOSSAIN', '628106', ' 1502184586', '21-22', '4th', 'KPI', '2nd', '4ENTB2', NULL, 'Electronics', '2022', 'Regular', NULL, '1956544557', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2529, 'MD RAIM AHMED', '628107', ' 1502184585', '21-22', '4th', 'KPI', '2nd', '4ENTB2', NULL, 'Electronics', '2022', 'Regular', NULL, '1310468604', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2530, 'SUBROTO BISWAS', '628108', ' 1502184584', '21-22', '4th', 'KPI', '2nd', '4ENTB2', NULL, 'Electronics', '2022', 'Regular', NULL, '1873693064', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2531, 'SAMI AHMED', '628110', ' 1502184583', '21-22', '4th', 'KPI', '2nd', '4ENTB2', NULL, 'Electronics', '2022', 'Regular', NULL, '1310459511', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2532, 'A S M SAIFULLA', '628111', ' 1502184582', '21-22', '4th', 'KPI', '2nd', '4ENTB2', NULL, 'Electronics', '2022', 'Regular', NULL, '1631723452', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2533, 'MST. RUPALY MOSTOFA ATHOY', '628114', ' 1502184580', '21-22', '4th', 'KPI', '2nd', '4ENTB2', NULL, 'Electronics', '2022', 'Regular', NULL, '1302792220', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2534, 'MD. SHAKIL HOSSAIN', '628116', ' 1502184578', '21-22', '4th', 'KPI', '2nd', '4ENTB2', NULL, 'Electronics', '2022', 'Regular', NULL, '1744217948', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2535, 'BELAL HOSSAIN', '628119', ' 1502184575', '21-22', '4th', 'KPI', '2nd', '4ENTB2', NULL, 'Electronics', '2022', 'Regular', NULL, '1755895310', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2536, 'MD MAHIN HOSSAIN', '628122', ' 1502184572', '21-22', '4th', 'KPI', '2nd', '4ENTB2', NULL, 'Electronics', '2022', 'Regular', NULL, '1711000092', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2537, 'MD. MAMUN HOSSEN', '628123', ' 1502184571', '21-22', '4th', 'KPI', '2nd', '4ENTB2', NULL, 'Electronics', '2022', 'Regular', NULL, '1748072891', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2538, 'MD JUBAED ISLAM', '628125', ' 1502184570', '21-22', '4th', 'KPI', '2nd', '4ENTB2', NULL, 'Electronics', '2022', 'Regular', NULL, '1996662184', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2539, 'MD SAMIUL HASAN SHANTO', '628126', ' 1502184569', '21-22', '4th', 'KPI', '2nd', '4ENTB2', NULL, 'Electronics', '2022', 'Regular', NULL, '1737144818', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2540, 'EASIR ARAFAT', '628128', ' 1502184568', '21-22', '4th', 'KPI', '2nd', '4ENTB2', NULL, 'Electronics', '2022', 'Regular', NULL, '1772092081', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2541, 'AMIR HAMZA', '628133', ' 1502184565', '21-22', '4th', 'KPI', '2nd', '4ENTB2', NULL, 'Electronics', '2022', 'Regular', NULL, '1955637772', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2542, 'DINAR IBNA ARHAN', '628138', ' 1502184561', '21-22', '4th', 'KPI', '2nd', '4ENTB2', NULL, 'Electronics', '2022', 'Regular', NULL, '1306098364', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2543, 'MOHAMMAD MOYEN', '628139', '1502184560', '21-22', '4th', 'KPI', '2nd', '4ENTB2', NULL, 'Electronics', '2022', 'Regular', NULL, '1790595119', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2544, 'PRITAM KUMAR SHARMA', '628141', ' 1502184559', '21-22', '4th', 'KPI', '2nd', '4ENTB2', NULL, 'Electronics', '2022', 'Regular', NULL, '1303098763', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2545, 'MD. MAJHARUL ISLAM LITU', '628145', ' 1502184555', '21-22', '4th', 'KPI', '2nd', '4ENTB2', NULL, 'Electronics', '2022', 'Regular', NULL, '1928775722', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2546, 'MD. RAFIZ ISLAM', '632106', '1502187011', '21-22', '4th', 'KPI', '2nd', '4ENTB2', NULL, 'Electronics', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2547, 'MARIA AKTER', '530803', '1502106252', '20-21', '4th', 'KPI', '1st', '4MTA1', NULL, 'Mechanical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2548, 'MD. NILOY ALI', '628146', ' 1502233846', '21-22', '4th', 'KPI', '1st', '4MTA1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1738944720', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2549, 'MD. REDOY AHMED', '628149', ' 1502233844', '21-22', '4th', 'KPI', '1st', '4MTA1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1307342796', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2550, 'MURSIDUJJAMAN ABIR', '628150', ' 1502233843', '21-22', '4th', 'KPI', '1st', '4MTA1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1759514868', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2551, 'HASAN RASHED BENDU', '628151', ' 1502184167', '21-22', '4th', 'KPI', '1st', '4MTA1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1714442442', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2552, 'MD. ASADUJJAMAN SAKIB', '628153', ' 1502184165', '21-22', '4th', 'KPI', '1st', '4MTA1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1769925878', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2553, 'SK. RAFIUL ISLAM FAISAL', '628154', ' 1502184164', '21-22', '4th', 'KPI', '1st', '4MTA1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1310373506', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2554, 'TOUHIDUR RAHMAN TOUFIK', '628155', ' 1502184163', '21-22', '4th', 'KPI', '1st', '4MTA1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1799611824', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2555, 'MD. JISAN UDDIN', '628157', ' 1502184162', '21-22', '4th', 'KPI', '1st', '4MTA1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1610555389', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2556, 'JANNATUL FERDOUS', '628159', ' 1502184160', '21-22', '4th', 'KPI', '1st', '4MTA1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1928374329', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2557, 'SHANTA PARVIN CHOITY', '628160', ' 1502184159', '21-22', '4th', 'KPI', '1st', '4MTA1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1749062492', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2558, 'MD. IMRAN HOSSAIN', '628162', ' 1502184158', '21-22', '4th', 'KPI', '1st', '4MTA1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1782678470', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2559, 'MD. SAFAYOT HOSSAIN ROKY', '628167', ' 1502184155', '21-22', '4th', 'KPI', '1st', '4MTA1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1781129868', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2560, 'MD. AKASH ALI', '628168', ' 1502184154', '21-22', '4th', 'KPI', '1st', '4MTA1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1646647459', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2561, 'SHAKIL AHAMED AHAD', '628169', ' 1502184153', '21-22', '4th', 'KPI', '1st', '4MTA1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1923978928', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2562, 'AL AMIN', '628170', ' 1502184152', '21-22', '4th', 'KPI', '1st', '4MTA1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1810776363', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2563, 'MD. JEHAD HASSAN JAHID', '628174', ' 1502184150', '21-22', '4th', 'KPI', '1st', '4MTA1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1711143959', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2564, 'ANANTO ARAFAT', '628175', ' 1502184149', '21-22', '4th', 'KPI', '1st', '4MTA1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1835536610', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2565, 'RAYHAN BISHWIS', '628176', ' 1502184148', '21-22', '4th', 'KPI', '1st', '4MTA1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1778982945', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2566, 'MILON MONDOL', '628177', ' 1502184147', '21-22', '4th', 'KPI', '1st', '4MTA1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1775279908', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2567, 'ASHEQUR RAHMAN SHAIKAT', '628179', ' 1502184145', '21-22', '4th', 'KPI', '1st', '4MTA1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1780245528', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2568, 'SHISHIR AHMED', '628182', ' 1502184143', '21-22', '4th', 'KPI', '1st', '4MTA1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1725108694', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2569, 'MD. SAIED HOSEN EMON', '628184', ' 1502184141', '21-22', '4th', 'KPI', '1st', '4MTA1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1300872162', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2570, 'SHAJIDUR RAHMAN', '628185', ' 1502184140', '21-22', '4th', 'KPI', '1st', '4MTA1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1719305397', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2571, 'JUWEL RANA', '628186', ' 1502184139', '21-22', '4th', 'KPI', '1st', '4MTA1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1791712258', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2572, 'MD. MOSHABBIR HOSSEN', '628188', ' 1502184138', '21-22', '4th', 'KPI', '1st', '4MTA1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1973014627', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2573, 'MST. RUPA KHATUN', '628189', ' 1502184137', '21-22', '4th', 'KPI', '1st', '4MTA1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1304548084', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2574, 'MD. MOSABBIR ALAM', '628190', ' 1502184136', '21-22', '4th', 'KPI', '1st', '4MTA1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1713886660', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2575, 'MD. HASIBUL HASAN RASEL', '628191', ' 1502184135', '21-22', '4th', 'KPI', '1st', '4MTA1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1627556943', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2576, 'MD. RABAET IQBAL SHAWON', '628192', '1502184134', '21-22', '4th', 'KPI', '1st', '4MTA1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1892206095', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2577, 'SOUVIK PODDER', '628194', ' 1502184132', '21-22', '4th', 'KPI', '1st', '4MTA1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1789503766', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2578, 'MD. SHAKIB REJA', '628195', ' 1502184131', '21-22', '4th', 'KPI', '1st', '4MTA1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1706464856', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2579, 'MD. SAIKAT ISLAM', '628196', ' 1502184130', '21-22', '4th', 'KPI', '1st', '4MTA1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1854898295', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2580, 'MD. SIAM HOSEN', '628197', ' 1502184129', '21-22', '4th', 'KPI', '1st', '4MTA1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1785566400', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2581, 'MD. SADMAN SAKIB', '628204', ' 1502184127', '21-22', '4th', 'KPI', '1st', '4MTA1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1553610000', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2582, 'MD. RASHIDUL ISLAM', '628209', ' 1502184124', '21-22', '4th', 'KPI', '1st', '4MTA1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1314046827', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2583, 'MD. JUNAYD ALI', '628210', ' 1502184123', '21-22', '4th', 'KPI', '1st', '4MTA1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1727629916', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2584, 'MST. SUPTI KHATUN', '628213', ' 1502184122', '21-22', '4th', 'KPI', '1st', '4MTA1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1405215780', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2585, 'ABU SALEH AHMED', '628214', ' 1502184121', '21-22', '4th', 'KPI', '1st', '4MTA1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1936397501', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2586, 'PROBARON RAHMAN', '188453', '1500991787', '21-22', '4th', 'KPI', '1st', '4MTB1', NULL, 'Mechanical', '2022', 'Regular', NULL, '370243', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2587, 'MD. MAHAFUJ RAHMAN KHAN', '188454', '1500991786', '21-22', '4th', 'KPI', '1st', '4MTB1', NULL, 'Mechanical', '2022', 'Regular', NULL, '370242', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2588, 'MD. AHAD ALI', '188455', '1500991785', '21-22', '4th', 'KPI', '1st', '4MTB1', NULL, 'Mechanical', '2022', 'Regular', NULL, '370244', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2589, 'MD. ABU RUBAYET KHAN', '628216', ' 1502184119', '21-22', '4th', 'KPI', '1st', '4MTB1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1777486909', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2590, 'ALIF MAHAMUD', '628217', ' 1502184118', '21-22', '4th', 'KPI', '1st', '4MTB1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1708641120', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2591, 'MST. FARJANA BINTI RAZZAK', '628234', ' 1502184116', '21-22', '4th', 'KPI', '1st', '4MTB1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1779276615', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2592, 'MD. ASHIKUR RAHMAN', '628235', ' 1502184115', '21-22', '4th', 'KPI', '1st', '4MTB1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1909827204', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2593, 'NOMAN FORID', '628238', ' 1502184114', '21-22', '4th', 'KPI', '1st', '4MTB1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1729689788', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2594, 'MD. MEHEDI HASAN', '628239', ' 1502184113', '21-22', '4th', 'KPI', '1st', '4MTB1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1743361907', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2595, 'MD. SHAHINUR RAHMAN JISAN', '628240', ' 1502184112', '21-22', '4th', 'KPI', '1st', '4MTB1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1732765317', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2596, 'MD. RATUL HASAN', '628242', ' 1502184111', '21-22', '4th', 'KPI', '1st', '4MTB1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1870706397', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2597, 'SYED HASINUZZAMAN SHOWMIK', '628245', ' 1502184110', '21-22', '4th', 'KPI', '1st', '4MTB1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1989578360', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2598, 'SREE JOYNTO KUMAR DAS', '628249', ' 1502184109', '21-22', '4th', 'KPI', '1st', '4MTB1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1323300793', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2599, 'MD. MEHEDI HASAN', '628251', ' 1502184108', '21-22', '4th', 'KPI', '1st', '4MTB1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1713698549', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2600, 'SHADHIN BISWAS', '628253', ' 1502184107', '21-22', '4th', 'KPI', '1st', '4MTB1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1315429989', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2601, 'RAKIBUL ISLAM', '628254', ' 1502184106', '21-22', '4th', 'KPI', '1st', '4MTB1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1757915977', '2024-01-13 14:14:33', '2024-01-13 14:14:33'),
(2602, 'SHAIKH YAKIN AHMAD', '628255', ' 1502184105', '21-22', '4th', 'KPI', '1st', '4MTB1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1612695560', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2603, 'MD. SUNVER RAHMAN', '628256', ' 1502184104', '21-22', '4th', 'KPI', '1st', '4MTB1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1728848485', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2604, 'PROKAS BISWAS', '628258', ' 1502184103', '21-22', '4th', 'KPI', '1st', '4MTB1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1748072056', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2605, 'K M SHANTO', '628259', ' 1502184102', '21-22', '4th', 'KPI', '1st', '4MTB1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1301455125', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2606, 'MD. RIDOY CHOWDHURY', '628260', ' 1502184101', '21-22', '4th', 'KPI', '1st', '4MTB1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1754163122', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2607, 'MD. IMRAN MIA', '628262', ' 1502184100', '21-22', '4th', 'KPI', '1st', '4MTB1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1634591374', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2608, 'MD SOIKOT ISLAM SHUVO', '628263', ' 1502184099', '21-22', '4th', 'KPI', '1st', '4MTB1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1645405964', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2609, 'JOYA KHATUN', '628264', ' 1502184098', '21-22', '4th', 'KPI', '1st', '4MTB1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1948357456', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2610, 'MD. MIKRAIL HOSSAIN', '628266', ' 1502184096', '21-22', '4th', 'KPI', '1st', '4MTB1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1971331645', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2611, 'MESBAUL HAQUE RIDOY', '628268', ' 1502184095', '21-22', '4th', 'KPI', '1st', '4MTB1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1885594981', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2612, 'MD. FAHIM HASAN', '628269', ' 1502184094', '21-22', '4th', 'KPI', '1st', '4MTB1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1309375129', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2613, 'HASAN ALI', '628270', ' 1502184093', '21-22', '4th', 'KPI', '1st', '4MTB1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1730608272', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2614, 'MD. SAHUL AHAMMED', '628271', ' 1502184092', '21-22', '4th', 'KPI', '1st', '4MTB1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1759974385', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2615, 'MD. MUSFIQUR RAHMAN', '628273', ' 1502184090', '21-22', '4th', 'KPI', '1st', '4MTB1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1301094934', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2616, 'MD. IKBAL MAHMUD SAJIB', '628274', ' 1502184089', '21-22', '4th', 'KPI', '1st', '4MTB1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1408639746', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2617, 'MD. SHAMOL HOSSAIN', '628277', ' 1502184087', '21-22', '4th', 'KPI', '1st', '4MTB1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1927136125', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2618, 'MD. ZEHADMEYA SHAOWN', '628279', ' 1502184086', '21-22', '4th', 'KPI', '1st', '4MTB1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1302797543', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2619, 'MD. JANNAT ALI', '628280', ' 1502184085', '21-22', '4th', 'KPI', '1st', '4MTB1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1968033706', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2620, 'MD. MASUM RANA', '628281', ' 1502184084', '21-22', '4th', 'KPI', '1st', '4MTB1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1989476019', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2621, 'PREMA YESMIN', '628292', ' 1502184078', '21-22', '4th', 'KPI', '1st', '4MTB1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1718452711', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2622, 'KHONDOKAR MAHBUB MURSHED UDAY', '628293', ' 1502184077', '21-22', '4th', 'KPI', '1st', '4MTB1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1960705546', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2623, 'MD. EMON HOSSAIN', '628295', ' 1502184075', '21-22', '4th', 'KPI', '1st', '4MTB1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1323763555', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2624, 'MD. JUBAEIR ALI', '628296', ' 1502184074', '21-22', '4th', 'KPI', '1st', '4MTB1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1798119022', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2625, 'MD. RABBY KHAN DURJOY', '628297', '1502184073', '21-22', '4th', 'KPI', '1st', '4MTB1', NULL, 'Mechanical', '2022', 'Regular', NULL, '1883480045', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2626, 'MD. ABDULLAH MONDOL', '636850', '1502190555', '21-22', '4th', 'KPI', '1st', '4MTB1', NULL, 'Mechanical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2627, 'MD SADIKUR RAHMAN', '647287', '1502197917', '21-22', '4th', 'KPI', '1st', '4MTB1', NULL, 'Mechanical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2628, 'MD. SAIKAT ALI SARKER', '628298', ' 1502233856', '21-22', '4th', 'KPI', '2nd', '4MTA2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1705181505', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2629, 'MD. TOHIDUL ISLAM', '628299', ' 1502233855', '21-22', '4th', 'KPI', '2nd', '4MTA2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1871111759', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2630, 'PROTAY MONDOL', '628300', ' 1502184750', '21-22', '4th', 'KPI', '2nd', '4MTA2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1307050931', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2631, 'MD. AL AMIN SHEKH', '628301', ' 1502184749', '21-22', '4th', 'KPI', '2nd', '4MTA2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1773917801', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2632, 'MD. SIAM HOSSAIN', '628305', ' 1502184747', '21-22', '4th', 'KPI', '2nd', '4MTA2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1773986850', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2633, 'MD. TANVIR ISLAM', '628306', ' 1502184746', '21-22', '4th', 'KPI', '2nd', '4MTA2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1774716693', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2634, 'PRITOM KUNDU PAPAI', '628307', ' 1502184745', '21-22', '4th', 'KPI', '2nd', '4MTA2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1733013362', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2635, 'MD ASHRAFUL ISLAM', '628308', ' 1502184744', '21-22', '4th', 'KPI', '2nd', '4MTA2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1989932987', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2636, 'RITTUK AHMED RUDRO', '628315', ' 1502184739', '21-22', '4th', 'KPI', '2nd', '4MTA2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1915234447', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2637, 'MD. SOHAG', '628319', ' 1502184735', '21-22', '4th', 'KPI', '2nd', '4MTA2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1626437073', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2638, 'MD. REZAUL KARIM', '628320', ' 1502184734', '21-22', '4th', 'KPI', '2nd', '4MTA2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1744607653', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2639, 'MD. FAJLE RABBI', '628321', ' 1502184733', '21-22', '4th', 'KPI', '2nd', '4MTA2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1783319032', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2640, 'MD. NAHID PARVEZ', '628322', ' 1502184732', '21-22', '4th', 'KPI', '2nd', '4MTA2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1796230777', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2641, 'MD. ASHIKUL ISLAM', '628323', ' 1502184731', '21-22', '4th', 'KPI', '2nd', '4MTA2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1775642611', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2642, 'MD. SHAHRIAN SADDID SIHAB', '628324', ' 1502184730', '21-22', '4th', 'KPI', '2nd', '4MTA2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1765766045', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2643, 'MD. ABU KAYESH', '628327', ' 1502184728', '21-22', '4th', 'KPI', '2nd', '4MTA2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1872989360', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2644, 'MD. MEHEDI HASAN MAHI', '628328', ' 1502184727', '21-22', '4th', 'KPI', '2nd', '4MTA2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1711043607', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2645, 'MD. SHANTO BABU', '628329', ' 1502184726', '21-22', '4th', 'KPI', '2nd', '4MTA2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1307452943', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2646, 'MD. SHOEB AKTER JUEL', '628332', ' 1502184723', '21-22', '4th', 'KPI', '2nd', '4MTA2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1855348857', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2647, 'MD. SAMIUL ISLAM', '628336', ' 1502184721', '21-22', '4th', 'KPI', '2nd', '4MTA2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1302794385', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2648, 'SOJIB PAUL', '628337', ' 1502184720', '21-22', '4th', 'KPI', '2nd', '4MTA2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1745452122', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2649, 'MD. SHAMIM HOSSAIN', '628338', ' 1502184719', '21-22', '4th', 'KPI', '2nd', '4MTA2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1301592759', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2650, 'MD ALAMIN HOSSEN', '628343', ' 1502184717', '21-22', '4th', 'KPI', '2nd', '4MTA2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1797355099', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2651, 'MD. SHAFIUL ISLAM', '628345', ' 1502184716', '21-22', '4th', 'KPI', '2nd', '4MTA2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1759222917', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2652, 'MD. ABDULLAH AL SABIT', '628346', ' 1502184715', '21-22', '4th', 'KPI', '2nd', '4MTA2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1711579884', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2653, 'MD.ASHIKUR JAMAN', '628349', ' 1502184714', '21-22', '4th', 'KPI', '2nd', '4MTA2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1817163752', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2654, 'FOYSAL HOSSEN FUAD', '628353', ' 1502184712', '21-22', '4th', 'KPI', '2nd', '4MTA2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1743105340', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2655, 'MD. SHABBIR HOSEN', '628357', ' 1502184709', '21-22', '4th', 'KPI', '2nd', '4MTA2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1775163940', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2656, 'MD. KAMRUZZAMAN KAFI', '628358', ' 1502184708', '21-22', '4th', 'KPI', '2nd', '4MTA2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1994156880', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2657, 'MD. SHOHAG ALI', '628363', ' 1502184704', '21-22', '4th', 'KPI', '2nd', '4MTA2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1705000237', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2658, 'SEZAN AHMED', '634216', '1502188509', '2122', '4th', 'KPI', '2nd', '4MTA2', NULL, 'Mechanical', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2659, 'MD. NAFIZ IQBAL', '628366', ' 1502184702', '21-22', '4th', 'KPI', '2nd', '4MTB2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1744132325', '2024-01-13 14:14:34', '2024-01-13 14:14:34');
INSERT INTO `exam_students` (`id`, `name`, `roll`, `reg_no`, `session`, `semester`, `institute`, `shift`, `student_group`, `ref_subject`, `technology`, `probidhan`, `status`, `remarks`, `mobile`, `created_at`, `updated_at`) VALUES
(2660, 'MD. MANIK RATON SUMON', '628368', ' 1502184701', '21-22', '4th', 'KPI', '2nd', '4MTB2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1826116480', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2661, 'MD. SHAKIB HASSAN', '628369', ' 1502184700', '21-22', '4th', 'KPI', '2nd', '4MTB2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1766527394', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2662, 'YASIN ARAFAT', '628372', ' 1502184698', '21-22', '4th', 'KPI', '2nd', '4MTB2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1304178898', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2663, 'MD. TANVIR AHMED', '628373', '1502184697', '21-22', '4th', 'KPI', '2nd', '4MTB2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1783600394', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2664, 'MD. ESOB PK', '628375', ' 1502184696', '21-22', '4th', 'KPI', '2nd', '4MTB2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1966949364', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2665, 'MD.RAYHAN HOSSEN', '628376', ' 1502184695', '21-22', '4th', 'KPI', '2nd', '4MTB2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1795748785', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2666, 'AL AHMED SHANTO', '628377', ' 1502184694', '21-22', '4th', 'KPI', '2nd', '4MTB2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1778029394', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2667, 'ASRAFUL ISLAM', '628378', ' 1502184693', '21-22', '4th', 'KPI', '2nd', '4MTB2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1608815128', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2668, 'MD. RAKIBUL ISLAM', '628381', ' 1502184692', '21-22', '4th', 'KPI', '2nd', '4MTB2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1790386836', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2669, 'MD. RONJU HOSEN', '628383', ' 1502184691', '21-22', '4th', 'KPI', '2nd', '4MTB2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1787525338', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2670, 'BADHON KUMER BISWAS', '628391', ' 1502184688', '21-22', '4th', 'KPI', '2nd', '4MTB2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1734759957', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2671, 'SABINA YASMIN ZIM', '628395', ' 1502184687', '21-22', '4th', 'KPI', '2nd', '4MTB2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1904370755', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2672, 'JANNATUL FARDOUS ANONNA', '628396', ' 1502184686', '21-22', '4th', 'KPI', '2nd', '4MTB2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1310894030', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2673, 'MD. SABBIR HOSSAIN', '628397', '1502184685', '21-22', '4th', 'KPI', '2nd', '4MTB2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1795450517', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2674, 'SHUVO AHAMMED', '628400', ' 1502184684', '21-22', '4th', 'KPI', '2nd', '4MTB2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1304213669', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2675, 'MD. SAKIBUL ISLAM', '628402', ' 1502184682', '21-22', '4th', 'KPI', '2nd', '4MTB2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1770537029', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2676, 'TOUFIQ AHOMMOD', '628406', ' 1502184681', '21-22', '4th', 'KPI', '2nd', '4MTB2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1759209921', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2677, 'MD. SAMIUL HAQUE', '628413', ' 1502184680', '21-22', '4th', 'KPI', '2nd', '4MTB2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1984576176', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2678, 'ROMON KUMAR KUNDU', '628414', ' 1502184679', '21-22', '4th', 'KPI', '2nd', '4MTB2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1319765867', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2679, 'HRIDOY HOSSEN', '628416', ' 1502184678', '21-22', '4th', 'KPI', '2nd', '4MTB2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1734840668', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2680, 'MD SULYMAN AHMED', '628417', ' 1502184677', '21-22', '4th', 'KPI', '2nd', '4MTB2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1893170696', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2681, 'SAMIRA CHOWDHURY MUMU', '628420', ' 1502184675', '21-22', '4th', 'KPI', '2nd', '4MTB2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1765084011', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2682, 'MD. NISHAN', '628421', '1502184674', '21-22', '4th', 'KPI', '2nd', '4MTB2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1400914368', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2683, 'MD. IKTIAR HOSSAIN', '628423', ' 1502184673', '21-22', '4th', 'KPI', '2nd', '4MTB2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1797236874', '2024-01-13 14:14:34', '2024-01-13 14:14:34'),
(2684, 'MD. SHIHAB UDDIN', '628424', ' 1502184672', '21-22', '4th', 'KPI', '2nd', '4MTB2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1309543192', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2685, 'MD. ONTOR ALI', '628425', '1502184671', '21-22', '4th', 'KPI', '2nd', '4MTB2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1725272703', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2686, 'BONHE AKTHER SHOVA', '628426', ' 1502184670', '21-22', '4th', 'KPI', '2nd', '4MTB2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1747711964', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2687, 'MD.IYASIR ARAFAT ABIR', '628431', ' 1502184668', '21-22', '4th', 'KPI', '2nd', '4MTB2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1703351356', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2688, 'AOPU SAHA', '628432', ' 1502184667', '21-22', '4th', 'KPI', '2nd', '4MTB2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1743409396', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2689, 'MD SHAKIBUL ISLAM', '628434', ' 1502184666', '21-22', '4th', 'KPI', '2nd', '4MTB2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1904369580', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2690, 'MD. ABIR MOLLA', '628441', ' 1502184663', '21-22', '4th', 'KPI', '2nd', '4MTB2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1879293758', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2691, 'MD. SABBIR HOSSAIN', '628452', '1502184658', '21-22', '4th', 'KPI', '2nd', '4MTB2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1851010144', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2692, 'MD.JAHIDUL ISLAM', '628453', ' 1502184657', '21-22', '4th', 'KPI', '2nd', '4MTB2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1310459780', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2693, 'MD. JILHOZ HOSSAIN', '628454', ' 1502184656', '21-22', '4th', 'KPI', '2nd', '4MTB2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1405198441', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2694, 'MD. SUMON ALI', '628455', ' 1502184655', '21-22', '4th', 'KPI', '2nd', '4MTB2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1725559360', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2695, 'SREE APON KUMAR KORMOKAR', '628456', ' 1502184654', '21-22', '4th', 'KPI', '2nd', '4MTB2', NULL, 'Mechanical', '2022', 'Regular', NULL, '1726931476', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2696, 'MD. AL MAMUN', '190101', '1500993171', '21-22', '4th', 'KPI', '1st', '4PTA1', NULL, 'Power', '2022', 'Regular', NULL, '1568993710', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2697, 'ORIJIT KUNDU', '190102', '1500993172', '21-22', '4th', 'KPI', '1st', '4PTA1', NULL, 'Power', '2022', 'Regular', NULL, '1912717036', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2698, 'MD. RASEL ISLAM', '531054', '1502106344', '20-21', '4th', 'KPI', '1st', '4PTA1', NULL, 'Power', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2699, 'MD. RUBEL HOSSAIN', '628463', ' 1502184263', '21-22', '4th', 'KPI', '1st', '4PTA1', NULL, 'Power', '2022', 'Regular', NULL, '1765968557', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2700, 'KAZI NABILA HAQUE', '628466', ' 1502184262', '21-22', '4th', 'KPI', '1st', '4PTA1', NULL, 'Power', '2022', 'Regular', NULL, '1772522650', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2701, 'MARUF HOSSAIN', '628468', ' 1502184261', '21-22', '4th', 'KPI', '1st', '4PTA1', NULL, 'Power', '2022', 'Regular', NULL, '1889951203', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2702, 'MD. NASIM UDDIN', '628474', ' 1502184257', '21-22', '4th', 'KPI', '1st', '4PTA1', NULL, 'Power', '2022', 'Regular', NULL, '1767825200', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2703, 'SABBIR HOSSAIN', '628477', ' 1502184255', '21-22', '4th', 'KPI', '1st', '4PTA1', NULL, 'Power', '2022', 'Regular', NULL, '1782322299', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2704, 'MD.SAJIB', '628480', ' 1502184253', '21-22', '4th', 'KPI', '1st', '4PTA1', NULL, 'Power', '2022', 'Regular', NULL, '1925498107', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2705, 'MD. MAHABUBUR RAHMAN', '628481', ' 1502184252', '21-22', '4th', 'KPI', '1st', '4PTA1', NULL, 'Power', '2022', 'Regular', NULL, '1884613969', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2706, 'MD. SAIF HOSSEN', '628482', ' 1502184251', '21-22', '4th', 'KPI', '1st', '4PTA1', NULL, 'Power', '2022', 'Regular', NULL, '1819692226', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2707, 'ALAUDDIN AHMED ADDIN', '628485', ' 1502184249', '21-22', '4th', 'KPI', '1st', '4PTA1', NULL, 'Power', '2022', 'Regular', NULL, '1595680632', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2708, 'MD ARAK HASAN ARPAN', '628486', ' 1502184248', '21-22', '4th', 'KPI', '1st', '4PTA1', NULL, 'Power', '2022', 'Regular', NULL, '1942368544', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2709, 'SHIKDAR BARKAT SANIM', '628488', ' 1502184247', '21-22', '4th', 'KPI', '1st', '4PTA1', NULL, 'Power', '2022', 'Regular', NULL, '1828908984', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2710, 'MD. ROHUL AMIN', '628489', ' 1502184246', '21-22', '4th', 'KPI', '1st', '4PTA1', NULL, 'Power', '2022', 'Regular', NULL, '1787701704', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2711, 'MD. ALIF AHMED', '628491', ' 1502184244', '21-22', '4th', 'KPI', '1st', '4PTA1', NULL, 'Power', '2022', 'Regular', NULL, '1627778345', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2712, 'MIR NAZMUS SA ADA NOMAN', '628497', ' 1502184240', '21-22', '4th', 'KPI', '1st', '4PTA1', NULL, 'Power', '2022', 'Regular', NULL, '1783857806', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2713, 'ASHIKUR RAHMAN AMIT', '628498', ' 1502184239', '21-22', '4th', 'KPI', '1st', '4PTA1', NULL, 'Power', '2022', 'Regular', NULL, '1756890065', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2714, 'MD. KHAIRUL ISLAM', '628502', ' 1502184236', '21-22', '4th', 'KPI', '1st', '4PTA1', NULL, 'Power', '2022', 'Regular', NULL, '1798665717', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2715, 'MD. HABIBUR RAHMAN', '628504', ' 1502184235', '21-22', '4th', 'KPI', '1st', '4PTA1', NULL, 'Power', '2022', 'Regular', NULL, '1930691134', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2716, 'AKIBUR RAHMAN ARJU', '628505', ' 1502184234', '21-22', '4th', 'KPI', '1st', '4PTA1', NULL, 'Power', '2022', 'Regular', NULL, '1752256880', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2717, 'MD. HAMIM AHMAD', '628507', ' 1502184232', '21-22', '4th', 'KPI', '1st', '4PTA1', NULL, 'Power', '2022', 'Regular', NULL, '1407077359', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2718, 'MD.RIHAZUL ISLAM', '628508', ' 1502184231', '21-22', '4th', 'KPI', '1st', '4PTA1', NULL, 'Power', '2022', 'Regular', NULL, '1705833626', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2719, 'MD. SOBUZ ISLAM', '628509', ' 1502184230', '21-22', '4th', 'KPI', '1st', '4PTA1', NULL, 'Power', '2022', 'Regular', NULL, '1798792132', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2720, 'MD. JIHAD', '628512', ' 1502184229', '21-22', '4th', 'KPI', '1st', '4PTA1', NULL, 'Power', '2022', 'Regular', NULL, '1613931619', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2721, 'UDAY SAHA', '628513', ' 1502184228', '21-22', '4th', 'KPI', '1st', '4PTA1', NULL, 'Power', '2022', 'Regular', NULL, '1755481879', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2722, 'SYADA BINTA SALAUDDIN', '628515', ' 1502184227', '21-22', '4th', 'KPI', '1st', '4PTA1', NULL, 'Power', '2022', 'Regular', NULL, '1558388590', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2723, 'TOWFIQ ELAIHE', '628516', ' 1502184226', '21-22', '4th', 'KPI', '1st', '4PTA1', NULL, 'Power', '2022', 'Regular', NULL, '1637879696', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2724, 'MD SAGOR HOSSEN', '628517', ' 1502184225', '21-22', '4th', 'KPI', '1st', '4PTA1', NULL, 'Power', '2022', 'Regular', NULL, '1798310712', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2725, 'MD. SUJON HOSSEN', '628521', ' 1502184222', '21-22', '4th', 'KPI', '1st', '4PTA1', NULL, 'Power', '2022', 'Regular', NULL, '1988111333', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2726, 'ANIKA NAWER SUCHANA', '628525', ' 1502184219', '21-22', '4th', 'KPI', '1st', '4PTA1', NULL, 'Power', '2022', 'Regular', NULL, '1710628168', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2727, 'MD.RUHUL AMIN.', '628526', ' 1502184218', '21-22', '4th', 'KPI', '1st', '4PTA1', NULL, 'Power', '2022', 'Regular', NULL, '1776260566', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2728, 'MD.SHAIFUL ISLAM', '634327', '1502188030', '2122', '4th', 'KPI', '1st', '4PTA1', NULL, 'Power', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2729, 'BADHON KUMAR', '628528', ' 1502184216', '21-22', '4th', 'KPI', '1st', '4PTB1', NULL, 'Power', '2022', 'Regular', NULL, '1703560593', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2730, 'MD. PIYAS MONDOL', '628531', ' 1502184213', '21-22', '4th', 'KPI', '1st', '4PTB1', NULL, 'Power', '2022', 'Regular', NULL, '1920637218', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2731, 'SAJIM ISLAM SIMANTO', '628534', ' 1502184212', '21-22', '4th', 'KPI', '1st', '4PTB1', NULL, 'Power', '2022', 'Regular', NULL, '1321189783', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2732, 'SAIFULLAH KHALID', '628535', ' 1502184211', '21-22', '4th', 'KPI', '1st', '4PTB1', NULL, 'Power', '2022', 'Regular', NULL, '1614783126', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2733, 'MD. SAIDUR RAHMAN', '628537', ' 1502184210', '21-22', '4th', 'KPI', '1st', '4PTB1', NULL, 'Power', '2022', 'Regular', NULL, '1902176678', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2734, 'NAEM AHMED', '628538', ' 1502184209', '21-22', '4th', 'KPI', '1st', '4PTB1', NULL, 'Power', '2022', 'Regular', NULL, '1302790191', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2735, 'MD. RIFAT AHAMMED', '628539', ' 1502184208', '21-22', '4th', 'KPI', '1st', '4PTB1', NULL, 'Power', '2022', 'Regular', NULL, '1609175426', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2736, 'MD. MURSHED ALI', '628543', ' 1502184205', '21-22', '4th', 'KPI', '1st', '4PTB1', NULL, 'Power', '2022', 'Regular', NULL, '1927042674', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2737, 'ROTAN SARKAR', '628548', ' 1502184201', '21-22', '4th', 'KPI', '1st', '4PTB1', NULL, 'Power', '2022', 'Regular', NULL, '1738531856', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2738, 'ZIHAD PARVEJ', '628549', ' 1502184200', '21-22', '4th', 'KPI', '1st', '4PTB1', NULL, 'Power', '2022', 'Regular', NULL, '1791144761', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2739, 'AYESHA AKTER', '628550', ' 1502184199', '21-22', '4th', 'KPI', '1st', '4PTB1', NULL, 'Power', '2022', 'Regular', NULL, '1734053540', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2740, 'MD.AHASANUL HOQUE IKBOLL', '628551', ' 1502184198', '21-22', '4th', 'KPI', '1st', '4PTB1', NULL, 'Power', '2022', 'Regular', NULL, '1406701940', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2741, 'MD. RABBI BISWAS', '628553', ' 1502184197', '21-22', '4th', 'KPI', '1st', '4PTB1', NULL, 'Power', '2022', 'Regular', NULL, '1983371893', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2742, 'HASAN EMAM ORNOB', '628555', ' 1502184195', '21-22', '4th', 'KPI', '1st', '4PTB1', NULL, 'Power', '2022', 'Regular', NULL, '1888361539', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2743, 'MD. AMID HASAN TUTUL', '628556', ' 1502184194', '21-22', '4th', 'KPI', '1st', '4PTB1', NULL, 'Power', '2022', 'Regular', NULL, '1863485448', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2744, 'MST.SUMAIYA AKTHER', '628557', ' 1502184193', '21-22', '4th', 'KPI', '1st', '4PTB1', NULL, 'Power', '2022', 'Regular', NULL, '1781415371', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2745, 'MD.MUBIN HOSSAIN', '628558', ' 1502184192', '21-22', '4th', 'KPI', '1st', '4PTB1', NULL, 'Power', '2022', 'Regular', NULL, '1711395298', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2746, 'UMMA SIDDIKA', '628561', ' 1502184191', '21-22', '4th', 'KPI', '1st', '4PTB1', NULL, 'Power', '2022', 'Regular', NULL, '1880897702', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2747, 'MD. SAZZAD HOSSAIN', '628573', ' 1502184187', '21-22', '4th', 'KPI', '1st', '4PTB1', NULL, 'Power', '2022', 'Regular', NULL, '..', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2748, 'MST.LISAT MONI AKTER LISA', '628577', ' 1502184185', '21-22', '4th', 'KPI', '1st', '4PTB1', NULL, 'Power', '2022', 'Regular', NULL, '1312845631', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2749, 'MUHTASIN ISLAM TOTON', '628581', ' 1502184184', '21-22', '4th', 'KPI', '1st', '4PTB1', NULL, 'Power', '2022', 'Regular', NULL, '1717362577', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2750, 'MD. ASHRAFUL ISLAM', '628584', ' 1502184183', '21-22', '4th', 'KPI', '1st', '4PTB1', NULL, 'Power', '2022', 'Regular', NULL, '1315878827', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2751, 'SNEHA SULTANA', '628589', ' 1502184181', '21-22', '4th', 'KPI', '1st', '4PTB1', NULL, 'Power', '2022', 'Regular', NULL, '1793825639', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2752, 'TANJINA TAPSI TINA', '628594', ' 1502184180', '21-22', '4th', 'KPI', '1st', '4PTB1', NULL, 'Power', '2022', 'Regular', NULL, '1782864676', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2753, 'MD. SAHED', '628597', ' 1502184179', '21-22', '4th', 'KPI', '1st', '4PTB1', NULL, 'Power', '2022', 'Regular', NULL, '1743441903', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2754, 'MD. SHOWN KHOLIFA', '628605', ' 1502184175', '21-22', '4th', 'KPI', '1st', '4PTB1', NULL, 'Power', '2022', 'Regular', NULL, '1866071556', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2755, 'MD. DOYAL SHEKH', '628611', ' 1502184174', '21-22', '4th', 'KPI', '1st', '4PTB1', NULL, 'Power', '2022', 'Regular', NULL, '1825457465', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2756, 'MD.RAKIB HASAN', '628616', ' 1502184172', '21-22', '4th', 'KPI', '1st', '4PTB1', NULL, 'Power', '2022', 'Regular', NULL, '1533029352', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2757, 'PROSHAD ROY JOY', '628621', ' 1502184170', '21-22', '4th', 'KPI', '1st', '4PTB1', NULL, 'Power', '2022', 'Regular', NULL, '1752717886', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2758, 'RAMZAN UZZAMAN ROHAN', '628624', ' 1502184168', '21-22', '4th', 'KPI', '1st', '4PTB1', NULL, 'Power', '2022', 'Regular', NULL, '1758721643', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2759, 'MD TANVIR ISLAM JIBON', '426955', '1502052179', '19-20', '4th', 'KPI', '2nd', '4PTA2', NULL, 'Power', '2016', 'Regular', NULL, 'Connection', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2760, 'MD. RAKIB HOSSAIN SHUVO', '628636', ' 1502184846', '21-22', '4th', 'KPI', '2nd', '4PTA2', NULL, 'Power', '2022', 'Regular', NULL, '1816558662', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2761, 'MAHADI HASAN MIM', '628637', ' 1502184845', '21-22', '4th', 'KPI', '2nd', '4PTA2', NULL, 'Power', '2022', 'Regular', NULL, '1712562261', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2762, 'SADMAN SAKIB BADHAN', '628641', ' 1502184844', '21-22', '4th', 'KPI', '2nd', '4PTA2', NULL, 'Power', '2022', 'Regular', NULL, '1822626777', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2763, 'MD. NAZMUL HAQUE', '628657', ' 1502184841', '21-22', '4th', 'KPI', '2nd', '4PTA2', NULL, 'Power', '2022', 'Regular', NULL, '1301223668', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2764, 'MD.RANJU HOSSAIN', '628661', ' 1502184839', '21-22', '4th', 'KPI', '2nd', '4PTA2', NULL, 'Power', '2022', 'Regular', NULL, '1910743067', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2765, 'RAHAD HOSSAIN', '628682', ' 1502184833', '21-22', '4th', 'KPI', '2nd', '4PTA2', NULL, 'Power', '2022', 'Regular', NULL, '1766979560', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2766, 'MD. SHAHINUR RAHMAN', '628684', ' 1502184832', '21-22', '4th', 'KPI', '2nd', '4PTA2', NULL, 'Power', '2022', 'Regular', NULL, '1870371530', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2767, 'MD. NAZMUL HASAN', '628689', ' 1502184831', '21-22', '4th', 'KPI', '2nd', '4PTA2', NULL, 'Power', '2022', 'Regular', NULL, '1400225685', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2768, 'MD.. HADI LIKHON', '628716', ' 1502184822', '21-22', '4th', 'KPI', '2nd', '4PTA2', NULL, 'Power', '2022', 'Regular', NULL, '1735206146', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2769, 'SHAIKH TAHMIDUR RAHMAN', '628718', ' 1502184820', '21-22', '4th', 'KPI', '2nd', '4PTA2', NULL, 'Power', '2022', 'Regular', NULL, '1312522916', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2770, 'BADHON GHOSH', '628729', ' 1502184816', '21-22', '4th', 'KPI', '2nd', '4PTA2', NULL, 'Power', '2022', 'Regular', NULL, '1710744761', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2771, 'MD. SAFATUR RAHMAN SHOUN', '628731', ' 1502184814', '21-22', '4th', 'KPI', '2nd', '4PTA2', NULL, 'Power', '2022', 'Regular', NULL, '1796483639', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2772, 'MD. MUNTASIR RAHMAN', '628732', ' 1502184813', '21-22', '4th', 'KPI', '2nd', '4PTA2', NULL, 'Power', '2022', 'Regular', NULL, '1710118548', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2773, 'MD. ATIK UZ ZAMAN', '628738', ' 1502184808', '21-22', '4th', 'KPI', '2nd', '4PTA2', NULL, 'Power', '2022', 'Regular', NULL, '1759636083', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2774, 'SHAMIM MOLLA', '628739', ' 1502184807', '21-22', '4th', 'KPI', '2nd', '4PTA2', NULL, 'Power', '2022', 'Regular', NULL, '1627105171', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2775, 'MD. JONY AHMED', '628740', ' 1502184806', '21-22', '4th', 'KPI', '2nd', '4PTA2', NULL, 'Power', '2022', 'Regular', NULL, '1758931414', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2776, 'MIR FAYSAL', '628742', ' 1502184804', '21-22', '4th', 'KPI', '2nd', '4PTA2', NULL, 'Power', '2022', 'Regular', NULL, '1881623559', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2777, 'MD. KAMRUL HASAN', '682851', '1502227201', '21-22', '4th', 'KPI', '2nd', '4PTA2', NULL, 'Power', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2778, 'MD. ASIF RAHMAN', '628743', ' 1502184803', '21-22', '4th', 'KPI', '2nd', '4PTB2', NULL, 'Power', '2022', 'Regular', NULL, '1741796793', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2779, 'AL-AMIN SHEIKH', '628744', ' 1502184802', '21-22', '4th', 'KPI', '2nd', '4PTB2', NULL, 'Power', '2022', 'Regular', NULL, '1768610895', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2780, 'MD. SHAJID HASAN', '628745', ' 1502184801', '21-22', '4th', 'KPI', '2nd', '4PTB2', NULL, 'Power', '2022', 'Regular', NULL, '1889612513', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2781, 'MD. FERDOUS OAHED NELOY', '628746', ' 1502184800', '21-22', '4th', 'KPI', '2nd', '4PTB2', NULL, 'Power', '2022', 'Regular', NULL, '1765028114', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2782, 'MD.AZMAIN FAYAK', '628748', ' 1502184798', '21-22', '4th', 'KPI', '2nd', '4PTB2', NULL, 'Power', '2022', 'Regular', NULL, '1701967248', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2783, 'MD. EMON HOSSAIN', '628754', ' 1502184792', '21-22', '4th', 'KPI', '2nd', '4PTB2', NULL, 'Power', '2022', 'Regular', NULL, '1725636019', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2784, 'M.MAHMUD HOSEN', '628758', ' 1502184788', '21-22', '4th', 'KPI', '2nd', '4PTB2', NULL, 'Power', '2022', 'Regular', NULL, '1770108704', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2785, 'MD. SAJNUJ ALI TALHA', '628759', ' 1502184787', '21-22', '4th', 'KPI', '2nd', '4PTB2', NULL, 'Power', '2022', 'Regular', NULL, '1825582401', '2024-01-13 14:14:35', '2024-01-13 14:14:35'),
(2786, 'TAMIM ISLAM BADHUN', '628769', ' 1502184777', '21-22', '4th', 'KPI', '2nd', '4PTB2', NULL, 'Power', '2022', 'Regular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2787, 'MD. ABDUL BASED', '628770', ' 1502184776', '21-22', '4th', 'KPI', '2nd', '4PTB2', NULL, 'Power', '2022', 'Regular', NULL, '1776437136', '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2788, 'MD. RABBI', '628771', ' 1502184775', '21-22', '4th', 'KPI', '2nd', '4PTB2', NULL, 'Power', '2022', 'Regular', NULL, '1407825316', '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2789, 'MD. ERFAN KHAN', '628772', ' 1502184774', '21-22', '4th', 'KPI', '2nd', '4PTB2', NULL, 'Power', '2022', 'Regular', NULL, '1986120210', '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2790, 'MD. SHAHAN MALITHA', '628780', ' 1502184767', '21-22', '4th', 'KPI', '2nd', '4PTB2', NULL, 'Power', '2022', 'Regular', NULL, '1319593372', '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2791, 'MD. PAVEL SHAIKH', '628781', ' 1502184766', '21-22', '4th', 'KPI', '2nd', '4PTB2', NULL, 'Power', '2022', 'Regular', NULL, '1710034184', '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2792, 'MD. TOUFIK HASAN', '628785', ' 1502184762', '21-22', '4th', 'KPI', '2nd', '4PTB2', NULL, 'Power', '2022', 'Regular', NULL, '1917665520', '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2793, 'MD.SAKIB HOSSAIN', '628790', ' 1502184758', '21-22', '4th', 'KPI', '2nd', '4PTB2', NULL, 'Power', '2022', 'Regular', NULL, '1707661624', '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2794, 'THALHA ZUBAYER NABIL', '628792', ' 1502184756', '21-22', '4th', 'KPI', '2nd', '4PTB2', NULL, 'Power', '2022', 'Regular', NULL, '1728258270', '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2795, 'MD. ASMIM AZAM RATUL', '628793', ' 1502184755', '21-22', '4th', 'KPI', '2nd', '4PTB2', NULL, 'Power', '2022', 'Regular', NULL, '1304530158', '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2796, 'MD. BIPLOB ALI', '628795', ' 1502184753', '21-22', '4th', 'KPI', '2nd', '4PTB2', NULL, 'Power', '2022', 'Regular', NULL, '1601577286', '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2797, 'MD. RAHAMOTULLAH', '628796', ' 1502184752', '21-22', '4th', 'KPI', '2nd', '4PTB2', NULL, 'Power', '2022', 'Regular', NULL, '1967338381', '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2798, 'RANA AHMED', '425649', '1502050818', '19-20', '4th', 'KPI', '1st', '4CTA1', NULL, 'Civil', '2016', 'Regular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2799, 'AL SIAM', '186186', '1500987184', ' 2019', '4th', 'KPI', '2nd', '4CTA2', NULL, 'Civil', '2016', 'Regular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2800, 'MD. SHOHANUR ISLAM SOGOR', '530024', '1502106391', '20-21', '4th', 'KPI', '2nd', '4CTB2', NULL, 'Civil', '2016', 'Regular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2801, 'MST. TAHANA TABASSUM', '530192', '1502106579', '20-21', '4th', 'KPI', '2nd', '4CMTA2', NULL, 'Computer', '2016', 'Regular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2802, 'MD. ABU KAWCHER', '530209', '1502106562', '20-21', '4th', 'KPI', '2nd', '4CMTA2', NULL, 'Computer', '2016', 'Regular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2803, 'MST. SUROVI KHATUN', '530210', '1502106561', '20-21', '4th', 'KPI', '2nd', '4CMTA2', NULL, 'Computer', '2016', 'Regular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2804, 'MD.BIJOY HOSSAIN', '530297', '1502108244', '20-21', '4th', 'KPI', '2ND', '4ETA2', NULL, 'Electrical', '2016', 'Regular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2805, 'AL ZABIR ZIBON', '530498', '1502106628', '20-21', '4th', 'KPI', '2ND', '4ETB2', NULL, 'Electrical', '2016', 'Regular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2806, 'MD SYED HOSSEN', '530605', '1502106128', '20-21', '4th', 'KPI', '1st', '4ENTB1', NULL, 'Electronics', '2016', 'Regular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2807, 'JESMIN AKTER', '426615', '1502051930', '19-20', '4th', 'KPI', '2nd', '4ENTA2', NULL, 'Electronics', '2016', 'Regular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2808, 'ABU TAYIB', '530695', '1502106722', '20-21', '4th', 'KPI', '2ND', '4ENTB2', NULL, 'Electronics', '2016', 'Regular', NULL, '1726511954', '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2809, 'MD. TARIF AHMED', '531003', '1502123628', '20-21', '4th', 'KPI', '1st', '4PTA1', NULL, 'Power', '2016', 'Regular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2810, 'MD. RASEL SHEIKH', '426890', '1502051548', '19-20', '4th', 'KPI', '1st', '4PTB1', NULL, 'Power', '2016', 'Regular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2811, 'MD. RUBAYET AHMED', '434059', '1502055058', '19-20', '4th', 'KPI', '2nd', '4PTA2', NULL, 'Power', '2016', 'Regular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2812, 'ASHFAK RAHMAN SADI', '529870', '1502105830', '20-21', '4th', 'KPI', '1st', '4CTB1-IRR', NULL, 'Civil', '2022', 'Irregular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2813, 'MD.SAJEDUL SHEIKH', '530159', '1502105726', '20-21', '4th', 'KPI', '1st', '4CMTB1-IRR', NULL, 'Computer', '2022', 'Irregular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2814, 'MD. SHOWROV ANAM RAFI', '120411', '1500922575', '18-19', '4th', 'KPI', '2ND', '4CMTA2-IRR', NULL, 'Computer', '2022', 'Irregular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2815, 'MD. RAHAT RAHMAN', '530151', '1502105734', '20-21', '4th', 'KPI', '2ND', '4CMTA2-IRR', NULL, 'Computer', '2022', 'Irregular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2816, 'MD. NIDAL KHAN', '530152', '1502105733', '20-21', '4th', 'KPI', '2ND', '4CMTA2-IRR', NULL, 'Computer', '2022', 'Irregular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2817, 'SHADHIN AHMED', '530437', '1502105757', '20-21', '4th', 'KPI', '1ST', '4ETB1-IRR', NULL, 'Electrical', '2022', 'Irregular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2818, 'MD. MAFUZ AHMMED SHOVU', '530442', '1502105751', '20-21', '4th', 'KPI', '1ST', '4ETB1-IRR', NULL, 'Electrical', '2022', 'Irregular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2819, 'SHIMUL ISLAM', '530420', '1502105775', '20-21', '4th', 'KPI', '2ND', '4ETA2-IRR', NULL, 'Electrical', '2022', 'Irregular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2820, 'MOON MASRAFI', '530421', '1502105774', '20-21', '4th', 'KPI', '2ND', '4ETA2-IRR', NULL, 'Electrical', '2022', 'Irregular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2821, 'SIMANTO BISWAS', '530422', '1502105773', '20-21', '4th', 'KPI', '2ND', '4ETA2-IRR', NULL, 'Electrical', '2022', 'Irregular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2822, 'S. M. AL SHAHARIYA', '530454', '1502106672', '20-21', '4th', 'KPI', '2ND', '4ETA2-IRR', NULL, 'Electrical', '2022', 'Irregular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2823, 'SRABONE  KHATUN', '530469', '1502106657', '20-21', '4th', 'KPI', '2ND', '4ETA2-IRR', NULL, 'Electrical', '2022', 'Irregular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2824, 'MD. ABDULLA ALL RAFI', '530478', '1502106648', '20-21', '4th', 'KPI', '2ND', '4ETA2-IRR', NULL, 'Electrical', '2022', 'Irregular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2825, 'MD. BIDDUT HOSSAIN', '530484', '1502106642', '20-21', '4th', 'KPI', '2ND', '4ETB2-IRR', NULL, 'Electrical', '2022', 'Irregular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2826, 'MD. SHOVON HOSSAIN', '530493', '1502106633', '20-21', '4th', 'KPI', '2ND', '4ETB2-IRR', NULL, 'Electrical', '2022', 'Irregular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2827, 'NUSRAT JAHAN', '530500', '1502106626', '20-21', '4th', 'KPI', '2ND', '4ETB2-IRR', NULL, 'Electrical', '2022', 'Irregular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2828, 'HASAN AL BANNA', '122703', '1500925272', '18-19', '4th', 'KPI', '1st', '4ENTA1-IRR', NULL, 'Electronics', '2022', 'Irregular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2829, 'MD. ALHAJ HOSSAIN', '530549', '1502106184', '20-21', '4th', 'KPI', '1ST', '4ENTA1-IRR', NULL, 'Electronics', '2022', 'Irregular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2830, 'MD. HAMIM HOSSAIN', '530563', '1502106170', '20-21', '4th', 'KPI', '1ST', '4ENTA1-IRR', NULL, 'Electronics', '2022', 'Irregular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2831, 'MD. NAZMUL HOSSAIN', '530564', '1502106169', '20-21', '4th', 'KPI', '1ST', '4ENTA1-IRR', NULL, 'Electronics', '2022', 'Irregular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2832, 'MD MUNNA ALI', '530575', '1502106158', '20-21', '4th', 'KPI', '1ST', '4ENTA1-IRR', NULL, 'Electronics', '2022', 'Irregular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2833, 'MD.  RASHIDUL ISLAM RASHED', '426492', '1502051364', '19-20', '4th', 'KPI', '1st', '4ENTB1-IRR', NULL, 'Electronics', '2022', 'Irregular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2834, 'MD. MONU MIA', '530598', '1502106135', '20-21', '4th', 'KPI', '1ST', '4ENTB1-IRR', NULL, 'Electronics', '2022', 'Irregular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2835, 'MST. NAMIRA ARMIN MOULY', '426539', '1502052011', '19-20', '4th', 'KPI', '2nd', '4ENTA2-IRR', NULL, 'Electronics', '2022', 'Irregular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2836, 'SUMAYA AKTER', '426604', '1502051941', '19-20', '4th', 'KPI', '2ND', '4ENTA2-IRR', NULL, 'Electronics', '2022', 'Irregular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2837, 'MD. IMON ALI', '530642', '1502162294', '20-21', '4th', 'KPI', '2ND', '4ENTA2-IRR', NULL, 'Electronics', '2022', 'Irregular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2838, 'MD.MOSIUR RAHMAN SAHIKAT', '530644', '1502106773', '20-21', '4th', 'KPI', '2ND', '4ENTA2-IRR', NULL, 'Electronics', '2022', 'Irregular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2839, 'MD. NAIM UDDIN', '530653', '1502106764', '20-21', '4th', 'KPI', '2ND', '4ENTA2-IRR', NULL, 'Electronics', '2022', 'Irregular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2840, 'ANKUR KUMAR ROY', '530659', '1502106758', '20-21', '4th', 'KPI', '2ND', '4ENTA2-IRR', NULL, 'Electronics', '2022', 'Irregular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2841, 'HASIBUL ISLAM', '530660', '1502106757', '20-21', '4th', 'KPI', '2ND', '4ENTA2-IRR', NULL, 'Electronics', '2022', 'Irregular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2842, 'MD. IKRAM HOSSAIN ARAF', '535275', '1502111147', '20-21', '4th', 'KPI', '2ND', '4ENTA2-IRR', NULL, 'Electronics', '2022', 'Irregular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2843, 'MOYNUL HASSAN', '426597', '1502051948', '19-20', '4th', 'KPI', '2nd', '4ENTB2-IRR', NULL, 'Electronics', '2022', 'Irregular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2844, 'MD. ARAFAT ANANDO', '426623', '1502051920', '19-20', '4th', 'KPI', '2nd', '4ENTB2-IRR', NULL, 'Electronics', '2022', 'Irregular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2845, 'MD.AL WOASIP SHUVO', '530709', '1502106708', '20-21', '4th', 'KPI', '2ND', '4ENTB2-IRR', NULL, 'Electronics', '2022', 'Irregular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2846, 'SABBIR AHMED SHAON', '530713', '1502106704', '20-21', '4th', 'KPI', '2ND', '4ENTB2-IRR', NULL, 'Electronics', '2022', 'Irregular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2847, 'MIS.KAKOLI KHATUN', '122832', '1500925574', '18-19', '4th', 'KPI', '1ST', '4MTA1-IRR', NULL, 'Mechanical', '2022', 'Irregular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2848, 'MD. NAZZIL RAHMAN', '530859', '1502106196', '20-21', '4th', 'KPI', '1ST', '4MTB1-IRR', NULL, 'Mechanical', '2022', 'Irregular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2849, 'ALAMIN', '530902', '1502106861', '20-21', '4th', 'KPI', '2ND', '4MTA2-IRR', NULL, 'Mechanical', '2022', 'Irregular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2850, 'SUMAIYA AKTER TRISA', '326010', '274313', '16-17', '4th', 'KPI', '2nd', '4MTB2-IRR', NULL, 'Mechanical', '2022', 'Irregular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2851, 'MD. NAIMUL ISLAM', '530946', '1502106817', '20-21', '4th', 'KPI', '2ND', '4MTB2-IRR', NULL, 'Mechanical', '2022', 'Irregular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2852, 'MD. TAJBIUL HASAN', '530953', '1502106810', '20-21', '4th', 'KPI', '2ND', '4MTB2-IRR', NULL, 'Mechanical', '2022', 'Irregular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2853, 'SHAILA AKTER BITHE', '531027', '1502106371', '20-21', '4th', 'KPI', '1ST', '4PTA1-IRR', NULL, 'Power', '2022', 'Irregular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36'),
(2854, 'MD. IKRAM HOSSAIN', '531143', '1502106936', '20-21', '4th', 'KPI', '2ND', '4PTA2-IRR', NULL, 'Power', '2022', 'Irregular', NULL, NULL, '2024-01-13 14:14:36', '2024-01-13 14:14:36');

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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial` tinyint UNSIGNED DEFAULT '0',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `branch_id`, `name`, `serial`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'General', 1, 1, '2024-11-29 13:06:05', '2024-11-29 13:06:05');

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
(120, '2024_11_29_200008_create_group_configs_table', 48);

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
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(2, 1, 'Girls', 2, 1, '2024-11-29 12:47:26', '2024-11-29 12:47:26');

-- --------------------------------------------------------

--
-- Table structure for table `semesters`
--

CREATE TABLE `semesters` (
  `id` int UNSIGNED NOT NULL,
  `branch_id` int UNSIGNED DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_bn` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
(11, 1, NULL, 'Play', NULL, 1, 1, '2024-11-29 12:15:39', '2024-11-29 12:16:16');

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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial` tinyint UNSIGNED DEFAULT '0',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shifts`
--

INSERT INTO `shifts` (`id`, `branch_id`, `name`, `serial`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Day', 1, 1, '2024-11-29 12:37:12', '2024-11-29 12:37:12');

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
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `academicYear` smallint DEFAULT NULL,
  `others` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `branch_id`, `reg_no`, `class_roll`, `name`, `dateOfBirth`, `mobile`, `religion`, `section_id`, `semester_id`, `fathersName`, `mobileFather`, `mothersName`, `mobileMother`, `sex`, `presentVillage`, `presentPost`, `presentUpazila`, `presentZila`, `permanentVillage`, `permanentPost`, `permanentUpazila`, `permanentZila`, `studentBirthRegNo`, `shift_id`, `group_id`, `photo`, `session`, `Comment`, `jscBoard`, `jscResistration`, `jscExamYear`, `jscBoardRoll`, `jscCgpa`, `guardianName`, `mobileGuardian`, `guardianNID`, `guardianRelation`, `MISStudentID`, `Bank_Mobile`, `accountName`, `accountNumber`, `academicYear`, `others`, `created_at`, `updated_at`) VALUES
(1, 1, '20221001', 20221001, 'শাহাদৎ হোসেন', NULL, '01757839516', 'Islam', 1, 6, 'মোস্তফা কামাল', '01912624881', 'সাজেদা বেগম', '01912624882', 'Male', NULL, 'kharkhari', 545, 391, 'Kharkhari, Rajshahi', 'kharkhari', 545, 391, NULL, 1, 1, 'students/1707924977.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'মোস্তফা কামাল', '01912624883', '5465652623', 'Father', NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-07 03:59:48', '2024-02-14 15:36:17'),
(2, 1, '20223001', 20223001, 'Saima', '2014-07-10', '01757839516', 'Islam', 4, 1, 'Shahadat Hosain', '01757839516', 'Azmira Khatun', NULL, 'Female', 'নারিকেলবাড়িয়া', 'খড়খড়ি', 545, 391, 'নারিকেলবাড়িয়া', 'খড়খড়ি', 545, 391, NULL, 1, 1, 'students/1709823888.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-02 08:09:57', '2024-03-07 15:04:48'),
(3, 1, '20221011', 20221011, 'Mamun', '2022-08-09', '01757839516', 'Islam', 1, 2, 'Sumon', '01757839516', 'Azmira Khatun', '01757839516', 'Male', 'Kechuatoil', 'Kharkhari', 499, 380, 'Kechuatoil', 'Kharkhari', 405, 380, NULL, 1, 1, 'students/1709823983.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-02 08:13:59', '2024-03-07 15:06:23'),
(4, 1, '20221002', 20221002, 'Masun', '2022-11-15', '01757839516', NULL, 1, 2, 'Shahadat Hosain', 'বাংলাদেশি', 'Azmira Khatun', NULL, 'Male', 'Kechuatoil', 'Kharkhari', 403, 339, 'Kechuatoil', 'Kharkhari', 403, 339, NULL, 1, 1, NULL, '2022', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-02 08:17:39', '2024-01-09 03:04:32'),
(5, 1, '20172001', 20172001, 'Abu Ahmed Rafi', '2006-02-01', '01757839516', NULL, 2, 1, 'Azam Ali', 'বাংলাদেশি', 'Rojeda', NULL, 'Male', 'Bamon Sikor', 'kharkhari', 545, 391, 'Bamon Sikor', 'Kharkhari', 545, 391, NULL, 1, 1, NULL, '2017', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-06 01:33:02', '2024-01-09 03:04:32'),
(6, 1, '20172002', 20172002, 'Selim', '2014-07-10', '01757839516', NULL, 2, 1, 'Sumon', 'বাংলাদেশি', 'Mother', NULL, 'Male', 'Bamon Sikor', 'kharkhari', 545, 391, 'Bamon Sikor', 'Kharkhari', 545, 391, NULL, 1, 1, NULL, '2017', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-06 01:35:03', '2024-01-09 03:04:32'),
(7, 1, '20221003', 20221003, 'Masun', '2022-11-15', '01757839516', NULL, 1, 1, 'Shahadat Hosain', 'বাংলাদেশি', 'Azmira Khatun', NULL, 'Male', 'Kechuatoil', 'Kharkhari', 403, 339, 'Kechuatoil', 'Kharkhari', 403, 339, NULL, 1, 1, NULL, '2022', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-02 08:17:39', '2024-01-09 03:04:32'),
(8, 1, '20222001', 20222001, 'Nabila', '2023-01-01', '01757839516', NULL, 2, 1, 'Ahmen', NULL, 'Nipa', NULL, 'Female', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, '2022', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-17 10:35:22', '2024-01-09 03:04:32'),
(9, 1, '20203001', 20203001, 'Rikat', '2010-09-06', '01757839516', NULL, 3, 1, 'Rahat', 'Bangladeshi', 'nipa', NULL, 'Male', 'Kacutaol', 'kharkhari', 545, 391, 'Kacutaol', 'kharkhari', 545, 391, NULL, 1, 1, 'students/1693974450.jpg', '2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-09-06 04:27:30', '2024-01-09 03:04:32'),
(10, 1, '20231001', 20231001, 'Md. Nasiruddin', '1990-09-12', '01739201222', NULL, 1, 1, 'Rahat', 'Bangladeshi', 'nipa', NULL, 'Male', 'Kacutaol', 'kharkhari', 544, 391, 'Kacutaol', 'kharkhari', 403, 391, NULL, 1, 1, NULL, '2023', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-09-12 08:30:25', '2024-01-09 03:04:32'),
(12, 1, '56565656', 56565656, 'Mahfuz', NULL, '8801757839516', NULL, 1, 1, NULL, '1912624881', NULL, NULL, 'Male', 'soriotpur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, '2022', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-01 03:07:57', '2024-01-09 03:04:32');

-- --------------------------------------------------------

--
-- Table structure for table `student_marks`
--

CREATE TABLE `student_marks` (
  `id` bigint UNSIGNED NOT NULL,
  `semester_id` int UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL,
  `paid_confirm` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `paid_confirm_by` smallint UNSIGNED NOT NULL DEFAULT '0',
  `attendance` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `written_marks` decimal(5,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `oral_marks` decimal(5,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `total_marks` decimal(6,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `mark_entry_by` smallint UNSIGNED NOT NULL DEFAULT '0',
  `mark_locked` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `mark_locked_by` tinyint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_marks`
--

INSERT INTO `student_marks` (`id`, `semester_id`, `student_id`, `paid_confirm`, `paid_confirm_by`, `attendance`, `written_marks`, `oral_marks`, `total_marks`, `mark_entry_by`, `mark_locked`, `mark_locked_by`, `created_at`, `updated_at`) VALUES
(2, 1, 1, 1, 0, 50, '15.00', '15.00', '80.00', 0, 0, NULL, NULL, '2022-11-06 01:12:22'),
(3, 1, 2, 1, 0, 80, '80.00', '80.00', '240.00', 1, 0, NULL, '2022-11-02 08:09:57', '2023-09-27 05:09:03'),
(4, 1, 3, 1, 0, 50, '55.00', '60.00', '53.75', 1, 0, NULL, '2022-11-02 08:13:59', '2023-01-14 16:34:30'),
(5, 1, 4, 1, 0, 40, '20.00', '10.00', '70.00', 1, 0, NULL, '2022-11-02 08:17:39', '2023-01-14 16:43:56'),
(6, 2, 1, 0, 0, 50, '50.00', '50.00', '50.00', 0, 0, NULL, '2022-11-04 12:11:42', '2022-11-05 08:47:30'),
(7, 3, 1, 0, 0, 80, '80.00', '90.00', '82.50', 0, 0, NULL, '2022-11-04 12:22:35', '2022-11-05 08:48:23'),
(8, 4, 1, 0, 0, 60, '70.00', '50.00', '60.00', 0, 0, NULL, '2022-11-04 12:23:54', '2022-11-05 08:48:31'),
(10, 1, 5, 0, 0, 0, '0.00', '0.00', '0.00', 0, 0, NULL, '2022-11-06 01:33:02', '2022-11-06 01:33:02'),
(11, 1, 6, 0, 0, 0, '0.00', '0.00', '0.00', 0, 0, NULL, '2022-11-06 01:35:03', '2022-11-06 01:35:03'),
(12, 1, 7, 0, 0, 10, '10.00', '11.00', '31.00', 1, 0, NULL, '2022-11-02 08:17:39', '2023-01-15 03:29:38'),
(13, 2, 4, 0, 0, 0, '0.00', '0.00', '0.00', 0, 0, NULL, '2023-01-14 16:37:13', '2023-01-14 16:37:13'),
(14, 3, 4, 0, 0, 0, '0.00', '0.00', '0.00', 0, 0, NULL, '2023-01-14 16:38:41', '2023-01-14 16:38:41'),
(16, 1, 8, 0, 0, 0, '0.00', '0.00', '0.00', 0, 0, NULL, '2023-01-17 10:35:22', '2023-01-17 10:35:22'),
(17, 1, 9, 0, 0, 0, '0.00', '0.00', '0.00', 0, 0, NULL, '2023-09-06 04:27:30', '2023-09-06 04:27:30'),
(18, 1, 10, 0, 0, 0, '0.00', '0.00', '0.00', 0, 0, NULL, '2023-09-12 08:30:25', '2023-09-12 08:30:25'),
(19, 1, 11, 0, 0, 0, '0.00', '0.00', '0.00', 0, 0, NULL, '2023-12-25 05:14:10', '2023-12-25 05:14:10'),
(20, 1, 12, 0, 0, 0, '0.00', '0.00', '0.00', 0, 0, NULL, '2024-01-01 03:07:57', '2024-01-01 03:07:57'),
(21, 7, 2, 0, 0, 0, '0.00', '0.00', '0.00', 0, 0, NULL, '2024-01-07 05:13:59', '2024-01-07 05:13:59'),
(22, 8, 2, 0, 0, 0, '0.00', '0.00', '0.00', 0, 0, NULL, '2024-01-07 05:14:14', '2024-01-07 05:14:14');

-- --------------------------------------------------------

--
-- Table structure for table `student_payments`
--

CREATE TABLE `student_payments` (
  `id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL,
  `voucher_date` date NOT NULL,
  `invoice_head_id` int UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entry_by` smallint UNSIGNED NOT NULL,
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
(1, 2, 1),
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
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_halls`
--
ALTER TABLE `exam_halls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_hall_students`
--
ALTER TABLE `exam_hall_students`
  ADD UNIQUE KEY `exam_hall_students_exam_hall_id_student_id_unique` (`exam_hall_id`,`student_id`),
  ADD KEY `exam_hall_students_student_id_foreign` (`student_id`);

--
-- Indexes for table `exam_lists`
--
ALTER TABLE `exam_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_students`
--
ALTER TABLE `exam_students`
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
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `students_semester_id_index` (`semester_id`) USING BTREE;

--
-- Indexes for table `student_marks`
--
ALTER TABLE `student_marks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_marks_student_id_foreign` (`student_id`);

--
-- Indexes for table `student_payments`
--
ALTER TABLE `student_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_payments_invoice_head_id_foreign` (`invoice_head_id`),
  ADD KEY `student_payments_entry_by_foreign` (`entry_by`),
  ADD KEY `student_payments_student_id_index` (`student_id`);

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
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `class_configs`
--
ALTER TABLE `class_configs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_halls`
--
ALTER TABLE `exam_halls`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exam_lists`
--
ALTER TABLE `exam_lists`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_students`
--
ALTER TABLE `exam_students`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2855;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `group_configs`
--
ALTER TABLE `group_configs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `semesters`
--
ALTER TABLE `semesters`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `shifts`
--
ALTER TABLE `shifts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `student_marks`
--
ALTER TABLE `student_marks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `student_payments`
--
ALTER TABLE `student_payments`
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
-- Constraints for table `exam_hall_students`
--
ALTER TABLE `exam_hall_students`
  ADD CONSTRAINT `exam_hall_students_exam_hall_id_foreign` FOREIGN KEY (`exam_hall_id`) REFERENCES `exam_halls` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_hall_students_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `exam_students` (`id`) ON DELETE CASCADE;

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
-- Constraints for table `student_payments`
--
ALTER TABLE `student_payments`
  ADD CONSTRAINT `student_payments_entry_by_foreign` FOREIGN KEY (`entry_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `student_payments_invoice_head_id_foreign` FOREIGN KEY (`invoice_head_id`) REFERENCES `invoice_heads` (`id`),
  ADD CONSTRAINT `student_payments_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

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
