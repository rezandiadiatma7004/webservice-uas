-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql313.infinityfree.com
-- Generation Time: Jan 05, 2026 at 01:29 AM
-- Server version: 11.4.9-MariaDB
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `if0_40291120_sipdash`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `action` varchar(80) NOT NULL,
  `entity_type` varchar(60) NOT NULL,
  `entity_id` bigint(20) UNSIGNED NOT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `user_id`, `action`, `entity_type`, `entity_id`, `metadata`, `created_at`) VALUES
(10, 4, 'REQUEST_SUBMIT', 'request', 10, '{\"priority\": \"high\"}', '2025-05-07 22:26:03'),
(11, 2, 'REQUEST_STATUS_CHANGE', 'request', 10, '{\"from\": \"SUBMITTED\", \"to\": \"PROCESSING\"}', '2025-05-12 22:26:03'),
(12, 2, 'DOC_UPLOAD', 'document', 11, '{\"file\": \"pdrb_kecamatan_2020_2024.csv\", \"size\": 360112}', '2025-05-12 22:26:03'),
(13, 4, 'REQUEST_SUBMIT', 'request', 11, '{\"priority\": \"normal\"}', '2025-09-04 22:26:03'),
(14, 5, 'APPROVAL_DECISION', 'approval', 10, '{\"decision\": \"approved\"}', '2025-09-05 22:26:03'),
(15, 3, 'DOC_UPLOAD', 'document', 10, '{\"file\": \"umkm_fashion_2025.xlsx\", \"published\": 1}', '2025-09-06 22:26:03'),
(16, 2, 'REQUEST_STATUS_CHANGE', 'request', 11, '{\"from\": \"PROCESSING\", \"to\": \"COMPLETED\"}', '2025-09-06 22:26:03'),
(17, 4, 'REQUEST_SUBMIT', 'request', 12, '{\"priority\": \"normal\"}', '2025-09-19 22:26:03'),
(18, 5, 'APPROVAL_DECISION', 'approval', 11, '{\"decision\": \"approved\"}', '2025-09-21 22:26:03'),
(19, 1, 'DOC_UPLOAD', 'document', 12, '{\"file\": \"kepwal_spbe_2022_2024.zip\", \"published\": 1}', '2025-09-24 22:26:03'),
(20, 4, 'REQUEST_SUBMIT', 'request', 13, '{\"priority\": \"urgent\"}', '2025-10-04 22:26:03'),
(21, 5, 'APPROVAL_DECISION', 'approval', 12, '{\"decision\": \"rejected\"}', '2025-10-06 22:26:03'),
(22, 4, 'REQUEST_SUBMIT', 'request', 14, '{\"priority\": \"normal\"}', '2025-10-14 22:26:03'),
(23, 2, 'DOC_UPLOAD', 'document', 13, '{\"file\": \"pdrb_adhk_triwulan_2021_2025.csv\", \"version\": \"1.1\"}', '2025-10-25 22:26:03'),
(24, 4, 'REQUEST_SUBMIT', 'request', 15, '{\"priority\": \"low\"}', '2025-10-24 22:26:03'),
(25, 4, 'REQUEST_SUBMIT', 'request', 16, '{\"priority\": \"high\"}', '2025-10-31 22:26:03'),
(26, 5, 'APPROVAL_DECISION', 'approval', 13, '{\"decision\": \"needs_revision\"}', '2025-11-01 22:26:03'),
(100, 4, 'REQUEST_SUBMIT', 'request', 100, '{\"priority\": \"high\"}', '2025-09-14 22:28:31'),
(101, 6, 'REQUEST_STATUS_CHANGE', 'request', 100, '{\"from\": \"SUBMITTED\", \"to\": \"VERIFIED\"}', '2025-09-16 22:28:31'),
(102, 6, 'DOC_UPLOAD', 'document', 100, '{\"file\": \"stunting_2024_kelurahan.xlsx\", \"published\": 0}', '2025-09-19 22:28:31'),
(103, 5, 'APPROVAL_DECISION', 'approval', 100, '{\"decision\": \"approved\"}', '2025-09-18 22:28:31'),
(104, 9, 'REQUEST_SUBMIT', 'request', 101, '{\"priority\": \"normal\"}', '2025-10-14 22:28:31'),
(105, 8, 'DOC_UPLOAD', 'document', 101, '{\"file\": \"timbulan_sampah_60hari.csv\", \"published\": 1}', '2025-10-22 22:28:31'),
(106, 5, 'APPROVAL_DECISION', 'approval', 101, '{\"decision\": \"approved\"}', '2025-10-21 22:28:31'),
(107, 4, 'REQUEST_SUBMIT', 'request', 102, '{\"priority\": \"urgent\"}', '2025-10-27 22:28:31'),
(108, 7, 'DOC_UPLOAD', 'document', 102, '{\"file\": \"traffic_count_sh_mingguan.csv\", \"published\": 0}', '2025-10-31 22:28:31'),
(109, 5, 'APPROVAL_DECISION', 'approval', 102, '{\"decision\": \"needs_revision\"}', '2025-11-01 22:28:31'),
(110, 9, 'REQUEST_SUBMIT', 'request', 103, '{\"priority\": \"normal\"}', '2025-10-26 22:28:31'),
(111, 8, 'DOC_UPLOAD', 'document', 103, '{\"file\": \"uptime_cctv_tps_error.csv\", \"published\": 1}', '2025-10-28 22:28:31'),
(112, 5, 'APPROVAL_DECISION', 'approval', 103, '{\"decision\": \"approved\"}', '2025-10-29 22:28:31'),
(113, 4, 'REQUEST_SUBMIT', 'request', 104, '{\"priority\": \"normal\"}', '2025-10-09 22:28:31'),
(114, 7, 'DOC_UPLOAD', 'document', 104, '{\"file\": \"rekap_laka_2023_2025.pdf\", \"published\": 0}', '2025-10-20 22:28:31'),
(115, 5, 'APPROVAL_DECISION', 'approval', 104, '{\"decision\": \"approved\"}', '2025-10-18 22:28:31'),
(116, 9, 'REQUEST_SUBMIT', 'request', 105, '{\"priority\": \"low\", \"wilayah\": \"Tembalang\"}', '2025-10-29 22:28:31'),
(117, 8, 'DOC_UPLOAD', 'document', 105, '{\"file\": \"timbulan_sampah_tembalang.csv\", \"published\": 1}', '2025-11-01 22:28:31'),
(118, 5, 'APPROVAL_DECISION', 'approval', 105, '{\"decision\": \"approved\"}', '2025-10-31 22:28:31');

