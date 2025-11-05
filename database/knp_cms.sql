-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2025 at 07:37 PM
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
-- Database: `knp_cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `certificates`
--

CREATE TABLE `certificates` (
  `cert_no` varchar(100) NOT NULL,
  `admission_no` varchar(50) NOT NULL,
  `cert_type` varchar(100) DEFAULT 'Artisan Certificate',
  `qualification_code` varchar(50) DEFAULT NULL,
  `qualification_type` varchar(100) DEFAULT NULL,
  `issue_date` date NOT NULL,
  `pdf_path` varchar(255) NOT NULL,
  `qr_path` varchar(255) NOT NULL,
  `status` enum('Issued','Revoked') DEFAULT 'Issued',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `certificates`
--

INSERT INTO `certificates` (`cert_no`, `admission_no`, `cert_type`, `qualification_code`, `qualification_type`, `issue_date`, `pdf_path`, `qr_path`, `status`, `created_at`) VALUES
('20250001', 'tknp/b/226', 'Course Completion', 'N/A', NULL, '2025-10-22', 'certificates/pdfs/20250001.pdf', 'certificates/qrcodes/20250001.png', 'Issued', '2025-10-22 09:13:55'),
('20250008', 'tknp/b/226', 'Course Completion', 'N/A', NULL, '2025-10-22', 'certificates/pdfs/20250008.pdf', 'certificates/qrcodes/20250008.png', 'Issued', '2025-10-22 13:27:23'),
('20250009', 'tknp/b/226', 'Course Completion', 'N/A', NULL, '2025-10-22', 'certificates/pdfs/20250009.pdf', 'certificates/qrcodes/20250009.png', 'Issued', '2025-10-22 13:34:24'),
('20250010', 'tknp/b/226', 'Course Completion', 'N/A', NULL, '2025-10-22', 'certificates/pdfs/20250010.pdf', 'certificates/qrcodes/20250010.png', 'Issued', '2025-10-22 13:34:39'),
('20250011', 'tknp/b/226', 'Course Completion', 'N/A', NULL, '2025-10-22', 'certificates/pdfs/20250011.pdf', 'certificates/qrcodes/20250011.png', 'Issued', '2025-10-22 13:34:56'),
('20250019', 'tknp/b/223', 'Course Completion', 'N/A', NULL, '2025-10-23', 'certificates/pdfs/20250019.pdf', 'certificates/qrcodes/20250019.png', 'Issued', '2025-10-23 09:22:57'),
('20250020', 'tknp/b/223', 'Course Completion', 'N/A', NULL, '2025-10-23', 'certificates/pdfs/20250020.pdf', 'certificates/qrcodes/20250020.png', 'Issued', '2025-10-23 09:26:08'),
('20250021', 'tknp/b/223', 'Course Completion', 'N/A', NULL, '2025-10-23', 'certificates/pdfs/20250021.pdf', 'certificates/qrcodes/20250021.png', 'Issued', '2025-10-23 09:29:16'),
('20250022', 'TKNP/D/1111', 'Course Completion', '333333', NULL, '2025-10-23', 'certificates/pdfs/20250022.pdf', 'certificates/qrcodes/20250022.png', 'Issued', '2025-10-23 11:14:26'),
('20250023', 'TKNP/D/1112', 'Course Completion', '333333', NULL, '2025-10-23', 'certificates/pdfs/20250023.pdf', 'certificates/qrcodes/20250023.png', 'Issued', '2025-10-23 11:14:26'),
('20250024', 'TKNP/D/1113', 'Course Completion', '333333', NULL, '2025-10-23', 'certificates/pdfs/20250024.pdf', 'certificates/qrcodes/20250024.png', 'Issued', '2025-10-23 11:14:26'),
('20250025', 'TKNP/D/1114', 'Course Completion', '333333', NULL, '2025-10-23', 'certificates/pdfs/20250025.pdf', 'certificates/qrcodes/20250025.png', 'Issued', '2025-10-23 11:14:27'),
('20250026', 'TKNP/D/1115', 'Course Completion', '333333', NULL, '2025-10-23', 'certificates/pdfs/20250026.pdf', 'certificates/qrcodes/20250026.png', 'Issued', '2025-10-23 11:16:32'),
('20250027', 'TKNP/D/1116', 'Course Completion', '333333', NULL, '2025-10-23', 'certificates/pdfs/20250027.pdf', 'certificates/qrcodes/20250027.png', 'Issued', '2025-10-23 11:16:32'),
('20250028', 'TKNP/D/1117', 'Course Completion', '333333', NULL, '2025-10-23', 'certificates/pdfs/20250028.pdf', 'certificates/qrcodes/20250028.png', 'Issued', '2025-10-23 11:16:33'),
('20250029', 'TKNP/D/1118', 'Course Completion', '333333', NULL, '2025-10-23', 'certificates/pdfs/20250029.pdf', 'certificates/qrcodes/20250029.png', 'Issued', '2025-10-23 11:16:33'),
('20250030', 'tknp/b/2232', 'Course Completion', '87666', NULL, '2025-10-23', 'certificates/pdfs/20250030.pdf', 'certificates/qrcodes/20250030.png', 'Issued', '2025-10-23 16:28:41'),
('20250032', 'tknp/b/2566', 'Course Completion', '87666', NULL, '2025-10-23', 'certificates/pdfs/20250032.pdf', 'certificates/qrcodes/20250032.png', 'Issued', '2025-10-23 16:33:00'),
('20250033', 'tknp/b/2288', 'Course Completion', '87666', NULL, '2025-10-23', 'certificates/pdfs/20250033.pdf', 'certificates/qrcodes/20250033.png', 'Issued', '2025-10-23 17:12:23'),
('20250034', 'tknp/b/2234', 'Course Completion', '87666', NULL, '2025-10-23', 'certificates/pdfs/20250034.pdf', 'certificates/qrcodes/20250034.png', 'Issued', '2025-10-23 17:30:05'),
('KNP-2025-0025C0', 'tknp/b/223', 'Course Completion', 'N/A', NULL, '2025-10-21', 'certificates/pdfs/KNP-2025-0025C0.pdf', 'certificates/qrcodes/KNP-2025-0025C0.png', 'Issued', '2025-10-21 10:35:35'),
('KNP-2025-011DD1', 'tknp/b/223', 'Course Completion', 'N/A', NULL, '2025-10-21', 'certificates/pdfs/KNP-2025-011DD1.pdf', 'certificates/qrcodes/KNP-2025-011DD1.png', 'Issued', '2025-10-21 11:59:32'),
('KNP-2025-082BC2', 'tknp/b/223', 'Course Completion', 'N/A', NULL, '2025-10-21', 'certificates/pdfs/KNP-2025-082BC2.pdf', 'certificates/qrcodes/KNP-2025-082BC2.png', 'Issued', '2025-10-21 11:55:48'),
('KNP-2025-10A200', 'tknp/b/225', 'Course Completion', NULL, NULL, '2025-10-16', 'certificates/pdfs/KNP-2025-10A200.pdf', 'certificates/qrcodes/KNP-2025-10A200.png', 'Issued', '2025-10-16 08:48:18'),
('KNP-2025-143AA2', 'tknp/b/223', 'Course Completion', 'N/A', NULL, '2025-10-21', 'certificates/pdfs/KNP-2025-143AA2.pdf', 'certificates/qrcodes/KNP-2025-143AA2.png', 'Issued', '2025-10-21 11:57:38'),
('KNP-2025-1752B3', 'tknp/b/225', 'Course Completion', NULL, NULL, '2025-10-16', 'certificates/pdfs/KNP-2025-1752B3.pdf', 'certificates/qrcodes/KNP-2025-1752B3.png', 'Issued', '2025-10-16 08:16:49'),
('KNP-2025-187194', 'tknp/b/225', 'Course Completion', NULL, NULL, '2025-10-16', 'certificates/pdfs/KNP-2025-187194.pdf', 'certificates/qrcodes/KNP-2025-187194.png', 'Issued', '2025-10-16 08:32:31'),
('KNP-2025-19E922', 'tknp/b/223', 'Course Completion', 'N/A', NULL, '2025-10-21', 'certificates/pdfs/KNP-2025-19E922.pdf', 'certificates/qrcodes/KNP-2025-19E922.png', 'Issued', '2025-10-21 10:36:44'),
('KNP-2025-1E04F2', 'tknp/b/222', 'Course Completion', NULL, NULL, '2025-10-16', 'certificates/pdfs/KNP-2025-1E04F2.pdf', 'certificates/qrcodes/KNP-2025-1E04F2.png', 'Issued', '2025-10-16 06:15:47'),
('KNP-2025-208171', 'tknp/b/224', 'Course Completion', NULL, NULL, '2025-10-15', 'certificates/pdfs/KNP-2025-208171.pdf', 'certificates/qrcodes/KNP-2025-208171.png', 'Issued', '2025-10-15 12:49:57'),
('KNP-2025-226076', 'tknp/b/222', 'Course Completion', NULL, NULL, '2025-10-16', 'certificates/pdfs/KNP-2025-226076.pdf', 'certificates/qrcodes/KNP-2025-226076.png', 'Issued', '2025-10-16 06:20:46'),
('KNP-2025-26F17C', 'tknp/b/227', 'Course Completion', NULL, NULL, '2025-10-16', 'certificates/pdfs/KNP-2025-26F17C.pdf', 'certificates/qrcodes/KNP-2025-26F17C.png', 'Issued', '2025-10-16 07:33:47'),
('KNP-2025-2755C3', 'tknp/b/229', 'Course Completion', '87666', NULL, '2025-10-16', 'certificates/pdfs/KNP-2025-2755C3.pdf', 'certificates/qrcodes/KNP-2025-2755C3.png', 'Issued', '2025-10-16 10:18:42'),
('KNP-2025-283606', 'tknp/b/222', 'Course Completion', NULL, NULL, '2025-10-16', 'certificates/pdfs/KNP-2025-283606.pdf', 'certificates/qrcodes/KNP-2025-283606.png', 'Issued', '2025-10-16 06:20:09'),
('KNP-2025-2B0FD7', 'tknp/b/229', 'Course Completion', '87666', NULL, '2025-10-21', 'certificates/pdfs/KNP-2025-2B0FD7.pdf', 'certificates/qrcodes/KNP-2025-2B0FD7.png', 'Issued', '2025-10-21 05:49:15'),
('KNP-2025-2B54DB', 'tknp/b/225', 'Course Completion', NULL, NULL, '2025-10-16', 'certificates/pdfs/KNP-2025-2B54DB.pdf', 'certificates/qrcodes/KNP-2025-2B54DB.png', 'Issued', '2025-10-16 08:40:30'),
('KNP-2025-2D04D8', 'tknp/b/222', 'Course Completion', NULL, NULL, '2025-10-16', 'certificates/pdfs/KNP-2025-2D04D8.pdf', 'certificates/qrcodes/KNP-2025-2D04D8.png', 'Issued', '2025-10-16 06:21:34'),
('KNP-2025-2D50A2', 'tknp/b/223', 'Course Completion', 'N/A', NULL, '2025-10-21', 'certificates/pdfs/KNP-2025-2D50A2.pdf', 'certificates/qrcodes/KNP-2025-2D50A2.png', 'Issued', '2025-10-21 11:59:19'),
('KNP-2025-2DD641', 'tknp/b/225', 'Course Completion', NULL, NULL, '2025-10-16', 'certificates/pdfs/KNP-2025-2DD641.pdf', 'certificates/qrcodes/KNP-2025-2DD641.png', 'Issued', '2025-10-16 08:59:18'),
('KNP-2025-2EF4D8', 'tknp/b/223', 'Course Completion', 'N/A', NULL, '2025-10-21', 'certificates/pdfs/KNP-2025-2EF4D8.pdf', 'certificates/qrcodes/KNP-2025-2EF4D8.png', 'Issued', '2025-10-21 11:57:00'),
('KNP-2025-2FA830', 'tknp/b/223', 'Course Completion', 'N/A', NULL, '2025-10-21', 'certificates/pdfs/KNP-2025-2FA830.pdf', 'certificates/qrcodes/KNP-2025-2FA830.png', 'Issued', '2025-10-21 11:58:52'),
('KNP-2025-39E607', 'tknp/b/226', 'Course Completion', 'N/A', NULL, '2025-10-21', 'certificates/pdfs/KNP-2025-39E607.pdf', 'certificates/qrcodes/KNP-2025-39E607.png', 'Issued', '2025-10-21 06:11:00'),
('KNP-2025-3B7F5D', 'tknp/b/226', 'Course Completion', NULL, NULL, '2025-10-16', 'certificates/pdfs/KNP-2025-3B7F5D.pdf', '', 'Issued', '2025-10-16 06:44:10'),
('KNP-2025-3DE40B', 'tknp/b/223', 'Course Completion', 'N/A', NULL, '2025-10-21', 'certificates/pdfs/KNP-2025-3DE40B.pdf', 'certificates/qrcodes/KNP-2025-3DE40B.png', 'Issued', '2025-10-21 11:58:35'),
('KNP-2025-3ED546', 'tknp/b/223', 'Course Completion', 'N/A', NULL, '2025-10-21', 'certificates/pdfs/KNP-2025-3ED546.pdf', 'certificates/qrcodes/KNP-2025-3ED546.png', 'Issued', '2025-10-21 13:28:04'),
('KNP-2025-3FF18A', 'tknp/b/225', 'Course Completion', NULL, NULL, '2025-10-16', 'certificates/pdfs/KNP-2025-3FF18A.pdf', 'certificates/qrcodes/KNP-2025-3FF18A.png', 'Issued', '2025-10-16 07:48:37'),
('KNP-2025-3FF22B', 'tknp/b/222', 'Course Completion', NULL, NULL, '2025-10-16', 'certificates/pdfs/KNP-2025-3FF22B.pdf', 'certificates/qrcodes/KNP-2025-3FF22B.png', 'Issued', '2025-10-16 06:32:42'),
('KNP-2025-401B3F', 'tknp/b/225', 'Course Completion', NULL, NULL, '2025-10-16', 'certificates/pdfs/KNP-2025-401B3F.pdf', 'certificates/qrcodes/KNP-2025-401B3F.png', 'Issued', '2025-10-16 08:08:58'),
('KNP-2025-46636E', 'tknp/b/225', 'Course Completion', NULL, NULL, '2025-10-16', 'certificates/pdfs/KNP-2025-46636E.pdf', 'certificates/qrcodes/KNP-2025-46636E.png', 'Issued', '2025-10-16 09:27:11'),
('KNP-2025-477184', 'tknp/b/223', 'Course Completion', 'N/A', NULL, '2025-10-22', 'certificates/pdfs/KNP-2025-477184.pdf', 'certificates/qrcodes/KNP-2025-477184.png', 'Revoked', '2025-10-22 05:33:53'),
('KNP-2025-4CAA36', 'tknp/b/225', 'Course Completion', NULL, NULL, '2025-10-16', 'certificates/pdfs/KNP-2025-4CAA36.pdf', 'certificates/qrcodes/KNP-2025-4CAA36.png', 'Issued', '2025-10-16 08:17:38'),
('KNP-2025-4FE617', 'tknp/b/223', 'Course Completion', NULL, NULL, '2025-10-15', 'certificates/pdfs/KNP-2025-4FE617.pdf', 'certificates/qrcodes/KNP-2025-4FE617.png', 'Issued', '2025-10-15 12:21:21'),
('KNP-2025-54218F', 'tknp/b/225', 'Course Completion', NULL, NULL, '2025-10-16', 'certificates/pdfs/KNP-2025-54218F.pdf', 'certificates/qrcodes/KNP-2025-54218F.png', 'Issued', '2025-10-16 09:28:01'),
('KNP-2025-544528', 'tknp/b/229', 'Course Completion', '87666', NULL, '2025-10-16', 'certificates/pdfs/KNP-2025-544528.pdf', 'certificates/qrcodes/KNP-2025-544528.png', 'Issued', '2025-10-16 10:07:35'),
('KNP-2025-5756EF', 'tknp/b/229', 'Course Completion', 'QUAL-5CED', NULL, '2025-10-16', 'certificates/pdfs/KNP-2025-5756EF.pdf', 'certificates/qrcodes/KNP-2025-5756EF.png', 'Issued', '2025-10-16 09:54:50'),
('KNP-2025-582E69', 'tknp/b/225', 'Course Completion', NULL, NULL, '2025-10-16', 'certificates/pdfs/KNP-2025-582E69.pdf', 'certificates/qrcodes/KNP-2025-582E69.png', 'Issued', '2025-10-16 09:03:17'),
('KNP-2025-5F01C3', 'tknp/b/223', 'Course Completion', 'N/A', NULL, '2025-10-21', 'certificates/pdfs/KNP-2025-5F01C3.pdf', 'certificates/qrcodes/KNP-2025-5F01C3.png', 'Issued', '2025-10-21 11:58:21'),
('KNP-2025-5FFE98', 'tknp/b/223', 'Course Completion', 'N/A', NULL, '2025-10-21', 'certificates/pdfs/KNP-2025-5FFE98.pdf', 'certificates/qrcodes/KNP-2025-5FFE98.png', 'Issued', '2025-10-21 11:56:02'),
('KNP-2025-61D5EC', 'tknp/b/223', 'Course Completion', 'N/A', NULL, '2025-10-21', 'certificates/pdfs/KNP-2025-61D5EC.pdf', 'certificates/qrcodes/KNP-2025-61D5EC.png', 'Issued', '2025-10-21 11:59:47'),
('KNP-2025-67D599', 'tknp/b/226', 'Course Completion', NULL, NULL, '2025-10-15', 'certificates/pdfs/KNP-2025-67D599.pdf', 'certificates/qrcodes/KNP-2025-67D599.png', 'Issued', '2025-10-15 13:26:02'),
('KNP-2025-67D651', 'tknp/b/228', 'Course Completion', NULL, NULL, '2025-10-16', 'certificates/pdfs/KNP-2025-67D651.pdf', 'certificates/qrcodes/KNP-2025-67D651.png', 'Issued', '2025-10-16 07:31:50'),
('KNP-2025-684AF7', 'tknp/b/223', 'Course Completion', 'N/A', NULL, '2025-10-21', 'certificates/pdfs/KNP-2025-684AF7.pdf', 'certificates/qrcodes/KNP-2025-684AF7.png', 'Issued', '2025-10-21 12:00:24'),
('KNP-2025-687D14', 'tknp/b/225', 'Course Completion', NULL, NULL, '2025-10-16', 'certificates/pdfs/KNP-2025-687D14.pdf', 'certificates/qrcodes/KNP-2025-687D14.png', 'Issued', '2025-10-16 08:03:11'),
('KNP-2025-6C91A7', 'tknp/b/223', 'Course Completion', 'N/A', NULL, '2025-10-21', 'certificates/pdfs/KNP-2025-6C91A7.pdf', 'certificates/qrcodes/KNP-2025-6C91A7.png', 'Issued', '2025-10-21 11:57:52'),
('KNP-2025-6F97EB', 'tknp/b/223', 'Course Completion', 'N/A', NULL, '2025-10-21', 'certificates/pdfs/KNP-2025-6F97EB.pdf', 'certificates/qrcodes/KNP-2025-6F97EB.png', 'Issued', '2025-10-21 10:58:36'),
('KNP-2025-711543', 'tknp/b/225', 'Course Completion', NULL, NULL, '2025-10-16', 'certificates/pdfs/KNP-2025-711543.pdf', 'certificates/qrcodes/KNP-2025-711543.png', 'Issued', '2025-10-16 08:49:22'),
('KNP-2025-783714', 'tknp/b/223', 'Course Completion', 'N/A', NULL, '2025-10-21', 'certificates/pdfs/KNP-2025-783714.pdf', 'certificates/qrcodes/KNP-2025-783714.png', 'Issued', '2025-10-21 11:57:24'),
('KNP-2025-79DC61', 'tknp/b/222', 'Course Completion', 'N/A', NULL, '2025-10-21', 'certificates/pdfs/KNP-2025-79DC61.pdf', 'certificates/qrcodes/KNP-2025-79DC61.png', 'Issued', '2025-10-21 05:41:03'),
('KNP-2025-7DE7F9', 'tknp/b/222', 'Course Completion', NULL, NULL, '2025-10-16', 'certificates/pdfs/KNP-2025-7DE7F9.pdf', '', 'Issued', '2025-10-16 06:40:55'),
('KNP-2025-7E78C9', 'tknp/b/223', 'Course Completion', 'N/A', NULL, '2025-10-21', 'certificates/pdfs/KNP-2025-7E78C9.pdf', 'certificates/qrcodes/KNP-2025-7E78C9.png', 'Issued', '2025-10-21 12:03:02'),
('KNP-2025-7FA3D2', 'tknp/b/223', 'Course Completion', 'N/A', NULL, '2025-10-21', 'certificates/pdfs/KNP-2025-7FA3D2.pdf', 'certificates/qrcodes/KNP-2025-7FA3D2.png', 'Issued', '2025-10-21 12:02:49'),
('KNP-2025-848766', 'tknp/b/225', 'Course Completion', NULL, NULL, '2025-10-16', 'certificates/pdfs/KNP-2025-848766.pdf', 'certificates/qrcodes/KNP-2025-848766.png', 'Issued', '2025-10-16 07:49:35'),
('KNP-2025-84C2FB', 'tknp/b/223', 'Course Completion', 'N/A', NULL, '2025-10-21', 'certificates/pdfs/KNP-2025-84C2FB.pdf', 'certificates/qrcodes/KNP-2025-84C2FB.png', 'Issued', '2025-10-21 10:27:02'),
('KNP-2025-86C283', 'tknp/b/225', 'Course Completion', NULL, NULL, '2025-10-16', 'certificates/pdfs/KNP-2025-86C283.pdf', 'certificates/qrcodes/KNP-2025-86C283.png', 'Issued', '2025-10-16 08:01:01'),
('KNP-2025-8A3F64', 'tknp/b/223', 'Course Completion', 'N/A', NULL, '2025-10-21', 'certificates/pdfs/KNP-2025-8A3F64.pdf', 'certificates/qrcodes/KNP-2025-8A3F64.png', 'Issued', '2025-10-21 10:05:13'),
('KNP-2025-8AFE5C', 'tknp/b/227', 'Course Completion', NULL, NULL, '2025-10-15', 'certificates/pdfs/KNP-2025-8AFE5C.pdf', 'certificates/qrcodes/KNP-2025-8AFE5C.png', 'Issued', '2025-10-15 13:46:39'),
('KNP-2025-933A8A', 'tknp/b/225', 'Course Completion', NULL, NULL, '2025-10-16', 'certificates/pdfs/KNP-2025-933A8A.pdf', 'certificates/qrcodes/KNP-2025-933A8A.png', 'Issued', '2025-10-16 08:19:29'),
('KNP-2025-95FA51', 'tknp/b/226', 'Course Completion', 'N/A', NULL, '2025-10-21', 'certificates/pdfs/KNP-2025-95FA51.pdf', 'certificates/qrcodes/KNP-2025-95FA51.png', 'Issued', '2025-10-21 08:02:47'),
('KNP-2025-9CD004', 'tknp/b/225', 'Course Completion', NULL, NULL, '2025-10-16', 'certificates/pdfs/KNP-2025-9CD004.pdf', 'certificates/qrcodes/KNP-2025-9CD004.png', 'Issued', '2025-10-16 09:24:39'),
('KNP-2025-9CF57B', 'tknp/b/229', 'Course Completion', '87666', NULL, '2025-10-16', 'certificates/pdfs/KNP-2025-9CF57B.pdf', 'certificates/qrcodes/KNP-2025-9CF57B.png', 'Issued', '2025-10-16 10:16:06'),
('KNP-2025-9E25E1', 'tknp/b/227', 'Course Completion', NULL, NULL, '2025-10-15', 'certificates/pdfs/KNP-2025-9E25E1.pdf', 'certificates/qrcodes/KNP-2025-9E25E1.png', 'Issued', '2025-10-15 13:41:24'),
('KNP-2025-9E72D0', 'tknp/b/223', 'Course Completion', 'N/A', NULL, '2025-10-21', 'certificates/pdfs/KNP-2025-9E72D0.pdf', 'certificates/qrcodes/KNP-2025-9E72D0.png', 'Issued', '2025-10-21 10:24:17'),
('KNP-2025-A26C7A', 'tknp/b/226', 'Course Completion', NULL, NULL, '2025-10-16', 'certificates/pdfs/KNP-2025-A26C7A.pdf', 'certificates/qrcodes/KNP-2025-A26C7A.png', 'Issued', '2025-10-16 06:53:53'),
('KNP-2025-A4F3BE', 'tknp/b/225', 'Course Completion', NULL, NULL, '2025-10-16', 'certificates/pdfs/KNP-2025-A4F3BE.pdf', 'certificates/qrcodes/KNP-2025-A4F3BE.png', 'Issued', '2025-10-16 08:35:09'),
('KNP-2025-B148BE', 'tknp/b/226', 'Course Completion', 'QUAL-7189', NULL, '2025-10-16', 'certificates/pdfs/KNP-2025-B148BE.pdf', 'certificates/qrcodes/KNP-2025-B148BE.png', 'Issued', '2025-10-16 09:46:58'),
('KNP-2025-B59239', 'tknp/b/225', 'Course Completion', NULL, NULL, '2025-10-15', 'certificates/pdfs/KNP-2025-B59239.pdf', 'certificates/qrcodes/KNP-2025-B59239.png', 'Issued', '2025-10-15 13:16:50'),
('KNP-2025-B61EEE', 'tknp/b/226', 'Course Completion', 'QUAL-864E', NULL, '2025-10-16', 'certificates/pdfs/KNP-2025-B61EEE.pdf', 'certificates/qrcodes/KNP-2025-B61EEE.png', 'Issued', '2025-10-16 09:51:58'),
('KNP-2025-B8C2C8', 'tknp/b/222', 'Course Completion', NULL, NULL, '2025-10-16', 'certificates/pdfs/KNP-2025-B8C2C8.pdf', 'certificates/qrcodes/KNP-2025-B8C2C8.png', 'Issued', '2025-10-16 05:59:43'),
('KNP-2025-B9EBF8', 'tknp/b/225', 'Course Completion', NULL, NULL, '2025-10-16', 'certificates/pdfs/KNP-2025-B9EBF8.pdf', 'certificates/qrcodes/KNP-2025-B9EBF8.png', 'Issued', '2025-10-16 09:06:48'),
('KNP-2025-BCABBF', 'tknp/b/229', 'Course Completion', '87666', NULL, '2025-10-16', 'certificates/pdfs/KNP-2025-BCABBF.pdf', 'certificates/qrcodes/KNP-2025-BCABBF.png', 'Issued', '2025-10-16 10:19:23'),
('KNP-2025-BE27BC', 'tknp/b/228', 'Course Completion', NULL, NULL, '2025-10-16', 'certificates/pdfs/KNP-2025-BE27BC.pdf', 'certificates/qrcodes/KNP-2025-BE27BC.png', 'Issued', '2025-10-16 07:21:47'),
('KNP-2025-C0DE2D', 'tknp/b/229', 'Course Completion', '87666', NULL, '2025-10-21', 'certificates/pdfs/KNP-2025-C0DE2D.pdf', 'certificates/qrcodes/KNP-2025-C0DE2D.png', 'Issued', '2025-10-21 05:32:30'),
('KNP-2025-C117B1', 'tknp/b/225', 'Course Completion', NULL, NULL, '2025-10-16', 'certificates/pdfs/KNP-2025-C117B1.pdf', 'certificates/qrcodes/KNP-2025-C117B1.png', 'Issued', '2025-10-16 08:25:47'),
('KNP-2025-C442BB', 'tknp/b/223', 'Course Completion', 'N/A', NULL, '2025-10-21', 'certificates/pdfs/KNP-2025-C442BB.pdf', 'certificates/qrcodes/KNP-2025-C442BB.png', 'Issued', '2025-10-21 11:04:43'),
('KNP-2025-C64951', 'tknp/b/223', 'Course Completion', 'N/A', NULL, '2025-10-21', 'certificates/pdfs/KNP-2025-C64951.pdf', 'certificates/qrcodes/KNP-2025-C64951.png', 'Issued', '2025-10-21 11:56:38'),
('KNP-2025-C69348', 'tknp/b/223', 'Course Completion', 'N/A', NULL, '2025-10-21', 'certificates/pdfs/KNP-2025-C69348.pdf', 'certificates/qrcodes/KNP-2025-C69348.png', 'Issued', '2025-10-21 10:31:22'),
('KNP-2025-C75ED3', 'tknp/b/229', 'Course Completion', '87666', NULL, '2025-10-21', 'certificates/pdfs/KNP-2025-C75ED3.pdf', 'certificates/qrcodes/KNP-2025-C75ED3.png', 'Issued', '2025-10-21 05:40:36'),
('KNP-2025-C7C66D', 'tknp/b/223', 'Course Completion', 'N/A', NULL, '2025-10-21', 'certificates/pdfs/KNP-2025-C7C66D.pdf', 'certificates/qrcodes/KNP-2025-C7C66D.png', 'Issued', '2025-10-21 11:59:06'),
('KNP-2025-C7D8F9', 'tknp/b/229', 'Course Completion', '87666', NULL, '2025-10-16', 'certificates/pdfs/KNP-2025-C7D8F9.pdf', 'certificates/qrcodes/KNP-2025-C7D8F9.png', 'Issued', '2025-10-16 09:58:11'),
('KNP-2025-C8574A', 'tknp/b/222', 'Course Completion', NULL, NULL, '2025-10-15', 'certificates/pdfs/KNP-2025-C8574A.pdf', 'certificates/qrcodes/KNP-2025-C8574A.png', 'Issued', '2025-10-15 12:05:00'),
('KNP-2025-C85FE8', 'tknp/b/223', 'Course Completion', 'N/A', NULL, '2025-10-21', 'certificates/pdfs/KNP-2025-C85FE8.pdf', 'certificates/qrcodes/KNP-2025-C85FE8.png', 'Issued', '2025-10-21 11:58:07'),
('KNP-2025-C94350', 'tknp/b/222', 'Course Completion', NULL, NULL, '2025-10-16', 'certificates/pdfs/KNP-2025-C94350.pdf', 'certificates/qrcodes/KNP-2025-C94350.png', 'Issued', '2025-10-16 05:52:02'),
('KNP-2025-C99A93', 'tknp/b/223', 'Course Completion', 'N/A', NULL, '2025-10-21', 'certificates/pdfs/KNP-2025-C99A93.pdf', 'certificates/qrcodes/KNP-2025-C99A93.png', 'Issued', '2025-10-21 13:35:28'),
('KNP-2025-CC20D6', 'tknp/b/222', 'Course Completion', 'N/A', NULL, '2025-10-21', 'certificates/pdfs/KNP-2025-CC20D6.pdf', 'certificates/qrcodes/KNP-2025-CC20D6.png', 'Issued', '2025-10-21 05:45:04'),
('KNP-2025-D07191', 'tknp/b/226', 'Course Completion', NULL, NULL, '2025-10-16', 'certificates/pdfs/KNP-2025-D07191.pdf', 'certificates/qrcodes/KNP-2025-D07191.png', 'Issued', '2025-10-16 06:49:50'),
('KNP-2025-D12881', 'tknp/b/223', 'Course Completion', 'N/A', NULL, '2025-10-21', 'certificates/pdfs/KNP-2025-D12881.pdf', 'certificates/qrcodes/KNP-2025-D12881.png', 'Issued', '2025-10-21 11:56:20'),
('KNP-2025-D2F3D5', 'tknp/b/225', 'Course Completion', NULL, NULL, '2025-10-16', 'certificates/pdfs/KNP-2025-D2F3D5.pdf', 'certificates/qrcodes/KNP-2025-D2F3D5.png', 'Issued', '2025-10-16 08:00:37'),
('KNP-2025-DA17CF', 'tknp/b/223', 'Course Completion', 'N/A', NULL, '2025-10-21', 'certificates/pdfs/KNP-2025-DA17CF.pdf', 'certificates/qrcodes/KNP-2025-DA17CF.png', 'Revoked', '2025-10-21 13:46:58'),
('KNP-2025-DB7648', 'tknp/b/223', 'Course Completion', 'N/A', NULL, '2025-10-21', 'certificates/pdfs/KNP-2025-DB7648.pdf', 'certificates/qrcodes/KNP-2025-DB7648.png', 'Issued', '2025-10-21 09:53:28'),
('KNP-2025-E0BD7E', 'tknp/b/226', 'Course Completion', NULL, NULL, '2025-10-15', 'certificates/pdfs/KNP-2025-E0BD7E.pdf', 'certificates/qrcodes/KNP-2025-E0BD7E.png', 'Issued', '2025-10-15 13:50:50'),
('KNP-2025-E3A2E5', 'tknp/b/226', 'Course Completion', NULL, NULL, '2025-10-16', 'certificates/pdfs/KNP-2025-E3A2E5.pdf', 'certificates/qrcodes/KNP-2025-E3A2E5.png', 'Issued', '2025-10-16 06:55:34'),
('KNP-2025-E5E6CE', 'tknp/b/225', 'Course Completion', NULL, NULL, '2025-10-16', 'certificates/pdfs/KNP-2025-E5E6CE.pdf', 'certificates/qrcodes/KNP-2025-E5E6CE.png', 'Issued', '2025-10-16 08:42:26'),
('KNP-2025-E5FE99', 'tknp/b/223', 'Course Completion', 'N/A', NULL, '2025-10-21', 'certificates/pdfs/KNP-2025-E5FE99.pdf', 'certificates/qrcodes/KNP-2025-E5FE99.png', 'Issued', '2025-10-21 10:25:58'),
('KNP-2025-EAF91A', 'tknp/b/225', 'Course Completion', NULL, NULL, '2025-10-16', 'certificates/pdfs/KNP-2025-EAF91A.pdf', 'certificates/qrcodes/KNP-2025-EAF91A.png', 'Issued', '2025-10-16 08:21:28'),
('KNP-2025-F4DF57', 'tknp/b/223', 'Course Completion', 'N/A', NULL, '2025-10-21', 'certificates/pdfs/KNP-2025-F4DF57.pdf', 'certificates/qrcodes/KNP-2025-F4DF57.png', 'Issued', '2025-10-21 10:54:31'),
('KNP-2025-FABB7A', 'tknp/b/229', 'Course Completion', '87666', NULL, '2025-10-16', 'certificates/pdfs/KNP-2025-FABB7A.pdf', 'certificates/qrcodes/KNP-2025-FABB7A.png', 'Issued', '2025-10-16 10:08:07'),
('KNP-2025-FC8556', 'tknp/b/223', 'Course Completion', 'N/A', NULL, '2025-10-21', 'certificates/pdfs/KNP-2025-FC8556.pdf', 'certificates/qrcodes/KNP-2025-FC8556.png', 'Issued', '2025-10-21 12:00:10'),
('KNP-2025-FFFB53', 'tknp/b/223', 'Course Completion', 'N/A', NULL, '2025-10-21', 'certificates/pdfs/KNP-2025-FFFB53.pdf', 'certificates/qrcodes/KNP-2025-FFFB53.png', 'Issued', '2025-10-21 12:00:40');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `admission_no` varchar(50) NOT NULL,
  `name` varchar(150) NOT NULL,
  `course` varchar(200) NOT NULL,
  `qualification_code` varchar(100) DEFAULT NULL,
  `qualification_type` varchar(100) DEFAULT NULL,
  `grade` varchar(50) DEFAULT NULL,
  `completion_year` year(4) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`admission_no`, `name`, `course`, `qualification_code`, `qualification_type`, `grade`, `completion_year`, `created_at`) VALUES
('tknp/b/222', 'bonface', 'ict level 6', NULL, NULL, 'pass', '2025', '2025-10-15 11:22:52'),
('tknp/b/223', 'Bonface Masinde Ndombi', 'ict level 6', NULL, NULL, 'Pass', '2026', '2025-10-15 12:20:49'),
('tknp/b/2232', 'Bonface Masinde Ndombi', 'Computer Science level 6', '87666', 'National Diploma', 'Credit', '2025', '2025-10-23 16:27:53'),
('tknp/b/2234', 'Bonface Masinde Ndombi', 'Computer Science level 6', '87666', 'National Diploma', 'Credit', '2024', '2025-10-23 17:29:40'),
('tknp/b/224', 'Oyugi Meshlu Oyugi', 'Computer Science level 6', NULL, NULL, 'Credit', '2026', '2025-10-15 12:47:18'),
('tknp/b/225', 'Mary Nasambu Ndombi', 'Computer Science level 6', NULL, NULL, 'pass', '2026', '2025-10-15 13:16:39'),
('tknp/b/226', 'Bonface  Ndombi', 'Computer Science level 6', NULL, NULL, 'Credit', '2026', '2025-10-15 13:25:24'),
('tknp/b/227', 'Daniel Muganda Uluma', 'Computer Science level 6', NULL, NULL, 'Credit', '2026', '2025-10-15 13:41:11'),
('tknp/b/228', 'Grace Ndombi', 'Computer Science level 6', NULL, NULL, 'Credit', '2026', '2025-10-16 05:37:23'),
('tknp/b/2288', 'Bonface Masinde Ndombi', 'Computer Science level 6', '87666', 'National Diploma', 'Credit', '2024', '2025-10-23 17:11:54'),
('tknp/b/229', 'bonface', 'Computer Science level 6', '87666', NULL, 'Credit', '2026', '2025-10-16 09:54:00'),
('tknp/b/2566', 'Bonface Masinde Ndombi', 'Computer Science level 6', '87666', 'National Diploma', 'Credit', '2024', '2025-10-23 16:32:27'),
('TKNP/D/1111', 'Felix Odiwuor Anyumba', 'VEHICLE ENGINE MECHANICS level 6', '333333', 'National Diploma', 'Credit', '2025', '2025-10-23 11:14:14'),
('TKNP/D/1112', 'Radina Vincent Otieno', 'VEHICLE ENGINE MECHANICS  level 6', '333333', 'National Diploma', 'Credit', '2025', '2025-10-23 11:14:14'),
('TKNP/D/1113', 'Randa MacDonald Omondi', 'VEHICLE ENGINE MECHANICS level 6', '333333', 'National Diploma', 'Credit', '2025', '2025-10-23 11:14:14'),
('TKNP/D/1114', 'Rasak Eliud Owiti', 'VEHICLE ENGINE MECHANICS  level 6', '333333', 'National Diploma', 'Credit', '2025', '2025-10-23 11:14:15'),
('TKNP/D/1115', 'Felix Odiwuor Anyumba', 'VEHICLE ENGINE MECHANICS level 6', '333333', 'National Diploma', 'Credit', '2025', '2025-10-23 11:16:26'),
('TKNP/D/1116', 'Radina Vincent Otieno', 'VEHICLE ENGINE MECHANICS  level 6', '333333', 'National Diploma', 'Credit', '2025', '2025-10-23 11:16:26'),
('TKNP/D/1117', 'Randa MacDonald Omondi', 'VEHICLE ENGINE MECHANICS level 6', '333333', 'National Diploma', 'Credit', '2025', '2025-10-23 11:16:26'),
('TKNP/D/1118', 'Rasak Eliud Owiti', 'VEHICLE ENGINE MECHANICS  level 6', '333333', 'National Diploma', 'Credit', '2025', '2025-10-23 11:16:26');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('Admin','Registrar') NOT NULL DEFAULT 'Registrar',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `password`, `role`, `created_at`) VALUES
(1, 'System Admin', 'admin@knp.ac.ke', '$2y$10$0tCEz0OZl6Ai1OmtM/zZTeNtkZK0DmPptmA1Zz7Qd8Zp4V02Kx4Oq', 'Admin', '2025-10-15 09:48:09'),
(2, 'System admin', 'admin@tknp.ac.ke', '$2y$10$nPOa9NJWTquifZtKgtxiNOEwyPRjZtG89L1yncJ4Vtl6mAYFRoLLO', 'Admin', '2025-10-15 10:05:56'),
(3, 'Registrar', 'registrar@tknp.ac.ke', '$2y$10$mSXUaIEuZxGif83/YFjSwuJGegi9Np82oS9XkaEstHfXDpS2dlsV.', 'Registrar', '2025-10-15 10:29:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`cert_no`),
  ADD KEY `admission_no` (`admission_no`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`admission_no`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `certificates`
--
ALTER TABLE `certificates`
  ADD CONSTRAINT `certificates_ibfk_1` FOREIGN KEY (`admission_no`) REFERENCES `students` (`admission_no`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
