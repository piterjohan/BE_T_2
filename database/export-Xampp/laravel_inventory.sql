-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 16, 2021 at 09:04 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_inventory`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `data_master_produk`
-- (See below for the actual view)
--
CREATE TABLE `data_master_produk` (
`id_produk` bigint(20) unsigned
,`nama_produk` varchar(100)
,`created_at` timestamp
,`updated_at` timestamp
);

-- --------------------------------------------------------

--
-- Table structure for table `error_log`
--

CREATE TABLE `error_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `error_sql` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `laporan_master_barang`
-- (See below for the actual view)
--
CREATE TABLE `laporan_master_barang` (
`id` bigint(20) unsigned
,`nama_barang` varchar(100)
,`id_produk` int(11)
,`total_barang` int(11)
,`harga_barang` int(11)
,`status_barang` enum('tersedia','habis')
,`created_at` timestamp
,`updated_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `laporan_trx_produk`
-- (See below for the actual view)
--
CREATE TABLE `laporan_trx_produk` (
`id_trx_produk` bigint(20) unsigned
,`id_barang` bigint(20)
,`barang_masuk` int(11)
,`barang_keluar` int(11)
,`id_user` int(11)
,`created_at` timestamp
,`updated_at` timestamp
);

-- --------------------------------------------------------

--
-- Table structure for table `master_barang`
--

CREATE TABLE `master_barang` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_barang` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_produk` int(11) NOT NULL,
  `total_barang` int(11) DEFAULT NULL,
  `harga_barang` int(11) DEFAULT NULL,
  `status_barang` enum('tersedia','habis') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `master_barang`
--

INSERT INTO `master_barang` (`id`, `nama_barang`, `id_produk`, `total_barang`, `harga_barang`, `status_barang`, `created_at`, `updated_at`) VALUES
(1, '4a8q7eeTA4', 2, 59, 1000, 'tersedia', '2020-10-21 17:00:00', '2021-02-16 01:02:26'),
(2, 'CFW4SDeyOW', 1, 0, 2000, 'habis', '2020-10-28 17:00:00', NULL),
(3, '0S1JbH5Zre', 2, 0, 3000, 'habis', '2020-11-04 17:00:00', NULL),
(4, 'nS0YabYHSr', 1, 0, 4000, 'habis', '2020-11-11 17:00:00', NULL),
(5, 'N0itcV5bhA', 2, 0, 5000, 'habis', '2020-11-18 17:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `master_produk`
--

CREATE TABLE `master_produk` (
  `id_produk` bigint(20) UNSIGNED NOT NULL,
  `nama_produk` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `master_produk`
--

INSERT INTO `master_produk` (`id_produk`, `nama_produk`, `created_at`, `updated_at`) VALUES
(1, 'Sabun', '2020-10-14 17:00:00', NULL),
(2, 'Kursi', '2020-10-14 17:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_02_16_041231_master_produk', 1),
(5, '2021_02_16_041324_users', 1),
(6, '2021_02_16_041347_master_barang', 1),
(7, '2021_02_16_041407_trx_produk', 1),
(8, '2021_02_16_043056_error_log', 1);

-- --------------------------------------------------------

--
-- Table structure for table `trx-produk`
--

CREATE TABLE `trx-produk` (
  `id_trx_produk` bigint(20) UNSIGNED NOT NULL,
  `id_barang` bigint(20) NOT NULL,
  `barang_masuk` int(11) DEFAULT NULL,
  `barang_keluar` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trx-produk`
--

INSERT INTO `trx-produk` (`id_trx_produk`, `id_barang`, `barang_masuk`, `barang_keluar`, `id_user`, `created_at`, `updated_at`) VALUES
(1, 1, 20, NULL, 1, '2021-02-16 01:01:08', NULL),
(2, 1, NULL, 1, 2, '2021-02-16 01:01:36', NULL),
(3, 1, NULL, 10, 2, '2021-02-16 01:02:13', NULL),
(4, 1, 50, NULL, 1, '2021-02-16 01:02:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_user` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_user` enum('supplier','distributor') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama_user`, `status_user`, `created_at`, `updated_at`) VALUES
(1, 'cMAFLF8jV9', 'supplier', '2021-02-16 01:00:47', NULL),
(2, 'jgEKpUCYdE', 'distributor', '2021-02-16 01:00:47', NULL);

-- --------------------------------------------------------

--
-- Structure for view `data_master_produk`
--
DROP TABLE IF EXISTS `data_master_produk`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `data_master_produk`  AS  select `master_produk`.`id_produk` AS `id_produk`,`master_produk`.`nama_produk` AS `nama_produk`,`master_produk`.`created_at` AS `created_at`,`master_produk`.`updated_at` AS `updated_at` from `master_produk` ;

-- --------------------------------------------------------

--
-- Structure for view `laporan_master_barang`
--
DROP TABLE IF EXISTS `laporan_master_barang`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `laporan_master_barang`  AS  select `master_barang`.`id` AS `id`,`master_barang`.`nama_barang` AS `nama_barang`,`master_barang`.`id_produk` AS `id_produk`,`master_barang`.`total_barang` AS `total_barang`,`master_barang`.`harga_barang` AS `harga_barang`,`master_barang`.`status_barang` AS `status_barang`,`master_barang`.`created_at` AS `created_at`,`master_barang`.`updated_at` AS `updated_at` from `master_barang` ;

-- --------------------------------------------------------

--
-- Structure for view `laporan_trx_produk`
--
DROP TABLE IF EXISTS `laporan_trx_produk`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `laporan_trx_produk`  AS  select `trx-produk`.`id_trx_produk` AS `id_trx_produk`,`trx-produk`.`id_barang` AS `id_barang`,`trx-produk`.`barang_masuk` AS `barang_masuk`,`trx-produk`.`barang_keluar` AS `barang_keluar`,`trx-produk`.`id_user` AS `id_user`,`trx-produk`.`created_at` AS `created_at`,`trx-produk`.`updated_at` AS `updated_at` from `trx-produk` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `error_log`
--
ALTER TABLE `error_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_barang`
--
ALTER TABLE `master_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_produk`
--
ALTER TABLE `master_produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trx-produk`
--
ALTER TABLE `trx-produk`
  ADD PRIMARY KEY (`id_trx_produk`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `error_log`
--
ALTER TABLE `error_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `master_barang`
--
ALTER TABLE `master_barang`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `master_produk`
--
ALTER TABLE `master_produk`
  MODIFY `id_produk` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `trx-produk`
--
ALTER TABLE `trx-produk`
  MODIFY `id_trx_produk` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