-- --------------------------------------------------------

--
-- Table structure for table `api_tokens`
--

CREATE TABLE `api_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `token` char(64) NOT NULL,
  `name` varchar(80) NOT NULL,
  `scopes` varchar(255) NOT NULL,
  `revoked` tinyint(1) NOT NULL DEFAULT 0,
  `expires_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `api_tokens`
--

INSERT INTO `api_tokens` (`id`, `user_id`, `token`, `name`, `scopes`, `revoked`, `expires_at`, `created_at`) VALUES
(1, 2, '8f5a9f0b2b0c4c1b8e9d3a7e4f1a2b3c4d5e6f7a8b9c0d1e2f3a4b5c6d7e8f9', 'Integrasi Bappeda', 'read:catalog,read:request,write:document', 0, '2026-05-02 22:20:52', '2025-11-03 22:20:52'),
(10, 3, 'c0f1e2d3b4a5968778695a4b3c2d1e0ffedcba9876543210011223344556677a', 'Integrasi Diskop UMKM', 'read:catalog,read:request,write:document', 0, '2026-05-22 22:26:03', '2025-11-03 22:26:03'),
(100, 6, 'aa11bb22cc33dd44ee55ff66778899aabbccddeeff00112233445566778899aa', 'Integrasi Dinkes', 'read:catalog,read:request,write:document', 0, '2026-07-31 22:28:31', '2025-11-03 22:28:31'),
(101, 7, 'bb22cc33dd44ee55ff66778899aabbccddeeff00112233445566778899aabbcc', 'Integrasi Dishub', 'read:catalog,read:request,write:document', 0, '2026-08-30 22:28:31', '2025-11-03 22:28:31');

-- --------------------------------------------------------

--
-- Table structure for table `approvals`
--

CREATE TABLE `approvals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `request_id` bigint(20) UNSIGNED NOT NULL,
  `approver_user_id` bigint(20) UNSIGNED NOT NULL,
  `decision` enum('approved','rejected','needs_revision') NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `decided_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `approvals`
--

