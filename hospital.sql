-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 08, 2026 at 01:54 PM
-- Server version: 8.4.3
-- PHP Version: 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int NOT NULL,
  `hospital_id` int DEFAULT NULL,
  `doctor_id` int DEFAULT NULL,
  `patient_id` int DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `appointment_datetime` datetime DEFAULT NULL,
  `summary` text,
  `status` enum('حجز','كشف','ملغي') DEFAULT 'حجز'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `appointment_items`
--

CREATE TABLE `appointment_items` (
  `id` int NOT NULL,
  `appointment_id` int NOT NULL,
  `medicine_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE `attachments` (
  `id` int NOT NULL,
  `appointment_id` int NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_path` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `department_id` int DEFAULT NULL,
  `hire_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `donations`
--

CREATE TABLE `donations` (
  `id` int NOT NULL,
  `donation_code` varchar(50) DEFAULT NULL,
  `user_id` int NOT NULL,
  `hospital_id` int DEFAULT NULL,
  `inventory_id` int DEFAULT NULL,
  `item_name` varchar(255) NOT NULL,
  `quantity` int NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `pickup_address` varchar(255) DEFAULT NULL,
  `status` enum('Pending','Approved','Rejected') NOT NULL DEFAULT 'Pending',
  `expire_date` date DEFAULT NULL,
  `donation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `notes` text,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `donations`
--

INSERT INTO `donations` (`id`, `donation_code`, `user_id`, `hospital_id`, `inventory_id`, `item_name`, `quantity`, `phone`, `pickup_address`, `status`, `expire_date`, `donation_date`, `notes`, `updated_at`) VALUES
(1, 'Do_1', 5, 1, 5, 'Panadol', 2, NULL, NULL, 'Approved', '2026-04-03', '2026-04-03 00:00:00', NULL, '2026-05-08 15:33:53'),
(2, 'Do_2', 5, 2, NULL, 'Asprin', 3, NULL, NULL, 'Pending', '2026-04-03', '2026-04-03 00:00:00', NULL, '2026-05-08 15:33:53'),
(3, 'Do_3', 1, 3, NULL, 'Dolipran', 1, NULL, NULL, 'Rejected', '2026-04-03', '2026-04-03 00:00:00', NULL, '2026-05-08 15:33:53'),
(4, 'Do_4', 2, 4, 5, 'Panadol', 2, NULL, NULL, 'Approved', '2026-04-03', '2026-04-03 00:00:00', NULL, '2026-05-08 15:33:53'),
(5, 'Do_5', 4, 5, NULL, 'Vitamin C', 5, NULL, NULL, 'Pending', '2026-04-03', '2026-04-03 00:00:00', NULL, '2026-05-08 15:33:53'),
(6, 'Do_6', 6, 6, 5, 'Paracetamol', 3, NULL, NULL, 'Approved', '2026-04-03', '2026-04-03 00:00:00', NULL, '2026-05-08 15:33:53');

-- --------------------------------------------------------

--
-- Table structure for table `donation_attachments`
--

CREATE TABLE `donation_attachments` (
  `id` int NOT NULL,
  `donation_id` int NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_path` text NOT NULL,
  `attachment_type` varchar(50) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hospitals`
--

CREATE TABLE `hospitals` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `type` enum('عام','تخصصي') NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `description` text,
  `image_path` varchar(255) DEFAULT NULL,
  `map_embed_url` text,
  `map_url` text,
  `rating` decimal(2,1) NOT NULL DEFAULT '4.3',
  `wait_time` varchar(80) DEFAULT '15-25 دقيقة',
  `beds_note` varchar(120) DEFAULT 'متاح أسرة للاستقبال',
  `status` enum('Approved','Rejected','Pending') NOT NULL DEFAULT 'Pending',
  `visibility` enum('Public','Private') NOT NULL DEFAULT 'Public',
  `work_start` varchar(20) DEFAULT '9:00 AM',
  `work_end` varchar(20) DEFAULT '5:00 PM',
  `services` json DEFAULT NULL,
  `departments_json` json DEFAULT NULL,
  `added_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `hospitals`
--

INSERT INTO `hospitals` (`id`, `user_id`, `name`, `address`, `type`, `email`, `phone`, `location`, `description`, `image_path`, `map_embed_url`, `map_url`, `rating`, `wait_time`, `beds_note`, `status`, `visibility`, `work_start`, `work_end`, `services`, `departments_json`, `added_by`, `created_at`, `updated_at`) VALUES
(1, 7, 'Mansoura University Hospital', 'Mansoura University Street', 'عام', 'hos1@gmail.com', '015625552', 'Mansoura', 'A leading medical institution providing emergency and healthcare services.', NULL, NULL, NULL, 4.3, '15-25 دقيقة', 'متاح أسرة للاستقبال', 'Approved', 'Public', '9:00 AM', '5:00 PM', NULL, NULL, 1, '2026-04-22 20:24:34', '2026-05-08 15:33:53'),
(2, NULL, 'Cairo Medical Center', 'Nasr City Main Road', 'تخصصي', 'hos2@gmail.com', '015625552', 'Cairo', NULL, NULL, NULL, NULL, 4.3, '15-25 دقيقة', 'متاح أسرة للاستقبال', 'Approved', 'Public', '9:00 AM', '5:00 PM', NULL, NULL, 1, '2026-04-22 20:24:34', '2026-05-08 15:33:52'),
(3, NULL, 'Alexandria Hospital', 'Corniche Road', 'عام', 'hos3@gmail.com', '015625552', 'Alexandria', NULL, NULL, NULL, NULL, 4.3, '15-25 دقيقة', 'متاح أسرة للاستقبال', 'Rejected', 'Public', '9:00 AM', '5:00 PM', NULL, NULL, 1, '2026-04-22 20:24:34', '2026-05-08 15:33:52'),
(4, NULL, 'Aswan Clinic', 'Aswan Downtown', 'تخصصي', 'hos4@gmail.com', '015625552', 'Aswan', NULL, NULL, NULL, NULL, 4.3, '15-25 دقيقة', 'متاح أسرة للاستقبال', 'Approved', 'Public', '9:00 AM', '5:00 PM', NULL, NULL, 1, '2026-04-22 20:24:34', '2026-05-08 15:33:52'),
(5, NULL, 'Suez Hospital', 'Suez Port Road', 'عام', 'hos5@gmail.com', '015625552', 'Suez', NULL, NULL, NULL, NULL, 4.3, '15-25 دقيقة', 'متاح أسرة للاستقبال', 'Approved', 'Public', '9:00 AM', '5:00 PM', NULL, NULL, 1, '2026-04-22 20:24:34', '2026-05-08 15:33:52'),
(6, NULL, 'Tanta Hospital', 'Tanta Center', 'عام', 'hos6@gmail.com', '015625552', 'Tanta', NULL, NULL, NULL, NULL, 4.3, '15-25 دقيقة', 'متاح أسرة للاستقبال', 'Approved', 'Public', '9:00 AM', '5:00 PM', NULL, NULL, 1, '2026-04-22 20:24:34', '2026-05-08 15:33:52');

-- --------------------------------------------------------

--
-- Table structure for table `hospital_doctor`
--

CREATE TABLE `hospital_doctor` (
  `hospital_id` int NOT NULL,
  `doctor_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int NOT NULL,
  `item_code` varchar(50) DEFAULT NULL,
  `item_name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `quantity` int NOT NULL DEFAULT '0',
  `expire_date` date DEFAULT NULL,
  `hospital_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `item_code`, `item_name`, `category`, `quantity`, `expire_date`, `hospital_id`, `created_at`) VALUES
(1, 'It_1', 'Carbamazepine', 'Neurology', 27, '2028-04-03', 1, '2026-04-22 20:24:34'),
(2, 'It_2', 'Hydrocortisone', 'Dermatology', 9, '2028-04-03', 2, '2026-04-22 20:24:34'),
(3, 'It_3', 'Atenolol', 'Cardiology', 0, '2028-04-03', 3, '2026-04-22 20:24:34'),
(4, 'It_4', 'Diclofenac', 'Orthopedic', 9, '2028-04-03', 4, '2026-04-22 20:24:34'),
(5, 'It_5', 'Paracetamol', 'Pediatric', 27, '2028-04-03', 5, '2026-04-22 20:24:34'),
(6, 'It_6', 'Carbamazepine', 'Neurology', 27, '2028-04-03', 6, '2026-04-22 20:24:34');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `hospital_id` int DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `type` varchar(30) NOT NULL DEFAULT 'info',
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `hospital_id`, `title`, `message`, `type`, `is_read`, `created_at`) VALUES
(1, 3, NULL, 'طلب دواء جديد', 'تم تسجيل طلب Crud Medicine بنجاح.', 'info', 0, '2026-05-08 15:46:54'),
(2, 3, NULL, 'طلب دواء جديد', 'تم تسجيل طلب Crud Medicine بنجاح.', 'info', 0, '2026-05-08 15:47:01'),
(3, 3, NULL, 'طلب دواء جديد', 'تم تسجيل طلب Crud Medicine بنجاح.', 'info', 0, '2026-05-08 15:47:24'),
(4, 3, NULL, 'تبرع جديد', 'تم تسجيل تبرع Crud Donation بنجاح.', 'info', 0, '2026-05-08 15:47:34'),
(5, 3, 1, 'طلب دواء جديد', 'تم تسجيل طلب Approve Test Med بنجاح.', 'info', 0, '2026-05-08 15:47:59'),
(6, 3, 1, 'تحديث طلب الدواء', 'تم تحديث حالة طلب Approve Test Med إلى Approved', 'success', 0, '2026-05-08 15:48:00'),
(7, 3, 1, 'تبرع جديد', 'تم تسجيل تبرع Approve Donation Med بنجاح.', 'info', 0, '2026-05-08 15:48:13'),
(8, 3, 1, 'تحديث التبرع', 'تم تحديث حالة تبرع Approve Donation Med إلى Approved', 'success', 0, '2026-05-08 15:48:13'),
(9, 10, NULL, 'طلب دواء جديد', 'تم تسجيل طلب khghhfggfd بنجاح.', 'info', 0, '2026-05-08 16:50:36');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` int NOT NULL,
  `patient_code` varchar(50) DEFAULT NULL,
  `hospital_id` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `age` int NOT NULL,
  `gender` varchar(20) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `disease` varchar(255) DEFAULT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `notes` text,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `address` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `id` int NOT NULL,
  `request_code` varchar(50) DEFAULT NULL,
  `user_id` int NOT NULL,
  `hospital_id` int DEFAULT NULL,
  `inventory_id` int DEFAULT NULL,
  `item_name` varchar(255) NOT NULL,
  `quantity` int NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `status` enum('Pending','Approved','Rejected') NOT NULL DEFAULT 'Pending',
  `request_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `notes` text,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `requests`
