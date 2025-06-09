-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2025 at 06:15 PM
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
-- Database: `xploitly`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `created_at`) VALUES
(1, 'admin', 'xploitly123', '2025-06-07 21:03:05');

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `is_replied` tinyint(4) DEFAULT 0,
  `sent_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `name`, `email`, `message`, `is_replied`, `sent_at`) VALUES
(1, 'Daniel', 'iliaevi01@gmail.com', 'Test', 0, '2025-06-08 19:42:17'),
(2, 'Test', 'test@test.com', 'Hello does it works?', 0, '2025-06-09 10:15:05');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `instructor_name` varchar(255) DEFAULT NULL,
  `duration` varchar(100) DEFAULT NULL,
  `meetings_per_week` int(11) DEFAULT NULL,
  `lecture_start_time` varchar(10) DEFAULT NULL,
  `lecture_end_time` varchar(10) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `sale_price` decimal(10,2) DEFAULT NULL,
  `curriculum` text DEFAULT NULL,
  `learning_outcomes` text DEFAULT NULL,
  `is_open` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `title`, `description`, `instructor_name`, `duration`, `meetings_per_week`, `lecture_start_time`, `lecture_end_time`, `price`, `sale_price`, `curriculum`, `learning_outcomes`, `is_open`) VALUES
(5, 'Cyber Security Awareness (ENGLISH)', 'Cyber Security Awareness is an introductory course designed to educate participants on key information security principles, Georgian cybersecurity laws, and global standards like ISO 27001. It covers cyber threats such as phishing, malware, and ransomware, and teaches practical strategies for secure communication, device protection, remote work safety, and recognizing social engineering tactics. Ideal for anyone looking to build strong cyber hygiene habits and stay protected in the digital world.', 'Daniel Iliaevi', 'Jun 15  1 HR 30 M', 1, '20:00', '21:30', 100.00, 0.00, 'Legal & Standards Foundation\nCybersecurity Essentials\nPhishing & Social Engineering\nCyber Threats & Prevention\nHands-On Practice & Discussion', 'Know basic cyber laws and standards\nSpot phishing and social engineering\nIdentify common cyber threats\nPractice safe device and email use\nImprove daily cyber hygiene', 0),
(6, 'Cyber Security Awareness (Georgian)', 'Cyber Security Awareness is an introductory course designed to educate participants on key information security principles, Georgian cybersecurity laws, and global standards like ISO 27001. It covers cyber threats such as phishing, malware, and ransomware, and teaches practical strategies for secure communication, device protection, remote work safety, and recognizing social engineering tactics. Ideal for anyone looking to build strong cyber hygiene habits and stay protected in the digital world.', 'Daniel Iliaevi', 'Jun 14 1 HR 30 M', 1, '17:00', '18:30', 100.00, 0.00, 'Legal & Standards Foundation\nCybersecurity Essentials\nPhishing & Social Engineering\nCyber Threats & Prevention\nHands-On Practice & Discussion', 'Know basic cyber laws and standards\nSpot phishing and social engineering\nIdentify common cyber threats\nPractice safe device and email use\nImprove daily cyber hygiene', 1);

-- --------------------------------------------------------

--
-- Table structure for table `lecturers`
--

CREATE TABLE `lecturers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `role` varchar(100) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lecturers`
--

INSERT INTO `lecturers` (`id`, `name`, `role`, `bio`, `image_url`) VALUES
(1, 'Daniel Iliaevi', 'Cyber Security Lecturer', 'Daniel Iliaevi is a Certified Ethical Hacker and cybersecurity lecturer with hands-on experience in penetration testing, malware analysis, and social engineering. He has led training programs and hackathons across Georgia, working with universities, government projects, and cybersecurity camps. Daniel is known for making complex topics accessible and engaging for students.', 'https://github.com/C4lcul4tor/Xploitly/blob/main/Screenshot%202025-06-09%20163107.png?raw=true');

-- --------------------------------------------------------

--
-- Table structure for table `registrations`
--

CREATE TABLE `registrations` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `surname` varchar(100) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `personalNumber` varchar(20) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `course` varchar(100) DEFAULT NULL,
  `registered_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `payment_status` enum('Paid','Not Paid') DEFAULT 'Not Paid',
  `is_paid` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registrations`
--

INSERT INTO `registrations` (`id`, `name`, `surname`, `birthdate`, `personalNumber`, `mobile`, `email`, `course`, `registered_at`, `payment_status`, `is_paid`) VALUES
(12, 'Daniel', 'Iliaevi', '2025-06-01', '31232132132', '567656757', 'iliaevi01@gmail.com', 'Cybersecurity Fundamentals', '2025-06-08 05:13:06', 'Not Paid', 0),
(13, 'Luka', 'Gogichadze', '2010-04-11', '33323423423', '213123213', 'luka@kiu.edu.ge', 'Cybersecurity for Business Professionals', '2025-06-09 10:28:58', 'Not Paid', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lecturers`
--
ALTER TABLE `lecturers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `registrations`
--
ALTER TABLE `registrations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `lecturers`
--
ALTER TABLE `lecturers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `registrations`
--
ALTER TABLE `registrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
