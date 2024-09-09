-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3307
-- Thời gian đã tạo: Th9 09, 2024 lúc 09:47 AM
-- Phiên bản máy phục vụ: 8.0.30
-- Phiên bản PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `vaxms`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
--

CREATE TABLE `account` (
  `account_id` bigint NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `google_id` varchar(100) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `login_type` enum('standard','google','phone') DEFAULT 'standard',
  `activation_key` varchar(100) DEFAULT NULL,
  `actived` bit(1) DEFAULT NULL,
  `authority_id` bigint NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `remember_key` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `account`
--

INSERT INTO `account` (`account_id`, `email`, `password`, `google_id`, `phone_number`, `login_type`, `activation_key`, `actived`, `authority_id`, `created_date`, `remember_key`) VALUES
(1, 'admin@vaxms.com', 'admin', NULL, '0123456789', 'standard', NULL, b'1', 1, '2024-08-27 16:20:27', NULL),
(2, 'doctor@vaxms.com', 'hashed_password', NULL, '0987654321', 'standard', NULL, b'1', 2, '2024-08-27 16:20:27', NULL),
(3, 'nurse@vaxms.com', 'hashed_password', NULL, '0223344556', 'standard', NULL, b'1', 3, '2024-08-27 16:20:27', NULL),
(4, 'customer1@vaxms.com', '123', NULL, '0998877665', 'standard', NULL, b'1', 4, '2024-08-27 16:20:27', NULL),
(5, 'support@vaxms.com', '123', NULL, '0112233445', 'standard', NULL, b'1', 5, '2024-08-27 16:20:27', NULL),
(6, 'hieutran02102804@gmail.com', NULL, NULL, NULL, 'google', NULL, b'1', 4, '2024-09-08 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `age_groups`
--

CREATE TABLE `age_groups` (
  `age_group_id` bigint NOT NULL,
  `age_range` varchar(50) NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `age_groups`
--

INSERT INTO `age_groups` (`age_group_id`, `age_range`, `created_date`) VALUES
(1, '0-6 months', '2024-08-27 16:20:27'),
(2, '0-12 months', '2024-08-27 16:20:27'),
(3, '0-24 months', '2024-08-27 16:20:27'),
(4, '6-24 months', '2024-08-27 16:20:27'),
(5, '12-24 months', '2024-08-27 16:20:27'),
(6, '4-6 years', '2024-08-27 16:20:27'),
(7, '7-18 years', '2024-08-27 16:20:27'),
(8, 'Women planning to become pregnant', '2024-08-27 16:20:27'),
(9, 'Adults', '2024-08-27 16:20:27');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `authority`
--

CREATE TABLE `authority` (
  `authority_id` bigint NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `authority`
--

INSERT INTO `authority` (`authority_id`, `name`) VALUES
(1, 'Admin'),
(2, 'Doctor'),
(3, 'Nurse'),
(4, 'Customer'),
(5, 'Support Staff');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `centers`
--

CREATE TABLE `centers` (
  `center_id` bigint NOT NULL,
  `center_name` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `district` varchar(100) NOT NULL,
  `ward` varchar(100) NOT NULL,
  `street` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `centers`
--

INSERT INTO `centers` (`center_id`, `center_name`, `city`, `district`, `ward`, `street`, `created_date`) VALUES
(1, 'Central Health Center', 'Ho Chi Minh', 'District 1', 'Ward 1', '123 Le Loi', '2024-08-27 16:20:27'),
(2, 'City Clinic', 'Ha Noi', 'Ba Dinh', 'Ward 2', '456 Kim Ma', '2024-08-27 16:20:27');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chatting`
--

CREATE TABLE `chatting` (
  `id` bigint NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `receiver` bigint DEFAULT NULL,
  `sender` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `chatting`
--

INSERT INTO `chatting` (`id`, `content`, `created_date`, `receiver`, `sender`) VALUES
(1, 'hehehe', '2024-09-09 16:42:13', NULL, 4),
(2, 'oke babayt', '2024-09-09 16:43:34', NULL, 4),
(3, 'hehehe oke đấy', '2024-09-09 16:43:44', NULL, 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `comment_id` bigint NOT NULL,
  `account_id` bigint NOT NULL,
  `vaccine_id` bigint DEFAULT NULL,
  `news_id` bigint DEFAULT NULL,
  `parent_comment_id` bigint DEFAULT NULL,
  `content` text,
  `likes_count` int DEFAULT '0',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`comment_id`, `account_id`, `vaccine_id`, `news_id`, `parent_comment_id`, `content`, `likes_count`, `created_date`) VALUES
(1, 4, 1, NULL, NULL, 'Great vaccine!', 10, '2024-08-27 16:20:27'),
(2, 4, NULL, 1, NULL, 'Very informative news!', 5, '2024-08-27 16:20:27');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer_profile`
--

CREATE TABLE `customer_profile` (
  `profile_id` bigint NOT NULL,
  `customer_id` bigint NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `birthdate` date DEFAULT NULL,
  `phone` varchar(15) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `city` varchar(100) NOT NULL,
  `district` varchar(100) NOT NULL,
  `ward` varchar(100) NOT NULL,
  `street` varchar(255) DEFAULT NULL,
  `insurance_status` tinyint(1) DEFAULT NULL,
  `contact_name` varchar(100) NOT NULL,
  `contact_relationship` varchar(50) NOT NULL,
  `contact_phone` varchar(15) NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `customer_profile`
--

INSERT INTO `customer_profile` (`profile_id`, `customer_id`, `full_name`, `gender`, `birthdate`, `phone`, `avatar`, `city`, `district`, `ward`, `street`, `insurance_status`, `contact_name`, `contact_relationship`, `contact_phone`, `created_date`) VALUES
(1, 4, 'Nguyen Van A update', 'Female', '1990-01-01', '0998877665', 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1725792995/z49uuk74vw7cei6hjhwi.jpg', 'Tỉnh Cao Bằng', 'Huyện Trùng Khánh', 'xã nghi lộc', '123 Le Loi', 1, 'Tran Thi B update', 'Vợ', '0123456789', '2024-08-27 16:20:27');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer_schedule`
--

CREATE TABLE `customer_schedule` (
  `id` bigint NOT NULL,
  `account_id` bigint NOT NULL,
  `vaccine_schedule_id` bigint NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `pay_status` tinyint(1) DEFAULT NULL,
  `status` enum('pending','confirmed','cancelled') NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `customer_schedule`
--

INSERT INTO `customer_schedule` (`id`, `account_id`, `vaccine_schedule_id`, `created_date`, `pay_status`, `status`, `address`, `dob`, `full_name`, `phone`) VALUES
(1, 4, 1, '2024-08-27 16:20:27', 1, 'confirmed', NULL, NULL, NULL, NULL),
(2, 4, 2, '2024-08-27 16:20:27', 0, 'cancelled', NULL, NULL, NULL, NULL),
(3, 4, 3, '2024-08-28 23:12:11', 0, 'cancelled', '123 Le Loi, Ward 1, District 1, Ho Chi Minh', '2000-06-01', 'Trần thị bình', '0123456789'),
(6, 4, 3, '2024-09-08 20:35:08', 1, 'pending', '123 Le Loi, xã nghi lộc, Huyện Trùng Khánh, Tỉnh Cao Bằng', '1990-01-01', 'Nguyen Van A update', '0123456789');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `doctors`
--

CREATE TABLE `doctors` (
  `doctor_id` bigint NOT NULL,
  `account_id` bigint NOT NULL,
  `specialization` varchar(100) DEFAULT NULL,
  `experience_years` int DEFAULT NULL,
  `bio` text,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `avatar` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `doctors`
--

INSERT INTO `doctors` (`doctor_id`, `account_id`, `specialization`, `experience_years`, `bio`, `created_date`, `avatar`, `full_name`) VALUES
(1, 2, 'Immunology', 10, 'Specialized in immunology and vaccines.', '2024-08-27 16:20:27', NULL, 'Hoàng mạnh hải');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `feedback`
--

CREATE TABLE `feedback` (
  `id` bigint NOT NULL,
  `customer_schedule_id` bigint NOT NULL,
  `feedback_type` enum('general','doctor','nurse') DEFAULT 'general',
  `doctor_id` bigint DEFAULT NULL,
  `nurse_id` bigint DEFAULT NULL,
  `content` text,
  `rating` tinyint(1) DEFAULT NULL,
  `response` text,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `feedback`
--

INSERT INTO `feedback` (`id`, `customer_schedule_id`, `feedback_type`, `doctor_id`, `nurse_id`, `content`, `rating`, `response`, `created_date`) VALUES
(1, 1, 'doctor', 1, NULL, 'Doctor was very knowledgeable and helpful.', 5, NULL, '2024-08-27 16:20:27'),
(2, 1, 'nurse', NULL, 1, 'Nurse was very caring and professional.', 4, NULL, '2024-08-27 16:20:27');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `manufacturers`
--

CREATE TABLE `manufacturers` (
  `manufacturer_id` bigint NOT NULL,
  `name` varchar(100) NOT NULL,
  `country` varchar(100) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `manufacturers`
--

INSERT INTO `manufacturers` (`manufacturer_id`, `name`, `country`, `created_date`) VALUES
(1, 'Pfizer', 'USA', '2024-08-27 16:20:27'),
(2, 'Moderna', 'USA', '2024-08-27 16:20:27'),
(3, 'AstraZeneca', 'UK', '2024-08-27 16:20:27');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news`
--

CREATE TABLE `news` (
  `news_id` bigint NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `author_id` bigint NOT NULL,
  `topic_id` bigint NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `news`
--

INSERT INTO `news` (`news_id`, `title`, `content`, `image`, `author_id`, `topic_id`, `created_date`) VALUES
(1, 'COVID-19 Vaccination Updates', 'Latest updates on COVID-19 vaccination', 'https://vnvc.vn/wp-content/uploads/2024/09/tiem-1-mui-phe-cau-co-duoc-khong.jpg', 1, 3, '2024-08-27 16:20:27'),
(2, 'Health Benefits of Regular Vaccination', 'Vaccination is crucial for maintaining public health...', 'https://vnvc.vn/wp-content/uploads/2024/08/vac-xin-bach-hau-ho-ga-uon-van-nguoi-lon.jpg', 1, 2, '2024-08-27 16:20:27');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news_sources`
--

CREATE TABLE `news_sources` (
  `source_id` bigint NOT NULL,
  `news_id` bigint NOT NULL,
  `source_name` varchar(255) NOT NULL,
  `source_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `news_sources`
--

INSERT INTO `news_sources` (`source_id`, `news_id`, `source_name`, `source_url`) VALUES
(1, 1, 'WHO', 'https://www.who.int'),
(2, 2, 'CDC', 'https://www.cdc.gov');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nurses`
--

CREATE TABLE `nurses` (
  `nurse_id` bigint NOT NULL,
  `account_id` bigint NOT NULL,
  `qualification` varchar(100) DEFAULT NULL,
  `experience_years` int DEFAULT NULL,
  `bio` text,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `avatar` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `nurses`
--

INSERT INTO `nurses` (`nurse_id`, `account_id`, `qualification`, `experience_years`, `bio`, `created_date`, `avatar`, `full_name`) VALUES
(1, 3, 'Nursing', 5, 'Experienced nurse in vaccine administration.', '2024-08-27 16:20:27', NULL, 'Lê Thị Hoài');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payment`
--

CREATE TABLE `payment` (
  `id` bigint NOT NULL,
  `customer_schedule_id` bigint NOT NULL,
  `amount` int NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` bigint NOT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `request_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `payment`
--

INSERT INTO `payment` (`id`, `customer_schedule_id`, `amount`, `created_date`, `created_by`, `order_id`, `request_id`) VALUES
(1, 1, 20, '2024-08-27 16:20:27', 4, NULL, NULL),
(2, 2, 22, '2024-08-27 16:20:27', 4, NULL, NULL),
(4, 6, 300000, '2024-09-08 20:35:08', 4, '1725802464269', '1725802464269');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payment_details`
--

CREATE TABLE `payment_details` (
  `payment_detail_id` bigint NOT NULL,
  `payment_id` bigint NOT NULL,
  `method_id` bigint NOT NULL,
  `amount` int NOT NULL,
  `transaction_date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `payment_details`
--

INSERT INTO `payment_details` (`payment_detail_id`, `payment_id`, `method_id`, `amount`, `transaction_date`) VALUES
(1, 1, 1, 20, '2024-08-27 16:20:27'),
(2, 2, 2, 22, '2024-08-27 16:20:27');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payment_methods`
--

CREATE TABLE `payment_methods` (
  `method_id` bigint NOT NULL,
  `method_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `payment_methods`
--

INSERT INTO `payment_methods` (`method_id`, `method_name`) VALUES
(1, 'Credit Card'),
(2, 'Bank Transfer'),
(3, 'Cash');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `topics`
--

CREATE TABLE `topics` (
  `topic_id` bigint NOT NULL,
  `topic_name` varchar(100) NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `topics`
--

INSERT INTO `topics` (`topic_id`, `topic_name`, `created_date`) VALUES
(1, 'Health', '2024-08-27 16:20:27'),
(2, 'Vaccination', '2024-08-27 16:20:27'),
(3, 'COVID-19', '2024-08-27 16:20:27');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vaccine`
--

CREATE TABLE `vaccine` (
  `id` bigint NOT NULL,
  `name` varchar(255) NOT NULL,
  `type_id` bigint NOT NULL,
  `manufacturer_id` bigint NOT NULL,
  `age_group_id` bigint NOT NULL,
  `description` text,
  `image` varchar(255) DEFAULT NULL,
  `price` int NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `vaccine`
--

INSERT INTO `vaccine` (`id`, `name`, `type_id`, `manufacturer_id`, `age_group_id`, `description`, `image`, `price`, `created_date`) VALUES
(1, 'Pfizer-BioNTech COVID-19 Vaccine', 1, 1, 1, 'Effective against COVID-19', 'https://vnvc.vn/wp-content/uploads/2024/08/Pneumovax-23.jpg', 20, '2024-08-27 16:20:27'),
(2, 'Moderna COVID-19 Vaccine', 1, 2, 2, 'mRNA vaccine for COVID-19', 'https://vnvc.vn/wp-content/uploads/2019/11/vaccine-Prevenar-13.jpg', 300000, '2024-08-27 16:20:27'),
(3, 'AstraZeneca COVID-19 Vaccine', 1, 3, 3, 'Viral vector vaccine for COVID-19', 'https://vnvc.vn/wp-content/uploads/2017/04/Synflorix-1.jpg', 18, '2024-08-27 16:20:27');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vaccine_distribution`
--

CREATE TABLE `vaccine_distribution` (
  `distribution_id` bigint NOT NULL,
  `inventory_id` bigint NOT NULL,
  `distribution_type` enum('imports','export') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `quantity` int NOT NULL,
  `distribution_date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `vaccine_distribution`
--

INSERT INTO `vaccine_distribution` (`distribution_id`, `inventory_id`, `distribution_type`, `quantity`, `distribution_date`) VALUES
(1, 1, 'export', 100, '2024-08-27 16:20:27'),
(2, 2, 'export', 150, '2024-08-27 16:20:27');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vaccine_inventory`
--

CREATE TABLE `vaccine_inventory` (
  `inventory_id` bigint NOT NULL,
  `vaccine_id` bigint NOT NULL,
  `center_id` bigint NOT NULL,
  `quantity` int NOT NULL,
  `import_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `export_date` datetime DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `vaccine_inventory`
--

INSERT INTO `vaccine_inventory` (`inventory_id`, `vaccine_id`, `center_id`, `quantity`, `import_date`, `export_date`, `created_date`) VALUES
(1, 1, 1, 100, '2024-08-27 16:20:27', NULL, '2024-08-27 16:20:27'),
(2, 2, 2, 150, '2024-08-27 16:20:27', NULL, '2024-08-27 16:20:27');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vaccine_schedule`
--

CREATE TABLE `vaccine_schedule` (
  `id` bigint NOT NULL,
  `vaccine_id` bigint NOT NULL,
  `center_id` bigint NOT NULL,
  `created_by` bigint NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `limit_people` int NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `vaccine_schedule`
--

INSERT INTO `vaccine_schedule` (`id`, `vaccine_id`, `center_id`, `created_by`, `start_date`, `end_date`, `limit_people`, `created_date`) VALUES
(1, 1, 1, 1, '2024-09-01 08:00:00', '2024-09-01 12:00:00', 50, '2024-08-27 16:20:27'),
(2, 2, 2, 1, '2024-09-02 09:00:00', '2024-09-02 13:00:00', 60, '2024-08-27 16:20:27'),
(3, 2, 1, 1, '2024-08-30 07:20:00', '2024-09-20 17:45:00', 200, '2024-08-28 17:49:40');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vaccine_types`
--

CREATE TABLE `vaccine_types` (
  `type_id` bigint NOT NULL,
  `type_name` varchar(100) NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `vaccine_types`
--

INSERT INTO `vaccine_types` (`type_id`, `type_name`, `created_date`) VALUES
(1, 'COVID-19', '2024-08-27 16:20:27'),
(2, 'Influenza', '2024-08-27 16:20:27'),
(3, 'Hepatitis B', '2024-08-27 16:20:27');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`account_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone_number` (`phone_number`),
  ADD KEY `authority_id` (`authority_id`);

--
-- Chỉ mục cho bảng `age_groups`
--
ALTER TABLE `age_groups`
  ADD PRIMARY KEY (`age_group_id`);

--
-- Chỉ mục cho bảng `authority`
--
ALTER TABLE `authority`
  ADD PRIMARY KEY (`authority_id`);

--
-- Chỉ mục cho bảng `centers`
--
ALTER TABLE `centers`
  ADD PRIMARY KEY (`center_id`);

--
-- Chỉ mục cho bảng `chatting`
--
ALTER TABLE `chatting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK5a0buj5ilrqnmip5f9haa2l8u` (`receiver`),
  ADD KEY `FKk9xq8rksng78v0hphidblb4tr` (`sender`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `vaccine_id` (`vaccine_id`),
  ADD KEY `news_id` (`news_id`),
  ADD KEY `parent_comment_id` (`parent_comment_id`);

--
-- Chỉ mục cho bảng `customer_profile`
--
ALTER TABLE `customer_profile`
  ADD PRIMARY KEY (`profile_id`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Chỉ mục cho bảng `customer_schedule`
--
ALTER TABLE `customer_schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `vaccine_schedule_id` (`vaccine_schedule_id`);

--
-- Chỉ mục cho bảng `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`doctor_id`),
  ADD KEY `account_id` (`account_id`);

--
-- Chỉ mục cho bảng `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_schedule_id` (`customer_schedule_id`),
  ADD KEY `doctor_id` (`doctor_id`),
  ADD KEY `nurse_id` (`nurse_id`);

--
-- Chỉ mục cho bảng `manufacturers`
--
ALTER TABLE `manufacturers`
  ADD PRIMARY KEY (`manufacturer_id`);

--
-- Chỉ mục cho bảng `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`news_id`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `topic_id` (`topic_id`);

--
-- Chỉ mục cho bảng `news_sources`
--
ALTER TABLE `news_sources`
  ADD PRIMARY KEY (`source_id`),
  ADD KEY `news_id` (`news_id`);

--
-- Chỉ mục cho bảng `nurses`
--
ALTER TABLE `nurses`
  ADD PRIMARY KEY (`nurse_id`),
  ADD KEY `account_id` (`account_id`);

--
-- Chỉ mục cho bảng `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_schedule_id` (`customer_schedule_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Chỉ mục cho bảng `payment_details`
--
ALTER TABLE `payment_details`
  ADD PRIMARY KEY (`payment_detail_id`),
  ADD KEY `payment_id` (`payment_id`),
  ADD KEY `method_id` (`method_id`);

--
-- Chỉ mục cho bảng `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`method_id`);

--
-- Chỉ mục cho bảng `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`topic_id`);

--
-- Chỉ mục cho bảng `vaccine`
--
ALTER TABLE `vaccine`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_id` (`type_id`),
  ADD KEY `manufacturer_id` (`manufacturer_id`),
  ADD KEY `age_group_id` (`age_group_id`);

--
-- Chỉ mục cho bảng `vaccine_distribution`
--
ALTER TABLE `vaccine_distribution`
  ADD PRIMARY KEY (`distribution_id`),
  ADD KEY `inventory_id` (`inventory_id`);

--
-- Chỉ mục cho bảng `vaccine_inventory`
--
ALTER TABLE `vaccine_inventory`
  ADD PRIMARY KEY (`inventory_id`),
  ADD KEY `vaccine_id` (`vaccine_id`),
  ADD KEY `center_id` (`center_id`);

--
-- Chỉ mục cho bảng `vaccine_schedule`
--
ALTER TABLE `vaccine_schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vaccine_id` (`vaccine_id`),
  ADD KEY `center_id` (`center_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Chỉ mục cho bảng `vaccine_types`
--
ALTER TABLE `vaccine_types`
  ADD PRIMARY KEY (`type_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `account`
--
ALTER TABLE `account`
  MODIFY `account_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `age_groups`
--
ALTER TABLE `age_groups`
  MODIFY `age_group_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `authority`
--
ALTER TABLE `authority`
  MODIFY `authority_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `centers`
--
ALTER TABLE `centers`
  MODIFY `center_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `chatting`
--
ALTER TABLE `chatting`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `customer_profile`
--
ALTER TABLE `customer_profile`
  MODIFY `profile_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `customer_schedule`
--
ALTER TABLE `customer_schedule`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `doctors`
--
ALTER TABLE `doctors`
  MODIFY `doctor_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `manufacturers`
--
ALTER TABLE `manufacturers`
  MODIFY `manufacturer_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `news`
--
ALTER TABLE `news`
  MODIFY `news_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `news_sources`
--
ALTER TABLE `news_sources`
  MODIFY `source_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `nurses`
--
ALTER TABLE `nurses`
  MODIFY `nurse_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `payment`
--
ALTER TABLE `payment`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `payment_details`
--
ALTER TABLE `payment_details`
  MODIFY `payment_detail_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `method_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `topics`
--
ALTER TABLE `topics`
  MODIFY `topic_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `vaccine`
--
ALTER TABLE `vaccine`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `vaccine_distribution`
--
ALTER TABLE `vaccine_distribution`
  MODIFY `distribution_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `vaccine_inventory`
--
ALTER TABLE `vaccine_inventory`
  MODIFY `inventory_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `vaccine_schedule`
--
ALTER TABLE `vaccine_schedule`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `vaccine_types`
--
ALTER TABLE `vaccine_types`
  MODIFY `type_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`authority_id`) REFERENCES `authority` (`authority_id`);

--
-- Các ràng buộc cho bảng `chatting`
--
ALTER TABLE `chatting`
  ADD CONSTRAINT `FK5a0buj5ilrqnmip5f9haa2l8u` FOREIGN KEY (`receiver`) REFERENCES `account` (`account_id`),
  ADD CONSTRAINT `FKk9xq8rksng78v0hphidblb4tr` FOREIGN KEY (`sender`) REFERENCES `account` (`account_id`);

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`vaccine_id`) REFERENCES `vaccine` (`id`),
  ADD CONSTRAINT `comments_ibfk_3` FOREIGN KEY (`news_id`) REFERENCES `news` (`news_id`),
  ADD CONSTRAINT `comments_ibfk_4` FOREIGN KEY (`parent_comment_id`) REFERENCES `comments` (`comment_id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `customer_profile`
--
ALTER TABLE `customer_profile`
  ADD CONSTRAINT `customer_profile_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `account` (`account_id`);

--
-- Các ràng buộc cho bảng `customer_schedule`
--
ALTER TABLE `customer_schedule`
  ADD CONSTRAINT `customer_schedule_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  ADD CONSTRAINT `customer_schedule_ibfk_2` FOREIGN KEY (`vaccine_schedule_id`) REFERENCES `vaccine_schedule` (`id`);

--
-- Các ràng buộc cho bảng `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `doctors_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`);

--
-- Các ràng buộc cho bảng `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`customer_schedule_id`) REFERENCES `customer_schedule` (`id`),
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`),
  ADD CONSTRAINT `feedback_ibfk_3` FOREIGN KEY (`nurse_id`) REFERENCES `nurses` (`nurse_id`);

--
-- Các ràng buộc cho bảng `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `account` (`account_id`),
  ADD CONSTRAINT `news_ibfk_2` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`topic_id`);

--
-- Các ràng buộc cho bảng `news_sources`
--
ALTER TABLE `news_sources`
  ADD CONSTRAINT `news_sources_ibfk_1` FOREIGN KEY (`news_id`) REFERENCES `news` (`news_id`);

--
-- Các ràng buộc cho bảng `nurses`
--
ALTER TABLE `nurses`
  ADD CONSTRAINT `nurses_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`);

--
-- Các ràng buộc cho bảng `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`customer_schedule_id`) REFERENCES `customer_schedule` (`id`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `account` (`account_id`);

--
-- Các ràng buộc cho bảng `payment_details`
--
ALTER TABLE `payment_details`
  ADD CONSTRAINT `payment_details_ibfk_1` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`),
  ADD CONSTRAINT `payment_details_ibfk_2` FOREIGN KEY (`method_id`) REFERENCES `payment_methods` (`method_id`);

--
-- Các ràng buộc cho bảng `vaccine`
--
ALTER TABLE `vaccine`
  ADD CONSTRAINT `vaccine_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `vaccine_types` (`type_id`),
  ADD CONSTRAINT `vaccine_ibfk_2` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturers` (`manufacturer_id`),
  ADD CONSTRAINT `vaccine_ibfk_3` FOREIGN KEY (`age_group_id`) REFERENCES `age_groups` (`age_group_id`);

--
-- Các ràng buộc cho bảng `vaccine_distribution`
--
ALTER TABLE `vaccine_distribution`
  ADD CONSTRAINT `vaccine_distribution_ibfk_1` FOREIGN KEY (`inventory_id`) REFERENCES `vaccine_inventory` (`inventory_id`);

--
-- Các ràng buộc cho bảng `vaccine_inventory`
--
ALTER TABLE `vaccine_inventory`
  ADD CONSTRAINT `vaccine_inventory_ibfk_1` FOREIGN KEY (`vaccine_id`) REFERENCES `vaccine` (`id`),
  ADD CONSTRAINT `vaccine_inventory_ibfk_2` FOREIGN KEY (`center_id`) REFERENCES `centers` (`center_id`);

--
-- Các ràng buộc cho bảng `vaccine_schedule`
--
ALTER TABLE `vaccine_schedule`
  ADD CONSTRAINT `vaccine_schedule_ibfk_1` FOREIGN KEY (`vaccine_id`) REFERENCES `vaccine` (`id`),
  ADD CONSTRAINT `vaccine_schedule_ibfk_2` FOREIGN KEY (`center_id`) REFERENCES `centers` (`center_id`),
  ADD CONSTRAINT `vaccine_schedule_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `account` (`account_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