--

INSERT INTO `requests` (`id`, `request_code`, `user_id`, `hospital_id`, `inventory_id`, `item_name`, `quantity`, `phone`, `status`, `request_date`, `notes`, `updated_at`) VALUES
(1, 'Re_1', 5, 1, NULL, 'Dolipran', 2, NULL, 'Approved', '2026-04-03 00:00:00', NULL, '2026-05-08 15:33:53'),
(2, 'Re_2', 5, 1, NULL, 'Dolipran', 2, NULL, 'Pending', '2026-04-03 00:00:00', NULL, '2026-05-08 15:33:53'),
(3, 'Re_3', 5, 2, NULL, 'Asprin', 3, NULL, 'Rejected', '2026-04-03 00:00:00', NULL, '2026-05-08 15:33:53'),
(4, 'Re_4', 1, 3, 5, 'Panadol', 1, NULL, 'Approved', '2026-04-03 00:00:00', NULL, '2026-05-08 15:33:53'),
(5, 'Re_5', 4, 4, NULL, 'Vitamin C', 2, NULL, 'Pending', '2026-04-03 00:00:00', NULL, '2026-05-08 15:33:53'),
(6, 'Re_6', 6, 5, 5, 'Paracetamol', 4, NULL, 'Approved', '2026-04-03 00:00:00', NULL, '2026-05-08 15:33:53'),
(7, 'Re_7', 3, NULL, NULL, 'Crud Medicine', 2, '01022222222', 'Pending', '2026-05-08 15:46:54', 'test', '2026-05-08 15:46:54'),
(11, 'Re_11', 10, NULL, NULL, 'khghhfggfd', 54, '0215120', 'Pending', '2026-05-08 16:50:36', '', '2026-05-08 16:50:36');