INSERT INTO `approvals` (`id`, `request_id`, `approver_user_id`, `decision`, `note`, `decided_at`, `created_at`, `updated_at`) VALUES
(1, 1, 5, 'approved', 'Silakan gunakan data publik sesuai pedoman sitasi.', '2025-11-03 22:20:52', '2025-11-04 06:20:52', '2025-11-04 06:20:52'),
(2, 2, 5, 'needs_revision', 'Mohon cantumkan rincian variabel yang dibutuhkan.', '2025-11-03 22:20:52', '2025-11-04 06:20:52', '2025-11-04 06:20:52'),
(3, 3, 5, 'approved', 'Arsip siap dibagikan.', '2025-11-03 22:20:52', '2025-11-04 06:20:52', '2025-11-04 06:20:52'),
(10, 11, 5, 'approved', 'Data UMKM fashion bersifat publik, silakan gunakan.', '2025-09-05 22:26:03', '2025-11-04 06:26:03', '2025-11-04 06:26:03'),
(11, 12, 5, 'approved', 'Arsip SPBE memenuhi kriteria keterbukaan dokumen.', '2025-09-21 22:26:03', '2025-11-04 06:26:03', '2025-11-04 06:26:03'),
(12, 13, 5, 'rejected', 'Permohonan memuat data rahasia omzet per entitas.', '2025-10-06 22:26:03', '2025-11-04 06:26:03', '2025-11-04 06:26:03'),
(13, 16, 5, 'needs_revision', 'Mohon cantumkan cakupan sektor yang diinginkan.', '2025-11-01 22:26:03', '2025-11-04 06:26:03', '2025-11-04 06:26:03'),
(100, 100, 5, 'approved', 'Data stunting diberikan agregat, tanpa identitas.', '2025-09-18 22:28:31', '2025-11-04 06:28:31', '2025-11-04 06:28:31'),
(101, 101, 5, 'approved', 'Data sampah TPS bersifat publik.', '2025-10-21 22:28:31', '2025-11-04 06:28:31', '2025-11-04 06:28:31'),
(102, 102, 5, 'needs_revision', 'Lengkapi periode dan titik pengamatan.', '2025-11-01 22:28:31', '2025-11-04 06:28:31', '2025-11-04 06:28:31'),
(103, 103, 5, 'approved', 'Daftar uptime CCTV dapat dibagikan.', '2025-10-29 22:28:31', '2025-11-04 06:28:31', '2025-11-04 06:28:31'),
(104, 104, 5, 'approved', 'Rekap laka dapat dibagikan dengan pembatasan lokasi sensitif.', '2025-10-18 22:28:31', '2025-11-04 06:28:31', '2025-11-04 06:28:31'),
(105, 105, 5, 'approved', 'Subset Tembalang dapat dipublikasikan.', '2025-10-31 22:28:31', '2025-11-04 06:28:31', '2025-11-04 06:28:31');

-- --------------------------------------------------------

--
-- Table structure for table `data_catalog`
--

