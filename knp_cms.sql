-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 05, 2025 at 03:21 PM
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
-- Table structure for table `batch_reports`
--

CREATE TABLE `batch_reports` (
  `id` int(11) NOT NULL,
  `batch_id` varchar(50) NOT NULL,
  `total_certificates` int(11) DEFAULT 0,
  `generated_by` varchar(100) DEFAULT NULL,
  `generated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `batch_reports`
--

INSERT INTO `batch_reports` (`id`, `batch_id`, `total_certificates`, `generated_by`, `generated_at`) VALUES
(1, 'BATCH_20251105_092726', 9, 'Registrar', '2025-11-05 08:27:31'),
(2, 'BATCH_20251105_094139', 9, 'Registrar', '2025-11-05 08:42:38');

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
('20250035', 'TKNP/C/5824', 'Course Completion', '87666', NULL, '2025-10-23', 'certificates/pdfs/20250035.pdf', 'certificates/qrcodes/20250035.png', 'Issued', '2025-10-23 18:01:20'),
('20250036', 'tknp/b/2244', 'Course Completion', '87666', NULL, '2025-10-24', 'certificates/pdfs/20250036.pdf', 'certificates/qrcodes/20250036.png', 'Issued', '2025-10-24 06:02:00'),
('20250037', 'tknp/b/2266', 'Course Completion', '87666', NULL, '2025-10-24', 'certificates/pdfs/20250037.pdf', 'certificates/qrcodes/20250037.png', 'Issued', '2025-10-24 06:04:52'),
('20250038', 'tknp/b/23444', 'Course Completion', '87666', NULL, '2025-10-24', 'certificates/pdfs/20250038.pdf', 'certificates/qrcodes/20250038.png', 'Issued', '2025-10-24 06:10:56'),
('20250039', 'tknp/b/2454', 'Course Completion', '87666', NULL, '2025-10-24', 'certificates/pdfs/20250039.pdf', 'certificates/qrcodes/20250039.png', 'Issued', '2025-10-24 06:14:16'),
('20250040', 'tknp/b/2899', 'Course Completion', '87666', NULL, '2025-10-24', 'certificates/pdfs/20250040.pdf', 'certificates/qrcodes/20250040.png', 'Issued', '2025-10-24 06:27:05'),
('20250041', 'tknp/b/23456', 'Course Completion', '87666', NULL, '2025-10-24', 'certificates/pdfs/20250041.pdf', 'certificates/qrcodes/20250041.png', 'Issued', '2025-10-24 16:38:33'),
('20250042', 'tknp/b/289998', 'Course Completion', '87666', NULL, '2025-10-24', 'certificates/pdfs/20250042.pdf', 'certificates/qrcodes/20250042.png', 'Issued', '2025-10-24 16:50:20'),
('20250043', 'tknp/b/28998', 'Course Completion', '87666', NULL, '2025-10-24', 'certificates/pdfs/20250043.pdf', 'certificates/qrcodes/20250043.png', 'Issued', '2025-10-24 16:59:22'),
('20250044', 'tknp/b/289945', 'Course Completion', '87666', NULL, '2025-10-24', 'certificates/pdfs/20250044.pdf', 'certificates/qrcodes/20250044.png', 'Issued', '2025-10-24 17:07:28'),
('20250045', 'tknp/b/289909', 'Course Completion', '87666', NULL, '2025-10-24', 'certificates/pdfs/20250045.pdf', 'certificates/qrcodes/20250045.png', 'Issued', '2025-10-24 17:09:45'),
('20250046', 'tknp/b/22334', 'Course Completion', '87666', NULL, '2025-10-24', 'certificates/pdfs/20250046.pdf', 'certificates/qrcodes/20250046.png', 'Issued', '2025-10-24 17:14:38'),
('20250047', 'tknp/b/5555', 'Course Completion', '87666', NULL, '2025-10-24', 'certificates/pdfs/20250047.pdf', 'certificates/qrcodes/20250047.png', 'Issued', '2025-10-24 17:18:39'),
('20250048', 'tknp/b/289912', 'Course Completion', '87666', NULL, '2025-10-24', 'certificates/pdfs/20250048.pdf', 'certificates/qrcodes/20250048.png', 'Issued', '2025-10-24 17:20:27'),
('20250049', 'tknp/b/28678', 'Course Completion', '87666', NULL, '2025-10-24', 'certificates/pdfs/20250049.pdf', 'certificates/qrcodes/20250049.png', 'Issued', '2025-10-24 17:25:50'),
('20250050', 'tknp/b/289900', 'Course Completion', '87666', NULL, '2025-10-24', 'certificates/pdfs/20250050.pdf', 'certificates/qrcodes/20250050.png', 'Issued', '2025-10-24 17:30:20'),
('20250051', 'tknp/b/8909', 'Course Completion', '876663', NULL, '2025-10-24', 'certificates/pdfs/20250051.pdf', 'certificates/qrcodes/20250051.png', 'Issued', '2025-10-24 17:33:23'),
('20250052', 'tknp/b/0000', 'Course Completion', '876663', NULL, '2025-10-24', 'certificates/pdfs/20250052.pdf', 'certificates/qrcodes/20250052.png', 'Issued', '2025-10-24 17:37:33'),
('20250053', 'tknp/b/1234', 'Course Completion', '87666', NULL, '2025-10-24', 'certificates/pdfs/20250053.pdf', 'certificates/qrcodes/20250053.png', 'Issued', '2025-10-24 17:40:54'),
('20250054', 'tknp/b/3456', 'Course Completion', '87666', NULL, '2025-10-24', 'certificates/pdfs/20250054.pdf', 'certificates/qrcodes/20250054.png', 'Issued', '2025-10-24 17:43:15'),
('20250055', 'tknp/b/9087', 'Course Completion', '87666', NULL, '2025-10-24', 'certificates/pdfs/20250055.pdf', 'certificates/qrcodes/20250055.png', 'Issued', '2025-10-24 17:54:33'),
('20250056', 'tknp/c/1234', 'Course Completion', '87666', NULL, '2025-10-24', 'certificates/pdfs/20250056.pdf', 'certificates/qrcodes/20250056.png', 'Issued', '2025-10-24 17:58:08'),
('20250057', 'tknp/b/2899999', 'Course Completion', '87666', NULL, '2025-10-24', 'certificates/pdfs/20250057.pdf', 'certificates/qrcodes/20250057.png', 'Issued', '2025-10-24 18:03:31'),
('20250058', 'tknp/b/2899213', 'Course Completion', '87666', NULL, '2025-10-24', 'certificates/pdfs/20250058.pdf', 'certificates/qrcodes/20250058.png', 'Issued', '2025-10-24 18:06:10'),
('20250059', 'tknp/b/28089', 'Course Completion', '87666', NULL, '2025-10-24', 'certificates/pdfs/20250059.pdf', 'certificates/qrcodes/20250059.png', 'Issued', '2025-10-24 18:09:13'),
('20250060', 'tknp/b/22256', 'Course Completion', '876663', NULL, '2025-10-24', 'certificates/pdfs/20250060.pdf', 'certificates/qrcodes/20250060.png', 'Issued', '2025-10-24 18:13:02'),
('20250061', 'tknp/b/289900000', 'Course Completion', '87666', NULL, '2025-10-24', 'certificates/pdfs/20250061.pdf', 'certificates/qrcodes/20250061.png', 'Issued', '2025-10-24 18:15:22'),
('20250062', '234', 'Course Completion', '87666', NULL, '2025-10-24', 'certificates/pdfs/20250062.pdf', 'certificates/qrcodes/20250062.png', 'Issued', '2025-10-24 18:17:33'),
('20250063', '2345', 'Course Completion', '876663', NULL, '2025-10-24', 'certificates/pdfs/20250063.pdf', 'certificates/qrcodes/20250063.png', 'Issued', '2025-10-24 18:26:50'),
('20250064', '1234', 'Course Completion', '87666', NULL, '2025-10-24', 'certificates/pdfs/20250064.pdf', 'certificates/qrcodes/20250064.png', 'Issued', '2025-10-24 18:29:42'),
('20250065', 'tknp/b78', 'Course Completion', '87666', NULL, '2025-10-24', 'certificates/pdfs/20250065.pdf', 'certificates/qrcodes/20250065.png', 'Issued', '2025-10-24 18:45:23'),
('20250066', '43544', 'Course Completion', '876663', NULL, '2025-10-24', 'certificates/pdfs/20250066.pdf', 'certificates/qrcodes/20250066.png', 'Issued', '2025-10-24 18:51:41'),
('20250067', '34567', 'Course Completion', '87666', NULL, '2025-10-24', 'certificates/pdfs/20250067.pdf', 'certificates/qrcodes/20250067.png', 'Issued', '2025-10-24 19:26:20'),
('20250068', 'tknp/b/9090', 'Course Completion', '87666', NULL, '2025-10-24', 'certificates/pdfs/20250068.pdf', 'certificates/qrcodes/20250068.png', 'Issued', '2025-10-24 19:34:46'),
('20250069', 'tknp/b/8899', 'Course Completion', '87666', NULL, '2025-10-24', 'certificates/pdfs/20250069.pdf', 'certificates/qrcodes/20250069.png', 'Issued', '2025-10-24 19:37:13'),
('20250070', 'tknp/b/2899987', 'Course Completion', '876663', NULL, '2025-10-24', 'certificates/pdfs/20250070.pdf', 'certificates/qrcodes/20250070.png', 'Issued', '2025-10-24 19:42:47'),
('20250071', 'tknp/b/22645', 'Course Completion', '876663', NULL, '2025-10-24', 'certificates/pdfs/20250071.pdf', 'certificates/qrcodes/20250071.png', 'Issued', '2025-10-24 19:44:34'),
('20250072', '455', 'Course Completion', '87666', NULL, '2025-10-24', 'certificates/pdfs/20250072.pdf', 'certificates/qrcodes/20250072.png', 'Issued', '2025-10-24 19:54:53'),
('20250073', 'tknp/b/3450', 'Course Completion', '87666', NULL, '2025-10-24', 'certificates/pdfs/20250073.pdf', 'certificates/qrcodes/20250073.png', 'Issued', '2025-10-24 20:39:14'),
('20250074', '12378', 'Course Completion', '87666', NULL, '2025-10-24', 'certificates/pdfs/20250074.pdf', 'certificates/qrcodes/20250074.png', 'Issued', '2025-10-24 20:43:44'),
('20250075', 'tknp/b/289954', 'Course Completion', '87666', NULL, '2025-10-24', 'certificates/pdfs/20250075.pdf', 'certificates/qrcodes/20250075.png', 'Issued', '2025-10-24 20:54:23'),
('20250076', '345', 'Course Completion', '876663', NULL, '2025-10-24', 'certificates/pdfs/20250076.pdf', 'certificates/qrcodes/20250076.png', 'Issued', '2025-10-24 21:00:35'),
('20250077', '456789', 'Course Completion', '876663', NULL, '2025-10-24', 'certificates/pdfs/20250077.pdf', 'certificates/qrcodes/20250077.png', 'Issued', '2025-10-24 21:10:43'),
('20250078', '890', 'Course Completion', '876663', NULL, '2025-10-24', 'certificates/pdfs/20250078.pdf', 'certificates/qrcodes/20250078.png', 'Issued', '2025-10-24 21:20:27'),
('20250079', '5643', 'Course Completion', '876663', NULL, '2025-10-24', 'certificates/pdfs/20250079.pdf', 'certificates/qrcodes/20250079.png', 'Issued', '2025-10-24 21:25:06'),
('20250080', '4120', 'Course Completion', '87666', NULL, '2025-10-24', 'certificates/pdfs/20250080.pdf', 'certificates/qrcodes/20250080.png', 'Issued', '2025-10-24 21:25:51'),
('20250081', '3097', 'Course Completion', '87666', NULL, '2025-10-24', 'certificates/pdfs/20250081.pdf', 'certificates/qrcodes/20250081.png', 'Issued', '2025-10-24 21:27:41'),
('20250082', '9754', 'Course Completion', '876663', NULL, '2025-10-24', 'certificates/pdfs/20250082.pdf', 'certificates/qrcodes/20250082.png', 'Issued', '2025-10-24 21:50:06'),
('20250083', '5678', 'Course Completion', '876663', NULL, '2025-10-24', 'certificates/pdfs/20250083.pdf', 'certificates/qrcodes/20250083.png', 'Issued', '2025-10-24 21:57:50'),
('20250084', '87902', 'Course Completion', '876663', NULL, '2025-10-25', 'certificates/pdfs/20250084.pdf', 'certificates/qrcodes/20250084.png', 'Issued', '2025-10-24 22:03:47'),
('20250085', '78900', 'Course Completion', '876663', NULL, '2025-10-25', 'certificates/pdfs/20250085.pdf', 'certificates/qrcodes/20250085.png', 'Issued', '2025-10-24 22:10:03'),
('20250086', 'tknp/b/751', 'Course Completion', '876663', NULL, '2025-10-25', 'certificates/pdfs/20250086.pdf', 'certificates/qrcodes/20250086.png', 'Issued', '2025-10-24 22:16:08'),
('20250087', '6312', 'Course Completion', '876663', NULL, '2025-10-25', 'certificates/pdfs/20250087.pdf', 'certificates/qrcodes/20250087.png', 'Issued', '2025-10-24 22:18:56'),
('20250088', '0987', 'Course Completion', '876663', NULL, '2025-10-25', 'certificates/pdfs/20250088.pdf', 'certificates/qrcodes/20250088.png', 'Issued', '2025-10-24 22:21:57'),
('20250089', '9643', 'Course Completion', '87666', NULL, '2025-10-25', 'certificates/pdfs/20250089.pdf', 'certificates/qrcodes/20250089.png', 'Issued', '2025-10-24 22:23:09'),
('20250090', 'tknp/c/2345', 'Course Completion', '876663', NULL, '2025-10-25', 'certificates/pdfs/20250090.pdf', 'certificates/qrcodes/20250090.png', 'Issued', '2025-10-25 07:48:58'),
('20250091', '6789', 'Course Completion', '876663', NULL, '2025-10-25', 'certificates/pdfs/20250091.pdf', 'certificates/qrcodes/20250091.png', 'Issued', '2025-10-25 08:41:13'),
('20250092', '5670', 'Course Completion', '876663', NULL, '2025-10-25', 'certificates/pdfs/20250092.pdf', 'certificates/qrcodes/20250092.png', 'Issued', '2025-10-25 08:52:22'),
('20250093', 'tknp/b/2261', 'Course Completion', '876663', NULL, '2025-10-25', 'certificates/pdfs/20250093.pdf', 'certificates/qrcodes/20250093.png', 'Issued', '2025-10-25 09:06:15'),
('20250094', '34509', 'Course Completion', '87666', NULL, '2025-10-25', 'certificates/pdfs/20250094.pdf', 'certificates/qrcodes/20250094.png', 'Issued', '2025-10-25 10:34:01'),
('20250095', '01234', 'Course Completion', '87666', NULL, '2025-10-25', 'certificates/pdfs/20250095.pdf', 'certificates/qrcodes/20250095.png', 'Issued', '2025-10-25 10:36:16'),
('20250096', '0987654', 'Course Completion', '87666', NULL, '2025-10-25', 'certificates/pdfs/20250096.pdf', 'certificates/qrcodes/20250096.png', 'Issued', '2025-10-25 10:38:19'),
('20250097', '53789', 'Course Completion', '876663', NULL, '2025-10-25', 'certificates/pdfs/20250097.pdf', 'certificates/qrcodes/20250097.png', 'Issued', '2025-10-25 11:31:11'),
('20250098', '0294', 'Course Completion', '876663', NULL, '2025-10-25', 'certificates/pdfs/20250098.pdf', 'certificates/qrcodes/20250098.png', 'Issued', '2025-10-25 11:57:38'),
('20250099', 'tknp/d/345218', 'Course Completion', '876663', NULL, '2025-10-27', 'certificates/pdfs/20250099.pdf', 'certificates/qrcodes/20250099.png', 'Issued', '2025-10-27 05:36:43'),
('20250100', 'tknp/b/2653864', 'Course Completion', '876663', NULL, '2025-10-27', 'certificates/pdfs/20250100.pdf', 'certificates/qrcodes/20250100.png', 'Issued', '2025-10-27 08:08:49'),
('20250101', 'TKNP/C/40912', 'Course Completion', '345678', NULL, '2025-11-04', 'certificates/pdfs/20250101.pdf', 'certificates/qrcodes/20250101.png', 'Issued', '2025-11-04 11:15:48'),
('20250102', 'TKNP/C/40875', 'Course Completion', '345678', NULL, '2025-11-04', 'certificates/pdfs/20250102.pdf', 'certificates/qrcodes/20250102.png', 'Issued', '2025-11-04 11:26:05'),
('20250103', 'tknp/c42190', 'Course Completion', '345678', NULL, '2025-11-04', 'certificates/pdfs/20250103.pdf', 'certificates/qrcodes/20250103.png', 'Issued', '2025-11-04 12:07:31'),
('20250104', 'tknp/3456', 'Course Completion', '34567', NULL, '2025-11-04', 'certificates/pdfs/20250104.pdf', 'certificates/qrcodes/20250104.png', 'Issued', '2025-11-04 12:23:26'),
('20250105', 'tknp/3457', 'Course Completion', '34567', NULL, '2025-11-04', 'certificates/pdfs/20250105.pdf', 'certificates/qrcodes/20250105.png', 'Issued', '2025-11-04 12:23:27'),
('20250106', 'tknp/3458', 'Course Completion', '34567', NULL, '2025-11-04', 'certificates/pdfs/20250106.pdf', 'certificates/qrcodes/20250106.png', 'Issued', '2025-11-04 12:23:27'),
('20250107', 'tknp/3459', 'Course Completion', '34567', NULL, '2025-11-04', 'certificates/pdfs/20250107.pdf', 'certificates/qrcodes/20250107.png', 'Issued', '2025-11-04 12:23:27'),
('20250108', 'tknp/3460', 'Course Completion', '34567', NULL, '2025-11-04', 'certificates/pdfs/20250108.pdf', 'certificates/qrcodes/20250108.png', 'Issued', '2025-11-04 12:23:27'),
('20250109', 'tknp/3461', 'Course Completion', '34567', NULL, '2025-11-04', 'certificates/pdfs/20250109.pdf', 'certificates/qrcodes/20250109.png', 'Issued', '2025-11-04 12:23:27'),
('20250110', 'tknp/3462', 'Course Completion', '34567', NULL, '2025-11-04', 'certificates/pdfs/20250110.pdf', 'certificates/qrcodes/20250110.png', 'Issued', '2025-11-04 12:23:27'),
('20250111', 'tknp/3463', 'Course Completion', '34567', NULL, '2025-11-04', 'certificates/pdfs/20250111.pdf', 'certificates/qrcodes/20250111.png', 'Issued', '2025-11-04 12:23:28'),
('20250112', 'tknp/3464', 'Course Completion', '34567', NULL, '2025-11-04', 'certificates/pdfs/20250112.pdf', 'certificates/qrcodes/20250112.png', 'Issued', '2025-11-04 12:23:28'),
('20250113', 'tknp/3471', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250113.pdf', 'certificates/qrcodes/20250113.png', 'Issued', '2025-11-05 05:19:00'),
('20250114', 'tknp/3472', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250114.pdf', 'certificates/qrcodes/20250114.png', 'Issued', '2025-11-05 05:19:00'),
('20250115', 'tknp/3473', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250115.pdf', 'certificates/qrcodes/20250115.png', 'Issued', '2025-11-05 05:19:00'),
('20250116', 'tknp/3474', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250116.pdf', 'certificates/qrcodes/20250116.png', 'Issued', '2025-11-05 05:19:00'),
('20250117', 'tknp/3475', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250117.pdf', 'certificates/qrcodes/20250117.png', 'Issued', '2025-11-05 05:19:00'),
('20250118', 'tknp/3476', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250118.pdf', 'certificates/qrcodes/20250118.png', 'Issued', '2025-11-05 05:19:01'),
('20250119', 'tknp/3477', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250119.pdf', 'certificates/qrcodes/20250119.png', 'Issued', '2025-11-05 05:19:01'),
('20250120', 'tknp/3478', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250120.pdf', 'certificates/qrcodes/20250120.png', 'Issued', '2025-11-05 05:19:01'),
('20250121', 'tknp/3479', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250121.pdf', 'certificates/qrcodes/20250121.png', 'Issued', '2025-11-05 05:19:01'),
('20250122', 'tknp/3481', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250122.pdf', 'certificates/qrcodes/20250122.png', 'Issued', '2025-11-05 05:26:51'),
('20250123', 'tknp/3482', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250123.pdf', 'certificates/qrcodes/20250123.png', 'Issued', '2025-11-05 05:26:51'),
('20250124', 'tknp/3483', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250124.pdf', 'certificates/qrcodes/20250124.png', 'Issued', '2025-11-05 05:26:51'),
('20250125', 'tknp/3484', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250125.pdf', 'certificates/qrcodes/20250125.png', 'Issued', '2025-11-05 05:26:52'),
('20250126', 'tknp/3485', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250126.pdf', 'certificates/qrcodes/20250126.png', 'Issued', '2025-11-05 05:26:52'),
('20250127', 'tknp/3486', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250127.pdf', 'certificates/qrcodes/20250127.png', 'Issued', '2025-11-05 05:26:52'),
('20250128', 'tknp/3487', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250128.pdf', 'certificates/qrcodes/20250128.png', 'Issued', '2025-11-05 05:26:52'),
('20250129', 'tknp/3488', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250129.pdf', 'certificates/qrcodes/20250129.png', 'Issued', '2025-11-05 05:26:52'),
('20250130', 'tknp/3489', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250130.pdf', 'certificates/qrcodes/20250130.png', 'Issued', '2025-11-05 05:26:53'),
('20250131', 'TKNP/C/4490', 'Course Completion', '345678', NULL, '2025-11-05', 'certificates/pdfs/20250131.pdf', 'certificates/qrcodes/20250131.png', 'Issued', '2025-11-05 05:30:16'),
('20250132', 'tknp/3491', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250132.pdf', 'certificates/qrcodes/20250132.png', 'Issued', '2025-11-05 05:32:34'),
('20250133', 'tknp/3492', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250133.pdf', 'certificates/qrcodes/20250133.png', 'Issued', '2025-11-05 05:32:34'),
('20250134', 'tknp/3493', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250134.pdf', 'certificates/qrcodes/20250134.png', 'Issued', '2025-11-05 05:32:34'),
('20250135', 'tknp/3494', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250135.pdf', 'certificates/qrcodes/20250135.png', 'Issued', '2025-11-05 05:32:34'),
('20250136', 'tknp/3495', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250136.pdf', 'certificates/qrcodes/20250136.png', 'Issued', '2025-11-05 05:32:34'),
('20250137', 'tknp/3496', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250137.pdf', 'certificates/qrcodes/20250137.png', 'Issued', '2025-11-05 05:32:35'),
('20250138', 'tknp/3497', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250138.pdf', 'certificates/qrcodes/20250138.png', 'Issued', '2025-11-05 05:32:35'),
('20250139', 'tknp/3498', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250139.pdf', 'certificates/qrcodes/20250139.png', 'Issued', '2025-11-05 05:32:35'),
('20250140', 'tknp/3499', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250140.pdf', 'certificates/qrcodes/20250140.png', 'Issued', '2025-11-05 05:32:35'),
('20250141', 'tknp/3421', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250141.pdf', 'certificates/qrcodes/20250141.png', 'Issued', '2025-11-05 05:44:28'),
('20250142', 'tknp/3422', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250142.pdf', 'certificates/qrcodes/20250142.png', 'Issued', '2025-11-05 05:44:28'),
('20250143', 'tknp/3423', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250143.pdf', 'certificates/qrcodes/20250143.png', 'Issued', '2025-11-05 05:44:28'),
('20250144', 'tknp/3424', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250144.pdf', 'certificates/qrcodes/20250144.png', 'Issued', '2025-11-05 05:44:29'),
('20250145', 'tknp/3425', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250145.pdf', 'certificates/qrcodes/20250145.png', 'Issued', '2025-11-05 05:44:29'),
('20250146', 'tknp/3426', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250146.pdf', 'certificates/qrcodes/20250146.png', 'Issued', '2025-11-05 05:44:29'),
('20250147', 'tknp/3427', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250147.pdf', 'certificates/qrcodes/20250147.png', 'Issued', '2025-11-05 05:44:29'),
('20250148', 'tknp/3428', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250148.pdf', 'certificates/qrcodes/20250148.png', 'Issued', '2025-11-05 05:44:29'),
('20250149', 'tknp/3429', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250149.pdf', 'certificates/qrcodes/20250149.png', 'Issued', '2025-11-05 05:44:30'),
('20250150', 'TKNP/C/41111', 'Course Completion', '345678', NULL, '2025-11-05', 'certificates/pdfs/20250150.pdf', 'certificates/qrcodes/20250150.png', 'Issued', '2025-11-05 05:46:24'),
('20250151', 'tknp/342', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250151.pdf', 'certificates/qrcodes/20250151.png', 'Issued', '2025-11-05 06:01:41'),
('20250152', 'tknp/343', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250152.pdf', 'certificates/qrcodes/20250152.png', 'Issued', '2025-11-05 06:05:02'),
('20250153', 'tknp/344', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250153.pdf', 'certificates/qrcodes/20250153.png', 'Issued', '2025-11-05 06:05:03'),
('20250154', 'tknp/345', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250154.pdf', 'certificates/qrcodes/20250154.png', 'Issued', '2025-11-05 06:05:03'),
('20250155', 'tknp/346', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250155.pdf', 'certificates/qrcodes/20250155.png', 'Issued', '2025-11-05 06:05:03'),
('20250156', 'tknp/347', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250156.pdf', 'certificates/qrcodes/20250156.png', 'Issued', '2025-11-05 06:05:04'),
('20250157', 'tknp/348', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250157.pdf', 'certificates/qrcodes/20250157.png', 'Issued', '2025-11-05 06:05:04'),
('20250158', 'tknp/349', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250158.pdf', 'certificates/qrcodes/20250158.png', 'Issued', '2025-11-05 06:05:04'),
('20250159', 'tknp/350', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250159.pdf', 'certificates/qrcodes/20250159.png', 'Issued', '2025-11-05 06:05:04'),
('20250160', 'TKNP/C/4091265', 'Course Completion', '345678', NULL, '2025-11-05', 'certificates/pdfs/20250160.pdf', 'certificates/qrcodes/20250160.png', 'Issued', '2025-11-05 06:08:56'),
('20250161', 'tknp/351', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250161.pdf', 'certificates/qrcodes/20250161.png', 'Issued', '2025-11-05 06:14:07'),
('20250162', 'tknp/352', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250162.pdf', 'certificates/qrcodes/20250162.png', 'Issued', '2025-11-05 06:25:44'),
('20250163', 'tknp/361', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250163.pdf', 'certificates/qrcodes/20250163.png', 'Issued', '2025-11-05 06:31:21'),
('20250164', 'tknp/362', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250164.pdf', 'certificates/qrcodes/20250164.png', 'Issued', '2025-11-05 06:31:21'),
('20250165', 'tknp/363', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250165.pdf', 'certificates/qrcodes/20250165.png', 'Issued', '2025-11-05 06:31:22'),
('20250166', 'tknp/364', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250166.pdf', 'certificates/qrcodes/20250166.png', 'Issued', '2025-11-05 06:31:22'),
('20250167', 'tknp/365', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250167.pdf', 'certificates/qrcodes/20250167.png', 'Issued', '2025-11-05 06:31:22'),
('20250168', 'tknp/366', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250168.pdf', 'certificates/qrcodes/20250168.png', 'Issued', '2025-11-05 06:31:22'),
('20250169', 'tknp/367', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250169.pdf', 'certificates/qrcodes/20250169.png', 'Issued', '2025-11-05 06:31:23'),
('20250170', 'tknp/368', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250170.pdf', 'certificates/qrcodes/20250170.png', 'Issued', '2025-11-05 06:31:23'),
('20250171', 'tknp/369', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250171.pdf', 'certificates/qrcodes/20250171.png', 'Issued', '2025-11-05 06:31:23'),
('20250172', 'tknp/375', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250172_batch.pdf', 'certificates/qrcodes/20250172.png', 'Issued', '2025-11-05 06:33:41'),
('20250173', 'tknp/376', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250173_batch.pdf', 'certificates/qrcodes/20250173.png', 'Issued', '2025-11-05 06:33:41'),
('20250174', 'tknp/377', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250174_batch.pdf', 'certificates/qrcodes/20250174.png', 'Issued', '2025-11-05 06:33:41'),
('20250175', 'tknp/378', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250175_batch.pdf', 'certificates/qrcodes/20250175.png', 'Issued', '2025-11-05 06:33:41'),
('20250176', 'tknp/379', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250176_batch.pdf', 'certificates/qrcodes/20250176.png', 'Issued', '2025-11-05 06:33:41'),
('20250177', 'tknp/380', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250177_batch.pdf', 'certificates/qrcodes/20250177.png', 'Issued', '2025-11-05 06:33:41'),
('20250178', 'tknp/381', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250178_batch.pdf', 'certificates/qrcodes/20250178.png', 'Issued', '2025-11-05 06:33:41'),
('20250179', 'tknp/382', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250179_batch.pdf', 'certificates/qrcodes/20250179.png', 'Issued', '2025-11-05 06:33:42'),
('20250180', 'tknp/383', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250180_batch.pdf', 'certificates/qrcodes/20250180.png', 'Issued', '2025-11-05 06:33:42'),
('20250181', 'tknp/384', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250181_batch.pdf', 'certificates/qrcodes/20250181.png', 'Issued', '2025-11-05 06:40:16'),
('20250182', 'tknp/385', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250182_batch.pdf', 'certificates/qrcodes/20250182.png', 'Issued', '2025-11-05 06:40:16'),
('20250183', 'tknp/386', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250183_batch.pdf', 'certificates/qrcodes/20250183.png', 'Issued', '2025-11-05 06:40:16'),
('20250184', 'tknp/387', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250184_batch.pdf', 'certificates/qrcodes/20250184.png', 'Issued', '2025-11-05 06:40:16'),
('20250185', 'tknp/388', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250185_batch.pdf', 'certificates/qrcodes/20250185.png', 'Issued', '2025-11-05 06:40:16'),
('20250186', 'tknp/389', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250186_batch.pdf', 'certificates/qrcodes/20250186.png', 'Issued', '2025-11-05 06:40:17'),
('20250187', 'tknp/390', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250187_batch.pdf', 'certificates/qrcodes/20250187.png', 'Issued', '2025-11-05 06:40:17'),
('20250188', 'tknp/391', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250188_batch.pdf', 'certificates/qrcodes/20250188.png', 'Issued', '2025-11-05 06:40:17'),
('20250189', 'tknp/392', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250189_batch.pdf', 'certificates/qrcodes/20250189.png', 'Issued', '2025-11-05 06:40:17'),
('20250190', 'tknp/394', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/20250190.pdf', 'certificates/qrcodes/20250190.png', 'Issued', '2025-11-05 06:50:05'),
('20250191', 'tknp/34021', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_082919.pdf', 'certificates/qrcodes/20250191.png', 'Issued', '2025-11-05 07:29:20'),
('20250192', 'tknp/34022', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_082919.pdf', 'certificates/qrcodes/20250192.png', 'Issued', '2025-11-05 07:29:20'),
('20250193', 'tknp/34023', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_082919.pdf', 'certificates/qrcodes/20250193.png', 'Issued', '2025-11-05 07:29:20'),
('20250194', 'tknp/34024', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_082919.pdf', 'certificates/qrcodes/20250194.png', 'Issued', '2025-11-05 07:29:20'),
('20250195', 'tknp/34025', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_082919.pdf', 'certificates/qrcodes/20250195.png', 'Issued', '2025-11-05 07:29:20'),
('20250196', 'tknp/34026', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_082919.pdf', 'certificates/qrcodes/20250196.png', 'Issued', '2025-11-05 07:29:20'),
('20250197', 'tknp/34027', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_082919.pdf', 'certificates/qrcodes/20250197.png', 'Issued', '2025-11-05 07:29:20'),
('20250198', 'tknp/34028', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_082919.pdf', 'certificates/qrcodes/20250198.png', 'Issued', '2025-11-05 07:29:20'),
('20250199', 'tknp/34029', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_082919.pdf', 'certificates/qrcodes/20250199.png', 'Issued', '2025-11-05 07:29:20'),
('20250200', 'tknp/34030', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_083033.pdf', 'certificates/qrcodes/20250200.png', 'Issued', '2025-11-05 07:30:33'),
('20250201', 'tknp/34031', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_083033.pdf', 'certificates/qrcodes/20250201.png', 'Issued', '2025-11-05 07:30:34'),
('20250202', 'tknp/34032', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_083033.pdf', 'certificates/qrcodes/20250202.png', 'Issued', '2025-11-05 07:30:34'),
('20250203', 'tknp/34033', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_083033.pdf', 'certificates/qrcodes/20250203.png', 'Issued', '2025-11-05 07:30:34'),
('20250204', 'tknp/34034', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_083033.pdf', 'certificates/qrcodes/20250204.png', 'Issued', '2025-11-05 07:30:34'),
('20250205', 'tknp/34035', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_083033.pdf', 'certificates/qrcodes/20250205.png', 'Issued', '2025-11-05 07:30:34'),
('20250206', 'tknp/34036', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_083033.pdf', 'certificates/qrcodes/20250206.png', 'Issued', '2025-11-05 07:30:35'),
('20250207', 'tknp/34037', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_083033.pdf', 'certificates/qrcodes/20250207.png', 'Issued', '2025-11-05 07:30:35'),
('20250208', 'tknp/34038', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_083033.pdf', 'certificates/qrcodes/20250208.png', 'Issued', '2025-11-05 07:30:35'),
('20250209', 'tknp/34040', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Certificates_BATCH_20251105_084003_20251105_084016.pdf', 'certificates/qrcodes/20250209.png', 'Issued', '2025-11-05 07:40:16'),
('20250210', 'tknp/34041', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Certificates_BATCH_20251105_084003_20251105_084016.pdf', 'certificates/qrcodes/20250210.png', 'Issued', '2025-11-05 07:40:16'),
('20250211', 'tknp/34042', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Certificates_BATCH_20251105_084003_20251105_084016.pdf', 'certificates/qrcodes/20250211.png', 'Issued', '2025-11-05 07:40:16'),
('20250212', 'tknp/34043', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Certificates_BATCH_20251105_084003_20251105_084016.pdf', 'certificates/qrcodes/20250212.png', 'Issued', '2025-11-05 07:40:16'),
('20250213', 'tknp/34044', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Certificates_BATCH_20251105_084003_20251105_084016.pdf', 'certificates/qrcodes/20250213.png', 'Issued', '2025-11-05 07:40:17'),
('20250214', 'tknp/34045', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Certificates_BATCH_20251105_084003_20251105_084016.pdf', 'certificates/qrcodes/20250214.png', 'Issued', '2025-11-05 07:40:17'),
('20250215', 'tknp/34046', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Certificates_BATCH_20251105_084003_20251105_084016.pdf', 'certificates/qrcodes/20250215.png', 'Issued', '2025-11-05 07:40:17'),
('20250216', 'tknp/34047', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Certificates_BATCH_20251105_084003_20251105_084016.pdf', 'certificates/qrcodes/20250216.png', 'Issued', '2025-11-05 07:40:17'),
('20250217', 'tknp/34048', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Certificates_BATCH_20251105_084003_20251105_084016.pdf', 'certificates/qrcodes/20250217.png', 'Issued', '2025-11-05 07:40:17'),
('20250218', 'tknp/34049', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_085145.pdf', 'certificates/qrcodes/20250218.png', 'Issued', '2025-11-05 07:51:45'),
('20250219', 'tknp/34050', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_085145.pdf', 'certificates/qrcodes/20250219.png', 'Issued', '2025-11-05 07:51:45'),
('20250220', 'tknp/34051', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_085145.pdf', 'certificates/qrcodes/20250220.png', 'Issued', '2025-11-05 07:51:45'),
('20250221', 'tknp/34052', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_085145.pdf', 'certificates/qrcodes/20250221.png', 'Issued', '2025-11-05 07:51:45'),
('20250222', 'tknp/34053', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_085145.pdf', 'certificates/qrcodes/20250222.png', 'Issued', '2025-11-05 07:51:45'),
('20250223', 'tknp/34054', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_085145.pdf', 'certificates/qrcodes/20250223.png', 'Issued', '2025-11-05 07:51:45'),
('20250224', 'tknp/34055', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_085145.pdf', 'certificates/qrcodes/20250224.png', 'Issued', '2025-11-05 07:51:45'),
('20250225', 'tknp/34056', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_085145.pdf', 'certificates/qrcodes/20250225.png', 'Issued', '2025-11-05 07:51:46'),
('20250226', 'tknp/34057', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_085145.pdf', 'certificates/qrcodes/20250226.png', 'Issued', '2025-11-05 07:51:46'),
('20250227', 'tknp/34058', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_085927.pdf', 'certificates/qrcodes/20250227.png', 'Issued', '2025-11-05 07:59:27'),
('20250228', 'tknp/34059', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_085927.pdf', 'certificates/qrcodes/20250228.png', 'Issued', '2025-11-05 07:59:27'),
('20250229', 'tknp/34060', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_085927.pdf', 'certificates/qrcodes/20250229.png', 'Issued', '2025-11-05 07:59:27'),
('20250230', 'tknp/34061', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_085927.pdf', 'certificates/qrcodes/20250230.png', 'Issued', '2025-11-05 07:59:27'),
('20250231', 'tknp/34062', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_085927.pdf', 'certificates/qrcodes/20250231.png', 'Issued', '2025-11-05 07:59:28'),
('20250232', 'tknp/34063', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_085927.pdf', 'certificates/qrcodes/20250232.png', 'Issued', '2025-11-05 07:59:28'),
('20250233', 'tknp/34064', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_085927.pdf', 'certificates/qrcodes/20250233.png', 'Issued', '2025-11-05 07:59:28'),
('20250234', 'tknp/34065', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_085927.pdf', 'certificates/qrcodes/20250234.png', 'Issued', '2025-11-05 07:59:28'),
('20250235', 'tknp/34066', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_085927.pdf', 'certificates/qrcodes/20250235.png', 'Issued', '2025-11-05 07:59:28'),
('20250236', 'tknp/34068', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_091734.pdf', 'certificates/qrcodes/20250236.png', 'Issued', '2025-11-05 08:17:34'),
('20250237', 'tknp/34069', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_091734.pdf', 'certificates/qrcodes/20250237.png', 'Issued', '2025-11-05 08:17:34'),
('20250238', 'tknp/34070', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_091734.pdf', 'certificates/qrcodes/20250238.png', 'Issued', '2025-11-05 08:17:34'),
('20250239', 'tknp/34071', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_091734.pdf', 'certificates/qrcodes/20250239.png', 'Issued', '2025-11-05 08:17:34'),
('20250240', 'tknp/34072', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_091734.pdf', 'certificates/qrcodes/20250240.png', 'Issued', '2025-11-05 08:17:34'),
('20250241', 'tknp/34073', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_091734.pdf', 'certificates/qrcodes/20250241.png', 'Issued', '2025-11-05 08:17:35'),
('20250242', 'tknp/34074', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_091734.pdf', 'certificates/qrcodes/20250242.png', 'Issued', '2025-11-05 08:17:35'),
('20250243', 'tknp/34075', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_091734.pdf', 'certificates/qrcodes/20250243.png', 'Issued', '2025-11-05 08:17:35'),
('20250244', 'tknp/34076', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_091734.pdf', 'certificates/qrcodes/20250244.png', 'Issued', '2025-11-05 08:17:35'),
('20250245', 'tknp/34077', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_092729.pdf', 'certificates/qrcodes/20250245.png', 'Issued', '2025-11-05 08:27:30'),
('20250246', 'tknp/34078', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_092729.pdf', 'certificates/qrcodes/20250246.png', 'Issued', '2025-11-05 08:27:30'),
('20250247', 'tknp/34079', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_092729.pdf', 'certificates/qrcodes/20250247.png', 'Issued', '2025-11-05 08:27:30'),
('20250248', 'tknp/34080', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_092729.pdf', 'certificates/qrcodes/20250248.png', 'Issued', '2025-11-05 08:27:30'),
('20250249', 'tknp/34081', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_092729.pdf', 'certificates/qrcodes/20250249.png', 'Issued', '2025-11-05 08:27:30'),
('20250250', 'tknp/34082', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_092729.pdf', 'certificates/qrcodes/20250250.png', 'Issued', '2025-11-05 08:27:30'),
('20250251', 'tknp/34083', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_092729.pdf', 'certificates/qrcodes/20250251.png', 'Issued', '2025-11-05 08:27:30'),
('20250252', 'tknp/34084', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_092729.pdf', 'certificates/qrcodes/20250252.png', 'Issued', '2025-11-05 08:27:31'),
('20250253', 'tknp/34085', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_092729.pdf', 'certificates/qrcodes/20250253.png', 'Issued', '2025-11-05 08:27:31'),
('20250254', 'tknp/34086', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_094236.pdf', 'certificates/qrcodes/20250254.png', 'Issued', '2025-11-05 08:42:37'),
('20250255', 'tknp/34087', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_094236.pdf', 'certificates/qrcodes/20250255.png', 'Issued', '2025-11-05 08:42:37'),
('20250256', 'tknp/34088', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_094236.pdf', 'certificates/qrcodes/20250256.png', 'Issued', '2025-11-05 08:42:37'),
('20250257', 'tknp/34089', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_094236.pdf', 'certificates/qrcodes/20250257.png', 'Issued', '2025-11-05 08:42:37'),
('20250258', 'tknp/34090', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_094236.pdf', 'certificates/qrcodes/20250258.png', 'Issued', '2025-11-05 08:42:37'),
('20250259', 'tknp/34091', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_094236.pdf', 'certificates/qrcodes/20250259.png', 'Issued', '2025-11-05 08:42:37'),
('20250260', 'tknp/34092', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_094236.pdf', 'certificates/qrcodes/20250260.png', 'Issued', '2025-11-05 08:42:38'),
('20250261', 'tknp/34093', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_094236.pdf', 'certificates/qrcodes/20250261.png', 'Issued', '2025-11-05 08:42:38'),
('20250262', 'tknp/34094', 'Course Completion', '34567', NULL, '2025-11-05', 'certificates/pdfs/Batch_Certificates_20251105_094236.pdf', 'certificates/qrcodes/20250262.png', 'Issued', '2025-11-05 08:42:38'),
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
('KNP-2025-2B54DB', 'tknp/b/225', 'Course Completion', NULL, NULL, '2025-10-16', 'certificates/pdfs/KNP-2025-2B54DB.pdf', 'certificates/qrcodes/KNP-2025-2B54DB.png', 'Issued', '2025-10-16 08:40:30');
INSERT INTO `certificates` (`cert_no`, `admission_no`, `cert_type`, `qualification_code`, `qualification_type`, `issue_date`, `pdf_path`, `qr_path`, `status`, `created_at`) VALUES
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
-- Table structure for table `import_logs`
--

CREATE TABLE `import_logs` (
  `id` int(11) NOT NULL,
  `batch_id` varchar(50) NOT NULL,
  `imported_by` varchar(100) DEFAULT NULL,
  `total_students` int(11) DEFAULT 0,
  `import_time` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `import_logs`
--

INSERT INTO `import_logs` (`id`, `batch_id`, `imported_by`, `total_students`, `import_time`) VALUES
(1, 'BATCH_20251105_084003', 'Registrar', 9, '2025-11-05 10:40:03'),
(2, 'BATCH_20251105_085139', 'Registrar', 9, '2025-11-05 10:51:39'),
(3, 'BATCH_20251105_085918', 'Registrar', 9, '2025-11-05 10:59:18'),
(4, 'BATCH_20251105_091730', 'Registrar', 9, '2025-11-05 11:17:30'),
(5, 'BATCH_20251105_092726', 'Registrar', 9, '2025-11-05 11:27:26'),
(6, 'BATCH_20251105_094139', 'Registrar', 9, '2025-11-05 11:41:39');

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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `batch_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`admission_no`, `name`, `course`, `qualification_code`, `qualification_type`, `grade`, `completion_year`, `created_at`, `batch_id`) VALUES
('01234', 'Bonface Masinde Ndombi', 'Computer Science', '87666', 'National Diploma', 'Credit', '2025', '2025-10-25 10:36:13', NULL),
('0294', 'Bonface Masinde Ndombi', 'Computer Science', '876663', 'National Diploma', 'Credit', '2025', '2025-10-25 11:57:34', NULL),
('0987', 'Bonface Masinde Ndombi', 'Computer Science', '876663', 'National Diploma', 'Credit', '2024', '2025-10-24 22:21:54', NULL),
('0987654', 'Bonface Masinde Ndombi', 'Computer Science', '87666', 'National Diploma', 'Credit', '2025', '2025-10-25 10:38:15', NULL),
('1234', 'Bonface Masinde Ndombi', 'Computer Science', '87666', 'National Diploma', 'Credit', '0000', '2025-10-24 18:29:27', NULL),
('12378', 'Bonface Masinde Ndombi', 'Computer Science', '87666', 'National Diploma', 'Credit', '2025', '2025-10-24 20:43:40', NULL),
('234', 'Bonface Masinde Ndombi', 'Computer Science', '87666', 'National Diploma', 'Credit', '2025', '2025-10-24 18:17:09', NULL),
('2345', 'Bonface Masinde Ndombi', 'Computer Science', '876663', 'National Diploma', 'Credit', '0000', '2025-10-24 18:26:33', NULL),
('3097', 'Bonface Masinde Ndombi', 'Computer Science', '87666', 'National Diploma', 'Credit', '2025', '2025-10-24 21:27:37', NULL),
('345', 'Bonface Masinde Ndombi', 'Computer Science', '876663', 'National Diploma', 'Credit', '2024', '2025-10-24 21:00:32', NULL),
('34509', 'Bonface Masinde Ndombi', 'Computer Science', '87666', 'National Diploma', 'Credit', '2025', '2025-10-25 10:28:20', NULL),
('34567', 'Bonface Masinde Ndombi', 'Computer Science', '87666', 'National Diploma', 'Credit', '2025', '2025-10-24 19:26:01', NULL),
('4120', 'Bonface Masinde Ndombi', 'Computer Science', '87666', 'National Diploma', 'Credit', '2024', '2025-10-24 21:25:48', NULL),
('43544', 'Bonface Masinde Ndombi', 'Computer Science level 6', '876663', 'National Diploma', 'Credit', '0000', '2025-10-24 18:51:26', NULL),
('455', 'Bonface Masinde Ndombi', 'Computer Science', '87666', 'National Diploma', 'Credit', '2024', '2025-10-24 19:54:37', NULL),
('456789', 'Bonface Masinde Ndombi', 'Computer Science', '876663', 'National Diploma', 'Credit', '2024', '2025-10-24 21:10:40', NULL),
('53789', 'Bonface Masinde Ndombi', 'Computer Science', '876663', 'National Diploma', 'Credit', '2025', '2025-10-25 11:26:52', NULL),
('5643', 'Bonface Masinde Ndombi', 'Computer Science', '876663', 'National Diploma', 'Credit', '2025', '2025-10-24 21:25:02', NULL),
('5670', 'Bonface Masinde Ndombi', 'Computer Science', '876663', 'National Diploma', 'Credit', '2025', '2025-10-25 08:52:19', NULL),
('5678', 'Bonface Masinde Ndombi', 'Computer Science', '876663', 'National Diploma', 'Credit', '2025', '2025-10-24 21:57:47', NULL),
('6312', 'Bonface Masinde Ndombi', 'Computer Science', '876663', 'National Diploma', 'Credit', '2025', '2025-10-24 22:18:54', NULL),
('6789', 'Bonface Masinde Ndombi', 'Computer Science', '876663', 'National Diploma', 'Credit', '2025', '2025-10-25 08:41:09', NULL),
('78900', 'Bonface Masinde Ndombi', 'Computer Science', '876663', 'National Diploma', 'Credit', '2024', '2025-10-24 22:09:58', NULL),
('87902', 'Bonface Masinde Ndombi', 'Computer Science', '876663', 'National Diploma', 'Credit', '2025', '2025-10-24 22:03:42', NULL),
('890', 'Bonface Masinde Ndombi', 'Computer Science', '876663', 'National Diploma', 'Credit', '2025', '2025-10-24 21:18:01', NULL),
('9643', 'Bonface Masinde Ndombi', 'Computer Science', '87666', 'National Diploma', 'Credit', '2024', '2025-10-24 22:23:06', NULL),
('9754', 'Bonface Masinde Ndombi', 'Computer Science', '876663', 'National Diploma', 'Credit', '2024', '2025-10-24 21:49:54', NULL),
('tknp/34012', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:13:30', NULL),
('tknp/34013', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:13:30', NULL),
('tknp/34014', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:13:30', NULL),
('tknp/34015', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:13:30', NULL),
('tknp/34016', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:13:30', NULL),
('tknp/34017', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:13:30', NULL),
('tknp/34018', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:13:30', NULL),
('tknp/34019', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:13:30', NULL),
('tknp/34020', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:13:30', NULL),
('tknp/34021', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:19:41', NULL),
('tknp/34022', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:19:41', NULL),
('tknp/34023', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:19:41', NULL),
('tknp/34024', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:19:41', NULL),
('tknp/34025', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:19:41', NULL),
('tknp/34026', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:19:41', NULL),
('tknp/34027', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:19:41', NULL),
('tknp/34028', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:19:41', NULL),
('tknp/34029', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:19:41', NULL),
('tknp/3403', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:06:34', NULL),
('tknp/34030', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:30:30', NULL),
('tknp/34031', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:30:30', NULL),
('tknp/34032', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:30:30', NULL),
('tknp/34033', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:30:30', NULL),
('tknp/34034', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:30:30', NULL),
('tknp/34035', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:30:30', NULL),
('tknp/34036', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:30:30', NULL),
('tknp/34037', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:30:30', NULL),
('tknp/34038', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:30:30', NULL),
('tknp/3404', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:06:34', NULL),
('tknp/34040', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:40:03', 'BATCH_20251105_084003'),
('tknp/34041', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:40:03', 'BATCH_20251105_084003'),
('tknp/34042', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:40:03', 'BATCH_20251105_084003'),
('tknp/34043', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:40:03', 'BATCH_20251105_084003'),
('tknp/34044', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:40:03', 'BATCH_20251105_084003'),
('tknp/34045', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:40:03', 'BATCH_20251105_084003'),
('tknp/34046', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:40:03', 'BATCH_20251105_084003'),
('tknp/34047', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:40:03', 'BATCH_20251105_084003'),
('tknp/34048', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:40:03', 'BATCH_20251105_084003'),
('tknp/34049', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:51:39', 'BATCH_20251105_085139'),
('tknp/3405', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:06:34', NULL),
('tknp/34050', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:51:39', 'BATCH_20251105_085139'),
('tknp/34051', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:51:39', 'BATCH_20251105_085139'),
('tknp/34052', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:51:39', 'BATCH_20251105_085139'),
('tknp/34053', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:51:39', 'BATCH_20251105_085139'),
('tknp/34054', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:51:39', 'BATCH_20251105_085139'),
('tknp/34055', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:51:39', 'BATCH_20251105_085139'),
('tknp/34056', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:51:39', 'BATCH_20251105_085139'),
('tknp/34057', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:51:39', 'BATCH_20251105_085139'),
('tknp/34058', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:59:18', 'BATCH_20251105_085918'),
('tknp/34059', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:59:18', 'BATCH_20251105_085918'),
('tknp/3406', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:06:34', NULL),
('tknp/34060', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:59:18', 'BATCH_20251105_085918'),
('tknp/34061', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:59:18', 'BATCH_20251105_085918'),
('tknp/34062', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:59:18', 'BATCH_20251105_085918'),
('tknp/34063', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:59:18', 'BATCH_20251105_085918'),
('tknp/34064', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:59:18', 'BATCH_20251105_085918'),
('tknp/34065', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:59:18', 'BATCH_20251105_085918'),
('tknp/34066', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:59:18', 'BATCH_20251105_085918'),
('tknp/34068', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 08:17:30', 'BATCH_20251105_091730'),
('tknp/34069', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 08:17:30', 'BATCH_20251105_091730'),
('tknp/3407', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:06:34', NULL),
('tknp/34070', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 08:17:30', 'BATCH_20251105_091730'),
('tknp/34071', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 08:17:30', 'BATCH_20251105_091730'),
('tknp/34072', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 08:17:30', 'BATCH_20251105_091730'),
('tknp/34073', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 08:17:30', 'BATCH_20251105_091730'),
('tknp/34074', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 08:17:30', 'BATCH_20251105_091730'),
('tknp/34075', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 08:17:30', 'BATCH_20251105_091730'),
('tknp/34076', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 08:17:30', 'BATCH_20251105_091730'),
('tknp/34077', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 08:27:26', 'BATCH_20251105_092726'),
('tknp/34078', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 08:27:26', 'BATCH_20251105_092726'),
('tknp/34079', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 08:27:26', 'BATCH_20251105_092726'),
('tknp/3408', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:06:34', NULL),
('tknp/34080', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 08:27:26', 'BATCH_20251105_092726'),
('tknp/34081', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 08:27:26', 'BATCH_20251105_092726'),
('tknp/34082', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 08:27:26', 'BATCH_20251105_092726'),
('tknp/34083', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 08:27:26', 'BATCH_20251105_092726'),
('tknp/34084', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 08:27:26', 'BATCH_20251105_092726'),
('tknp/34085', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 08:27:26', 'BATCH_20251105_092726'),
('tknp/34086', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 08:41:39', 'BATCH_20251105_094139'),
('tknp/34087', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 08:41:39', 'BATCH_20251105_094139'),
('tknp/34088', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 08:41:39', 'BATCH_20251105_094139'),
('tknp/34089', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 08:41:39', 'BATCH_20251105_094139'),
('tknp/3409', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:06:34', NULL),
('tknp/34090', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 08:41:39', 'BATCH_20251105_094139'),
('tknp/34091', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 08:41:39', 'BATCH_20251105_094139'),
('tknp/34092', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 08:41:39', 'BATCH_20251105_094139'),
('tknp/34093', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 08:41:39', 'BATCH_20251105_094139'),
('tknp/34094', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 08:41:39', 'BATCH_20251105_094139'),
('tknp/3410', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:06:34', NULL),
('tknp/3411', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 07:06:34', NULL),
('tknp/342', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 06:01:38', NULL),
('tknp/3421', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 05:44:24', NULL),
('tknp/3422', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 05:44:24', NULL),
('tknp/3423', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 05:44:24', NULL),
('tknp/3424', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 05:44:24', NULL),
('tknp/3425', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 05:44:24', NULL),
('tknp/3426', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 05:44:24', NULL),
('tknp/3427', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 05:44:24', NULL),
('tknp/3428', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 05:44:24', NULL),
('tknp/3429', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 05:44:24', NULL),
('tknp/343', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 06:01:38', NULL),
('tknp/344', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 06:01:38', NULL),
('tknp/345', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 06:01:38', NULL),
('tknp/3456', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-04 12:21:46', NULL),
('tknp/3457', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-04 12:21:46', NULL),
('tknp/3458', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-04 12:21:46', NULL),
('tknp/3459', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-04 12:21:46', NULL),
('tknp/346', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 06:01:38', NULL),
('tknp/3460', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-04 12:21:46', NULL),
('tknp/3461', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-04 12:21:46', NULL),
('tknp/3462', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-04 12:21:46', NULL),
('tknp/3463', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-04 12:21:46', NULL),
('tknp/3464', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-04 12:21:46', NULL),
('tknp/347', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 06:01:38', NULL),
('tknp/3471', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 05:18:55', NULL),
('tknp/3472', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 05:18:55', NULL),
('tknp/3473', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 05:18:55', NULL),
('tknp/3474', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 05:18:55', NULL),
('tknp/3475', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 05:18:55', NULL),
('tknp/3476', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 05:18:55', NULL),
('tknp/3477', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 05:18:55', NULL),
('tknp/3478', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 05:18:55', NULL),
('tknp/3479', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 05:18:55', NULL),
('tknp/348', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 06:01:38', NULL),
('tknp/3481', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 05:26:47', NULL),
('tknp/3482', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 05:26:47', NULL),
('tknp/3483', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 05:26:47', NULL),
('tknp/3484', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 05:26:47', NULL),
('tknp/3485', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 05:26:47', NULL),
('tknp/3486', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 05:26:47', NULL),
('tknp/3487', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 05:26:47', NULL),
('tknp/3488', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 05:26:47', NULL),
('tknp/3489', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 05:26:47', NULL),
('tknp/349', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 06:01:38', NULL),
('tknp/3491', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 05:32:29', NULL),
('tknp/3492', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 05:32:29', NULL),
('tknp/3493', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 05:32:29', NULL),
('tknp/3494', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 05:32:29', NULL),
('tknp/3495', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 05:32:29', NULL),
('tknp/3496', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 05:32:29', NULL),
('tknp/3497', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 05:32:29', NULL),
('tknp/3498', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 05:32:29', NULL),
('tknp/3499', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 05:32:29', NULL),
('tknp/350', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 06:01:38', NULL),
('tknp/351', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 06:13:56', NULL),
('tknp/352', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 06:25:41', NULL),
('tknp/361', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 06:31:18', NULL),
('tknp/362', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 06:31:18', NULL),
('tknp/363', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 06:31:18', NULL),
('tknp/364', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 06:31:18', NULL),
('tknp/365', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 06:31:18', NULL),
('tknp/366', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 06:31:18', NULL),
('tknp/367', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 06:31:18', NULL),
('tknp/368', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 06:31:18', NULL),
('tknp/369', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 06:31:18', NULL),
('tknp/375', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 06:33:37', NULL),
('tknp/376', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 06:33:37', NULL),
('tknp/377', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 06:33:37', NULL),
('tknp/378', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 06:33:37', NULL),
('tknp/379', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 06:33:37', NULL),
('tknp/380', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 06:33:37', NULL),
('tknp/381', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 06:33:37', NULL),
('tknp/382', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 06:33:37', NULL),
('tknp/383', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 06:33:37', NULL),
('tknp/384', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 06:40:12', NULL),
('tknp/385', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 06:40:12', NULL),
('tknp/386', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 06:40:12', NULL),
('tknp/387', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 06:40:12', NULL),
('tknp/388', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 06:40:12', NULL),
('tknp/389', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 06:40:12', NULL),
('tknp/390', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 06:40:12', NULL),
('tknp/391', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 06:40:12', NULL),
('tknp/392', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 06:40:12', NULL),
('tknp/394', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 06:50:02', NULL),
('tknp/395', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 06:50:02', NULL),
('tknp/396', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 06:50:02', NULL),
('tknp/397', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 06:50:02', NULL),
('tknp/398', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 06:50:02', NULL),
('tknp/399', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 06:50:02', NULL),
('tknp/400', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 06:50:02', NULL),
('tknp/401', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 06:50:02', NULL),
('tknp/402', 'Bonface Masinde Ndombi', 'Computer Science', '34567', 'National Diploma', 'Credit', '2025', '2025-11-05 06:50:02', NULL),
('tknp/b/0000', 'Bonface Masinde Ndombi', 'Computer Science', '876663', 'National Diploma', 'Credit', '0000', '2025-10-24 17:37:11', NULL),
('tknp/b/1234', 'Bonface Masinde Ndombi', 'Computer Science', '87666', 'National Diploma', 'Credit', '2025', '2025-10-24 17:40:16', NULL),
('tknp/b/222', 'bonface', 'ict level 6', NULL, NULL, 'pass', '2025', '2025-10-15 11:22:52', NULL),
('tknp/b/22256', 'Bonface Masinde Ndombi', 'Computer Science', '876663', 'National Diploma', 'pass', '2024', '2025-10-24 18:12:38', NULL),
('tknp/b/223', 'Bonface Masinde Ndombi', 'ict level 6', NULL, NULL, 'Pass', '2026', '2025-10-15 12:20:49', NULL),
('tknp/b/2232', 'Bonface Masinde Ndombi', 'Computer Science level 6', '87666', 'National Diploma', 'Credit', '2025', '2025-10-23 16:27:53', NULL),
('tknp/b/22334', 'Bonface Masinde Ndombi', 'Computer Science level 6', '87666', 'National Diploma', 'Credit', '0000', '2025-10-24 17:14:15', NULL),
('tknp/b/2234', 'Bonface Masinde Ndombi', 'Computer Science level 6', '87666', 'National Diploma', 'Credit', '2024', '2025-10-23 17:29:40', NULL),
('tknp/b/224', 'Oyugi Meshlu Oyugi', 'Computer Science level 6', NULL, NULL, 'Credit', '2026', '2025-10-15 12:47:18', NULL),
('tknp/b/2244', 'Bonface Masinde Ndombi', 'Computer Science', '87666', 'National Diploma', 'Credit', '2024', '2025-10-24 06:01:39', NULL),
('tknp/b/225', 'Mary Nasambu Ndombi', 'Computer Science level 6', NULL, NULL, 'pass', '2026', '2025-10-15 13:16:39', NULL),
('tknp/b/226', 'Bonface  Ndombi', 'Computer Science level 6', NULL, NULL, 'Credit', '2026', '2025-10-15 13:25:24', NULL),
('tknp/b/2261', 'Bonface Masinde Ndombi', 'Computer Science', '876663', 'National Diploma', 'Credit', '2025', '2025-10-25 09:06:12', NULL),
('tknp/b/22645', 'Bonface Masinde Ndombi', 'Computer Science', '876663', 'National Diploma', 'Credit', '2025', '2025-10-24 19:44:18', NULL),
('tknp/b/2266', 'Bonface Masinde Ndombi', 'Computer Science', '87666', 'National Diploma', 'Credit', '2024', '2025-10-24 06:04:36', NULL),
('tknp/b/227', 'Daniel Muganda Uluma', 'Computer Science level 6', NULL, NULL, 'Credit', '2026', '2025-10-15 13:41:11', NULL),
('tknp/b/228', 'Grace Ndombi', 'Computer Science level 6', NULL, NULL, 'Credit', '2026', '2025-10-16 05:37:23', NULL),
('tknp/b/2288', 'Bonface Masinde Ndombi', 'Computer Science level 6', '87666', 'National Diploma', 'Credit', '2024', '2025-10-23 17:11:54', NULL),
('tknp/b/229', 'bonface', 'Computer Science level 6', '87666', NULL, 'Credit', '2026', '2025-10-16 09:54:00', NULL),
('tknp/b/23444', 'Bonface Masinde Ndombi', 'Computer Science', '87666', 'National Diploma', 'Credit', '2024', '2025-10-24 06:10:35', NULL),
('tknp/b/23456', 'Bonface Masinde Ndombi', 'Computer Science level 6', '87666', 'National Diploma', 'Credit', '2024', '2025-10-24 16:38:09', NULL),
('tknp/b/2454', 'Bonface Masinde Ndombi', 'Computer Science level 6', '87666', 'National Diploma', 'Credit', '2024', '2025-10-24 06:13:59', NULL),
('tknp/b/2566', 'Bonface Masinde Ndombi', 'Computer Science level 6', '87666', 'National Diploma', 'Credit', '2024', '2025-10-23 16:32:27', NULL),
('tknp/b/2653864', 'Bonface Masinde Ndombi', 'Computer Science', '876663', 'National Diploma', 'Credit', '2026', '2025-10-27 08:08:41', NULL),
('tknp/b/28089', 'Bonface Masinde Ndombi', 'Computer Science', '87666', 'National Diploma', 'Credit', '2025', '2025-10-24 18:08:49', NULL),
('tknp/b/28678', 'Bonface Masinde Ndombi', 'Computer Science', '87666', 'National Diploma', 'Credit', '2025', '2025-10-24 17:25:28', NULL),
('tknp/b/2899', 'Bonface Masinde Ndombi', 'Computer Science level 6', '87666', 'National Diploma', 'Credit', '2035', '2025-10-24 06:26:45', NULL),
('tknp/b/289900', 'Bonface Masinde Ndombi', 'Computer Science', '87666', 'National Diploma', 'Credit', '2025', '2025-10-24 17:29:58', NULL),
('tknp/b/289900000', 'Bonface Masinde Ndombi', 'Computer Science', '87666', 'National Diploma', 'pass', '2025', '2025-10-24 18:14:59', NULL),
('tknp/b/289909', 'Bonface Masinde Ndombi', 'Computer Science level 6', '87666', 'National Diploma', 'Credit', '0000', '2025-10-24 17:09:24', NULL),
('tknp/b/289912', 'Bonface Masinde Ndombi', 'Computer Science level 6', '87666', 'National Diploma', 'Credit', '2023', '2025-10-24 17:20:05', NULL),
('tknp/b/2899213', 'Bonface Masinde Ndombi', 'Computer Science', '87666', 'National Diploma', 'Credit', '2023', '2025-10-24 18:05:48', NULL),
('tknp/b/289945', 'Bonface Masinde Ndombi', 'Computer Science level 6', '87666', 'National Diploma', 'Credit', '0000', '2025-10-24 17:07:05', NULL),
('tknp/b/289954', 'Bonface Masinde Ndombi', 'Computer Science', '87666', 'National Diploma', 'Credit', '2024', '2025-10-24 20:54:20', NULL),
('tknp/b/28998', 'Bonface Masinde Ndombi', 'Computer Science level 6', '87666', 'National Diploma', 'Credit', '2025', '2025-10-24 16:49:02', NULL),
('tknp/b/289998', 'Bonface Masinde Ndombi', 'Computer Science level 6', '87666', 'National Diploma', 'Credit', '2056', '2025-10-24 16:49:21', NULL),
('tknp/b/2899987', 'Bonface Masinde Ndombi', 'Computer Science', '876663', 'National Diploma', 'Credit', '2025', '2025-10-24 19:42:22', NULL),
('tknp/b/2899999', 'Bonface Masinde Ndombi', 'Computer Science', '87666', 'National Diploma', 'Credit', '2025', '2025-10-24 18:03:06', NULL),
('tknp/b/3450', 'Bonface Masinde Ndombi', 'Computer Science', '87666', 'National Diploma', 'Credit', '2024', '2025-10-24 20:39:10', NULL),
('tknp/b/3456', 'Bonface Masinde Ndombi', 'Computer Science', '87666', 'National Diploma', 'Credit', '2025', '2025-10-24 17:42:52', NULL),
('tknp/b/5555', 'Bonface Masinde Ndombi', 'Computer Science level 6', '87666', 'National Diploma', 'Credit', '2025', '2025-10-24 17:18:15', NULL),
('tknp/b/751', 'Bonface Masinde Ndombi', 'Computer Science', '876663', 'National Diploma', 'Credit', '2025', '2025-10-24 22:16:05', NULL),
('tknp/b/8899', 'Bonface Masinde Ndombi', 'Computer Science', '87666', 'National Diploma', 'Credit', '2025', '2025-10-24 19:36:57', NULL),
('tknp/b/8909', 'Bonface Masinde Ndombi', 'Computer Science', '876663', 'National Diploma', 'Credit', '2025', '2025-10-24 17:33:00', NULL),
('tknp/b/9087', 'Bonface Masinde Ndombi', 'Computer Science', '87666', 'National Diploma', 'Credit', '2025', '2025-10-24 17:54:11', NULL),
('tknp/b/9090', 'Bonface Masinde Ndombi', 'Computer Science', '87666', 'National Diploma', 'Credit', '2025', '2025-10-24 19:28:24', NULL),
('tknp/b78', 'Bonface Masinde Ndombi', 'Computer Science', '87666', 'National Diploma', 'Credit', '0000', '2025-10-24 18:45:08', NULL),
('tknp/c/1234', 'Bonface Masinde Ndombi', 'Computer Science', '87666', 'National Diploma', 'Credit', '2025', '2025-10-24 17:56:58', NULL),
('tknp/c/2345', 'Bonface Masinde Ndombi', 'Computer Science', '876663', 'National Diploma', 'Credit', '2025', '2025-10-25 07:48:49', NULL),
('TKNP/C/40875', 'Bonface Ndombi', 'ict', '345678', 'National Diploma', 'credit', '2024', '2025-11-04 11:21:04', NULL),
('TKNP/C/40912', 'Bonface Ndombi', 'ict', '345678', 'National Diploma', 'credit', '2026', '2025-11-04 11:15:33', NULL),
('TKNP/C/4091265', 'Bonface Ndombi', 'ict', '345678', 'National Diploma', 'credit', '2026', '2025-11-05 06:08:52', NULL),
('TKNP/C/41111', 'Bonface Ndombi', 'ict', '345678', 'National Diploma', 'credit', '2026', '2025-11-05 05:46:21', NULL),
('TKNP/C/4490', 'Bonface Ndombi', 'ict', '345678', 'National Diploma', 'credit', '2025', '2025-11-05 05:30:07', NULL),
('TKNP/C/5824', 'MONICA AKAI OMINDO', 'Computer Science level 6', '87666', 'National Diploma', 'Credit', '2025', '2025-10-23 18:00:21', NULL),
('tknp/c42190', 'Bonface Ndombi', 'ict', '345678', 'National Diploma', 'credit', '2025', '2025-11-04 12:07:23', NULL),
('TKNP/D/1111', 'Felix Odiwuor Anyumba', 'VEHICLE ENGINE MECHANICS level 6', '333333', 'National Diploma', 'Credit', '2025', '2025-10-23 11:14:14', NULL),
('TKNP/D/1112', 'Radina Vincent Otieno', 'VEHICLE ENGINE MECHANICS  level 6', '333333', 'National Diploma', 'Credit', '2025', '2025-10-23 11:14:14', NULL),
('TKNP/D/1113', 'Randa MacDonald Omondi', 'VEHICLE ENGINE MECHANICS level 6', '333333', 'National Diploma', 'Credit', '2025', '2025-10-23 11:14:14', NULL),
('TKNP/D/1114', 'Rasak Eliud Owiti', 'VEHICLE ENGINE MECHANICS  level 6', '333333', 'National Diploma', 'Credit', '2025', '2025-10-23 11:14:15', NULL),
('TKNP/D/1115', 'Felix Odiwuor Anyumba', 'VEHICLE ENGINE MECHANICS level 6', '333333', 'National Diploma', 'Credit', '2025', '2025-10-23 11:16:26', NULL),
('TKNP/D/1116', 'Radina Vincent Otieno', 'VEHICLE ENGINE MECHANICS  level 6', '333333', 'National Diploma', 'Credit', '2025', '2025-10-23 11:16:26', NULL),
('TKNP/D/1117', 'Randa MacDonald Omondi', 'VEHICLE ENGINE MECHANICS level 6', '333333', 'National Diploma', 'Credit', '2025', '2025-10-23 11:16:26', NULL),
('TKNP/D/1118', 'Rasak Eliud Owiti', 'VEHICLE ENGINE MECHANICS  level 6', '333333', 'National Diploma', 'Credit', '2025', '2025-10-23 11:16:26', NULL),
('tknp/d/345218', 'Bonface Masinde Ndombi', 'Computer Science', '876663', 'National Diploma', 'Credit', '2025', '2025-10-27 05:36:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('Admin','Registrar','Principal') NOT NULL DEFAULT 'Registrar',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `password`, `role`, `created_at`) VALUES
(1, 'System Admin', 'admin@knp.ac.ke', '$2y$10$0tCEz0OZl6Ai1OmtM/zZTeNtkZK0DmPptmA1Zz7Qd8Zp4V02Kx4Oq', 'Admin', '2025-10-15 09:48:09'),
(2, 'System admin', 'admin@tknp.ac.ke', '$2y$10$nPOa9NJWTquifZtKgtxiNOEwyPRjZtG89L1yncJ4Vtl6mAYFRoLLO', 'Admin', '2025-10-15 10:05:56'),
(3, 'Registrar', 'registrar@tknp.ac.ke', '$2y$10$mSXUaIEuZxGif83/YFjSwuJGegi9Np82oS9XkaEstHfXDpS2dlsV.', 'Registrar', '2025-10-15 10:29:09'),
(6, 'Catherine Kelonye', 'kelonye@kisumupoly.ac.ke', '$2y$10$rwBMXv/UzMoINpQfXgsjhOdQar5sVaF3VhA0/LA.CrfUXkIxAVdnC', 'Principal', '2025-11-05 09:16:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `batch_reports`
--
ALTER TABLE `batch_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`cert_no`),
  ADD KEY `admission_no` (`admission_no`);

--
-- Indexes for table `import_logs`
--
ALTER TABLE `import_logs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `batch_id` (`batch_id`);

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
-- AUTO_INCREMENT for table `batch_reports`
--
ALTER TABLE `batch_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `import_logs`
--
ALTER TABLE `import_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