-- --------------------------------------------------------

--
-- Table structure for table `request_attachments`
--

CREATE TABLE `request_attachments` (
  `id` int NOT NULL,
  `request_id` int NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_path` text NOT NULL,
  `attachment_type` varchar(50) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `status` enum('Active','Banned') NOT NULL DEFAULT 'Active',
  `role` enum('Admin','User','Hospital') NOT NULL DEFAULT 'User',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `password`, `password_hash`, `status`, `role`, `created_at`, `last_login_at`, `updated_at`) VALUES
(1, 'Amr Ebrahim', 'amr52@gmail.com', '015625552', NULL, '$2y$10$LofSjq/Wh1XGjJ3cHrX.OOo4AMzZSzrxiA2KwarHJe7N23h1darzO', 'Active', 'Admin', '2026-04-22 20:24:33', '2026-05-08 16:53:33', '2026-05-08 16:53:33'),
(2, 'Hager Amir', 'hager5@gmail.com', '015625552', NULL, '$2y$10$LofSjq/Wh1XGjJ3cHrX.OOo4AMzZSzrxiA2KwarHJe7N23h1darzO', 'Banned', 'User', '2026-04-22 20:24:33', NULL, '2026-05-08 15:33:53'),
(3, 'Ruqaya Ebrahim', 'Roqa6@gmail.com', '015625552', NULL, '$2y$10$LofSjq/Wh1XGjJ3cHrX.OOo4AMzZSzrxiA2KwarHJe7N23h1darzO', 'Active', 'User', '2026-04-22 20:24:33', '2026-05-08 15:50:14', '2026-05-08 15:50:14'),
(4, 'Seif Ebrahim', 'seif98@gmail.com', '015625552', NULL, '$2y$10$LofSjq/Wh1XGjJ3cHrX.OOo4AMzZSzrxiA2KwarHJe7N23h1darzO', 'Banned', 'User', '2026-04-22 20:24:33', NULL, '2026-05-08 15:33:53'),
(5, 'Hany Amir', 'hanon@gmail.com', '015625552', NULL, '$2y$10$LofSjq/Wh1XGjJ3cHrX.OOo4AMzZSzrxiA2KwarHJe7N23h1darzO', 'Banned', 'User', '2026-04-22 20:24:33', NULL, '2026-05-08 15:33:53'),
(6, 'Fofo Amir', 'fofa@gmail.com', '015625552', NULL, '$2y$10$LofSjq/Wh1XGjJ3cHrX.OOo4AMzZSzrxiA2KwarHJe7N23h1darzO', 'Active', 'User', '2026-04-22 20:24:33', NULL, '2026-05-08 15:33:53'),
(7, 'Mansoura Hospital Admin', 'hospital@caremate.test', '0502255225', NULL, '$2y$10$wUelY9kWMf99XgyUp0SVNeVh0w3G7nMtcaeITbo8wGA.AH82ev9Qa', 'Active', 'Hospital', '2026-05-08 12:33:53', '2026-05-08 15:49:17', '2026-05-08 16:32:20'),
(10, 'محمد', 'marowgame@gmail.com', '01010101010', NULL, '$2y$10$GmAo55ruMw.wBCLr94uqyera6DC3FhUk1mrzTrjZDhmLNHVUqDrNO', 'Active', 'User', '2026-05-08 13:06:34', '2026-05-08 16:46:02', '2026-05-08 16:46:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hospital_id` (`hospital_id`),
  ADD KEY `doctor_id` (`doctor_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `appointment_items`
--
ALTER TABLE `appointment_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appointment_id` (`appointment_id`);

--
-- Indexes for table `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appointment_id` (`appointment_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `donations`
--
ALTER TABLE `donations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `hospital_id` (`hospital_id`),
  ADD KEY `inventory_id` (`inventory_id`),
  ADD KEY `status_date` (`status`,`donation_date`);

--
-- Indexes for table `donation_attachments`
--
ALTER TABLE `donation_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `donation_id` (`donation_id`);

--
-- Indexes for table `hospitals`
--
ALTER TABLE `hospitals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hospitals_ibfk_1` (`added_by`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `hospital_doctor`
--
ALTER TABLE `hospital_doctor`
  ADD PRIMARY KEY (`hospital_id`,`doctor_id`),
  ADD KEY `hospital_doctor_ibfk_2` (`doctor_id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hospital_id` (`hospital_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `hospital_id` (`hospital_id`),
  ADD KEY `read_date` (`is_read`,`created_at`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `patient_code` (`patient_code`),
  ADD KEY `hospital_id` (`hospital_id`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `hospital_id` (`hospital_id`),
  ADD KEY `inventory_id` (`inventory_id`),
  ADD KEY `status_date` (`status`,`request_date`);

--
-- Indexes for table `request_attachments`
--
ALTER TABLE `request_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `request_id` (`request_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `appointment_items`
--
ALTER TABLE `appointment_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `donations`
--
ALTER TABLE `donations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `donation_attachments`
--
ALTER TABLE `donation_attachments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hospitals`
--
ALTER TABLE `hospitals`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `request_attachments`
--
ALTER TABLE `request_attachments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`hospital_id`) REFERENCES `hospitals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointments_ibfk_3` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointments_ibfk_4` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `appointment_items`
--
ALTER TABLE `appointment_items`
  ADD CONSTRAINT `appointment_items_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `attachments`
--
ALTER TABLE `attachments`
  ADD CONSTRAINT `attachments_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `doctors_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `donations`
--
ALTER TABLE `donations`
  ADD CONSTRAINT `donations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `donations_ibfk_2` FOREIGN KEY (`hospital_id`) REFERENCES `hospitals` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `donations_ibfk_3` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `donation_attachments`
--
ALTER TABLE `donation_attachments`
  ADD CONSTRAINT `donation_attachments_donation_fk` FOREIGN KEY (`donation_id`) REFERENCES `donations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hospitals`
--
ALTER TABLE `hospitals`
  ADD CONSTRAINT `hospitals_ibfk_1` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `hospitals_user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `hospital_doctor`
--
ALTER TABLE `hospital_doctor`
  ADD CONSTRAINT `hospital_doctor_ibfk_1` FOREIGN KEY (`hospital_id`) REFERENCES `hospitals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hospital_doctor_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`hospital_id`) REFERENCES `hospitals` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_hospital_fk` FOREIGN KEY (`hospital_id`) REFERENCES `hospitals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notifications_user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `patients`
--
ALTER TABLE `patients`
  ADD CONSTRAINT `patients_hospital_fk` FOREIGN KEY (`hospital_id`) REFERENCES `hospitals` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `requests`
--
ALTER TABLE `requests`
  ADD CONSTRAINT `requests_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `requests_ibfk_2` FOREIGN KEY (`hospital_id`) REFERENCES `hospitals` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `requests_ibfk_3` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `request_attachments`
--
ALTER TABLE `request_attachments`
  ADD CONSTRAINT `request_attachments_request_fk` FOREIGN KEY (`request_id`) REFERENCES `requests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