CREATE TABLE `data_catalog` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `opd_id` bigint(20) UNSIGNED NOT NULL,
  `created_by_user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(180) NOT NULL,
  `description` text DEFAULT NULL,
  `category` varchar(80) NOT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `sensitivity_level` enum('public','restricted','confidential') NOT NULL DEFAULT 'public',
  `file_format` varchar(40) NOT NULL,
  `update_frequency` varchar(40) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `data_catalog`
--

INSERT INTO `data_catalog` (`id`, `opd_id`, `created_by_user_id`, `title`, `description`, `category`, `tags`, `sensitivity_level`, `file_format`, `update_frequency`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 'Data PDRB Kota Semarang per Sektor', 'Seri PDRB ADHK dan ADHB per sektor ekonomi', 'ekonomi', 'pdrb,ekonomi,semarang', 'public', 'CSV', 'annual', 1, '2025-11-04 06:20:52', '2025-11-04 06:20:52'),
(2, 3, 3, 'Daftar UMKM Aktif per Kelurahan', 'Daftar UMKM aktif termasuk NIB & kategori usaha', 'umkm', 'umkm,kelurahan,nib', 'restricted', 'XLSX', 'quarterly', 1, '2025-11-04 06:20:52', '2025-11-04 06:20:52'),
(3, 1, 1, 'Arsip Keputusan Walikota Terkait SPBE', 'Kumpulan keputusan terkait implementasi SPBE', 'regulasi', 'spbe,keputusan,regulasi', 'public', 'PDF', 'ad-hoc', 1, '2025-11-04 06:20:52', '2025-11-04 06:20:52'),
(4, 4, 6, 'Data Stunting per Kelurahan', 'Prevalensi stunting anak balita per kelurahan', 'kesehatan', 'stunting,balita,kelurahan', 'restricted', 'XLSX', 'quarterly', 1, '2025-11-04 06:28:31', '2025-11-04 06:28:31'),
(5, 5, 7, 'Volume Lalu Lintas Harian (Traffic Count)', 'Traffic count titik strategis Kota Semarang', 'transportasi', 'lalin,traffic,count', 'public', 'CSV', 'monthly', 1, '2025-11-04 06:28:31', '2025-11-04 06:28:31'),
(6, 6, 8, 'Data Timbulan Sampah per TPS', 'Volume sampah harian per TPS dan status TPS', 'lingkungan', 'sampah,tps,volume', 'public', 'CSV', 'daily', 1, '2025-11-04 06:28:31', '2025-11-04 06:28:31'),
(7, 6, 8, 'Status Operasional CCTV TPS', 'Uptime dan error log CCTV di TPS', 'lingkungan', 'cctv,tps,uptime', 'restricted', 'CSV', 'hourly', 1, '2025-11-04 06:28:31', '2025-11-04 06:28:31'),
(8, 5, 7, 'Data Kecelakaan Lalu Lintas', 'Rekap kejadian laka lantas per bulan', 'transportasi', 'kecelakaan,polantas,laka', 'restricted', 'PDF', 'monthly', 1, '2025-11-04 06:28:31', '2025-11-04 06:28:31');

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `request_id` bigint(20) UNSIGNED DEFAULT NULL,
  `data_catalog_id` bigint(20) UNSIGNED DEFAULT NULL,
  `uploader_user_id` bigint(20) UNSIGNED NOT NULL,
  `opd_id` bigint(20) UNSIGNED NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `file_type` varchar(50) NOT NULL,
  `file_size_bytes` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `storage_url` varchar(255) NOT NULL,
  `checksum` char(64) DEFAULT NULL,
  `version` varchar(20) NOT NULL DEFAULT '1.0',
  `is_published` tinyint(1) NOT NULL DEFAULT 0,
  `uploaded_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `request_id`, `data_catalog_id`, `uploader_user_id`, `opd_id`, `file_name`, `file_type`, `file_size_bytes`, `storage_url`, `checksum`, `version`, `is_published`, `uploaded_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, 2, 'pdrb_2019_2024.csv', 'text/csv', 245678, 's3://sipdash/bappeda/pdrb_2019_2024.csv', NULL, '1.0', 1, '2025-11-03 22:20:52', '2025-11-04 06:20:52', '2025-11-04 06:20:52'),
(2, 2, 2, 3, 3, 'umkm_q2_2025.xlsx', 'application/vnd.openxmlformats-officedocument.spre', 512000, 's3://sipdash/diskop/umkm_q2_2025.xlsx', NULL, '1.1', 0, '2025-11-03 22:20:52', '2025-11-04 06:20:52', '2025-11-04 06:28:56'),
(3, 3, 3, 1, 1, 'kepwal_spbe_2023.pdf', 'application/pdf', 180234, 's3://sipdash/diskominfo/kepwal_spbe_2023.pdf', NULL, '1.0', 1, '2025-11-03 22:20:52', '2025-11-04 06:20:52', '2025-11-04 06:20:52'),
(10, 11, 2, 3, 3, 'umkm_fashion_2025.xlsx', 'application/vnd.openxmlformats-officedocument.spre', 734003, 's3://sipdash/diskop/umkm_fashion_2025.xlsx', NULL, '1.0', 1, '2025-09-06 22:26:03', '2025-11-04 06:26:03', '2025-11-04 06:26:03'),
(11, 10, 1, 2, 2, 'pdrb_kecamatan_2020_2024.csv', 'text/csv', 360112, 's3://sipdash/bappeda/pdrb_kecamatan_2020_2024.csv', NULL, '1.0', 0, '2025-05-12 22:26:03', '2025-11-04 06:26:03', '2025-11-04 06:26:03'),
(12, 12, 3, 1, 1, 'kepwal_spbe_2022_2024.zip', 'application/zip', 990112, 's3://sipdash/diskominfo/kepwal_spbe_2022_2024.zip', NULL, '1.0', 1, '2025-09-24 22:26:03', '2025-11-04 06:26:03', '2025-11-04 06:26:03'),
(13, 14, 1, 2, 2, 'pdrb_adhk_triwulan_2021_2025.csv', 'text/csv', 540224, 's3://sipdash/bappeda/pdrb_adhk_triwulan_2021_2025.csv', NULL, '1.1', 0, '2025-10-25 22:26:03', '2025-11-04 06:26:03', '2025-11-04 06:26:03'),
(100, 100, 4, 6, 4, 'stunting_2024_kelurahan.xlsx', 'application/vnd.openxmlformats-officedocument.spre', 420112, 's3://sipdash/dinkes/stunting_2024_kelurahan.xlsx', NULL, '1.0', 0, '2025-09-19 22:28:31', '2025-11-04 06:28:31', '2025-11-04 06:28:31'),
(101, 101, 6, 8, 6, 'timbulan_sampah_60hari.csv', 'text/csv', 280334, 's3://sipdash/dlh/timbulan_sampah_60hari.csv', NULL, '1.0', 1, '2025-10-22 22:28:31', '2025-11-04 06:28:31', '2025-11-04 06:28:31'),
(102, 102, 5, 7, 5, 'traffic_count_sh_mingguan.csv', 'text/csv', 330221, 's3://sipdash/dishub/traffic_count_sh_mingguan.csv', NULL, '1.0', 0, '2025-10-31 22:28:31', '2025-11-04 06:28:31', '2025-11-04 06:28:31'),
(103, 103, 7, 8, 6, 'uptime_cctv_tps_error.csv', 'text/csv', 120876, 's3://sipdash/dlh/uptime_cctv_tps_error.csv', NULL, '1.0', 1, '2025-10-28 22:28:31', '2025-11-04 06:28:31', '2025-11-04 06:28:31'),
(104, 104, 8, 7, 5, 'rekap_laka_2023_2025.pdf', 'application/pdf', 803112, 's3://sipdash/dishub/rekap_laka_2023_2025.pdf', NULL, '1.0', 0, '2025-10-20 22:28:31', '2025-11-04 06:28:31', '2025-11-04 06:28:31'),
(105, 105, 6, 8, 6, 'timbulan_sampah_tembalang.csv', 'text/csv', 190554, 's3://sipdash/dlh/timbulan_sampah_tembalang.csv', NULL, '1.0', 1, '2025-11-01 22:28:31', '2025-11-04 06:28:31', '2025-11-04 06:28:31');

-- --------------------------------------------------------

--
-- Table structure for table `feedbacks`
--

CREATE TABLE `feedbacks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `request_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `rating` tinyint(3) UNSIGNED NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedbacks`
--

INSERT INTO `feedbacks` (`id`, `request_id`, `user_id`, `rating`, `comment`, `created_at`) VALUES
(1, 3, 4, 5, 'Pelayanan cepat dan jelas. Terima kasih.', '2025-11-03 22:20:52'),
(10, 11, 4, 4, 'Data cukup lengkap, terima kasih.', '2025-09-07 22:26:03'),
(11, 12, 4, 5, 'Arsip rapi dan mudah diakses.', '2025-09-25 22:26:03'),
(100, 101, 9, 5, 'Sangat membantu untuk kampanye kebersihan.', '2025-10-24 22:28:31'),
(101, 103, 9, 4, 'Laporan uptime jelas, mudah dipahami.', '2025-10-30 22:28:31');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(50) NOT NULL,
  `title` varchar(160) NOT NULL,
  `message` varchar(255) NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `type`, `title`, `message`, `is_read`, `created_at`) VALUES
(1, 4, 'request_status', 'Status permintaan #1 diperbarui', 'Permintaan Anda telah diverifikasi.', 0, '2025-11-03 22:20:52'),
(2, 4, 'approval', 'Permintaan #2 butuh revisi', 'Silakan lengkapi rincian variabel.', 0, '2025-11-03 22:20:52'),
(3, 2, 'document', 'Dokumen baru diunggah', 'File umkm_q2_2025.xlsx berhasil diunggah.', 1, '2025-11-03 22:20:52'),
(10, 4, 'request_status', 'Permintaan #11 selesai', 'Permintaan UMKM sektor fashion telah selesai.', 1, '2025-09-06 22:26:03'),
(11, 4, 'approval', 'Permintaan #12 disetujui', 'Arsip SPBE disetujui untuk dibagikan.', 1, '2025-09-21 22:26:03'),
(12, 4, 'approval', 'Permintaan #13 ditolak', 'Alasan: memuat data rahasia omzet.', 0, '2025-10-06 22:26:03'),
(13, 4, 'request_status', 'Permintaan #14 diproses', 'Tim Bappeda sedang memproses data PDRB ADHK.', 0, '2025-10-25 22:26:03'),
(14, 2, 'document', 'Dokumen baru diunggah', 'pdrb_adhk_triwulan_2021_2025.csv diunggah (versi 1.1).', 0, '2025-10-25 22:26:03'),
(100, 4, 'approval', 'Permintaan #100 disetujui', 'Data stunting agregat siap diambil.', 1, '2025-09-18 22:28:31'),
(101, 9, 'document', 'Dokumen baru tersedia', 'timbulan_sampah_60hari.csv telah dipublikasikan.', 0, '2025-10-22 22:28:31'),
(102, 4, 'approval', 'Permintaan #102 butuh revisi', 'Lengkapi periode & titik pengamatan.', 0, '2025-11-01 22:28:31'),
(103, 9, 'request_status', 'Permintaan #103 diverifikasi', 'Tim DLH memproses daftar uptime CCTV.', 0, '2025-10-28 22:28:31'),
(104, 4, 'document', 'Rekap laka tersedia', 'rekap_laka_2023_2025.pdf telah diunggah (belum publish).', 0, '2025-10-20 22:28:31'),
(105, 9, 'document', 'Data Tembalang dipublikasikan', 'timbulan_sampah_tembalang.csv tersedia untuk diunduh.', 1, '2025-11-01 22:28:31');

-- --------------------------------------------------------

--
-- Table structure for table `opd`
--

CREATE TABLE `opd` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `short_name` varchar(50) NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `opd`
--

INSERT INTO `opd` (`id`, `name`, `short_name`, `email`, `phone`, `address`, `created_at`, `updated_at`) VALUES
(1, 'Dinas Komunikasi, Informatika, Statistik dan Persandian Kota Semarang', 'Diskominfo', 'diskominfo@semarangkota.go.id', '024-3513366', 'Jl. Pemuda No. 148, Semarang', '2025-11-04 06:20:52', '2025-11-04 06:20:52'),
(2, 'Badan Perencanaan Pembangunan Daerah Kota Semarang', 'Bappeda', 'bappeda@semarangkota.go.id', '024-3567890', 'Jl. Imam Bonjol No. 1, Semarang', '2025-11-04 06:20:52', '2025-11-04 06:20:52'),
(3, 'Dinas Koperasi dan UMKM Kota Semarang', 'DiskopUMKM', 'diskopumkm@semarangkota.go.id', '024-334455', 'Jl. dr. Cipto No. 2, Semarang', '2025-11-04 06:20:52', '2025-11-04 06:20:52'),
(4, 'Dinas Kesehatan Kota Semarang', 'Dinkes', 'dinkes@semarangkota.go.id', '024-335577', 'Jl. Pandanaran No. 50, Semarang', '2025-11-04 06:28:31', '2025-11-04 06:28:31'),
(5, 'Dinas Perhubungan Kota Semarang', 'Dishub', 'dishub@semarangkota.go.id', '024-443322', 'Jl. Menteri Supeno No. 1, Semarang', '2025-11-04 06:28:31', '2025-11-04 06:28:31'),
(6, 'Dinas Lingkungan Hidup Kota Semarang', 'DLH', 'dlh@semarangkota.go.id', '024-778899', 'Jl. Dr. Wahidin No. 9, Semarang', '2025-11-04 06:28:31', '2025-11-04 06:28:31');

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `requester_user_id` bigint(20) UNSIGNED NOT NULL,
  `opd_id_owner` bigint(20) UNSIGNED NOT NULL,
  `data_catalog_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subject` varchar(200) NOT NULL,
  `description` text DEFAULT NULL,
  `purpose` varchar(255) DEFAULT NULL,
  `status_id` smallint(5) UNSIGNED NOT NULL,
  `priority` enum('low','normal','high','urgent') NOT NULL DEFAULT 'normal',
  `requested_at` datetime NOT NULL DEFAULT current_timestamp(),
  `due_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `requests`
--

INSERT INTO `requests` (`id`, `requester_user_id`, `opd_id_owner`, `data_catalog_id`, `subject`, `description`, `purpose`, `status_id`, `priority`, `requested_at`, `due_at`, `created_at`, `updated_at`) VALUES
(1, 4, 2, 1, 'Permintaan Data PDRB 2019-2024', 'Butuh seri PDRB untuk riset ekonomi daerah', 'Penelitian akademik', 2, 'normal', '2025-11-03 22:20:52', '2025-11-10 22:20:52', '2025-11-04 06:20:52', '2025-11-04 06:20:52'),
(2, 4, 3, 2, 'Daftar UMKM sektor kuliner', 'Filtering UMKM kuliner untuk program pendampingan', 'Analisis kebijakan', 1, 'high', '2025-11-03 22:20:52', '2025-11-13 22:20:52', '2025-11-04 06:20:52', '2025-11-04 06:20:52'),
(3, 4, 1, 3, 'Salinan arsip Keputusan Walikota SPBE', 'Butuh PDF arsip SPBE tahun 2023', 'Studi literatur', 4, 'low', '2025-11-03 22:20:52', '2025-11-06 22:20:52', '2025-11-04 06:20:52', '2025-11-04 06:20:52'),
(10, 4, 2, 1, 'PDRB per kecamatan 2020–2024', 'Butuh breakdown PDRB per kecamatan', 'Penelitian akademik', 3, 'high', '2025-05-07 22:26:03', '2025-05-17 22:26:03', '2025-11-04 06:26:03', '2025-11-04 06:26:03'),
(11, 4, 3, 2, 'UMKM sektor fashion', 'Daftar UMKM fashion untuk pemetaan program', 'Analisis kebijakan', 4, 'normal', '2025-09-04 22:26:03', '2025-09-14 22:26:03', '2025-11-04 06:26:03', '2025-11-04 06:26:03'),
(12, 4, 1, 3, 'Arsip Kepwal SPBE 2022–2024', 'Kompilasi PDF Kepwal terkait SPBE', 'Studi literatur', 2, 'normal', '2025-09-19 22:26:03', '2025-09-29 22:26:03', '2025-11-04 06:26:03', '2025-11-04 06:26:03'),
(13, 4, 3, 2, 'UMKM dengan omzet > 500jt', 'Butuh data sensitif omzet per entitas', 'Riset internal', 5, 'urgent', '2025-10-04 22:26:03', '2025-10-14 22:26:03', '2025-11-04 06:26:03', '2025-11-04 06:26:03'),
(14, 4, 2, 1, 'Series PDRB ADHK triwulanan', 'Time series triwulanan 2021–2025', 'Policy brief', 3, 'normal', '2025-10-14 22:26:03', '2025-10-24 22:26:03', '2025-11-04 06:26:03', '2025-11-04 06:26:03'),
(15, 4, 1, 3, 'Dokumen Roadmap SPBE 2025', 'Salinan peraturan & lampiran roadmap', 'Kajian strategi', 1, 'low', '2025-10-24 22:26:03', '2025-11-01 22:26:03', '2025-11-04 06:26:03', '2025-11-04 06:26:03'),
(16, 4, 2, 1, 'Update PDRB 2025Q2', 'Pembaharuan data triwulan terbaru', 'Publikasi ilmiah', 2, 'high', '2025-10-31 22:26:03', '2025-11-10 22:26:03', '2025-11-04 06:26:03', '2025-11-04 06:26:03'),
(100, 4, 4, 4, 'Prevalensi stunting 2024 per kelurahan', 'Butuh data per kelurahan untuk 2024', 'Policy brief gizi', 2, 'high', '2025-09-14 22:28:31', '2025-09-24 22:28:31', '2025-11-04 06:28:31', '2025-11-04 06:28:31'),
(101, 9, 6, 6, 'Timbulan sampah dua bulan terakhir', 'Perbandingan volume sampah TPS', 'Kampanye lingkungan', 3, 'normal', '2025-10-14 22:28:31', '2025-10-24 22:28:31', '2025-11-04 06:28:31', '2025-11-04 06:28:31'),
(102, 4, 5, 5, 'Traffic count arteri Soekarno-Hatta', 'Dataset traffic count titik SH', 'Kajian manajemen lalu lintas', 1, 'urgent', '2025-10-27 22:28:31', '2025-11-06 22:28:31', '2025-11-04 06:28:31', '2025-11-04 06:28:31'),
(103, 9, 6, 7, 'Uptime CCTV TPS bermasalah', 'Minta daftar CCTV TPS yang error > 24 jam', 'Pelaporan warga', 2, 'normal', '2025-10-26 22:28:31', '2025-11-08 22:28:31', '2025-11-04 06:28:31', '2025-11-04 06:28:31'),
(104, 4, 5, 8, 'Rekap laka lantas 2023–2025', 'Perlu ringkasan perbulan & lokasi', 'Riset akademik', 3, 'normal', '2025-10-09 22:28:31', '2025-10-19 22:28:31', '2025-11-04 06:28:31', '2025-11-04 06:28:31'),
(105, 9, 6, 6, 'Sampah per TPS wilayah Tembalang', 'Sub-set data untuk kecamatan Tembalang', 'Komunitas bank sampah', 1, 'low', '2025-10-29 22:28:31', '2025-11-09 22:28:31', '2025-11-04 06:28:31', '2025-11-04 06:28:31');

-- --------------------------------------------------------

--
-- Table structure for table `request_status`
--

CREATE TABLE `request_status` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `code` varchar(40) NOT NULL,
  `label` varchar(80) NOT NULL,
  `sort_order` smallint(5) UNSIGNED NOT NULL,
  `is_terminal` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `request_status`
--

INSERT INTO `request_status` (`id`, `code`, `label`, `sort_order`, `is_terminal`) VALUES
(1, 'SUBMITTED', 'Diajukan', 1, 0),
(2, 'VERIFIED', 'Diverifikasi', 2, 0),
(3, 'PROCESSING', 'Diproses', 3, 0),
(4, 'COMPLETED', 'Selesai', 4, 1),
(5, 'REJECTED', 'Ditolak', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin Diskominfo', '2025-11-04 06:20:52', '2025-11-04 06:20:52'),
(2, 'opd_officer', 'Petugas OPD pengelola data', '2025-11-04 06:20:52', '2025-11-04 06:20:52'),
(3, 'public_user', 'Pengguna umum/peneliti', '2025-11-04 06:20:52', '2025-11-04 06:20:52'),
(4, 'approver', 'Pejabat yang menyetujui/menolak', '2025-11-04 06:20:52', '2025-11-04 06:20:52');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `opd_id` bigint(20) UNSIGNED DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `email` varchar(160) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `opd_id`, `role_id`, `name`, `email`, `password_hash`, `phone`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Admin Diskominfo', 'admin@semarangkota.go.id', '$2y$10$abcdefghijklmnopqrstuv1234567890abcdefghiJK', '0812-0000-0001', 1, '2025-11-04 06:20:52', '2025-11-04 06:20:52'),
(2, 2, 2, 'Petugas Bappeda', 'petugas.bappeda@semarangkota.go.id', '$2y$10$abcdefghijklmnopqrstuv1234567890abcdefghiJK', '0812-0000-0002', 1, '2025-11-04 06:20:52', '2025-11-04 06:20:52'),
(3, 3, 2, 'Petugas Diskop UMKM', 'petugas.umkm@semarangkota.go.id', '$2y$10$abcdefghijklmnopqrstuv1234567890abcdefghiJK', '0812-0000-0003', 1, '2025-11-04 06:20:52', '2025-11-04 06:20:52'),
(4, NULL, 3, 'Peneliti UNDIP', 'peneliti@undip.ac.id', '$2y$10$abcdefghijklmnopqrstuv1234567890abcdefghiJK', '0812-0000-0004', 1, '2025-11-04 06:20:52', '2025-11-04 06:20:52'),
(5, 1, 4, 'Kepala Diskominfo', 'kadis@semarangkota.go.id', '$2y$10$abcdefghijklmnopqrstuv1234567890abcdefghiJK', '0812-0000-0005', 1, '2025-11-04 06:20:52', '2025-11-04 06:20:52'),
(6, 4, 2, 'Petugas Dinkes', 'petugas.dinkes@semarangkota.go.id', '$2y$10$abcdefghijklmnopqrstuv1234567890abcdefghiJK', '0812-0000-0006', 1, '2025-11-04 06:28:31', '2025-11-04 06:28:31'),
(7, 5, 2, 'Petugas Dishub', 'petugas.dishub@semarangkota.go.id', '$2y$10$abcdefghijklmnopqrstuv1234567890abcdefghiJK', '0812-0000-0007', 1, '2025-11-04 06:28:31', '2025-11-04 06:28:31'),
(8, 6, 2, 'Petugas DLH', 'petugas.dlh@semarangkota.go.id', '$2y$10$abcdefghijklmnopqrstuv1234567890abcdefghiJK', '0812-0000-0008', 1, '2025-11-04 06:28:31', '2025-11-04 06:28:31'),
(9, NULL, 3, 'Warga Semarang', 'warga@contoh.id', '$2y$10$abcdefghijklmnopqrstuv1234567890abcdefghiJK', '0812-0000-0009', 1, '2025-11-04 06:28:31', '2025-11-04 06:28:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `api_tokens`
--
ALTER TABLE `api_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `idx_tokens_user` (`user_id`,`revoked`);

--
-- Indexes for table `approvals`
--
ALTER TABLE `approvals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_approvals_request` (`request_id`),
  ADD KEY `idx_approvals_approver` (`approver_user_id`);

--
-- Indexes for table `data_catalog`
--
ALTER TABLE `data_catalog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_catalog_opd` (`opd_id`),
  ADD KEY `idx_catalog_creator` (`created_by_user_id`);
ALTER TABLE `data_catalog` ADD FULLTEXT KEY `ft_catalog_title_desc` (`title`,`description`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_docs_request` (`request_id`),
  ADD KEY `idx_docs_catalog` (`data_catalog_id`),
  ADD KEY `idx_docs_uploader` (`uploader_user_id`),
  ADD KEY `idx_docs_opd` (`opd_id`);

--
-- Indexes for table `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_feedback_request_user` (`request_id`,`user_id`),
  ADD KEY `idx_feedback_user` (`user_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_notifications_user` (`user_id`,`is_read`);

--
-- Indexes for table `opd`
--
ALTER TABLE `opd`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_opd_short_name` (`short_name`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_requests_status` (`status_id`),
  ADD KEY `idx_requests_owner` (`opd_id_owner`),
  ADD KEY `idx_requests_requester` (`requester_user_id`),
  ADD KEY `idx_requests_catalog` (`data_catalog_id`);

--
-- Indexes for table `request_status`
--
ALTER TABLE `request_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_users_email` (`email`),
  ADD KEY `idx_users_opd` (`opd_id`),
  ADD KEY `idx_users_role` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `api_tokens`
--
ALTER TABLE `api_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200;

--
-- AUTO_INCREMENT for table `approvals`
--
ALTER TABLE `approvals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200;

--
-- AUTO_INCREMENT for table `data_catalog`
--
ALTER TABLE `data_catalog`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200;

--
-- AUTO_INCREMENT for table `feedbacks`
--
ALTER TABLE `feedbacks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200;

--
-- AUTO_INCREMENT for table `opd`
--
ALTER TABLE `opd`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200;

--
-- AUTO_INCREMENT for table `request_status`
--
ALTER TABLE `request_status`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `api_tokens`
--
ALTER TABLE `api_tokens`
  ADD CONSTRAINT `fk_tokens_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `approvals`
--
ALTER TABLE `approvals`
  ADD CONSTRAINT `fk_approvals_approver` FOREIGN KEY (`approver_user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_approvals_request` FOREIGN KEY (`request_id`) REFERENCES `requests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `data_catalog`
--
ALTER TABLE `data_catalog`
  ADD CONSTRAINT `fk_catalog_creator` FOREIGN KEY (`created_by_user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_catalog_opd` FOREIGN KEY (`opd_id`) REFERENCES `opd` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `fk_docs_catalog` FOREIGN KEY (`data_catalog_id`) REFERENCES `data_catalog` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_docs_opd` FOREIGN KEY (`opd_id`) REFERENCES `opd` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_docs_request` FOREIGN KEY (`request_id`) REFERENCES `requests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_docs_uploader` FOREIGN KEY (`uploader_user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD CONSTRAINT `fk_feedback_request` FOREIGN KEY (`request_id`) REFERENCES `requests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_feedback_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `fk_notifications_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `requests`
--
ALTER TABLE `requests`
  ADD CONSTRAINT `fk_requests_catalog` FOREIGN KEY (`data_catalog_id`) REFERENCES `data_catalog` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_requests_owner_opd` FOREIGN KEY (`opd_id_owner`) REFERENCES `opd` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_requests_requester` FOREIGN KEY (`requester_user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_requests_status` FOREIGN KEY (`status_id`) REFERENCES `request_status` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_opd` FOREIGN KEY (`opd_id`) REFERENCES `opd` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_users_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
